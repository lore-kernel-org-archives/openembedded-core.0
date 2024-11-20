Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBC2D743ED
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:25:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.1908.1732145095726496569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=PegmiMk9;
 spf=pass (domain: axis.com, ip: 40.107.22.87, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W82MtbR9FE/0LpYGFYMusFFF/emdD1yWTeh9WMkxGveImukvFMiRyzlecjQVwG/71JYWh0nKpX3DWYxK+ONXO0PxVvxscxZ9E2MXT0F9eYYKBCAgfQJHxVdNFVc3dmNLfpbgYsiEM7RACOEnvfSmQvXvR/nXK9jJr+3YAoJZxsLCY2QRG9Fe0XvcTHLnQRnDB8qg7/j9F04iKItfME5kmD1SUX7IMgO5mjdfO/Qd1/ak9xfC6vZu5Gxs/1jIr5792NeFJpCI4qEBA0Mh38uViZqt/B194Cz3IF87EVIpntNTwypkXzyiBvsfL0FCLk106L9pNgMbC0dDEB7rkaLiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVivxpOL2kAxUgAV/Kdddo0dTJaajQev0qpRbBd2mfo=;
 b=dH6ZW0h/P8o7YIhGIkBMFSpJDiiLiqc1AcEKYJyuLFJ7DzEr+xkJh4Pixdhy0FbRIEiN4S9FeqmbgIOUHS1MvaP9c5S0eoFrcMx4g9Ugz7NUppEzqLY/TEneBSC3WiwjuoO2IhhQW0PvrYW6C6Ao2FVCoNu5R4Xe9L2+H69ofI2/1h2uZy/Cz3EmiNEvsHGo1wgpAKSPfNy2oMGPENz3Vz7lklSnJaeRBnjGojKFqoWI3Hy5EnXrDmZ4XyIRiLxtxsXma64juD3M80iBFEEcJbZn7zz5TwBy17vD/ieAXzm61GoY1YpiMYbF7aW/NHkzLCDKwn1cKTA30GlUEoSlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVivxpOL2kAxUgAV/Kdddo0dTJaajQev0qpRbBd2mfo=;
 b=PegmiMk9TZ8c2CIqPAysxJWiCmdaVHiuB5tU7ZYqJk5d7SyScwN8OFlAKn4GoWmCD5jEdae5CEDaShowwl7eHolH445DRBSCLkbSLGONJDR5i7GGHpdmMh041hbqvb5h3Fh1XVmUOsAIzXsiduRqUgXDLQXrGQv8O7bZe8sBfL4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10847.eurprd02.prod.outlook.com (2603:10a6:10:526::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 23:24:50 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 23:24:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glib-2.0: upgrade 2.82.1 -> 2.82.2
Thread-Topic: [OE-core] [PATCH] glib-2.0: upgrade 2.82.1 -> 2.82.2
Thread-Index: AQHbO37YPojB7bt+n0SeJd0jqPm1/rLAh28AgABG9HA=
Date: Wed, 20 Nov 2024 23:24:50 +0000
Message-ID: 
 <DB5PR02MB10213D85A3AB44806BA753CEFEF212@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241120190240.50414-1-gudni.m.g@gmail.com>
 <2000.1732129550566539718@lists.openembedded.org>
In-Reply-To: <2000.1732129550566539718@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10847:EE_
x-ms-office365-filtering-correlation-id: ede18984-b663-4e99-9040-08dd09ba87e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y3BsZ2VwRmhqazlWcnl1aFROcHp3WFMvd0RyZ1UvbEROL3dkSzN2Qm92UG02?=
 =?utf-8?B?SVVGazdlclVJMzRzNGswTy85VmNYTEpVSXFkWkRyOS9nL3VKRFRYaDlYdW44?=
 =?utf-8?B?MmxoS2c1RVgwUU1RRWJFMFlPVXNYcGJiSVFWSWpHVERTWi9kcG9VQW9EY3Zh?=
 =?utf-8?B?WkZ3cUl4bUcrTkc4QW5NK3RVTkhSMDVaZTBIeHJSSlpYSmRtTUl5NmV3aXIw?=
 =?utf-8?B?TXo4OW9GRU5DUG4zMkp4aVQ1ZGJFZ3J5anpUemJ1Q2ltekZJdklUNkUzcUlu?=
 =?utf-8?B?Y3hFSnRIeENCdUZEYm5sa2tNdkpFRlBwMlRSa05RYmFMbzZoeW9HVTZlOUQ1?=
 =?utf-8?B?d09aUEM4ZDZrZ3k3MHk4Rnlkei9MSjJYc0lBb3lGd0VkV0NkS0tBZ1hGT3JC?=
 =?utf-8?B?MWNUQzF2UmZmNXlBWldjMGc5YWpGVjJIN1dTODlFQkNpNnJ1VWdBRkRvOGlC?=
 =?utf-8?B?eFIwMlZPQjk5U0t2MmRhYS9Oa090RnBIYkxWTlcwT0ZENm4reURWSVVPZ1Nl?=
 =?utf-8?B?bGcwN0xxY1VUdk02Z0ZkeEVZb01UeXVFMTdBUWNxMEdRSFNzRUQyUlJTVGJV?=
 =?utf-8?B?YzRtek5iQWdHNUVVaFlzeUR3SGZSRC90dkNEUzdRaXhiemRiMXhObllFQVg5?=
 =?utf-8?B?YjdEN0ZWSzZjRGVzM1dhMm05cTBqcjNrWk5JU094VFY0V3E5NXVvV25KcmFo?=
 =?utf-8?B?bThRbk9LOTYwbmNoUy9sZ0YzU0FYQzVFc1VPcEpuVHZLczdlL2ZlSXlxSyto?=
 =?utf-8?B?NXZrd25UVEkyRTNXOW04QUFWclhlYndIeDl5TkZLb2JkMC8rSnVhaUEza1NQ?=
 =?utf-8?B?UXpSMkVWM3ViaFJ2N2hZZDhwSWZiL3hvYjY2dHdxRHdHRzM2WmJmZDlzV1JC?=
 =?utf-8?B?ekxXQklVRENNY2wrNmlndXVUSFg5d1haUlJHNVZJZ3gvTnphdDVjdTQybHZw?=
 =?utf-8?B?UjY4OUg5OVdiZ2x6OUdOaFB6ajg1am1hWEFhWEsrNjZCOGdoYUFYaklVenBF?=
 =?utf-8?B?b2YyTm5hRDhZY2EvM3BNbnlBdy8rMUdwa3RQWGg2cXhMbFJ2eVRUZ0VMbUpq?=
 =?utf-8?B?ZmEySzRmeHNOcUVUUHhsdkxxNlZmUnFMbEJHdkpsWlY2V3NaMlJFQjJrM3dG?=
 =?utf-8?B?SVVIOTRBMG81aVpSSFlPejVDMlM0Z2RDRTVJaCtaTzRrZ041b05zK0xiUzZh?=
 =?utf-8?B?cHNXTDlnakpsMURYVnBVcTlNNyt5VUZBS3E0VkxCdjRPZGQxUEdWVWVwM3BW?=
 =?utf-8?B?OXNkNWJLaG9laWJWM01ZUTdEbVdsL29GTTJmTnRrb1BYZjJLci8rMWVqY0xH?=
 =?utf-8?B?bXFWVmtmemwrUXVwUTVqNEZXYVVwZi8zY3JqL3Q3NHZwSFRvcGhuRkorYjZI?=
 =?utf-8?B?SGtpcG5oUEMyQ1dTMDNJeGdaM1huaHp5K2dCNjFXeEMrMnBWTXM2MU53RHM2?=
 =?utf-8?B?OU01c045dlI3TmtpWSt6OTlkbkMybU5TTWk2K2ZHTFVuTWdhMm1xeDc4ZFNr?=
 =?utf-8?B?RU9WNFBnUStSTmJ4amtEUVQ0RTU5NDdMeW5WSTJORHI1YURmZ1FRYmhqMnl6?=
 =?utf-8?B?WXpZdXZGMlhyN1NTaDRUNnliTnpSOUsyZzBYTFhrMld5REtBZng4L25YQXVK?=
 =?utf-8?B?bXV3TmhmYlJNOUhrUHYwNjdaa2ZPL0ZWU3BpMjRhQnZuV2x2S3BOcXE3Qkg3?=
 =?utf-8?B?ZTBiNWEyeDZyL1NLRHU3clRQN2ZkSGp3UXRIMlN2UGNpM3k1ZGhVbnFkRnhC?=
 =?utf-8?Q?djNw/HRZDlaCXKGsNHkHa/QFoZf4wkEQqnJZQ/Z?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RTByREl2a09OL1AvdUs4WjQ2VDh1TjRMeU9wV0UvSW1EbmdwK2FEcmdNOE80?=
 =?utf-8?B?Ym0wNElsQmtBaUYzd0RqcnNtNTd5bkpBOGFOWDRqa0ZIMEh6L1BnVFpLRk1q?=
 =?utf-8?B?ZmYyWThISG9LZjBBSHJYMkc5RDZsU2pWSEhNWDh5R0FsdEtReDJKc2UxcmFx?=
 =?utf-8?B?YzVBOUY5RFFIL3VZSldTYmVTWWNGVlVLNHlRUFFuUVAzR2ptbTVmV2hLSk1j?=
 =?utf-8?B?aEdhMnVmMnY0QmVNclNuZEVra0ZnQmJWSXRzb2ZDY25MUGtHanlNSlQrSjAv?=
 =?utf-8?B?Z2d0aVNjYk5kV1pxT01ha0QrS2NDT2FDdUQvMFpkQXZ3VUFwVURGa0owZ0Ro?=
 =?utf-8?B?U2VaOXU2bjZhL0RPUlp0Y1NqTXFnMmQ0NWUwMEk0Vmw1bXhoNFQ3cFNrRXI1?=
 =?utf-8?B?dnJCQjI0cWZ4UHI5Mnh1dWpBblR5OGlZK3M4SUFQZEJqR245NlkxdXRiUjlr?=
 =?utf-8?B?MzlGVlBPZG5wV3Y0eno0ZXVWaWVNV2VCZXVXOTdkcHFPNWltdDRhVW8zSEVD?=
 =?utf-8?B?TE03T3dFQXFraWxXYkd6WVJrRUM2dFplKzYva3RrZlUxcDFhZmFxWks5SS9M?=
 =?utf-8?B?RVpIcmJYVlpUdzRYNWN1bnJhM05SZlZQK0J4NEtVY3NzV3hMbVRvSTdWckZz?=
 =?utf-8?B?Rll0WFh4cmlyTHVjU1FpM1ozNEVFTGp4bFpRNkJkaUZyNk5weDJWR2dLR1hs?=
 =?utf-8?B?MmRHWUpZODR6a2o0V3pCMU5NME9LbkRTSUluUDFkNksyeGxzWTRxVXlJSFZE?=
 =?utf-8?B?Qy8wNW5ZblRaanJyREVMZytNaFdBd1hoK2gveXR6dlZweG9CMTFqTDF6SDFK?=
 =?utf-8?B?S2NxT2hTczBNekkxdGM3M3ZMMEpJZElHVnFzaEhqRld3NTd0WGtDdFkrMWJo?=
 =?utf-8?B?NnRhZ3N6VUs1T0FoVWhWRFIrSHFCaGJoT05FbkZqNHorbWdnQnZPY0ptRGVE?=
 =?utf-8?B?d3RadERLbXQvTktGMnA2ckJWQk9DV05nRXl1Q2hOSFRIWk10ckRSbE9BdTd3?=
 =?utf-8?B?T2FqQmsyTWNoVDhGZ1A4S3BZWG5nOFEwU2JCQmREUXUxVXdjSCtyOFNLWGtG?=
 =?utf-8?B?SEw4TTk0TDZWWVozSDd2K1V0UktURGZsd1lDMHUzZTlsbjhMYmRBOFJlTWtp?=
 =?utf-8?B?TmFuUlFQcTRBMkx1R3FPMGI4SUcwYjdRb3MrU0REcldDNTRHcG84M25FbDJ5?=
 =?utf-8?B?T3A3cXdHS1ZQSEtxc3cvb2hOMnExVWE4ZEVNb2xwVnNOS0FSQ1NZeW5KYzRa?=
 =?utf-8?B?OW9GNW9sS0x1cUtBdEhRaFFJY1B0dkxwUzVNbW1CY3BGNVI1a1ZVWWRadU9i?=
 =?utf-8?B?MU9CS1p3UnA0b1VVbXVKN0xBOVZ4OGJ5R2ZFR3pyM2hzMUNtN1RJUHRKWE5T?=
 =?utf-8?B?b3JRNzlCOWU1dndydDZiN0x5T1ptLzJoRFlDbldUb1daRExxK2RVbnRQWVJY?=
 =?utf-8?B?Q1IwYlhYaGFBcFJQc1pWd0I2dmppV3FXOHlGZHY2VjZwL3dDSlhvNlBwd3Az?=
 =?utf-8?B?d0hvZk1EcS9zOWhpY3RRVytMQWx5V0hteFVJU2o3NUVnQ0wxRzgzUzdqVith?=
 =?utf-8?B?c0dVNXU2MThVT2FOaGl4Zy9XQTE3WWliUW1IK0lOV09ybm9TVVg3Z0ZYUFhF?=
 =?utf-8?B?Nko0Y0kydE15SmNTSDJ5MU5rNnVwTkU5cU9HUXNzQXBWSzlJa2wzVExRUTZ5?=
 =?utf-8?B?ZWtYMUVTcW5EQ1RUYmhEMldtRDBHV3FQVldZaDAxVWxSMWxZUnpsY1NTVklW?=
 =?utf-8?B?dEtlRnlONDZOTmw5cGMrOHhraG5hYmxCQUxEZU5TU2RCYUxsK2RtbTlaKzFu?=
 =?utf-8?B?V0hJN2k0aEhOYjY1dE83eUtuajlaN0pqNXNkci9Oa2RTMmw0cWlyOTZtUGp0?=
 =?utf-8?B?K0ZBQ3AzZitiSEtKZzhseXJ1a1pNMUZRZ1JzaVhud015VGVPaW9vbVJKdm9B?=
 =?utf-8?B?S1A2WUVUVDBpNFl4NnVablBWR3puVDV6cFBtRnRtdHZpZTllb3hDTDBmaGZx?=
 =?utf-8?B?VERuZ3lRQ1dHdXIrL1kzTkQvME05M1BVZjBMeWhnaVJwK1VibXdCU3pCU1Ex?=
 =?utf-8?B?L3RKbWFBU2RUYTQvM3FER3ZuOUFySWNsSlhZZnRLa2FJcmovbnlqOWY0YVBz?=
 =?utf-8?Q?CkMQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB5PR02MB10213D85A3AB44806BA753CEFEF212DB5PR02MB10213eu_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede18984-b663-4e99-9040-08dd09ba87e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 23:24:50.4796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XTamawwtkcjlF8laBlNUd2rg/MW2RY9a/mKo91G8/EbKhvmF6Cj/JMISY49HoPE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 23:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207492

--_000_DB5PR02MB10213D85A3AB44806BA753CEFEF212DB5PR02MB10213eu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIG5vdGUgdGhhdCBnbGliIHVzZXMgYW4gb2RkLWV2ZW4gcmVsZWFzZSBzY2hlbWUuIEku
ZS4sIDIuODMuMCBpcyBhIGRldmVsb3BtZW50IHJlbGVhc2UuDQpUaGlzIGlzIHNlZW4gaW4gZ2xp
Yi5pbmMsIHdoaWNoIGluaGVyaXRzIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiwgYW5kIHRodXMg
QVVIIHdpbGwgbm90IHRyeSB0byB1cGRhdGUgdG8gaXQuDQoNCi8vUGV0ZXINCg0KRnJvbTogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEd1w7BuaSBNw6FyIEdpbGJlcnQg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClNlbnQ6IGRlbiAyMCBub3ZlbWJlciAyMDI0IDIw
OjA2DQpUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGdsaWItMi4wOiB1cGdyYWRlIDIuODIuMSAtPiAyLjgy
LjINCg0KdjIuODMuMCBpcyBhbHNvIGF2YWlsYWJsZSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcv
R05PTUUvZ2xpYi8tL3JlbGVhc2VzLzIuODMuMCBidXQgdXBncmFkaW5nIHRvIHRoYXQgaXMgbGlr
ZWx5IGEgbG90IG1vcmUgd29yayB0aGFuIHRoaXMgbWlub3IgcmVsZWFzZSA6ICkNCg==

--_000_DB5PR02MB10213D85A3AB44806BA753CEFEF212DB5PR02MB10213eu_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpBcHRvczt9DQpAZm9udC1mYWNlDQoJe2Zv
bnQtZmFtaWx5OkNvbnNvbGFzOw0KCXBhbm9zZS0xOjIgMTEgNiA5IDIgMiA0IDMgMiA0O30NCi8q
IFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNv
Tm9ybWFsDQoJe21hcmdpbjowY207DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToi
QXB0b3MiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5
bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5l
O30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOiM5NDM2MzQ7DQoJZm9u
dC13ZWlnaHQ6bm9ybWFsOw0KCWZvbnQtc3R5bGU6bm9ybWFsO30NCi5Nc29DaHBEZWZhdWx0DQoJ
e21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJbXNvLWxp
Z2F0dXJlczpub25lOw0KCW1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzAuODVwdCA3MC44NXB0
IDcwLjg1cHQgNzAuODVwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24x
O30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRz
IHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtp
ZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1h
cCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRp
Zl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IlNWIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxl
IiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24x
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+UGxlYXNlIG5vdGUgdGhhdCBn
bGliIHVzZXMgYW4gb2RkLWV2ZW4gcmVsZWFzZSBzY2hlbWUuIEkuZS4sIDIuODMuMCBpcyBhIGRl
dmVsb3BtZW50IHJlbGVhc2UuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFt
aWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1mYXJl
YXN0LWxhbmd1YWdlOkVOLVVTIj5UaGlzIGlzIHNlZW4gaW4NCjwvc3Bhbj48c3BhbiBsYW5nPSJF
Ti1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6Q29uc29sYXM7Y29sb3I6
Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+Z2xpYi5pbmM8L3NwYW4+PHNwYW4g
bGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0Nh
bGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1mYXJlYXN0LWxhbmd1YWdl
OkVOLVVTIj4sIHdoaWNoIGluaGVyaXRzDQo8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OkNvbnNvbGFzO2NvbG9yOiM5NDM2MzQ7bXNv
LWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPnVwc3RyZWFtLXZlcnNpb24taXMtZXZlbjwvc3Bhbj48
c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1
b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2MzQ7bXNvLWZhcmVhc3QtbGFu
Z3VhZ2U6RU4tVVMiPiwNCiBhbmQgdGh1cyBBVUggd2lsbCBub3QgdHJ5IHRvIHVwZGF0ZSB0byBp
dC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5n
PSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2MzQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4t
VVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVv
dDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5n
dWFnZTpFTi1VUyI+Ly9QZXRlcjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFy
ZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBz
dHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBj
bSAwY20gMGNtIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5Gcm9tOjwv
c3Bhbj48L2I+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgJmx0O29wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2YgPC9iPkd1w7BuaSBNw6FyIEdpbGJlcnQg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TZW50OjwvYj4gZGVuIDIwIG5vdmVt
YmVyIDIwMjQgMjA6MDY8YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbUEFUQ0hd
IGdsaWItMi4wOiB1cGdyYWRlIDIuODIuMSAtJmd0OyAyLjgyLjI8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+djIuODMuMCBpcyBhbHNvIGF2YWls
YWJsZSA8YSBocmVmPSJodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8tL3JlbGVh
c2VzLzIuODMuMCIgdGFyZ2V0PSJfYmxhbmsiPg0KaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dO
T01FL2dsaWIvLS9yZWxlYXNlcy8yLjgzLjA8L2E+IGJ1dCB1cGdyYWRpbmcgdG8gdGhhdCBpcyBs
aWtlbHkgYSBsb3QgbW9yZSB3b3JrIHRoYW4gdGhpcyBtaW5vciByZWxlYXNlIDogKTxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DB5PR02MB10213D85A3AB44806BA753CEFEF212DB5PR02MB10213eu_--

