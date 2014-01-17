Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0210.outbound.protection.outlook.com [207.46.163.210])
	by mail.openembedded.org (Postfix) with ESMTP id 67CCC6AA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:43:37 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	DM2PR03MB400.namprd03.prod.outlook.com (10.141.84.153) with Microsoft
	SMTP Server (TLS) id 15.0.847.13; Fri, 17 Jan 2014 14:43:24 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0847.008; Fri, 17 Jan 2014 14:43:24 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: =?utf-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>,
	"zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYA
Date: Fri, 17 Jan 2014 14:43:24 +0000
Message-ID: <55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
In-Reply-To: <52D53A6C.30808@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(689001)(679001)(779001)(51704005)(199002)(13464003)(189002)(24454002)(377454003)(71364002)(377424004)(87266001)(15202345003)(76796001)(74706001)(74662001)(81342001)(47976001)(19580405001)(2656002)(76576001)(50986001)(76786001)(49866001)(47736001)(19580395003)(47446002)(31966008)(74366001)(74502001)(4396001)(83322001)(81542001)(56816005)(79102001)(69226001)(80976001)(77982001)(46102001)(92566001)(15975445006)(59766001)(54316002)(81686001)(66066001)(54356001)(56776001)(85306002)(83072002)(33646001)(85852003)(76482001)(65816001)(81816001)(53806001)(80022001)(74316001)(51856001)(87936001)(74876001)(93136001)(93516002)(90146001)(63696002)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB400;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Fri, 17 Jan 2014 14:43:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCmU1MDB2MS92MiB1c2VzIFNQRSB0byBoYW5kbGUgZmxvYXRpbmcgcG9pbnQgb3BlcmF0
aW9ucw0KdXNpbmcgZ2VuZXJhbCBwdXJwb3NlIHJlZ3MuDQpTbyB1c2luZyB0aGUgbm9uLVNQRSBj
b21waWxlciB3aXRoIFNQRSBsaWJyYXJpZXMgd29uJ3Qgd29yay4NCkhvd2V2ZXIgdGhlIHNvZnQt
ZnAgbGlicmFyaWVzIGFyZSBjb21wYXRpYmxlIHdpdGggdGhlIGU1MDAgDQpBQkkgKHdpdGggYSBj
b25zaWRlcmFibGUgcGVyZm9ybWFuY2UgcGVuYWx0eSkuDQoNCkZyb20gd2hhdCBJIGNhbiBzZWUs
IGVnbGliYyBpcyBidWlsdCB3aXRoIFNQRS4gU28gR0NDIHNob3VsZCANCmJlIGJ1aWx0IGFsc28g
Zm9yIFNQRSAodGFyZ2V0IHBvd2VycGMtcG9reS1saW51eC1nbnVzcGUpLg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpBbGV4DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVt
YmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3Bl
bmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYg
T2YNCj4gRGF2aWQgTnlzdHLDtm0NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNCwgMjAxNCAz
OjI0IFBNDQo+IFRvOiBMdW8gWmhlbmh1YS1CMTk1MzcNCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hd
IFJldmVydCAiY3Jvc3MtY2FuYWRpYW46IEhhbmRsZSBwb3dlcnBjDQo+IGxpbnV4IHZlcnNlcyBs
aW51eC1nbnVzcGUiDQo+IA0KPiBPbiAyMDE0LTAxLTEzIDEzOjQxLCBSaWNoYXJkIFB1cmRpZSB3
cm90ZToNCj4gPiBPbiBNb24sIDIwMTQtMDEtMTMgYXQgMTM6MzcgKzAxMDAsIERhdmlkIE55c3Ry
w7ZtIHdyb3RlOg0KPiA+PiBKdXN0IHRvIGNsYXJpZnkgYnVnIDUzNTQ6DQo+ID4+IElmIEkgdW5k
ZXJzdGFuZCB0aGUgYnVnIGNvcnJlY3RseSwgdGhpcyB3b3VsZCBhcmlzZSB3aGVuIGZpcnN0DQo+
IGJ1aWxkaW5nDQo+ID4+IHRoZSBuYXRpdmVzZGsgdGFyYmFsbCBvbiBhIE1BQ0hJTkUgd2l0aCBB
QkkgbGludXgsDQo+ID4+IGFuZCB0aGVuIGJ1aWxkaW5nIHRoZSBuYXRpdmVzZGsgZm9yIGFub3Ro
ZXIgTUFDSElORSh3aXRoIHRoZSBzYW1lIHRoZQ0KPiA+PiBzYW1lIFRVTkUpIGFmdGVyIGFsdGVy
aW5nIEFCSUVYVEVOU0lPTiB0byBsaW51eC1nbnVzcGUgPw0KPiA+Pg0KPiA+PiBJZiBJIHVuZGVy
c3RhbmQgYnVnIDUzNTQgY29ycmVjdGx5LCBwZXJoYXBzIHRoZSB0bXAvc2RrL3RhcmJhbGwuaGVy
ZQ0KPiA+PiBjYW4gYmUgQUJJIHNwZWNpZmljID8NCj4gPg0KPiA+IFRoZSBpZGVhIGJlaGluZCB0
aGUgY2hhbmdlcyB0byBjcm9zcy1jYW5hZGlhbiB3ZXJlIHRvIGhhdmUganVzdCBhDQo+IHNpbmds
ZQ0KPiA+IGdjYy9iaW51dGlscyB3aGljaCBnZW5lcmF0ZWQgYWxsIG9mIHRoZSBhcHByb3ByaWF0
ZSB0YXJnZXRzIGZvciBhIGdpdmVuDQo+ID4gYXJjaGl0ZWN0dXJlLg0KPiA+DQo+ID4gSSB1bmRl
cnN0b29kIHRoaXMgdG8gYmUgcG9zc2libGUgYnV0IGl0IGxvb2tzIGxpa2Ugd2UgbWF5IG5lZWQg
dG8gdHdlYWsNCj4gPiB0aGluZ3MgYSBiaXQuDQo+ID4NCj4gPj4gaS5lLiBhIGdlbmVyaWMgcnVs
ZSB0aGF0IGFsbCBuYXRpdmVzZGsgYnVpbGRzIGFyZSBpbnZhbGlkYXRlZCBpZiB0aGUNCj4gPj4g
QUJJIGNoYW5nZXMuIEkgZ3Vlc3MgdGhhdCB3b3VsZCBtZWFuOg0KPiA+PiBjcm9zcy1jYW5hZGlh
bi5iYmNsYXNzOiBUQVJHRVRfQVJDSFt2YXJkZXBzXSArPSAiQUJJRVhURU5TSU9OIg0KPiA+PiAr
IEFkZGluZyBBQklFWFRFTlNJT04gdG8gdGhlIG5hdGl2ZXNkayB0YXJiYWxsIG5hbWUuDQo+ID4+
DQo+ID4+IFBQQyAnPW1hYmk9c3BlJyBzZWVtcyB0byBiZSBvbmUtd2F5IGNvbXBhdGlibGUsICBJ
IGNvdWxkIG5vdCBnZXQgdGhlDQo+ID4+IG5vbi1TUEUgY29uZmlndXJlZCBjb21waWxlcg0KPiA+
PiB0byB3b3JrIHdpdGggdGhlIFNQRSBzeXNyb290Lg0KPiA+PiBBbm90aGVyIHBvc3NpYmxlIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIGFsd2F5cyBjb25maWd1cmUgdGhlIGNvbXBpbGVyIHRvDQo+ID4+
IFNQRSwgYW5kIHVzZSBjb21waWxlIHRpbWUgZmxhZ3MgaW4gdGhlDQo+ID4+IGVudmlyb25tZW50
IGZpbGUgdG8gZG8gdGhlIHNlbGVjdHMuICsgc3ltbGlua3MgZm9yIHRoZSBjb21waWxlciBwYXRo
cy4NCj4gPg0KPiA+IENhbiB3ZSBjb25maWd1cmUgdGhlIGNvbXBpbGVyIHRvIGluY2x1ZGUgU1BF
IHN1cHBvcnQgd2l0aG91dCBjaGFuZ2luZw0KPiA+IHRoZSBwYXRocy9PUyBzdHJpbmc/DQo+IA0K
PiBQb3NzaWJseSwgYnV0IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgU1BFIHRvIGJlIHN1cmUu
DQo+IFBlcmhhcHMgWmhlbmh1YSBjYW4gYWRkIGEgZmV3IGNlbnRzIGhlcmUuDQo+IA0KPiBTaG9y
dCBzdW1tYXJ5IG9mIHByb2JsZW06DQo+IEFsbCBTUEUgZW5hYmxlZCBNQUNISU5FUywgKGU1MDAg
YW5kIGU1MDB2MikgaGF2ZSBicm9rZW4gbmF0aXZlc2RrDQo+IGNvbXBpbGVycyBpbiBkb3JhIGFu
ZCBtYXN0ZXIuDQo+IA0KPiBBbnkgc3VnZ2VzdGlvbnMgb24gYWJvdmUgc3RhdGVtZW50cyA/DQo+
IA0KPiA+DQo+ID4+IEhvd2V2ZXIsIGV2ZW4gaWYgd2UgZml4IGl0IHRoaXMgd2F5IGZvciBwb3dl
cnBjLCB3ZSB3aWxsIHN0aWxsIGhhdmUNCj4gPj4gdGhpcyBpc3N1ZSB3aXRoIHRodW1iIGYuZXgu
DQo+ID4NCj4gPiBLZWVwIGluIG1pbmQgdGhlIHRhcmdldCBzeXNyb290IHN0aWxsIHZhcmllcyBm
b3IgZWFjaCBkaWZmZXJlbnQgdGFyZ2V0Lg0KPiA+IFRoZSB0aGluZyB3ZSdyZSB0cnlpbmcgdG8g
a2VlcCBpbiBjb21tb24gaXMgdGhlIGdjYy9iaW50dWlscyBhbmQgb25seQ0KPiA+IGhhdmUgb25l
IGNvcHkgZm9yIGVhY2ggdGFyZ2V0IGFyY2hpdGVjdHVyZS4gSXMgdGhhdCBwb3NzaWJsZSBpbiB0
aGlzDQo+ID4gY2FzZSBpZiB3ZSBzb21laG93IGVuYWJsZSBTUEUgc3VwcG9ydCBpbiBnY2MtY3Jv
c3MtY2FuYWRpYW4/DQo+IA0KPiBZZXMsIHRhcmdldCBzeXNyb290IHZhcmllcy4gVGhlIG5hdGl2
ZXNkayBzeXNyb290IGNvbnRhaW5pbmcgdGhlDQo+IGNvbXBpbGVyIGlzIHRoZSBzYW1lIGFzIGxv
bmcgYXMgVFVORV9BUkNIIGFuZCBTREtNQUNISU5FIGlzIHRoZSBzYW1lLg0KPiBUd28gQVJNdjgg
dGFyZ2V0cyBidWlsdCBpbiBzZXF1ZW5jZSBvbiB0aGUgc2FtZSBob3N0LCB3aGVyZSBvbmUgaXMN
Cj4gVGh1bWIyIGFuZCB0aGUgb3RoZXIgaXMgRUFCSSA/LCB0aGV5IHdpbGwgc2hhcmUgbmF0aXZl
c2RrIGNvbXBpbGVyIG5vID8NCj4gDQo+IFRoZSAtbmF0aXZlIGNvbXBpbGVyIHJ1bnMgZnJvbSB0
aGUgLW5hdGl2ZSBzeXNyb290LCB3aGljaCBoYXMgYW4gQUJJDQo+IHBvc3RmaXgsIHNvIG5vIHBy
b2JsZW0gdGhlcmUgSSBhc3N1bWUuDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmlj
aGFyZA0KPiA+DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

