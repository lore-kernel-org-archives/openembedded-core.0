Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 479 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Dec 2016 10:49:32 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA66606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5DB1518527;
	Fri,  2 Dec 2016 11:41:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Xyx1LZ6AW+nI; Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 67CC718346;
	Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5201F1E08B;
	Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 466781E08C;
	Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 3A683305;
	Fri,  2 Dec 2016 11:41:33 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 2 Dec 2016 11:41:33 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 2 Dec 2016 11:41:33 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 2 Dec 2016 11:41:32 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/2 V5] systemd: Upgrade to 232
Thread-Index: AQHSSb4hj1q4IDcZxUeXR0ao+wKtXqDy1SnQgABslwCAATON4A==
Date: Fri, 2 Dec 2016 10:41:32 +0000
Message-ID: <3b27f673ab1a42fe845122bb20761ec6@XBOX02.axis.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
	<6bd14a6cb6904f409632cae7f29ae287@XBOX02.axis.com>
	<CAMKF1sqaZiS4hQZxBHGiRnfPMOp3CTv5Gmh=WjZBWYDZAR9H-A@mail.gmail.com>
In-Reply-To: <CAMKF1sqaZiS4hQZxBHGiRnfPMOp3CTv5Gmh=WjZBWYDZAR9H-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Fri, 02 Dec 2016 10:49:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJh
ai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogZGVuIDEgZGVjZW1iZXIgMjAxNiAxNzo1MA0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvMiBWNV0gc3lz
dGVtZDogVXBncmFkZSB0byAyMzINCj4gDQo+IE9uIFRodSwgRGVjIDEsIDIwMTYgYXQgMToyOCBB
TSwgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdy
b3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gW21haWx0bzpv
cGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFs
Zg0KPiBPZg0KPiA+PiBLaGVtIFJhag0KPiA+PiBTZW50OiBkZW4gMjggbm92ZW1iZXIgMjAxNiAy
MjoyNg0KPiA+PiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+PiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIDIvMiBWNV0gc3lzdGVtZDogVXBncmFkZSB0
byAyMzINCj4gPj4NCj4gPj4gKiBEcm9wIHN1cHBvcnQgZm9yIHJjUy5kIFN5c1YgaW5pdCBzY3Jp
cHRzLg0KPiA+PiAgIFRoZXNlIGFyZSBwcm9uZSB0byBjYXVzZSBkZXBlbmRlbmN5IGxvb3BzLCBh
bmQgYWxtb3N0IGFsbCBwYWNrYWdlcw0KPiA+PiB3aXRoDQo+ID4+ICAgcmNTIHNjcmlwdHMgbm93
IHNoaXAgYSBuYXRpdmUgc3lzdGVtZCBzZXJ2aWNlLg0KPiA+Pg0KPiA+PiAqIERyb3AgbW91bnQg
cHJvcGFnYXRpb24gcGF0Y2gsIGl0IG9ubHkgaGFwcGVucyB3aXRoIGxpYnNlY2NvbXAsIE9FDQo+
ID4+IGRvZXNudA0KPiA+PiAgIGVuYWJsZSBpdA0KPiA+Pg0KPiA+PiAqIGtkYnVzIG9wdGlvbiBo
YXMgZGlzYXBwZWFyZWQgZnJvbSBjb25maWd1cmUNCj4gPj4NCj4gPj4gKiBJZ25vcmUgZGV2LXNv
IGZvciBQTiBub3cgc2luY2Ugc3lzdGVtZCBpbnRyb2R1Y2VkIHByaXZhdGUgLnNvIHNlZQ0KPiA+
PiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzM4MTANCj4gPg0K
PiA+IFJhdGhlciB0aGFuIGFkZGluZzoNCj4gPg0KPiA+IElOU0FORV9TS0lQXyR7UE59ICs9ICJk
ZXYtc28iDQo+ID4NCj4gPiB3b3VsZCBpdCBub3QgYmUgbW9yZSBhcHByb3ByaWF0ZSB0byBhZGQN
Cj4gPiAke3N5c3RlbWRfdW5pdGRpcn0vbGlic3lzdGVtZC1zaGFyZWQuc28gdG8gRklMRVNfJHtQ
Tn0tZGV2LCBpLmUuOg0KPiA+DQo+ID4gLUZJTEVTXyR7UE59LWRldiArPSAiJHtiYXNlX2xpYmRp
cn0vc2VjdXJpdHkvKi5sYSAke2RhdGFkaXJ9L2RidXMtDQo+IDEvaW50ZXJmYWNlcy8gJHtzeXNj
b25mZGlyfS9ycG0vbWFjcm9zLnN5c3RlbWQiDQo+ID4gK0ZJTEVTXyR7UE59LWRldiArPSAiJHti
YXNlX2xpYmRpcn0vc2VjdXJpdHkvKi5sYSAke2RhdGFkaXJ9L2RidXMtDQo+IDEvaW50ZXJmYWNl
cy8gJHtzeXNjb25mZGlyfS9ycG0vbWFjcm9zLnN5c3RlbWQNCj4gJHtzeXN0ZW1kX3VuaXRkaXJ9
L2xpYnN5c3RlbWQtc2hhcmVkLnNvIg0KPiA+DQo+ID4gVGhlIGJpbmFyaWVzIGFyZSBsaW5rZWQg
d2l0aCBsaWJzeXN0ZW1kLXNoYXJlZC0yMzIuc28gd2hpY2ggZW5kcyB1cA0KPiA+IGluICR7UE59
IGFzIHVzdWFsLg0KPiANCj4gQXMgbWVudGlvbmVkIHRoaXMgaXMgbm90IGEgdHlwaWNhbCAuc28g
d2hpY2ggaXMgYSBzeW1saW5rIGFuZCBjYW4gYmUNCj4gc2hvdmVkIGludG8gLWRldiBwYWNrYWdl
IGlmIHdlIGRvIHRoYXQsIHRoZW4gd2UgaGF2ZSB0byBpbmNsdWRlIC1kZXYgDQo+IHBhY2thZ2Ug
aW50byBldmVyeSBpbWFnZSBjb250YWluaW5nIHN5c3RlbWQuDQoNCkFjdHVhbGx5LCBJIHRoaW5r
IGl0IF9pc18gd29ya2luZyBsaWtlIGEgdHlwaWNhbCAuc28uIEl0IF9pc18gYSBzeW1saW5rIA0K
YW5kIHRoZSBhcHBsaWNhdGlvbnMgYXJlIGxpbmtlZCB3aXRoIGxpYnN5c3RlbWQtc2hhcmVkLTIz
Mi5zbywgbm90IA0KbGlic3lzdGVtZC1zaGFyZWQuc28sIGp1c3QgbGlrZSBvdGhlciBsaWJyYXJp
ZXMgaW4gL2xpYiBhbmQgL3Vzci9saWIuIA0KU28gQUZBSUNULCBpdCB3b3JrcyBqdXN0IGxpa2Ug
YWxsIHRoZSBvdGhlciAuc28gZmlsZXMgdGhhdCBlbmQgdXAgaW4gDQotZGV2Lg0KDQpJIGhhdmUg
dmVyaWZpZWQgdGhhdCBidWlsZGluZyB3aXRoICR7c3lzdGVtZF91bml0ZGlyfS9saWJzeXN0ZW1k
LXNoYXJlZC5zbyANCmFkZGVkIHRvIEZJTEVTXyR7UE59LWRldiB3b3JrcyBhcyBleHBlY3RlZCwg
d2l0aG91dCBhZGRpbmcgYW55IA0KZGVwZW5kZW5jaWVzIG9uIHN5c3RlbWQtZGV2IHRoYXQgc2hv
dWxkIG5vdCBiZSB0aGVyZS4NCg0KVGhlIG9ubHkgZGlmZmVyZW5jZSBjb21wYXJlZCB0byBvdGhl
ciBsaWJyYXJpZXMgaW4gL2xpYiBhbmQgL3Vzci9saWIgaXMgDQp0aGF0IGxpYnN5c3RlbWQtc2hh
cmVkLTIzMi5zbyByZW1haW5zIHBhY2thZ2VkIGluIHRoZSBzeXN0ZW1kIHBhY2thZ2UgDQpyYXRo
ZXIgdGhhbiBpbiBhIHNlcGFyYXRlIGxpYiBwYWNrYWdlLCB3aGljaCBJIGJlbGlldmUgaXMgdGhl
IHdheSB3ZSANCndhbnQgaXQgdG8gYmUgc2luY2UgaXQgaXMgYSBzeXN0ZW1kIGludGVybmFsIGxp
YnJhcnkuDQoNCj4gPj4gKiBBZGQgbGlibnNzKiB0byBQQUNLQUdFU19EWU5BTUlDIGZvciBsaWJu
c3MtcmVzb2x2ZSB0byB3b3JrDQo+IGNvcnJlY3RseQ0KPiA+Pg0KPiA+PiAqIEZvcndhcmQgcG9y
dCBzeXN0ZW1kLWJvb3QgcGF0Y2hlcyB0byBzeXN0ZW1kLTIzMg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+DQo+ID4gLy9QZXRlcg0K
DQovL1BldGVyDQoNCg0K

