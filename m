Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB8DC5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 17:15:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.396.1787246130237003250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 10:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=lcrLB99q;
 spf=pass (domain: axis.com, ip: 40.107.159.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+aNi77TN51JvnI5NoYT1viq/iFnQirfqhSTsoUDjNT/5YacCp74gyLMJSOCfxDmhp8yxD3UJsp0zrToUx89/J06uY/h7uNWo8h3lvBKN8ZYphWxhkagjESjxtwXpOjU7i/bqtQ4B5E6P9Di95DQIRq20KHznLGM886D7Kl/AH/p9pf/aitce6McKOrL++ri99SfLvc/Js0fNZtEZwLuzhEIzMyJxPKB+uZNl8BrHu26UANmkIZ1madMtyrs879Vj+WGbfEc+jodR4RaNqXq6VQknRrB+OBUWZhsZQl1vvrXUSgGDmVmUXvdgCKdA4Ko6GxH/RGzByV6Osqu8+1W7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wfRXixJm2+JuZeT6Mv40Jl62feop/1sc4E2M+3Qn8w=;
 b=YPRpi2yXuwZ+6aGL6rKU62LlycN40pV3CAS6hiwEkpMFLYo+zJ4amDHGi5mnuZbzyCv7daHgD5s2fU3SQjcOgvqB9w8BEw76Zlo9J+uRkWErXKpcLDoCAIMXNdMY2osmm3RbrGKOV2pnoGQGIE1kfqLipa4uEfMe0pzyHls8Ttk6Vqd6V6JvPPvChO7oWiXUJ/NaKCsxvFu6IWvuV+vh7l6uO9txIJvnX7x2I30+LN1wydtiClUf4qpWgTIW3sXFCf6DBPgw0HtDB4s8jYPFot+1CUvcgwFXYgTLW7JhIJQ5gQdmVFElJgMaLGza/XBRP/DCcKXffKBWd2gynzkeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wfRXixJm2+JuZeT6Mv40Jl62feop/1sc4E2M+3Qn8w=;
 b=lcrLB99qlneppw1+9jwXgdT/j6wZlKd2DCrpEXvRjgdEXEr5I1fW/upsTbRmyKB4Tay+yZR11aVShNDaMyIT+SGeLt0ldwp1RFnuVw+c74P466h8rBvFDQUGCGHbb5thBzBu03AnWSsuuzmghZkJllqrbhiFo5N/CUOXhlYxoYM=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by VI1PR02MB6206.eurprd02.prod.outlook.com (2603:10a6:800:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:15:25 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:15:25 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: RE: [OE-core] [PATCH 1/4] scripts: scriptutils: Use
 LicenseRef-Proprietary LICENSE while fetching
Thread-Topic: [OE-core] [PATCH 1/4] scripts: scriptutils: Use
 LicenseRef-Proprietary LICENSE while fetching
Thread-Index: AQHdLAnLsjCFyFefF0aUUyzc5KtAgbafqZAAgAeMl7A=
Date: Thu, 20 Aug 2026 17:15:25 +0000
Message-ID: 
 <AS8PR02MB10201FD1C1314384116479B6AEFA42@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
	 <20260814-mathieu-devtool-v1-1-985e81a17bb3@bootlin.com>
 <4c64d239ed5a24eeeaa7937abf1a3bbbf5e5cfa0.camel@linuxfoundation.org>
In-Reply-To: 
 <4c64d239ed5a24eeeaa7937abf1a3bbbf5e5cfa0.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|VI1PR02MB6206:EE_
x-ms-office365-filtering-correlation-id: c4aa252e-3998-4831-ef5d-08defede9ff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|4143699003|17002099007|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 uyY7D2Nz0EUK0wmXOHScHgwPre4Ir+Rkp7pImqTpmEJrI9NwN0x2qVx6H9WKS/3I9ppfW85U1pNuKU0qFL5X4TPYyEQ7dAz16Eyt7TOffp6Vmd2qv4N5xdrrptkCP3jyAEdZ4Sv4IQ/P0WeiGwhz9X1b8073E7Aucj6c6YPwh3h85FSQHIBFUU/h/FQpdBUkc1z39k930CQpGPuVLwvBR/FLNtDz8wbNTNdfVkbc4BlrJPrMLTVPOTq38qa8lUeswhaNrikv5XD9G/m55UD1s++ySEavs4EQGAwoMU5DJTalTiIQz2gO68BzhSjrXtSwTyp4zT/OD1t08CXaS6xhRwmqiyDyYhR701UH0+BhKM827sIzCVjv9pXCjceYSFLz1dyyvQZDQnjmDAk0TWDe4enTdCYB0lxqUdTqm4UVTqOQjz05tnpdjnUc3hfkWV5SWa+G6cDgxPW8/wTUi7vk5qJfWoeVIfmJ9X0bqO3OjEDZvmyJxi3oc2Nu24L3sTEITM5kXu4nwc2U29JZxWDAYYgrh+ZPYNuxXosn2oF2Uy2DgVTmYpo/xRMKj8kZj15naG6rWPirjUbzG5Fh1PgjPfC63yTV2EmgqGzAGjCsMB6O4vaYIx+/qYBxS06Wxst3bso2XDizWXGO/YZ8Zj6BRpRWCq47oVGUbaSXBZR72arKAb7Q6DEEvQ3rMhmWvIzWkkshFrhLYIVAPXjTiRMnxR5ixca/P08PCT56Z7TUlDs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(17002099007)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2xpMDUrYStSOTkvU2xGaCs1OXZDbEJtVzJqNElkNU8wUWNVaWJRS29PTDlB?=
 =?utf-8?B?TktOTmVIQ1YvSWt6UmpkWEduSkYzTVZyTjJLZmJhYTYwM1FOamNya1lBYUw0?=
 =?utf-8?B?VjVWdWljZ3NVLzRKdTVUNmxHZmRYVTd0STJ0VUtubXVCMDUvZmcwTmE0aXh0?=
 =?utf-8?B?M2NQR1pZL0kvVzU4cUhlLzFTQnN1aTV0NjVmWTdTVTRsUWxWc25sMG85OEYr?=
 =?utf-8?B?NEdPeFVEK01qU0JFMklMeEFjNlVzNW9OendTS1NlaUVKeHAySXNBdG9hWWtN?=
 =?utf-8?B?bGp4SithYnZPRTFFMW5ISUFKUk94andidnp2bTlSa1FXRFh2QzkvVEZacW90?=
 =?utf-8?B?K2F6YkhwZWRFanNWRmdjVHBSMW5uRFprajErTVE0L21lRWJWSUI4Ym50c0d4?=
 =?utf-8?B?WnhqalFDVkVWMjNhK0RDZERQeGNaRHlib0hnNmh1SkNyVEYxaVpOcHVvaUNO?=
 =?utf-8?B?Y3JRR05FemUyeVZ2OGV0S3RzT1o4RlptVFJveExTZW0rWmoyOWtldVpVcDhj?=
 =?utf-8?B?YXRJNUN3aHR4ZDJrTHl6WmVGeTVXQjI2RkNuQ2huYXdlRVBlRExUNk8xdU5q?=
 =?utf-8?B?MUZuUkM2bVJ3VU01ckVjcEtHVmt0ZEFENE9lWC9uL2pWMzVkQ0UzNXhGR3pN?=
 =?utf-8?B?eTFIS1pmU3g5YjVGQlZBaW5xSXhtbUZNQm5ieVpaMVRJVWR5TnovaFMvWVJh?=
 =?utf-8?B?NlBrYUg0SWZ0QmNvbW1tSUNnZDJsNllLM1k5Mkh0VHVucncwOWRuUlhEeitz?=
 =?utf-8?B?bExKYzl5bFpDcWxLQkVxNDNqb1ZFZ1Z3M0xKdXNZUjNFUzBjZEVSSXYzTE94?=
 =?utf-8?B?a284RlRUaTNaR2MzM09GUzN1QjJ1VUtSVm0rcUw0Y1BHT3B0TXBiVXNxQWxD?=
 =?utf-8?B?QmFwbXN1MGEvQ2pzQmI4d1ZUa0lDRGoxWkkyTG9UeTVWbGpSR2NOdHZQN09o?=
 =?utf-8?B?Y0pWZWtUbWVoM3hvTUZRRWhyYktQbkFmdENoazBBM1BlR2pPRHFxUTkrd3RG?=
 =?utf-8?B?clExTHFkK3N6RlBTN3k4eTBqRXJUbDlVUFVqbFEwQ3BzMDZyQzZkV0h6MGNP?=
 =?utf-8?B?Y3pDZEFHS0k4NEU3cWRvS3o5aVhGby9QVFMwYWRleS9IbS9icmVnMXBHREdR?=
 =?utf-8?B?eDB0K0x3SGJ6cGRPNVBabnR1S3BmYVl5YzZwMXNUUXNLNHZmU2VoMUIxTXlK?=
 =?utf-8?B?NGpVRE5KbHRHQkdMdXIzbVlwSjhzNHVoN3NVNDhxbkRPWTlYcGsycnhjbFhZ?=
 =?utf-8?B?eWlSaFUwUkRQTlpVREkzWEF5Ym91QUduUENYaXlVWVAycHQydXVoZ3o0N1pL?=
 =?utf-8?B?STRYUllUSGVlZkJDbFBRSmp4eTVSVjRhSHZYek91d2xjZURSc1JETjNiT05w?=
 =?utf-8?B?ZkhUSmhQVFNYZGVFMVlYU0JNbHNKZ0FHTVd0WlM2K2IrVU9aczZnWmtXbEpD?=
 =?utf-8?B?UllFc085YTdHQlY1Q2JtbS91REZOU2hYWm8yTVBOYnJOMUI2Rk5YeXVpdXdn?=
 =?utf-8?B?dzVCMmJ6b0t4UGYwOGp0L3J2aENMQzQ1MzRHbVo5ckpuK3NMdThMZFNHQmRr?=
 =?utf-8?B?WXcreUJZTlV4cWNpZVhMWFg2anQrQXh0Rjl3WkVTbzhuZ1hqNXVXMjk0aTNY?=
 =?utf-8?B?aTUzTjNPdW5iUGdDT2NONUZvZ2lFZ1Qra3FVL0U0V1hEZGVSd0lEbTBuUVFL?=
 =?utf-8?B?UmhkVFQ0dm1WemxCYUlkOTE2UkJRZElyNW9GbVhiQnN6ZDQycGtmcGhSWG1L?=
 =?utf-8?B?R3BFR0lrZEpMNlVsdHV6Z29YemN5NEUzL3NGREpQQXdRcXFWaVBrWkpreUdR?=
 =?utf-8?B?Vks4MlFtRHB6dm9Xdm5STG8yQS9FKytKNE8zNVRqOHpvcmc2MnNqOEt3MFNr?=
 =?utf-8?B?U2pqNXhjZnA5T0N5V2RlNUx2eUNoS2daSFhyR3BzdTVyelhIT3RnWlIveEFm?=
 =?utf-8?B?b2xSalNCNnJVR0VwUklwc1B0ZkZxVjFWM0VYcTVLanBEUndFRUNsaUdOUjlP?=
 =?utf-8?B?bElhN1ZxZWNlNGxuRVpzZWV5a2NVTlltRjVQY2VHcU1Jc2pJSGoyZmM2NG5a?=
 =?utf-8?B?ckVlZitsZ3JFM0R3MDFORkRmNHdQcTl1c3BVT0tUVXgvUk8yQTAwN2xuSFdF?=
 =?utf-8?B?bFc4cEZJRGVWUjBtakMyQUd5dWN6NHJLbEFGT1pkemoxUjIrMk1mRXEwc0F2?=
 =?utf-8?B?K1ZyVDM4U0Z3cXhFcnVjWlBqQUp3S3YrQWF0UGVXeStjNDh2SDJtWklacDAx?=
 =?utf-8?Q?eU1ZG4mvRVNbRUWJHbQ43zcJZV/smdHhPlqcRSQlRA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aa252e-3998-4831-ef5d-08defede9ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 17:15:25.2625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NLicxtY4upZ61h0OkYF45UkM73ctt6iPisqjqr8l14lHERIcZfKLJLUbFRdwr9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 17:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243873

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU2VudDogZGVuIDE1IGF1Z3VzdGkgMjAyNiAyMzo1Ng0KPiBUbzogbWF0aGlldS5k
dWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzRdIHNjcmlwdHM6IHNj
cmlwdHV0aWxzOiBVc2UgTGljZW5zZVJlZi1Qcm9wcmlldGFyeSBMSUNFTlNFIHdoaWxlIGZldGNo
aW5nDQo+IA0KPiBPbiBGcmksIDIwMjYtMDgtMTQgYXQgMTg6MjYgKzAyMDAsIE1hdGhpZXUgRHVi
b2lzLUJyaWFuZCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBTd2l0Y2hp
bmcgYXdheSBvZiB0aGUgIkNMT1NFRCIgbGljZW5zZSwgYXMgZGV2dG9vbCB1c2VycyB3b3VsZCBl
bmNvdW50ZXINCj4gPiBkZXByZWNhdGlvbiB3YXJuaW5ncyBvbiAiZGV2dG9vbCBhZGQiIGNvbW1h
bmQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhp
ZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gPiAtLS0NCj4gPiDCoHNjcmlwdHMvbGli
L3NjcmlwdHV0aWxzLnB5IHwgMiArLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9saWIvc2Ny
aXB0dXRpbHMucHkgYi9zY3JpcHRzL2xpYi9zY3JpcHR1dGlscy5weQ0KPiA+IGluZGV4IDMyZTc0
OWRiYjFhMi4uYjRmYjZjYzE4NDVmIDEwMDY0NA0KPiA+IC0tLSBhL3NjcmlwdHMvbGliL3Njcmlw
dHV0aWxzLnB5DQo+ID4gKysrIGIvc2NyaXB0cy9saWIvc2NyaXB0dXRpbHMucHkNCj4gPiBAQCAt
MTcwLDcgKzE3MCw3IEBAIGRlZiBmZXRjaF91cmwodGluZm9pbCwgc3JjdXJpLCBzcmNyZXYsIGRl
c3RkaXIsIGxvZ2dlciwgcHJlc2VydmVfdG1wPUZhbHNlLCBtaXJyDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxvZ2dlci5kZWJ1ZygnR2VuZXJhdGluZyBpbml0aWFsIHJlY2lwZSAlcyBm
b3IgZmV0Y2hpbmcnICUgZmV0Y2hyZWNpcGUpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHdpdGggb3BlbihmZXRjaHJlY2lwZSwgJ3cnKSBhcyBmOg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICMgV2UgZG9uJ3Qgd2FudCB0byBoYXZlIHRvIHNwZWNpZnkgTElDX0ZJ
TEVTX0NIS1NVTQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZi53cml0ZSgn
TElDRU5TRSA9ICJDTE9TRUQiXG4nKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZi53cml0ZSgnTElDRU5TRSA9ICJMaWNlbnNlUmVmLVByb3ByaWV0YXJ5IlxuJykNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdlIGRvbid0IG5lZWQgdGhlIGNyb3Nz
LWNvbXBpbGVyDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZi53cml0ZSgn
SU5ISUJJVF9ERUZBVUxUX0RFUFMgPSAiMSJcbicpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIyBXZSBkb24ndCBoYXZlIHRoZSBjaGVja3N1bXMgeWV0IHNvIHdlIGNhbid0
IHJlcXVpcmUgdGhlbQ0KPiANCj4gUGVyaGFwcyAiTGljZW5zZVJlZi1SZWNpcGV0b29sVHJhbnNp
ZW50IiA/DQo+IA0KPiBJJ20gYSBiaXQgd29ycmllZCBQcm9wcmlldGFyeSBzZXRzIHVwIHRoZSB3
cm9uZyBpbXByZXNzaW9uLi4uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkRvZXMg
Y2hhbmdpbmcgZnJvbSBDTE9TRUQgdG8gc29tZSBvdGhlciBsaWNlbnNlIGV2ZW4gd29yayBhcyBp
bnRlbmRlZCANCmdpdmVuIHRoZSBjb21tZW50IGFib3V0IG5vdCB3YW50aW5nIHRvIGhhdmUgdG8g
c3BlY2lmeSBMSUNfRklMRVNfQ0hLU1VNPyANClRoaXMgd2FzIGEgcHJvcGVydHkgb2YgQ0xPU0VE
IHRoYXQgb3RoZXIgbGljZW5zZXMgZG8gbm90IGhhdmUuDQoNCi8vUGV0ZXINCg0K

