Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD4FC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 14:57:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.9996.1722869866529137275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 07:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hwpjuwfI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475EvjMq072335;
	Mon, 5 Aug 2024 09:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722869865;
	bh=aKz1dJIZI3JrC99ViHNQk2snB7t5ndSqJvEGDyT1QIE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hwpjuwfIsb818jCpEIrHVXVef1VYHTZpLj/td7ls4hv3o1SGADqci2MMsanFeZzLC
	 WBHS1UNNk9noE9+ccOmW2HSUNNFcV50rn+1l6o+vQSRquMWBjK9vSPEiqzG6EQc87+
	 ZHk35y2rpLUny4VPwBU878zqhV72vcWA9y5wsyqI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475EvjYT102607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2024 09:57:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 09:57:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 09:57:39 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475EvdYK007454;
	Mon, 5 Aug 2024 09:57:39 -0500
Message-ID: <b2e11089-48f4-4f8e-878d-303f295af0ac@ti.com>
Date: Mon, 5 Aug 2024 09:57:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Expired certificate https://git.openembedded.org/
To: <peter.marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 475EvjMq072335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 14:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202995


I've noticed it.  I can no longer do a git clone from=20
git.openembedded.org over https.  Can we get this fixed ASAP?


On 8/5/2024 8:15 AM, Peter Marko via lists.openembedded.org wrote:
> In case no one noticed yet, the certificate expired an hour ago, so the=
=20
> repositories can=E2=80=99t be viewed in a browser=E2=80=A6
>=20
> Peter
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202992): https://lists.openembedded.org/g/openembed=
ded-core/message/202992
> Mute This Topic: https://lists.openembedded.org/mt/107731343/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

