Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRTuC-0007iB-Qa
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 22:19:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Oct 2012 13:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,650,1344236400"; d="scan'208";a="209360306"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by azsmga001.ch.intel.com with ESMTP; 25 Oct 2012 13:06:22 -0700
Message-ID: <50899BBE.4030307@linux.intel.com>
Date: Thu, 25 Oct 2012 13:06:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1350957811.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1350957811.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@WINDRIVER.COM, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: modify BB_HASHBASE_WHITELIST and BB_HASHCONFIG_WHITELIST
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
X-List-Received-Date: Thu, 25 Oct 2012 20:19:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 12:52 AM, Robert Yang wrote:
> Test Info:
>
> $ bitbake core-image-minimal core-image-sato meta-toolchain
> meta-toolchain-sdk adt-installer meta-ide-support
>
> Questions:
> What's the rule about whether a variable should be in
> BB_HASHBASE_WHITELIST or BB_HASHCONFIG_WHITELIST, please ?
>
> // Robert
>
> The following changes since commit 60a26d24964832ce390b4c1f0d134b744dc9201b:
>
>    documentation: yocto-project-qs - Final changes before the 1.3 lockdown (2012-10-23 00:03:14 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/bbs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/bbs
>
> Robert Yang (2):
>    bitbake.conf: break three very long lines
Merged into OE-Core

>    bitbake.conf: add BUILDNAME to BB_HASHBASE_WHITELIST
>
Richard is looking at this one, it likely has issues that are not as 
obvious on first look.

Thanks
	Sau!


>   meta/conf/bitbake.conf |   20 ++++++++++++++------
>   1 files changed, 14 insertions(+), 6 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


