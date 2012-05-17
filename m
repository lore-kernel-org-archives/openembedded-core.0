Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SV28o-0005Bd-GC
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 16:57:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 07:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101209320"
Received: from pgcooper-ivm.ger.corp.intel.com (HELO envy.home)
	([10.255.12.230])
	by AZSMGA002.ch.intel.com with ESMTP; 17 May 2012 07:47:18 -0700
Message-ID: <4FB50F47.6060207@linux.intel.com>
Date: Thu, 17 May 2012 07:46:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337131523-8176-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1337131523-8176-1-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.4.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 17 May 2012 14:57:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/15/2012 06:25 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> It's common to provide a non-machine-suffixed link in DEPLOY_DIR_IMAGE, so
> let's be consistent and do so here as well.

This of course means that building two machines in the same build dir
will result in overwriting the latest non-machine-suffixed link
(provided they are the same image type).

I agree that sometimes I wished I just had a bzImage, but the current
behavior seems more robust, consistent, and is less prone to user error.

Is there a reason other than aligning with what other packages do to do
this? Which packages do this?

--
Darren

> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a85f130..90af597 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -538,6 +538,7 @@ kernel_do_deploy() {
>  	cd ${DEPLOYDIR}
>  	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>  
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>  }

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


