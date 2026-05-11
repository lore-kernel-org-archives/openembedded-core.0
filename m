Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123D3CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 14:00:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50516.1778508008793293486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 07:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=dMdbd3qE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 694D74E42BD5
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 14:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BB4B60646;
	Mon, 11 May 2026 14:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 538F911AF9DEE;
	Mon, 11 May 2026 16:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778508005; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pD3fSfHlkor/sGb9Sj/2OeDAeQRmCR23FtjJnjHeJa8=;
	b=dMdbd3qEdehXUpgYKs/hBUIAQuAwQHwmgavnXFxZuhL1g4YMfmIbyntAsypAX+EgyxA1L+
	znxegs8owJW2JeUimLz+ht6Qu+/EQl39wZEiF4uBXvVZZ+5wS4huloNQ/gxX9u6pi2Mtpd
	BKyiqfkhWdQNh+Xz9sj5BzxhfzoxBSseK4y9N3L8QDKD3GlbteUi4FvrvS/plJx3ax2Xio
	ZT+yeijhGnpK4N/duLvIbr2FLx+sqELvV8CbB4TYkn1pIj6W1t0EIRl8BLDJhBLnrMI4JQ
	K9FX2OG8cBUxOHrZi7P2pGnsVAVtrB9SHjtDlbN/jQWpfu4AfNp8azhJ9h5L2A==
Message-ID: <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
Date: Mon, 11 May 2026 16:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 14:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236820

Hello,

On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org wrote:
(...)
>=20
> Not necessarily true as I don't think we build GCC for native recipes=20
> (and ovmf has a native variant), so it depends on the GCC on the host=20
> (unless you have uninative?). I don't know the autobuilder=20
> infrastructure, e.g. whether we build patches on multiple workers on=20
> different distros to have a big GCC version test matrix.
>=20
> But yes, building with a newer GCC will generally not make warnings fro=
m=20
> previous versions disappear and I'm hoping upstream has had time to fix=
=20
> warnings returned by GCC12 in the last 4 years :)
>=20
> Cheers,
> Quentin

Yep, my whole point is based on the the distros in SANITY_TESTED_DISTROS=20
being recent enough to ship GCC > 12 :)

I should have made it explicit in my commit message.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

