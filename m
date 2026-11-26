Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14636.1795702443841417545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 06:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HqLaDQaI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HqLaDQaI;
 spf=pass (domain: arm.com, ip: 40.107.130.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CVpopYsoZfIwkwsC2R3elv8AkJilxe3g5V31pRZUQqPh6Mj0UUlk8xAErtt23uZz6rzb4/93u7pU31ZfBvI/XD3tltq7TS416AZuVsf2izU30nwn7AI6oMDi4098Tz6ZsV76+zmfbgAq5pdT2FFUbDOrDj0naQbG9x4vOdRhQlIE5UJ/ccvwhHVHHpQ7wt652m+GDVH1ee4cxWVlY5zhBi7g9rI0kwThhTLi2K8wf+KpEhBUTI20oi25BcKkHWvP6o7Bs5V/dCeSt1+r7O3SsZJ/iaxUvW325MooOZwaQsa9ekFs6IlqLRL1PtA5pFrCy1Q95mvKtVpdFdQLleErmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXQJHrSqIBm99BOaOT3XxxAr7FLxZ5dJPFsNHMGeTKQ=;
 b=EIcY4Vq0TL3fne5UFqUk1Wt/+pjHl0IpcyU933ppFq2ASBTSMRCIhnVNDruEq+/Am9KlGlst9R1XKdVS5cGnp2Gt4f7QNrC6KEWai2ymrRessWVJuv9BdG7o1NcuG+QAvXu1t/zXKf2JcyhpJMOqJVsUc0uhqVa7fqe/rlt26PHLXjr1r/JVyhmFGzSAmCkvG8qRCCkZelhMMC5c+iKL2oQHLyWxjWKY42nO9JxqArVVbKgljYCZla4QcGdJ1VtxetJersGlPYGsHYxU1z14iASy30jRu7VE5Oi7kaOpWGv4Fl1jZLCDov1TBoaHFkJtcQva6LoRG9+1Pl+gRueVDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXQJHrSqIBm99BOaOT3XxxAr7FLxZ5dJPFsNHMGeTKQ=;
 b=HqLaDQaIObvmQLaGMNrjhblUrYEhhOY5SYS262qpq4VHwgfbGHCOSktMD6ZHGawy0Ny/L6mwTDsUkFq0G8oviAk+PlArsX+RczYydHIR/cTmgSCNZusIpZIozfBeDqEV2CuxmqncpTiG2leGxBtn36TCDKBdPdrksx0zfHsZbGY=
Received: from WA3PEPF0000051E.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::674)
 by AS8PR08MB5975.eurprd08.prod.outlook.com (2603:10a6:20b:297::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 14:13:57 +0000
Received: from WA1PEPF00009B37.eurprd05.prod.outlook.com (2603:10a6:1d8::114)
 by WA3PEPF0000051E.outlook.office365.com (2603:10a6:1d8::674) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7
 via Frontend Transport; Thu, 26 Nov 2026 14:13:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B37.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 14:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jjwk6egPENFofL+gA47bsr3fJJeoYR42Lp7FIToNIYahEOWqGht0MVazQDeCSSPYzlp9MhuZ1iqpcTphBCZHxm+j9vajel7aHuimBWsWJDZrE+Gx5Nd+86PnOd4G2k2HSDsSOptkzyaSyIkmUhU5guiVC0Ktl3upDsBZPkxdZugTDjOKALZrrNIEH4lqmRtpFbEDYMrjAkhy0MQB9lC/Xq/kCU39uKTXT76LiTCtPL5vEc5vz12Xm+/wxNnh7zrBANbHT5nCtWb3+vyaNnvqHaYFL2bJP/d8fX3BdInl9sJpwav+7UoDqUTTioaOPO0hg9pheWdYaz1qscSvcB7rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXQJHrSqIBm99BOaOT3XxxAr7FLxZ5dJPFsNHMGeTKQ=;
 b=ZCIQexxtDZQ1hpFegez41oKQInafa6kLuhPWfowuM38OcpjjT+nxqT9FXTTi24qCgMkZDykRbvnvHpP5CekPtSFbimrFAMh5/J6aEPauXtqy2scI0vWxlrQQgrFzMe6ZFiBRbEd4w147pWJI8UdkP+vuzIpl+yay+Mr6d0nw+YNIluPTg2HbI2jqOgh8+usqrXOiDU63tBCZObBV5Xa3QN1rg87D6lZ5CIwgrXh3O9h4bZ7KMRYAF8Grf18S5QXEZL7KMt+Nctm1tguegZkjUX66wv6D6sPZOQ01UYmya0ZTEZDi6K2zu7dKXn4NLRoYt2J4XCtaB+hGWKfHy7+NXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXQJHrSqIBm99BOaOT3XxxAr7FLxZ5dJPFsNHMGeTKQ=;
 b=HqLaDQaIObvmQLaGMNrjhblUrYEhhOY5SYS262qpq4VHwgfbGHCOSktMD6ZHGawy0Ny/L6mwTDsUkFq0G8oviAk+PlArsX+RczYydHIR/cTmgSCNZusIpZIozfBeDqEV2CuxmqncpTiG2leGxBtn36TCDKBdPdrksx0zfHsZbGY=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PAXPR08MB6494.eurprd08.prod.outlook.com (2603:10a6:102:154::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Thu, 26 Nov
 2026 14:13:21 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 14:13:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sumanth.gavini@windriver.com" <sumanth.gavini@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH] shadow: upgrade 4.20.3 -> 4.20.4
Thread-Topic: [OE-core] [PATCH] shadow: upgrade 4.20.3 -> 4.20.4
Thread-Index: AQHdfCf5wIxQCUR5akuqd7amQDYhN7dAaDgA
Date: Thu, 26 Nov 2026 14:13:21 +0000
Message-ID: <3085864B-3AB6-4135-B33C-8663E1346941@arm.com>
References: <20261124152449.2973779-1-sumanth.gavini@windriver.com>
In-Reply-To: <20261124152449.2973779-1-sumanth.gavini@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PAXPR08MB6494:EE_|WA1PEPF00009B37:EE_|AS8PR08MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b031b4-2466-4f96-b7d9-08df4bc78202
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261009223027099003|22082099003|18002099003|56012099006|10067099003|11063799006|38070700021|261022105027099003|261026140227099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info-Original: VD1sht8xhs5CWeOmUFqCl7fj+vJ8VYdPf9XSnvUBEhed6k32zo8fOfeGd1hj/6AABTTYa/v8Bm4am6IeH4kHAwSxnldUV21ZFJBvwDpSpZ6o92RoUHP7rucxPnF5bFG5RWI0LvdwRUD0bcHa2ybOYUUcCrIwfyXnos92hqGb5b7qBEOnLA8tMBCk38CKZPR4dj3Xn1YnRHdqfp1fmhkUvRg8oooKbHcmP6iptGfioQ8zj7OJyiHNwgHGcnYhw23Q3Q3yakQttaywYoc+7GqExMpCNmIYZszP9EFglCSdopOvi77dFCactLVSkvRWz/I1Nq0zUDXdRHOOPGJGQQLl8lhr+dkYEclrXbJ9n/Ojf6BVIqNSDZoMTE6lxVLuGpThula3/Iw2apleiGAnWEt7VvnCR/ZOTfQzZSy4yVN5JPKFRkhDShK41MU0aE1msATBS0O66TGnHeFtQBpty2QlbsuqDvuOzypceFLSlfv6NBytBsTPKeD1sLkykfpp8C9dY6B4LvXLVqk2TJgTSVfkH8I1fMriluMlO5d4y+jUSiWyJ6UKO1IgWvBHENAU5K8V4iW1dNsLbaPdO4F+3An11eM+OoeJDuQ+l8v1B58wrwo3Rd0a6Hjd9PShmq1uruX5ywwp6uyf9u1ot/TCub6Jr2dB32F340gQVgsZwubtrevfejlgly3LhwzykRfPakBMLJ/ktrMIHbPGNhXQQWazjFPhQhmm6WsBxhfLJSOMILc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38070700021)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <93B77FEBA3534345AFE56860DD988706@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D3TswgKwAYaz9xr0f2drwqySN8t9FnWIiB7Ry6FolwFb399bBb8p/FNrgxiijawy+hF3CjS2ZJo8M/ClxDnzlApn8WJnGrVhBSXpT/9uM1OWNQ7V8nDOdauQdQ1uJNptX/EUQ+7dP3wIBH/7oV1iBfglFMP9RANiREb2EuqTwAvwudRvKCOTUnfqOZ2cBPSmP6qoUbN0vPOsHF8SqylH4Fi4njcl4OJKc0NX34GNrDhwCU5KQiHN3W/NKrCs5o/BGbIFabLRa/LaVgBp/u5zLc2ZzZSS3u/954RX/t93BYQPnwcLRPtiUxIeSjZ0l7dhQCkJWnZZ07ZPdOuyk1Wqbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6494
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: WA1PEPF00009B37.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b0c07edd-5ed8-4758-91e6-08df4bc76d6b
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|35042699022|376014|23010399003|14060799003|261009223027099003|18002099003|22082099003|13003099007|261028144727099003|10067099003|56012099006|11063799006|261022105027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: /qThwjm3QvkSaGPrFAtB7sQByl6f9sdx6/m79j9cm5rLLXL4DGwwxK7IYLimuPb3DPpRhKCLv1CqWOYN2QxdpFVnNfAJh3hhLVFz+9F5vFDMnDYxQ0vGw6wMSvH2yC0VNsMvJSpF2lGbdHzMHXmRPA7VS8GLvVFBbVdORgZkIfUi7xCv9dbHNoD8GEfKpjwZenI6IYrAR+i7bbubV6ZOwCwXl/ws3P80oRtdej5L7SDNw5DIpv7VTKAE7S+kXLfisRCvXly9yNRJJoqV3KaWkVCp3xR3W8NA4JvjtIOrB/pNuxzZyGhI4IyYEe2s6HD7BRN6ptXK0cV7yqWvTu42XGUo/MYYB+3r3UiW5atixXAruct+U1QQZU6344IE3kJbr311bogwWd93LCHsAN7ujzvhpu/LG//iKKF2AskXD5KNkHXdXSj68AcLExPfRdUzztrNO0hZUAXWDuoCg/bajo36eVQrB0e9macEbYmK1ogF+pxhg8PbF8uR7HQzr8KMTp2932khWsnawGKR8NG+ZZnWuPKmDaFObEUlDR7WttN53M4OsLgLNXXvdv/7a3OLpULLBVDF3YM0XSV2Ro8HOLDic1mmDQsiyKwG8SYxMeXOsjtIBMziTgKGW26A+3p9vfu+Gw1Zj/mCP+TwrT+tLBPWywxHZXy9teGBNxJ/ciwCxy9CvVDEwU+sItRJpiaJVqpK8nchs1jDt5s68R7N5w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(35042699022)(376014)(23010399003)(14060799003)(261009223027099003)(18002099003)(22082099003)(13003099007)(261028144727099003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RtxNmbHIwl16xpPrXvHTvSuDioCgakUxbqVMgKTtp1HYWF0xa/+1lrN/sg5oibFapFxb97OWaWFcmM084/8v0fAmXJ0iI9bjox3jglRqtel5x86gxA3asnPBOZ5YfhRxNr9vkaiHhGVNZ13y4lalHXct+GtyuvVV431r59jWuUffDEnEk5v6+rZhucOqXB2F7DImzv63eOQTOZUx3vcZJeK3RzOs8nu2/7Xwgt9zav457WDQ1CgjLRUyO+iRH8ch3GlarAbhANA/1I+iitIoXTckzl0cUeLZeBT8f96QIYypqngtNiXwLLGYoEUlqSt8khYptChI+UpC+gbp+cIJCda7FD27U8B7rfbNv7tcx2KrWRrkay6Fe+zgrk2dbk9gFTVQI9GRX6gpymkYo6UUnH0v3LNK+yEmL+j6/FCiN7/M7KBsrbLgdAjhkazer8as
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:13:55.9787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b031b4-2466-4f96-b7d9-08df4bc78202
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B37.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5975
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 14:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251307

T24gMjQgTm92IDIwMjYsIGF0IDE1OjI0LCBTdW1hbnRoIEdhdmluaSB2aWEgb3BlbmVtYmVkZGVk
LWNvcmUgPHN1bWFudGguZ2F2aW5pPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQu
MjAuMy5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjIw
LjQuYmINCj4gQEAgLTE0LDcgKzE0LDcgQEAgR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L3JlbGVhc2VzIg0KPiBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3ogXA0KPiAgICAgICAgICAg
ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3BhbScsICcke1BBTV9TUkNf
VVJJfScsICcnLCBkKX0gXA0KPiAgICAgICAgICAgIGZpbGU6Ly91c2VyYWRkIFwNCj4gLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtbGliLW5zY2QuaC1uc2NkX2ZsdXNoX2NhY2hlLUZpeC10eXBlLW9m
LXBhcmFtZXRlci5wYXRjaCBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5z
ZWQgXA0KPiAgICAgICAgICAgIOKAnA0KDQpSZW1lbWJlciB0byBjaGVjayB0aGUgcGF0Y2hlcyB0
aGF0IGRldnRvb2wvQVVIIGdlbmVyYXRlczogbG9naW5fZGVmc19wYW0uc2VkIHNob3VsZG7igJl0
IGJlIGluIFNSQ19VUkkgYmVjYXVzZSBpdOKAmXMgaW4gU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFy
Z2V0IGJlbG93ICh0aGlzIGlzIGEga25vd24gZGV2dG9vbCBpc3N1ZSkuDQoNClJvc3MNCg0K
