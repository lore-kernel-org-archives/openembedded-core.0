Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6755DC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 14:13:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.63])
 by mx.groups.io with SMTP id smtpd.web11.37822.1749391992462322105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 07:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=MWj4/WZq;
 spf=pass (domain: axis.com, ip: 52.101.65.63, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUZS84m+KaYxGJLSQxUKcyvdJjjX/ExD3YN9tlCc8DrDshsHWCMeRCF7fg3r1fdATwlcoRGkYDmp8tbFGag9CobI5ESBHFCv3ERj+JjjpbWX5wJ4VPG423ztxdAQhO+pCvOhphIpfQMlVw8xFbj/tycl3SZTTumRkkEEyi+TrQ7dOTQRSMW/m8rLfxQf48uxWjC72W2jYtntMeH92sejbgDHfeMHT7JEJHn8TopjMsnxYQofiMOj3GbRYL+GI9ZUaxdkPNHHNhDPbFk+KjUua+O18qKOeD0IrKxPHsb35C78fTOBkCQF3CfYaT7/0lO9Jx0bkyInGY+RVKbsKjAa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNXjnGiR6OT54OLE0oOO69LyW2mS4iocKqvQJfXc++E=;
 b=vCtazRDIzWI/66pj12f4IhHZNhfNmW9S4OFUZRIkQukAL5JINQpIXowwBFOztCuY6U6AVbOPJcleEfnlIDFydFVp3QLvduEDI7pThBXh0kHf+gJCwpP9AEBaq4GEPrVOWaC+ZAUzbuKXHYsX7US++7xyCtCEdZPgPoFw7dsxq38QGxe0fN0XBUJz2qDs5rsEZK7O9b4NtvPi2zeZAQ0AD8OFgIjRJvEix35QjdvaS0JaKGbnZU2EVTey3CoO2lgKbeeH/piWBXnSjbLlTMHB4Qk5S/TxJUcSzaJoJtlnzb2+PX+O53Xqvk+ifnW1UJTz12n5bk6eBHDMyGK8Ct3KBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNXjnGiR6OT54OLE0oOO69LyW2mS4iocKqvQJfXc++E=;
 b=MWj4/WZqkkt1HBT4kRPJOvKxF6fMrfbpDcpKZpqSJ8ZSCd9II1z+vSYsCTjqAWS9/oyqu9ox8Uxkkx/7NXDBrG6Ukap9R5DRQoMzVqeELtouMkK87PAtnGSab/LZoCq0AIOiLfSFUTrywpY6cT5pYGdjKfRm6DRB7fiwg/EIXiU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM0PR02MB5812.eurprd02.prod.outlook.com (2603:10a6:208:17f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Sun, 8 Jun
 2025 14:13:09 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8813.018; Sun, 8 Jun 2025
 14:13:09 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Patchtest results for [PATCH v2 1/1] rpm: 4.20.0 ->
 4.20.1
Thread-Topic: [OE-core] Patchtest results for [PATCH v2 1/1] rpm: 4.20.0 ->
 4.20.1
Thread-Index: AQHb2GKMSGun6qq3/kS+j7fl+Hgm/rP5FfoAgAA0CZA=
Date: Sun, 8 Jun 2025 14:13:08 +0000
Message-ID: 
 <DB5PR02MB10213DB19791CAD7D83342256EF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <ac979fa2e300f8fb8e4f60fddcad4d299741ab33.1749379320.git.liezhi.yang@windriver.com>
 <010101974f25b46f-25c3d505-38be-4277-ae97-006ce8b41b73-000000@us-west-2.amazonses.com>
 <68a030c3-3aad-40be-b0a4-9ba344ad6a39@windriver.com>
In-Reply-To: <68a030c3-3aad-40be-b0a4-9ba344ad6a39@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM0PR02MB5812:EE_
x-ms-office365-filtering-correlation-id: ffe7b122-0ae2-457e-a5a6-08dda6969874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eXh1cDltcnVvZk9WZXZaZm0yUGFINXVJR21MZDZodGNEcUNxREpvb292SVpD?=
 =?utf-8?B?TmRoYkwrUWJadGpqQ3dkcVJVQm14NngrUnVUOFFyNFEzZXkzd3Zoc2VJV3ZJ?=
 =?utf-8?B?M3kvREwra3NpTFZ3dEh6dVZqd1dLbjZKZDYxYitHTUhDcHdHN1l2NHdpSHBv?=
 =?utf-8?B?K1grT2VqaFJEWW81eWswTE5uS2I4dEVGcTNrRE5NdXpSZjZSZm0rd0dJWWVO?=
 =?utf-8?B?TW0yYUxsTDJRbUR0T3BnT2d4YXlPLy9kcm0vQTIwenFZNEJYR3lIZDhTbCtC?=
 =?utf-8?B?Y0hlSjkyNVBEQ3YyR2s3T2Zha0RSMGlPYklIVUlIM012MU5iSFFMOTd6UEpy?=
 =?utf-8?B?STVEMzRYOWFZOFhyUGJJRTlpNXg4akdycEcweURIUVdiQjVjakVNSUhGN09C?=
 =?utf-8?B?bHc2YWpManZFWDJLcnRaejdCSnlTdWh3THB0bkdEcFNody9RT3BhREZHUm5H?=
 =?utf-8?B?NW1LaVluZUlIL1lST2xJb0ZrUXBlT292Rmo0NVlub1dNQ2E5WWQwMnZxS05Q?=
 =?utf-8?B?c0FHVGl2azFzeldXeGg2YlJ5c2VNdVErUjJKL0FNTW41cTh1WnhFcnNFQjlw?=
 =?utf-8?B?QkRvN3lMWjRtaXY3TFBpTS9wT1g4WlNTTkp3c01oMW9nQ1lBWG41L1k0TWdn?=
 =?utf-8?B?RmxvcGU0TWpWMFhLQ0xaUXdhWUl6UnYrMHE4aGljSkMxVjhiWlpVTDgrUHAz?=
 =?utf-8?B?S0psU0JWUG1JUzRCR1p1cy9iTUJtbTh4aTN1cit0ZnAxdVl3bTFZamg2cllh?=
 =?utf-8?B?cGdZaGVoek1yYWptdlRJbFJEeW9JSmQ0TWNqVG1CMSs1M2NnNW5WQ2ZWMjl5?=
 =?utf-8?B?SXlMSWxsZEdYNHVmQ3FxWm1kTEY3Z3c4NEpydWVleUlsczVDYUs1UnBMNzRP?=
 =?utf-8?B?cndzNENNdGQrRFF3N3ZaRlFVZXhiRmNxS1Vta011SFRkVUtaa1BDelRqZWNx?=
 =?utf-8?B?eGRtYlBlWkdSUURSUW45bk9zMlBCYlNONHllZmgraHg5Tk80bmdVd3orNjRT?=
 =?utf-8?B?TEFya2E3TmZobmRPMGhrSngrTGVBQjFYY0U1ZmpOWGVaaVRVU2tsYTZTTnZM?=
 =?utf-8?B?MVBtSmlSYUdUTVRtWDVXTnhWaklCNmY2Yzd3MXBudldXZldxRjE4TFdGV0Jy?=
 =?utf-8?B?MERLbzgyQVlsSHhyZmtsOHNmMFhHWElhT080YnNWRVhTbE1aVWQzQzZac0Ux?=
 =?utf-8?B?NElvVEZlQkl3TkE4QmtlY1hHZEtPdFdJTkpwRUVsOEdKd3Z3V1JDYWlTRVQy?=
 =?utf-8?B?WGxIZGl4aGxMbjh3a0NkWU5SSERsRzZDTjdZZnc5WXRBSk93SHpyelZmMWw2?=
 =?utf-8?B?dlBkYmJKRzlCSTFHRFRZaFVDNjIxUWpEbUVWK2JrdkxpSDB0UlE4RDljTHJw?=
 =?utf-8?B?QWU4TGp0WFdLMmg4UVhQaVNKekZoT3E2U0o4ZFJpVzJ1NEZueUZFSkkvVk1I?=
 =?utf-8?B?czdFdU1GYmRoN0RPdDIyR3cwY3JVY01lS3RnaWFhcUN0ZDVsdnM4MjNXRFhx?=
 =?utf-8?B?aU5zeGk0WlRSK0huaEFGT1E5NjUyVVhCSzl4OU9zVytSWWlJejhiZHFXczNq?=
 =?utf-8?B?MVZjdkRvdEVTL3VFQkFKckFMcGhRbXdVS3psZklkaE9oZSt2WmY3VXZXQlVN?=
 =?utf-8?B?NVduU1Z0MUhWMkNKK054Ynh2aFZETkJTaU82UmRyUUMzY01FQ0dTYXFMYjda?=
 =?utf-8?B?VXU3T2FzYzRsRzAwdUVPVjMzNzgxeWZ4L2tROFpOVFJMSzhtMXR4alR5RHJx?=
 =?utf-8?B?NzgxTno3azFGUjBuOFB0bGlPYkt0bUprbjd2dk00M3o5bWpIdzZKa1NpbzhS?=
 =?utf-8?B?Q1FPV2dWRFhlZVlNT0FWOFJNRUpXdlowNFY0WGJiOFJnaWd5SnFmM2VWNnNJ?=
 =?utf-8?B?ZmRxNGw1RVJlSUxjUmZIRWM5T09VVlh1ODU1RWRxZ0g5YURZNXhiWGxYRjg3?=
 =?utf-8?Q?x4XQ8eqrfNA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VjZCbHVCOTdsSTBDVDNzVXRiMi9aWk5Bd3k4YWkzVExZSU1pVjZwemhEamU2?=
 =?utf-8?B?b21VMjkyOWNzZ0EyQXFiaXNpNWYyN2dXUHdzYTY1RjFnWmszYU5odCtMS2RY?=
 =?utf-8?B?c0dOWWVwS1IrbEFvUE5jQUNJcmE1eU9QZ2Uyb0pLMGlTN1FuZEVkdkF2Uy9P?=
 =?utf-8?B?Q0h6VHpsb1RhNVZNRlUxd2pZRWx6eHRPZkZwMWRocGZXR1E2RDY2a1U2U1Q2?=
 =?utf-8?B?NlNHNWVFS2NwZ21jZmhXcFBOZXl0RXFwekVFdk5vV1lteUdBY3I3Ym1MaW1B?=
 =?utf-8?B?cXM5UFVMV3h4U1hRZ2xwUWhXMUgvcHFtOVo1cldxMTlCdktxeVNabUNYdTRx?=
 =?utf-8?B?OWlCUHlGdEhvYVZvOXJkYWE1UEZ6bzVhSUtSRjdvc2ErQm96ZjV6R1ZNMUpB?=
 =?utf-8?B?RzVvOEdORFNuY2ptZ0NnUzFjbzZnanRic250TDQrNXlhQXA4NG5uM2J5V1hh?=
 =?utf-8?B?ek1TK29JdDdXa08rT0UwZHBseTdrZS9pZTJvVWFnQUl3TmlaY0JnemJvQUI4?=
 =?utf-8?B?eTVzTGs5ZDJ5TWxBcHpYSEFtRXBQTGhjWjBCRitSNk1XQi9pdms4aXNXMkw4?=
 =?utf-8?B?Yk9PbXI4V0tpVlVveGt2Q3dabWg4Tm5KLzN2RkhQU0oyU0xVbzN4QVBCeFUy?=
 =?utf-8?B?d211WVp1dytDUXN0bHVESEFSM20vdFA1eGpyN2RETUlqdXFhU2ZtcnpJOSti?=
 =?utf-8?B?RXhZbXl0Qk0ycStPQ0JnNDhnTHUzd2V1a24rOWozaUNDMHMzUUhKMVdmMHBn?=
 =?utf-8?B?YW5ZOWE3eWVwVFE5dzZ6S3IzSXdlRnFRc0RhaitCa0t2UVRwU1BjcERoUUpM?=
 =?utf-8?B?NFBOd2tETmdNN2xhbVJkUnQ3NW9ZNWVvVU9icllGZnQyd3ptT3VJcjFtVkxX?=
 =?utf-8?B?UUFYc2lmdVc5dTZjSlhVRVI5RUlYNDZpMVNmcEZUZkh5SGRydHdOdnE1TkJ5?=
 =?utf-8?B?YktvSWVtY3VuSzNPNG1DMGhJOU1MckU5blJSbzg1N09MTlBQV0owb2g3Ymh0?=
 =?utf-8?B?SXNaV3h6K2crRVNTeEZneW5EZXlneGhOOVQwdzhpNVRuWXZuQSt0MGtqRXJn?=
 =?utf-8?B?cXVDTUZDcGJrb013eExDSTJDWWR5YjZZdjhpT1ZlTms3WUVZZFg2SGpZaCtv?=
 =?utf-8?B?dDg1Z3hkUE84cU51cVJNWTZGaHlacWJQcm5uWU4vTTNUWDBJNDV5UDJrR3ox?=
 =?utf-8?B?TTdCcDJ4aHA1RFloRE1pZjhlbDdwcHJyVmxoY3BmTjI3eU4xZ0JNV2ZxYnRN?=
 =?utf-8?B?TkF1b0x4WnIvK3VTWnhHdHV3NTJjSGRMZjZhSmNQN1lWT1g0Y0dkc3czWnJW?=
 =?utf-8?B?SGlhL2t4eFN4WGZBY1VDV3pReVBmbWU4VjhrakRpOXdUTkh5elZZa1QrdmUv?=
 =?utf-8?B?TmVYSXdyNy94bFpUU3IvZWJleXFDc2dGcUwzMng0T2Rmb3lpcEY5RmdVUVBt?=
 =?utf-8?B?Z1N6dmxNVk82cStsOWpzZzg2bHFKVHRlaEVIYklnMFkzU1c4YUdCTXIxa0pL?=
 =?utf-8?B?VmJtYzhDbnFYci9hY2lVOHFGYzVXdi9FdEgvZVdHc005UjZaaHVnenBZR2lL?=
 =?utf-8?B?ZzNQUCtwZlI0NGMrQVc4VGdSaDRuekZSYXlHZUYwNXNxNVh5ZVV6M1YzK2Mr?=
 =?utf-8?B?M2tMK3YxcXZQMWlvK3B5ekNnblR4SGdZK3BEeHoxZi9jTFJ0bjdPbTk4SXZ1?=
 =?utf-8?B?VXNxbXF0Y2pUV3haeWJXUUEvbVFPcXBCK1JmWDMxTXhBWjg5Rk8yZUxIRUhY?=
 =?utf-8?B?VWFTd1U0YjdqSzdVdXhza2I0aERmZVk3TWdqUUU3anYvQ0d5RGZ3a0FLREpj?=
 =?utf-8?B?ZVlYSVZqelZxTXk2MjFLeVhRMjZwZGU2eWIzRFB0R0NhZ1pjc25BbVdFV3I0?=
 =?utf-8?B?Z2NFeFZVc2w0cjBlM1FkaG1BU1NYOTRINXd0SUlHTUVtS3hOS1NadWNkblY4?=
 =?utf-8?B?SElVeHFjS0VXRyswWmFjbFVKU3pubUtXM1plbWk4QkJ5bGp3SHlGSkZRK3VX?=
 =?utf-8?B?N1QwNVRnRkN6UmtILzEyUGxtTmdKb3VycTFBRS9UOHlIUTREd1JjM1d2Nkk2?=
 =?utf-8?B?Y29KN04vYVNKQzBBQzNHZ3RTSlptRk5aYTFITlpMamJrYmxWOUdiTW55L294?=
 =?utf-8?Q?Purg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7b122-0ae2-457e-a5a6-08dda6969874
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2025 14:13:08.9296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+m0mk1pqFLoJoi7EoXtFK+DIVoaj274HiE0nwHYnbzmXGjDOtb3Pq5MLbrceAY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218219

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUm9iZXJ0IFlhbmcgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU2VudDogZGVuIDgganVuaSAyMDI1IDEyOjUyDQo+IFRvOiBwYXRjaHRlc3RAYXV0b21h
dGlvbi55b2N0b3Byb2plY3Qub3JnDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gUGF0Y2h0ZXN0IHJlc3VsdHMg
Zm9yIFtQQVRDSCB2MiAxLzFdIHJwbTogNC4yMC4wIC0+IDQuMjAuMQ0KPiANCj4gT24gNi84LzI1
IDE4OjQ2LCBwYXRjaHRlc3RAYXV0b21hdGlvbi55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPiA+
IFRoYW5rIHlvdSBmb3IgeW91ciBzdWJtaXNzaW9uLiBQYXRjaHRlc3QgaWRlbnRpZmllZCBvbmUN
Cj4gPiBvciBtb3JlIGlzc3VlcyB3aXRoIHRoZSBwYXRjaC4gUGxlYXNlIHNlZSB0aGUgbG9nIGJl
bG93IGZvcg0KPiA+IG1vcmUgaW5mb3JtYXRpb246DQo+ID4NCj4gPiAtLS0NCj4gPiBUZXN0aW5n
IHBhdGNoIC9ob21lL3BhdGNodGVzdC9zaGFyZS9tYm94ZXMvdjItMS0xLXJwbS00LjIwLjAtLS00
LjIwLjEucGF0Y2gNCj4gPg0KPiA+IEZBSUw6IHRlc3QgbGljIGZpbGVzIGNoa3N1bSBtb2RpZmll
ZCBub3QgbWVudGlvbmVkOiBMSUNfRklMRVNfQ0hLU1VNIGNoYW5nZWQgd2l0aG91dCAiTGljZW5z
ZS1VcGRhdGU6IiB0YWcgYW5kIGRlc2NyaXB0aW9uIGluIGNvbW1pdCBtZXNzYWdlICh0ZXN0X21l
dGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X2xpY19maWxlc19jaGtzdW1fbW9kaWZpZWRfbm90X21l
bnRpb25lZCkNCj4gDQo+IFRoZXJlIGlzIGEgIkxpY2Vuc2UtVXBkYXRlOiIgdGFnIGluIHRoZSBj
b21taXQgbWVzc2FnZToNCj4gDQo+ICAgICAgKiBMaWNlbnNlLVVwZGF0ZTogTWlub3IgZm9ybWF0
dGluZyBjaGFuZ2VzIGFzIHRoZSBjb21taXQgbWVzc2FnZXMNCj4gc2FpZCBpbg0KPiAgICAgICAg
NDExNDNiMjdiNmY3MzIwZjI4MGFlYTYwMTRlOGY1MzJlYjAyMzlkNg0KPiANCj4gQW5kIFYxIGRp
ZG4ndCBoYXZlIHRoaXMgaXNzdWUsIGJ1dCBmYWlsZWQgaW4gVjIsIEkgZGlkbid0IG1vZGlmeSB0
aGUgYWJvdmUNCj4gc2VjdGlvbiBpbiBWMiwgc29tZXRoaW5nIGlzIHdyb25nIHdpdGggUGF0Y2h0
ZXN0Pw0KDQpNeSBndWVzcyBpcyB0aGF0IGl0IGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHlvdSBw
cmVmaXhlZCBpdCB3aXRoIGEgIioiLg0KDQpQZXJzb25hbGx5LCBJIGhhdmUgYWx3YXlzIHRob3Vn
aHQgb2YgTGljZW5zZS1VcGRhdGUgYXMgYSB0cmFpbGVyLCBpLmUuLCANCnNpbWlsYXIgdG8gdGhl
IFNpZ25lZC1vZmYtYnkgdHJhaWxlci4gQW5kIHRyYWlsZXJzIGFyZSBub3QgYWxsb3dlZCB0byBo
YXZlIA0KYW55dGhpbmcgcHJlY2VkaW5nIHRoZW0uIFRoZXkgYXJlIGFsc28gZXhwZWN0ZWQgdG8g
YmUgYSBzaW5nbGUgbGluZSwgb3IgDQpmb2xkZWQgYWNjb3JkaW5nIHRvIFJGQyA4MjIgKHNlZSBg
Z2l0IGludGVycHJldC10cmFpbGVycyAtLWhlbHBgKS4gTm93LCBJIA0KZG8gbm90IGtub3cgaWYg
dGhpcyBpcyB0aGUgb2ZmaWNpYWwgZGVmaW5pdGlvbiBvZiBMaWNlbnNlLVVwZGF0ZSwgYnV0IGlm
IA0KaXQgaXNuJ3QsIEkgdGhpbmsgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gb2ZmaWNpYWxs
eSBkZWZpbmUgYW5kIGRvY3VtZW50IA0KaXQgdG8gYmUgYSBHaXQgdHJhaWxlci4NCg0KPiANCj4g
Ly8gUm9iZXJ0DQo+IA0KPiANCj4gPg0KPiA+IFBBU1M6IHByZXRlc3Qgc3JjIHVyaSBsZWZ0IGZp
bGVzICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS5wcmV0ZXN0X3NyY191cmlfbGVmdF9maWxl
cykNCj4gPiBQQVNTOiB0ZXN0IENWRSBjaGVjayBpZ25vcmUgKHRlc3RfbWV0YWRhdGEuVGVzdE1l
dGFkYXRhLnRlc3RfY3ZlX2NoZWNrX2lnbm9yZSkNCj4gPiBQQVNTOiB0ZXN0IENWRSB0YWcgZm9y
bWF0ICh0ZXN0X3BhdGNoLlRlc3RQYXRjaC50ZXN0X2N2ZV90YWdfZm9ybWF0KQ0KPiA+IFBBU1M6
IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVzZW5jZSAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfc2ln
bmVkX29mZl9ieV9wcmVzZW5jZSkNCj4gPiBQQVNTOiB0ZXN0IFNpZ25lZC1vZmYtYnkgcHJlc2Vu
Y2UgKHRlc3RfcGF0Y2guVGVzdFBhdGNoLnRlc3Rfc2lnbmVkX29mZl9ieV9wcmVzZW5jZSkNCj4g
PiBQQVNTOiB0ZXN0IFVwc3RyZWFtLVN0YXR1cyBwcmVzZW5jZSAodGVzdF9wYXRjaC5UZXN0UGF0
Y2gudGVzdF91cHN0cmVhbV9zdGF0dXNfcHJlc2VuY2VfZm9ybWF0KQ0KPiA+IFBBU1M6IHRlc3Qg
YXV0aG9yIHZhbGlkICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9hdXRob3JfdmFsaWQpDQo+ID4g
UEFTUzogdGVzdCBjb21taXQgbWVzc2FnZSBwcmVzZW5jZSAodGVzdF9tYm94LlRlc3RNYm94LnRl
c3RfY29tbWl0X21lc3NhZ2VfcHJlc2VuY2UpDQo+ID4gUEFTUzogdGVzdCBjb21taXQgbWVzc2Fn
ZSB1c2VyIHRhZ3MgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2NvbW1pdF9tZXNzYWdlX3VzZXJf
dGFncykNCj4gPiBQQVNTOiB0ZXN0IG1heCBsaW5lIGxlbmd0aCAodGVzdF9tZXRhZGF0YS5UZXN0
TWV0YWRhdGEudGVzdF9tYXhfbGluZV9sZW5ndGgpDQo+ID4gUEFTUzogdGVzdCBtYm94IGZvcm1h
dCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3RfbWJveF9mb3JtYXQpDQo+ID4gUEFTUzogdGVzdCBu
b24tQVVIIHVwZ3JhZGUgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X25vbl9hdWhfdXBncmFkZSkN
Cj4gPiBQQVNTOiB0ZXN0IHNob3J0bG9nIGZvcm1hdCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rf
c2hvcnRsb2dfZm9ybWF0KQ0KPiA+IFBBU1M6IHRlc3Qgc2hvcnRsb2cgbGVuZ3RoICh0ZXN0X21i
b3guVGVzdE1ib3gudGVzdF9zaG9ydGxvZ19sZW5ndGgpDQo+ID4gUEFTUzogdGVzdCBzcmMgdXJp
IGxlZnQgZmlsZXMgKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRlc3Rfc3JjX3VyaV9sZWZ0
X2ZpbGVzKQ0KPiA+IFBBU1M6IHRlc3QgdGFyZ2V0IG1haWxpbmcgbGlzdCAodGVzdF9tYm94LlRl
c3RNYm94LnRlc3RfdGFyZ2V0X21haWxpbmdfbGlzdCkNCj4gPg0KPiA+IFNLSVA6IHByZXRlc3Qg
cHlsaW50OiBObyBweXRob24gcmVsYXRlZCBwYXRjaGVzLCBza2lwcGluZyB0ZXN0ICh0ZXN0X3B5
dGhvbl9weWxpbnQuUHlMaW50LnByZXRlc3RfcHlsaW50KQ0KPiA+IFNLSVA6IHRlc3QgYnVnemls
bGEgZW50cnkgZm9ybWF0OiBObyBidWcgSUQgZm91bmQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0
X2J1Z3ppbGxhX2VudHJ5X2Zvcm1hdCkNCj4gPiBTS0lQOiB0ZXN0IGxpYyBmaWxlcyBjaGtzdW0g
cHJlc2VuY2U6IE5vIGFkZGVkIHJlY2lwZXMsIHNraXBwaW5nIHRlc3QgKHRlc3RfbWV0YWRhdGEu
VGVzdE1ldGFkYXRhLnRlc3RfbGljX2ZpbGVzX2Noa3N1bV9wcmVzZW5jZSkNCj4gPiBTS0lQOiB0
ZXN0IGxpY2Vuc2UgcHJlc2VuY2U6IE5vIGFkZGVkIHJlY2lwZXMsIHNraXBwaW5nIHRlc3QgKHRl
c3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRlc3RfbGljZW5zZV9wcmVzZW5jZSkNCj4gPiBTS0lQ
OiB0ZXN0IHB5bGludDogTm8gcHl0aG9uIHJlbGF0ZWQgcGF0Y2hlcywgc2tpcHBpbmcgdGVzdCAo
dGVzdF9weXRob25fcHlsaW50LlB5TGludC50ZXN0X3B5bGludCkNCj4gPiBTS0lQOiB0ZXN0IHNl
cmllcyBtZXJnZSBvbiBoZWFkOiBNZXJnZSB0ZXN0IGlzIGRpc2FibGVkIGZvciBub3cgKHRlc3Rf
bWJveC5UZXN0TWJveC50ZXN0X3Nlcmllc19tZXJnZV9vbl9oZWFkKQ0KPiA+IFNLSVA6IHRlc3Qg
c3VtbWFyeSBwcmVzZW5jZTogTm8gYWRkZWQgcmVjaXBlcywgc2tpcHBpbmcgdGVzdCAodGVzdF9t
ZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9zdW1tYXJ5X3ByZXNlbmNlKQ0KPiA+DQo+ID4gLS0t
DQo+ID4NCj4gPiBQbGVhc2UgYWRkcmVzcyB0aGUgaXNzdWVzIGlkZW50aWZpZWQgYW5kDQo+ID4g
c3VibWl0IGEgbmV3IHJldmlzaW9uIG9mIHRoZSBwYXRjaCwgb3IgYWx0ZXJuYXRpdmVseSwgcmVw
bHkgdG8gdGhpcw0KPiA+IGVtYWlsIHdpdGggYW4gZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBwYXRj
aCBzaG91bGQgYmUgYWNjZXB0ZWQuIElmIHlvdQ0KPiA+IGJlbGlldmUgdGhlc2UgcmVzdWx0cyBh
cmUgZHVlIHRvIGFuIGVycm9yIGluIHBhdGNodGVzdCwgcGxlYXNlIHN1Ym1pdCBhDQo+ID4gYnVn
IGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy8gKHVzZSB0aGUgJ1BhdGNodGVz
dCcgY2F0ZWdvcnkNCj4gPiB1bmRlciAnWW9jdG8gUHJvamVjdCBTdWJwcm9qZWN0cycpLiBGb3Ig
bW9yZSBpbmZvcm1hdGlvbiBvbiBzcGVjaWZpYw0KPiA+IGZhaWx1cmVzLCBzZWU6IGh0dHBzOi8v
d2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvUGF0Y2h0ZXN0LiBUaGFuaw0KPiA+IHlvdSENCg0K
Ly9QZXRlcg0KDQo=

