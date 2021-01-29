Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web08.7171.1611909264293304142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=R45DCvxR;
 spf=pass (domain: spinetix.com, ip: 40.107.6.71, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQq7EIHyYsi9NSe44xPNQ0Xm04LTMMSLJpsJ14DeBJOMzgjE0rY6tRFlJy7htL5M/0a7I7pQWZXKBlC+WJYCAqeIRF1IVKxHaIcfDKxlPzWe5wr6Gcfu9L+GX8fx0NbMA3LHUy86VXwcTuvj78ZVX2oNsDwPSNdV0pTeGviWj1P2h5WXwd/GthD+xkhe1xS/rMBQyrRgPTybnZwUr2S/MR5K+8UxuosSxV/+mcUDFmytSQdWuQNe6cT241m2a15xD1FX0V0qbeXc9YLqulo2DWB4Wm4TWPT5ZUv8VPO6uXV/Ms9Sgz5GP97shd5lxicAAKJ29kVSMvoKgBA0AIoInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pehyhjzxikxKECiNK3y1OPTSPyygpZ0yfJ9Z6lhAqg=;
 b=GHmvrOC6vLXXZsYGGKirKxpszROv4hNpLJe13eHd7zrsEqEPBi5cLXzLEIJtVQA2qd69ViM08oTlQiVi8RFvR+e9+2i5MF9AScdQ/uP4X/qfn++zAayoQYo+dPmhMUHanNkoqXUgZmcwdYQUPfWb3AA/3NdMsXG4IV7LLqLcga2fYX61UQlZdYeP5+BTAaKPhP2tWRKIRUZiFtKY1y3GawsZxTC/3vF8kPe5arcVQyXJRMUVtJuhVydNizufQ8VsGMZm9bhBM2e3Q4spBXfuCxf7nPkYl7P0dbAk91JQRQLTNgms+zTfe5K0WH07uoBCyHWddipg9cKquc4ivuRFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pehyhjzxikxKECiNK3y1OPTSPyygpZ0yfJ9Z6lhAqg=;
 b=R45DCvxREI0/H9YfiH+4RtRII6igO/4qL2mG/7NDiVTifldDKzhBDgPelGiR4TkNFw5cRqDx2wt+3CVl3yONSuxexNBgEea/+wGRh1n/V6gyXh7W0mTDNtG95QS2NVC+pOqz4ldrAENvPIR2CYt2dIBa+ZQ5pqR/dWel5qhIUho=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB5308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:85::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 08:32:54 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:32:54 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, Tom Hochstein
	<tom.hochstein@nxp.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
Thread-Topic: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by
 default
Thread-Index: AQHW9b2jvUaFlFFXKEWcbvhg9PwZ2qo9zQmAgAB3NFA=
Date: Fri, 29 Jan 2021 08:32:53 +0000
Message-ID: 
 <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <20210128213504.3821-1-tom.hochstein@nxp.com>
 <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
In-Reply-To: <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [2a02:120b:2c6f:c0:9564:a3b9:5b5e:8b32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbfd1a71-0e84-4a5f-4568-08d8c4307901
x-ms-traffictypediagnostic: DB7PR01MB5308:
x-microsoft-antispam-prvs: 
 <DB7PR01MB53080FC87C3D1F4693BDE5CA88B99@DB7PR01MB5308.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D9M/jSwpFlUJFX0Dkmu2ILE53D8kFcU4VgPZH1KfVomRUUgU6BknQCtorZy8QF3bRYfRsj1QSzAAL+awqGVKhEYwvghpde++OlsGEJI5vDgnmij3s7R7SvTQUYsd56aQB0tLWH5dBTiZ+gixWNQOD89g+uVyJMp5mQGe/vTeuPPWmlqhUrrNskvQPSK2UmX7296kbnJPUM8RKobFKy5dHmEmhRk1udgdZJg+P68lZH7fWW/VxGjbuhQ4ayIAT7tJx9Nc0PLvcGlZBRl3tAhkglk/NxTFpbdxC+EdKCMJDBUwDWNi0U8M8IuGNBDxeUOFhz5T6edVbP7VTDVNg7ApFXwyL/z71IrA5nd9pwRjW6WG+9Bwc91zF0tjHfd1YOPuMcgn+0eN6/N12fJ+xKHSVg17/OQ/VhrzbmqZzB9wKnISewbLrp/ZxfAP2m2DYC6iFA5CwJILjwAg2HsChbNV8UjrLCXIUEPD5+aga7n0U8DdDuHZiXL4nlYkQqswNPkvWp7/mTR/bnQCcJ81LL41Hg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39830400003)(396003)(346002)(55016002)(9686003)(4326008)(76116006)(2906002)(66446008)(66476007)(66556008)(110136005)(64756008)(478600001)(71200400001)(33656002)(316002)(83380400001)(86362001)(186003)(6506007)(5660300002)(66946007)(52536014)(8936002)(53546011)(7696005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?TlJIWWJMU3ozWittUG0xZEljUXR0R3V3RUVKZnBraC9vUVNYRmE0cFhvTkVR?=
 =?utf-8?B?anJ1S3Zua1VNK28xY3JBdllIelY4Ulh2enV0QnM5NS9EU1d1akt2cStvVE84?=
 =?utf-8?B?SVVneDBkdExjeVZ5N0gvV2dCaWFCS3ZMeU1KRWVjSzVYUG5SYkE4ZGdFVzhU?=
 =?utf-8?B?NDRQcStqSm5SZWJsajlvMHZ5WXc0THpCSWRQN3huaHoxQjdGK2xqRlYyRWlW?=
 =?utf-8?B?Ni90N1RrWmlndTdERkUvWi9DNmZ2OVh0TDhHZWdMNUlkMG1ZTjFzdXJmcU5T?=
 =?utf-8?B?bEpWcjE2QnB1Q2VTd2pmUkg1SStYek9oU0tKVkFoM2ozOUZCMU1sdERWOERL?=
 =?utf-8?B?QW1yeFZaZWxPMEt1NlBQSnRKRjZrNVFlQWlNaE0rMXFENE9uOW51dUYzNWt2?=
 =?utf-8?B?ei9RS3V1ZTBCWW5wWXRhQkRpamNmK2h4YjFqVkFMY0lBME1kTzcwVytORkt2?=
 =?utf-8?B?aGdPR3ZXc0I0NG9rMUdxRnUwWGsyRzRBYkJPLzMyUVgwNTJCWmZva1ZJRE1u?=
 =?utf-8?B?WW5qdi9ZcTN5YVZpbmJQR2pXdm42MlFZdVNVWnFYNWlZZ1ZIbGV3R0lSZEFu?=
 =?utf-8?B?ekMxOU5yK0JYSlU1SlhxbmptQWdQendHaHBtYStTMGQ1cmNRVEVMbWR6TWZr?=
 =?utf-8?B?dXFGSkFIZXV5TzBpcmtHMU1vUDJjallDbUVNVW1GUFBVLy9hWUh6cG03U1Q3?=
 =?utf-8?B?NGhDaUo4OWVMUHk1eXFqZmFEVlF5TkY4bFQ3Z2dJSzNMek8raUlXNzI4VERx?=
 =?utf-8?B?Mk9LVnVmUm45Q2psSkw3QVlFTEdNWGkyNzJjWHhGWmhvc2wybm1iNkhBeno1?=
 =?utf-8?B?d3ExL1Jrd0dYSGZ1QmVvQisyVUoyT3RYN0lZcXhQWi90cHowZ3VPWDdXelVJ?=
 =?utf-8?B?NG5CQUp1TCt4dzUrbVNML2hGZXBmVEVhMTEyeWQ5QnhZTmdIMXhvMnR4Qkww?=
 =?utf-8?B?akxiWGpqTFp1bTBNUWlwRkVBcWhRa3dnNSswSmpvRjBRNzFKMnJ6WkJhU01r?=
 =?utf-8?B?REM5clMrZVIxcHVoN1I0My9jVXBVVU5GVVNxVEZiR1ZGRGVyZ3ZRZ2NUTXVx?=
 =?utf-8?B?bG10TVZwMVlqb0RFa3JPVUhkQ2IwWG5DV0xNUmJ5SjluY0hxblVzT3BqMyt6?=
 =?utf-8?B?Tnl5NG1LN2t2SFZ3Ni9XK29JQ0p2dVphNnB1Unk0MnJScm42WFFKcG9pUmV1?=
 =?utf-8?B?dUt1a2dNdmZGTjQ4Q3RUaldGZHhNWEV3Vk9CSmZhbE5lUkJpaDN0WjRWcWN3?=
 =?utf-8?B?b1BUcVhCOE45TGFndngyVyt4ZW5SaGIrWTQ2aGNPZnBWS1N5YkZjYzI5NFBU?=
 =?utf-8?B?K1dnQzVtZFhrZU1IYmJPTFRsWjJQSEVxdHpWRkhoSzd6amduMXJhYlB6M2E4?=
 =?utf-8?B?b215UXB0MkZray9sRTl3ejk1bUJOQ3hrK29Od2hmWTBLaGtQKzlWY0RkLzMx?=
 =?utf-8?B?SGRNdHJiOE4waEtFVGhKbTIvNGY3M3pSVzV1MmNIZ3kzMU5oMHVJUmxwUFlu?=
 =?utf-8?Q?nEbEpMUMPZVuhnRHdkBKdGG0BXm?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd1a71-0e84-4a5f-4568-08d8c4307901
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 08:32:53.9726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgjVhkBNYh+b+sgVVM5uFoiVQ/7aD8zc7rEquyRGpvlzJcXNIkUMoy2Deio54gW6QcFVoQqljo37ywUrfqpw2pqDCzK/HXH+hHQyLl6IydM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB5308
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtoZW0gUmFqIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMSAwMjoxNg0KPiBUbzogVG9tIEhvY2hzdGVp
biA8dG9tLmhvY2hzdGVpbkBueHAuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBbUkZDXSBvcGVuc3NsOiBFbmFibGUgY3J5cHRvZGV2LWxp
bnV4IGJ5DQo+IGRlZmF1bHQNCj4gDQo+IA0KPiANCj4gT24gMS8yOC8yMSAxOjM1IFBNLCBUb20g
SG9jaHN0ZWluIHdyb3RlOg0KPiA+IFRoaXMgaXMgYSBSZXF1ZXN0IGZvciBDb21tZW50LiBXb3Vs
ZCBpdCBiZSBhIGdvb2QgaWRlYSB0byBlbmFibGUNCj4gY3J5cHRvZGV2LWxpbnV4DQo+ID4gYnkg
ZGVmYXVsdCwgZ2FpbmluZyBoYXJkd2FyZSBhY2NlbGVyYXRpb24gd2hlcmUgc3VwcG9ydGVkPyBB
cmUgdGhlcmUgYW55DQo+ID4gdW5hY2NlcHRhYmxlIGRyYXdiYWNrcz8gV2hhdCBoYXBwZW5zIG9u
IGhhcmR3YXJlIHdpdGhvdXQNCj4gYWNjZWxlcmF0aW9uPw0KPiA+DQo+IA0KPiB0aGlzIHBlcmhh
cHMgaGVscHMgd2l0aCBkZXZpY2VzIHRoYXQgaW5jbHVkZSBhIGhhcmR3YXJlIGNyeXB0byBkZXZp
Y2UNCj4gYnV0IG5vdCBhcyBtdWNoIHdpdGggb25lO3MgdGhhdHMgZmluZSBidXQgd2UgdXNlIHFl
bXUgbWFjaGluZXMgcXVpdGUgYQ0KPiBiaXQgaW4gdGVzdGluZyBzbyBpdCB3b3VsZCBiZSBnb29k
IHRvIGdldCBhIHJlYWRvdXQgb24gcWVtdSBzZWNvbmRseSwgaWYNCj4gaXQgZG9lcyBub3QsIHRo
ZW4gbWF5YmUgd2Ugc2hvdWxkIHNlZSBpZiBkZWZpbmluZyBpdCB2aWENCj4gTUFDSElORV9GRUFU
VVJFcyBtaWdodCBiZSBhbiBvcHRpb24gdG8gZW5hYmxlIGl0Lg0KPiANCg0KSSB0aGluayB0aGF0
IG1ha2luZyBpdCBhIE1BQ0hJTkVfRkVBVFVSRVMgd291bGQgZWZmZWN0aXZlbHkgbWFrZSB0aGUg
dGFzayBzaWduYXR1cmVzIGZvciBvcGVuc3NsIGJlIG1hY2hpbmUgZGVwZW5kZW50IGFuZCB0aGF0
IHdvdWxkIGFsc28gbWFrZSBhbGwgcmVjaXBlcyB3aGljaCBkZXBlbmQgZGlyZWN0bHkgb3IgaW5k
aXJlY3RseSBvbiBvcGVuc3NsIChhbmQgdGhlcmUgYXJlIGEgbG90ISkgaGF2ZSB0aGVpciB0YXNr
IHNpZ25hdHVyZXMgYmUgbWFjaGluZSBkZXBlbmRlbnQsIHNvIHRoZXkgd291bGQgbmVlZCB0byBo
YXZlIHRoZWlyIFBBQ0tBR0VfQVJDSCBzZXQgdG8gTUFDSElORV9BUkNIIHRvIGF2b2lkIHRyaWdn
ZXJpbmcgc3B1cmlvdXMgcmVidWlsZHMgd2hlbiBzd2l0Y2hpbmcgYmV0d2VlbiBtYWNoaW5lcyB3
aXRoIGFuZCB3aXRob3V0IGNyeXB0b2Rldi1saW51eCBpbiBNQUNISU5FX0ZFQVRVUkVTLg0KDQpT
byBNQUNISU5FX0ZFQVRVUkVTIGRvZXMgbm90IGxvb2sgbGlrZSBhIHZpYWJsZSBvcHRpb24sIGEg
RElTVFJPX0ZFQVRVUkVTIG1pZ2h0IGJlLCBhbHRob3VnaCBpdCBkb2VzIG5vdCByZWFsbHkgbG9v
ayBsaWtlIGEgbmljZSBmaXQgZWl0aGVyLg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogVG9tIEhvY2hz
dGVpbiA8dG9tLmhvY2hzdGVpbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFpLmJiIHwgMiArLQ0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFp
LmJiDQo+IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFp
LmJiDQo+ID4gaW5kZXggNTYxN2YzMzdlMC4uZDRjMTlmMWE1MiAxMDA2NDQNCj4gPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWkuYmINCj4gPiAr
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWkuYmIN
Cj4gPiBAQCAtMjgsNyArMjgsNyBAQCBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZThiZTZhMzVm
ZTQxZDEwNjAzYzNjYzYzNWU5MzI4OWVkMDBiZjM0Yjc5NjcxYTNhNGRlNjRmY2VlMA0KPiA+ICAg
aW5oZXJpdCBsaWJfcGFja2FnZSBtdWx0aWxpYl9oZWFkZXIgbXVsdGlsaWJfc2NyaXB0IHB0ZXN0
DQo+ID4gICBNVUxUSUxJQl9TQ1JJUFRTID0gIiR7UE59LWJpbjoke2JpbmRpcn0vY19yZWhhc2gi
DQo+ID4NCj4gPiAtUEFDS0FHRUNPTkZJRyA/PSAiIg0KPiA+ICtQQUNLQUdFQ09ORklHID89ICJj
cnlwdG9kZXYtbGludXgiDQo+ID4gICBQQUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZSA9ICIiDQo+
ID4gICBQQUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZXNkayA9ICIiDQo+ID4NCj4gPg0KPiA+DQo+
ID4NCj4gPg0KPiA+DQoNCi0tIA0KRGllZ28gU2FudGEgQ3J1eiwgUGhEDQpUZWNobm9sb2d5IEFy
Y2hpdGVjdA0Kc3BpbmV0aXguY29tDQoNCiANCg==
