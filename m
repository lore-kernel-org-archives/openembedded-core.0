Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXdwM-0007AB-Q1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 22:47:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2013 13:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,590,1363158000"; d="scan'208";a="306393622"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2013 13:29:57 -0700
Message-ID: <51817B44.30702@linux.intel.com>
Date: Wed, 01 May 2013 13:29:56 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: tf+lists.yocto@r-finger.com
References: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
In-Reply-To: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Enigmail-Version: 1.5.1
Cc: Tomas Frydrych <tomas@sleepfive.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: fix default location of kernel when generating elf images
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
X-List-Received-Date: Wed, 01 May 2013 20:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/01/2013 01:24 PM, tf+lists.yocto@r-finger.com wrote:
> From: Tomas Frydrych <tomas@sleepfive.com>
> 
> The kernel is now located in DEPLOY_DIR_IMAGE rather than sysroot.
> 
> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 98d31f5..0e1ad3a 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>  }
>  
> -ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
> +ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin"


Looks correct, how did this fail before? What was the symptom?


>  ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
>  
>  IMAGE_CMD_elf () {
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


