Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0788DC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 15:31:30 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.8638.1666711886112739789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 08:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jbbWJLnt;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DB41240008;
	Tue, 25 Oct 2022 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666711883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tzOV0ldIwbGO0PHJBS1apgB8zWHQUeRgHLwlYzovr+8=;
	b=jbbWJLnt0eRrChHOdTP2aXYL9F5Rbt5TWPmAaeDqQJ9/3AzKgwz4C3Ujgz/GMi0CsyFRMO
	1lfJzHRGVK4q3pr+ioj1ACx1OB9AI1iTnuNFoWZ8pJkHL23jpcFZcINRt3QrWwp0XgiQ3v
	bverbp2Z6TvqQ12CAIz0uRCKOj+l+iziZm8V9X42R+K4f4LwQ+eQOf9ZLe86Mf5j5Whbqx
	O+kzlge9+A5jDHm4DLYjZl/GaummDByo0gLRVtpMUA+WLB8BubQq+KMIlVcf3NoaMxvnBz
	vJy7pBSIdsPzCC8t8gNTFwH14uZn9jzgvsCUW6CFZOCSuqMJ20mdKYRG5/PDAQ==
Date: Tue, 25 Oct 2022 17:31:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
Message-ID: <Y1gBSjnaB+frzv3i@mail.local>
References: <20221024150608.455173-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024150608.455173-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 15:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172134

Hello,

This is failing on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio

On 24/10/2022 17:06:08+0200, Markus Volk wrote:
> - add a PACKAGECONFIG for perfetto support
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}             | 0
>  meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
>  meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} | 0
>  3 files changed, 3 insertions(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8a74e0a80a..bad8461fef 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>             "
>  
> -SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
> +SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> @@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
>  
>  PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
>  
> +PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
> +
>  PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
>  
>  PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
> diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-graphics/mesa/mesa_22.2.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
> rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172101): https://lists.openembedded.org/g/openembedded-core/message/172101
> Mute This Topic: https://lists.openembedded.org/mt/94536553/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

