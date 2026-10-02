Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70386CA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:05:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14434.1790953516429757315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YOEEP58W;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 348E94E41110;
	Fri,  2 Oct 2026 15:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 084B1603DC;
	Fri,  2 Oct 2026 15:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7C0C103281BC;
	Fri,  2 Oct 2026 17:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790953513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5dVIYWbydiA3MvD4RCiEz0VaAo28zMfD7Vx7OxxwkJQ=;
	b=YOEEP58W5SHCo38KGZr6M2fdTCBfSNvJs7+dlq/+zVj0z99WsVghn5Xvu1V5shw76xl2d4
	mLmS57mMEPT3kuSvfeUBZJB3i1OLtJ7/vU8zJsEWRMoogZBLk4r1+Xvh/I82wlcgUugiuD
	vRFQXmGafVbLAefwQUYRv4QEUpuVGafx9HzBS+c9tiBLvNMO8guVx8ZSCXfdgkp/jF3M3E
	NWaxUDfCgd32XZ6hFEZRlt8tXJKsq8By4NbWY79XJ9E3Yg4rBsXJNtHrT5SHOxcIaCotWh
	/Or34xe1yQINKxIPEIKNjqiRNw/hF0ybSohOdVCai1/fFqSHXSGbKxgbRxLe0w==
Message-ID: <1cea66cf-0b35-4365-83b8-3454b27af87c@bootlin.com>
Date: Fri, 2 Oct 2026 17:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/1] recipes-support/gnutls: disable slow
 tests for RISCV64
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "tgamblin@baylibre.com" <tgamblin@baylibre.com>
References: <20260929083308.1734775-1-joaomarcos.costa@bootlin.com>
 <20260929083308.1734775-2-joaomarcos.costa@bootlin.com>
 <2E08BDB0-EC22-44F9-A5E6-8452D64852CE@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <2E08BDB0-EC22-44F9-A5E6-8452D64852CE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 15:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247131

Hi Ross,

On 10/1/26 6:28 PM, Ross Burton via lists.openembedded.org wrote:
> Hi Joao,
>=20
> On 29 Sep 2026, at 09:33, Joao Marcos Costa via lists.openembedded.org =
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>> +SRC_URI:append:riscv64 =3D "\
>> +    file://0001-tests-Makefile.am-disable-slow-test-cases-in-RISCV64.=
patch \
>> +"
>=20
> Architecture-specific patches are discouraged as the auto upgrade helpe=
r doesn=E2=80=99t do test builds on every architecture, so it will quite =
possibly go stale fast.
>=20
> Luckily, gnutls=E2=80=99s run-ptest already has a =E2=80=9Ctest_disallo=
wlist=E2=80=9D, so we just need to add a way of extending that with a var=
iable in the recipe, which can then use a machine override.
>=20
> Ross

I will prepare a v4 then. Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa


