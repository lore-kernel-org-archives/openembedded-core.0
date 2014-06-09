Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 380B760E23
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 11:16:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jun 2014 04:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1002,1392192000"; d="scan'208";a="443276197"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2014 04:16:14 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 9 Jun 2014 12:16:10 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.58]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.252]) with mapi id
	14.03.0123.003; Mon, 9 Jun 2014 12:16:09 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Stefan Stanacar <sstncr@gmail.com>
Thread-Topic: [OE-core] [PATCH V2 6/7] controllers/masterimage.py: Make
	testimage kernel naming pattern universal
Thread-Index: AQHPgapIryQseVfNAUegbAekrnwvWZtlabCAgAAdLQCAAxq7UA==
Date: Mon, 9 Jun 2014 11:16:05 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A27AECA@IRSMSX103.ger.corp.intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<1402082078-10826-7-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRtrdE5Rn7LEkPTUrJxRXmYRazcZzzscCawu8r=ERbxLyA@mail.gmail.com>
	<CANr+NRvJd=vo=BOA+iXimFqeLb6_aarniLMA8ciZ38BxZ0rGVg@mail.gmail.com>
In-Reply-To: <CANr+NRvJd=vo=BOA+iXimFqeLb6_aarniLMA8ciZ38BxZ0rGVg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 6/7] controllers/masterimage.py: Make testimage kernel naming pattern universal
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
X-List-Received-Date: Mon, 09 Jun 2014 11:16:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFuIFN0YW5hY2Fy
IFttYWlsdG86c3N0bmNyQGdtYWlsLmNvbV0NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMDcsIDIw
MTQgMzozOSBQTQ0KPiBUbzogU3RvaWNlc2N1LCBDb3JuZWxpdVgNCj4gQ2M6IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggVjIgNi83XSBjb250cm9sbGVycy9tYXN0ZXJpbWFnZS5weTogTWFrZQ0KPiB0ZXN0aW1h
Z2Uga2VybmVsIG5hbWluZyBwYXR0ZXJuIHVuaXZlcnNhbA0KPiANCj4gT24gU2F0LCBKdW4gNywg
MjAxNCBhdCAxOjU0IFBNLCBTdGVmYW4gU3RhbmFjYXIgPHNzdG5jckBnbWFpbC5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4gT24gSnVuIDYsIDIwMTQgODoxMSBQTSwgIkNvcm5lbGl1IFN0b2ljZXNjdSIN
Cj4gPiA8Y29ybmVsaXV4LnN0b2ljZXNjdUBpbnRlbC5jb20+DQo+ID4gd3JvdGU6DQo+ID4+DQo+
ID4+IFlCOiAjNjI1NA0KPiA+Pg0KPiA+PiBUaGUgUWVtdVRhcmdldENvbnRyb2wgY2xhc3MgZG9l
cyBub3Qgc3BlY2lmeSBhbnkga2VybmVsIG5hbWluZyBidXQNCj4gPj4gdGhlIHJ1bnFlbXUgc2Ny
aXB0IGl0IHVzZXMgdXNlcyB0aGUgIiBLRVJORUxfSU1BR0VUWVBFICsgTUFDSElORSArDQo+ICcu
YmluJyAiDQo+ID4+IG5hbWluZyBzY2hlbWUuDQo+ID4+IE1vZGlmeWluZyB0aGUgb3RoZXIgbWFq
b3IgdGFyZ2V0IGNvbnRyb2xsZXIgY2xhc3MsDQo+ID4+IE1hc3RlckltYWdlSGFyZHdhcmVUYXJn
ZXQsIHRvIHVzZSB0aGUgc2FtZSBrZXJuZWwgbmFtaW5nIHNjaGVtZS4NCj4gPj4NCj4gPg0KPiA+
IFlvdSBjYW4ndCBkbyB0aGF0IGJlY2F1c2Ugbm90IGFsbCB0YXJnZXRzIChiYmIsIG51YywgZXRj
KSB1c2UgYSBiaW4NCj4gPiBrZXJuZWwuLi4NCj4gPg0KPiBBaCwgbWlzdW5kZXJzdG9vZC4uLiBy
aWdodCwgdGhlcmUgaXMgLmJpbiBsaW5rIHRvbw0KPiANCj4gPj4gVGhpcyBpcyB1c2VmdWxsIGFs
c28gdG8gb3V0c2lkZSBzY3JpcHRzIHRoYXQgd2FudCB0byBhbnRpY2lwYXRlIHRoZQ0KPiA+PiBr
ZXJuZWwgZmlsZSBuYW1lIGZvciBhbGwgdGFyZ2V0IGNvbnRyb2xsZXJzLg0KPiA+DQo+ID4gQW5k
IHdoYXQncyB3cm9uZyB3aXRoIHRoZSBsaW5rPyBCaXRiYWtlIHdpbGwgYWx3YXlzIHRha2UgY2Fy
ZSBvZiB0aGF0DQo+ID4gYW5kIHBvaW50IHRvIHRoZSByZWFsIGZpbGUgd2h5IGNhbid0IHRoZSBz
Y3JpcHQgZGVyZWZlcmVuY2UgdGhhdD8NCj4gPg0KDQpUaGUgbGluayB3b3VsZCBiZSBmaW5lIGJ1
dDoNCi0gdGhlIGxpbmsgaXMgbm90IHVuaXF1ZSwgdGhlcmUgYXJlIGF0IDIuDQotIHRoZSBsaW5r
IHVzZWQgYnkgdGVzdGltYWdlKHdpdGhvdXQgdGhpcyBwYXRjaCkgaXMgbm90IGFsd2F5cyB0aGUg
c2FtZS4gVGhlIHNjcmlwdCBjYW4gY3JlYXRlIGEgbGluayBmcm9tIG9uZSB0byB0aGUgb3RoZXIg
YnV0IHRoYXQgaXMgbm90IG5lY2Vzc2FyeSB3aGVuIHdlIGNhbiBoYXZlIG9uZSBuYW1lIGZvcm1h
dCBmb3IgYWxsIHRhcmdldCBjb250cm9sbGVycyB0byB1c2UuIEFsc28gaGF2aW5nIHRoZSBzZXR1
cCB3aXRob3V0IGxpbmtzIHNpbXBsaWZpZXMgdGhlIHNldHVwIG9mIHRoZSBpbWFnZXMgb24gdGhl
IHNjcmlwdCBzaWRlLiANCi0gdXNpbmcgdGhlIGN1cnJlbnQga2VybmVsIG5hbWUgZm9yIG1hY2hp
bmVzIHRoYXQgdXNlIHRoZSBzYW1lIEtFUk5FTF9JTUFHRVRZUEUgd291bGQgb3ZlcnJpZGUgdGhl
IGtlcm5lbCBvZiB0aGUgcHJldmlvdXMgbWFjaGluZSBkdXJpbmcgdGhlIHNhbWUgdGVzdCBjeWNs
ZS4gVGhpcyBjb3VsZCBpbnRyb2R1Y2UgY29tcGxpY2F0aW9ucywgZXNwZWNpYWxseSBpZiB3ZSBk
ZWNpZGUgaW4gdGhlIGZ1dHVyZSB0byBjcmVhdGUgYSBjb21tb24gZG93bmxvYWQgZGlyZWN0b3Jp
ZXMgZm9yIG11bHRpcGxlIHNjcmlwdCBpbnN0YW5jZXMuDQoNCkkgYmVsaWV2ZSB0aGlzIGlzIG5v
dCBhIGJpZyBjaGFuZ2UgYnV0IGludHJvZHVjZXMgc29tZSBzaW1wbGlmaWNhdGlvbiBzZXR1cCB3
aXNlLiBJIHNlZSBubyBhZHZhbnRhZ2UgbGVhdmluZyBpdCBhcyBpcyBhc2lkZSBhdm9pZGluZyBt
YWtpbmcgY2hhbmdlcy4NCg0KUmVnYXJkcywNCkNvcm5lbGl1IA0KDQo+ID4gQ2hlZXJzLA0KPiA+
IFN0ZWZhbg0KPiA+DQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IENvcm5lbGl1IFN0b2ljZXNj
dSA8Y29ybmVsaXV4LnN0b2ljZXNjdUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgbWV0YS9s
aWIvb2VxYS9jb250cm9sbGVycy9tYXN0ZXJpbWFnZS5weSB8IDIgKy0NCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0t
Z2l0IGEvbWV0YS9saWIvb2VxYS9jb250cm9sbGVycy9tYXN0ZXJpbWFnZS5weQ0KPiA+PiBiL21l
dGEvbGliL29lcWEvY29udHJvbGxlcnMvbWFzdGVyaW1hZ2UucHkNCj4gPj4gaW5kZXggYjAzYzVi
Zi4uMzExZjBjZiAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9saWIvb2VxYS9jb250cm9sbGVycy9t
YXN0ZXJpbWFnZS5weQ0KPiA+PiArKysgYi9tZXRhL2xpYi9vZXFhL2NvbnRyb2xsZXJzL21hc3Rl
cmltYWdlLnB5DQo+ID4+IEBAIC01Miw3ICs1Miw3IEBAIGNsYXNzDQo+ID4+IE1hc3RlckltYWdl
SGFyZHdhcmVUYXJnZXQob2VxYS50YXJnZXRjb250cm9sLkJhc2VUYXJnZXQpOg0KPiA+PiAgICAg
ICAgICAjIHRlc3Qgcm9vdGZzICsga2VybmVsDQo+ID4+ICAgICAgICAgIHNlbGYuaW1hZ2VfZnN0
eXBlID0gc2VsZi5nZXRfaW1hZ2VfZnN0eXBlKGQpDQo+ID4+ICAgICAgICAgIHNlbGYucm9vdGZz
ID0gb3MucGF0aC5qb2luKGQuZ2V0VmFyKCJERVBMT1lfRElSX0lNQUdFIiwNCj4gPj4gVHJ1ZSks
IGQuZ2V0VmFyKCJJTUFHRV9MSU5LX05BTUUiLCBUcnVlKSArICcuJyArIHNlbGYuaW1hZ2VfZnN0
eXBlKQ0KPiA+PiAtICAgICAgICBzZWxmLmtlcm5lbCA9IG9zLnBhdGguam9pbihkLmdldFZhcigi
REVQTE9ZX0RJUl9JTUFHRSIsIFRydWUpLA0KPiA+PiBkLmdldFZhcigiS0VSTkVMX0lNQUdFVFlQ
RSIpKQ0KPiA+PiArICAgICAgICBzZWxmLmtlcm5lbCA9IG9zLnBhdGguam9pbihkLmdldFZhcigi
REVQTE9ZX0RJUl9JTUFHRSIsDQo+ID4+ICsgVHJ1ZSksDQo+ID4+IGQuZ2V0VmFyKCJLRVJORUxf
SU1BR0VUWVBFIikgKyAnLScgKyBkLmdldFZhcignTUFDSElORScpICsgJy5iaW4nKQ0KPiA+PiAg
ICAgICAgICBpZiBub3Qgb3MucGF0aC5pc2ZpbGUoc2VsZi5yb290ZnMpOg0KPiA+PiAgICAgICAg
ICAgICAgIyB3ZSBjb3VsZCd2ZSBjaGVja2VkIHRoYXQgSU1BR0VfRlNUWVBFUyBjb250YWlucyB0
YXIuZ3oNCj4gPj4gYnV0IHRoZSBjb25maWcgZm9yIHJ1bm5pbmcgdGVzdGltYWdlIG1pZ2h0IG5v
dCBiZQ0KPiA+PiAgICAgICAgICAgICAgIyB0aGUgc2FtZSBhcyB0aGUgY29uZmlnIHdpdGggd2hp
Y2ggdGhlIGltYWdlIHdhcyBidWlsZCwNCj4gPj4gaWUNCj4gPj4gLS0NCj4gPj4gMS44LjMuMg0K
PiA+Pg0KPiA+PiAtLQ0KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiA+PiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPj4gT3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBodHRwOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

