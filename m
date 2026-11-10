Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.187.1794324955833455669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C0X2MhNq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C0X2MhNq;
 spf=pass (domain: arm.com, ip: 52.101.70.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hQVTCRCrDci4//0+sVzksgU289YGH1R/qeTBL1OGNtaFS4NI6M1Mh24BiCS2C/0/zcmtFpv73+XYUhESsE6vrIuWFP6UTyEbTagy57Bxn4VzRsY8OlseymHzYNtEMHkR4IxXrgYkwDpEPZu/KUET1F4FRpSTm8jSwItQnTUYD1yoRgMu5aJswMQHX47N5e1tI3ML10EcBRr8UFCuuVZC60yIdjJ17vrUW4P/xgUEsCgYMaL8wf9DjApe80j1FbJM6JhsPGQYs4YOktQoRFmQlBDL1WmmmqTNm3/Jxtr9bTmri0bGKOfmMLF/jnllQ1fRXfDg0VTxS/LAIK+qj3Cm7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6c+Jjx/i+/xKe/fT/iasU7CZo8j2JCx8G2BQnQv4MI=;
 b=AXXIlxkRkWuj3GsF9YxBwKnYDVvNJehcY7kx34nGG5HKN/EfhO+6+kExW40tQ/34tr2m9PsyNpheToOUdvLM7quhsb0VjSE+nU+jm8eZasdDFDIXM7tmidpliRprD1pEPxbz1wiA/Id2aqWwkDhVGBIS36VCqATc+draNQ/uMM4nnDafD6BGjgKJUiXzfoIYbKWH3Ds1weTtKfbjxDyRT1sSuz059G0BHK3xO+/io1496+7xeX7OkC4ahVN7pfy1Q7iKxwrh0PFItkUfNs5CNtv5CsjVdmerado7bC+HuCugWQzTbupe8ExjvoYbVXk4peXJh2887mH71h91i31WoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6c+Jjx/i+/xKe/fT/iasU7CZo8j2JCx8G2BQnQv4MI=;
 b=C0X2MhNqh/D6Txo6FOFdUbh5fMpZz1sxeucIBlbs2gESxACLgC5mPWL1EzHFE9e85yiyWMUhyioBAEL014vZYT5Qi8BlRMQ436TLkih3Xn/qmZD0+cIG+Syu/tgp5K/dgj61cHIXupQ1FaLMWNz8oC0NRO4iJS90xbMLDR6c89U=
Received: from AS9PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:20b:464::29)
 by DU5PR08MB10439.eurprd08.prod.outlook.com (2603:10a6:10:520::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:35:45 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:464:cafe::82) by AS9PR06CA0076.outlook.office365.com
 (2603:10a6:20b:464::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 15:35:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0W7YglHiGj2KsbNh/wsSWC7ISV2v+XaCf0eil+gfLlnM2Qvw+LgQh+0xduEfcmvRs8byOHUANrYNpqW8UX2KvXc/iGAwNNVFVHC6iVWLUtsasFVffzk/l1xWcLwTKjivOKP581TFzM9EI3R09uVz+D7RJ1C7q9XwVQ7gHEG/wRy6WsgWu+jKqHvZ24p70HMkiBgC21Vhf+NLkDwuBxdN/LxArS4saXyv9pyl9d//dVKUOgFQ6o2egCzSNnRSxWdyqxuk3oGojzbAFVrP0s31KTra5awCWdVFNDvO34wxSHsCbzN/nd1GIs6fknGTrVR0cehhv5fbsYo1IHTVO9f5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6c+Jjx/i+/xKe/fT/iasU7CZo8j2JCx8G2BQnQv4MI=;
 b=SAqdDT//JSZnrRTElz8XKANBirgDejkcwwl+2zfHsW0j9zb2CZM2BZL7LYHs0lrpQZ0rV5hqVAC5ynJk11hNxSAt8mHnjsg9LjRqZRtKy/jlorZd6dG68vkBU6aqx1l3Jn8K3oK77vweO4ifPdVP9IifzD715+cgtbLF6rZgdYIajthX3850T062eiUIp+dozyGWihcr97b0gU2IBtSQpiCxue9vRwSXWTPuXLlK3GZ3/sP5rwbGTHaEsSVdwxMNVOZmMCEPvwhnifEVjehyGdhQU/hNlzLJNpipGKuFf/g57rCzoHmfgRzfMleMP6lEs718zEyrOhMWnBSZW9bTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6c+Jjx/i+/xKe/fT/iasU7CZo8j2JCx8G2BQnQv4MI=;
 b=C0X2MhNqh/D6Txo6FOFdUbh5fMpZz1sxeucIBlbs2gESxACLgC5mPWL1EzHFE9e85yiyWMUhyioBAEL014vZYT5Qi8BlRMQ436TLkih3Xn/qmZD0+cIG+Syu/tgp5K/dgj61cHIXupQ1FaLMWNz8oC0NRO4iJS90xbMLDR6c89U=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM9PR08MB6307.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 10 Nov
 2026 15:35:13 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Tue, 10 Nov 2026
 15:35:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 4/4] python3: Upgrade 3.14.10 -> 3.15.2
Thread-Topic: [OE-core] [PATCH v7 4/4] python3: Upgrade 3.14.10 -> 3.15.2
Thread-Index: AQHdbSDSq6Gr6RQXHkK7aqAteP99eLcnd9gA
Date: Tue, 10 Nov 2026 15:35:13 +0000
Message-ID: <51405D94-718A-4A1F-843A-E32DA0209993@arm.com>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261105122443.53245-1-jaipaul.cheernam@est.tech>
 <20261105122443.53245-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261105122443.53245-5-jaipaul.cheernam@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM9PR08MB6307:EE_|AM2PEPF00070CF6:EE_|DU5PR08MB10439:EE_
X-MS-Office365-Filtering-Correlation-Id: 65000d5a-a882-4cea-686a-08df3f404991
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|56012099006|261026140227099003|4143699003|261022105027099003|261009223027099003|261022075727099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: snKy9M2Xyp2Ve33GRK3tDPMPlk+A1d+jy0hkh6A03IQjjlAtb4UpmEbFmOKp2rEZGnLzlmtAIjCqkaIJQR3FJhrKlcBUtYzwiiUCtQf3oQrSgUCff3eUGEh38fgh2wEqaMQyyWGOdgWQvrIUL5JKbVhwIyxoCVY2v57s38apEGebiydJNJDlXhLQmiowhazqE8ZU8+Iw9AHiVtpjI7nWeGCt9+3SjDuVjQPDWNTOR2t+Mfvelkhp0d98MBxPC26Xp/GJTL5dIGIYvm9nsSFEaug/oWebaRLKqaAE6uTfg0+2LS634uOjuKtaDYBpm/hrKDeIHdosxPvPdKIMOxjLaJgGx/M/txL41Rt0Rw1PZGQUzuz5obw/sLIFbUcfS/YtPxEYcrw+2IoR1OdqoLNpp5zvoXWIF6v9DGgfYfj+u2iMfQeFN1zb/4g1hnIynccFRvyLm52BflUQ5XIePrM9zJpjMCLnyv1yszmo/qt+zhierzisHV9+pXqd2W14ZDOGzCSJqXLMZv6dVFA24tGeHDcH6oI9kbapQ/Vx820FGus6qfWlYolIJhNoH8zK499JPJOC6X8v4h0CFFC0sV9H9Wsu1mD3bQ8eq23qHBtPIbU0Q2xA5FSUs85iGoto0sSghSTAGq9l2GEFWONFAOlucpaShdkTvnz8U24+YSFq0a0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(261026140227099003)(4143699003)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <92A01825844F0246869916F0855A864A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WWyC0zTGInCyhg/UzYYFDcGTcMssj2EL/zHEab1ydYB/f5Gp9qnmNtx4GcLHwhCXzEdJkZZ3Ot5SnCeETkJGU/ANdnvsfUPIBflDlSrfFC6uYVkCoW0/E3Ln/5mXeaUB/OPL+z6LijcaGmgxizFbKQWR72D8RkHGLto7763q+jtUa0G9pZY+LSaY5c9Q6cKsaBNipjLJpyV+t1JsmiDqdzdzxbpMBqVpR2wTpTBnNk56TR4LvQHSDFgNn554mFfRi66J+1CQEFH7tsXZDKgZzgtRZAVHC4uvk6z/A4/PBl6tx1rVqCsYzpPWud0JBCrUZiUPedkCGOVeOluGNdx8VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6307
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8bf2adeb-d717-45d9-5724-08df3f403645
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|14060799003|1800799024|23010399003|82310400026|36860700016|4143699003|11063799006|56012099006|261022075727099003|261022105027099003|261021121427099003|261026121527099003|261028144727099003|10067099003|261102123227099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xJFKBCBmhK65yYfUCrYFoj+vFTsBhqCgwE4t1g/EKZFtmYaE/OdAlqUG+vw7J+D7bVZhXWLsIrSzwJEBZp6M+gYRdlcqVGwRUa+LiNbdk9WUogWa/r/IP7lx4YiElKOtSwV01VGVuWmiVnQ97Yb65la6xwoLawZamOQiUDC3gXZrmjX7kmI/m1zik8gWni8WJQ3/volK/ZvsRz/CFceCeNjWGrtdSqGoPL/gVwUxBnI4CNtpxjSUvRtsF4jLi8RX58PO70yBp0yGCPXMCqGCcusdROXsoEQB8+WeE7H/9m6WykFHq/m2FcsZMsHlLvXBSzXXa8efvcdWhn98CTbc/WvK80x7Z5NtNP3belOf7KHlx2MyLt9DciHa2vgaV1ai+qnq4eUYEy/pyRRyb8k0uv73IUD/xb/JD7zJtldDKmutVvOJ5ZiEyQ83rENRheULLWr+rlsuqy8XgtgxOWUgliQVAH24hojaR79CMD1w0qOaiY5i630OHI5QEBXkAhGGOrYgdldTxPSQefYHyNRb4m/lSFjZnlB7KDxIRthz7oRldJrl2Ff0u134W74iMll/I6KZYsweLOz9/9LJloa35Xb0C3eCBOXdIzu2mtFhkeYwzyO5wRwJr0wNzIojbgTddXH90gpo7WA8nyfcg1lIIPkIrTTqM3WN9vqN5TlEjf4=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(1800799024)(23010399003)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261028144727099003)(10067099003)(261102123227099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uiS8MoCmBwIoVSMwOGKgskVGSjV/6D1TskTlQhvL+1GsT36JedMPNj5wl0TI7dDRl9OyIkGRc2mEvlCXs+eeYh3SR22L6E8aoLHUC7sYRpvck57q224sUgBzYgZtvO9Z8OwsuN+z78U+TP+20Yto12qwq+uED/or7umM2ZZ9JH18HNeLb5F2dsDZm5j4yLmxHdkFuc0YFmstsp9vl0GI/nqDMxn2TQIwVbzUk/JV0uzWRHjldqL85mSR/sWGuP2crdCFwBm12gmG/sXwCd/DgYLdiufCOX34jdUMJoSAJhGmIKPrPXzGRYUBWweIgLLo/dO9CgW9EIVxJ59w/u5dJ7cUaGDgNKxWmeBQODi+bq7GeABH67pLk+UA784LK+eWB+fopEDg47KZJfNQYLdmavedi+01r3lQ8FTKScX/GeOs/vkEPq9HduWIe71dtGL9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:35:45.4243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65000d5a-a882-4cea-686a-08df3f404991
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10439
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 15:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249925

T24gNSBOb3YgMjAyNiwgYXQgMTI6MjQsIEphaXBhdWwgQ2hlZXJuYW0gdmlhIG9wZW5lbWJlZGRl
ZC1jb3JlIDxqYWlwYXVsLmNoZWVybmFtPWVzdC50ZWNoQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gUmVsZWFzZU5vdGVzOiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zL3do
YXRzbmV3L2NoYW5nZWxvZy5odG1sI3B5dGhvbi0zLTE1LTItZmluYWwNCj4gDQo+IC0gRHJvcCBw
YXRjaGVzIHdoaWNoIGFyZSBwYXJ0IG9mIHVwc3RyZWFtIHJlbGVhc2UNCj4gIC0gMDAwMS1naC0x
NDYyMDctQWRkLXN1cHBvcnQtZm9yLU9wZW5TU0wtNC4wLjAucGF0Y2gNCj4gIC0gMDAwMi1naC0x
NDgyOTItVXBkYXRlLV9zc2wuX1NTTFNvY2tldC1mb3ItT3BlblNTTC00LnBhdGNoDQo+ICAtIDAw
MDMtZ2gtMTQ4MjkyLVJlbW92ZS1zaHV0ZG93bi10ZXN0LWluLXRlc3Rfc3NsLnRlc3RfZ290X2Vv
Zi5wYXRjaA0KPiAgLSB2YWxpZC1kaXN0cy5wYXRjaA0KPiAtIEFkZCAtLXdpdGhvdXQtc3lzdGVt
LWxpYm1wZGVjIGFzIEVYVFJBX09FQ09ORiBjb25maWd1cmUgb3B0aW9uDQo+ICAoLS13aXRoLXN5
c3RlbS1saWJtcGRlYyBpcyBuZWVkZWQgbmV3IHBhY2thZ2UgbXBkZWNpbWFsIFsxXSkNCj4gLSBC
dW1wIFBZVEhPTl9CQVNFVkVSU0lPTiB0byAzLjE1IGluIHB5dGhvbjMtZGlyLmJiY2xhc3MNCj4g
LSBVcGRhdGUgcHl0aG9uMy1tYW5pZmVzdA0KPiAtIFJlZnJlc2ggZXhpc3RpbmcgcGF0Y2hlcw0K
PiAtIEFkZCB0d28gZml4ZXMgbmVlZGVkIGZvciB0aGUgbmV3IHJlbGVhc2UNCj4gIC0gMDAwMS1n
aC0xNjA4ODEtRml4LXRlc3RfaXNfcHl0aG9uX3Byb2Nlc3Nfbm9uX3B5dGhvbl9zdWJwLnBhdGNo
DQo+ICAtIDAwMDEtY29uZmlndXJlLWNsZWFyLVJVTlNIQVJFRC13aGVuLWNyb3NzLWNvbXBpbGlu
Zy5wYXRjaA0KPiANCj4gVmVyaWZpY2F0aW9uOg0KPiAtIEJ1aWx0IHB5dGhvbjMgZm9yIGdsaWJj
IGFuZCBtdXNsDQo+IC0gdmVyaWZpZWQgcHRlc3QgZm9yIGFsbCAzNCBweXRob24zIHBhY2thZ2Vz
IHdoaWNoIHN1cHBvcnRzIHB0ZXN0DQoNClRoaXMgaXMgYSB1c2VmdWwgZGVtb25zdHJhdGlvbiBv
ZiB3aHkgSSBhbHdheXMgcnVuIGJ1aWxkaGlzdG9yeS1kaWZmIHdoZW4gZG9pbmcgdXBncmFkZXMs
IHRvIHZlcmlmeSB0aGF0IHdoYXQgSSBleHBlY3QgdG8gaGF2ZSBoYXBwZW5lZCwgaGFzIGhhcHBl
bmVkLg0KDQpDaGFuZ2VzIGxpa2UgdGhpcyBmcm9tIHRoZSBtYW5pZmVzdCB1cGRhdGUgY2F1Z2h0
IG15IGV5ZSwgYmVjYXVzZSBJIGtub3cgdGhlIG1hbmlmZXN0IGNvZGUgaXMgZnJhZ2lsZToNCg0K
PiAgICAgICAgICJmaWxlcyI6IFsNCj4gICAgICAgICAgICAgIiR7bGliZGlyfS9weXRob24ke1BZ
VEhPTl9NQUpNSU59L19zdHJwdGltZS5weSIsDQo+ICAgICAgICAgICAgICIke2xpYmRpcn0vcHl0
aG9uJHtQWVRIT05fTUFKTUlOfS9jYWxlbmRhci5weSIsDQo+IC0gICAgICAgICAgICAiJHtsaWJk
aXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vZGF0ZXRpbWUucHkiLA0KPiAtICAgICAgICAgICAg
IiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L2xpYi1keW5sb2FkL19kYXRldGltZS4q
LnNvIg0KPiArICAgICAgICAgICAgIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L2Rh
dGV0aW1lLnB5Ig0KPiAgICAgICAgIF0sDQo+IC0gICAgICAgICJjYWNoZWQiOiBbDQo+IC0gICAg
ICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vX19weWNhY2hlX18vX3N0
cnB0aW1lLioucHljIiwNCj4gLSAgICAgICAgICAgICIke2xpYmRpcn0vcHl0aG9uJHtQWVRIT05f
TUFKTUlOfS9fX3B5Y2FjaGVfXy9jYWxlbmRhci4qLnB5YyIsDQo+IC0gICAgICAgICAgICAiJHts
aWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vX19weWNhY2hlX18vZGF0ZXRpbWUuKi5weWMi
DQo+IC0gICAgICAgIF0NCj4gKyAgICAgICAgImNhY2hlZCI6IFtdDQo+ICAgICB9LA0KDQpXaGVy
ZSBoYXZlIGFsbCB0aGUgY2FjaGVkIGZpbGVzIGdvbmU/DQoNCmJ1aWxkaGlzdG9yeS1kaWZmIGNv
bmZpcm1zIHRoZSBjaGFuZ2UgdG8gdGhlIHBhY2thZ2luZzoNCg0KcGFja2FnZXMvY29ydGV4YTU3
LXBva3ktbGludXgvcHl0aG9uMy9weXRob24zLWRhdGV0aW1lOiBGSUxFTElTVDogZGlyZWN0b3J5
IHJlbmFtZWQgL3Vzci9saWIvcHl0aG9uMy4xNCAtPiAvdXNyL2xpYi9weXRob24zLjE1LCByZW1v
dmVkIGFsbCBpdGVtcyAiL3Vzci9saWIvcHl0aG9uMy4xNC9fX3B5Y2FjaGVfXy9jYWxlbmRhci5j
cHl0aG9uLTMxNC5weWMgL3Vzci9saWIvcHl0aG9uMy4xNC9fX3B5Y2FjaGVfXy9fc3RycHRpbWUu
Y3B5dGhvbi0zMTQucHljIC91c3IvbGliL3B5dGhvbjMuMTQvX19weWNhY2hlX18vZGF0ZXRpbWUu
Y3B5dGhvbi0zMTQucHlj4oCdDQoNCk15IGdsb3Jpb3VzIHBsYW4gdG8gcmVtb3ZlIHRoZSBtYW5p
ZmVzdCBzdHVmZiBpcyBwcm9ncmVzc2luZyBvbiB0aGUgc2lkZSwgYnV0IHVudGlsIHRoZW4gSSBq
dXN0IHNlbnQgYSBwYXRjaCB0byBmaXggdGhlIG1hbmlmZXN0IGdlbmVyYXRvciB0byB1c2Ugbm9u
LWRlcHJlY2F0ZWQvcmVtb3ZlZCBjb2RlLiAgQ2FuIHlvdSBncmFiIHRoYXQgYW5kIHJlZ2VuZXJh
dGUgdGhlIG1hbmlmZXN0IGFnYWluPw0KDQpJ4oCZbGwgbm90ZSB0aGF0IHRoZSBtYW5pZmVzdCBy
ZWdlbmVyYXRpb24gd2lsbCBjYXVzZSBsb3RzIG9mIGFubm95aW5nIGNoYW5nZXMgdG8gdGhlIGNv
bXByZXNzaW9uIG1vZHVsZSwgd2hpY2ggSSBzaGFsbCBwb2tlIGF0IG5leHQuDQoNClJvc3M=
