Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40236.1793186037152791425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 04:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A/e7iX+T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A/e7iX+T;
 spf=pass (domain: arm.com, ip: 52.101.65.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bdOaaHHs3+4ACYSH/dclhXaHmFeAn9vDVu49WyI+xWPLbqe5bj3To0+V8PR3dy9+A9ShTTaK0jpAuoDzJx1N6S2+olIvYsPKRQqCC5QaGY0zoJP/KppsPgxcVpvbHYV0Uel2MZAJ3izKhLO+mrROwiAFooCg4QFgWFeJyZwHvsHSQEK6i6eC6mzg1+vPFiyNvCYK0q8jC/4yCNhFmgnfYVRJhE541aWZjZAbNaj+NzK7OW+UzZZGzm4InC+xW+HiwGFIDX9C6dpJgImbkmOD7V6wNFr4AA1pRcko2ZxMUaVs5VRowgtwPzZ75fsHIYtD75/+MBc+EVmj58mi9m8E3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr+Ma8jUETbEDUVkKKcQ3GjweylH6lUQK1Un5F8f50k=;
 b=Yzet8kzhkTL5NKSGiq+LwCZByVs+jh+ZxhReNgOJbYUWrsYZL400EfWzZbSbvHUTdHN7SHkSEhcpFgLTEzpyjmFX24JMTp1+a0yTUsCbWv7EuRyjazLzR9oCE0972LqlUVUBsHu0q36fEZ7ob6uKUDYB6PDm4uSHUfsghP3+eRusCP60J7qntJqN+2ZchoK4/AVdxnoXQccSLlMbLNP+hN6Htc7CbO4G+RmsECozas5+Po9zX0Vg6F3cImbJlpZgMhQtDnQhavvSY1JNTfKDtvCgS49RC6WWKbL4C3lNWfAmeZ///5SJ83lU9xkbFNYNnwEzrTRHRRuEs/0VjEamog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr+Ma8jUETbEDUVkKKcQ3GjweylH6lUQK1Un5F8f50k=;
 b=A/e7iX+TSqQNyzrWm3/BVvt1qDgN4NVH7VyIjzDqkcvH3aeo4vMWhNl8RBKHKmrrIx0TcJvFfxAeHxgTimkXO/tmN2a70OuOLBxIc/drn2sKoXdrHUDP82hzhHWsolP3YDgeT5Xl+c4jSnF/pV69d8frvg56aUQMGOdHa8gBZ0k=
Received: from AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::11)
 by DBBPR08MB6009.eurprd08.prod.outlook.com (2603:10a6:10:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 11:13:53 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::82) by AS4PR10CA0030.outlook.office365.com
 (2603:10a6:20b:5d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 11:13:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Wed, 28 Oct 2026 11:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltO1noxAokpY3u9fpd2ZZIlqxzZkA+m0+X2WVtlxG1mVGKVs2zkZE1zKp7GdquLT7EXiCn0ILDdRNIrinj4f4n/WZbM9hXfbtxnWduChGi3Fz5rslemlllhDJdgMFEZL84NxlMnL5tUWCg4mADmAzNV9oQ8D9kuYuuPiF29k/2n+LeKpNJ42TiVSR2OxdE7FCCwN4KPizhoTmTnci8ZPBEL7Skel/FsdxoBgtB0soxJflnXJNnOJf0dZ78cOLfeibgiYRFHd+hZr+HKdMTiAo8SiIZYi9TRU13jfEXsdDqgH62CLg/vJd2olJX/yFXmlkqojGtypa6y9+aeNp2mK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr+Ma8jUETbEDUVkKKcQ3GjweylH6lUQK1Un5F8f50k=;
 b=NtO232WuqcFNacl/ZmEj6bmxtiaYlGZYbtM9zhKEzTf/vYeIxQyPsMYM7/+3qunqqx0tetxvOEIPzTc8uIKECJ5OdhX/w2tTwWJDj9VTOINVh7aY3MDAK0rDINuBBu0ekVUGqPJznrYhabrvULCxh26ZwYqtwh3+IYooXEOZh7Dn1Gz7o7LzJx+xClU+xvnKUUrlRA89rxAxCvj4Z1G5nPGRQMnYknHOIr1LAwDfli6OTm0uKoq9xzEgxKSriS5VbbdTQf9RD2wEzQY4NFPMYgkm2ZECgXVy1qsl3GXKzVZW7nYcp+sW9GmWBNrtk0GqyyQCp2W9ZXPAu8Oybjttaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr+Ma8jUETbEDUVkKKcQ3GjweylH6lUQK1Un5F8f50k=;
 b=A/e7iX+TSqQNyzrWm3/BVvt1qDgN4NVH7VyIjzDqkcvH3aeo4vMWhNl8RBKHKmrrIx0TcJvFfxAeHxgTimkXO/tmN2a70OuOLBxIc/drn2sKoXdrHUDP82hzhHWsolP3YDgeT5Xl+c4jSnF/pV69d8frvg56aUQMGOdHa8gBZ0k=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV1PR08MB8059.eurprd08.prod.outlook.com (2603:10a6:150:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 11:13:17 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 11:13:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@pengutronix.de"
	<yocto@pengutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
Thread-Topic: [OE-core] [PATCH 2/2] classes/cargo-update-recipe-crates:
 support multiple Cargo.lock search directories
Thread-Index: AQHdYYyNG2sB+DSNCUG50VNhSzO0KbcS14SA
Date: Wed, 28 Oct 2026 11:13:17 +0000
Message-ID: <CA25B707-72A7-4DD0-9834-EBF7BE50931E@arm.com>
References: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
 <20261021-mfe-multi-cargo-lock-files-v1-2-d3510d4ad963@pengutronix.de>
In-Reply-To: <20261021-mfe-multi-cargo-lock-files-v1-2-d3510d4ad963@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|GV1PR08MB8059:EE_|AM2PEPF00070CF6:EE_|DBBPR08MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ff3b60-b62d-4e9d-a590-08df34e48cc0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|4143699003|11063799006|56012099006|261022105027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: TJJhgTSlXVfhjXWrtCj2VKwovnprohKKlAZRjy3gxFeiDxIBw/FBsxMdNXxa393Q+HvxTOsx1oyYw2z3o9bfui3brHnCdzqknPemWiWTO4O1CJ2XR3RLG650yF2g+P2SknA1rxjYWPq5zdMwg7BzuJKmMPPiNaQq6CfhE3iTNH5cigq/R7BEDEs0BSGHDpT8Lil7sgPXCntfScO2fGZPpp6lA6Fj1bDO9rbY2+nvqpNaAkYQYfMYFgRhKvo/VHQJCIRhazs0pkgobq59Q+2clbePZwNUF7nebMFIFiUuWImOi6ur60I+EUCVjCEgBlRrFaY8qnAjpqXLtglL5S6ZpJJoIkLYuwV2PkJwAYqzNGc9RG2CHmR7kD9cqcIEtEWSgzcChsIoIVgQYjQAzd9n3SRp0pJ45McOI88f9YHxwyKmRtXGPiiDiOIy9ZBlzlnFey/p33k56+jUIIfmnxYJnls8lzUe6JI3pHLKsm05JwV4JLS2q8ZlwnYwO5Jtg/B92qq8qYGdNc8smEhIi/3n5/JUE4qWxOXImVZgCUJJawRcjKg65gEPyDY/fS99t23IwjJhIDdT3+WfaF6ZXmt09CFyaJ79rmgaMHaRvAD+LD7UeuM6oFsPrP1C72lIJYjWC7bfkrue2C8wrMy+vsYT8gmnJRinOYdL0l+9pg5JOG3HSncJA3aidhvRGYSBBjf37VhNFRA2BzkfNTqkx+ONgQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8813BA4B482C7A47AF4EC0031D062970@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wvc26lS92bcyj1K20GErEKxSkAOzQ6wa3B4uINT1Xq7vNbLRGyfSeMpkZRj7gNMDeWCuw5ef9pDuENsPWhGruxbCoZ7ZcjG/2VuG/YMQrbJnS31RuIIyFsqs1InPemUf+VhVMxMOWSpWJ0y0gsMQaRQ/wo7mxcl1ICxTwOxsHlymAYH4r5AO4UZmEixuw8mBpXWhPLeDeY3TPqRQZ+NA6S14M8u5K/B3cSMXYzpYO+vx8RVZGWlqC6dDTOHZ+dzB+Yv/PAoDqYm4wSknDzo9ff5qphzX26d4gfGUI2JfQ01pxbSW/bNJM5O5pSI/jDjVbrJiQlMkyaEg4v5iq9jrag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8059
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa30a0f5-5d92-4c8e-2ae2-08df34e477bb
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|35042699022|14060799003|1800799024|376014|23010399003|4143699003|11063799006|56012099006|261026140227099003|22082099003|18002099003|10067099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: F3cTCruCusqzbYsmCXL5VtnyFSrPFGCqjbpf+wtdKuJoK70DRWnUegVnuQqm76XuxoEFrPyncq5MsJWHGFuzlFd/nuYRB3+hEtNu9VuWCq2Laz/HptprXle6Vejbe85glE55Bv4bGi0WIJ0kXcdwHO4wDmFsYhqlSEp/lMnRRR1RA3cIrDzkx7QBJeZdCuGmXC+/ONdMW5S/GmacNpNaEcvhGSt8JSewiR4p2jk6a8y6E3XHi2zt+dri03ru4/WYv5EW5UAGYcf6zpTQOxV7ZbzQLZ6nZa998cYkr1rfOAH0ZcFgy3RtgZbX2tM0EzNKSr46MKC5uQKe0hm6lXBwfsdRHoyaBxyHgBgCXisnmBFcvxFgKSrt3Hg54RK9NTRfFPZB80fkGCSZpMRRiNQr6f80bJ1d+JOkqLGUard1mF606A1BB6DbaJY1TB5QkUWUHXqTsNhWtI6KC2gEjAJCFAXlpz6gxSby6wl/sV33XqZ+uISB5oZdRzoY6ZDZCGAi8R0g8qcaeQOdvN5/VGs/8AzDmFQhPtxiv+O1FVD1jwzOeZvyN/W3yyDbzcwB5Mx7ZOL1HA8SmIY5YTNTZ0ofrE3s4mwjj/jhyUPxE/hwO8FplEy4UjkNrg7q/tr0WtdNf1u+JSb48MqiPmlqWM/7bE10TpelRAu4mcTkL3Tea8W6pZzgijTaYpnq27j6x4asiJiu/P08BmGJbnoUCWtmfQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(261026140227099003)(22082099003)(18002099003)(10067099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JZtLtmrlmwV023cRhc7RbhH5OsdgZau36tDx5aOYI6s7Be8tIQD8ZsYsm3N38suy47Bq2+68QGidmVRiOuuTlCE+I5Ni3wLblyKxJerbLkPE9RSDKgPL0ohR3/kjn4UpUP2hsN2dQkASJ8Owukqmzs7xVNICfCLbt9C0AA+9zN90E6W9rcRYstCueyszwLe2A0WtgMAkgu2lQu+75NpW6OGO+3cEHdvgdqpLz4bMncmMOOC7WsCfccRUTSlQRhva+JWP//KEqlmDJN849WMfF1ioLwTBQXivwOyP9hjXJe1CYMb5feAXPBR5LPYO6erf02ckRogDoXeQRqKx+yN6z7ZX7JYHGVoqhBP7p1xq5MnA+o/6/ww+i8QQCZ8iOrFHhpcOLuNSuZonX1G8nRJgyMoqG1jWn17iNKDvzSxHscL9liDIxIf6NN4fxHd9tOPo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:13:52.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ff3b60-b62d-4e9d-a590-08df34e48cc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 11:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248810

T24gMjEgT2N0IDIwMjYsIGF0IDE5OjQ2LCBNYXJjbyBGZWxzY2ggdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG0uZmVsc2NoPXBlbmd1dHJvbml4LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAjIFRoZSBkaXJlY3Rvcnkgd2hlcmUgdG8gc2VhcmNoIGZvciBDYXJnby5sb2Nr
IGZpbGVzDQo+IENBUkdPX0xPQ0tfU1JDX0RJUiA/Pz0gIiR7U30iDQo+ICsjIENvbW1hLXNlcGFy
YXRlZCBsaXN0IG9mIGRpcmVjdG9yaWVzIHdoZXJlIHRvIHNlYXJjaCBmb3IgQ2FyZ28ubG9jayBm
aWxlcy4NCj4gKyMgQ3JhdGVzIGZvdW5kIGluIG11bHRpcGxlIENhcmdvLmxvY2sgZmlsZXMgYXJl
IGxpc3RlZCBvbmx5IG9uY2UsIGluIHRoZQ0KPiArIyBzZWN0aW9uIG9mIHRoZSBmaXJzdCBDYXJn
by5sb2NrIGZpbGUgdGhhdCBjb250YWlucyB0aGVtLg0KPiArQ0FSR09fTE9DS19TUkNfRElSUyA/
Pz0gIiR7Q0FSR09fTE9DS19TUkNfRElSfeKAnQ0KDQpJIGRvbuKAmXQgbGlrZSBoYXZpbmcgdHdv
IHZhcmlhYmxlcywgZXNwZWNpYWxseSB3aGVuIGEgcmVjaXBlIGNvdWxkIHNldCBib3RoLg0KDQpJ
IHRoaW5rIHdlIGVpdGhlciBqdXN0IHNwbGl0IF9ESVIsIG9yIHRha2UgYWR2YW50YWdlIG9mIGp1
c3QgaGF2aW5nIHJlbGVhc2VkIGFuZCByZW5hbWUgX0RJUiB0byBfRElSUyAoYWRkaW5nIHRoZSBy
ZWxldmFudCBiaXRiYWtlIG1hcmt1cCB0byB0ZWxsIHRoZSB1c2VyIHRoaXMgaGFzIGhhcHBlbmVk
KS4gIFRoZSBjaG9pY2UgZGVwZW5kcyBvbiB3aGV0aGVyIHRoaXMgY2hhbmdlIGlzIHN1aXRhYmxl
IGZvciBtYXN0ZXIgb25seSwgb3IgaWYgeW914oCZZCB0aGVuIGJlIHN1Ym1pdHRpbmcgYSBiYWNr
cG9ydCB0byBzdGFibGUgYnJhbmNoZXPigKYNCg0KUm9zcw==
