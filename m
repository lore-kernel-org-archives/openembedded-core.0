Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CE7C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:42:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11168.1722872568133714618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=A5a1+ssG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475FgkVi007945;
	Mon, 5 Aug 2024 10:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722872566;
	bh=DXV02bbKH7iHNLc4TuBLkut9MQ9bUC2KjxG2bqx5NI0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A5a1+ssGQiy/OuK522sOEZXT78cS7mZeRZ7uW0BP/m4mO1Vc6dTcyTXDGS4/DRnHt
	 HvOayhCDkPLUsblRvO/NxB3dpTfcBfS0ishafDvQSw48Sq9kMdkp2cSjmgw6qfsWt4
	 NjckJj9ckn8yBRJQpFQGuoMf1NOxxlzQ0GEkdblI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475FgkTb019011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2024 10:42:46 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 10:42:46 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 5 Aug
 2024 10:42:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 10:42:46 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475FgklM066097;
	Mon, 5 Aug 2024 10:42:46 -0500
Message-ID: <73051d7f-dc49-492a-8fde-62d467bb0138@ti.com>
Date: Mon, 5 Aug 2024 10:42:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Expired certificate https://git.openembedded.org/
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <peter.marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Michael Halstead <mhalstead@linuxfoundation.org>
References: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <b2e11089-48f4-4f8e-878d-303f295af0ac@ti.com>
 <9fe86c0b0106479e2247153f2be035547239d892.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9fe86c0b0106479e2247153f2be035547239d892.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 475FgkVi007945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203002



On 8/5/2024 10:27 AM, Richard Purdie wrote:
> On Mon, 2024-08-05 at 09:57 -0500, Ryan Eatmon via
> lists.openembedded.org wrote:
>>
>> I've noticed it.=C2=A0 I can no longer do a git clone from
>> git.openembedded.org over https.=C2=A0 Can we get this fixed ASAP?
>>
>>
>> On 8/5/2024 8:15 AM, Peter Marko via lists.openembedded.org wrote:
>>> In case no one noticed yet, the certificate expired an hour ago, so
>>> the
>>> repositories can=E2=80=99t be viewed in a browser=E2=80=A6
>=20
> This has now been resolved as has the underlying issue with stopped it
> being updated automatically. Thanks Michael!

Thank you!


> Cheers,
>=20
> Richard

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

