Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35946.1793889751972169565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fMd1sAE3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fMd1sAE3;
 spf=pass (domain: arm.com, ip: 52.101.72.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g7jNpD0vSqYFrb9E59cgyGUcBMU3PY/k2fSyqbQw2muc5HqRlNxK4Wsy7pxgnnfQHDDJqo7UgSFVIJLLjOTzW8THAjD5mulKPOxE2gM2uTgjrWnrlXwkcQDqnJ7RnoA1MpIBSMXTKbAM62D9YLdNSRb685EaMep7KeM+UTi17GlSRqLKfHtSYoY2z3ltsOATYkz074yszdP0PlUyfJe4c65EKA6ATxCoZBeJDyBjqw3qy/hq9tzC5j0rz1HeWwDh5N8hBL+65snO+4KnP6vbiMJWJTlSJyXW+r+QUefKyO2bgV0witbQ4L9maz0uhOX+B9siSyfyYo+pM/A0do28cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C31QotHbIhQ6Uql/nLRJnzADzBv8fI4jDX72JVU4QPE=;
 b=IJXYC9E7hTu9M6vUKCgnN2o7yp/x+HRSdDJCQReoDgnl39n6jCReo38IhFZ29GoP5RoIsOmP0Lbc9UfuXUOnUUSMYMpP900K2AZzFINV7gYMVmtsXYt0iKhN6AoAkTpOKDcwb5LxfEliIJy6at/VPX/NgjNAhMp8m8HBCbXR+awXtyWHJULEqDWS9zbChJtx+5+7phKqUZwSIzomwnlhdGNQm7w1mYtn4T6MxL/trBq2HpO1tXDy3GZYkG3bMg70G1lbnrxs3mI87Po4rtZiAS8bnBQRmx3T57Aq0frZbFCJJBP9xxxhbYHXKwjYJQuMMRiVcTJGGEMPtmEk81UK9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=konsulko.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C31QotHbIhQ6Uql/nLRJnzADzBv8fI4jDX72JVU4QPE=;
 b=fMd1sAE3qzU1Qk3N4xWsk3Bfg3Ft1iza+lXOOvRKefdCozMs4c9E7Uew1MUXXrh9Uz46DysCbRLPTPKYnByw+toGqGCAcZpuxr8UAR5tcKFzDwW7lQU2KFh7ntmQv52FQO1qyCt4Gzr99GNC9KeEM/LwHDJvMA+cJOEIsgtCjWc=
Received: from DUZPR01CA0190.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::8) by MI9PR08MB890576.eurprd08.prod.outlook.com
 (2603:10a6:290:c3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:42:24 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::ac) by DUZPR01CA0190.outlook.office365.com
 (2603:10a6:10:4b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:42:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 14:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VH5EpETzKvHo8ETFZdq6kh+Tq1bo2+qpsnp9VB1nZ3p8A28o8tqBvXFf2/YBYwTDM6cg6csj2w64oHI8Y8Km5jmr1eyGQB8HorDtDV0Ozh6Pvn841sbh3jU2Tapbp80LdLolDOnyF3UdCq1eyRUzj2IKNDisQBZWVFK4Y1C0iST705JvNCnyedBCTy03mQz5VpRcK1/Aw30cSATI3Tr/GwpPxbaSQTbSPxuevKzu4xNb43fs3JetmwpD29IQPCJn6EoTC0WgIl6x6XB31pVxiCQuWv3/oBQ2eR6QyKq9gmtxB4PTMdjMVwE+e2J/natW9n1MtkWmAtmmhh5UKf+hjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C31QotHbIhQ6Uql/nLRJnzADzBv8fI4jDX72JVU4QPE=;
 b=KRvL2uNVTl+Uowv5sTCKV19EQqBKeuRFRfwBtgFQDukDv7uEVnv3j69JhQvXyF56C661Idi1R8X855tqOQdtM6ZxfySNUhs3UkvrKbGTe1W/Xn9f0QpGhVpUHPWcNXULRrPLCtjVOoRprtitG4u9jqJ/ITNoJ5DhyHN44aDcVH+a5SXYdXYe/VDge6os/5YKfXnW2j4Vi2WQOy5+mpC/flNB4Q4b1wvrg7FlgZh9+u6k+HpVrdpM6Ro7ie9sV5BzsBEfx9GZFy/SicFlyCgG9ynCh2wZpLf2iElsms69dczQYZUzaS9YyNeCQqwAj/OXNPSBMY8AxTdcP96q7J7+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C31QotHbIhQ6Uql/nLRJnzADzBv8fI4jDX72JVU4QPE=;
 b=fMd1sAE3qzU1Qk3N4xWsk3Bfg3Ft1iza+lXOOvRKefdCozMs4c9E7Uew1MUXXrh9Uz46DysCbRLPTPKYnByw+toGqGCAcZpuxr8UAR5tcKFzDwW7lQU2KFh7ntmQv52FQO1qyCt4Gzr99GNC9KeEM/LwHDJvMA+cJOEIsgtCjWc=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DU4PR08MB11030.eurprd08.prod.outlook.com (2603:10a6:10:576::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:41:51 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:41:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tim.orling@konsulko.com" <tim.orling@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/5] python3-websockets: enable ptest; use
 git fetcher
Thread-Topic: [OE-core] [PATCH v2 4/5] python3-websockets: enable ptest; use
 git fetcher
Thread-Index: AQHda8tZKeRHrmcHkUKSJ7M1S4kZ6Lcfj/IA
Date: Thu, 5 Nov 2026 14:41:50 +0000
Message-ID: <93C8C258-4D9A-46A2-9164-D177A681F6DC@arm.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261103193829.1806542-8-tim.orling@konsulko.com>
In-Reply-To: <20261103193829.1806542-8-tim.orling@konsulko.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|DU4PR08MB11030:EE_|DB1PEPF000509FA:EE_|MI9PR08MB890576:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10a1fc-6ed5-4afb-4ec9-08df3b4b0167
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|10067099003|18002099003|38070700021|56012099006|11063799006|261026140227099003|261026121527099003|4143699003|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info-Original: bbs+enJ8joX2TbdkTpHQoM7rmTZ4CpSftvG52xUkhbA9Whn5u5IRZ4wzvTCAW2ViT93YhxGNnXm/AHkiYB7pP2CGCTzD7P7DrmmB9mPyFvdtCOadV3jOs3Z3jhI5wuHf4BkE5rqSCQg1ddFfTqAYVnjINrV746drq10+l/0iR6yquNILmW454NkEDhCc+pOey/8hp5TUcLThJVIGyxcyjNaItPDLlm129+NLIRz6u8RH6HSUBCtpjOrWgYVU3n7gc3RUfMfFarAfQuur4UEAnB3kLMbYM3PZKUqGfE1QH7oOlQSH2iKRifs2Qs2v+yknr4+aJJHZYPHYeQShWJ9G+PAY5tgtsrx5+n82k9gaMzzL+9/84WIoqJEW0GXHHlhqPRH1NyPP5YlkEO/gMRRstlvq4RoLggsY19/0BbN1t2itLfBw8dfyfp2r+Uwggr1XrP6avlikGjOMEMuVw3YbDtX992sgv4/8ZxX46fm99BUHIh/3MnkpH8E2hN7ykvXSG4FPVQBO6TvipIB6cjKKSYKBNXSE5W71WRIt2+K7YzCnI3isxpwdsk785vNIVhWzx9Rid1Qgls7SA0uRrIOAUN9bCw+ewOdDQskanRtQtFnP9iVz99hSjZ/lTX6t+d/O366jK4q3754E8MPFydBfA38NOtHHmyzbBPIMm24e7OU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(38070700021)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(4143699003)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C292AA85165DA545A965135B19066116@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Py7G4vSlGgmph9dPUfJm0xbg3rOcenlBeftVqiRzn7rFqwBOY24g6PNQeWEFyT/ImEIGfI/swU2bwPx3AdxES0lH7UllVD6gv4Qa+gQBdU+/B8mP9x20zI0pYjR7kkjPQiZ9aVsO9IEITrQ38ZN4hf80AdzAwrb+QNuJiNpq0Bj9mRJfI8YRy/z23tcupY78hQRlyJj0Jl9TXDPQGOhJipIz3ODZlRQ/8/ZMvSYs8l/2MtlC85dEpOlLP/3tC2ZHjBHSFld6/HX5skh52Wbyn46QxmpeUgvsi2tDWNmgwoDaOhjH6NVB/LVw0NY7AY8Sr1m/cdIqNNmbORbjv2ktbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11030
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5d660a06-5ad6-4cb2-cf56-08df3b4aed99
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|14060799003|35042699022|82310400026|36860700016|260925021311599003|260925022911599003|260925021911599003|11063799006|4143699003|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ix/rehswbmf4241YNFmrCIIGtOs/FdhKwxJS0BocQGPcP2tuQfcDzw5bphmSlj6TjNyiGrygpFlSc+uVJvUKTDtBPb9D2TDCvNWHt/7HR4i+juoJiTbfxl1X7g7XI7fbzw2feIfhEyQmShOx+780zOrvfyJGOk/VQofok98NOMKHpz6MbmFhRrSoeOGWfW8y/qdP9c59NI03PIELmSqjKf1lDuupIXGPd0cKEAsSELqoPkZYEdJ8x/B8IypYE5/wsfC/1VTnzpfAcGIu64r++lfFMceXxjXX2g2qB+XpfZj4c37HxlnWqrylp1WAhd4MxTLNesoZSnV08FGZD3WKJ71oRt70S1+vTlzcPmNjASRHP6+kLab50K6Ufts9LF2SA6K+x9nabMIGG1UK1xc/Aw6tdPz5R11Un31nC+I0xQS+7ZyVpTs6+J+PFdWzxx5gQUOU/mTRDD7SdkDINyxPZ671yzPigyP57B+zyoa7c8obb0SfnTLxK+DdMZ6F2sj04+eeoYSyrktEQPlu72x3N6OMI6f6KLe3MChBlDIvxl4AqqScL0QdYeCE0nKzcmTBTh39USRTiud5Xx9vOejBndRv8fjSOhUQH3q63J2hLsnUZyHO4uC4KFYd44LSBztfPMvrSvsRdIMdGl2eOvOmfw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(14060799003)(35042699022)(82310400026)(36860700016)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mggODFTsQVoLVwJaaEPV+U04H8FJ20AYEegx3k63hL0Mz1b/lgOZybUSdQis3ypfKAoSVAG22wSGMOA8J6YIw3qyqeIk6u/XMbXzGl2ugq4FgCmHuMf1U7HLjYbL7xkFNGpViAOvfbS9CJdVqKzJZ7Ecs+8Cw5AN4OCtvQdo7O+1MCCyYRsjCArSoeAcDLiJzQQAyr9gT97mM3qK8XwahIkHXa5co0nlOEAH/prvR+ht/TcFB7HQy6mXb6ay4zQOBaN0BhprOjpC3ZDJ0TzZZbq/33HF3wC+EfwtRGkllrozKJYXlysplfs2VCguqwEexmIAWpkW5G79JKjemuD6RWgOWYF0DpnPZ8gSGWfYDbzyacg1CVhk+I8aw9mdz/BeSIzhUjhrk61FnUgzE4HqoWOnCVkOZxlfjwEeSZuDPYW6iRxSRCU8HqacgZZbBXpp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:42:24.1559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10a1fc-6ed5-4afb-4ec9-08df3b4b0167
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR08MB890576
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249559

T24gMyBOb3YgMjAyNiwgYXQgMTk6MzgsIFRpbSBPcmxpbmcgdmlhIG9wZW5lbWJlZGRlZC1jb3Jl
IDx0aW0ub3JsaW5nPWtvbnN1bGtvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gVGhlIFB5UEkgc2Rpc3QgcHJ1bmVzIHRlc3RzLywgc28gZmV0Y2ggdGhlIDE3LjEgdGFnIGZy
b20gZ2l0LiBUaGlzDQo+IHJlLWVuYWJsZXMgcHRlc3QsIHJldmVydGVkIGluIGEwNDg4ZjJlMWQg
d2hlbiB0aGUgc2Rpc3QgZHJvcHBlZCB0aGUgdGVzdHMuDQo+IA0KPiBVcHN0cmVhbSBhZHZpc2Vz
IHBhY2thZ2VycyBhZ2FpbnN0IHJ1bm5pbmcgdGhlIHN1aXRlIGJlY2F1c2UgdGltZW91dA0KPiB0
ZXN0cyBjYW4gZmxha2Ugb24gc2xvdyBidWlsZCBmYXJtczsgdW5kZXIgcHRlc3QgaXQgcnVucyBv
biB0aGUgdGFyZ2V0LA0KPiBhbmQgaXQgcGFzc2VkIHJlcGVhdGVkbHkgb24gcWVtdXg4Ni02NC4N
Cg0KV2hpbHN0IEkgYXBwcm92ZSBvZiBwdGVzdHMgaW4gZ2VuZXJhbCwgSSB0aGluayB0aGlzIG9u
ZSB3aWxsIGJlIGEgY2F1c2Ugb2YgcGFpbi4NCg0KVGVzdHMgYXJlIG5vdCBzaGlwcGVkIGluIHRo
ZSBzZGlzdHMgb24gcHVycG9zZVsxXSwgYW5kIHVwc3RyZWFtIGlzIHZlcnkgY2xlYXIgdGhhdCB0
aGUgdGVzdHMgYXJlIG5vdCBmb3IgcGFja2FnZXJzWzJdOg0KDQrigJzigJ0iDQpJZiB5b3XigJly
ZSBwYWNrYWdpbmcgd2Vic29ja2V0cyBmb3IgYSBkaXN0cmlidXRpb24sIHlvdSBtdXN0IHVzZSBy
ZWxlYXNlcyBwdWJsaXNoZWQgb24gUHlQSSBhcyBpbnB1dC4gWW91IG1heSBjaGVjayBTTFNBIGF0
dGVzdGF0aW9ucyBvbiBHaXRIdWIuDQpZb3UgbXVzdG7igJl0IHJlbHkgb24gdGhlIGdpdCByZXBv
c2l0b3J5IGFzIGlucHV0LiBTcGVjaWZpY2FsbHksIHlvdSBtdXN0buKAmXQgYXR0ZW1wdCB0byBy
dW4gdGhlIG1haW4gdGVzdCBzdWl0ZS4gSXQgaXNu4oCZdCB0cmVhdGVkIGFzIGEgZGVsaXZlcmFi
bGUgb2YgdGhlIHByb2plY3QuIEl0IGRvZXNu4oCZdCBkbyB3aGF0IHlvdSB0aGluayBpdCBkb2Vz
LiBJdOKAmXMgZGVzaWduZWQgZm9yIHRoZSBuZWVkcyBvZiBkZXZlbG9wZXJzLCBub3QgcGFja2Fn
ZXJzLg0KT24gYSB0eXBpY2FsIGJ1aWxkIGZhcm0gZm9yIGEgZGlzdHJpYnV0aW9uLCB0ZXN0cyB0
aGF0IGV4ZXJjaXNlIHRpbWVvdXRzIHdpbGwgZmFpbCByYW5kb21seS4gSW5kZWVkLCB0aGUgdGVz
dCBzdWl0ZSBpcyBvcHRpbWl6ZWQgZm9yIHJ1bm5pbmcgdmVyeSBmYXN0LCB3aXRoIGEgdG9sZXJh
YmxlIGxldmVsIG9mIGZsYWtpbmVzcywgb24gYSBoaWdoLWVuZCBsYXB0b3Agd2l0aG91dCBub2lz
eSBuZWlnaGJvcnMuIFRoaXMgaXNu4oCZdCB5b3VyIGNvbnRleHQuDQrigJzigJ3igJ0NCg0KVGhp
cyBmZWVscyBsaWtlIGl0IHdpbGwgYmUgdG9vIGZsYWt5IGZvciB0aGUgYXV0b2J1aWxkZXIsIGV2
ZW4gaWYgd2UgcmVtb3ZlIHRlc3RzIHdoaWNoIGhhdmUgdGlnaHQgdGltZW91dHMuDQoNClJvc3MN
Cg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24td2Vic29ja2V0cy93ZWJzb2NrZXRzL2lz
c3Vlcy8xNzM5I2lzc3VlY29tbWVudC01MDE2MDg0Nzk5DQpbMl0gaHR0cHM6Ly93ZWJzb2NrZXRz
LnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS9wcm9qZWN0L2NvbnRyaWJ1dGluZy5odG1sI3BhY2th
Z2luZw==
