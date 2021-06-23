Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web08.7395.1624454576907853709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=URITuT0X;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.80, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19fyGYdFpB2HpZjNfG2PXJsjIExqETtxUBfBF5n8lSk=;
 b=URITuT0XfFtiMq/DfCvO8OttpAX3ifWUzeBP0YzbCvla8RqrsgO+fE/OOVgYSS23qqSVxg5u/iXwX7OIxzUuNkFtm7T8u7rQzuCF6/qXtwPEa/MFzZhj++BeshsSApb2GljLFzzr1EojZ1N6lF/gajOMelDXuVe8EAVXnwdV4QA=
Received: from DB7PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:10:72::39)
 by AM0PR04MB4900.eurprd04.prod.outlook.com (2603:10a6:208:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 13:22:53 +0000
Received: from DB5EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::94) by DB7PR03CA0098.outlook.office365.com
 (2603:10a6:10:72::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Wed, 23 Jun 2021 13:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 DB5EUR01FT037.mail.protection.outlook.com (10.152.4.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 13:22:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.58) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 23 Jun 2021 13:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajf+bxilhY9ZxrMtGmUMQFOcq6yRdMEBuBRGzboB+AE/ww3OHhh8u/zZDTXvqhtlXoYVLgdPLHxtcQ2Ybea+FrpH3xykEVFOYL+/DfNHpJdtymWfTBTkraggiCSaySF6RY6BB/XnePfBA4cN3yqQeMb2GnewHBHZ6vn8WKib3iJaLq+ekqSYTR8MFv1pVUfn2Y9HmCcYqGiatILMQz7cU5W+l/zl1XC1P6GPpXulsJ9VMsIP3c3uQODwErpcZYUkE9A6ejp/RtsvjCQDigEIBtkisIvV3/gnTZkAwtMv90kjW7RFHdrXwB2Q/5pzsoUXypdmkrx+iT7W5/8CD+G5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpLYP/D93pTK55hxGjXP3TOVH4WeHV88RGO619Vokd8=;
 b=VF6hOw8EcHJSMtUnrLgmAE/STtSnjF+Nw1ZMW0W3k0g4WAzAhhMw8wSXZzsFMh6GZB8GvcNktlToAuMshxRjZFnp1w0tz92xNK3l8jAGJmg4ZpNz9PoDgRlBb+RhxgYQ1PKOSQoxBIgOtlW1q2je37Dj3FTRwmssbDS0htsNi5zRb5RchHdAlvoUfBBKKqgk+s7/IcfOkgS41FHw0HZsAzAnKIpm1Sts2JJ40Ikdaw7l9TpfOI85ogyMaqWcc0JHLkTYkGoDkgn+z4zunXaV1G5iiclnb5D3JnGfZXqWwioAYzbTvXFay2NockbyLb7FfJzZDYvK3j5DiKi56IZvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 13:22:50 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4146:176f:d6ca:6321]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4146:176f:d6ca:6321%5]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 13:22:50 +0000
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: Using RDEPENDS or RRECOMMENDS inside a kernel module recipe
Organization: Topic
Message-ID: <12aff56f-000c-64c0-8578-f839642b480e@topic.nl>
Date: Wed, 23 Jun 2021 15:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR03CA0098.eurprd03.prod.outlook.com
 (2603:10a6:208:69::39) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:208:69::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Wed, 23 Jun 2021 13:22:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80ad504-9782-482e-0ff8-08d9364a01a9
X-MS-TrafficTypeDiagnostic: DBBPR04MB7740:|AM0PR04MB4900:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4900E06CE31841A6EA0937D496089@AM0PR04MB4900.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tSStv0t6BY8DK9G0L7gf70/TFM6tq6qZ5EL5jwEjYOin9x5KBg4HoppK+DoqC3OT8zocx0StJ6zJdrtoLD40C65KLVX+MovY8wqq3NYdPpf/sYFs0CYvpr0uoSDJJeCfjatgvzd1/gfUMdJ3LNCpLeZSH1HrQUDEJIEG9K0FHcCeaPJaWnZG9hW+ygmaRh9bV1sBxMhmXKKv+jc49luSA1xf9KIQEQVcrtZi2xelbXH3cj5Wl6gDaEebIXDQB2aScAdiwTNqQymY0MoM15JjbkXg0Pc5Giila8ildKW4oFyjJL2TLfOCNUuoOJ4yuOOZCvTPNIeKcNKrOXcwdD/BMMu43x96wC4ry2x7dxcqb5HhFFdTLAWfxzU8curN24RDe8W6gSijxwetFD4V/POEWdi2q8b4x9MkjCMRoimg/0tCdDctLrB+xS9v8YAgV1HrTo5enYpK1fkQrdGSzWeuHuntj5CYkVeIToOug0Lr6Q7wtkGahlM3QnkN2pWwQtICtWZDUsgLoCL3CzW3SW25dKM4+9TLx3ZD2dL6eUz1lGO2UD66Sv7+RUsGFAbGbwi2jTvejmmbMW5/huulrcOx5nh+6PBBFug0BB1ISnBSYGjDHFEfvHENxshU8W3xt0luprNuRaN+V5VrTIHR6PAmFSiajFnz2D8JmuIMUN3HQ2EmWudgNjPae7QWi/v0z3uYTmEd5tMPXMsr6TXWL/Y3bKwXxmbdaJftJCtf6IjWUnw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(376002)(396003)(136003)(366004)(956004)(2616005)(42882007)(31696002)(44832011)(52116002)(8936002)(26005)(478600001)(38350700002)(38100700002)(83170400001)(186003)(36916002)(36756003)(31686004)(16576012)(16526019)(6916009)(8676002)(2906002)(66946007)(66556008)(66476007)(5660300002)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?It8y3FfxBadG1+0YGiPFgTTOVDlhXW5bDWr6TNUnWnmaR9T1qSAXTXbeguIE?=
 =?us-ascii?Q?dGRutqbnfWcpvREunFGEvTb/laeTCoBwDClzFuEHJ47dbb3UiGnt8pg/BF4f?=
 =?us-ascii?Q?nwVl3Jy0RlICgEFhlVwt67l1ppAxyc9Uj3UuChY9VlNvLFGI+B5uSH/o/qPe?=
 =?us-ascii?Q?s/tGISViVcGsfCfS+XXkC8j+xamgqsDKL5bN6irPbqEYn0Yr+vHmkYxkc417?=
 =?us-ascii?Q?S/6xGPYuMTHukyn9QY/7MVQCm8WL0IbikRIG/2qZExf9Dq6bvQ1d41011ZFR?=
 =?us-ascii?Q?8JCBw2mVpzAI1FLHurAiQs5enjvG0hgMggrvLKvnF8Z+35UkozzNVtBFi9ny?=
 =?us-ascii?Q?cdLPLVGahbxx4fwqBEnrYAJEIavmOudBK/7V0pKDPvgMvDXdgXejWqOyxrYp?=
 =?us-ascii?Q?4a/KxWHKoyOlpL0CjOm6UdVNtZIDwOY6+Qxuuc0WkV6jCPie1D8A5DfaEW0R?=
 =?us-ascii?Q?baNvHYYhoyeA8BF6Kt1cThv3/Y2F2D7Aejtx/vNEYMOrn5dpW0BPZMnWxRUw?=
 =?us-ascii?Q?ofL7Qx0V158JKCBx0fjvzaeqhFpYKe1tie1wYu9G9izxIX7xdiC+RLoMsL9Y?=
 =?us-ascii?Q?fvymsFMTeJfwF1QC3VUz0y9RrMKU1r1UxCKkVyigpQOXhxBC0OUrmzSx3Sm6?=
 =?us-ascii?Q?VTBHb/QZ5IPcj6Q64Rw8Hf+gRjim2ujZzwWqUydWsdAsj2TL/LDk8P43mc/a?=
 =?us-ascii?Q?RbZp3BpNfwCbUIRLtizXbfQba1q8AW13Z3v4oEYmmaC6wElT8xsSDidFvaYp?=
 =?us-ascii?Q?qVS/TkHyeR8EMHwuB9UchWGDsqVZdXHq1ODV3fcXF9kt+mUc4L/TD3pzAp05?=
 =?us-ascii?Q?9ASlWrc2Ll0YV2k+ujNYsQTT9XE/3CYTm0gan2kki2WbH+ZCrq/wfUrijNTs?=
 =?us-ascii?Q?2cpBkcZylPVMG/A1RO5I/c++NuXfWQaSnXmMxNsMm4lg3uKs7fpbtZV4ciID?=
 =?us-ascii?Q?93Y1Olb6NoxEeqerohHjHcE7wiT76UkgDs2aNZFUHwiCeSw9k0dgVQYR0TgN?=
 =?us-ascii?Q?rRG6wMFPuorlrLgbvcsrK6/AwyDpb1cWJgJQMM6YrzKBKiWP/+KdP57fbFD3?=
 =?us-ascii?Q?ex51tWTeKAugPy7BfDn4qIAlom4mlyYPWolLTnwpnPMB61Mkk/gWaVKkGbgn?=
 =?us-ascii?Q?63HUyaM4O4vw2tPM1VzqqDFFHP/lBmBCs7CtW/5FUmuz8fwOZFoAhmSdZCxt?=
 =?us-ascii?Q?4N/R4z5Df+b+kWPwM8fx/Y7HpHPaAc2yKlNgJEE+2wgbGyezlOj5yAm3hKi4?=
 =?us-ascii?Q?XIntveo8EIh+yIJhWXjemnQZIPrFupHz4i9rJIGH8xQZwEXAXVY3FWCreoip?=
 =?us-ascii?Q?CriKjztkrAor7hhc8B+EeFiF?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740
X-CodeTwo-MessageID: f6d8374d-db56-4443-9f92-78ba0aaeae0f.20210623132252@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f27afeb7-e29f-45df-b516-6c058e15adde@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.e9eaa89e-7e17-4231-9d9b-986210f14e42@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a74c8a72-5b23-4eea-24e8-08d93649fff7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	01dkgKV9Wig96CRI0ksu5dmkpyfTFDjCZS1awIoKS1jUECIHOWvs0gwnEPSAI8nWkiAWPjtOSsEJX/lx490G/v3u96pGObA0AHdwJZXXuVvqW1y7q/jGhoHN58Qn/NJ/9a+E/ACn5eGY26GdBbTymsf6hVKxpWpow3UyLtABh2a1N56ci8Kik9qu3RBPExeieCw1F9MBlFqcPWj64n6cDWzFY6SK8Zj2HJ74nkjo+n90JiL19qKkidTi1Sq43yGGGcZl/FClSs1ye9ZMst5myDHRIF4djaAY+H5LduMhfk8ONbNkhtzTw3G6mGM+o8oguhmm7HBAc/jALxGHgS6RWwV0PdBAnB7Xj0h2aUguJw94SuhqTccEJogsqmoe1Xs7ySb3DEPK8bGHl1LEimvE/rLEkbWv3Ot3/LtkNC2N+WVc5hcNGzenMS08ZGodKwIFSk015Ei+IxTj9tlLvJLdf1V4SEs1dyk6OlL5o3xqRaZpoRzgqsFlKmVF/2tigVvXRix7bAKmOA9qVbwoLrLRM/ad28pPAy1TU/gVsWRfHSDI2WFeqcPT2IQQAAF8h88e+TdfnF8KL+JDEgfdcFOBpzY5m6MGdLALTvrNXx4ONys3HSCy2pthVrNLgr3PRShHR9i3/D0qGbaU3HD66EgEFsFTQB/1ewtKd/sfTkbdyIidipCsXo4O/gJDPZ3CD3u6RPURf/ZHiu8SipKsXxPxwHV5usqWaLBA6qXv8dAYHtOaLvaYsbndM3mBSsLsA+vexDnNP+Nfw3M6gBRk889TDHXGL/EvyDOArp5oYPaFnD5m9YlEXHxtNROD7oEhySTm
X-Forefront-Antispam-Report: 
	CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(39840400004)(136003)(376002)(396003)(36840700001)(46966006)(956004)(2616005)(82310400003)(336012)(42882007)(31696002)(36756003)(44832011)(15974865002)(16526019)(83170400001)(36916002)(26005)(356005)(7596003)(186003)(7636003)(8936002)(478600001)(31686004)(16576012)(6916009)(70206006)(47076005)(8676002)(2906002)(316002)(5660300002)(70586007)(36860700001)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:22:53.1923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80ad504-9782-482e-0ff8-08d9364a01a9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4900
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Simple question: How can I make an external kernel module depend on its=20
firmware?

Suppose I have a recipe "kernel-module-something.bb"

Now this module needs firmware to work so the recipe basically contains=20
this:

inherit module

SRC_URI =3D "..."

RRECOMMENDS_${PN} +=3D "something-firmware"


What I would expect is that if I add "kernel-module-something" to the=20
image, that "something-firmware" also gets installed. This however does=20
not happen.

The "something-firmware" package is being built, but not installed, even=20
though "kernel-module-something" is present.

I think the reason is that there are two packages created, one meta=20
packages called "kernel-module-something" that indeed contains the=20
dependency on the "something-firmware" but does not contain the actual=20
kernel module.

There's a second package named "kernel-module-something-5.4.0-blabla"=C2=A0=
=20
(where 5.4.0-blabla appears to be the kernel version) that contains the=20
actual kernel module, but there's no recommendation in this package at all.


How do I properly make it so that installing "kernel-module-something"=20
will also install "something-firmware"?


--=20
Mike Looijmans


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
