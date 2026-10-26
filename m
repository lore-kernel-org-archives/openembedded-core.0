Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44511.1793025452929062651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NuAav+kx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NuAav+kx;
 spf=pass (domain: arm.com, ip: 52.101.84.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bIHuLXVcKI5kShhttD/Cs1jI8zV3wk3Ho2AeRXVvzF7xdkcZ7Iqs2SEeK9N5A0n/ZdHr6s9SWdzrve96qIBg0uY5uAK3Ti4RYNqWB0b82Fy4IHpbuSLlQau2NA8cJRbKg5kKgB4cVf3QCNs0jMAdt7U+OwBYBqjuWYCv8kpQ4la1cZF/b2hC6k6z0eCQ51B5gVahrOycauF9XuB8na2paCoLX8FX65c0W2knSae4pSADPIieEl4Wu1tqvc9Q/CMOTrHGTuMzy4mHvtalJMXAw3Ax+EYHS7OmHoOBLlJs4uJHjt8m/BPkxgkZaZ04HlhbQxbJjnWydJ8kimYJM4o8tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VyhWGrd38qCG+K4uyOoXw0X7XxxQg6g8xzAb6Yz6gY=;
 b=o0wh04qLW2j+At75OAGpQY9NHYiF1fXrVF9CLeQ7K4140VipUmze6TcC4fj+tYDehBBndPIno8/9+ljophAwjEy3H+rj1Be+dRvtel78FmVBA08vxZDx/7WRuZJNfafvxKf5SHtTrG2yrIFgodDDU9RbU1MsoNSbzQKLco7R+pGxnhmIC7KUM6B+Gh2inNi+SY7+7EcuU072GBUNLU3zkeAEGC+GKaq2MDfZ//md3QYhGf1P7oFH4WVlowyLbyY8v0NEhGBGKAVRgFt5BXugNVeHJBwaG8LlXke1+iLYLNtcCtdHCOaTwiTWtoSNhG4taCM5s0KxH8uBEl2G/JSvfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VyhWGrd38qCG+K4uyOoXw0X7XxxQg6g8xzAb6Yz6gY=;
 b=NuAav+kx5vMLa9eoyaBvjilyE33Fh5V+M6Lb2DEEbBhIu0hCFoGfaWCeGuzVf5G20UpV6LKyybIGR+J6U6ytNeSM7Xry7ca+y7Znn+UZo/WQ91ud00a/2W5Biy5sBm3xW/5BffZdCr5FjDFbxrfJrfqnJvVZxp1iJcnN3KFh/bw=
Received: from AM8P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::21)
 by VI0PR08MB11822.eurprd08.prod.outlook.com (2603:10a6:800:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:37:27 +0000
Received: from CPH1EPF0000051C.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::97) by AM8P190CA0016.outlook.office365.com
 (2603:10a6:20b:219::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 14:37:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051C.mail.protection.outlook.com (10.167.241.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 14:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baaj79TSvXrYPbtVVtOke67iQtgVApMZdiBukky6lHKRDAePmtOZ8Dn0JukINZox+0T22uHvDv1Xe6a33gcRrH0yYqY21UCAsMIFD5uHXKnnu8H1osiYcGH58aY65xYysxzBKuLT+XrAcaP5zuj++vCTq2VR/sqj4vUQ7uCWFkoHIvZBHkSE6L3jiE8xOOF+XK4EsGH1xxg0sATpWXSsEPBaa5FbSodjxndVeALokKpxEuSvvdsLwD0Q1f7NoaMvMUVzKUFJriBa0Aguoggk8W35b05oeUFN2dPpLqBBkC6C65qNYCMQnYyIbE2pCpUmv+y9a03Cx3voy5rfIJvUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VyhWGrd38qCG+K4uyOoXw0X7XxxQg6g8xzAb6Yz6gY=;
 b=Ez61N1Ms7XEYxgicumZKgzjjsJDxtAnF+0FBjNPYd2fG2d1XeQTqu52XkP9+vnbk6YxnG5CFx1EGatd+RIV0JIwfeFUvOz0BeDf5KgMDe97eHZVZThTzjTTfA9++fMt6yVXB+fOXYsSzGbbOeYb1DJLz0q9OOgEhQx8YiW9Z2biT4N/MuHEJAnTIxvrk8MevmiNBZZ3yjq8m/fUjM6uco6vzXN10Tyc6msmG9T80UyXavAqaHe1oHXuRL0iigcI4EhmCtnmoJdWB40KEBEugS5HWjkrBphcsMZpKzXyPF4fozqvP8s/F+KOJXsf2pOyJL37Ci0H44qZge5IGRLs8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VyhWGrd38qCG+K4uyOoXw0X7XxxQg6g8xzAb6Yz6gY=;
 b=NuAav+kx5vMLa9eoyaBvjilyE33Fh5V+M6Lb2DEEbBhIu0hCFoGfaWCeGuzVf5G20UpV6LKyybIGR+J6U6ytNeSM7Xry7ca+y7Znn+UZo/WQ91ud00a/2W5Biy5sBm3xW/5BffZdCr5FjDFbxrfJrfqnJvVZxp1iJcnN3KFh/bw=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM8PR08MB6532.eurprd08.prod.outlook.com (2603:10a6:20b:316::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:36:53 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 14:36:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "HimaniRamesh.Barde@windriver.com" <HimaniRamesh.Barde@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>, Shiva Komati <Shiva.Komati@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] tiff: add ptest support
Thread-Topic: [OE-core] [PATCH v4] tiff: add ptest support
Thread-Index: AQHdUK9XvDgjdJeTOEqu7O9omkcyHbcQDXiA
Date: Mon, 26 Oct 2026 14:36:53 +0000
Message-ID: <7EB8E0D5-83B6-4567-9FE7-A9CBB8940435@arm.com>
References: <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
 <20260930073432.3027882-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260930073432.3027882-1-HimaniRamesh.Barde@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM8PR08MB6532:EE_|CPH1EPF0000051C:EE_|VI0PR08MB11822:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c1e642-a478-4d36-fcb5-08df336ea78a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 6COFG9e8rnbCuoncBfuJ5YcMw2wuu9H5dABxdk1800pqz9iTVUMVPSauWgX/raSFpGVTmcMjVN1JQbfYsDtkAO8dGLrVE3k2NyMd9TpNKhjozUE/iXi/W/j9OhA9tKQSt3TUuIPf5fpjSnDwnp2H1w7YkVIdKj8pgToXGeAPO8/XB4IZ8m5tUL1v7hpUT/Ywme1JNhhy9+2rYjKIXMkpQ9mYHkwGDt97RxP6mhg2DOWIVYGvnDfYnyqea0RxeARC/JVEGUEkm1bjx5zCCV59d4hN+nkerHlLwqbXNyJTzPXvFmH9G/nGG1XWmq9OdaJqDz7kLWSdZ/ygd/l0yu4cQ0NPxSENUkpNNCVS+pq4/wHEVg8nIHckNA1aUR8SVartsz3C9md0N2YL5MZWCu6mIVQYtRxfkaOdDbisJhYzctW0phgjhctb8/wF9m4Me9CdgNCTxFdUpqgE0vD+LyO9ctp9i++6oD7kTCqHR0yf4HSV2Dighe98UnUY/9VR1KKdY2mTxLfWM8CdjrC4AFcYPX3CpHQPEmFKee+mAGn5cV1cey3g2jr9aGOjU+vhQjtFY2cr+Ct1Su2mRvtkH1A/2kg0M7u/8JfPa7HJ+IGRCWDdu7tEw6ern0JeKSFhPHwzgF8jCFarQbZ+NoLrJ2tt7FIc7qHvOiSzR1Nsut+wpLIdv7CpjDvK3VPKrsrs8/n1aKZNbFCc5G+SsuGIOps2tQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E237F65DCF8E3498E62DA71F148FD81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xfq1zcnirEyfov5LKMXqhce99oXYlwtukW2xCX7xdSXv9BQpcwCgsBimC/kQqImZdiK50KdvIkD6nXZ8U/zpXKXBRAWWZHA/1cdkgqle6JZ++yxcPHHkckfdsw82m50eiZk5Oq72Ym3Tf2Km78FrGg6TOMyZKTDDjzEMrTWvmIxCzazZ6cUyUCZnagGYDn93umxaLHW3ZuKJLDvBqXOCErvllBAuq4hasp42pxJ5+9RO1Ts07jsFFMaj1sDHo35A+01NVAiFdahOiX3Lg0x80kZfxYpIWwktpQfUogqakh/JV/XHp0iCTW0d2AmEfLtBLH5TzCj7YSMCxm2jeQPObw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6532
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CPH1EPF0000051C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b499ef0f-171d-41a2-a30e-08df336e9426
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|35042699022|1800799024|376014|14060799003|36860700016|82310400026|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SqcMUPaC86nw1WOS77FpJlm0v5/wMv4tXKJmpPLarZVItw61nV/0Eh13TD/Y8RjaLhoQFz+c9JK+peOcb93ETrMRlmIVtaNHS35RQD/R7qjlQ3vRBUYVN/VfEgDHH6LFwRlxIY8vwGcjRY0CS2oAvUXNNSSdFadLKdJubrIUcGb9884X9lTDi5rxwtXA5mO1PX8d4BXZtF9F9ZqHlX7GrhyXI4oSQK6DEMRxrqNQLUKWsAXDAL1cFe0yr9aLDR5xaDD7h4oIRA0l8QiffUebI+h768RYo4BWReYPvz7/e8++XuRI7LamhDeoHYXOhz5ibn86O2CSjYYqogrqQYv36BeUx/TBRzzVGP1ix7+ll5aOYn/1nb8E56KxzhzV9HoI8Dp/H3FN8N/cJPXud+koX49RwOmoiryMjeOZLyH89HSeb9suBAJTStYet59qWmo42MBmvyGZy1ale+6rOtfg1jupDtzu/OSJiOz4UX9SC11675Uda3Uw5KtOWFj3BlYdsfgJ1M6U6qGCAs4/+RDpwCR9q7H7Sa6JjvP8CSUfddmVthkRj1aHi2zSl0DBAkZdlT2EYRSxloE7ngOyYJBML1ruVnpYR8yWxNMyY3tKA1I6Lovd4Lhl+3ZMm9+nzIGE+/XM9XiCRuJe21T0UC4Mn11lSBIAUWLdXZTFj1CUVDr4brAS/Za/5PWrpbt7UI4h
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(1800799024)(376014)(14060799003)(36860700016)(82310400026)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A3VTCHAlp6fK8ZEPAoHa3syr2U/qxxqSPST/JZhZHsXufWZzAMayluw66wMKAAGbY7PkOvsOXMOCb/x9bVuhucUkMLCDB6JklFp8ANL7zk3+Cb3CzCww65jh0Pt305HOJ3GgNxNWM651dmxmA9yCDNdsfZHDo6GjauXCfj0nkITuzdGsL3QkHxykEIdpTgqNh0jbsuuAUHQKz6dL0lNpty6HhmqoU+OubPoozhFeS6vR6YPrl/kDuMBPAJt/Ptz83+T99+9aDTBghFaVYy4dnauax0emXge4SCS03M8Ne0W9WpTrkcxveVfOqg1pbaJqQ1i3b7h2dEJCam5Gs/u/4bjXdNWiEEiyqmam540SjDsqBREdOW4Z2g7jxgPQPLX9rHl0/rUO/YCupy3b5hFsbNAL1lUBbqHAlSI8EMN6LDEtD9JyzdQcSsMVNQiatV3a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:37:25.8847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c1e642-a478-4d36-fcb5-08df336ea78a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248685

T24gMzAgU2VwIDIwMjYsIGF0IDA4OjM0LCBIaW1hbmkgUmFtZXNoIEJhcmRlIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxIaW1hbmlSYW1lc2guQmFyZGU9d2luZHJpdmVyLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+ICsgICAgZm9yIHByb2cgaW4gJHtUSUZGX1BU
RVNUX1BST0dTfTsgZG8NCj4gKyAgICAgICAgaWYgWyAtZSAke0J9L3Rlc3QvLmxpYnMvJHByb2cg
XTsgdGhlbg0KPiArICAgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7Qn0vdGVzdC8ubGlicy8k
cHJvZyAke0R9JHtQVEVTVF9QQVRIfS90ZXN0Lw0KPiArICAgICAgICBlbHNlDQo+ICsgICAgICAg
ICAgICBpbnN0YWxsIC1tIDA3NTUgJHtCfS90ZXN0LyRwcm9nICR7RH0ke1BURVNUX1BBVEh9L3Rl
c3QvDQo+ICsgICAgICAgIGZpDQo+ICsgICAgZG9uZQ0KDQpVc2Ug4oCYJHtMSUJUT09MfSDigJRt
b2RlPWluc3RhbGwg4oCm4oCZIGhlcmUsIGxvdHMgb2YgZXhhbXBsZXMgaW4gb3RoZXIgcHRlc3Qt
dXNpbmcgcmVjaXBlcy4NCg0KUm9zcw==
