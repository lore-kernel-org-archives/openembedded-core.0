Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35334.1793887628686271848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VLw0BcAv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VLw0BcAv;
 spf=pass (domain: arm.com, ip: 52.101.83.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TtfC0wWf/yGzdaYL2AH+ZvsuLCYxCvQOGPWG3/nVSNoNdx6yFihsuNPO0cInKmKeWX6ukEk1qv216X0vRocBoOf6QSmDqkjOMzlXw9JfnQ4DM60xLiFWRNlPhGCdI/ao/g/xPxcf7Il+VPzCA2PH6OW2tXnIi9oT4GeCmQ6Ex1TC6wRgk4a4CgvzIcOEeVXOPI+cjnNHh3BRcAom9LaNE/jDngcAV8MVkEXvT3ukJcaycilEdD5lQ+QabWJw5OpyGRo9hoX1g4jNyzOXpiHikFgCgf9FnMVQUqXXR6CIyYzZLLirmiAr/Xeqjxi3D6qYhPX2WS18vvDQgSRYDh9qdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0QVw453t0IJGBJ9rcXg/gk4QvYbX1ezNnOcWM+M2kY=;
 b=ZdD6bdW/ejLKJr1fKCheu+624pHzNuSdoN9/LmQrxwzoEA/OS87HL+2aAdyVxYe50mOWjmsySJn85GViFuwl+ra6gsS4ZF9vB/StwZyMedvosQIkufVO+6Xtt+IGD/w+IzY+VCc5LLuMmwxH1Z8tw62dt+3gQOWybWjpvV1JaTLyaMhGDAtL9GeqgmuZA4fgiu80whR/oX/fzase3jMQWdg1JhO3T+/WXxn7YVSOfLaA1khOGDpsfpBvdVWTWGPhp6pR2XGiS2G9+8Jksd5orCT34/ZfComHEru56dNUM3vPnLAWQuj0zHHWR0YRWsK/SALkvRJcwqrZDuENkGHmgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QVw453t0IJGBJ9rcXg/gk4QvYbX1ezNnOcWM+M2kY=;
 b=VLw0BcAv3mkgDT1YGNltqktkYW+WMgQLrOqKYDHtQch6VyCykbYRycwDmBVbZNv/SN+b/joEUv+HAhlUKjSiMozw4k6lsJsdB8HGYcK+CxdcsndnmuGuTkTliRxd0tLcU2uUgBBP8GBGXu+AhBDew0b+NodaVY4nhruRMLMov8k=
Received: from PR3P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::32)
 by VI1PR08MB9960.eurprd08.prod.outlook.com (2603:10a6:800:1c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:07:03 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:102:50:cafe::22) by PR3P193CA0027.outlook.office365.com
 (2603:10a6:102:50::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:07:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 14:07:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rla4KjJeyeXeaODEjCaVNLgBdjruy/ll/DtloHq5nymwoC32W/SbAkaXfhKPjZwGSd3ixHWE2vlSL8ZX0cUY4jqb3e9JjFxPMT2N/mRbGdeNdSqEU+sW3E7+sOUMkYFtJ8Ypr5/fIUuIYRNktQF+rK9442lfZ7rvCI9uX7TWewIUXbDAXFpaKpYpzNuC1Bk4q79DqkFQhxQRfnXKTjVXkTNJFriZd1Asr8tQ3lyin9maZz6dpazUHwrD2toh74yrnBZECFebA5UxPNWi5aOpyzzapP5m9XTcc7KBytgP6R9bCHAyfZYyBcPiczLkKL7pPRrBuwXZuiVraJR8k9LI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0QVw453t0IJGBJ9rcXg/gk4QvYbX1ezNnOcWM+M2kY=;
 b=ral2ZVVHoLvvhOBA0K7xRlJ4usBCrVgHLnP6zF5nwgud/rG5iK50FdSVztYwngm5t9vUOU2NVxE81Jq2rmAoUqtua6mLjQdrgl5pHeayMBc7/E6DLmCYzJViWifIeOSaKt5WP5jZt+KJL9feCw65faYQ9Nl23yULuUopfzbssINvDi/OQB1hZ2am+8G6jmyTAqR1E794kHd61MrS1x6nOwS9fFruff/c4sEanKepdrxOToVjjyORJ3mCDF6tK94kz6XmrJGX6/VzoqZrufeZOQibzqxJmTA0lI9C7Jl+2iDL04xJ1/ZPqxx7CD3fLOglnF/mWt5NOC2zcKCFrDq8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QVw453t0IJGBJ9rcXg/gk4QvYbX1ezNnOcWM+M2kY=;
 b=VLw0BcAv3mkgDT1YGNltqktkYW+WMgQLrOqKYDHtQch6VyCykbYRycwDmBVbZNv/SN+b/joEUv+HAhlUKjSiMozw4k6lsJsdB8HGYcK+CxdcsndnmuGuTkTliRxd0tLcU2uUgBBP8GBGXu+AhBDew0b+NodaVY4nhruRMLMov8k=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by CPH1PFE47673673.eurprd08.prod.outlook.com (2603:10a6:388::516) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:06:29 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:06:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] libzip: Inherit lib_package to package the
 tools separately
Thread-Topic: [OE-core] [PATCH 2/3] libzip: Inherit lib_package to package the
 tools separately
Thread-Index: AQHdatN5GP2+ZwG/9EaR4UtQLkGg9LcfiAAA
Date: Thu, 5 Nov 2026 14:06:28 +0000
Message-ID: <B89343EE-A79C-4FF4-A202-331200EADE05@arm.com>
References: <20261102140700.2707257-1-pkj@axis.com>
 <20261102140700.2707257-2-pkj@axis.com>
In-Reply-To: <20261102140700.2707257-2-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|CPH1PFE47673673:EE_|ZR1PEPF0000E6AD:EE_|VI1PR08MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e51d9c-d122-40d1-385e-08df3b4610eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|10067099003|38070700021|56012099006|261022105027099003|261102123227099003|11063799006|261028144727099003|261021121427099003|4143699003|261026140227099003;
X-Microsoft-Antispam-Message-Info-Original: QOVPexbY5RJypakkIU1ewX9aYsjgiSYoNhW+5ENjeGUtouSF0NN5cyCPDMSy5T21CelZ6SAreAFs0Mprd7nMVkSqf6AalnFrTljmHtXTXmqGyXdDtTJ6ps+3/XhAIzSqrL3P6goKRCt2pBnDqJxlbODZmRMr6OUht06W8Hf/o8yceUUBeGaxd2WFroe0BNeJ1pnY3eboU6vqzwi/0LQS5aE94RXXgMh4cFbujmhQIlUStWyL9UqQMKY1KRYZy+5mfwC8F+fDYVmXXhEN8OhWpeE7S4LTPDccl1vVQdMLXK10BjUPzmIWQQn3ezqXggjf1jIl42KW+GQaBMA48GBdKd9YUq2O2AmLc8koftqJrSe9B3WnxBe7GDUUOkJm/uz5y5637FrlHPbgULbF6kIq9fIC+YcFT40JwPPM8wzi38LBWv6hgwTeu/zlUwtUXViqfyPFIkWTrMuY7S67J8N3EM//jNGbAamKzpxWdbxho+2v4weooGi2s6V4VTHsmOigYQQxxIO6IIOGmho1Weyu7HOE14/ftbkjclu9BUdbi32YAujYsAiXRTQz0F7cQ1x9OfNDVjULTAM6ioWdP2uVlEbNeeB0xhpzL4QwMdtJ19K5EsE3ctvbovX0GuiAxEXBw+jqVfPLrkARkyv/+7n57soe41q3aHP+x0Q1karkuFOOHlV5AE+m3C7/4/QmAj0Z92bGr7jLX1uIcLABuYEA/w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(56012099006)(261022105027099003)(261102123227099003)(11063799006)(261028144727099003)(261021121427099003)(4143699003)(261026140227099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF55770C8EAD4B41BE0F57584ED462F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NP2FwAryLmPXFbbOsXEmvVtHhCtIunAkabRx7tgmKpsx+DEdLMcVE0tsfNUwd9SZFnz2lIgSNSuQHfRc0IGcIwzSZeiYCA4JJuOKgt4/IR54PXhoUFe4DqP7WLpMClFWK0ZvNsrTlU56XX9/T/4/O4qK04P21LuOlNubcmg+dMB1ABaX1xiSRdvIX7DRJ2WSxHVrcmuKGYdImQwvmuX6b9mLfTBlXGCpTVHonQifFTB2Eh35muFMt6aLpLovtRkhs554MREtbAm8zXE1OJXNTjY+hJeimcfDjzCHxk8EG1kvcgiL+34nS+8eevbQbN4ywRVCyBkf/z9wFFi7BcpmxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PFE47673673
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 089663fa-c7cb-42b1-2ae0-08df3b45fcbd
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|14060799003|376014|23010399003|35042699022|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: JhMNyCLAM9cyIbN3RQSAjupbUjTAj1M2BKQZTM2kN0X35UNsOapogtU3tDTkUEbV65XfDv9tI7GCBMlnWniSfaQaib6eZWCYE3ml8+66IfELQvt3EeL9LCDZkrtdQ5coepzhBF/et5V0tBU8EbbFty7hI1+FR67PI4jirwP1XjZ/t/wBzH4a5iSFeGPZBMEKCmhRbxr4zUjvDI+0eyU0+ToTsGdR8Vg7X7YniWP/W9x4vNRVNvSdeD5h6HjfiFyQaZKobjc2FhpDqKnLsEwGvtT5oKtCKBJsSVc5EmZOMUBhp7OXPecI+1nzNxB6rsOnj3IbZDkCEiaVizTSjXgEj7A6MyDuSw4woa5xbUSnPtEriHH5Wvyqt88xO6NAUAxtb4PGMdbsHXzLaGRBdMyLxgqd5IF8WPUVaVYYnew7ZPomOzHkyBvw5/xwJcuqOQZ1fpfvqlY1g462Fd8YCtBV+ORk6dbZsHdYDsHHErr0c2ropN+KeHqPzHguxEJSo73C6Z16PTT6D0zQSjp0sEfk5k/6J9YevH0UX3rlwIad5/Jl+9JOBg9tMWB7H7i3bJAU6hV0MCab7j55BsT7e5F0B68nNBMeX/reUgepfRgU5OeTMqbCHU1SUlx5IAln1c8DJRGz28HYa0uXIfNmA2zaef6Xc+PletaGYl4ebPbJbfGlGeRJos9LXkT8b8zqtys4NKVqB8uRldYtYhBOYGspuA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(14060799003)(376014)(23010399003)(35042699022)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MQco2imYk/70G9FlmRs9W5xeQXV4FqrLRzhDKuhRK41VTJO/QOPYQoSd0+aFHhJ8RqBi9u4WJnK6DzYPiaQ7/VwkDtcdCe35c3csVcHMxoytep7jxm8ysYMFa7aRJ1vfpDL7doRSPEWidrLTXOG7pcB+IMMLDaYlaKoh36zFEN0akL1cnah3BqXcd0EgNiBWFNZjQ1CbyFUlxYuu/1YaR35ix7mt1aJG69IMg1GVRnX3W7fUuOlnN/9r1GA3AZOOj2sVR7jXvvYE0PK8j8FO8db1J5naTlJrpVqoCDsPESDUupXKUjuCKH527vOr6yIdzz7hJaV9ln06cI0cThsZ0xbgQ5ZEAIpr+mQ6JZW2g9AFWsmsTwzUAI8skLGPAluiURyaKE1/2CFamHqXVhwo/6ks67SV3PNi+xoom0zoWWsS1nDEUK7oAWlOlqD3iUDx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:07:02.6611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e51d9c-d122-40d1-385e-08df3b4610eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9960
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249551

T24gMiBOb3YgMjAyNiwgYXQgMTQ6MDYsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgb3BlbmVtYmVk
ZGVkLWNvcmUgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gUmVjb21tZW5kIHRoZW0gZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
LiBUaGlzIGFsbG93cyB0aGVtIHRvIGJlDQo+IHNraXBwZWQgdXNpbmcgQkFEX1JFQ09NTUVOREFU
SU9OUy4NCg0KSeKAmWQgc2F5IGRyb3AgdGhlIGNvbXBhdGliaWxpdHkgcmVjb21tZW5kczogdGhl
IG1haW4gcGFja2FnZSB3YXMgY2FsbGVkIOKAnGxpYnppcOKAnSBhbmQgY2xlYXJseSBtZWFudCB0
byBjb250YWluIGEgbGlicmFyeSwgdGhlIHRvb2xzIGJlaW5nIGluIHRoZXJlIHdhcyBhIGJ1ZyBu
b3QgYSBmZWF0dXJlLg0KDQpSb3Nz
