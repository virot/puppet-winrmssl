# Modified by John Puskar
# See diffs at https://github.com/jpuskar/puppet-winrmSSL

Puppet::Type.newtype(:winrmssl) do
  @doc = 'Update winrm settings.'
  ensurable

  newparam(:issuer, namevar: true) do
    desc 'Subject name of the CA that winrm will trust for its HTTPS endpoint.'
  end

  newproperty(:disable_http) do
    desc 'If set to true then the HTTP winrm listener will be disabled.'
    newvalues(:true, :false)
    defaultto :true
  end

  newproperty(:port) do
    desc 'Port to use for the winrm listener.'
    defaultto '5986'
  end

  newproperty(:auth_basic) do
    desc 'If set to true then the winrm Basic authentication mode is enabled.'
    newvalues(:true, :false)
    defaultto :true
  end

  newproperty(:auth_credssp) do
    desc 'If set to true then the winrm CredSSP authentication mode is enabled.'
    newvalues(:true, :false)
    defaultto :false
  end

  newproperty(:auth_kerberos) do
    desc 'If set to true then the winrm Kerberos authentication mode is enabled.'
    newvalues(:true, :false)
    defaultto :true
  end

  newproperty(:auth_negotiate) do
    desc 'If set to true then the winrm Negotiate authentication mode is enabled.'
    newvalues(:true, :false)
    defaultto :true
  end

  newproperty(:maxconcurrentoperationsperuser) do
    desc 'Sets the amount of operations a single user can do at the same time.'
    defaultto '1500'
  end

  newproperty(:maxshellsperuser) do
    desc 'Sets the maximum number of shells a single user can have open.'
    validate do |value|
      unless (1..2_147_483_647).cover?(value)
        raise ArgumentError, '%s is not a valid value for max shells per user.' % value
      end
    end
    defaultto '30'
  end

  newproperty(:maxmemorypershellmb) do
    defaultto '1024'
  end

  newproperty(:maxtimeoutms) do
    defaultto '60000'
  end

  newproperty(:certificatethumbprint) do
    defaultto ''
  end
end
