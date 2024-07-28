Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4513DC3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 11:06:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.32674.1722164769611684419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 04:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=xRMzQVal;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46SB68Qb127584
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 06:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722164768;
	bh=jQbN8VJPugS0bCU80N67L58uBr+h2F6MmnuLvpjeTtI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xRMzQValfwuHh5rR51n2/P6Z9L/mCmjawrNvqBWYeJb0OswTBThfGZB85LZbHFcmv
	 K/qV/ldsoLNCXs3kT92hQLjvnDnUAAqXh2c4m6NY4zWXFvsYn7cMd2+kDSPRGeXAvP
	 O78bHrC2GcFe7AgwADVmtDI1SmxtDhKFGQ3C0hXU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46SB68tV127784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 06:06:08 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 28
 Jul 2024 06:06:08 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Sun, 28 Jul
 2024 06:06:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 28 Jul 2024 06:06:08 -0500
Received: from [10.250.32.187] ([10.250.32.187])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46SB68B2020540
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 06:06:08 -0500
Message-ID: <6373f3c2-8e48-4765-b441-7c50520d7981@ti.com>
Date: Sun, 28 Jul 2024 06:06:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] scarthgap runtime SPDX error
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <17E633EE7065C255.2837@lists.openembedded.org>
 <17E6350F7690294A.2837@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E6350F7690294A.2837@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 46SB68Qb127584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 11:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202564


It does.  Please accept that patch series onto scarthgap ASAP.


On 7/27/2024 6:17 PM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
> Nevermind... I see the patch right below this that looks like it might=20
> fix it.=C2=A0 I'll test the patch series out and see if it works.
>=20
>=20
> On 7/27/2024 5:56 PM, Ryan Eatmon via lists.openembedded.org wrote:
>>
>> We started seeing a new error on scarthgap on Friday.
>>
>> ERROR: No runtime SPDX document found for bt-enable, False=20
>> sstate:bt-enable:all-oe-linux:1.0:r1:allarch:12:=20
>> sstate:bt-enable::1.0:r1::12:
>>
>> The package it is referring to changes from image to image and run to=20
>> run, but we only get a single error message.
>>
>> If I do a build not using the sstate-cache, the build works fine.=C2=A0=
 If=20
>> I then update our shared sstate-cache with those rebuilt files and run=
=20
>> a second build using the cache, the error comes back.
>>
>> I don't see anything obvious in the two bitbake commits and handful on=
=20
>> oe-core.=C2=A0 I've spent all day today trying to do the two step proc=
ess=20
>> to see if I can find the commit that causes this.
>>
>> Has anyone else seen anything like this in your scarthgap builds=20
>> starting Friday?
>>
>>
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202563): https://lists.openembedded.org/g/openembed=
ded-core/message/202563
> Mute This Topic: https://lists.openembedded.org/mt/107585320/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

