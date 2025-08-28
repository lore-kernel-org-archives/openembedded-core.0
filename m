Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E070C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 13:29:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.21042.1756387772583051767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 06:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=HFLcmVdP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85F764E40BB9;
	Thu, 28 Aug 2025 13:29:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B0D760303;
	Thu, 28 Aug 2025 13:29:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D7C21C22D8D5;
	Thu, 28 Aug 2025 15:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756387769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ls4iOv8uJ5E6lhdATjPfzo7cNRnyGEZwiz6LjBDri/0=;
	b=HFLcmVdPfM1deg9ycWql4xge2JCIAqMGAhMxkGpq005LAvv9pSXXaYGpwLJhbziaNnuVfG
	EoD59LhH2mEx4SuC0/uNxm7Y8oggtqGCnnHLMDCDTT411doovbLUsciPr/hwnPYhSru6hy
	pYrFHllCtL/bocSbEqcJaRmKeGwqMfcI3zlsxIP6P7eB5EzmWs7DHsGEFvb9G59tGAyGzG
	niJ8jJwnT7MoZlIiQ7gJzmW5pyliBXCyVdeRcwBU+7S9n8C+K4PTOLaC0IUNuvkdVCDSmR
	PsNyztcAFrKT+THwUCrddjDBiik8Gsmx7vbBJkdT4tf2qunhYd9D6Nj5kx0KIA==
Message-ID: <f0fd3802-b42b-48b9-8d8d-645420202a30@bootlin.com>
Date: Thu, 28 Aug 2025 15:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest
 support
To: a-christidis@ti.com, openembedded-core@lists.openembedded.org,
 mathieu.dubois-briand@bootlin.com
Cc: alex@linutronix.de
References: <20250827222051.367093-1-a-christidis@ti.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20250827222051.367093-1-a-christidis@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 13:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222575

Hello,

I hope this email finds you well.

On 8/28/25 00:20, Antonios Christidis via lists.openembedded.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
>=20
> The SDL2 software comes with its own set of tests. Following that
> introduce support for ptest.
>=20
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../distro/include/ptest-packagelists.inc     |  1 +
>   .../libsdl2/libsdl2/run-ptest                 | 15 ++++++++++++++
>   .../libsdl2/libsdl2_2.32.8.bb                 | 20 +++++++++++++++++-=
-
>   3 files changed, 34 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/run-ptest
>=20

There's a syntax error in run-ptest, as it seems:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2183/s=
teps/12/logs/stdio=20
(line 2250).

Could you please take a look? Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

