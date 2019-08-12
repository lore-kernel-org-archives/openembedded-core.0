Return-Path: <jacob.kroon@mikrodidakt.se>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130094.outbound.protection.outlook.com [40.107.13.94])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC6A7E686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 15:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iK/R/5SaLTe1SauV1Vxi+Lmh6sUvhvu2hcJLQpY1N08gQKQQ+YAyzTmxfwEcU7T3LxTlbjCLtKOhZFs9suoTa75EAdfzUA3UveeQCg6Y2iCUVcutYXUO3kb22B2SVCg5gv/aUyONS9PRhkK2HxAwQxdLAgUvYlW+C8x9Gfa4Eg4XozTLYoDohfE8Iub4vJbhSNo6kTscwrgY/mvUWYe3nhxDg/tWO3tQqUsrOUGQuwg7rrDrSZqYAG4G9wZnPFPFm73aluPUX1ybT+SasTJyTfn1RpSEHEoMLrjPSCn3dT3/KliiaX3+9DnvVD3PXfbsVaoB6x/VFQVTGPJarT+slg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6HKtrkZTFk6Q3RXkfoox3bSR8yAtGwdkovUZ1V/eaKo=;
	b=JDlyus3XPcp4x1yMpsQkHfhgA1G2SdkLxDr2RENxCzx/kT6G3VuW6TDaiY3lBEhjZBot765QC8UTnn2cfqEDVcFYJDaZ47haYWYuN8clL38xFCoI/Nrx5GbcTPngWcTUhJq6LI3DGK6Ms0Iyq4q3wz3Lzp6y62pEDJU/neeEq8V/bEh5MknvHWEWw/oo72vBSCA1AFYE5G3WDyLY85/V0kGxDxuM7RLHpWKgcbx9UFtKKCxV1OUtc6iO/uFw9AToxGHJy9jOVibAxxWaCS/VI+OvvY0qdq5UWmzBV/28RcGFQcIoc/BweNQhvWlbgBCeWT/MWwHPSrJzk2rYZn0wsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=mikrodidakt.se; dmarc=pass action=none
	header.from=mikrodidakt.se; dkim=pass header.d=mikrodidakt.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ugglorna.onmicrosoft.com; s=selector1-ugglorna-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6HKtrkZTFk6Q3RXkfoox3bSR8yAtGwdkovUZ1V/eaKo=;
	b=X07R6YNDP9qE1JpWn54JSg1vpueEuoDNMbTqxdtO9ix/HnTdVtmcI5hfiqWzx9+9L1HEdICnsqilZTbyiOhwXViUNBoZBjP531ASW4X8nSLtSmP9zFn7+HwggoEP67KxV3NKUSNlCE0QqMc+OhFUWjTGQnGxg0cwgfOpnb3zGNM=
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com (52.135.166.20) by
	AM6PR08MB4770.eurprd08.prod.outlook.com (10.255.97.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Mon, 12 Aug 2019 15:52:02 +0000
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a]) by
	AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a%7]) with mapi id 15.20.2157.022;
	Mon, 12 Aug 2019 15:52:02 +0000
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Hash Equivalency - What this means for developer
	productivity
Thread-Index: AQHVTdKapSgrbrt2jUeib40UtAspIabx4fEAgAXI0YCAAAVZAA==
Date: Mon, 12 Aug 2019 15:52:02 +0000
Message-ID: <29a31200-7ca3-8c7a-24ce-6f1ed6a8490b@mikrodidakt.se>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
	<1ffd556dac8fdc3fad8db8391b2b5a5f232d7331.camel@linuxfoundation.org>
	<57ae67cb61919ab6416b555fdd8a3ef323737721.camel@linuxfoundation.org>
In-Reply-To: <57ae67cb61919ab6416b555fdd8a3ef323737721.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0247.eurprd05.prod.outlook.com
	(2603:10a6:3:fb::23) To AM6PR08MB3205.eurprd08.prod.outlook.com
	(2603:10a6:209:4a::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jacob.kroon@mikrodidakt.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.247.29.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8288c1f-d0af-44df-5b08-08d71f3d0441
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR08MB4770; 
x-ms-traffictypediagnostic: AM6PR08MB4770:
x-microsoft-antispam-prvs: <AM6PR08MB4770DC73AE20E3EF5E915F7B9BD30@AM6PR08MB4770.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39830400003)(366004)(396003)(376002)(189003)(199004)(508600001)(8936002)(8676002)(305945005)(53546011)(6506007)(102836004)(386003)(7736002)(66446008)(52116002)(81156014)(81166006)(64756008)(66476007)(76176011)(66946007)(66556008)(6512007)(256004)(14444005)(4326008)(6246003)(6116002)(53936002)(25786009)(3846002)(86362001)(110136005)(2906002)(14454004)(99286004)(316002)(486006)(44832011)(6436002)(36756003)(229853002)(5660300002)(31686004)(11346002)(446003)(66066001)(66574012)(2616005)(476003)(71200400001)(71190400001)(26005)(31696002)(6486002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4770;
	H:AM6PR08MB3205.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mikrodidakt.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gd/EsUK5qX1GAmObdRBWAtaq+1bjr+51ju/gkx8ZJrI6I6tJ08JvajVYceouF3qHf5UtUSbuFeq8TeQPX0/Fk+x9qK9bCBuaJKOG9ByDksQTCndkfh01nvlxFGwWBIY8aejidz4J0opVIvurFqJh4LN1bWp7fUINL1PTX2hyZO6e/wMbqF1pqP59VukCicyBcXY2whXuuGJ2CwRsVEEuAAFySP5piC7MWwL7i3YE82O0KPjFibyKXfZZWeHq9PLhY9vlXknz62DxlhC6pPvCiMAGqAeyfhAEQoZbNxk9P//vKqBCq89hCZ2M6MxySNc26JP+Ua/XahSW4JpfzAW2hSJX3IxsfL74G1hQ3aOvu5/gXflmQtJc7ovDr+8NsLOUP26w96fjLEByHCtO4IP6P8YTbg6Qs3GLsXl9nZIdHaM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: mikrodidakt.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d8288c1f-d0af-44df-5b08-08d71f3d0441
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 15:52:02.2711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d8b8e37-ad11-4b86-9071-4e3fa1b980be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJwRZ7EocS4gT/CoLFhppCtgSZ5d6t0SkEEtAAlqAOT7YDz4zlsp42Vu5/crYiBqZPB9A5khWfowCDJg7UYZTi9Or0E3XX0CMpd+/uxNvKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4770
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Aug 2019 15:52:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7711908672433744A2FD3705AF16076E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gOC8xMi8xOSA1OjMyIFBNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24gRnJpLCAyMDE5
LTA4LTA5IGF0IDAwOjEyICswMTAwLCByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
DQo+IHdyb3RlOg0KPj4gSSd2ZSBqdXN0IHNlZW4gdGhpcyB3aXRoIGRuZiBvbiB0aGUgYXV0b2J1
aWxkZXJzIGFuZCBhbiBycG0gYnVpbGQuDQo+PiBUaGUgbW9zdCBpbnRlcmVzdGluZyBiaXQgd2Fz
Og0KPj4NCj4+IFtwb2t5YnVpbGRAY2VudG9zNy10eS0xIHRlbXBdJCBwd2QNCj4+IC9ob21lL3Bv
a3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni0NCj4+IGxzYi9idWlsZC9idWlsZC90bXAv
d29yay9jb3JlMi0zMi1wb2t5LWxpbnV4L2RuZi80LjIuMi1yMC90ZW1wDQo+PiBbcG9reWJ1aWxk
QGNlbnRvczctdHktMSB0ZW1wXSQgY2F0IGxvZy50YXNrX29yZGVyDQo+PiBkb19wb3B1bGF0ZV9s
aWNfc2V0c2NlbmUgKDE5MTc0KTogbG9nLmRvX3BvcHVsYXRlX2xpY19zZXRzY2VuZS4xOTE3NA0K
Pj4gZG9fZmV0Y2ggKDg5NzIyKTogbG9nLmRvX2ZldGNoLjg5NzIyDQo+PiBkb191bnBhY2sgKDkz
NTAzKTogbG9nLmRvX3VucGFjay45MzUwMw0KPj4gZG9fcGF0Y2ggKDk3Njk2KTogbG9nLmRvX3Bh
dGNoLjk3Njk2DQo+PiBkb19nZW5lcmF0ZV90b29sY2hhaW5fZmlsZSAoMTE0NzU0KToNCj4+IGxv
Zy5kb19nZW5lcmF0ZV90b29sY2hhaW5fZmlsZS4xMTQ3NTQNCj4+IGRvX3BvcHVsYXRlX3N5c3Jv
b3Rfc2V0c2NlbmUgKDEwNzM2MSk6DQo+PiBsb2cuZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2Vu
ZS4xMDczNjENCj4+IGRvX3BhY2thZ2UgKDEwODQ0NCk6IGxvZy5kb19wYWNrYWdlLjEwODQ0NA0K
Pj4gZG9fcGFja2FnZWRhdGEgKDI4NzA5KTogbG9nLmRvX3BhY2thZ2VkYXRhLjI4NzA5DQo+PiBk
b19wYWNrYWdlX3FhICgyMTQxNSk6IGxvZy5kb19wYWNrYWdlX3FhLjIxNDE1DQo+PiBkb19wYWNr
YWdlX3dyaXRlX3JwbSAoMjE0MDApOiBsb2cuZG9fcGFja2FnZV93cml0ZV9ycG0uMjE0MDANCj4+
IGRvX3BhY2thZ2Vfd3JpdGVfZGViICg5NDA4NCk6IGxvZy5kb19wYWNrYWdlX3dyaXRlX2RlYi45
NDA4NA0KPj4gZG9fcGFja2FnZV93cml0ZV9pcGsgKDk0MDU5KTogbG9nLmRvX3BhY2thZ2Vfd3Jp
dGVfaXBrLjk0MDU5DQo+Pg0KPj4gaS5lLiBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lIGxl
dCBpdCBza2lwIGRvX2NvbmZpZ3VyZSwNCj4+IGRvX2NvbXBpbGUNCj4+IGFuZCBkb19pbnN0YWxs
IGFuZCBqdXN0IHJ1biBkb19wYWNrYWdlLiBXaGljaCBpcyB2ZXJ5IGNsZWFybHkgYmFkbHkNCj4+
IHdyb25nIQ0KPj4NCj4+IEknbGwgcG9rZSBpbnRvIHRoaXMgZnVydGhlciB0b21vcnJvdyBidXQg
SSBoYXZlIHNvbWUgaWRlYSBvZiBob3cgdGhpcw0KPj4NCj4+IG1pZ2h0IGhhcHBlbi4uLg0KPj4N
Cj4NCj4gVGhpcyB0dXJuZWQgb3V0IHRvIGJlIHdvcmxkcyBvZiBwYWluIGFuZCBJIGVuZGVkIHVw
IHJlZG9pbmcgdGhlIHdheQ0KPiBwYXJ0IG9mIHJ1bnF1ZXVlIHdvcmtzLCBmb3IgdGhlIGJldHRl
ciBhcyBpdCB0dXJucyBvdXQgYXMgdGhlIGNvZGUgaXMNCj4gbXVjaCBzaW1wbGVyLiBJdHMgZ2l2
ZW4gbWUgcXVpdGUgYSBoZWFkYWNoZSB0cnlpbmcgdG8gZGlndXJlIG91dCBob3cgaXQNCj4gd2Fz
IGJyZWFraW5nIGFuZCByZXByb2R1Y2luZyBpdC4NCj4NCj4gVGhlIG5ldyBjb2RlIGlzIGluIG1h
c3Rlci1uZXh0IGFuZCBJJ20gdHJ5aW5nIGl0IG9uIHRoZSBhdXRvYnVpbGRlci4gaXQNCj4gc2hv
dWxkbid0IGhhdmUgdGhlIGFib3ZlIHByb2JsZW0gYW55IG1vcmUsIHdoYXQgb3RoZXIgaXNzdWVz
IEkgbWF5IGhhdmUNCj4gYWRkZWQgcmVtYWlucyB0byBiZSBzZWVuIQ0KPg0KDQpUaGFuayB5b3Ug
Zm9yIGZpeGluZyENCi9KYWNvYg0KDQoNClttaWtyb2RpZGFrdF0NCkphY29iIEtyb29uIOKAoiAr
NDYgNDYzMjUwNDANCg0KbWlrcm9kaWRha3Quc2Ug4oCiIFNraWZmZXJ2w6RnZW4gNDgsIFNFLTIy
NCA3OCBMVU5ELCBTd2VkZW4NCg0KQ29uc3VsdGFucyBzaW5jZSAxOTgwIOKAoiBTVywgSFcsIEVt
YmVkZGVkIFN5c3RlbXMsIExpbnV4DQoNCg0K

