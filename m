Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D57CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:40:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50106.1778506838073350030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uZkgTG9b;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 25F38C5E155
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:41:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98DE960646;
	Mon, 11 May 2026 13:40:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391E911AF9D9C;
	Mon, 11 May 2026 15:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778506835; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=eu8axL8ZiW/J8QFb6OenfFHW+rVbQLnaYoaSgJxaXi0=;
	b=uZkgTG9b0GwTfEj3jkQReCyOEqMYSHUpiZxXyaINd4v0OWoZcbpkxwz1GTureNDqnR3Bs6
	9xfxWVpVtZe+aVxn/jzYKngOf7v4/wmuqOpBsHJ6IY6gFlykbuNwSxyKqIpHF0EHRUF8+I
	s1AUE3++HNGpuPItptSLdLROUBQUZFKZM3QpCW2glq1m045BiNbdkz+fSD2/RHCbX52Xxl
	TQfuumJzFK3xsytiwePe3v9P5Yzn5aMYhpQTt9SqOpd6ZQE2Exb3rNGO50+EAmfvqrAJdU
	hYLg5C2qEyS65/kFwnEiOd/QiZnkAz8h6hPnWKX17Qbq9Y8S64t/jMD/m29Xng==
Message-ID: <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
Date: Mon, 11 May 2026 15:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236815

Hello,

On 5/11/26 15:27, Quentin Schulz via lists.openembedded.org wrote:
> Hi Jo=C3=A3o,
>=20
> On 5/11/26 11:29 AM, Jo=C3=A3o Marcos Costa wrote:
>> This was handled upstream a while ago:
>>
>> https://github.com/tianocore/edk2/blob/master/BaseTools/Source/C/Devic=
ePath/GNUmakefile#L27
>>
>=20
> It's not because upstream supports it that the version we're building=20
> has it, so pointing at a commit and mentioning it's part of the version=
=20
> we're building would be nice.
>=20
> 22130dcd98b4 ("Basetools: turn off gcc12 warning") part of=20
> edk2-stable202205 tag (and also edk2-stable202511 which we currently ar=
e=20
> at.

That's very much true. I will stick with this approach for the next time.

> Also, unclear whether this single file is the only place this flag bein=
g=20
> set would be enough as the flag was set globally and now it's only in a=
=20
> specific file within edk2 source code.
>=20
> Cheers,
> Quentin

In any case, the warnings/errors would have been noticed during the=20
build if this flag was still needed (and missing).

--=20
Best regards,
Jo=C3=A3o Marcos Costa

