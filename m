Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B938FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 13:56:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11828.1777470956042820039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 06:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=B8GEuXmD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD7371A32D1;
	Wed, 29 Apr 2026 13:55:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82663601DF;
	Wed, 29 Apr 2026 13:55:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF2910729E1D;
	Wed, 29 Apr 2026 15:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777470949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0zuB/InW+Nd/VnBpLKho5xUG05s9u7yHk43dd+HPcWI=;
	b=B8GEuXmD6uESBiiyU0Dud3b+7VaL3A/P4t4+i+ijylLAY1q2HKz+ywiCraOJVNDrEYrqoR
	V2XCXyYR3zj9Ezvp7TFquzAQ51QbH4YgkEOWrFhWLB46y5fh9GsEF/mKoHhQePZ20+BBUv
	5cqyWRG0PcXYE4qe6xb15bSu09hKqs/Cq/AmN/DUSlQ06KIg9BkWu00sAxY/JamxjR6TSx
	Y4Qj6O4hwwv5FsljBZeM/caS3yxOjNfqPwJdlZEpqnXu6v5vaib7Z6nHFfT7r2uS4uaZ8P
	r24rYUicy3BN2pVIViiP7z/fwTfbPzuNqkdJoYGLrgVrQhYrU6+JvVsH9LJwDA==
Message-ID: <0ab84db0-e1a8-4de8-b60c-6b037ba1ec0c@bootlin.com>
Date: Wed, 29 Apr 2026 15:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Marek Vasut <marek.vasut@mailbox.org>, richard.purdie@linuxfoundation.org,
 festevam@gmail.com, openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
 <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
 <fa25613f-508b-4bd0-88c3-df0605f114ba@cherry.de>
 <4224196a-5bae-4ed6-8bd8-406d48a0b7d1@mailbox.org>
 <b12002bb-9cf5-4acd-8fb9-6d4c4d959497@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <b12002bb-9cf5-4acd-8fb9-6d4c4d959497@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 13:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236101

Hello,

(...)

>> In short, see the U-Boot commit 807bcd844afe ("scripts/dtc: Fix pkg-=20
>> config behavior under sysroot") referenced in the commit message of=20
>> this patch, and the matching Linux kernel commit ef8795f3f1ce=20
>> ("dt-bindings: kbuild: Use DTB files for validation") .
>>
>=20
> I know, I brought this up here:=20
> https://lore.kernel.org/openembedded-core/52fa5836-b061-4896-be48-673fc=
a5ba3d4@cherry.de/
>=20
>> I think we need to port that kernel commit to U-Boot, upstream that=20
>> kernel commit (should be easy) and then add it here into OE too. Then=20
>> it will be really a problem solved all over the place and case closed.
>=20
> Yes, someone needs to do the work.
>=20
> Cheers,
> Quentin

Just in case, I wrote the patch for that, and started the build to test=20
it. Once I'm done testing, I will send it here and to U-Boot's mailing=20
list as well.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

