Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3494FCCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:26:10 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.web10.1067.1761931568896618462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=H/yrXYfY;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.56, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP0z5My88UEy3LixBj20jSip21PBQLRigBJkDZ5FaMJQ8YDCH+P3FhGkr5I0E2MlEJYdRBr4zK36rEAZHxlvwc2VqmJ8WiA2KXQ749hQKvE1Rz1Ossqt7Fjhc0Rpy51e5CcUQ6fU+vyoR8+OBFQg4IoSTL0tHr86ajOXL88FdhQqKRR6QV0D3QrY4kT+aU5eUPw6xg3nrA5Z9yif86DMT34oU2dbJT4D+gAe4gShpC39QWAsZwrZZGyjgk3DBdsIz+vHj6X9yu4eOc855uklfYK85MBiDTxJQFaekDZPNPonCGvO+Axfl561/BlaXq7Qt0deNwV1l6XRtIcxQolhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un56hsSsX2OBMxUPF4Gy/Qw1BtdbhOZsrgLrufsw4l8=;
 b=hKIvtkkcN3fkyJnw8f16Z10iYa13jmZl7Hbf2Iagc+ULVG6o7FeZY62kduQaXwEYVNhSUIAOyTR1XoNngGg+R9OagXDpVeBU8TW/UySkCBurh7iiHRLvAWTtsESOXEOfwtwKdsozwNvg7IpMGfTKlGUmxnU2aiG83DGMoT0TnAlmxf3osnG+d3box8/c0gz2R2Ml7fZl5Mu0TN7HjHPhLJtTENgcJN1X7DqI6wNHt9tF07yZX+K7iJAzlIBH7p4cTZQz6dfzCeWEcqLq0r3aLLoo6h8fTLdHjfzJfpPxWYX2AjZ+ZjzWoYyzwwBTHRE4fQ+q9r0YNeFaD8nsc4MUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un56hsSsX2OBMxUPF4Gy/Qw1BtdbhOZsrgLrufsw4l8=;
 b=H/yrXYfYV5s1scpY4IQxkt6jXU72hi0Zlf2QZLGWpQ/v10sSk1h87nxMeMgisIy7LFjS8uN3oSWPMz1xZo0TgmL4YuiBK92U9r9VI5Cald/V+giFIe6A02GTCjHFHiW6Ko1qwuuL268RnX7Jn9YjEs2BMsgUVlibq6dL9xRPhSs=
Received: from AM6PR0602MB3830.eurprd06.prod.outlook.com
 (2603:10a6:209:1a::24) by VI0PR06MB10457.eurprd06.prod.outlook.com
 (2603:10a6:800:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 17:26:04 +0000
Received: from AM6PR0602MB3830.eurprd06.prod.outlook.com
 ([fe80::91fd:dc41:567b:667f]) by AM6PR0602MB3830.eurprd06.prod.outlook.com
 ([fe80::91fd:dc41:567b:667f%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 17:26:04 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v1] perf: add Kbuild file for
 unistd.h
Thread-Topic: [OE-core] [scarthgap][PATCH v1] perf: add Kbuild file for
 unistd.h
Thread-Index: AQHcSoGiN772eH4lv0WRrZH4nHpbIbTcfMSAgAAEN8w=
Date: Fri, 31 Oct 2025 17:26:04 +0000
Message-ID: 
 <AM6PR0602MB3830B96F3C636FFB1AA7E3C9BCF8A@AM6PR0602MB3830.eurprd06.prod.outlook.com>
References: <20251031161551.1405597-1-johannes.schneider@leica-geosystems.com>
 <CADkTA4NOMxSoVmMBws+gYzZ86MU6fexv_aBRBT3yf4ypU-D9Fw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NOMxSoVmMBws+gYzZ86MU6fexv_aBRBT3yf4ypU-D9Fw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0602MB3830:EE_|VI0PR06MB10457:EE_
x-ms-office365-filtering-correlation-id: 557f7191-5bc4-48ef-1359-08de18a291b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TGZLbmJSdFNYUUJxVWNOV0pxN21nU3FPbERHb2g0T25IbTFiQ0dLY3VFdFQy?=
 =?utf-8?B?TUtjeTZiWUNPa2JuYlFnQ0ljbXhRZ2dFbDdwakNqbkRRTnFGTFFmczlDeU1H?=
 =?utf-8?B?aUl6djJBZG9XbWFDZFBaWTQrdVV6eXZXYk9OanZ5SzhxZXIrc0J2cVMwdk16?=
 =?utf-8?B?ZlhUTkdMV1FFVDQ3MlFwOHg4SE14U01ra1lDamVmUUlhYXAyWmlYQlF2NnY2?=
 =?utf-8?B?anNhWTIybS8ySUNDc0xyRFhuOVFIQnNMRnJ5cDR0WHJZN1ZrSkQ5RkU1dnRE?=
 =?utf-8?B?Smc4R3JvbzRqQmUyckRybEYvSDQyQ2ovMkR3bGR3T1diWmhWSFNoYTljU1Ji?=
 =?utf-8?B?RTlONWJDaXViRC9MVzJ4RzlEUHBnMk50MXdmUXppZjFQK2FDbTFiVU1RM0Qr?=
 =?utf-8?B?cjRUQmNhc0NnZXdqVEhiUlI3ZzhpR3F6bjNHbGlnVkFnU3VqTElpYU53V0ZL?=
 =?utf-8?B?eng4RkN6NFI2SlFNM1lSNkgyT0lyU3FmRy9FeDQ3aDhGd2lFM01lQ1VES1FP?=
 =?utf-8?B?cjNvN1pEbENoQyt1d2JmdXJINUU2WjdjL2YrME43WGxWVEZpL3pJOVBkTEFF?=
 =?utf-8?B?QTNsek50d1QzOEFjYWZnbGlWRlRTSzhHU3RVYmRuenFBRGRhQVh0akJNWlV2?=
 =?utf-8?B?ZkNudmZFaEU4T09hVFp1S09iNjZtY3BYR0cyRlArM3pCanVTOHdZR213Q0F4?=
 =?utf-8?B?UmcrSUdXWm9FaXMzQlQxWXpuWmF6VjV1S1BCRC83TG5RdW5JVzd4bXFWN3Qz?=
 =?utf-8?B?cDM3TkxSQVQvZzJ6emNjK1pUaHUvRk9Nd3JaMmh5N3hXR3ZNVXVWcnRIMUtM?=
 =?utf-8?B?bnIxMFh3Um80NHVHZWlaVUZBMUpPRUd4YjhQUDRqRC9sbVg2TWxYMlJiYUFK?=
 =?utf-8?B?NzdtUkt1RmVKRWpxRU5wcGs2UXd6Z3MwS0NQRmFlOEF0RjROWTNQa20wZE1N?=
 =?utf-8?B?d3F1N2xIMjY5ZGp0am0rekhyZitWaEVVaml3UEQwZGdKSmNPNWdtNy9aaGEz?=
 =?utf-8?B?d1Q4NjNsWk1iV2ttQ09YYlJlY1AvQmd6RUh1dnppRFBGSEhjc2Z2RHZSZDVx?=
 =?utf-8?B?MGhKRVpSdHd0dUtqbDlXNEkwV3NQM2sxaTJZYzU1Vnp6RXNJWFpnQ1V0OFh6?=
 =?utf-8?B?enY0MDd2YUx2UThZVlQ2UGJYd0ZXQlAyNTFaNVdyZWFLQWxZZTI5ZHlJdFZt?=
 =?utf-8?B?aGFoeTJxOHpjb3F3M1lwRWw5VkwrVUd0NFJXV0NIMnpVbGp1b2pEVGNxcVBK?=
 =?utf-8?B?U1dYb1IwRTB2YVZJNHhZaUhNdFJOVk0zeUxFc2o1UGc3cEFJZnlmQWUyVEFF?=
 =?utf-8?B?aUx3NncvcnNmaFZnejFkUktmMlNHOTlaMVZhUHRPakVEYVlJYjVaellOcDJ2?=
 =?utf-8?B?Y0IyanY3VjJPa1kzMnRhaTBkQVUzL1FZZCtYZllLbEZmakljY1JoTExBc2t1?=
 =?utf-8?B?T25sazdEZWhqRkhibHdTN0duaGZUUnd6YkNkMDBGNWZweHo3RElPcTd5bFQr?=
 =?utf-8?B?NzRVS3FlT0UvSFFNeVZxY1gwbmdTR2UwdVh5Wms5bGRsMlRBa2RiNEtScUs3?=
 =?utf-8?B?Tm85VmltQXhkdU1sWCtTNFZyQzgzNndPakduWmRQSDRBaC93cU5Wb1dGNmhn?=
 =?utf-8?B?YnMrb0tPUmxaUHA5VXMwR3NNTGxLNGhyZ3gwckQ0TGd0S2dPUVRFd0x4anBm?=
 =?utf-8?B?dytkOWtMa1diYk9ZcUtqSjhROXg1K0ovU242UnFZaFVRV29GY3g2TVJURVVY?=
 =?utf-8?B?UmJsbTRYZ3plSU1LYWxZZGQ2ZXBkcHFKZFUraVVkZ2hJRUFLclpnMjJjcFZz?=
 =?utf-8?B?K21ERFZ1ZWNpNlM1MXFRdlo4UVVuaHllNHJSeVZpaSsrMG4xblpkNUFROVls?=
 =?utf-8?B?bWt6cDRKY1IxMFBwczdtalZ5d3JLZlRRSHQ3TUo0dEVZWGxNZmowMGF5MDNH?=
 =?utf-8?Q?UkD6JLBo1oL1awApK2/96dqUzgnWWuFY?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0602MB3830.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0NVck53QXh0dVNkSmg4NlREODFEZDVxdGk5dm56Q0RpNUlxWkk1amZ1ejNH?=
 =?utf-8?B?QUFtanVLZjlYWTVDWDYva3FKVGo5bGNIK1hrMTNFdXcxSDNYTWcxODFlMzJl?=
 =?utf-8?B?bWxPU3JPRjUwdVVQODNqWDRyRWhab2xWaUhIaldlWjBqd2xYcUJEa3VqVVB6?=
 =?utf-8?B?dGIyc1lweDJ2VHZDc2h3Y3d1eUFYMGdVYUY4aWwwRmpTUTVCMi9sMmU4UHI2?=
 =?utf-8?B?cG44bWF3VVZHemw1K2tpck0zbktSSFl4cnVUa2NiV2F2L25tWmZHU0s0VmI3?=
 =?utf-8?B?aVRkbjJuYmt5WTFPczhmZU5Cakh4ZDRUM21FN1VHSmxqMVlSb2dlUHpDbUpO?=
 =?utf-8?B?K0FPT0lGdzJFSGV3eW9LNG1ib0FLTU8rVGRNMkM4aW4rUWxrU1hlMjZJZytn?=
 =?utf-8?B?NmdyYTN2WG9aaVI0eDV1N3lxUkZQbzFaOHdhRXRBc0psMXlObVpvYjFnYTNn?=
 =?utf-8?B?bG11S245UloyeFpHUnQ3bHBhWnVtYlB4YnFLd2ZMMFpxZlVYbUhFRUN2VnVF?=
 =?utf-8?B?K2pRZjZyb3J6YzFVWkphZHd6SkM5dG9GTUtYZ3VRSnY2bHhCSmVzSHR1R1p0?=
 =?utf-8?B?c0VNYy9ZSkRORUQrZkZhaGxBeXJ5Uis1VHFtOGdETmVJOTdkMXViY0d2ajBP?=
 =?utf-8?B?Zk9VOFdMRXRjeVRYRGd2cDdxb0ZNeG5VYlA1VE91cm9BY0lqelJnNlRqS3dM?=
 =?utf-8?B?WDFrQ0ZsTU9MSjhaY3M0Z2x0czAvRGdkdEpGUTlqV3M1TnFKVUVmaDkrc3A4?=
 =?utf-8?B?SlZ0ZWNWRDNLaWQzWUZXaDhDdVd3SWthTWtSYTVzb0xHTlMzT3gyaHhwWXo4?=
 =?utf-8?B?VXltMUFXeGJQVzFqN2V2dEkyNWVjN2xuY0RVRDlRN3dHTFBUSlBsUHgzdnA0?=
 =?utf-8?B?QXFseXhFeUR3elRoU1VyVDBtbzZSZjFWRjJUdGgwbGI5NWZDSWZqVjlZUFc2?=
 =?utf-8?B?SnIrRTJUdGNuejZRSFo2akRyU3RNb0pWZVp6cUlaNi9TeDlBdE94UUxqbi9m?=
 =?utf-8?B?YS9BTGdWbUI5bEJkci9TSXpCd0s2MUJ1WVF4d1NuakF2cHptL0tZdDlwSlJC?=
 =?utf-8?B?V2tRSTRwM3FIbFd5U1JuTVZwSVZTS0djQ3RhWkNMM2o4Yy90UkorNjhtNU10?=
 =?utf-8?B?VW56eFdqSEpPazF0VHBGc2FBcVdMdEpDNHBrcHJhVHdrcVdBemRUR2pFY2lq?=
 =?utf-8?B?bVU0aFBYWXVGUGFVTVhwZ0xiSjJBWnJLTnpMREFXckpKK1h6dEwybnMvdjhm?=
 =?utf-8?B?eDE1V3lmZTFMSERZaW1FMGxQK1NZYzBNVmJwUUxKZmhUN3l2ZDlxVDhOeGs4?=
 =?utf-8?B?cU02Vm05RjFIWG5vREk4cW12TTIwL1JDQXVIbEo0OFU4WHZCUFBqU3Zrem03?=
 =?utf-8?B?Q3NpMjJOR1M5MTNFamRrNlovY29ZUW5lUU1MN1Jhcy9TYnMrZW5ubHFjZ0xH?=
 =?utf-8?B?bXEzTVdROGhaaXpvcHdFcWpWN3J1Q1dQRk1VRXhtV2w1eS9zWmpsdTFaRTlX?=
 =?utf-8?B?SGU2YnlwZnlQRUl2YjdVTVVOL3lLNEExVVN3bFBRZmVEQndUNHFXcWZubnhr?=
 =?utf-8?B?YkFsYVN1eng5TTNLN2hobzVERXhBK0JlaFZYQWRoVmI4RUJpaENrL2pOTXlI?=
 =?utf-8?B?ZkEzVTJ0MW83NEExSmN5bXR1ejVhZmVsQmp6ZlZmWDhsSWNRY1p2dEFsYTFK?=
 =?utf-8?B?bmFWYWQxK3FkRGRrVDhyeVRjdlh4Nnh0aUxVaXBkaENqamQ1K3V1V01ic1Rk?=
 =?utf-8?B?M0R4TS8vM0I1dlNuT1E2MFJ3Q1R1a3RkMi90Umc5eEsrWUorcTJhclROMXlE?=
 =?utf-8?B?Z0haUUo2WnBhYzY4S3I0TUNoQUE0M2FPbE1rTktJcmQ4dlRYc0ptS09zSVds?=
 =?utf-8?B?d0RZKzQ1RTRoWVl5YmpUUXBWRjdteTZKL3o5Q1FhaFRnZitORGlDemNwRjds?=
 =?utf-8?B?cWNFMkswbGw0OWoyb2tOK0QzNUlFWWZ2NEhMVGh2WnN1c3I1TmFocVV3K1RI?=
 =?utf-8?B?Y3RkSnZleWlsUTNlYktZa2ltd1RtYndDREFEclJsUk9rcGhhNmRhWThLZkcz?=
 =?utf-8?B?VlZ4dUxDSkE5cUwwcEhzRXdMWFdST2M0OGRoRU55ZEQ2MVZGMm9vUitUQTVP?=
 =?utf-8?B?UXBXNFVDZU1xa25sVEwrREFuR2xFRlFJQmNjWlRqMHVUclNuWlBHeXZxMGhp?=
 =?utf-8?B?dU14OCszT2VlM3BleWFrNjJiTXFBa1RJZ3k3OE4xb0NKaDJudHJ4M0xrelFR?=
 =?utf-8?Q?eu4I09gwPCJgaABpGKANt4rUlUTlrYKIsWvVkisu/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0602MB3830.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557f7191-5bc4-48ef-1359-08de18a291b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 17:26:04.0909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46ReZng1OErzm8Drpscl2GI3pJsM02rrBDv4ZQpLvccCu226kOmotZrk24FLjob3QAbo3YPGpF92CjJAkUvB+buZASDqynIIPZBAqGoEZq3Ag/JgD1B/WHGvVa4cWG6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB10457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225553

SG9pIEJydWNlLA0KDQo+DQo+IE9uIEZyaSwgT2N0IDMxLCAyMDI1IGF0IDEyOjE14oCvUE0gSm9o
YW5uZXMgU2NobmVpZGVyIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGh0dHA6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnLz4gPGpvaGFubmVzLnNjaG5laWRlcj1sZWljYS1nZW9zeXN0ZW1zLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpsZWljYS1nZW9zeXN0ZW1zLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPj4gd3JvdGU6DQo+IEJ1aWxkaW5nICdwZXJmJyB3aXRoL2FnYWlu
c3QgbmV3ZXIga2VybmVscyAoPj02LjE0KSB3b3VsZCBmYWlsIGJlY2F1c2UNCj4gb2YgYSBtaXNz
aW5nICdLYnVpbGQnIGluIHRoZSBmb2xkZXIgY3JlYXRlZCB3aGVuIG1hbnVhbGx5IGluc3RhbGxp
bmcNCj4gdGhlICd1bmlzdGQuaCcgaGVhZGVyIGZyb20gbGliYy4NCj4NCj4gQWRkIGEgb25lbGlu
ZXIgdGhhdCBjcmVhdGVzIHRoZSBtaXNzaW5nIGZpbGUsIHdpdGggdGhlIHJlbGV2YW50DQo+IGNv
bnRlbnQgdGFrZW4gZnJvbSB0aGUga2VybmVscyBLYnVpbGQgZmlsZS4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogSm9oYW5uZXMgU2NobmVpZGVyIDxqb2hhbm5lcy5zY2huZWlkZXJAbGVpY2EtZ2Vvc3lz
dGVtcy5jb208bWFpbHRvOmpvaGFubmVzLnNjaG5laWRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4+
DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWtlcm5lbC9wZXJmL3BlcmYuYmI8aHR0cDovL3BlcmYu
YmIvPiB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3BlcmYvcGVyZi5iYjxodHRwOi8vcGVyZi5iYi8+
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9wZXJmL3BlcmYuYmI8aHR0cDovL3BlcmYuYmIvPg0KPiBp
bmRleCAxMWZhOTE3NjQ5Li43ZGI1ZmU2ZDFjIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
a2VybmVsL3BlcmYvcGVyZi5iYjxodHRwOi8vcGVyZi5iYi8+DQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvcGVyZi9wZXJmLmJiPGh0dHA6Ly9wZXJmLmJiLz4NCj4gQEAgLTM2OCw2ICszNjgs
NyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCAoKSB7DQo+ICAgICAgIyBzbyB3ZSBjb3B5IGl0IGZy
b20gdGhlIHN5c3Jvb3QgdW5pc3RkLmggdG8gdGhlIHBlcmYgdW5pc3RkLmgNCj4gICAgICBpbnN0
YWxsIC1EIC1tMDY0NCAke1NUQUdJTkdfSU5DRElSfS9hc20tZ2VuZXJpYy91bmlzdGQuaCAke1N9
L3Rvb2xzL2luY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQuaA0KPiAgICAgIGluc3RhbGwg
LUQgLW0wNjQ0ICR7U1RBR0lOR19JTkNESVJ9L2FzbS1nZW5lcmljL3VuaXN0ZC5oICR7U30vaW5j
bHVkZS91YXBpL2FzbS1nZW5lcmljL3VuaXN0ZC5oDQo+ICsgICAgZWNobyAibWFuZGF0b3J5LXkg
Kz0gdW5pc3RkLmgiID4gJHtTfS9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvS2J1aWxkDQo+DQo+
IFdoYXQgaGFwcGVucyB3aXRoIG9sZGVyIGtlcm5lbHMgdGhhdCBoYXZlbid0IHByZXZpb3VzbHkg
bmVlZGVkIHRoaXMgPw0KPg0KPiBCcnVjZQ0KPg0KDQpTaW5jZSB0aGVyZSBwZXJmIHNlZW1pbmds
eSBidWlsZHMgZmluZSwgaSdkIGV4cGVjdCB0aGUgS2J1aWxkIGlzIG5laXRoZXIgbmVlZGVkIG5v
ciB1c2VkLg0KDQoNCmdydcOfDQpKb2hhbm5lcw0KDQo+DQo+DQo+ICAgICAgIyB0aGUgZmV0Y2hl
ciBpcyBpbmhpYml0ZWQgYnkgdGhlICdpbmhlcml0IGtlcm5lbHNyYycsIHNvIHdlIGRvIGEgcXVp
Y2sgY2hlY2sgYW5kDQo+ICAgICAgIyBjb3B5IGZvciBhIGhlbHBlciBzY3JpcHQgd2UgbmVlZA0K
Pg0KPiBiYXNlLWNvbW1pdDogNjQ5MTQ3OTEzZTg5Y2Q4ZjczOTBjYjE3Y2QwYmU5NGM5NzEwZmZh
Ng0KPiAtLQ0KPiAyLjQzLjANCj4NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+DQo+DQo+DQo+IC0tDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9s
bG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0
IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsg
SUkNCj4NCg==

