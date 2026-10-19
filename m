Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27.1792429637022007855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 10:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MTdvIsch;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MTdvIsch;
 spf=pass (domain: arm.com, ip: 52.101.72.31, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AJ6bV6B2mGIo+HShk93gc9cBv/TwnzFpsqfPG29s3e3hwhoAvs4TOF6vwD6i0bIoxI85Rx7hoxKYas13YSrrJfHF0GpbRDQkzZsSUugKiqtZnqs6FwfUuu+NNOdQFRUAUZOdQh72NUQAtZtP9Tg1HRBCO941h1dc1ah0xU8Mc3hZJfY7/BOj/UGBDxzcOBK7AfnJKtBb07bAazbaloA9vqF3jqRCuidij7xzEzk3ZHRY7EY1TKyA3/FPkm2bTRt+ygcRdDoCkYgqDBvkLmfoQY/ifmpusq2elRjLhOlV6LKx4no0k4TwX7O+A/6KSbSC/hiR7Ms7LRHLd5AXw6JOvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+2Jwhu1slR5uXtCfer40Hknj/DxJmjeRKKcma19KW0=;
 b=tSgHcrps7tNFVYkT9BzyOFM2MhaHe+DVgOJC4ecliRT3IHfnUZUM3KcWfWQhRgCwUx6R7qskwoVfV7LVY6z/v+EsTizEaWlRhLmnqzFBTmsQh3SN8CsCEeoL+fP7T5/u3veON/ajrWxRJloSvd/taP0RsNiGQYR6Y7MC8HiELKyO919onQ8ykp3WSYo0Uf19LB9JLS6koSXZgQZPf9tIdZwDd4rxCHs1G0d3WWY4PWNy4hV7Q4CzvMH2q6bwyqua+8Ybt1vMANb+z4sEcRgJ3/llBDdtuX+EbMmAkoEa6kE7hY34NZ8rDi9PAebi23Li102ox/1zn6Td6e2mzKIKWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+2Jwhu1slR5uXtCfer40Hknj/DxJmjeRKKcma19KW0=;
 b=MTdvIschM24xCYf/9rV/pNsDC46vrlSnIGETv8FLwT1D6hGZ77vGqMTg79DcWsRdlfXgDFqiNr8NM319E05AUla2tvlk+FDk7c9Xznzjh6f5ii49rLPUjAORcy5QFZD0sRdYZMxGfZVW0t3FFKEqLCn8fsIk9FaMlC1CxyhfpAg=
Received: from GVZP280CA0038.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:26f::14)
 by AS2PR08MB10208.eurprd08.prod.outlook.com (2603:10a6:20b:648::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 17:07:11 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:150:26f:cafe::73) by GVZP280CA0038.outlook.office365.com
 (2603:10a6:150:26f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 17:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 17:07:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAGj5TXjeyG4vvAEIP2zJ76+hq5Vt2+DJaJd1VYwXWIRhBZjZxJXzaU3EB//SpDEqlZJ9ptbklRokJLyqCaprO9Lxs9ABmAYkuwGjBiRexEyeBTWNYonvsn5JQ2hPYo0nrIOI/5sXpuspEJ1R5Ti6+1MjNIn0c2auja6U+Xk5elv1ccI/5/XoP8dFfMr3K2HXlYLHs9oCPcUhBbtp1NEFifR5cdHSAdGXOJeQu2HSjMW4JIzs7CKOJTxQMYT/y10rsYcJClgA33Cm74P3/PH7Xy82iP9vOrfd4UAkfZBj3r5D99a60ZrX5HjYcghY55bno8Iycb4uyyGOqrbFBQaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+2Jwhu1slR5uXtCfer40Hknj/DxJmjeRKKcma19KW0=;
 b=KLXSb81L0ZmXUuB85JZ3pUFbRyw6raTPttLLgIrhvpu6PaBa1WdGKRBUjwAfjM8SqHCipDyTOvah48qyedLFXFvVBBGY2DxZ5TMebwuMcmhyLkudrDtnmB3wlc0IWGNDjIDP+TqJunTxXdVGuhHygIR9LE7J850sT+T//i6vYJjfry35HO0Ci1yJGsr/hk37Y2/c+hTLcJ7s2rruiWRI57MZ0QEevy3XcM85bWPXWDJJPAN7VKJyyQC18IDsJDRmuEvj//5p4oHWQZ963ZwLlxm0Ah/A6B3pWCi8HIs7zA3fC4Inxt0qRFeRoe97Y531qOeX39XvWi3wJe4/L1bmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+2Jwhu1slR5uXtCfer40Hknj/DxJmjeRKKcma19KW0=;
 b=MTdvIschM24xCYf/9rV/pNsDC46vrlSnIGETv8FLwT1D6hGZ77vGqMTg79DcWsRdlfXgDFqiNr8NM319E05AUla2tvlk+FDk7c9Xznzjh6f5ii49rLPUjAORcy5QFZD0sRdYZMxGfZVW0t3FFKEqLCn8fsIk9FaMlC1CxyhfpAg=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PAVPR08MB8798.eurprd08.prod.outlook.com (2603:10a6:102:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 17:06:35 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Mon, 19 Oct 2026
 17:06:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "oo.hehir@gmail.com" <oo.hehir@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "tgamblin@baylibre.com" <tgamblin@baylibre.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 5/8] tcl, tcl8: anchor the musl unixInit-3
 skip to top-level SKIP lines
Thread-Topic: [OE-core] [PATCH v2 5/8] tcl, tcl8: anchor the musl unixInit-3
 skip to top-level SKIP lines
Thread-Index: AQHdXioydMm9WlnrDESoymV4HSdYUrcFHAIA
Date: Mon, 19 Oct 2026 17:06:35 +0000
Message-ID: <DC649D85-F711-414E-92D2-0A00E3D0099E@arm.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
 <20261017112358.77434-6-oo.hehir@gmail.com>
In-Reply-To: <20261017112358.77434-6-oo.hehir@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PAVPR08MB8798:EE_|WA1PEPF000099CF:EE_|AS2PR08MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: e8de307a-7c20-4185-e9e1-08df2e03695d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|10067099003|22082099003|3023799007|11063799006|4143699003|38070700021|56012099006;
X-Microsoft-Antispam-Message-Info-Original: FFhqiadwJ7vkTyL6HXZMJ5wP37JEQXn5Omopu8xmlSEf+k0alWg6G77b+GsA3SCS+AF/KQKaJI2T68y8GR+R1Uan1JN9DWhiB1bHgGlOpqhRqLV0liYKfSwzOoVPfdVpZmLipRkhWPEqfFQiu4jVCWRieb2AnbEjzbXN/42OX2Zhub9l24aq7bLwVX+Ct8AYJczYXAeOn57ornGorgkim9FCfL1VT207eEAXspZWvwXfj8YLi8PQZVgocGTAqMEJG0I1PjRMPIvU1QBfnPgotB39UrJp1Rj28LyNhzWb5AU5kvgZfOSF6czeCLO2w2E0/DU4fxpwNMIFpCC7GLbBm3Y6slvYVd4iTyODOWjwqBZFAZtqw/Xu6x9Kf+6nqY6vIDEhwtTJ5EGMaU1XVY080uLVLvuAmFgtTA8vgfdJemNS0dxBPwybVvHTkLS2HCYP/MOVO3icfs3CqrknfqbKbBLSiJtQR12aTJcamlCIUhts4ZEHmk9xydaH59Ebt17sISDp5+NXpKApE+zF2Btbls8aiFCMk3GBPsWMgLK2ByFhdR+x2XZeIdXI/l7V0B89utfZynwwCfOLnGs+ZbjaWyIEsmGcwW2Djoyj4EMbPBWADslzvTWS9kxnt+DaHe16V09jnqHD5cMCxbFH+yRWkkBWPNYZxtaaRcaW97bZLuVxp8Bpbq6DiQ62fA99qs+vDXJrTS08kKhi9P/2y1L3kTLUe4b3kIB/EXMVsMIzs/Q=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(3023799007)(11063799006)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE00F2EADF08D04EAFC9624A6B3DCBFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wWFZxHWsbhDSNJh00qb8cjt0WmKmwxYtABeYU0HehW67Mxmoerb4J/cBnN1esKvM8XQRuHxWf4hO2TlGGgcvnLQTrv0Nf5m60gj8VWKQYjwVCepeOjhcrZL/s9XhDSaVa6ugx9nlZjZjhbMHIPLEzcNcgaIvuiPuSdP9IJKuA21byFikctZIY3c8ufcWp1ktA/cDqv+9TautNoc/hik5rM2RActapZ/Na9qIvkpNKkKgC6kUPrjF+ClRKmKM0OXGw4NnlmaI1Viz+oxKXx7OD82dc91I5YRUg6KSuRoS0+s/mPqP2m5FRfr30PuXjbXKbbtRQh5j0OZBwlP1mHwL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8798
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6a1febd3-02be-4f50-f075-08df2e0354d0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|14060799003|82310400026|36860700016|1800799024|35042699022|376014|22082099003|18002099003|10067099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 1+jjSuoKq6WboR1i5c4k4oENbr/F+TNcYZgIVVP0+zWPamERW7iyjFOA4yRe22QK+ucIa/o3tdPPM1A6GM6vZkPxnA+g6URcG+YQH8Uvjig812BMuVFlwfFNG39nhts50rK3Diy/NrOZ4ouTo1fSu8YpQXcgKcInrV1aSz+1Mu4Vi6/1DPLR4qDzzTu2OaeYFdp6CmBd7DB61N9AqWe1ND1K1WBRk7oT7hFVfGSYPcya/cVUaQRnRVTANqTS3TskHhg1Y+39QZLKfyZ7W6eSfJY6Qmd0/w4c7mBtmXLoJR1w3AmqmXb/174y/iIiOqzTxAfoPoJ/fVOmoHWM9XcZAI3plfg2eiTic/g2Hx81rA9CJz9KSOJ+EbImS0KhUzhct2XS1n2QK2+L55AFUPEdViJRpTLiTiKKFJJ00y4hoKz2VpPyGTKK4UGFelc2eKlI9h2mCQaeGyZeWSDEY8RLAc7/7IFvqM3b3wo6llb/1gsf0sv5HIL626NRAwkJQMAfAeZxlo03ByeB2BZ48OpKv2N98rPCI1uWFJGI8QP4N/nX8T74V1F+6OUhZuV1zancZR8HzzpY5deL10WRK71liYFs/2UAIkl61MEpz6p/7EXvX7KmvhoWFX4Q5hwa2aMLdixdW6NvAgttTzNJr3PhXAiy7WFVbDHoLSpBN6oq70cKK30SH7QSTQALC+EEt8ADVCmnk09HvkyURGk4vlVdYg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(82310400026)(36860700016)(1800799024)(35042699022)(376014)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jFb7G+nT1CLwwLfdn6e0+GyHRjv6XGiW4Wli4bNE8MfMZABBO5dKp1P7RBrW4vrX0Vr1zOnNjtAzkyhbGRdy+m0LGEg4/ckqZGpeQwvFUbUSPa5SGTFJXJrQVNZ53R45U5N4Rr0zflFgUrJ3c61I/FwkMgRXZGWZezDSOmUsMF1/nnFnMeU+tPyk6qrfpGlFPO0KXxKx+EOPizxSFofkcMBnDboVkHzdHEsBtsMQd9J3BSE719/CvW0utrfEv/VFkCAF4g3p4XQeaG4W1/GmF536dN1LPOKgC2NxncwkraZ1ATCrF67bzEKyTfxsjHVLVThn29cfMpNhWSwxb7JDN50fQDZJZn5tZuE5RTxLlWaleIgouIpnWLjvQNlkayEJWuqhvjVuFF1yyOYnyEqsRnZPF5u/m3S5emroL1oRf2C8QCvKUJp83xcoxiz67o0U
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:07:09.5546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8de307a-7c20-4185-e9e1-08df2e03695d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 17:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248198

SGkgT3dlbiwNCg0KT24gMTcgT2N0IDIwMjYsIGF0IDEyOjIzLCBPd2VuIE8nSGVoaXIgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9vLmhlaGlyPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIG11c2wsIGRvX2luc3RhbGxfcHRlc3QgYWRkcyB0aGUg
dW5peEluaXQtMyBza2lwIGFmdGVyIGV2ZXJ5IGxpbmUgb2YNCj4gcnVuLXB0ZXN0IGNvbnRhaW5p
bmcgU0tJUD0iJFNLSVAuIA0KDQpUaGF04oCZc+KApiBub3QgdGhlIGludGVuZGVkIGJlaGF2aW91
ci4NCg0KVGhlIGludGVudGlvbiB3YXMgdG8gYWRkIGl0IG9uY2UsIGJ1dCBvYnZpb3VzbHkgdGhl
IHNlZCB3YXNu4oCZdCBjb25zdHJ1Y3RlZCBjb3JyZWN0bHkuICBBIGJldHRlciBzb2x1dGlvbiBo
ZXJlIHdvdWxkIGJlIHRvIGFkZCBhIHZhcmlhYmxlIHRvIHRoZSByZWNpcGUgKHNheSBTS0lQUEVE
X1RFU1RTKSB3aGljaCB3ZSBzZWQgaW50byB0aGUgcnVuLXB0ZXN0LiAgV2UgY2FuIGtlZXAgdGhl
IGJ1bGsgb2YgdGhlIGVudHJpZXMgaW4gdGhlIHJ1bi1wdGVzdCwgYnV0IHRoaXMgd291bGQgbGV0
IHRoZSByZWNpcGUgYWRkIG92ZXJyaWRkZW4gc2tpcHMgdG9vLg0KDQpTb21ldGhpbmcgbGlrZToN
Cg0KSW4gcnVuLXB0ZXN0Og0KDQpTS0lQPeKAnCINCg0KVGhlbiBpbiB0aGUgcmVjaXBlOg0KDQpT
S0lQUEVEX1RFU1RTID0g4oCc4oCdDQojIGNvbW1lbnQgYWJvdXQgd2h5IHRoaXMgaXMgbmVlZGVk
DQpTS0lQUEVEX1RFU1RTOmFwcGVuZDptdXNsID0g4oCcIHVuaXhJbml0LTMq4oCdDQojIGFub3Ro
ZXIgY29tbWVudA0KU0tJUFBFRF9URVNUUzphcHBlbmQ6cmlzY3Y2NCA9IOKAnCBiaW5hcnktNDAu
MyrigJ0NCg0KZG9faW5zdGFsbF9wdGVzdDphcHBlbmQgKCkgew0KICBzZWQgLWkgLWUgInN8U0tJ
UD3igJwifFNLSVA9XCIke1NLSVBQRURfVEVTVFN9XCJ8IiAke0R9JHtQVEVTVF9QQVRIfS9ydW4t
cHRlc3QNCn0NCg0KRm9yIGFuIGV4YW1wbGUsIHNlZSB0aGUgcHl0aG9uMyByZWNpcGUuDQoNClJv
c3M=
