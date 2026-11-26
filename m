Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1091.1795710516956036552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IgQE+h+a;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IgQE+h+a;
 spf=pass (domain: arm.com, ip: 52.101.70.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ASZw266nVBAGmVQOYPqsD2sWXWNk2xxv29V7tLdsrABXjAf7hGaHD48do4UYmNSHFwES74cjAVeXDefd+2lm3cXWydMAVa6T3t8Pup+8Xbne3z8I5SvPyjzw0JmnLUit49IW3gT8dzJ4lNW66mv76xH5BjJKw/OhYZQPyVSmxEyYivWkFZs6T4ybo+tKUtQvm+fx13nwXKABINJoDcjDtWtcMAntUfO7N/OM2juOUKetDSQ2Md+SngoFP6vIu5xf8AiNokSqboNeptgXXhamrkJrpELsqwoDRmPkFdNUhHstxagtcU5rmdZ5u2HB9h19ls6fhS1wh5VYN6Q2G4NvCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w03Dcz42eBobO0dOZOxNy/ab7B3CcxUtTjt9hXGRpJE=;
 b=ycBd94CBnLW1c7oCsewlOcgHC81iTOoJrpayVVMSSjHwNxTVN8w3XgTSMyYSbG742VZV1+6FdwrftC6gVOH/3igxVhlGUMSmw7AjKHBNSIi9L4sgrmDfImXXrwP5cXSTCh1CxeAUIJC9c1q2ffM4LNGNCLHEoMz6ZveHU7MUbh74fppDanU5JobUXzMg5ajbi0j6hShnehbJbPZBGsFGSN2y4N3ds5lVMPyF5pUKptzn+wyI+yEKdffG/X4lhugv+7IJiLgZJhwHMhX4lTcamswL9wcgqNh8U7EQ5cs5gsiKAeN6CYQ2XNwx9NH3XHvwe6vhpFsO/qRTLq1yGNy8jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w03Dcz42eBobO0dOZOxNy/ab7B3CcxUtTjt9hXGRpJE=;
 b=IgQE+h+aE/Mdldcf+pwAWNOnAiAWFNpx/rL4wQBtIUQDwEr/79YwOmHHuoR0adYx3JEirbmN0mjadnKjxUdxsVmV1c/9kfJfp9PtisUAU6RfbOZ0f6soVns1EFjs7WbmYXaw/TONZuK58yM4nIkU91KzT1IHUf4CLnFN/AgMBnA=
Received: from DU7P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::13)
 by AM0PR08MB5412.eurprd08.prod.outlook.com (2603:10a6:208:186::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:28:30 +0000
Received: from MAD0EPF000008B5.eurprd04.prod.outlook.com
 (2603:10a6:10:552:cafe::1d) by DU7P189CA0022.outlook.office365.com
 (2603:10a6:10:552::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 16:28:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008B5.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 16:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdFa4/ZY2BrZfPP4CcF0N8l72/ZJY9SwVhEct1JOJO7PXJbV/apa8tjE6OSnQsDiQl8PiQzW8oTzRPQW04cPdHvnMqzUt3QiIBhl4gRqT6uXDdfzMDl/q9vtyC+sg5dVhg2Wywhzn6vskHjQ1tMqwS5XNSmYcdWTQvAqy9rwNYIBROUgGQ3p9/EGUO/YZvzj+tLuj/gfgmIn/4ItgIn0G4ZfIwYVwIg/5iZl1tGWeK7NJw0sb6P3D9yA9kicJ542qx+xMNVWocFVyhn1YomSgPpkg4PTMszTYuyaiaWfzWWW2YWktbUUq9/qZw7laCSg3E5tQFXTNWxsBKYwugB0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w03Dcz42eBobO0dOZOxNy/ab7B3CcxUtTjt9hXGRpJE=;
 b=zDo4vaOlc6qu7Ytz6WduC/PDpBbkjBfSBQl5yGZ2VfqOR/Sfxd7cnOczSPS+ZtIObobxyltDGp3rZA/rUC6KBHouNYnTpN2bXBrfVgWc7ZY9W85wN7m3nf01zsExQwFlRtgp2WGq5V7I69sJgPMygCMK2dnt7o3RK1HL8msHcGUgElIvxoNoAaDJQUo5/gxGDDLUmrPd2I/h1LdTNJMY2GBVYj/4Wv92NIuhgrL0Js0HgX+vLRDRTAuihu5QOuwI08w06h7LTHnRGUKhmUgifyw/UOvp5Y9+iLd2QrJdajA+LZsIMBcgFgjBRK/q1MFoYK80TIBBrE/iTUgJGk2HCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w03Dcz42eBobO0dOZOxNy/ab7B3CcxUtTjt9hXGRpJE=;
 b=IgQE+h+aE/Mdldcf+pwAWNOnAiAWFNpx/rL4wQBtIUQDwEr/79YwOmHHuoR0adYx3JEirbmN0mjadnKjxUdxsVmV1c/9kfJfp9PtisUAU6RfbOZ0f6soVns1EFjs7WbmYXaw/TONZuK58yM4nIkU91KzT1IHUf4CLnFN/AgMBnA=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DU0PR08MB8044.eurprd08.prod.outlook.com (2603:10a6:10:3e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 16:27:52 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 16:27:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/18] python3: fix packaging of
 libdir/python3.15/config/
Thread-Topic: [OE-core] [PATCH 01/18] python3: fix packaging of
 libdir/python3.15/config/
Thread-Index: AQHdfPuS5+x2E6DB2EOND9f9qRrn/rc/7A8AgACgF4A=
Date: Thu, 26 Nov 2026 16:27:52 +0000
Message-ID: <3B0D8B0C-3116-4457-8BEA-17E4040BAB21@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
 <DN4Y1O8L620L.BPN15JQFEOTB@bootlin.com>
In-Reply-To: <DN4Y1O8L620L.BPN15JQFEOTB@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|DU0PR08MB8044:EE_|MAD0EPF000008B5:EE_|AM0PR08MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: d867c382-223b-47fa-8b6b-08df4bda4e6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|4143699003|10067099003|56012099006|261022075727099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 4tcgHfSwaY3nkj8ovpaWGkaBEnzCTKSkiiQe3ZJac34wqpOcgeuGcDi1eO7wizFysYLwJva6pnnwi53vlYTBtjwQXWnXgcZ9uWI2C1PPSdnRMF2cjwYHXG8XNqHlNT5lQKddarPo7SJqALawNalPfhfw3IsJ1Vwqwi1wjD9g+84IXmGBug/Q9hQFUcHj5IO8lEOcFForZN3FTgSEtFpSFupLcXxrPQhFnPOP+eF/tS5T1kopt10vR/yY+9DFnGngwRF81HrDP8QqtrgIRx/IrBHPQ8wXUV5L/NXKoqes7QyfKBXt8y+ZQMKM5E2aAVOioot1JjSPcoJSNypiMItVPGS6v89DvDFmKUhlb16hD4tGdNlCvIN50C99sjCJqO1n0ukEPd2SSDoqxoevb/bDTPJztFHeVK+u6QuVgP+dI8Dg4qDvMQVluI/lHFUMLT1pO9q2aEvpubIT0UitRsrgJdNjf6VJZ4M4CoS9THPMT0XdvTYYrhioPZWceKsW8ODtbJYmK7IqzzE5hVEmWwC2XvLoVGjsRvhRljzQxb4j+T74xsx80JBNuQB9ViNWLRjPjFuHEQrKvUSBNOd/+TbKirnbfoA9toQHqcJtY93EW29IUCTkb4x+5vm4tZBYea410Bo2PP2lyCMtM2eKfdmvJ7bcUz0na9RMh45DJarNJIJk7bMMtb+CFCJ5QizrWlWjnredKeEP2cVIYXighe0egEAqBkoiJC5RFI9D8ukEhmA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(261022075727099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8F6F690522A6459B4D70C70E29F3C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fT/CRtpV/fzyWTZ5PuClRGk08eNeMEp+Y6gz8hL74SXW4W9STvwBtnkC82h16bsBm+OCRW4F4Mp4gpb54DqoHaVWCRX4EovtTEwI8AFzHfNe6PSpOwmdwFPF3b3nm0CQKE0b0kVpAbbGTObQgDkTuDFCb+vy+x7zk64AocIGnnc8g2fNRAuHuHVADcyVlgrVYU2kaRJGThezLd9jZcDOyTS+Z6rRWvpVeMRf8lVHbRBACqeqc8RZeCIuyo+kyqgpOd8PRPFBtoDFKEN3o4HhUvCTy3YOC7eyWHJ8vI2Q/OsYzqBOISxHPK3G39tFPERHGdGPqnfKvLc6Fu59h89VyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8044
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MAD0EPF000008B5.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6e1188e8-2b2b-4080-1ff4-08df4bda3806
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|35042699022|23010399003|14060799003|4143699003|22082099003|18002099003|11063799006|56012099006|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: MaOS9vU7BdKHkHMZGEcXkp91THS+W0EXT3W1GqKuUeecJS71lTD5v74pz1oJkg326MCbEINDQRU28V28NrU9soAdvek2OxOPkTOoAcbp2B2J5yI/KzTSbjCYOn8tgLxamyBVT64vgsl5dckhm/2VIB5Ha2pXX4uZJxMhkpD1VDSKrTJUPrJOrO/tHQSpK+wuFAchlA1Wtu+JxNfBPXjvYOAYt/cxzyyqk2taIvrzUxLiWfe2XbdVID3IRtcVV8wfNMBai2vzfDls2eDcX3hS+9WnaLrrnfZ6SWJxBHxYeL7h3jlyz2Vv4/OitI9CDJoIvJa/19OYbzeTi6CXntirbfah5tPYBmDdFuSYU8oTCNl9/52RwyOy5TrySoSlPW/uuDa6kwbjWexTdPN2Z0dwN4Yt8lpl8/Eo9Bwd9MrMCWe9mQFIqCEoDhw5t/+hInxlGS0Q0NlmNoAPObd1KAIDOPs5uQssV9suyMuiB0RlDGs44JGUooK3LV8ozGb1a6eyfvOUya/237dGQO5nG5QFvfBge6wW4/Yx1fvMosMvKm3jhMFLVroLnXTBzqreAd5VFKibdWPI47EcX+GVWU794ggay684MlbWrCnvUwhgunzg/RJHdSj76n7XnD0QALq5wh5eW4YpepN2GfghndC2h26TNt+P7n5K61eyO9/229cuiowuHLNerEkStIwEQUqNZ9M7OYYLm/MjTl3sY5KBdQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(35042699022)(23010399003)(14060799003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lz0zAc3kP/yp9lokrSzohmNsWbajLTEsPW4vmMjD5cA3LgLXLX/OzyzsrkCKJFljSIPbWpp/bvgeMRDmhI5Z2ARpc80TAzNSiMWJczluNZ94IRJxBLgCNqzkMyOvD3bRgSbY1uMQXgKTMIhgfJ7RHJfXKbpl3p7UL49AfB6YhPtOKS6fe0yBmL1KR1q3ZmqZK6bn+VfvPcTp58Y82crfGaEo59wIjOuKgOvmpIfHes24FJvv3zKbtyNaI2r2GtY3kbOKB62vsCNN39vJXEyPqf9eAWfGLSlgqL9nfEkIN8ML+X+fP+iJjMrR6KbVei618GfOwEW0rNi5VHhV3vZoFOh+oD46yZqrCfprhYX43vvBW0iys4D6soxS+KW9dBw2MhelFLR2BSo/JhPhsMDCDX0KfsC6RjzGYm32sN+aH4NHObuWpdWtUInSA/bBBvZI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:28:29.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d867c382-223b-47fa-8b6b-08df4bda4e6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B5.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251322

T24gMjYgTm92IDIwMjYsIGF0IDA2OjU0LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IE1vZHVsZU5vdEZvdW5kRXJyb3I6
IFN0YW5kYXJkIGxpYnJhcnkgbW9kdWxlICdzZWNyZXRzJyB3YXMgbm90IGZvdW5kDQoNCkFkZGVk
IHRoZSBtaXNzaW5nIGRlcGVuZGVuY3kgYW5kIHZlcmlmaWVkIHRoYXQgaXQgd29ya3MuICBQbGVh
c2UgYWRkICdweXRob24zLWtpcms6IGRlcGVuZCBvbiBweXRob24zLW5ldGNsaWVudOKAmSB0byB0
aGUgc2VyaWVzIGluIHRlc3RpbmcuDQoNCkNoZWVycywNClJvc3M=
