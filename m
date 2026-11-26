Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14893.1795703166526119031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 06:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iZ9froar;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iZ9froar;
 spf=pass (domain: arm.com, ip: 40.107.162.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bvkeD4BoiShX0ZoZKe/XBam1aQbARbs9V/atIx1zy+oeob7pz0AYr2h8mTdvCzTjoAFIvXwuLY48GFwDnFIDXyU2N1TDM5H50ppPoQsfQrPp2PNrVXLgkl3lqSl+kz0RmZLTPbRx/4vJDbaU5jFFwmxbxiSZOvktBhIQenfpDRhC4Nsp7e9XOYeXytjztM/MAz60Q9a9C4HaSFsw3XCfL4RaMo1AiP2NbymIKWoIyWlskXzkJDUuNG6Z9Vy1KRwqbA3ZZNvKJPqyif3x86dVONUBX+XO9j11xzKzHOiJO2O0P0erMyOMeaTmNY6/0BiZKYY91EDY46kB4KyA2/+/Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF/W+4r9BvgWnEg61rrM6wrX3cKkPRjD1j8GhvJih2A=;
 b=W8iJLPwJHek4KSph3gLQpDmXEiIqIvEKE7gX9Vo1R/TabvQGb/ovb2LLIHo8+oIJv4j2obt5ve9C7S/SsXpmGStgYBMaSMwCtCSW7dnsPxzQ7vnYN48nAj2C+O7roJTV16ZCqwTrhzD7tMV5iswqbLL2qXm9jAPot0h04g3Bq9MhI7dTi1GSiuejMt3lH2ZWNdPftvvm6rm3Fks6Rslx0TkWkNAMVryvSvtSaUYq+Og8H3a64B4w78PQ4EOOWiCOVBceGxJL7AInbc/XKZUbF9WDt38ULt4LyskB0CZqc4wmstQKG9GNjUcTTFdNKhaFTCkhiQeGLHfvmxFkqkC2ag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF/W+4r9BvgWnEg61rrM6wrX3cKkPRjD1j8GhvJih2A=;
 b=iZ9froarjq+5CUT7vRoBKZVVi6laulQSgixGO4GEBfzTvD6jRaxudgCOuAe++rEnt3Nn8D9BNFwPSM4KVUxnfSBggggR/bRmaWxKvlFPO2IR6X2MobV2OYRdSUF9DawX18gwPJBi9HEDXKMFJMqVv63fZ+ihYjOpkaopvTA2Dt8=
Received: from PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2ca::20)
 by GV2PR08MB11393.eurprd08.prod.outlook.com (2603:10a6:150:2a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Thu, 26 Nov
 2026 14:25:57 +0000
Received: from MI3PEPF00008480.eurprd02.prod.outlook.com
 (2603:10a6:102:2ca:cafe::a4) by PR1P264CA0066.outlook.office365.com
 (2603:10a6:102:2ca::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 14:25:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008480.mail.protection.outlook.com (10.167.240.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 14:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL+XHGiPs5toELlFKaDtfyUC4b04E6XSk9qxOuoO5CGiBqEyZYKnAbJRwkZLY5D9T54ZYTdWYFsQFsR2/cAenZH4CoZy2BrQpDpUT7JpnM1lCZnQ9IpJ60+CO7WI8C3FyszhYSlQlbTaDYHGw0sRkaD9gTY+ZKQ4ou56pHz07sRIPExM1iUAv2CeGVe6RSZuJE4NCjcPhBZuCn/IZ7sNmeHDzKd1CC1kDvwP5sOU2xbJN0vDtuPnPrs1Jhuxe+4Erhs4788MXJqL0cX+HdP+4FNdItg4GovxVseiIfS0sULqEZgPrtVeNN10G0bilTLp1Es+6+qFwwGALy6jawtDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF/W+4r9BvgWnEg61rrM6wrX3cKkPRjD1j8GhvJih2A=;
 b=dAkdwmA95W9ADjylXGUOP2YVSumAwQa5WEOS6IvRzyGOC2dUPXUrSwO3jsxeqqZKI3e6+eIPQbCLBSY+gE7QMP5cyHKH0pKEic34Mzt4aTRX2eaCcLibkaG0XRW/jEpxnG2JzlZ6TTS0ZKtHi7kCxy+2XGgzcoKXOmdcWqPZtctos656tlCITi1msPUuadVscGo9BsuL0fktqODXLsJxoHARNnx/mufYq0yeAIiKeIeyaD+fEek0Upb5zDzaNqPBcOFQ6hU473iRVw8834mhvdoA/eKy+j4CeWck50DhJe6njq9xt5yZHDFaBrleknljdTI7IrS5+VxzJsG/AciZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF/W+4r9BvgWnEg61rrM6wrX3cKkPRjD1j8GhvJih2A=;
 b=iZ9froarjq+5CUT7vRoBKZVVi6laulQSgixGO4GEBfzTvD6jRaxudgCOuAe++rEnt3Nn8D9BNFwPSM4KVUxnfSBggggR/bRmaWxKvlFPO2IR6X2MobV2OYRdSUF9DawX18gwPJBi9HEDXKMFJMqVv63fZ+ihYjOpkaopvTA2Dt8=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by CPH1PFFE04F3F8C.eurprd08.prod.outlook.com (2603:10a6:388::517) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 14:25:19 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 14:25:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dkelaiya@cisco.com" <dkelaiya@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] curl: build and install unit tests for ptest
Thread-Topic: [OE-core][PATCH] curl: build and install unit tests for ptest
Thread-Index: AQHde/3W06z7E1IrL0mOPV/69bDw+7dAa+WA
Date: Thu, 26 Nov 2026 14:25:19 +0000
Message-ID: <1C38D44A-B28A-44E8-88DA-7047BC28E40A@arm.com>
References: <20261124102305.1094501-1-dkelaiya@cisco.com>
In-Reply-To: <20261124102305.1094501-1-dkelaiya@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|CPH1PFFE04F3F8C:EE_|MI3PEPF00008480:EE_|GV2PR08MB11393:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c700c2-eaa8-4f04-48d4-08df4bc92da1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|11063799006|261022113327099003|261022075727099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261022115727099003|261026135527099003|261022105027099003|261021121427099003|261021130227099003|261021133027099003|261021135927099003|261021123027099003|261102123227099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original: RlvXQLOY0Xjd6byDEfImB3OsSxomBZUwe3FxyFsa9lA5qecTUb1FvlZ1WH/pJLxDVnPaUMrxYFR/t5OViufExH230+05mNgyEQNHKXPdo/KfIKSaMUEjAGuMxLlOdSeSLrjUFjZhm3IMnQvA4WUGmaLqz0qC/XWenWghXP0fExSBrrv89C8bTaAuDHrNGKtuvlmAOhQ8v345ITM2dBHuKaOlXU6dEoGdMdJdk9Z5NegfpxNfSMQP/13nyrrIeVXObzEXw93y3T5N41EPjSxYFuLj3YtwMOtE2p64QqeWfhxtj4HT40ES/kyXRxlcjJ5zaBhB+l8AERaGX0Lyhi83sDAmDwg3u4ibjgiRHr7nGZzhsNOg43f2vbAHpqAUiLhSTaKmh+BDHj5jd8Fccd3EX3xlmhOJ32h6JZKgsILLWgndq+ZZQFdSB4k+I78u5xCNcY2T7DmMhXsS2d5gcQGgVraqrrYFY0XOSTrQLAP1aJNwn2gged/6R+GNc0l3aANgLy1Lquyn+l4IUSgIc8g5KDyX9Xij2iPlslvaqdcmbKey+NvBheDFOkCqy5D4KxXILW8Umzu7CdCBtfyag6Xh/CNQ+uSs6DvUSJTtVimcPqQxiEW3LoOVrPR+EFJ+7EX57cXi9yCrOze29Qt2bLBbIhRxCQCHNB9gdIdCxRRVCv5jvYwpfD3TzTBQwAaLDJUuqE7Lv8N3oRrMkBWFILE0Aw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(261022113327099003)(261022075727099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261022115727099003)(261026135527099003)(261022105027099003)(261021121427099003)(261021130227099003)(261021133027099003)(261021135927099003)(261021123027099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC6AE6AD0C0A834284864A1D9D0C153D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Dlg5yzuntQmXzJs+73AVU6dON8rKt/J1STpKOG0qg7Zg06GNTtQvSvEXZAO4d57QUcCZmcN/HjuNkwOTbgukzKdyfFoAGqWSZVgCmEi5QV0B7mj8gzgD6Q7Q24iQf+Y7bQI3tM+ez6fxwYyq11hj4yghstZ7225mce731NicBLrvCj0JXvpt9mqoT8bQcEmUwaZiSo5Eqh4Rrbgj6/1xUevfcV3o2DU8811AHSJsR/82EdOEmzcJm8vj1MPdphEYVbxJvl3Ae0qW3je6zqHy3aQFpr+sTIu9R/qQkK+u75xCr+mgdqsmavqxfXWEF1A8qMbrSurm6VioVdsAWN7MTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PFFE04F3F8C
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3cc162a5-edba-461d-0d27-08df4bc9195d
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|35042699022|82310400026|14060799003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261021135927099003|261021130227099003|261021123027099003|10067099003|261026130827099003|261022113327099003|261026140227099003|261022105027099003|261022115727099003|261026135527099003|261026121527099003|261022075727099003|261021133027099003|261021121427099003|261028144727099003|6133799003;
X-Microsoft-Antispam-Message-Info: ptp7+ZTOd1AbvOAUIA7quPQw4g1VVFxoeljQtjz4SgWymeanpmsYYAVhKTSy6qUqNcY0wS2fzS1yWi/2N89BMMqp4Qc0FR3fXoLqjTKk2tWRW4bIdMAhMajTYLNUHmqcL4AkKufVD7BMTdjTFiOiyuXuGZbwuOcNXbVvP9gTxYdeETh3p3d9GgIlms5u/qwsvgjZN1oXTG3Kixg07/V5fY0mNEJqkbYLR8Jd4c5ROMxhRb4URBTT1J2gfbguHyKM3HVRcNUgaJ4yFaUnTHHU7/1zS0t7SiPOYftEGmwMB/RS54aTPgH580RWP/Ei9qoxgYW+PwKYy0jkUvRPo1IIf4KwlOcAf7fgQU5KGYwR8dJ9SrGSw1pZwbiKdhPagPob6qgB1r1ncxfoWDbwfrdDvjWoLvnwJ0PuvRfIFzW09UEZe6uBuiSGBGgGx47lyd4UjqPwteOyMoz3+5TxQjYh9CUT5Jyk4GcvhZVZTYtrplxvL5e8uQO+2E6RHFCFoDeFeF9K04HDi/IKCUzqNKpmw6rL1JqkGXrBwQ5bHVv9o4ZZkzNrfFWwOdaf7FGVOhatCMe1UYBwPydqBqr3Lx3hv7BDMBV5AK9QqdqPDc9MR9Uc9z1+HQo5bm6cVAIVdwOcbE56LdWwciVt7LuHfDCORzoQAY4xJ8fzJoIUoBXgz6Cz140ZQYNotq0jqbwAQuM2
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261021135927099003)(261021130227099003)(261021123027099003)(10067099003)(261026130827099003)(261022113327099003)(261026140227099003)(261022105027099003)(261022115727099003)(261026135527099003)(261026121527099003)(261022075727099003)(261021133027099003)(261021121427099003)(261028144727099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fxt92Az1IY5R5k3RqfsazMdE3zZkv4bKdq/odHYM5Rj32zgxGclu6lAQp6upmHk2RFowOy1Zq6EivArc+XaTVHhXuvZkIZLI8Dx6myB14DeMIUiCQtAZxCfBZTDVz1kJqjlhqtPV5Bh86yUEy1OF56jYsxtOiIpzfOva8/Lpg/nZDjCPKcrQcl+JRqRs3nTdPSFVe+iMaI+A+w7eKunHYK5VnqV/4mzEOq7uFHaq/zEM6z2nRX5h1sNRozEgFkdcsQgPg4d/0hZFgYJJHbki/KGc7I3o9jvpq/WXJxkh6/ebsZJBKJobod2I3IYTzWM6wiZsZQjn6C1UvwAQgXCc5rQUNDhDPqqKJ2vOrOMHuGO+lVX5lGQAvrpm5MDQDuQ6VRi5+cdnrkE3/Qm83vw1YWjvU7gQ3rYemWSrIZR4V0Y3Os25x+Bf0d12J9JrUgOI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:25:53.4903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c700c2-eaa8-4f04-48d4-08df4bc92da1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 14:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251308

T24gMjQgTm92IDIwMjYsIGF0IDEwOjIzLCBEYXJzaCBLZWxhaXlhIC1YIChka2VsYWl5YSAtIEUg
SU5GT0NISVBTIFBSSVZBVEUgTElNSVRFRCBhdCBDaXNjbykgdmlhIG9wZW5lbWJlZGRlZC1jb3Jl
IDxka2VsYWl5YT1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IGN1
cmwgZGlzYWJsZXMgdW5pdCB0ZXN0cyB3aGVuIGNyb3NzLWNvbXBpbGluZyB3aXRoIHNoYXJlZCBs
aWJjdXJsLCBhbmQNCj4gcHRlc3QgZG9lcyBub3QgaW5zdGFsbCB0aGVpciBydW5uZXIuIENvbmZp
Z3VyZSBhIHNlcGFyYXRlIHN0YXRpYyBidWlsZA0KPiBmb3IgdGhlIHByaXZhdGUgdW5pdC10ZXN0
IGxpYnJhcnkgYW5kIHJ1bm5lciwgYW5kIGluc3RhbGwgdGhlIHJ1bm5lciBzbw0KPiB0ZXN0MTMw
NCBhbmQgdGhlIG90aGVyIGxpYnJhcnkgdW5pdCB0ZXN0cyBjYW4gZXhlY3V0ZS4gS2VlcCBwcm9k
dWN0aW9uDQo+IGxpYmN1cmwncyBjb25maWd1cmF0aW9uIHVuY2hhbmdlZC4NCg0KVGhpcyBpcyBh
biBleGNlcHRpb25hbGx5IGhlYXZ5IGhhbW1lciBmb3IgdGhlIGdvYWwgb2YgYnVpbGRpbmcgdGhl
IHVuaXQgdGVzdHMuDQoNClRoZSB1cHN0cmVhbSBsb2dpYyBoZXJlIGlzIGFzIGZvbGxvd3M6DQoN
CmRubCBjcm9zcy1jb21waWxhdGlvbiBvZiB1bml0IHRlc3RzIHN0YXRpYyBsaWJyYXJ5L3Byb2dy
YW1zIGZhaWxzIHdoZW4NCmRubCBsaWJjdXJsIHNoYXJlZCBsaWJyYXJ5IGlzIGJ1aWx0LiBUaGlz
IG1pZ2h0IGJlIGR1ZSB0byBhIGxpYnRvb2wgb3INCmRubCBhdXRvbWFrZSBpc3N1ZS4gSW4gdGhp
cyBjYXNlIHdlIGRpc2FibGUgdW5pdCB0ZXN0cy4NCmlmIHRlc3QgIiRjcm9zc19jb21waWxpbmci
ICE9ICJubyIgJiYgdGVzdCAiJGVuYWJsZV9zaGFyZWQiICE9ICJubyI7IHRoZW4NCiAgc3VwcG9y
dHNfdW5pdHRlc3RzPW5vDQpmaQ0KDQpXZSBkb27igJl0IGJ1aWxkIHNoYXJlZCBsaWJyYXJpZXMg
YnkgZGVmYXVsdCBiZWNhdXNlIHRoZXnigJlyZSBtb3N0bHkgcG9pbnRsZXNzLCBidXQgd2UgY2Fu
IGJ1aWxkIHRoZW0gaWYgdGhlcmXigJlzIGEgbmVlZCAoc2VhcmNoaW5nIGZvciBESVNBQkxFX1NU
QVRJQyBzaG93cyBhIG51bWJlciBvZiByZWNpcGVzIGluIGNvcmUgZG8gdGhpcykuICBTbyB3ZSBj
b3VsZCBqdXN0IGVuYWJsZSBzdGF0aWMgbGlicmFyaWVzIGFuZCB0aGUgdW5pdCB0ZXN0cyB3aWxs
IGJ1aWxkIGp1c3QgZmluZS4NCg0KQWxzbywgdGhpcyBibG9jayBpcyBfZmlmdGVlbiB5ZWFycyBv
bGRfLiAgSWYgdGhlcmXigJlzIGEgYnVnIGluIGxpYnRvb2wgaXTigJlzIHByb2JhYmx5IGxvbmcg
Zml4ZWQuICBJ4oCZZCBzYXkgZmlyc3QgdHJ5IGRlbGV0aW5nIHRoYXQgYmxvY2sgYW5kIHNlZWlu
ZyBpZiB0aGUgdGVzdHMgd29yayB3aXRoIGEgc2hhcmVkIGxpYnJhcnkgYnVpbGQgbm93Lg0KDQpD
aGVlcnMsDQpSb3Nz
