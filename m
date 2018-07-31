Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56FED605C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 21:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5F7AA18464;
	Tue, 31 Jul 2018 23:17:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zGbZhyV39yL5; Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 31F811845F;
	Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18ECF1A07B;
	Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CA8D1A077;
	Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 005AF20C4;
	Tue, 31 Jul 2018 23:17:25 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 31 Jul 2018 23:17:24 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 31 Jul 2018 23:17:24 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 31 Jul 2018 23:17:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] defaultsetup.conf: Enable security flags+pie
	by default
Thread-Index: AQHUJfCOhQ+RahpOfU+Rw4NYHPI6wKSp2hPA
Date: Tue, 31 Jul 2018 21:17:24 +0000
Message-ID: <fd53f53f0589472397e5657990e9e5d8@XBOX02.axis.com>
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
	<CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
	<084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
	<CAMKF1srwY--+D5fyj-TF-PYjbkvBTTjCPv=mVtZMim6vYHy8pg@mail.gmail.com>
In-Reply-To: <CAMKF1srwY--+D5fyj-TF-PYjbkvBTTjCPv=mVtZMim6vYHy8pg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 31 Jul 2018 21:17:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMjcganVsaSAyMDE4IDIzOjI3DQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IENoZW5RaSA8
UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhl
DQo+IG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBkZWZhdWx0c2V0dXAuY29uZjog
RW5hYmxlIHNlY3VyaXR5DQo+IGZsYWdzK3BpZSBieSBkZWZhdWx0DQo+IA0KPiBPbiBGcmksIEp1
bCAyNywgMjAxOCBhdCAxOjQ5IFBNIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhag0KPiA+ID4gU2VudDogZGVuIDI0
IGp1bGkgMjAxOCAxNjoxMg0KPiA+ID4gVG86IENoZW5RaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KPiA+ID4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxh
eWVyIDxvcGVuZW1iZWRkZWQtDQo+ID4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+
ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZGVmYXVsdHNldHVwLmNvbmY6IEVu
YWJsZSBzZWN1cml0eQ0KPiA+ID4gZmxhZ3MrcGllIGJ5IGRlZmF1bHQNCj4gPiA+DQo+ID4gPiBP
biBUdWUsIEp1bCAyNCwgMjAxOCBhdCAxMjozMCBBTSBDaGVuUWkgPFFpLkNoZW5Ad2luZHJpdmVy
LmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIEtoZW0sDQo+ID4gPiA+DQo+ID4g
PiA+IFRoZSBjb21tZW50cyBpbiBzZWN1cml0eS1mbGFncy5pbmMgYWxzbyBuZWVkcyB0byBiZSBt
b2RpZmllZCB0bw0KPiA+ID4gcmVtb3ZlDQo+ID4gPiA+ICdwb2t5LWxzYicgaW5mby4NCj4gPiA+
ID4NCj4gPiA+ID4gSSdkIHN1Z2dlc3Qgd2Ugc3RpbGwgcHV0IGl0IGludG8gZGlzdHJvIGNvbmYg
ZmlsZSAocG9reS5jb25mKQ0KPiBpbnN0ZWFkDQo+ID4gPiBvZg0KPiA+ID4gPiBkZWZhdWx0c2V0
dXAuY29uZiwgYmVjYXVzZSBkZWZhdWx0c2V0dXAuY29uZiBpcyBpbmNsdWRlZCBieQ0KPiA+ID4g
PiBiaXRiYWtlLmNvbmYuIEkgdGhpbmsgdGhpbmdzIGluIGRlZmF1bHRzZXR1cC5jb25mIHNob3Vs
ZCBiZQ0KPiBuZWNlc3NhcnkNCj4gPiA+ID4gZGVmYXVsdCB2YWx1ZXMgdG8gYnVpbGQgdGhpbmdz
IG91dC4gSSBkb24ndCB0aGluayBzZWN1cml0eSBmbGFncw0KPiBpcw0KPiA+ID4gPiBuZWNlc3Nh
cnkgdG8gYnVpbGQgdGhpbmdzIG91dC4NCj4gPiA+DQo+ID4gPiB0aGlzIGlzIHRoZSBkZWZhdWx0
IHNldHVwLCBldmVuIG5vbi1wb2t5IHVzZXJzIHdpbGwgZ2V0IGNvbnNpc3RlbnQNCj4gPiA+IGV4
cGVyaWVuY2UuDQo+ID4NCj4gPiBJIGhhdmUgdG8gYWdyZWUgd2l0aCBDaGVuIGhlcmUuIEkgdGhp
bmsgcmVxdWlyaW5nIHNlY3VyaXR5X2ZsYWdzLmluYw0KPiBmcm9tDQo+ID4gZGVmYXVsdHNldHVw
LmNvbmYgaXMgdGhlIHdyb25nIHRoaW5nIHRvIGRvLiBXZSB1c2Ugc2VjdXJpdHlfZmxhZ3MuaW5j
DQo+IGluDQo+ID4gb3VyIHNldHVwLCBhbmQgSSBrbm93IGhvdyBtdWNoIHRyb3VibGUgaXQgaGFz
IGJyb3VnaHQuIFRvIG1lLCB1c2luZw0KPiBpdA0KPiA+IHNob3VsZCBiZSBhIGRpc3RybyBkZWNp
c2lvbiwgbm90IHNvbWV0aGluZyB0aGF0IGlzIGVuZm9yY2VkIGJ5IHRoZQ0KPiB1c2UNCj4gPiBv
ZiBiaXRiYWtlLg0KPiANCj4gVGhhdHMgZmluZSwgSSBjYW4gbW92ZSB0aGlzIHRvIHBva3kgZGlz
dHJvIHNldHRpbmdzLCB1c2luZyBpdCBieQ0KPiBkZWZhdWx0IHdvdWxkIGhhdmUNCj4gYmVlbiBp
biBzeW5jIGZvciBhbGwgc2luY2UgcmVmZXJlbmNlIGRpc3RybyBpcyB1c2luZyBpdCB3b3VsZCBi
ZQ0KPiBlYXNpZXIgZm9yIG90aGVycyB3aGVuDQo+IHN1Ym1pdHRpbmcgcGF0Y2hlcywgYXMgYSBw
aGFzZSAyIEkgd2FzIGFsc28gdGhpbmtpbmcgb2YgZGVmYXVsdGluZyB0bw0KPiBoYXJkZWluZyBp
biB0aGUgdG9vbGNoYWluIGl0c2VsZg0KPiBhbmQgcmVtb3ZlIHRoaXMgZmlsZSBjb21wbGV0ZWx5
IHRoYXQgd291bGQgaGF2ZSBtYWRlIGl0IG11Y2ggYmV0dGVyLA0KPiB0aGVuIGZvbGtzIHdobyBk
b250IHdhbnQgaGFyZGVpbmcgY291bGQganVzdCBkaXNhYmxlDQo+IGl0IGluIHRvb2xjaGFpbi4g
YnV0IEkgYW0gZmluZSB0byBsZWF2ZSBpdCBhIGRpc3RybyBkZWNpc2lvbiBmb3Igbm93Lg0KDQpJ
IGRvIG5vdCB0aGluayB0aGF0IHJlbHlpbmcgb24gdGhlIHRvb2xjaGFpbiB0byBoYW5kbGUgdGhp
cyBpcyB0aGUgDQpyaWdodCB0aGluZyB0byBkbywgZ2l2ZW4gdGhhdCBzb21lIG9mIHVzIHVzZSBl
eHRlcm5hbCB0b29sY2hhaW5zIGluIA0KYWRkaXRpb24gdG8gdGhlIHRvb2xjaGFpbiBmcm9tIE9F
LUNvcmUuLi4gV2l0aCB0aGUgY3VycmVudCBzZXR1cCB3ZSANCmdldCByb3VnaGx5IHRoZSBzYW1l
IGNvdmVyYWdlIHJlZ2FyZGxlc3Mgb2Ygd2hpY2ggdG9vbGNoYWluIHdlIHVzZS4NCg0KLy9QZXRl
cg0KDQo=

