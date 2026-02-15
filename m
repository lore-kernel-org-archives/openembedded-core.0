Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192C5E63F02
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 16:41:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1589.1771173681553696692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 08:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y6Y6ScI8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0A43FC19D3D
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:41:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 431CC606CD;
	Sun, 15 Feb 2026 16:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20A8E102F1D19;
	Sun, 15 Feb 2026 17:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771173678; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QAzJ6iNsRrz3EebnH20rR2yZq8+6GT0i5B4skAbIuAQ=;
	b=y6Y6ScI83O4pir9Qxxo0Kr8t4yIFgWiA4rlRt46bKa+24W0t2zRlCLX0gp2am1VopDGtSB
	sJVFOokm8q75TD+utJHGDGHt7YyOU6IlJQsYg1DtFOwsAhfySKtNVsQegHNxm6UkXuZJcm
	JG/LnHVTbjXXThoUY2ACdYPUREp87skuG780Y6jOcS0SOpXL1/LFpuQ8Os2vDX5GBbI839
	3EzPFWbar8ES7Be7yzLdpRGlfmLUet28PcVtdjYD9FlruY40zRVy2nTvRITAb6WUzBWRQB
	Z5njsSGm6bsZLq+bZ67IsdbXhdb/yn5bSxWhI1VCccB2oaQzzH3C8rSIiTnK8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 17:41:17 +0100
Message-Id: <DGFOO2LV5U6R.2BRXDT44USDKP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] ufs image class: add
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213163646.4018896-1-twoerner@gmail.com>
 <20260213163646.4018896-2-twoerner@gmail.com>
In-Reply-To: <20260213163646.4018896-2-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231164

On Fri Feb 13, 2026 at 5:36 PM CET, Trevor Woerner via lists.openembedded.o=
rg wrote:
> Add an image class and wks file that demonstrates generating a wic image
> with a 4096-byte sector size.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

Thanks for your patch.


> +
> +IMAGE_CMD:wic.ufs () {
> +	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"

IMAGE_CMD:wic_ufs ?

At least I believe this is the source of this warning:

WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_image_wic_=
ufs doesn't exist

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/3267
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3157
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3210

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


