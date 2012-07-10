Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Soc7R-0004vE-Iu
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:12:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Jul 2012 08:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166297515"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2012 08:01:41 -0700
Message-ID: <4FFC43D5.7060708@linux.intel.com>
Date: Tue, 10 Jul 2012 08:01:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
	<1341930923-26277-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1341930923-26277-1-git-send-email-ray.danks@se-eng.com>
Subject: Re: [PATCH v2] mkelfimage: Upgrade to e1e6a91
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
X-List-Received-Date: Tue, 10 Jul 2012 15:12:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 07:35 AM, Raymond Danks wrote:
> Address QA issue: Files/directories were installed but not shipped.
> New revision contains patch to mkelfimage removing
> /usr/share/mkelfImage/elf32-i386 directory from Makefile install target.
>
> http://review.coreboot.org/#/c/1195/
>
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> v2:
>    Reword commit log
>
I hate to do this, but I am looking at the summary and it really does 
not tell me anything, a better summary would be something like:

mkelfimage: corrected packaging issue in upstream

...

Thanks
	Sau!

>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> index 1224a63..4b45c67 100644
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -4,7 +4,7 @@ SECTION = "devel"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
>
> -SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
> +SRCREV = "e1e6a91ce0738400fa1615179de88ebc0df29f66"
>   PV = "1.0.0+gitr${SRCPV}"
>   PR = "r1"
>
>



