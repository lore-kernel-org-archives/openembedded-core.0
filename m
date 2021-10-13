Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DABEC433FE
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 09:45:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.5944.1634118326695277205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 02:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7291F240002;
	Wed, 13 Oct 2021 09:45:23 +0000 (UTC)
Date: Wed, 13 Oct 2021 11:45:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Tim Orling <timothy.t.orling@intel.com>
Subject: Re: [OE-core] [PATCH 6/7] at-spi2-core: upgrade 2.40.3 -> 2.42.0
Message-ID: <YWaqsxNRafru12Al@piout.net>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
 <20211012020854.2073998-6-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012020854.2073998-6-timothy.t.orling@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156895

Hi Tim,

This causes the following issue on no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/4158/steps/11/logs/stdio

On 12/10/2021 02:08:53+0000, Tim Orling wrote:
> What's new in at-spi2-core 2.42.0:
> * Set X root property when Xwayland starts on demand.
> * Several dbus introspection fixes.
> 
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>  .../atk/{at-spi2-core_2.40.3.bb => at-spi2-core_2.42.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/atk/{at-spi2-core_2.40.3.bb => at-spi2-core_2.42.0.bb} (94%)
> 
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
> similarity index 94%
> rename from meta/recipes-support/atk/at-spi2-core_2.40.3.bb
> rename to meta/recipes-support/atk/at-spi2-core_2.42.0.bb
> index 427ea7c1650..7e870e728e3 100644
> --- a/meta/recipes-support/atk/at-spi2-core_2.40.3.bb
> +++ b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
> @@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
>  
> -SRC_URI[sha256sum] = "e49837c2ad30d71e1f29ca8e0968a54b95030272f7ff40b89b48968653f37a5c"
> +SRC_URI[sha256sum] = "4b5da10e94fa3c6195f95222438f63a0234b99ef9df772c7640e82baeaa6e386"
>  
>  X11DEPENDS = "virtual/libx11 libxi libxtst"
>  
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156857): https://lists.openembedded.org/g/openembedded-core/message/156857
> Mute This Topic: https://lists.openembedded.org/mt/86253241/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

