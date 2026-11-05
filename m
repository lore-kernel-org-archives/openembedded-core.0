Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35300.1793887559358697754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YtiiZs8J;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YtiiZs8J;
 spf=pass (domain: arm.com, ip: 40.107.159.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o6fQVCILT5pGIjsU+EWHFMWfIfENhZNM4S4pMs67QvZTmNqeKoe0jTcnUIvc1N9m7KwUALnpmmG1QhJvoYFl8zil4DzOJbmblP/eSQxFBc0BCD3mo7TqfDzwCB949tyJelDfhbvuSqdXblOovYKsaGyQt6QmmMjE2NkOHha6nAwlUpre3WLqtoppw9XCx8C7OZoxyuRmk7WXgdDC4dS7ZwbDeHYSbrJVP3RVi8mI/yiEU3j8GIhuh9VnvDqwRHVioQYvDpS28lMkje5hMIFL81JHbevI4H94UOjXp4Ace7CmtP2rmyncdmT8/7P7af05SUFqIBKPXZYcRVyTzmol/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldaTCwaMbCA+tIoJ3lkU10YMlS6dfxQauBcYan3pjoU=;
 b=gzHgfnAbcYmDFJQ7NtpGJNgj2DQKUoV5ofm5EcmxxrBHmXbeT55AVkeOxP5AE7m49HGpvMYnUP8ku876RkWuLFMaH0n9E8Qzs2iFEC1b7CDxbPUVgPvm7XdnzdUEB/8DXj+G5CyaySUWWgmEf9qru+rRpgdygY/UbaUxJJe9W+ExjAhAMXc2Rp8INJ8tL4IqQgfeaZhI4dohHLM2uAEuY5YEgYWb6plkgQTJWWDyhYDVH3J1UziUrac9ROx+fubv3N0UTPw3D5Ye5inpup/mYFd+xT7b+klVI/3CeqraY0Ab9X41hk2f0Uv6k6LTFCgIb0RqKTnwBgKKk4VB3jFKFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldaTCwaMbCA+tIoJ3lkU10YMlS6dfxQauBcYan3pjoU=;
 b=YtiiZs8JQt0+lZmsogsqSLwF++o0dyxlgW8q7oqX/CALtJMS+iwtU2uS8+f/Zs98otT1NnjFHhoRK3zfoRl/6eP4yZDgk0bmfFZf6xFwSMeR+DJR6lGc6gKezoF2bFSi4hEvP5iqaCPLpWwq4qzcLd5kYkPWml7JaSMdM3prN2I=
Received: from AS4P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::8)
 by VI0PR08MB10619.eurprd08.prod.outlook.com (2603:10a6:800:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:05:52 +0000
Received: from AM2PEPF00070CF5.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::81) by AS4P191CA0020.outlook.office365.com
 (2603:10a6:20b:5d9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:05:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF5.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 14:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGPO9+WumkZ3Wir++11AbMFfQIPorLKVt0/SlQx5EyNaY0igIcDyln9XEHIsEam+7ccXtmVJ/NBvar8RHIwLwGPWUJSiOrCjemHYW1ooVpft3pGwtQ5Gp6Ed6T0DxISfckuySA/GmGwirSbHY00WiwIoe3wK6sK0vlxwhZqSOSNcirn5NUGo70pf3X0oF8ftuMmoEYWp20FcUT/a5+zasKSs2RQk/vnR1pUshjaui6UH45HOgije1bcc9AZiSANxL7SOe5/mrihbsyOpLyZ/Qm1i6/LP/aId4n1nJRWz483sAjaoovXVY5JaOMJ7JTPSem7WAVQCj5xOE0PfUqSNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldaTCwaMbCA+tIoJ3lkU10YMlS6dfxQauBcYan3pjoU=;
 b=C41GrFoSOGs11N+sD2Q7356PCHTAyPviDlAcE1mNmBZdLO4LPiBHWfdf4g/xmndV4hXvzazRj4A2UuIdrmvRBt8MAVe+t1VcWWjXAFeoF8fISMFIjT0zS0w/RKQT1q98OynrF+YU/11S1TWa7QWDY5Aonv7EzOLy9yDkVGQcLg98zOs+Nzs6tKaYV8is9b7PJ9wbIGoFN2mAQCo9r4MmzQg/JU0Sn9cAdm9D0UukG3EzT52KcaebTwsqk9C6g0D/T5GKU//cibGipd0D9AbkdTOMY2V0jrjYSiNgqHjDaO38MMnlLf20j2MCXOZxZT+X0bj85fNHjoFGm31lqc7tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldaTCwaMbCA+tIoJ3lkU10YMlS6dfxQauBcYan3pjoU=;
 b=YtiiZs8JQt0+lZmsogsqSLwF++o0dyxlgW8q7oqX/CALtJMS+iwtU2uS8+f/Zs98otT1NnjFHhoRK3zfoRl/6eP4yZDgk0bmfFZf6xFwSMeR+DJR6lGc6gKezoF2bFSi4hEvP5iqaCPLpWwq4qzcLd5kYkPWml7JaSMdM3prN2I=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:05:19 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:05:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to be
 disabled
Thread-Topic: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to be
 disabled
Thread-Index: AQHdatODOjUNc57lVEGvGeoHE5Rwi7cfh66A
Date: Thu, 5 Nov 2026 14:05:19 +0000
Message-ID: <EB395024-F1FA-4B28-92FF-25772374910D@arm.com>
References: <20261102140700.2707257-1-pkj@axis.com>
In-Reply-To: <20261102140700.2707257-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|GV2PR08MB8270:EE_|AM2PEPF00070CF5:EE_|VI0PR08MB10619:EE_
X-MS-Office365-Filtering-Correlation-Id: 712c2cbf-f7cc-4020-9cd4-08df3b45e6c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|56012099006|261009223327099003|261009221227099003|261009220027099003|261009223027099003|261026121527099003|261026135527099003|261028144727099003|261022105027099003|261009221727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: hqhnfzkNlTsm4fDQeuXAzHikgekn1kC06eDweKGnppeltihygvoXCE4GX494Ul7ED/skKElW4/a7lU93r9s+r1l5hHRhDJ7FhoddSBah36jbq4is76yrPKAAgeaL2QTLgCV+X4l2aoM2KNk7dMsC7RTRMi+A8pAppxEiQo6WemVyNctCqo9Ks+kjQGXyNf8iB6xnFXM3z0z3RCHDIM4gXtIlN6v5MBlp31VMDhvVJCgN1FC0jEI9b5fcxUZy60acPt3+c867eAOfIsAYowx81YUrpJwgMiHpG/P9lxRuc+/d0W2VjPSM65AKtMHgXIvY1Ila2rqpzRiJG0Cm8UZAoTz0qNARecEKzzaJPiTP3/5jvWZh66ozMkAMDocoED+Vxdd8TSpT6a2sWyHPpDLDXyoKwXeCe4FpisKyJdScgtp8O9M6yVR/OUzcqQC6j4xbdu32lOr3np5iB7BoVuqb0m1G2P0d9bvvtKKzhtzEFbyG0WUzOLZSHei6AIkA/oEOpF1BnubIn45Gdw8YGGcR1bN4q//WpBRYb1gO56YcKdl7Rzh2no+kZui4V4vfG0P2k8dSAAhvPrVObKXTxSW5RMwVIelAIWPFe8LU0T4n3gKkPD52yQ5BShQHQbkzyhuDduhjDIkFXdjFNiibTTgDgxu1VbDPYusVT67RMGuPYxd2qHnQ969cSTmM2ntSdKxrPRGPYIg46gs7kTrK4stTMvErukdKVidc6KR9knBghsk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(261026121527099003)(261026135527099003)(261028144727099003)(261022105027099003)(261009221727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <668B3E076A1B584CB7B3E0026255267A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nTz3iZZ3O0MAWeNeBg9ZRB4w7GWktWYstocZ9shhPcEgzqcOGBux5gBLo24wHh73qjNSpq1GyOEs3oAQ/eM1SzxKhc5RHt18y/rIcvE/Zbz55xLe6XRO8nw4+BBuKooGGxGEnUpU3hxi0ewO+bskfpF7S29WNSU/I1x5d/E6K/LNKMhUqevEjQG6NN1mGqiwSL0QuiGYq57XZproz89FwEp+VI6clInc+31CYU6Qy4fUVw7UCmtjsYa4N4II6yTiwvIMPOAiXojt9p/Ktt0C1qm0WOswUl9dxTNK9YCAstGJjVjITykW0DenWzySxEgcvbq9Z43sXD2n9XLdddTnxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF00070CF5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 477226c8-9126-487f-7a6a-08df3b45d341
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|1800799024|23010399003|376014|36860700016|82310400026|261022105027099003|261026135527099003|11063799006|56012099006|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261026121527099003|261028144727099003|261026140227099003|261009220027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WU1qRsls70TWG1k46VIPCHmWR+u0YKBt/0lEd18zYA/RtI7K2henxv3V9YynYsg1i7DRGhbcN5zHdq6XaTa+h4KSTlYqpSbEJJouWtghByqLHp3/MnK4NbmZyhQbOLq28GOcT1XHIvfTExGeXUQ/6UFToI6p22gzM1ckCJmE4VxCwuweOgHwPUkNkXIPOAZ1XMgSWuqP99Ab/e4Zd24iD0kqRiP3pD5cDmIeHiSe/sdBCv4ZaaBDZTzd3G5u5C7iXqjIhxRqUXNwxQ9q6PO/Wa5g7wfN8hXbI3l+Gy5AeXPPCfRx/gVQGenmbFOAdH/s/r6CPJDBAmt1xOUjGUxw1eWtnFpKu+WWgigExcNxJreLrXcRQuj44kuaYUR6sy6bPLIu/iPBFRpYCkIt6GMLxR6ewwMC368/zkIFJlpLf7fsWuJsLBqC4V7COyWSVBoDuIbTxBtT2QpRM7Ok78bYbWgaIVeJ7u7AzSkTSKohP6icbrFpty2t0NZ8H8Z/JCoJ5Pz3MX71zvdlbTzR6i9ejuiPf7AC34abmu/fSeU0P3g/n5yYLzmGimBXOBhvMpXNlKp7GmrHDO5Alp5d+MQCWeYx1eSzwle7UZXOpV9VXwIlJAKmzZoO84/GqmgTtTNCilFJNVD+cMRhD3VfWD3EFk/ifM54AFRnsv5KwHJseeD7nBU8f/YBXgYjXrVFNOpDb6G8EDvQx2TVXD5OEYIYGA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261022105027099003)(261026135527099003)(11063799006)(56012099006)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261026121527099003)(261028144727099003)(261026140227099003)(261009220027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XAg++zDMJHb20flSArqa65ynYrZ224lcgxcwXHcsGClNnzPjsj+nGTEJAj/nQbdjXJrKOUSWGks3m0VTVzQ7BxxFUzfm9Apfq1YKndW4Rc5r66s6wqLC5+PNFWH+rmzgFRuSAjO1G9z8t9rxH0lNYTMGdKibbN05jfXBEHFda4HZUN6dHY3rAfrkrn96LAfGMFAAbsEsz9LvbRAhbA5MgFDUjaxx2aehLOuoGrH/sXoQkglrAANXi5ZHzkGSvkSvUVqxW7hYmMS6nthd/Mu0/lOifcS4OOmFd82ppIEu5W4xU16Ki3ejDyUFUjFKYx9TYbjKiHiEmNdqezrS0y5mFpKAdegdQ0okkK2tQdUYvR5+JwUOLXRXHyy0lwcZLzo5lMgtaY49k3S6V7XIwkfuSKzXUgAf2t+LlavB+hdccb990VuXSgl4h7AUPnk0HDk+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:05:52.0126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 712c2cbf-f7cc-4020-9cd4-08df3b45e6c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10619
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249550

T24gMiBOb3YgMjAyNiwgYXQgMTQ6MDYsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgb3BlbmVtYmVk
ZGVkLWNvcmUgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gK1BBQ0tBR0VDT05GSUdbYnppcDJdID0gIi1ERU5BQkxFX0JaSVAyPU9O
LC1ERU5BQkxFX0JaSVAyPU9GRixiemlwMiINCg0KRG9lcyB0aGlzIHdvcmsgaW4gbmF0aXZlIGJ1
aWxkcz8gIGJ6aXAyLW5hdGl2ZSBpcyBpbiBBU1NVTUVfUFJPVklERUQgKGZvciBub3figKYpIHNv
IHdvbuKAmXQgYmUgcHVsbGVkIGludG8gdGhlIGJ1aWxkLiBJIHN1c3BlY3QgZWl0aGVyIGJ6aXAy
LXJlcGxhY2VtZW50LW5hdGl2ZSBpcyBiZWluZyBwdWxsZWQgaW4sIG9yIHRoZSBidWlsZCB3aWxs
IGZhaWwuDQoNCkkgZG8gdGhpbmsgd2UgZWl0aGVyIG5lZWQgdG8gZW50aXJlbHkgZHJvcCBiemlw
Mi1uYXRpdmUgZnJvbSBBU1NVTUVfUFJPVklERUQgKGFuZCBqdXN0IGJ1aWxkIGl0IGFzIHJlcXVp
cmVkKSwgb3IgZG8gdGhlIHNhbWUgLWRlY3J5cHRpb24tbmF0aXZlIGRhbmNlIHRoYXQgd2UgZG8g
d2l0aCB4eiBhbmQgenN0ZC4NCg0KUm9zcw==
