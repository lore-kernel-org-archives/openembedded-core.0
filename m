Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web11.9841.1611763935822425734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 08:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=CJON4Ojv;
 spf=pass (domain: topicproducts.com, ip: 40.107.6.61, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heEE6JchhMhvyYi0siAusO98w/ILeTSOQatw+BitzTY=;
 b=CJON4Ojv0DfV0nZqVVHAj/jiQIVKaS3tyE6aVMvaF8XiRZjPUpwAQrmHMwjOSLlaJCqequ3dCTAhlpdUT4iZzCsbBuzcnPx6XtgzGpqtDTbiKE1bXPjxcX9ZLbabTy7yt3GpheqaAgpXdDOO0T2PGQaZ1Sxtx9Zu6X9Rt0Fr4v0=
Received: from MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::29)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 16:12:12 +0000
Received: from VE1EUR01FT011.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::fe) by MR2P264CA0089.outlook.office365.com
 (2603:10a6:500:32::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16 via Frontend
 Transport; Wed, 27 Jan 2021 16:12:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT011.mail.protection.outlook.com (10.152.2.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 16:12:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.59) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 27 Jan 2021 16:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxDrywLBXga/qm8wUtigfN98d7hN88oysOTtqoKHhRYYJF1hwuYyC0muHft2Tuu10DC5XfUxQncImCAWqf77NVXLgOMGgko3w3rG7hRBM84kqdAHWPRdbv14f1HgyNw4jjwdt+4FQqgwHg2Y9p8FCIPsXz1s4CgiQacC6cVLsseVsXaW/6ibBCZj+FB3gSxO/AuXCDj09un/n1/KAm5yxckvW7f00+KPitI1/GOY8W7yX+ll0CZf3Zrze8nlOcjh4D9fdq+VLT2eexgHt15w6siN0yQvOCH4+bGGL3uAYxunBYo0OSoNzeMgscotsxhFzjwbu7holW6qxXlKbjhD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffpIesb+GR80WO1CgV/dcKg0nJwYL31TdssZU5mZnIQ=;
 b=BBvnVqvn5hGlw+ZkyJFJqzy/st56eaXQQEm6JT5aBGSPYMAkxJSsuLtcKCPTmonQMaBOd6TGg+xOP63g+0oc0ZSLYatJ4AABkvVw1AIz0am8mwaqO6DwjQE5UlwwhZ+2Lt++vl7+sPAubDr0fezKZeP+a3GKp4hBRqqvJcy0Nz7svK8uclA4UYvRFq6m23OeOFkJxMotxuMhFAl7RI4z3WM2p783bnUrPXr/t8VVb8/GPohzNlM71H9UKMhbpX2IOIUKMdJrQlW6ASk96b7ZPHWlpNyXFGefZaM3AkDbhdFU3RrrMiIItiQ2kuWYhEhHiHomr4+HzkGHH8VE7O+Xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7931.eurprd04.prod.outlook.com (2603:10a6:10:1eb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Wed, 27 Jan
 2021 16:12:09 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2%4]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 16:12:09 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Leon Woestenberg <leon@sidebranch.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <9fa11fda-4154-f371-2b13-06dc33e9ce97@topic.nl>
 <CAMjhiJhR=i2ap+wMmLoqiYGNZSE7+VFLnFc1_oH-7p=yuRFtxQ@mail.gmail.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <76948e1a-7a88-a5ea-fce9-87b0fa9ebfc8@topic.nl>
Date: Wed, 27 Jan 2021 17:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMjhiJhR=i2ap+wMmLoqiYGNZSE7+VFLnFc1_oH-7p=yuRFtxQ@mail.gmail.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR03CA0042.eurprd03.prod.outlook.com (2603:10a6:208::19)
 To DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR03CA0042.eurprd03.prod.outlook.com (2603:10a6:208::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 16:12:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c924e430-602b-4a9f-a325-08d8c2de4d79
X-MS-TrafficTypeDiagnostic: DBBPR04MB7931:|VI1PR0402MB2816:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB28169F62A8CE4F606C67007896BB0@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G/GPXlrePAJxJjB+zl0uDJhVcl3x4+tEm+Phv7TFp2RONewlwuqfaeMKO5gkVsKNlIUgZK2rHL2BwlM99CzBfZ6WuGuPSJfgvRt8bMYvch76QuVCxqf4lnQ3A4eNgJ/0szKsJQTO6zaNgwsYQcPI2dSP1i6/J5jWi6RAt6U0+05x3um/oWAf2vtWP4A6ZFvCTWH/XAWIwqMZ6zEBtv8FVo5ohFnBZxkjo8dfdLXQcqreCPUfi6RUs+fhMsPjZvKpGcmx4cT8VkSK3tj5KFwbR9i0O+zcQ6pjOQJQhq6zpgrYqljiYac6f66jCFM/c+d/mgAS+DoD7oEhXC7I5njImwVIO0cV4mtyUMEPXWNAiBWC/MwHCnqHfENc6ryxB0wxjGHl7W+37QcUeoPPfhJ1MuAvFkAcWkmBMspUJprOKM5RNwlANij7w/j6/KUOON8fkgQKlTKwMg8fcj2Lj2ZqCnKQEagXGKVmrqNq5htoW3cILX9A2cmMKdnyXRRoK3VvFXt7z74frGFpxDiDfy/Cf8X7XJrz+YlG8nf0lboFn0stjB4upQvpleBhT7pm8H3lHpB86cmiYOshptrmq5cjS2TX+QKO7078prEh7L9kBlPjX5P0qyL8VhCxWj86UkIMpGqOsWnTZwguK771qpLp9Xo2xQoLG0qvIUfpwmknLnNVlP1VZFSfPkD5iJJExBao
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(366004)(136003)(39850400004)(6916009)(6486002)(83380400001)(44832011)(15974865002)(66556008)(956004)(966005)(478600001)(31686004)(52116002)(8676002)(26005)(16526019)(8936002)(186003)(66476007)(16576012)(83170400001)(36916002)(5660300002)(31696002)(4326008)(2906002)(2616005)(42882007)(36756003)(66946007)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFhEc0RyZldrT3I1WFpCZW1QT3NpaDU5cC9nUk53NjMybVB5RjFUMURCS2dr?=
 =?utf-8?B?MkdnV2Z0T2VTaXVEZkFLdEYrUGtQL012RDdxamNCbnUyMTZnbGN1OHZocFpw?=
 =?utf-8?B?OFIybHVnV1ZYVmh0Um5abHVHWUdZVW5DOUIwRUNxbFI1WkJGVGhCNFJPL0NH?=
 =?utf-8?B?NjRRVkxTV3VQUVg3dzBRR3A5QUI4RWNBYlFqenUzbmpVdWdlYXFLNXRqS09O?=
 =?utf-8?B?ZW1abXk5Q013U2ZGRytLUlJkZHB2aXdGZWNwVjdRVnNOWTJOWC9iQUFseHZw?=
 =?utf-8?B?bjhaclhrVWtJUlJvSjU1Q1RHS2thYk5pb1o2bnl1UjF5TGFMZEs1RUFjQXNB?=
 =?utf-8?B?djBKRXYwbWNVZHdnZW0zUDh4am5JcUtyK2ZBT0huU3lSU1JtaGszbXYxRGNO?=
 =?utf-8?B?cTZWY0g0K0RFS0hZa0hRaDg3bkdTRFl6cDd6bUhJSFJuQld1MXVMYWx4Rk0y?=
 =?utf-8?B?SDdXaVVjSno3VFJjbVpnQVVzMytQVU0yQjA4aTYrek1HdFdxWU1FR29CRHRG?=
 =?utf-8?B?VzhOdU5nL0poczlaNlhnZHAzWmJiYi9WWUtRdjYybk1PQXVySlpGQmJHMlFm?=
 =?utf-8?B?ZnV1SzJMZE11Kzh4YUlldFVibjg0aHRpOEw5cDQ0VHhnS0pBUmxZbjZsazJJ?=
 =?utf-8?B?VFZwVGRCREErYlpkTTZ5UHYvQnM0K3k1STZMWVV4cXRxbVlXa2pCZlI4bmZl?=
 =?utf-8?B?UVBROGxROThjaFFZdkFFRTE0TC9jYXNJY0hJOWE1RHppRy9lSERNUmY2cHhV?=
 =?utf-8?B?S3l6WU0wdm5uREcvTjZBZmdXN1paYW1uSklyYUVxeHAxcXZXUU5CZzFXZVJN?=
 =?utf-8?B?TGNZeCsxQ0tMNnppckVqaU9qa2xLeGxlMTI1Y21kcnZaaGdXK1g2SkZnYlNM?=
 =?utf-8?B?UmxTTGg4S08rbUZmZ1lyUG95Q2RoNWU1VnlqQTRBY1JLeDk2Tk11bERaazd2?=
 =?utf-8?B?NHlQNHdTc0Y5RklTS0xINHNBbWFDTXJHTVFXQTE5cmYvZG9Xc1pRT0hDbnBI?=
 =?utf-8?B?NUNadnZBZFY2RWUwbThCdGZzM0JzRnRVVEppZHpvME9DMGFZYjlxMDdCL00z?=
 =?utf-8?B?STZDemU2WWN4QTNtRU40K3JpUU11V1orWmhtSFhPdUx5RG9YWDdOaWlMTFhQ?=
 =?utf-8?B?RmxVeFNwTDNvdEJQSkFlVUtkLzQ3VEYxcXdMc3BWcnYvejhvcDhxME53Qjkr?=
 =?utf-8?B?cERVa0dRVTE2WXBCbm9ROHpUT0tFTkhHR090bnpCeUZacDliRnhVR0lwSjh4?=
 =?utf-8?B?cmFqQWhPQU5rZ1BONVhVVDV0Y1Y4dUFUWE5ZWXZxby8wS0ducGRIQkpQeGRX?=
 =?utf-8?B?eUM2Z0tGSFhmMjFmRXlUMWFDZGxQUDdmY280TWNTYW1PZ0g1eXlmVU45N0tp?=
 =?utf-8?B?ZnZ0NjJtdnM3SStmUEpycHpZQ0oyeDR5bEIvUTdZNmE4TkxyLzhBRHgrb1dr?=
 =?utf-8?Q?G+m8AkdN?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7931
X-CodeTwo-MessageID: 0c9304a3-a8e7-42af-be56-5d0f139d5b64.20210127161210@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT011.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d18a46b6-f054-4fdd-250a-08d8c2de4c0c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iaDbuv822tDdmpeRCn1dy0rwba4fQkVcia1Y/Vv9+qqsrYBd7wNJrkQHv/Nha7pKsLjnmrD7eO0y988Bl6jUwZmbmzJvL5UtvnYgbUBoD9e+F0gbiRWQj0HqZJHfk5rUj8J8MqbPYVnxO/gnae1OVS3FNXBWIyRxysrdJMVR3ucqwyUv46qSt/sgS/x7JtzZ9YGp9nqMZPpqSSFFs1PQhbI2Jxvtjddy0rsiG9861NbsYtxbUdTZG0f74uq/mPHHyntBkrLmqO09c5FxpxgKcDiFlQVezyvrfaYuzyeZinHVjCDKQ7UGFJO1Ir9FcmrTtm3v6y15UgKI36qa4xAmCcVGMwvBG9RflR2coxSHJ/0+kabOpiKdRgUXWfAK9yJfTKpwRyqY1WGkkLNhwocoJg4efdwLcubAlWD0I9D0rryapAJP6ZuhtT3FpdA7wC4ruRXUWjx2v+Zb/ZZ/mcWedia/UPv89Zm1dVgF7IBJodx0EVkNapygC0+v/ohyXg1DxTMx1cLeQA7uHTkesSvz1Lto+iBKiJVWw1t1GjXCkE4aCX/onAeT+RAjLFOl6EOeWabewEX50pIR1Eko9KCqU+Z+5b+tCHm1Dz6Hiqi9BMZxxPX6lybmWzJ9XZ+f8czuLKYomNWTd7rsF4sSG2MX3LW1hKDHHYwuAHqNH4128TVgQG6DTLIb8mEz61BzYWOWrYG/4kGaXHlL09P2dVgJrw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(39850400004)(46966006)(26005)(16526019)(956004)(8936002)(336012)(5660300002)(47076005)(53546011)(7636003)(82740400003)(83380400001)(186003)(6916009)(31686004)(8676002)(44832011)(2616005)(2906002)(82310400003)(36916002)(316002)(70206006)(4326008)(16576012)(70586007)(966005)(356005)(83170400001)(15974865002)(31696002)(36756003)(6486002)(7596003)(42882007)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 16:12:11.0521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c924e430-602b-4a9f-a325-08d8c2de4d79
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT011.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topicproducts.com

Please consider the environment before printing this e-mail
On 27-01-2021 16:43, Leon Woestenberg wrote:
>
> Hello Mike,
>
> At first sight, this does sound like memory corruption in one specific=
=20
> memory area (DIMM?) to me.

On itself, yes, that was my first thought too - hence running memory and=
=20
system tests.
But it only happens with the gatesgarth branch. I've put loads of=20
pressure on this machine's memory before, never got errors like that. I=20
sometimes have multiple OE branches building at the same time too.

> Check dmesg for tripping temperatures etc.
> I would reduce both the amount of bitbake tasks and Makefile=20
> parallelism to 1 on a fresh run to reduce memory pressure.

Reducing somewhat, e.g. 8 each, did not make a difference. Didn't want=20
to go to "1", it'll take days to rebuild then...

> Not seen anything similar yet (MACHINE=3Dzcu102, build host i7-10700K w/=
=
=20
> 128MB memory.)
>
Guess that's GB not MB :)

Mine is a Ryzen 7 1700 w/ 32GB.

CPU Temp doesn't rise above 70 degrees while building (during mprime=20
testing it got up to 90, still within spec)

> I would assume aarch64 is widely run by the community.

I would, too

> Let me know if I must replicate a specific set of commits.

Don't know what you mean by that, can you explain?



>
> Regards,
>
> Leon.
>
> On Wed, Jan 27, 2021 at 4:10 PM Mike Looijmans=20
> <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>> wrote:
>
>     When doing large builds, the GCC compiler tends to crash on random
>     spots
>     in the code. There are a few common denominators though.
>
>     It only happens when compiling for aarch64 (cortex-A53), not for
>     32-bit
>     arm (cortex-A9)
>
>     It's random and usually happens on "big" sets like kernel, openssl,
>     boost, u-boot etc.
>
>     It always reports "during GIMPLE pass: ealias" in the error, for
>     example:
>
>     | during GIMPLE pass: ealias
>     | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function
>     'do_x509_check':
>     | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler
>     error: Illegal instruction
>     | 1239 | }
>
>     Compiling the same thing again usually goes fine.
>
>     I've never experienced this with the zeus and older branches of OE.
>
>
>     I've already tried upgrading to the latest gatesgarth status, and
>     cleaning out everything and start from scratch. I've also run
>     "mprime"
>     test on my machine (over one hour) just to be confident that the
>     system
>     itself is really okay.
>
>
>     Ideas to diagnose, fix or reliably reprodruce are more than welcome.
>
>     --=20
>     Mike Looijmans
>
>
>     Met vriendelijke groet / kind regards,
>
>     Mike Looijmans
>     System Expert
>
>
>     TOPIC Embedded Products B.V.
>     Materiaalweg 4, 5681 RJ Best
>     The Netherlands
>
>     T: +31 (0) 499 33 69 69
>     E: mike.looijmans@topicproducts.com
>     <mailto:mike.looijmans@topicproducts.com>
>     W: www.topicproducts.com <http://www.topicproducts.com>
>
>     Please consider the environment before printing this e-mail
>
>    =20
>

--=20
Mike Looijmans

