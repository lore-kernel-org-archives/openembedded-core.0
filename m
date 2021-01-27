Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web09.8986.1611760230782296524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=PRTBW+p+;
 spf=pass (domain: topicproducts.com, ip: 40.107.22.89, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqAAw5QjtqoxDMNN7DdzJQ8POI2SbHNF3Buy/wLtAeA=;
 b=PRTBW+p+Xye5nJRTF1BRk7qKUhGVeK+LIy7AO6yfWgz6N1JzG9gOI81T3CjIVR648P825C4xdd+lkLC5fyYXxKqUxIiKzhtrBLm+lwlCcKgrdsnwTNYR8Q5CEU7wgZIXYhV6YPoCcIL1WERirZSBj84Bsnit94QvVHAeGghTe/M=
Received: from AM6PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:6e::38)
 by DBBPR04MB6332.eurprd04.prod.outlook.com (2603:10a6:10:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 15:10:26 +0000
Received: from VE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::b7) by AM6PR02CA0025.outlook.office365.com
 (2603:10a6:20b:6e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Wed, 27 Jan 2021 15:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT015.mail.protection.outlook.com (10.152.2.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 27 Jan 2021 15:10:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.53) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 27 Jan 2021 15:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNkFRlU37UOve683Ch5hl1J2o4Yh5n+Nn52KofxCfegn0mMCDB2+KC7+5QqZWeVsOCd+Wx/booBl6fIpnE2sI1RS8h9Ca4KABaJrpjYHBmIfPoidH3rzOpdHL1FgtV/y7zCN8uwUz26hpJ53ZUcR1iFXjh3qRiDoqrtdHjd4zd9AwXRPMCTOE30WihIRjeTqKUZunDJ4HqyHWVwTF0vdyFqQCTbeqbaFqFPYc81Tw/0M9BbZKvWvZi1hF32+KWpq0RQdS0C2SWGpXHvsfau4KfgERhdUldy6EHa30Mbaj56aBmYHDWNYJiepupvOptp7H3oovycTLHJmMNn296hDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnETtUfUiIKwgZmY31XBeP47RTza6SPRD68WFllkWvk=;
 b=dN46aukbYteqD0sHzO+O7IZhqRx4KYgttsIgMl8F+Ck119IzduoJGMWrrH8lvKR8vzsOJgCBQIt+qO9Ea7xV4Pr0c/lYxcbPjXhd8DuWw6+l9wHez0avWc7EXKc1WwIyzMOxLAB0V8rIqcF1QoRRVCUO9VVLNX+vhPV0nekq6tVx1reD9LCWDR3TWSBCXKDTEQNufdp+TtbcAE60Y1afhNd1bUCNeM1EG0RhOY+X/mCY4y7N2tl8xVr1iYrjx8lnl/Qh/s8f/Q7jwhMVJaCo56IU/nTewiFuQ8Yz1TiAPYsD/21onjDeWWaEU1j0P27mBVGFGlq0/7d/LH8w5FCgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2342.eurprd04.prod.outlook.com (2603:10a6:4:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 15:10:21 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2%4]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 15:10:21 +0000
To: openembedded-core@lists.openembedded.org
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: GCC crashes on aarch64 since gatesgarth
Organization: Topic
Message-ID: <9fa11fda-4154-f371-2b13-06dc33e9ce97@topic.nl>
Date: Wed, 27 Jan 2021 16:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM4PR0302CA0024.eurprd03.prod.outlook.com
 (2603:10a6:205:2::37) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM4PR0302CA0024.eurprd03.prod.outlook.com (2603:10a6:205:2::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:10:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbf30b2-8f9a-4495-f0ca-08d8c2d5ad50
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2342:|DBBPR04MB6332:
X-Microsoft-Antispam-PRVS: 
	<DBBPR04MB63321443F78B8D4D57ABA81496BB0@DBBPR04MB6332.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lqKN3m+naPxio1MQJ7hLgVNrcJiJmgh4K64ttsfu36D157afalM1kvMk8Z/4067HEr736etr7GSJSZekGO9ZoVPqlTxJmS8S8FJ6hDpk/wce7m9ih4akrvzj2AlgFbiRbAwiwscTD+zKta/+YfixbiYrKlMMj9rVGf7hYLk/PXWxd3Zj/AjgL4QeggeN0Ia6rk6gPH8lR5pE0uUNLLc8cLGEVMeatuOsT0D0LWs/nCx9qlMC3n3j0AoUsTjuQ90RMkC3w93JQomzXCknGmplsGz3IGlkxmlM0ks6twcd2CI5n2VH0xIxLrYo8gMFXvC4t4wsNgM9qqMjvedtEUYGRFDMUpip0ZPenwClUHxJw9hOMJtvN90AFvY7U5G+j61rwnyHqs0/5YtBhgrqX0UtV4VzNkLsEY4EiszXiOtt3yHSgOOaJPsRjXVM2MpkCIItVnqDZPZ6LZJUoZ3xVbsDUu0dl1o2YEKewfVXq5woMa2R0LO2dFL6Htz6Q3ZAnlEQJxRp/MIIrKGrYVskkAUW0bxbe68+UAUq6YZr2pBsT3JlH9xPFNN++BrmXTtKke4M0xZvNu9tbMZ+Dkl/YHKOTVZI+G+TmpORZq1VVRdgePk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(39840400004)(366004)(83170400001)(316002)(42882007)(956004)(8676002)(478600001)(36756003)(66946007)(16576012)(2616005)(83380400001)(6916009)(2906002)(5660300002)(36916002)(52116002)(6486002)(66476007)(66556008)(16526019)(26005)(31686004)(8936002)(186003)(44832011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzQ0WXpiZWpDd0x5aVZLcjVvNjNMZ0tubDhKeGltZ2M0RlJhV05qdXdrRGZ6?=
 =?utf-8?B?V0xnSnpBaGtJLzdQUTBlSk1aL25TVHJ3TXkvZFVlTldBc0gvMGRWV3VCYTVm?=
 =?utf-8?B?eFowbmd3c0g0QWdTSURqVFo2Um1VU0tkQkNPTDhUVm5Gdnc4a0RPZ1Z2YWty?=
 =?utf-8?B?clNsa1h3cW00bzhWUDhHY1BLdVJqQ2Y0YTFFcWM2THVFZDhyVHVoajhGdXBt?=
 =?utf-8?B?ZUc1Mk9EN2RIV3lUTTRaOC8ySEdJTytLWTNyM3pQanJ6dmZPZGVIejVmNmZ1?=
 =?utf-8?B?RmFpZlpaVko5UFpZcjBJb09KZzUzKzBtU3lCblJ0MWpKMU9xMnNiSEZISjBL?=
 =?utf-8?B?N3BNTmEybG5wdjRBZVpVeUVBL3ZaM0ZTN1VWTWluWm44Z2JhSlV6ZXg5ekw1?=
 =?utf-8?B?UzhkenV4dm9YSzNIQWR3MnBYTmNTWU5CRzhhRit5U1V3QUw2UU9OUTFLU01C?=
 =?utf-8?B?YzJWM0l0SGdhSnMzNnJ6cmpLbHpnVENKWlI2alJ1T0NZL3RPZXMvSXVTUUYr?=
 =?utf-8?B?cVlSRUdOZ0lCZ2lKbmVvY3lOZ3JjZE1neDdrOUlZeW9nTWxuNG5tYXc1R3lr?=
 =?utf-8?B?OWUvWmQrdXdGaVNYeFJzMXo5U1FqYlVUOThJNnVYV2hUbzczWGgzVFBrOU1Q?=
 =?utf-8?B?R01Pc255RXBUQkpUWWROYjkzOHk4QkVwNUZsTTl3TEU2UXg2bU9FcGgvR3RO?=
 =?utf-8?B?UzhSTm9PQTVWMkNTaytLSi9rdXJBTnFyYlJEcGdnM1orajBhcmhVZFVRL1E2?=
 =?utf-8?B?MmxKVnZ2UUhsamliemlucTVRUVpnaTFDRy9wSkVrZlJKd0tSMkZHMXFEd0R2?=
 =?utf-8?B?S09oVytKcmh0dHJESHhzNXpvWGc3WGQyVldkRVNLM1BvN29kZkdkK01NWTEw?=
 =?utf-8?B?cmM5dUl1OS9oRE9XR0ZHeTlFbE9lVnY0V00xZWU1d3JZNUcwaTk3eDZ1ZzhO?=
 =?utf-8?B?SVBVV3VTRFg2QmVQdGpTck9JTkFqMTVtckw5cDRvSXhkb0pOT3pURUUyVTl6?=
 =?utf-8?B?UEp4OFozRDBBQmlpb0FETElzWFRZbzAzS2dySWU5R1V4Uy9OcW1rbTVXb1Nv?=
 =?utf-8?B?WElEUUFFSkFEV2FQdUdrMkU3TzhVUHFZbnJkdncrVjF5dG5LOG5pMW9iTlBx?=
 =?utf-8?B?WThnYlQ1R2pKWnU3TVFUdkZ6ZnN0UEl4Vi84WEx4OFU2SWZGdkdHdVBaTXpl?=
 =?utf-8?B?WGJxRU9xSUVUN0dKVjFGc0NneW03Y3F0ZlBQb01sWGZYbkZReFZRZGs3QS95?=
 =?utf-8?B?eDVpMlpoaHVSNEU1eGZCNnlxTUFUWFZTcUN6bWdvMkJ3RXBlSk9FSWNCL2V2?=
 =?utf-8?B?eUZDUkNiYUJ6MGtCTkRqWmVrQnlRYktjdndBeDFCK2xQVWtWTkcvaGxGaytr?=
 =?utf-8?B?UHJxZ3Y4MDVnam42TjlsS3BVV3NVbE5xOEo4cXQ0RytPKzdTdExaWnA2ZGJy?=
 =?utf-8?Q?5gAHuuwx?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2342
X-CodeTwo-MessageID: f267c17f-e320-4a01-9702-0a46ae8c6c9f.20210127151024@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a7f2ba0f-47a5-4f42-722f-08d8c2d5aa30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTA3kcINB1PxAhV6TpIj1yOsueBj9Z/yHYhvLKbhpJs/eMQUcQNAU7ryTLRzLaUZuRkbd/ZhBYuelY4qBRsLu9XF2kNEMtbaLi90UPS+EONN04/eR70hNBL/Rhg+OStJGhOPcDio61tehYTBsbzwnvorTc1sd3EQFED1rYPbPGpvUzLjmkLZLlNfzyfwBQuIaCQgbkTY0rKp1cCCnrGdVLB4AY6ZbRpve5q8fraXQge6OSngtB1ZhkZCx3+1tvnUPO64lPS9N94y30TzRtLdRTt4EEE/UBPyDxgkQsyPMoEOgY2RdNSZVIswap9kccfh1d0yrCVwiWoHD+W4npcBu7G0qPlP7gbFaUHG7WmS+kjODT5kP5KBXO1UbkaV8fH7JTEWaEgJNimvYtt94N1a4DDX6Nn4OCiX7NHbnhUxA2Vp8phyCwCDfaeMFegx6Wfs1VqGorJTUPISYcbWenLBwwUQeW4Mhnu2upp15NIQApB5rQ0RttNsMDLrDifIvpmk7Sjc43dz3CNU6T7QMh31idh2VTlDosNMQUv0G/afkhntcA55++GLMWNfrJHi67Y4sGkRBwPeMMFcv3kkqdQSyUXdx/ky7D7tRw/p7OgBJeC8x28AoDxIbha7Cx59KQdpLEMJ1rU+5VGrYAlS7xk3sgk58cGxcZa8BdfK4xFBblGlwEtRQ/hkA3bw7hk7CQ625ixKmV4j0cesfwk+T5bzcw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(46966006)(15974865002)(26005)(47076005)(36916002)(83170400001)(70586007)(83380400001)(956004)(8676002)(2616005)(316002)(356005)(7596003)(16526019)(44832011)(2906002)(186003)(7636003)(36756003)(31696002)(70206006)(16576012)(8936002)(42882007)(6486002)(6916009)(5660300002)(478600001)(336012)(31686004)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:10:26.3976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbf30b2-8f9a-4495-f0ca-08d8c2d5ad50
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6332
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

When doing large builds, the GCC compiler tends to crash on random spots=20
in the code. There are a few common denominators though.

It only happens when compiling for aarch64 (cortex-A53), not for 32-bit=20
arm (cortex-A9)

It's random and usually happens on "big" sets like kernel, openssl,=20
boost, u-boot etc.

It always reports "during GIMPLE pass: ealias" in the error, for example:

| during GIMPLE pass: ealias
| ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
| ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler=20
error: Illegal instruction
| 1239 | }

Compiling the same thing again usually goes fine.

I've never experienced this with the zeus and older branches of OE.


I've already tried upgrading to the latest gatesgarth status, and=20
cleaning out everything and start from scratch. I've also run "mprime"=20
test on my machine (over one hour) just to be confident that the system=20
itself is really okay.


Ideas to diagnose, fix or reliably reprodruce are more than welcome.

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
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
