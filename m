Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E64472EA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0465B18434;
	Thu, 26 Jul 2018 17:07:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BB5cEeNqHrTt; Thu, 26 Jul 2018 17:07:42 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9F19E18418;
	Thu, 26 Jul 2018 17:07:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85F1A1A07C;
	Thu, 26 Jul 2018 17:07:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79CE21A070;
	Thu, 26 Jul 2018 17:07:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 26 Jul 2018 17:07:41 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 6EED11FC6;
	Thu, 26 Jul 2018 17:07:41 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 17:07:41 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 17:07:41 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 26 Jul 2018 17:07:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ricardo Salveti <rsalveti@rsalveti.net>
Thread-Topic: [OE-core] [PATCH 1/2] systemd: upgrade to 239
Thread-Index: AQHUHXIp1Bo6awZYuUKdWGWDOwqN/KSge6UAgABxFICAAI5GgIAABLqAgAAofiA=
Date: Thu, 26 Jul 2018 15:07:41 +0000
Message-ID: <6220ed829b804d49b167503234a07fb0@XBOX02.axis.com>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
	<105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
	<90a08929e5fe482b9cde1599fa2585a2@XBOX02.axis.com>
	<CAHYQr0rsGOVc-4d-9ntLA0STTcZR2g+E8gqy9kpak1FD0Y6ztw@mail.gmail.com>
In-Reply-To: <CAHYQr0rsGOVc-4d-9ntLA0STTcZR2g+E8gqy9kpak1FD0Y6ztw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 26 Jul 2018 15:07:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNhcmRvIFNhbHZldGkgPHJz
YWx2ZXRpQHJzYWx2ZXRpLm5ldD4NCj4gU2VudDogZGVuIDI2IGp1bGkgMjAxOCAxNjozNw0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENj
OiBDaGVuUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEv
Ml0gc3lzdGVtZDogdXBncmFkZSB0byAyMzkNCj4gDQo+IE9uIFRodSwgSnVsIDI2LCAyMDE4IGF0
IDk6MzAgQU0sIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMu
Y29tPiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVu
ZW1iZWRkZWQtDQo+ID4+IGNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBC
ZWhhbGYgT2YgQ2hlblFpDQo+ID4+IFNlbnQ6IGRlbiAyNiBqdWxpIDIwMTggMDc6NTENCj4gPj4g
VG86IFJpY2FyZG8gU2FsdmV0aSA8cnNhbHZldGlAcnNhbHZldGkubmV0Pg0KPiA+PiBDYzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCAxLzJdIHN5c3RlbWQ6IHVwZ3JhZGUgdG8gMjM5DQo+ID4+DQo+ID4+
IE9uIDA3LzI2LzIwMTggMDc6MDUgQU0sIFJpY2FyZG8gU2FsdmV0aSB3cm90ZToNCj4gPj4gPiBP
biBNb24sIEp1bCAxNiwgMjAxOCBhdCAxMTowNSBQTSwgQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2
ZXIuY29tPg0KPiB3cm90ZToNCj4gPj4gPj4gVXBncmFkZSBzeXN0ZW1kIHRvIDIzOS4NCj4gPg0K
PiA+IFtjdXRdDQo+ID4NCj4gPj4gPj4gMy4gdXBkYXRlLWFsdGVybmF0aXZlcyBjaGFuZ2VzDQo+
ID4+ID4+ICAgIFRoZSB1dGlsaXRpZXMgbGlrZSBzaHV0ZG93biwgcG93ZXJvZmYsIGV0Yy4gYXJl
IG5vdyBjcmVhdGVkIGFzDQo+IHN5bWxpbmtzDQo+ID4+ID4+ICAgIGF0IGRvX2luc3RhbGwuIFNv
IHRoZXJlJ3Mgbm8gbmVlZCB0byB1c2UgdXBkYXRlLWFsdGVybmF0aXZlcw0KPiBtZWNoYW5pc20N
Cj4gPj4gPj4gICAgYW55bW9yZSB0byBjcmVhdGUgdGhlIHN5bWxpbmtzIG5vdy4gSW4gYWRkdGlv
biwgSSBkb24ndCB0aGluaw0KPiB3ZT4gbm93DQo+ID4+ID4+ICAgIHN1cHBvcnQgbXVsdGlwbGUg
aW5pdCBzeXN0ZW1zIGF0IG9uZSBydW5uaW5nIHN5c3RlbSwgc28NCj4gdGhlcmUncyByZWFsbHkN
Cj4gPj4gPj4gICAgbm8gbmVlZCB0byB1c2UgdXBkYXRlLWFsdGVybmF0aXZlcyBtZWNoYW5pc20g
aGVyZS4NCj4gPj4gPg0KPiA+PiA+IEkgbm90aWNlZCB0aGF0IHJlYm9vdCBzdG9wcGVkIHdvcmtp
bmcgbG9jYWxseSBhcyBJIGhhZCBidXN5Ym94DQo+ID4+ID4gaW5zdGFsbGVkIHRvZ2V0aGVyIHdp
dGggc3lzdGVtZCwgYW5kIHRoZSBidXN5Ym94IHZlcnNpb24gZW5kZWQgdXANCj4gPj4gPiBiZWlu
ZyB1c2VkIGFzIGl0IHdhcyBwcm92aWRlZCB2aWEgdXBkYXRlLWFsdGVybmF0aXZlcy4NCj4gPj4g
Pg0KPiA+PiA+IExvb2tpbmcgZm9yIHBvc3NpYmxlIHNpbWlsYXIgYnJva2VuIGxpbmtzLCBJIGZv
dW5kIHRoYXQNCj4gPj4gPiB1cGRhdGUtYWx0ZXJuYXRpdmVzIGVuZGVkIHVwIHBvaW50aW5nIHJl
Ym9vdCwgaGFsdCBhbmQgcG93ZXJvZmYgdG8NCj4gdGhlDQo+ID4+ID4gYnVzeWJveCBiaW5hcnkg
aW5zdGVhZCBvZiBzeXN0ZW1jdGwuIFNob3VsZCB3ZSByZXZlcnQgdGhlIGNoYW5nZXMNCj4gYW5k
DQo+ID4+ID4gYnJpbmcgYmFjayB1cGRhdGUtYWx0ZXJuYXRpdmVzIGZvciB0aGVtPw0KPiA+PiA+
DQo+ID4+ID4gVGhhbmtzLA0KPiA+Pg0KPiA+PiBJIHRoaW5rIHRoZSBjb3JyZWN0IGRpcmVjdGlv
biB0byBmaXggdGhpcyBwcm9ibGVtIGlzIHRvIG1ha2UgYnVzeWJveA0KPiA+PiBvbmx5IHByb3Zp
ZGUgaW5pdCB1dGlsaXRpZXMgKHJlYm9vdCwgaGFsdCwgZXRjKSB3aGVuIGluaXQgbWFuYWdlciBp
cw0KPiA+PiBzZXQgdG8gYnVzeWJveC4NCj4gPj4NCj4gPj4gV2UgY3VycmVudCBoYXZlIGluIGJ1
c3lib3ggcmVjaXBlJ3MgU1JDX1VSSToNCj4gPj4gICAgICAgICAgICAgJHtAWyIiLA0KPiA+PiAi
ZmlsZTovL2luaXQuY2ZnIl1bKGQuZ2V0VmFyKCdWSVJUVUFMLVJVTlRJTUVfaW5pdF9tYW5hZ2Vy
JykgPT0NCj4gPj4gJ2J1c3lib3gnKV19IFwNCj4gPj4NCj4gPj4gSSB0aGluayB0aGUgaW5pdCB1
dGlsaXRpZXMgc2hvdWxkIGJlIG1vdmVkIHRvIGluaXQuY2ZnLg0KPiA+Pg0KPiA+PiBQbGVhc2Ug
Y2hlY2sgbXkgbG9naWMgdG8gc2VlIGlmIHlvdSBjYW4gYWdyZWUgd2l0aCBpdC4NCj4gPj4gV2Ug
aGF2ZSB0d28gZmFjdHMgaGVyZS4NCj4gPj4gMS4gSW5pdCB1dGlsaXRpZXMgKHJlYm9vdCwgaGFs
dCwgZXRjLikgYXJlIHRpZ2h0bHkgYm9uZCB0byB0aGUNCj4gc3BlY2lmaWMNCj4gPj4gaW1wbGVt
ZW50YXRpb24gb2YgUElEIDEuDQo+ID4+IDIuIFdlIG9ubHkgYWxsb3cgb25lIFBJRCAxIGluIG91
ciBpbWFnZS4gKFZJUlRVQUwtDQo+IFJVTlRJTUVfaW5pdF9tYW5hZ2VyKS4NCj4gPj4gU28gd2Ug
Y2FuIGNvbmNsdWRlIGZyb20gdGhlIGFib3ZlIHR3byBmYWN0cyB0aGF0IGl0IGRvZXMgbm90IG1h
a2UNCj4gbXVjaA0KPiA+PiBzZW5zZSB0byBoYXZlIG11bHRpcGxlIHByb3ZpZGVycyBvZiBpbml0
IHV0aWxpdGllcyB3aGlsZSB3ZSBvbmx5DQo+IGFsbG93DQo+ID4+IG9uZSBQSUQgMSBwcm92aWRl
ciBvbiBpbWFnZS4NCj4gPj4NCj4gPj4gQWZ0ZXIgYWxsLCB3ZSBhcmUgdXNpbmcgdXBkYXRlLSph
bHRlcm5hdGl2ZXMqLCB0aGluZ3MgdGhhdCB0aGlzDQo+ID4+IG1lY2hhbmlzbSBtYW5hZ2VzIGFy
ZSBzdXBwb3NlZCB0byBnZW5lcmFsbHkgc2VydmUgYXMgYWx0ZXJuYXRpdmVzIHRvDQo+ID4+IGVh
Y2ggb3RoZXIuDQo+ID4+DQo+ID4+IEJlc3QgUmVnYXJkcywNCj4gPj4gQ2hlbiBRaQ0KPiA+DQo+
ID4gRm9yIHdoYXQgaXQgaXMgd29ydGgsIHdlIGhhdmUgYSBwYWNrYWdlIHRoYXQgaW5zdGFsbHMg
d3JhcHBlcnMgZm9yDQo+IGluaXQgYW5kDQo+ID4gcmVib290LCB3aGljaCBpcyBub3cgY2F1c2lu
ZyBpbWFnZSBjcmVhdGlvbiB0byBmYWlsIGR1ZSB0byB0aGUgY2hhbmdlDQo+IHRvDQo+ID4gc3lz
dGVtZCBzaW5jZSBib3RoIHBhY2thZ2VzIG5vdyB0cnkgdG8gaW5zdGFsbCBpbml0IGFuZCByZWJv
b3QuIEkgY2FuDQo+IG9mDQo+ID4gY291cnNlIGFkZCBhIHN5c3RlbWRfJS5iYmFwcGVuZCB0byBy
ZW1vdmUgaW5pdCBhbmQgcmVib290LCBidXQgdGhhdA0KPiBtZWFucw0KPiA+IHRoZSBzeXN0ZW1k
IHBhY2thZ2UgaXMgYnJva2VuIHVubGVzcyB0aGUgcGFja2FnZSB3aXRoIHRoZSB3cmFwcGVycyBp
cw0KPiA+IGFsd2F5cyBpbnN0YWxsZWQuDQo+IA0KPiBDdXJpb3VzIHRvIHdoeSB5b3UgbmVlZCBz
dWNoIHdyYXBwZXJzLCBidXQgd2Fzbid0IGl0IGEgcHJvYmxlbSBiZWZvcmUNCg0KV2VsbCwgdG8g
YmUgaG9uZXN0LCBJIGRpZCBub3Qga25vdyB3ZSBoYWQgdGhvc2Ugd3JhcHBlcnMgdW50aWwgdGhl
IGltYWdlIA0KY3JlYXRpb24gYnJva2UgZHVlIHRvIHRoZSBjaGFuZ2UgdG8gdGhlIHN5c3RlbWQg
cmVjaXBlLiBJIGFtIG5vdCByZXNwb25zaWJsZSANCmZvciBvdXIgdXNlIG9mIHN5c3RlbWQsIHNv
IEkgaGF2ZSBubyBpZGVhIHdoeSB3ZSBoYXZlIHRob3NlIHdyYXBwZXJzLi4uDQoNCj4gZXZlbiB3
aGVuIHdlIGhhZCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGZvciBzdWNoIHV0aWxpdGllcyAoZS5nLg0K
PiB1cGRhdGUtYWx0ZXJuYXRpdmVzIGZhaWxpbmcgdG8gbGluayBpbml0L3JlYm9vdCBiZWNhdXNl
IG9mIHlvdXINCj4gd3JhcHBlcnMgd2hlbiBjcmVhdGluZyB0aGUgcm9vdGZzKT8NCg0KSSBoYXZl
IG5vdCBsb29rZWQgaW50byBpdCwgYnV0IGl0IHNlZW1zIHRoZSBpbnN0YWxsYXRpb24gb2YgdGhl
IHdyYXBwZXJzIA0Kc2lsZW50bHkgb3ZlcndyaXRlcyB0aGUgbGlua3MgY3JlYXRlZCBieSB1cGRh
dGUtYWx0ZXJuYXRpdmVzLg0KDQo+IENoZWVycywNCj4gLS0NCj4gUmljYXJkbyBTYWx2ZXRpIGRl
IEFyYXVqbw0KDQovL1BldGVyDQoNCg==

