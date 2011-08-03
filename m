Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QofLc-0003sF-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:35:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2011 10:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,311,1309762800"; d="scan'208";a="35443586"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2011 10:30:49 -0700
Message-ID: <4E3985C8.9070000@linux.intel.com>
Date: Wed, 03 Aug 2011 10:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
	<37BC502A-3FEA-4059-85FB-F6A3F401C3F9@kernel.crashing.org>
In-Reply-To: <37BC502A-3FEA-4059-85FB-F6A3F401C3F9@kernel.crashing.org>
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add	SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2011 17:35:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 10:00 AM, Kumar Gala wrote:
>
> On Jul 28, 2011, at 8:10 AM, Kumar Gala wrote:
>
>> If a SOCKS5 gateway is needed for a proxy access like git it might also
>> require authentication to the proxy via a password and username.  Adding
>> SOCKS5_USER&  SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
>> of the authentication request to occur when something like a git fetch
>> is going through the proxy.
>>
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>> * Fixes issue with a git fetch request failing to get pass a firewall
>>
>> scripts/oe-buildenv-internal |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>> index c13fc40..b223292 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -55,4 +55,4 @@ unset BITBAKEDIR
>> export BUILDDIR
>> export PATH
>>
>> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
>> +export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
>> --
>> 1.7.3.4
>
> Ping on this patch
>
Kumar,

I think you were asked to modify this patch so that the additinal 
SOCKS5_* do not get into sstate, Paul Eggleton provided the 
BB_HASHSPACE_WHITELIST info.

Please update this patch

Thanks
	Sau!

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


