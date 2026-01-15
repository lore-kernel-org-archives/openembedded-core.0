Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D86D44C7E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:36:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40305.1768494971394118633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 08:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LGmOCuuN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41D2C4E420D3
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 16:36:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08490606E0;
	Thu, 15 Jan 2026 16:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A16910B686CE;
	Thu, 15 Jan 2026 17:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768494968; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nvooARF9cSb6wj9r0fwVLxtkr5q943CgZMHGWPygXss=;
	b=LGmOCuuNrdCtZvnT7pDHTU112HlhulhJLlIS33aa1987oU5g7y8Kf+zFRsJhUIbSupFWdH
	7zobK7Qrh2h6lyWbUc5bbSiWemj/Qq4GnaMaCJM0JHwCvd5mDk/Yk7LndR5IC/XsVnctlz
	TcVE+L1nN0zhR0sqhT7zN6g1ewGO1JJgAV/epZVFIGqJIJ/gQg9e5JblUUDcGTtXJXkzN7
	LDNFDHtVdkkXzaLbPsZP1P1SIL1PV0U9RH5sH7Y4TmZh7VLy5Jq/Df8+BWmZZxw8FKz892
	oLejK/wuIj9cLWONJN9Dbx3e3hV4sJm49B2D73VHG1idftKrHAx35SLLAkfGSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 17:36:06 +0100
Message-Id: <DFPB57SVHXHM.3URJ37NIHTAC6@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: drop VDPAU remnants
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 16:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229423

Hi,

On Thu Jan 15, 2026 at 4:24 AM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> Mesa 25.3.x dropped support for VDPAU. Commit 88e26a937549 ("mesa:
> upgrade 25.2.5 -> 25.3.1") has dropped most of VDPAU-related items,
> but it didn't drop mesa-vdpau-drivers package (nor did it drop VDPAU
> bits from mesa-dev). Drop those remnants.
>
> Fixes: 88e26a937549 ("mesa: upgrade 25.2.5 -> 25.3.1")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 2547f8a68f02..a82bfb613549 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -251,7 +251,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libopencl-mesa \
>               libteflon \
>               mesa-megadriver mesa-vulkan-drivers \
> -             ${PN}-vdpau-drivers mesa-tools \

I think this was based on master-next which used to contain
https://lore.kernel.org/r/20260109123232.1199822-3-joaomarcos.costa@bootlin=
.com
?

But this patch was dropped after review.

Can you re-send this series based off master? I can't apply your patch at t=
he
moment.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


