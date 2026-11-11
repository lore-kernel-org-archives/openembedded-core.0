Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10068.1794405918180342279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fzP30byQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fzP30byQ;
 spf=pass (domain: arm.com, ip: 52.101.72.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TpK9l0Gw6kJibJbXumvwyZUx7PE7QAiSoHKllTRDI3r9HeJtXfspxP3AQKLj6k8pqa3lXlkfmYetY2Y1+tOI1J3yHUTRfa5B0pBiK9Qa0ZyotUJrnux5lqglspSIKRCZjvMqIsJw67wwQSpSPa5eZnFwMLFhyVMwpmuamIrlJaKq0gEAgB13W/UX/8wUQNbIr8C/gGhTa2QdrklhnmqhvyRKn9I/xIoUWuEfa4ZLNPiGIijWOZ3a89U4ivoEyAYIfZ3oWukER7KLucB3B2eI8X1PUVFuk7XMVmL7fGJZNPSXpuM4Z21Hfum6loB6xwINdxcPS2eHgqcv/Ln/PauLkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPjxsYEK3lJPP6gggErm21S5mgX4x1D+Yv3/DwRf8GQ=;
 b=SqXy2MY2v0WLMG42oWMG+yNzi2bof51sWoBA4idoq06hB+IPoNpEfD9v+YBFMSnrx/xhzDBaeELKnMzQTZ0UgRGmCsn4HBxS58OBkR2BkAX28rs6y+hcBn9D9xz34eF6SnPMEu9dHal568TVNlGNDxTchZD/FL1cbDO+hBhqD2jbsEyXhsfVJhRJ0eQl2q8EMxiNgKgQqaaM7UUQIZRdadbhiMs3NuS93jkT9uXkXUVZjGCncBhzGhkAtCw3N/nQlQLlDUCn/T4Yr6fajaDLZZl1bHFS39KWLMvm8IyKfrcRbojF3eh9blvEzfoHsnETzHkCOckGuqebGvcRGChITw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPjxsYEK3lJPP6gggErm21S5mgX4x1D+Yv3/DwRf8GQ=;
 b=fzP30byQP5sIb4/WL1zG4LUhw5MxVaCZNnOjveHX9yn6VRn7PfjrkC+k+5DkFhviEMr83GdUE1SXlToyR7Zhr4KpaH82n+5Fr8DC/SJSYFyjeeb6TBkTCCYl/qDuylncKzXXwsO3/er0qrlL1F37bNX9XxyegIC4efMSd2nb1Fk=
Received: from DU7P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::29)
 by DB9PR08MB8388.eurprd08.prod.outlook.com (2603:10a6:10:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 14:05:08 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::3b) by DU7P195CA0006.outlook.office365.com
 (2603:10a6:10:54d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 14:05:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 14:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srDAQ3qXqWvRgDL/5yy+9ZvduOY2607lsev3cAU6mJzINMlJBrZEJ6QWtJkVVo1Ig5+wNPJnWUhCWvgTZVf/FQXH9cQMVO6em3XdjUggkukLArmM9/a9adFxHTm//7IpSmo/2Vqgy3bq+o7PJtEkRsxtynpil/2Jrv7Y78A2SyoYQs0j3lWJDJQELiwfTavg1Da+hMsTWHtRUEEuV0XDTladuh2aPP4oH9pY/w9TrJflCNy2NI0kAiGDW+odeWyNM8Taas11bPBvnpxuKBBc/vf/D4nAgjY52JbvMa8ASp0+7khc1azq/RE/j08LPzTkDuMTAGp/rbl1BXYkkJDNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPjxsYEK3lJPP6gggErm21S5mgX4x1D+Yv3/DwRf8GQ=;
 b=d3cyBN64Jg46SoarSkZ2K21Zaa7tmAPJdnB7PmI6z0OzhssjfolTcJlJ45T2aJzCJgkf8olPF43gDUnPgRekrBEwQEWFhFTU0CFwtzVSTdhfocXOgrQyisAt485Du/LyiFILt91W3fCW5SIRBWQe1ZiyfoOfTXpKr/hDRVbalNNVfx6xfYMbdvXIU/Ix6Q51QyDkY7Q6RVlaMbU4wzqb9oIhIUhtNlIBWtys/fFcqySaHe6D68MaTaCEuHmABuRRN2kGUBEV5tb8u+zBiiz4mA6oEJJGvzIUVf3W+p922Si+TPQRYMfiL84h1y9i6kS3fC3fjHGQZ+Xd0Ww4Iw8mQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPjxsYEK3lJPP6gggErm21S5mgX4x1D+Yv3/DwRf8GQ=;
 b=fzP30byQP5sIb4/WL1zG4LUhw5MxVaCZNnOjveHX9yn6VRn7PfjrkC+k+5DkFhviEMr83GdUE1SXlToyR7Zhr4KpaH82n+5Fr8DC/SJSYFyjeeb6TBkTCCYl/qDuylncKzXXwsO3/er0qrlL1F37bNX9XxyegIC4efMSd2nb1Fk=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV1PR08MB7753.eurprd08.prod.outlook.com (2603:10a6:150:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:04:28 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Wed, 11 Nov 2026
 14:04:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Anton Skorup <anton.skorup@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Anton Skorup <anton@skorup.se>
Subject: Re: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Topic: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Index: AQHdbDY9Y6NU/tgFgUeQAdvSG2CvKLcfi40AgAkO/wCAAFgbgA==
Date: Wed, 11 Nov 2026 14:04:27 +0000
Message-ID: <6282B8B5-2253-48A1-B579-B234A2BC1F34@arm.com>
References: <20261104082635.2183419-1-antonsk@axis.com>
 <9BFE2C7F-923B-40ED-8C86-7E181E528B4A@arm.com>
 <AS8PR02MB7352F4644A226D66144319B8E2712@AS8PR02MB7352.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB7352F4644A226D66144319B8E2712@AS8PR02MB7352.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|GV1PR08MB7753:EE_|DB1PEPF000509E6:EE_|DB9PR08MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 222f219a-ebb7-464f-47be-08df3ffccaea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|10067099003|4143699003|261021133027099003|11063799006|261026130827099003|261026135527099003|261026121527099003|261009223027099003|261102123227099003|261022115727099003|261021121427099003|261021123027099003|261022105027099003|261021130227099003|56012099006|261028144727099003|261022075727099003|261022113327099003|261021135927099003|261026140227099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: Z+6tEQX1ijgq2QC/pLpiJBNjoVoEDfMASEzKv36f/PJW+p5/As/4+a3met+bk0yK2GW6BSsYi3Te10INaa4WuxNi/5URuUci1Kr8ubo7f+gNx9K3h/6OM/jujnZnEQa5oFi1akkj67CBDR5/NsO+dy4qca/wLbw9otUuMInTEQ84KUaIdG1xh4gdKVGE3zW+oeQdp/xJgQYhQHMLIaigziSorw5lqM04+fdClLUdYFbTnJkuXDLPCgAzRlpqWBQbjyPQyPHdMc8wvJQMa0WiBaimZLE4zSqxFC+9YLnk5h9lawFsxCRxjcTnjubDC2SEufjrEkCRjpn5gEWMI3AgO9jk3jZ80i2FYbNpWi06hF01j7a3dtT6HGiCrKMXGPTDuwAimQcPJ+hv/hCyGWTxEyynfTeedQ+Rbl3S7SVyO6XwkNbIxbqf5A8tLh0ZydjPnq1+g8P2l4D6ae0wbZ/UgRgkZoyolbAdj9GGXec/xO4XCPAcvlKBpEE8p+plR83oQeWk1IcVQsX1064EdWnjPza1XUDISFFB+BQpi2CQt8mIj28DVjwGVR8Bfn6MDf5Knjy4fL++EtfJj77VEZt63SdKpdQUV58ZZPGCDQ3RVmczIcCuBIBEnEm7T2iBrUzZtD4ZNYYXAuJuk5OGw8FG0YSnRCUD+p5HiRQiuKB2wc35Ce3Phu50BMwsbLrGWbvjOEZCmXFC7gw/jiBdHYY0L9Wv6sbXRtWAqcq5F8Io2K0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(261021133027099003)(11063799006)(261026130827099003)(261026135527099003)(261026121527099003)(261009223027099003)(261102123227099003)(261022115727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261021130227099003)(56012099006)(261028144727099003)(261022075727099003)(261022113327099003)(261021135927099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <917F065CA06F2842BBEC70591BF04DB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RTCdglg9rGnulKNuWgHdcY9YztDJzomj0EKIM46E5fT6RfTihqJmSoXAlurvsPb6wkMZvSTe/Gx0+JCJ/icy+cBbULUHJfs5fpkZjg8yClL2yXOTz5WFNbMmHViymp9txHrEJAYINAUCODzqIk5ZKypfe/z5C3YvHNbQt/l7LWPeETEXBUiu1udilncOweNCLIUSkv3UlW2auj7snDWNw4GFpTBlt0yoCkeWDr30iEKx2SpMG8R2cJsgrPcJOj/JSjWvRW77xDrt7zIFTjDuI2v0UnaMzL9WrozYSpbX9lahE34RNo7M5EWya/kNZ5hJAbYa9gPFPZKuKuRQ3nX8Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7753
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc185e60-67c1-4b80-d788-08df3ffcb2fa
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|23010399003|35042699022|376014|36860700016|82310400026|10067099003|4143699003|11063799006|56012099006|261022075727099003|261022115727099003|261022105027099003|261021121427099003|261021133027099003|261021123027099003|261021130227099003|261022113327099003|261021135927099003|261026121527099003|261026140227099003|261026135527099003|261026130827099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T/8Tv6HDUZA2sbZALN6r/80wzwRrj+1wgAVF+wgFpDvLyLOjIcMuNh3RkmsKtjI0yhpzjipaZOLbfsiEvOh1y83FIXjdOs2JPGd4J6xUu6BqHLGr1r5XrUPLlHplz7uzP/sBPpX2naK2/eC8yzxs5c+RyY0sJlkpDxhaH++vuqse+HKK69iQ0n0FrQa7HhDiUIEC0y/VhQ5mp0IsriL7HwMrxwVIsGmdouJFUyAKetPFYi9tomTTeXh489EdZLLYBh7vQJ2MJEOTuTufHXitsgckkBYQG1vG+LGcelfhaTJepAB0pFGXoF/0uMSoY6Cw+c4IpHO01e5wty6TKH3QvPZFyDeRuVGtT5FLbir4fHP3cF4UevhziW9AxBpqekWj4k/IqEAAN9w3BrQB8uVc8jbUxm8KQ8Dme+LX6FjmKBosl18ZI456Po3LllS9lkEm9Yj7HRXt9hs6GGFpSKvOYx85/NOArs8MyfqmFIG18ehwAJM+HWX8Y+xBEG9r9kIkCN/x1a8Ff+Yz7odof+xlJPZ0pc0fssZJN4pHvbTBYBzBAcJPzMZ43uNCswzCNsGHupd6IfayEb2cTCio5vEjNugLyMPuthskzlQ5dABOzsUhULh7NUWIPqblsDdI7vEaCG9qqTVd5g8UrxI4hs5uVUp/H79XDvBdZGtL5X29hcftPJXp/w7Aq1+8eTkg07PEwnTOpNAO8cRlasZKyob+9w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(23010399003)(35042699022)(376014)(36860700016)(82310400026)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021133027099003)(261021123027099003)(261021130227099003)(261022113327099003)(261021135927099003)(261026121527099003)(261026140227099003)(261026135527099003)(261026130827099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8IHrCL/KtfZLcrhLvgew9RPEnwLggGl4XOZPCVB6t2vBG4zNFglHYFlFrQcwBjNtJX8NZwnEIzGslVAnAbqi+4LUCcBnhoephuabcR06sZ+HxpsqspYjkztEYRyUjWYCvNFfTq+Qnk2UC8asjgCzqSB29Y9Fwc6+Ufp20o4SSmzTgAUYWznopMjTt999ecWZNSBN0OwYGaYtogfQSpoPQzL6Yc+PlpZwQXU1xsQ52Rex0Q5/eaSqA8UGx5MJjEOsMTURnCbqEFuzNbSPvZc0rUwcpWD9o5lSMar8t0GiqJyNsphr7jY01X+aUHAQCMDRBDWnHAu2H15FUbiNTxU8xMcUYE61+N8z3kIgd2tE3rU+kI/z4wr94AFqCvSKR0h44JqH9gDInHsTfoMCzMfpqr1kNS85fUGzrukTGM36FXMCf5D8UCmuG33Di3v/GGvl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:05:07.7510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 222f219a-ebb7-464f-47be-08df3ffccaea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250027

T24gMTEgTm92IDIwMjYsIGF0IDA4OjQ4LCBBbnRvbiBTa29ydXAgPGFudG9uLnNrb3J1cEBheGlz
LmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbyENCj4gDQo+IFNvcnJ5IGZvciB0aGUgZGVsYXllZCBy
ZXNwb25zZS4NCj4gDQo+IFRoaXMgaXMgd2hhdCBJIGdldCB3aGVuIEkgbG9vayBhdCB0aGUgU0JP
TSBlbnRyeSBnZW5lcmF0ZWQgYnkgdGhpcy4NCj4gDQo+IHsNCj4gIm5hbWUiOiAiemlwIiwNCj4g
InZlcnNpb24iOiAiMy4wIiwNCj4gImNwZSI6IG51bGwsDQo+ICJwZWRpZ3JlZSI6IHsNCj4gInZh
cmlhbnRzIjogWw0KPiB7DQo+ICJ0eXBlIjogImxpYnJhcnkiLA0KPiAibmFtZSI6ICJ6aXAiLA0K
PiAiY3BlIjogImNwZToyLjM6OmluZm8temlwX3Byb2plY3Q6emlwOjMuMDo6Ojo6OjoiDQo+IH0s
DQo+IHsNCj4gInR5cGUiOiAibGlicmFyeSIsDQo+ICJuYW1lIjogInppcCIsDQo+ICJjcGUiOiAi
Y3BlOjIuMzo6emlwX3Byb2plY3Q6emlwOjMuMDo6Ojo6OjoiDQo+IH0NCj4gXQ0KPiB9LA0KPiAi
cHVybCI6IG51bGwNCj4gfQ0KPiANCj4gU2VhcmNoaW5nIE5WRCBvbmx5IHRoZSBJbmZvLVppcCBw
cm9qZWN0IGlzIGxpc3RlZDogaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJj
aC9yZXN1bHRzP2tleXdvcmQ9Y3BlOjIuMzo6aW5mby16aXBfcHJvamVjdDp6aXA6My4wOjo6Ojo6
Og0KPiANCj4gU28sIEkgdGhpbmsgaXQgd29ya3Mgd2VsbC4NCg0KU2VhcmNoaW5nIGN2ZWRldGFp
bHMgYWxzbyBnaXZlcyBDVkUtMjAwNC0xMDEwIHdoaWNoIGhhcyB0aGUgQ1BFIGluZm8temlwOnpp
cOKApg0KDQpXaGF0IGRvIHdlIGdhaW4gYnkgbm90IGhhdmluZyAqOnppcCBhcyB0aGUgQ1BFLCBj
b25zaWRlcmluZyB0aGVyZSBhcmUgdGhyZWUgZGlmZmVyZW50IHZlbmRvcnMgaW4gdXNlPw0KDQpS
b3Nz
