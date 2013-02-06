Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2t93-0008Bk-6K
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:45:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2013 16:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,610,1355126400"; d="scan'208";a="283297732"
Received: from unknown (HELO envy.home) ([10.255.12.177])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 16:29:57 -0800
Message-ID: <5111A405.2020308@linux.intel.com>
Date: Tue, 05 Feb 2013 16:29:57 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<9e352d99316c5f8130db240d670c604b48b261ac.1360104547.git.dvhart@linux.intel.com>
	<CAP9ODKqt0ZwcyOzCZYVqPt_tuSqk-=PJAX22sP2V2=P-0a94Uw@mail.gmail.com>
In-Reply-To: <CAP9ODKqt0ZwcyOzCZYVqPt_tuSqk-=PJAX22sP2V2=P-0a94Uw@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] meta-yocto: Document new oe-git-proxy in site.conf.sample
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 00:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 04:24 PM, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> The new oe-git-proxy.sh should address all git proxying needs. Document
>> its usage in meta-yocto/conf/site.conf.sample and remove references to
>> the old mechanisms.
>>
>> V2: Separate out the meta-yocto changes from the oe-core changes
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>>  meta-yocto/conf/site.conf.sample |   35 +++++++++--------------------------
>>  1 files changed, 9 insertions(+), 26 deletions(-)
>>
>> diff --git a/meta-yocto/conf/site.conf.sample b/meta-yocto/conf/site.conf.sample
>> index 68d1da9..2834702 100644
>> --- a/meta-yocto/conf/site.conf.sample
>> +++ b/meta-yocto/conf/site.conf.sample
>> @@ -16,32 +16,15 @@ SCONF_VERSION = "1"
>>  #http-proxy-port = 81
>>  #
>>
>> -# Uncomment to cause git to use the proxy host specificed
>> -# although this only works for http
>> -#GIT_PROXY_HOST = "proxy.example.com"
>> -#GIT_PROXY_PORT = "81"
>> -#export GIT_PROXY_COMMAND = "${COREBASE}/scripts/oe-git-proxy-command"
>> -
>> -# Set to yes to have a gitconfig generated for handling proxies; you
>> -# might not want this if you have all that set in your global git
>> -# configuration. If you don't enable it, the rest of the entries
>> -# (_PROXY_IGNORE, etc) don't really work that well
>> -#GIT_CORE_CONFIG = "Yes"
>> -
>> -# Space separate list of hosts to ignore for GIT proxy
>> -#GIT_PROXY_IGNORE = "host.server.com another.server.com"
>> -
>> -# If SOCKS is available run the following command to comple a simple transport
>> -# gcc scripts/oe-git-proxy-socks.c -o oe-git-proxy-socks
>> -# and then share that binary somewhere in PATH, then use the following settings
>> -#GIT_PROXY_HOST = "proxy.example.com"
>> -#GIT_PROXY_PORT = "81"
>> -
>> -# GIT_PROXY_COMMAND is used by git to override all proxy settings from
>> -# configuration files, so we prefix OE_ to avoid breaking havoc on the
>> -# generated (or local) gitconfig's.
>> -#OE_GIT_PROXY_COMMAND = "${COREBASE}/scripts/oe-git-proxy-socks-command"
>> -
>> +# To use git with a proxy, you must use an external git proxy command, such as
>> +# the one provided by scripts/oe-git-proxy.sh. To use this script, copy it to
>> +# your PATH and uncomment the following:
>> +#GIT_PROXY_COMMAND="oe-git-proxy.sh"
> 
> .sh

Fixed

> A similar change ought to be done for oe-core .sample, no?

I didn't see any git proxy documentation there and no conf.sample files
in oe-core at all. Perhaps someone would like to add a site.conf.sample
for oe-core?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


