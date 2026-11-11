Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2596.1794419129218298684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=imZlPohR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=imZlPohR;
 spf=pass (domain: arm.com, ip: 52.101.65.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EqYqtUSG9ml4HciQHgmUxQJ59R0Fn7QDd98zWJd6nye9fydhS0yVFgvpB09YGlZbC2fcWz0J2ay7dLajs10IgYvZBb5DbFLrqDHwj9qNUStjS6AswgY8kNcjmxhCgG7aGbswOuoLyAjcOyCvZGll6Bx0nidy9lcAqVdy2jjPvx8aMoUggqIGL8qCALqs/nWE6x4LYzcfMsWcOaT6DGxdiiAAwbVFibZ2dULlOc6Q7cctNh2qJ54xE0omxt3yDdvIHN86uAUMHJtH2hyaWf5vy4Zyep+wjvS75eI/Kfrtp0m9g9nGRw6Z4w1IeMADVhyLvOvVigFeZdDsH35jWl59Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWR6vE+WItRjUXssy2mDy5a2UWRb0Gbbywpky2ThBd8=;
 b=DCiLihtg3Uz2Aykm4MOMsoLA4nkZhR6aqJ0ITP6kDkc8/gYj0i72/CHSdHPckklEu02z9Y/26oA/7iEYDY52sKP2fHqENIHy1ZTUTqTfkmtQRzSN5q2oZhnallaEpW26SiW5Hksd7gt4OjMgF57JUEf1TBTaaytLtIrcLnMAfa9OeFRmeCYd3QLJ+IwQllI/5XU8ywZDE/bJ+1pfUHUauQs5eeNFbiGu48yvXiKKR9esr+Wa3Hq5EIANA0Uuvy9ul1Jn1ZhfH912ZJws23EuQi0jVSuntzm7a3pOcBHT6bo6OF9UZFtPDro9/JnJptEKTrUDyiZAFx5k5SHR4+0kLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWR6vE+WItRjUXssy2mDy5a2UWRb0Gbbywpky2ThBd8=;
 b=imZlPohRPjjra6atx7GlJTXGPzZRy/kaB95bD4ftH1eCX1HYERIMdgeGZ6KgW+ub6pFVccLJACIm4kll+Po0NP+3pSKyuPF5eyAzWjQ1beS96b4nwiqdQQOE6xwI2L2qkaz2F2yJ1xoPa826iBEOfA0hdCL74S8BJzkgq/mmd/A=
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by GV1PR08MB7851.eurprd08.prod.outlook.com (2603:10a6:150:5e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:45:22 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::27) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:45:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 17:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0fF+YHEtOd6fRB6LM2wD3SAAjEvY/5dnAxeKmW5d6Xa/gSQAp/srEp+Bk4hzSO1yOdujQhT2ArhYQ9u51ZarjTcW8hwi9+P1UV2okvU5nqYPY1Qxf/vQMpw6qbEBu/8M3BYA7x0Z6r/Py3ev/ARgnFpsqOR+bk7Iz5g9Mq1zF09JtTSD1Xkvse/RuwHQPTNygrwV655vJRMi9HXKm9ICzX5LwWkozwYOY1E1O2N9MtRYDRfGJuDkjdVXQnwXZ55Jbp4bxSlGigccQ7XtYIUYfm8p6X2YZKSeltNTVfIKLy2Vv3VMDZElPqLP4Ierzz5/hWtSfU2xknsstlTamQxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWR6vE+WItRjUXssy2mDy5a2UWRb0Gbbywpky2ThBd8=;
 b=APTbm+jpYDmhkDYoNZlSgC85h/+BhZgDENvxmHT+WDf03cUuXbUzAor7z5cDLORf8qPa1S1bDbN+6FPtQpyOEG5mrD+gDuxMhLdWQQ3g8Au5XzfWYUFpn06jRvK8b/0arXNovmpGZWInXU9j32MXXPDnBmglTMt+D98ZcrWS7j6YtbW99BUUUOhErCuWEY30I+Rk48z/SAUhqUzeGS9+SEYTOPlN57vb3537P1cSSd0PeqUrLAFCMXj4YGVdYCvctPD1kJfl5OM1QUbGeoVhzZZYpHFepchXrwpHHzfrHqJrPsvvuBZMmpHkYNldk1wmHnryihPk1hLGGElqcCUOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWR6vE+WItRjUXssy2mDy5a2UWRb0Gbbywpky2ThBd8=;
 b=imZlPohRPjjra6atx7GlJTXGPzZRy/kaB95bD4ftH1eCX1HYERIMdgeGZ6KgW+ub6pFVccLJACIm4kll+Po0NP+3pSKyuPF5eyAzWjQ1beS96b4nwiqdQQOE6xwI2L2qkaz2F2yJ1xoPa826iBEOfA0hdCL74S8BJzkgq/mmd/A=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PAWPR08MB11067.eurprd08.prod.outlook.com (2603:10a6:102:469::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:44:46 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Wed, 11 Nov 2026
 17:44:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ragaprasanth@gmail.com" <ragaprasanth@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: fix NameError when upgrading a TMPDIR
 from ABI 14
Thread-Topic: [OE-core] [PATCH] sanity: fix NameError when upgrading a TMPDIR
 from ABI 14
Thread-Index: AQHdbZpB/3jpKq7MKkih63RHUt+AQrcpLWyA
Date: Wed, 11 Nov 2026 17:44:46 +0000
Message-ID: <73F56A84-6C13-47D4-99A4-A08613A3263D@arm.com>
References: <20261106025416.631340-1-ragaprasanth@gmail.com>
In-Reply-To: <20261106025416.631340-1-ragaprasanth@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PAWPR08MB11067:EE_|DB1PEPF000509EF:EE_|GV1PR08MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad6037a-60c3-4108-a84c-08df401b8f08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|261026140227099003|10067099003|11063799006|5023799004|261022105027099003|261022075727099003|261021121427099003|56012099006|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: jSu0eVZPB733+1VTtZX88Qa2sC++TvIgeSxBOTQFOl9/TdAxLwEdMp7TIYR36MT6pHcwYyN6DLOOsJrs3pYIBQpzQfCrJ7+vWlOtdeQyL+mpdmFPdBzF9Vj5KDM4YXtWDLM+awWKz/JBNTSDl5atEp+yW6vnZEU/s37Sw7Nk9oakxNITHN0LD86SzPXe8QTTpFYr+MpJIqdS6J95gaGxm5XiEs2p59Q55u25kwvmldEYsd919xdA+xrNRxsgStv/m13aynrI6as/gxtjtOH9kyMx5zJGd/tLK/xQQTEGb45Ur5LcNuvV9ZnHDtPqGb8q5pZWWQ7/E1Wn/grq0i96+wWA/9WOmYy7iEQzpzMt2ynM//6xZ9Dc/diQWpfwJ4PGGIkD460Z3et7OhCk0eUhM/AO4nURXbH5a4M3VQFF6agiZCMDMNXDjck6jdV2coOupEtaYGsuXdWRmEFNP7p6R+uzHzyA/lhCrZLLjQ3UmuKv5kiZLjxdz1OiY5JbeHeK1AvqvVQV1o0CZrzXkDG1FwbYBv3mxoPgE9Vx9gAPVmO/jWQ//z9NgNUFYlkNdHtSnis6MXJv16lfgCDFKKhG9Ydnof3VOOnsQkRiXMVKjYS6D2+zlqQc9ef6+7KRlXNk8IgMGpXdKO5pvoLYpPT/vkPZ2eQwOnp9wjlWY+AzhUuW5T1a0CvK1tIv8ivMwVjvkuiRip+q6/e4haE61H2ejq3hfuddvKIYRkmUOsoHyP8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(261026140227099003)(10067099003)(11063799006)(5023799004)(261022105027099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3614991E7B5C144A90834B73DCD8E3AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tTu3Tm4TeMhI5CENrXnqB1FCNJ8YUlabtiNaS6s3VXIsiib6H9qHkMrpq+bPPMqEYmvUfD8RR6l9Qu2urrytCBdVhMRgF2a7J81/gMWEW4nlxNVCEF5iU6BLApIZLG/AZDX6zXcwiGb87mcgak1B2bWCX1QM0E3Wpmvw69mWT4W6XgulrgL/VXNTJAAvK1JUJyEBpgE/GpnmNJLyln5zUnIGPudYbS2JdlJQORFLt6LepEaeR4BVOfu3NdY8vQW3HwY4N6y8qbgDF73ZUetLco3qdVgtWDvOikfWi7eCCnF/ZbUodLYZDzubXFTc9Jlev9j7MUQLlk7uPiuS3JmRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11067
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f212926c-1762-4f91-e893-08df401b79d7
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|14060799003|1800799024|23010399003|82310400026|36860700016|10067099003|5023799004|56012099006|11063799006|261022105027099003|261021121427099003|261026140227099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DBx6a/AqID6414eqYGNFYnO/wEFCwzoOBafHlFc3TdfG7O/v4U4e/qxtTd/AUJRcyl6ESNbQK7q6e+22+LGuGJNnTjtikWb3KGkZmeS5o4YPgaKYO3uzrrbpgiwDyhlMC8F2mpW8Ywd/WvhIXvX/8TFG5W7TDTuZ0TBznuZnBtPdVPDPmqtGTp7j+H2m88hOSPnstu5+oyW5BKjbR4awaDkFEP3ftCz6v2Ok7ldLOueVpYERhWf/o/vk+M65o4/JmzkUcjxFCfOLdBJblVzNbfyo6uoWXClwishCqpTfbgxAgOMzDWx1HUOklHDlVDXj5Fdomf9BE2iUcy1iO4pZOxD1Uq8rqzK54L9ZsaEL2vAe6CFrzYhEoGK7l3IvK++HbdtU2i9nd+vm9lM8fGg/nCHqBJMyYMCGX4J9wM44HnycbDEfiSzF6SWBDCzm/TbTBgXgQlB3vZ9Kzd2AiOlyry3/oE0gZXuOHCNFG2ugFrB3/EEsTyAPEh5G5KXI1qWvLkhdDXnLok0puGBncsYmsUg+SL58U0wCxWMXcHp90WvDLLPZge0VsTbdwTSB13WGoDEJNCT4D9h/LrZ/AoN8lM8OTP7Pbev56/qcc6mgQl0u5j+UcK7HHXj8yw39TSqc49jUDXa5jEChTUnWfuVQLxW0Z0BRWERWrCoMsamZHTIwYtJgqLDbUBjq1Fa0LAm1jyhf1OgLYYHqf98fLV2J2A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(5023799004)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8UZ0KNFau/E29qyoPZ/MoZ7Vt41z1DP00aw14dBGWY2AfmZuZfFomiqyJ4mD4b+LYM5ZIGQzxAyXwSwSs66ElhDDIxx/Wif78gQs+YalvKFxGuJ7TDrhZvUanZrARKOkcYiJdLXvLKSqyozq5nPLGKcdAaMIYA7JYLN0HNtiioDzN+mevX3fqTTwDszEySoE0Ndbj9PNxkkew3xORf8+QdCU7YUM8LrJ8YEwtUz+N4BZorL8ru/AUn4wA9J2HUtzITYNBK93esVzUbVcHQbujsD3X28fo1x08JteAOZHUGfzF7I8fRBuoTaOqS9FgqNca5uwxh89kynKWrr0UPg+dzDBt+JgO0lrRxRlLEVsDPXD0A8gl3ulYKdAYTUAxKQcTAHkEm2JMvz+tjkvnXncnDradZoDoea6JpexPtCWjv+iKuHJGmglgBJKl0BoSnXH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:45:21.7376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad6037a-60c3-4108-a84c-08df401b8f08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250050

T24gNiBOb3YgMjAyNiwgYXQgMDI6NTQsIHByYXNhbnRoIHZpYSBvcGVuZW1iZWRkZWQtY29yZSA8
cmFnYXByYXNhbnRoPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+IGRyb3BfdjE0X2Nyb3NzX2J1aWxkcygpIGNhbGxzIHNzdGF0ZV9jbGVhbl9tYW5pZmVzdCgp
LCB3aGljaCBpcyBkZWZpbmVkDQo+IGluIHNzdGF0ZS5iYmNsYXNzLiBTaW5jZSB0aGUgc2FuaXR5
IGNvZGUgbW92ZWQgdG8gbGliL29lIGluIDRlZmE2MWYwNDkNCj4gKCJzYW5pdHk6IE1vdmUgY29k
ZSB0byBsaWIvb2UiKSwgdGhhdCBuYW1lIGlzIG5vIGxvbmdlciBpbiBzY29wZSwgc28gYQ0KPiBU
TVBESVIgd2l0aCBBQkkgMTQgZmFpbHMgd2l0aDoNCg0KV2hpbHN0IEkgYWdyZWUgdGhhdCB1cGdy
YWRpbmcgZnJvbSBBQkkgMTQgc2hvdWxkbuKAmXQgY2F1c2UgYW4gZXJyb3IsIDE1IHdhcyBpbnRy
b2R1Y2VkIGluIGtpcmtzdG9uZSBzbyB5b3XigJlyZSBwcmVzdW1hYmx5IHRyeWluZyB0byB1c2Ug
YSBidWlsZCB0cmVlIHRoYXQgcHJldmlvdXNseSB3YXMgdXNlZCB0byBidWlsZCBnYXRlc2dhcnRo
L2hhcmRrbm90dC9ob25pc3Rlcj8NCg0KPiAtICAgICAgICAgICAgICAgICAgICBzc3RhdGVfY2xl
YW5fbWFuaWZlc3QobSwgZCkNCj4gKyAgICAgICAgICAgICAgICAgICAgYmIudXRpbHMuZXhlY19m
bGF0X3B5dGhvbl9mdW5jKCJzc3RhdGVfY2xlYW5fbWFuaWZlc3QiLCBtLCBkKQ0KDQpXaHkgZXhl
Y19mbGF0X3B5dGhvbl9mdW5jPyAgTGl0ZXJhbGx5IG5vdGhpbmcgaGFzIHVzZWQgdGhpcyBmdW5j
dGlvbiBzaW5jZSAyMDE2LCBJ4oCZbGwgc2VuZCBhIHBhdGNoIHRvIHJlbW92ZSBpdC4NCg0KUm9z
cw0KDQo=
