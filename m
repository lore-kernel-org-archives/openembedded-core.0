Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF1D77E12
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 09:01:36 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 02 Aug 2017 02:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,310,1498546800"; d="scan'208";a="134338305"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2017 02:01:38 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 51AD75809DF;
	Wed,  2 Aug 2017 02:01:37 -0700 (PDT)
Date: Wed, 2 Aug 2017 11:38:37 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: liu.ming50@gmail.com
Message-ID: <20170802083837.GC2944@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
	<1501607630-30241-2-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1501607630-30241-2-git-send-email-liu.ming50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] wic-image-minimal: drop WKS_FILE_DEPENDS definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Aug 2017 09:01:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2017 at 07:13:47PM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> It's being set in image_types_wic.bbclass, not need to double set it
> here, furthermore, the dependencies are incomplete by missing
> e2fsprogs-native.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
> index e1da203..af40d96 100644
> --- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
> +++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
> @@ -6,8 +6,6 @@ IMAGE_INSTALL = "packagegroup-core-boot"
>  
>  IMAGE_FSTYPES = "wic"
>  
> -WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
> -
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  
>  IMAGE_ROOTFS_EXTRA_SPACE = "2000"

Please, consider adding e2fsprogs-native to the list instead of building
extra packages that are not going to be used.

--
Regards,
Ed

