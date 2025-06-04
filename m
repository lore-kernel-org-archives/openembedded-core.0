Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C42C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 20:53:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.27901.1749070419178916520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 13:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uMv7B-00067k-LG; Wed, 04 Jun 2025 22:53:37 +0200
Message-ID: <612e549f-dbd6-4a4b-aaa6-4a3882319770@pengutronix.de>
Date: Wed, 4 Jun 2025 22:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH] barebox: upgrade 2025.04.0 -> 2025.05.0
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, ske@pengutronix.de
References: <20250604203423.2759460-1-ejo@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250604203423.2759460-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 20:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217967

Hello Enrico,

On 6/4/25 22:34, Enrico Jörns wrote:
> Changes in 2025.05.0
> --------------------

Unfortunately, this month's release (or rather a patch of mine included in it)
broke decompression of FIT image contents. I'd suggest either including
https://lore.kernel.org/barebox/20250604-fix-tmp-file-v1-1-96a1c1a8d636@pengutronix.de/T/#u

or holding off the update until v2025.06.0 is released with the fix.

I am looking into adding a regression test to barebox CI for this.

Thanks,
Ahmad

> 
> * RPMB support added for eMMC, enabling AVB persistent value storage
> * New commands: 'tree', 'truncate', 'varinfo' (variable inspection)
> * Added board support: STM32MP1-based Linux Automation TAC, FairyTux 2,
>   Protonic MECT1S
> * Unified Beaglebone build now produces MLO first‐stage image
> * TLSF allocator becomes the default, replacing dlmalloc
> * Various filesystem, CI, and driver cleanups and improvements
> 
> Full Changelog:
> https://lore.barebox.org/barebox/aC2N-bXXRByPYqiM@pengutronix.de/
> 
> Migration Guide:
> https://barebox.org/doc/latest/migration-guides/migration-2025.05.0.html
> 
> Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
> ---
>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
> index d6ea1eedfe..616da2a4ee 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION = "bootloaders"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>  
> -PV = "2025.04.0"
> +PV = "2025.05.0"
>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
> +SRC_URI[sha256sum] = "693f9aca90b282f6fb96024b70c06c9c57efe4eefe8e2298ef78eaa05c76fd5d"

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


