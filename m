Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.33893.1628842744968844415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 01:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E81C1FF808;
	Fri, 13 Aug 2021 08:19:02 +0000 (UTC)
Date: Fri, 13 Aug 2021 10:19:02 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] yocto-bsp: update machine confs with new tune locations
Message-ID: <YRYq9lzl6dzzz5xr@piout.net>
References: <20210810214503.17791-1-jdmason@kudzu.us>
 <20210810214503.17791-3-jdmason@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20210810214503.17791-3-jdmason@kudzu.us>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jon,

This is the fallout of this series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2442

It seems you got it mostly right but forgot to update the path to qemuboot-x86.inc

On 10/08/2021 17:45:02-0400, Jon Mason wrote:
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 2 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf       | 2 +-
>  meta-yocto-bsp/conf/machine/genericx86-64.conf    | 2 +-
>  meta-yocto-bsp/conf/machine/genericx86.conf       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> index 65c79fd34db6..eb4e0fb1b157 100644
> --- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> +++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> @@ -12,7 +12,7 @@ MACHINE_EXTRA_RRECOMMENDS = "kernel-modules kernel-devicetree"
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  DEFAULTTUNE ?= "cortexa8hf-neon"
> -include conf/machine/include/tune-cortexa8.inc
> +include conf/machine/include/arm/tune-cortexa8.inc
>  
>  IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
>  EXTRA_IMAGECMD:jffs2 = "-lnp "
> diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
> index fbe33be9d157..447862f550bc 100644
> --- a/meta-yocto-bsp/conf/machine/edgerouter.conf
> +++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
> @@ -2,7 +2,7 @@
>  #@NAME: Edgerouter
>  #@DESCRIPTION: Machine configuration for a generic edgerouter
>  
> -require conf/machine/include/tune-mips64.inc
> +require conf/machine/include/mips/tune-mips64.inc
>  
>  MACHINE_FEATURES = "pci ext2 ext3 serial"
>  
> diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
> index 81ec24e97146..14913ea1f152 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for generic x86_64 (64-bit) PCs and servers. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
>  
>  DEFAULTTUNE ?= "core2-64"
> -require conf/machine/include/tune-core2.inc
> +require conf/machine/include/x86/tune-core2.inc
>  require conf/machine/include/genericx86-common.inc
>  
>  SERIAL_CONSOLES_CHECK = "ttyS0"
> diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
> index 1387bde852f8..ed4fc8a3de8d 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for generic x86 (32-bit) PCs. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
>  
>  DEFAULTTUNE ?= "core2-32"
> -require conf/machine/include/tune-core2.inc
> +require conf/machine/include/x86/tune-core2.inc
>  require conf/machine/include/genericx86-common.inc
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
> -- 
> 2.20.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
