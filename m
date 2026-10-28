Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39787.1793184192868280941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KhRb7qfw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KhRb7qfw;
 spf=pass (domain: arm.com, ip: 52.101.84.5, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uPzlXDCI+ztnzva4UdkyygjDTh80Q7CeyzPEnu4QsvtzTg8d54W9hpuel/JsdJsPUappcHlp/fzZgwq0VEwzdAYn9Y78YGByNkb22e+N25e7sjNWomuAWRQ+P/3dZNJMvZ7IRXAgNC78/Hh1kL1F+mNSx89plZ+IWWqx0MPV1F9zVu5ciVXDW3515MoHLRt1dh+ywGzUyLQ+VZjZnzM6ej8VMfT3rVaCS0+/U1rNtsPVopkgfCl74TBVEbXRVxjI0Nd9QDYxMdRmeA2u0pYFuD4SQLqnhS1bWAKGjdVWszuankNIQNdc2tAf10UAcctGmRRfr34AI4MKtYyf4+ewgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jchxlrFDLd47o5yS8Qh4K0tup227/T7XdS7SFJdL4Uw=;
 b=GKRiVJrDUQwKJ/C7Wvu3oYiWfJ7a9wnr6vAE9hAC4vJ+j7hZYfUET90Up81W0tDKOWzlC8YSnttocb5rXscIAA+gjOYybN5SH9jgUxPxwwypIca+gxkT7T75HbeI7lHalvF044ZUL3O2dji9CUF/LolG4xp64f2LGyOUotB6AOJJD/bGIh8pJl0KpyGXbNccYZY7kd8mfYjkQPEflZveAB9cb7MeD6W7Pz9WjT86C2OV2m4OrrfcrMtM+F4LHEji5u0HhSp0xw2HSuuu9lcES0jnpq1FGC/d4gITICEcX9QPyLoDaCYRgUhKv83LFvjKps3Y1/GbBuTrBiNQGZalOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=konsulko.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jchxlrFDLd47o5yS8Qh4K0tup227/T7XdS7SFJdL4Uw=;
 b=KhRb7qfwgzBvwQuturJA3Q1G00uc70cyH5eXK4647kCd+jJqfbttsRrtzgFlqykBH17Cs+o7n6IjryAVKh8z10fGxXEuOGrCjxbrCKZUS9s415nlJxlP8A9piq7M/lsii6f5/AJIU4ChxW1GgY7HR7NzhXE35hpz8/hJfW1iD0I=
Received: from AS9PR06CA0604.eurprd06.prod.outlook.com (2603:10a6:20b:46e::6)
 by AS2PR08MB9076.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 10:43:07 +0000
Received: from AM1PEPF000C1ADC.eurprd02.prod.outlook.com
 (2603:10a6:20b:46e:cafe::69) by AS9PR06CA0604.outlook.office365.com
 (2603:10a6:20b:46e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 10:43:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000C1ADC.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Wed, 28 Oct 2026 10:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4Szw7KfLXiRaSa1PSrBH9hkwhfXnd8m97i7r7fjiVytxrU+goPlYGlRq9cDaKewsz/+4Zgr6Q5aN6vqB6Kjv4mdNHPVRx35qOZoX+jMTa0nd8Vz0dYB+MM/EL5wRMExf4ZLHrQGhU0mcuMsXnv53eZRLg9A9EXVE6xWHNkvOKc9B13r5DvB/VUbpz8bLjmz0CtZua2psY2e6nrnFDivjbtz6mrbNwRREYyQwGXrRrMvRVThOoOXFQm+9YL/p1ngX6Ww/gYD9I0t4+UbpzQZBLIZ1cBoZL9iZ2vT+wuGjWOCfRfxlv5PNdjPKVNuvzmu5p0C6L6iMP2w42E8pUi1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jchxlrFDLd47o5yS8Qh4K0tup227/T7XdS7SFJdL4Uw=;
 b=u+Q83QB6X4zuW07g8jSDBVfyLRYWbaX5ak216s4+qU5039coC9IW+F0bGiEzo1k5MyTgfaSBpyKREQb3klnCC0WlV/iC+k3MTXJmCns0MHiodiN4WXqRRsf8tetwKgZGpRqtI6Awv3XcQkgvRkTDW4W7O1hbgtq0XHYL9inPACyjGIxlyIT60IL69WojA41HKmu1IyFwZTJ4GCyK+DneoJDUR4TnVtCfsqtddwH6yJsL2bd73he0ddSGj2pJNUvpo0U4Cf9HhkHslmBFEQMi/oOllHvxKHKsvC90+jWqEnzO9XP+QHQDqXaT3N0qVuztgg0LYd1wwHYnMl3dmxD5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jchxlrFDLd47o5yS8Qh4K0tup227/T7XdS7SFJdL4Uw=;
 b=KhRb7qfwgzBvwQuturJA3Q1G00uc70cyH5eXK4647kCd+jJqfbttsRrtzgFlqykBH17Cs+o7n6IjryAVKh8z10fGxXEuOGrCjxbrCKZUS9s415nlJxlP8A9piq7M/lsii6f5/AJIU4ChxW1GgY7HR7NzhXE35hpz8/hJfW1iD0I=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS1PR08MB7634.eurprd08.prod.outlook.com (2603:10a6:20b:476::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 10:42:32 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 10:42:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leon.anavi@konsulko.com" <leon.anavi@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] recipetool: Drop PYPI_PACKAGE if it matches
 BPN
Thread-Topic: [OE-core] [PATCH 3/3] recipetool: Drop PYPI_PACKAGE if it
 matches BPN
Thread-Index: AQHdYlRTzzziTiLm9ka4SQ1keR2Vo7cSzV0A
Date: Wed, 28 Oct 2026 10:42:32 +0000
Message-ID: <CC19F9F9-7D82-478B-B2D9-1EDD29E71104@arm.com>
References: <20261022183608.3500655-1-leon.anavi@konsulko.com>
 <20261022183608.3500655-3-leon.anavi@konsulko.com>
In-Reply-To: <20261022183608.3500655-3-leon.anavi@konsulko.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AS1PR08MB7634:EE_|AM1PEPF000C1ADC:EE_|AS2PR08MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9778900a-81dd-4944-b0de-08df34e0403e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|261026140227099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|11063799006|4143699003|56012099006|261026121527099003|38070700021|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: tQRvgkaxAOS6iVng52b+5S96DlSe+I2qL61SJQ+A7TNT4LfFfNZnOnWgm+JCO+5P9fbWk77xQNDPWAEb+0MceDzW/Yc9MuyrPEcnYyZwciJZAwbem7DPHgA4xfl9ey1XBoypBBo5J+UMUyNKAp8CCGfLDUlHT66QFKahITwWAPzQNrnCAkvFDFgF5Cc38mZxk2kS2kk/OMpr4GPCQovi/HU9UnoYLS2AXbQxG26I9KiAQqlsULI2ms6jYu+DTQx5dfPTrf5tf+Rx2i2EPuOBNadtK49xvW7VA1D+a6/nBJROdWKzXCxbN8XdkzICSptc91FE6BfISB4gBJel+V64ffEqGaj8dhniHFGoNH76o00nKF3rM0oQe9vqzRwiqwC9lWHO12mRCnvq9jGZIQgqOJFHQ8+4qkPCorUD0wl01yPuyW7RVops/pHlnTp/2w/egTRYMbVYQQun610KnMH96zMrdhtZKTeNOkn2AVxtc+wp9JnVE4c9lQJQRPpWzNJ+CrwAtpQfRcQD0U8H5D4fkh/jwuSOhZw3Q+TmNgTrd41GRoAuWBDWI5c7zQL/21XJZUf7PSMyOIHvlh9I6wNbitDfIXF98nsxr3mvlNDN2IJpDVvvYzvDIykuyi9yiHjC2nYluLaPtFttWRXf7ME6VP96VnH06cxH+DQ0RUtFyx2GCL+d7peqvG41DVw/MV1Kf+O4hA5Z4nQQR3vne07VTgurb3k+D4KbtV4CjJhv5do=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(261026140227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(38070700021)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1B948AA89D56A42BBD122FCA62F4748@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S75YptF20asPeWsRLCK1li9v6pGYQ9ro/Yx5LB8e+WZZ5rT0MzJ+vem+6BltjH7GnrCL1LZR8XxrXIKVOIu4uJNZh8EeQWDpy2QRep82HtQM0UBLUmWx6fQCXu/ntqQwHqCF3NS9tIld+Qy8qnA+NwOumYgnB1/+VBAMbImrcnlrYDzkLjpjIT33LFVCdKHUuvQBTJNAUhZX2IYqLw7rwehm2e9xQAZmmPOqFRwWavO+3g63RLEtcV94QOaPa62kyEPZFNk6/3CxuN87CkBDwQdy3uKK3FLt2cVxpbYfbFJz4AaKi6Dp/gT1MHjmW2C9WPV/fsRwYp798dcVdhXaDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7634
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000C1ADC.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ce520bb4-446c-4966-6f7c-08df34e02bf7
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|35042699022|376014|23010399003|82310400026|36860700016|261026140227099003|4143699003|261021123027099003|56012099006|10067099003|261021121427099003|261009223027099003|261022105027099003|11063799006|22082099003|261026121527099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 2sl7N1r3MTyhutKcYf8PfDDkXt+aXDe6+/ZTiWAiJggfw8QTWrG0A7/lLLIg2UtM6uklVV+ouwoyCZSDTYXVM880GrrOMK+8pHTKYOryBMaZH+z/okGiepM+fr14tkNfcT2oyM/Z9qqCs9r/P+V6LV4FBRZU8u/pbOFr7L8HELq/OEKg/oc6QtPoQJdiz/qRbl89MlTo0wn36swyyMhsRAYJ3t90soQBmaKAiWaQ6j8e0s3KignLKfkiVfADKJF91fH3742WGyCqzwP2owJTnucijc+kB1kHGZ/46yH8UvPfd53AnlSZ9GWlKCzCxsagwta6p1VuBk5EbUA2MBP8X2RzB1KONNVAv6/zQUJ7mvuQ6QeveShcWgumpeQ13Hm11+ADxlu4rNG+C+9EcR+xTM9Y0MUVJu4Pc4wO3ai023VEvLle0VNsb+Vyf9jPZaoMHXSHklGHawcMw6w1Z5CRUolrvHHU0j7IMsI4G9BOtScjbG3+2+gzOryOKm1eqA6AbfsW0xvcNVYFeyHZPayfgfp38tRzU7061Hz4EOjnob83W+Qsoce42JypIKeg6h9E+Nuli/b9YQ5GB+k+vsV6epJS9Nh34IgH3XhSxhQzH8edCkTOivNoRvO/sS3LOpYCMkFAoLs5rtD/rizkGdsd8Rnf5cIz4pH5hQHovC+owuZypJBK0B/99e9ncbVDU+oiJvVtT+S8dmvRO38vkMjG0g==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(23010399003)(82310400026)(36860700016)(261026140227099003)(4143699003)(261021123027099003)(56012099006)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003)(11063799006)(22082099003)(261026121527099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MOG2s6+5HorSPNNC9fDDWLCjfTbOYA1H0L+QGR87H8keImp1LsNH8qF8biwZdqpr92BbgRClMdikyGU+plhDuZ14WGpu9AzclHW6dp0J2HdukZ8peXETb+IQsEhfSNXfs3Hgzt4aLUKbf1VIcn8jHitmipQ7TNP++y0m7TBfM61DBMkT3PCICUXUULhwQ0kSBQokmjoFSu/BlGpRTBWlGdymd8xtcwdxb2L5O4vViCqGSBQAUx4CN7PZLnA4rPpKsQjDC5Q1YCvhauUb6qY4w6UUJ85g7OANzQRSZDBok++3J70uQZ5+fSwH86N77L78d7bzDMIFMuGxWaGj5gvHrTnFMiTOQYHhsxY++OnSWAX3taiPCXOcEib10Sn2MrQ1JolyYMdtKkWVHJFV0obx0tyQTuniJMegyc4kYEskMhkJ3JrwQijIf5dPWkoawWNb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:43:06.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9778900a-81dd-4944-b0de-08df34e0403e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1ADC.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248808

T24gMjIgT2N0IDIwMjYsIGF0IDE5OjM2LCBMZW9uIEFuYXZpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxsZW9uLmFuYXZpPWtvbnN1bGtvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGliL3JlY2lwZXRvb2wvY3JlYXRlLnB5IGIv
c2NyaXB0cy9saWIvcmVjaXBldG9vbC9jcmVhdGUucHkNCj4gaW5kZXggYmY1MzNhNDVjZi4uM2Jh
ZjE5YzdjMiAxMDA2NDQNCj4gLS0tIGEvc2NyaXB0cy9saWIvcmVjaXBldG9vbC9jcmVhdGUucHkN
Cj4gKysrIGIvc2NyaXB0cy9saWIvcmVjaXBldG9vbC9jcmVhdGUucHkNCj4gQEAgLTc5NSw2ICs3
OTUsMjAgQEAgZGVmIGNyZWF0ZV9yZWNpcGUoYXJncyk6DQo+ICAgICAgICAgaWYgbmFtZV9wdiBh
bmQgbm90IHJlYWxwdjoNCj4gICAgICAgICAgICAgcmVhbHB2ID0gbmFtZV9wdg0KPiANCj4gKyAg
ICAjIFBZUElfUEFDS0FHRSBpcyBub3QgbmVlZGVkIGlmIGl0IG1hdGNoZXMgdGhlIGRlZmF1bHQg
ZGVyaXZlZCBmcm9tIEJQTiAoc2VlIHB5cGkuYmJjbGFzcykNCj4gKyAgICBpZiBwbiBhbmQgJ3B5
cGknIGluIGNsYXNzZXMgYW5kIGV4dHJhdmFsdWVzLmdldCgnUFlQSV9QQUNLQUdFJyk6DQo+ICsg
ICAgICAgIGJwbiA9IHBuDQo+ICsgICAgICAgIGlmIGJwbi5lbmRzd2l0aCgnLW5hdGl2ZScpOg0K
PiArICAgICAgICAgICAgYnBuID0gYnBuWzotbGVuKCctbmF0aXZlJyldDQo+ICsgICAgICAgIGlm
IGJwbi5zdGFydHN3aXRoKCduYXRpdmVzZGstJyk6DQo+ICsgICAgICAgICAgICBicG4gPSBicG5b
bGVuKCduYXRpdmVzZGstJyk6XQ0KPiArICAgICAgICBmb3IgcHJlZml4IGluICgncHl0aG9uLScs
ICdweXRob24zLScpOg0KPiArICAgICAgICAgICAgaWYgYnBuLnN0YXJ0c3dpdGgocHJlZml4KToN
Cj4gKyAgICAgICAgICAgICAgICBicG4gPSBicG5bbGVuKHByZWZpeCk6XQ0KPiArICAgICAgICAg
ICAgICAgIGJyZWFrDQo+ICsgICAgICAgIGlmIHJlLnN1YihyIlstXy5dKyIsICItIiwgYnBuKS5s
b3dlcigpID09IGV4dHJhdmFsdWVzWydQWVBJX1BBQ0tBR0UnXToNCj4gKyAgICAgICAgICAgIGRl
bCBleHRyYXZhbHVlc1snUFlQSV9QQUNLQUdFJ10NCj4gKw0KPiAgICAgaGFuZGxlX2xpY2Vuc2Vf
dmFycyhzcmN0cmVlX3VzZSwgbGluZXNfYmVmb3JlLCBoYW5kbGVkLCBleHRyYXZhbHVlcywgdGlu
Zm9pbC5jb25maWdfZGF0YSkNCj4gDQo+ICAgICBpZiBub3Qgb3V0ZmlsZToNCg0KVGhpcyBpcyBh
ZGRpbmcgYnVpbGRzeXN0ZW0tc3BlY2lmaWMgbG9naWMgaW50byB0aGUgZ2VuZXJpYyBjcmVhdGUu
cHksIHdoaWNoIGlzIGNvbnRpbnVlZCB3aWxsIG1lYW4gdGhlIGxvZ2ljIGlzIHNwcmVhZCBhY3Jv
c3MgbXVsdGlwbGUgcGxhY2VzLg0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZl
IGEg4oCcY2xlYW51cOKAnSBob29rIGZvciB0aGUgYnVpbGQgc3lzdGVtIHBsdWdpbnMsIHNvIHRo
ZSBweXRob24tc3BlY2lmaWMgY2xlYW51cCBjYW4gcmVtYWluIGluIHRoZSBweXRob24gcGx1Z2lu
Lg0KDQpSb3Nz
