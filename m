Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46CDFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:15:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18873.1777551352075225103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 05:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tWCl2kat;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54A50C5CD69;
	Thu, 30 Apr 2026 12:16:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA4F060495;
	Thu, 30 Apr 2026 12:15:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F773102F2230;
	Thu, 30 Apr 2026 14:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777551349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AzjSXe4oUhP6U4LvCK2PoPb8V9eFmaz/vAmMFm2guc0=;
	b=tWCl2katIfrQaa2ZxWobG2FjomTe3CrgEQNuJawqn+OaiyFlWyxqP+OrzBzvauIgFQmNJy
	9H+i1nV++cREEnUryEYDK7iVUxzr42wX4OZaTJgYMd1tv2Uz/g0lXBvwPLQp8b9y7T1Vs7
	PaJrIpTDf47Xepa6kZQfY+adaaBcz7vM5oeqOAodsI/1dB1Y4ChvUWCO8FidJA70m60ymI
	Gcile5xRtwDanWKHdHV2h9iO4vQ77HY3PAutr71HnUNDCXIIH4UbKV32grpm+FFvtW3fgJ
	sU8cN4mES5ZNCxMJM0Ua/pssoyD26jZ4EnXTmRWPi3yOCiGq5QLpeMZaT9mG6A==
Message-ID: <8bebcf2c-2964-4909-af95-1339b5100c5e@bootlin.com>
Date: Thu, 30 Apr 2026 14:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot-tools: drop yaml in DT validation
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 quentin.schulz@cherry.de, marek.vasut@mailbox.org, khem.raj@oss.qualcomm.com
References: <20260429171723.167639-1-joaomarcos.costa@bootlin.com>
 <CAOMZO5DW=PBRN1FwnHcySKaUqQCkLsLqEJm63=XfUL3DAJNx_A@mail.gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOMZO5DW=PBRN1FwnHcySKaUqQCkLsLqEJm63=XfUL3DAJNx_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236160

Bom dia, Fabio :)

On 4/29/26 21:20, Fabio Estevam wrote:
> Hi Jo=C3=A3o,
>=20
> On Wed, Apr 29, 2026 at 2:17=E2=80=AFPM Jo=C3=A3o Marcos Costa
> <joaomarcos.costa@bootlin.com> wrote:
>>
>> Since yamltree was dropped from upstream dtc (i.e., in Linux), a patch=
 was
>> sent to U-Boot to backport the corresponding changes.
>>
>> Apply this patch in u-boot's sources.
>>
>> Overall, this fixes the build-time issues with DTC (and so in
>> u-boot-tools).
>>
>> Considering libyaml is no longer used, the dependency on libyaml-nativ=
e can be
>> dropped as well (thus reverting the change below):
>>
>> 02e09e036e: u-boot-tools: Add dependency on libyaml for dtschema valid=
ation
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>=20
> Thanks for addressing this:
>=20
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Sure, my pleasure!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

