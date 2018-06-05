Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5020276008
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AAEEE183C4;
	Tue,  5 Jun 2018 14:02:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xjLD6IdcnQFF; Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CA944183CA;
	Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A12B91E0A5;
	Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 958401E0A3;
	Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 89C8528B1;
	Tue,  5 Jun 2018 14:02:49 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 14:02:49 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 14:02:49 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 5 Jun 2018 14:02:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Hong Liu
	<hongl.fnst@cn.fujitsu.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] [PATCH] wpa-supplicant: fix the bug for
	PATCHTOOL	= "patch"
Thread-Index: AQHT/KTo4deBsy5A4Uyk80BVEVcrY6RRdqCg///kk4CAADTtwA==
Date: Tue, 5 Jun 2018 12:02:49 +0000
Message-ID: <08c6191704e7455393ec9fdfca2febf9@XBOX02.axis.com>
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
	<20180605081056.16610-3-hongl.fnst@cn.fujitsu.com>
	<ed003177b59644fe9b7f33975d3758c8@XBOX02.axis.com>
	<81d3651d034a8ce411302c67f5718a84797e16c9.camel@linuxfoundation.org>
In-Reply-To: <81d3651d034a8ce411302c67f5718a84797e16c9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] [PATCH] wpa-supplicant: fix the bug for PATCHTOOL	= "patch"
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
X-List-Received-Date: Tue, 05 Jun 2018 12:02:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiA1IGp1
bmkgMjAxOCAxMjo1MA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyBIb25nIExpdQ0KPiA8aG9uZ2wuZm5zdEBjbi5mdWppdHN1LmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIFtQQVRDSF0gd3BhLXN1cHBsaWNhbnQ6IGZpeCB0aGUgYnVnIGZvcg0K
PiBQQVRDSFRPT0wgPSAicGF0Y2giDQo+IA0KPiBPbiBUdWUsIDIwMTgtMDYtMDUgYXQgMTA6NDMg
KzAwMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFttYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0Bs
aXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYNCj4gPiA+IE9mDQo+ID4gPiBIb25nIExp
dQ0KPiA+ID4gU2VudDogZGVuIDUganVuaSAyMDE4IDEwOjExDQo+ID4gPiBUbzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogW09FLWNvcmVd
IFtQQVRDSF0gW1BBVENIXSB3cGEtc3VwcGxpY2FudDogZml4IHRoZSBidWcgZm9yDQo+ID4gPiBQ
QVRDSFRPT0wgPSAicGF0Y2giDQo+ID4gPg0KPiA+ID4gV2hlbiBzd2l0Y2ggUEFUQ0hUT09MIHRv
IHBhdGNoLCBhcHBseWluZyAna2V5LXJlcGxheS1jdmUtDQo+ID4gPiBtdWx0aXBsZS5wYXRjaCcg
ZmFpbGVkOg0KPiA+ID4NCj4gPiA+IGNoZWNraW5nIGZpbGUgc3JjL2FwL2llZWU4MDJfMTEuYw0K
PiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvYXAvd3BhX2F1dGguYw0KPiA+ID4gY2hlY2tpbmcgZmls
ZSBzcmMvYXAvd3BhX2F1dGguaA0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvYXAvd3BhX2F1dGhf
ZnQuYw0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvYXAvd3BhX2F1dGhfaS5oDQo+ID4gPiBjaGVj
a2luZyBmaWxlIHNyYy9jb21tb24vd3BhX2NvbW1vbi5oDQo+ID4gPiBjaGVja2luZyBmaWxlIHNy
Yy9yc25fc3VwcC93cGEuYw0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvcnNuX3N1cHAvd3BhX2ku
aA0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvcnNuX3N1cHAvd3BhLmMNCj4gPiA+IEh1bmsgIzEg
RkFJTEVEIGF0IDcwOS4NCj4gPiA+IEh1bmsgIzIgRkFJTEVEIGF0IDc1Ny4NCj4gPiA+IEh1bmsg
IzMgc3VjY2VlZGVkIGF0IDg0MCAob2Zmc2V0IC0xMiBsaW5lcykuDQo+ID4gPiBIdW5rICM0IEZB
SUxFRCBhdCA4NjguDQo+ID4gPiBIdW5rICM1IEZBSUxFRCBhdCA5MDAuDQo+ID4gPiBIdW5rICM2
IEZBSUxFRCBhdCA5MjQuDQo+ID4gPiBIdW5rICM3IHN1Y2NlZWRlZCBhdCAxNTM2IChvZmZzZXQg
LTM4IGxpbmVzKS4NCj4gPiA+IEh1bmsgIzggRkFJTEVEIGF0IDIzODYuDQo+ID4gPiBIdW5rICM5
IEZBSUxFRCBhdCAyOTIwLg0KPiA+ID4gSHVuayAjMTAgc3VjY2VlZGVkIGF0IDI5NDAgKG9mZnNl
dCAtNDYgbGluZXMpLg0KPiA+ID4gSHVuayAjMTEgRkFJTEVEIGF0IDI5OTguDQo+ID4gPiA4IG91
dCBvZiAxMSBodW5rcyBGQUlMRUQNCj4gPiA+IGNoZWNraW5nIGZpbGUgc3JjL3Jzbl9zdXBwL3dw
YV9pLmgNCj4gPiA+IEh1bmsgIzEgRkFJTEVEIGF0IDMyLg0KPiA+ID4gMSBvdXQgb2YgMSBodW5r
IEZBSUxFRA0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvY29tbW9uL3dwYV9jb21tb24uaA0KPiA+
ID4gSHVuayAjMSBzdWNjZWVkZWQgYXQgMjE1IHdpdGggZnV6eiAxLg0KPiA+ID4gY2hlY2tpbmcg
ZmlsZSBzcmMvcnNuX3N1cHAvd3BhLmMNCj4gPiA+IGNoZWNraW5nIGZpbGUgc3JjL3Jzbl9zdXBw
L3dwYV9pLmgNCj4gPiA+IGNoZWNraW5nIGZpbGUgc3JjL2FwL3dwYV9hdXRoLmMNCj4gPiA+IEh1
bmsgIzEgc3VjY2VlZGVkIGF0IDE4OTggKG9mZnNldCAtMyBsaW5lcykuDQo+ID4gPiBIdW5rICMy
IHN1Y2NlZWRlZCBhdCAyNDcwIChvZmZzZXQgLTMgbGluZXMpLg0KPiA+ID4gY2hlY2tpbmcgZmls
ZSBzcmMvcnNuX3N1cHAvdGRscy5jDQo+ID4gPiBjaGVja2luZyBmaWxlIHdwYV9zdXBwbGljYW50
L3dubV9zdGEuYw0KPiA+ID4gY2hlY2tpbmcgZmlsZSBzcmMvcnNuX3N1cHAvd3BhLmMNCj4gPiA+
IEh1bmsgIzEgc3VjY2VlZGVkIGF0IDIzNzggKG9mZnNldCAtNjIgbGluZXMpLg0KPiA+ID4gY2hl
Y2tpbmcgZmlsZSBzcmMvcnNuX3N1cHAvd3BhX2Z0LmMNCj4gPiA+IGNoZWNraW5nIGZpbGUgc3Jj
L3Jzbl9zdXBwL3dwYV9pLmgNCj4gPiA+IEh1bmsgIzEgc3VjY2VlZGVkIGF0IDEyMyAob2Zmc2V0
IC01IGxpbmVzKS4NCj4gPiA+DQo+ID4gPiBTbyBzcGxpdCB0aGUgd3BhLXN1cHBsaWNhbnQva2V5
LXJlcGxheS1jdmUtbXVsdGlwbGUgdG8gOCBwYXRjaGVzLg0KPiA+DQo+ID4gV2h5IGRvZXMgaXQg
bmVlZCB0byBiZSBzcGxpdCBpbnRvIGVpZ2h0IHNlcGFyYXRlIHBhdGNoZXM/IElzbid0IGl0DQo+
ID4ganVzdCBhIGNhc2Ugb2YgaGF2aW5nIHRvIHJlZ2VuZXJhdGUgdGhlIHBhdGNoIHNvIHRoYXQg
dGhlIGh1bmsNCj4gPiBjb250ZXh0cyBtYXRjaCB0aGUgY3VycmVudCBjb2RlPw0KPiANCj4gWW91
J3JlIHRlY2huaWNhbGx5IHJpZ2h0IGJ1dCBJIHRoaW5rIHNlcGFyYXRlIHBhdGNoZXMgbWF5IGJl
IGEgbG90DQo+IGNsZWFyZXIuLi4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KSSBz
aG91bGQgcHJvYmFibHkgaGF2ZSBsb29rZWQgYXQgdGhlIHBhdGNoZXMgYW5kIG5vdCBqdXN0IHRo
ZSBuZXcgDQpmaWxlIG5hbWVzLiBJIGp1c3QgYXNzdW1lZCB0aGUgb3JpZ2luYWwgcGF0Y2ggd2Fz
IHNwbGl0IGFsb25nIHRoZSANCmZpbGUgYm9yZGVycywgYnV0IEkgbm93IHNlZSB0aGF0IGl0IHdh
cyBhY3R1YWxseSBzcGxpdCBhY2NvcmRpbmcgdG8gDQpmdW5jdGlvbmFsaXR5LiBIb3dldmVyLCBp
dCBtaWdodCBiZSBhbiBpZGVhIHRvIGxldCBnaXQgZm9ybWF0LXBhdGNoIA0KcmVnZW5lcmF0ZSB0
aGUgZmlsZSBuYW1lcyB0byBiZXR0ZXIgaW5kaWNhdGUgdGhlaXIgY29udGVudHMuDQoNCi8vUGV0
ZXINCg0K

