Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QvvkW-0006xw-FU
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 20:30:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 11:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41073763"
Received: from unknown (HELO envy.home) ([10.7.199.154])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 11:26:10 -0700
Message-ID: <4E53F0C0.7050008@linux.intel.com>
Date: Tue, 23 Aug 2011 11:26:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314112712.git.paul.eggleton@linux.intel.com>
	<d61dc1988ac39cc249f94588d5453e9b90298f75.1314112712.git.paul.eggleton@linux.intel.com>
In-Reply-To: <d61dc1988ac39cc249f94588d5453e9b90298f75.1314112712.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] image.bbclass, kernel.bbclass: remove non-standard -n option from cp command
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
X-List-Received-Date: Tue, 23 Aug 2011 18:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/23/2011 08:22 AM, Paul Eggleton wrote:
> -n is not a POSIX option and does not work on some systems (e.g. Debian
> Lenny); in any case it is not strictly necessary here, so remove it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/image.bbclass  |    2 +-
>  meta/classes/kernel.bbclass |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 286ae01..bf8b73a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -138,7 +138,7 @@ fakeroot do_rootfs () {
>  	mkdir -p ${IMAGE_ROOTFS}
>  	mkdir -p ${DEPLOY_DIR_IMAGE}
>  
> -	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>  
>  	if [ "${USE_DEVFS}" != "1" ]; then
>  		for devtable in ${@get_devtable_list(d)}; do
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a2b10f2..c855268 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -501,7 +501,7 @@ kernel_do_deploy() {
>  	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>  
> -	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>  }
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


