Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA98CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 14:07:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11957.1778767627006592578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 07:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IIsRFrE0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9E521A35B7;
	Thu, 14 May 2026 14:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A731660495;
	Thu, 14 May 2026 14:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FA4C11AF8FBC;
	Thu, 14 May 2026 16:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778767623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XSdqQWS3y/b/zF+LvkGroA9oMaisbHwdxk5v590eVzw=;
	b=IIsRFrE08k7okjQp2pjIZIJfvlMtPh16TqQonlAqGIwyEQ3xcNTudJ9Kw1YWiP5/y1pxKr
	TwjkL/prUQzRJuFolz9S5JEzmaH+0X/OB5UuyShqHKJ2lxxEzFb/XmvUr8O1qfH7ZOC+yI
	xZ2Jm8SMjLiw2oKp1hjbfwpZGaGUsByejrpdwwBLoi+GUnc0fqXyKA0FflAn+gJVYcSBKT
	n7oyOdDDe1/lI+mLFH8k98pY6LMeaVqB+bjnp2SKwgMhoM7jBjoJjod3E4v1kzdvtVPlqR
	erwsAkJvYBLJ80FCumRaoXm1wnU06eiHlRm5SenODpMlMspHNr4e1C9x+kDyBQ==
Message-ID: <971529c8-d5df-4fd0-8a4f-ef5f14b68d27@bootlin.com>
Date: Thu, 14 May 2026 16:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ovmf: add some rework to the recipe
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, quentin.schulz@cherry.de,
 raj.khem@gmail.com, Ross.Burton@arm.com
References: <20260514133446.219612-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260514133446.219612-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 14:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237037

I forgot to add the 'v2' tag, so please ignore this series and let me=20
re-send it.

On 5/14/26 15:34, Jo=C3=A3o Marcos Costa wrote:
> Hello,
>=20
> This patch series contains, first of all, a slight issue with PACKAGECO=
NFIG
> previously evoked by Q. Schulz (cc'ed) in the mailing list.
>=20
> The main point of the series is the support for Clang, which I tested w=
ith the
> latest version llvm/clang available as of now in oe-core. I also tested=
 the
> result with the help of runqemu.
>=20
> Moreover, some of the settings are obsolete and can be removed.
>=20
> Best regards,
>=20
> ---
>=20
> Changes since v1:
> - clarify the behaviour change in PACKAGECONFIG's assignment
> - in the second patch, make it clear that the flag is obsolete because =
it was
>    already upstreamed (and is part of the currently used tag), not beca=
use of
>    GCC's version
>=20
> Jo=C3=A3o Marcos Costa (3):
>    ovmf: simplify PACKAGECONFIG's default value
>    ovmf: drop upstreamed BUILD_CFLAGS setting
>    ovmf: add support for Clang toolchain
>=20
>   meta/recipes-core/ovmf/ovmf_git.bb | 51 ++++++-----------------------=
-
>   1 file changed, 9 insertions(+), 42 deletions(-)
>=20

--=20
Best regards,
Jo=C3=A3o Marcos Costa

