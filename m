Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAA5CA5FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:00:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14373.1790953212680818596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kEImUk71;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74AAB1A10EA;
	Fri,  2 Oct 2026 15:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49134603DC;
	Fri,  2 Oct 2026 15:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A101B103281F4;
	Fri,  2 Oct 2026 17:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790953205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=johOJGjNMeIrSjyIUvuGYJ6HFgXp+G4uh1FMihhZUik=;
	b=kEImUk71THQOnAL8ew6iQvzodzFbcTO1ijkEij4Hj9b6kHxCQ2fFfwLyfQXZzvl+Di/bld
	4TctF/An2DnrHUELFoCLCbIom69j24jgRUrBnN4wBnJW4MlAZG7DspYW9lAJCfX+qKY4DY
	VCtniz7Ln80dbXh0HWIYmPP87q5KNX37fdBMUT8AAyySlNHw7XbnEcknuaK+XolQzMAFGi
	TV2hc6lR7CG79MY9074eGM1/FFkmFfttM9GZiMN2jxnnYTuVs05NE13pGdK0bNyxMySsMM
	g3eTZBSbwXMHMa0jRlOIZMM2LCOJDwSnDuf3KXwJWnxWaF1SzxzJNqwRRv9kxg==
Message-ID: <53c66e11-1680-4ec4-9094-100cadb929e2@bootlin.com>
Date: Fri, 2 Oct 2026 17:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] python3: fix CVE-2026-19445
To: yoann.congal@smile.fr, "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
References: <20261002123943.2208277-1-joaomarcos.costa@bootlin.com>
 <AS8PR10MB5073438BA96A515D51FA329AFD892@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <DLUE6D6RHFEJ.2CJK2A37PGCCP@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DLUE6D6RHFEJ.2CJK2A37PGCCP@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 15:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247130

Hello

On 10/2/26 3:37 PM, Yoann Congal via lists.openembedded.org wrote:
> On Fri Oct 2, 2026 at 2:45 PM CEST, Peter Marko wrote:
>> We should upgrade python version instead of picking patches included i=
n latest tag.
>> https://github.com/python/cpython/releases/tag/v3.12.15
>=20
> Agreed.
>=20
> @Jo=C3=A3o, python is one of the rare recipes we'd rather upgrade than =
patch
> with backports on stable. As long as it is maintained upstream, of
> course.
>=20
>>
>> I'll probably give it a try over weekend.
>=20
> Thanks Peter!
>=20
>>
>> Peter

Noted, thanks for the infos (@Yoann and @Peter).

--=20
Best regards,
Jo=C3=A3o Marcos Costa


