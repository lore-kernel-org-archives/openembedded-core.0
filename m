Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0205.outbound.protection.outlook.com [207.46.163.205])
	by mail.openembedded.org (Postfix) with ESMTP id 0736A6E996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:17:20 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	BN1PR03MB172.namprd03.prod.outlook.com (10.255.200.152) with Microsoft
	SMTP Server (TLS) id 15.0.859.15; Fri, 31 Jan 2014 18:17:12 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0859.020; Fri, 31 Jan 2014 18:17:11 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfCAAcCFgIAHP+YAgAOMSPCAAAT4gIAAAF3w
Date: Fri, 31 Jan 2014 18:17:10 +0000
Message-ID: <fca6c32db2694c3c9c8a3f0130a3c039@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
	<1390596961.24755.21.camel@e130.pbcl.net>
	<1390995512.24655.62.camel@ted>
	<da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
	<1391191631.28575.7.camel@ted>
In-Reply-To: <1391191631.28575.7.camel@ted>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(164054003)(377424004)(189002)(199002)(377454003)(51704005)(24454002)(13464003)(50986001)(49866001)(51856001)(81686001)(81542001)(81816001)(76482001)(74366001)(80976001)(46102001)(93136001)(47736001)(94946001)(47976001)(83322001)(19580405001)(53806001)(19580395003)(54356001)(4396001)(77982001)(59766001)(87266001)(87936001)(33646001)(85306002)(94316002)(54316002)(56776001)(81342001)(2656002)(47446002)(69226001)(74662001)(74316001)(31966008)(74706001)(74502001)(93516002)(86362001)(83072002)(79102001)(66066001)(76576001)(76786001)(76796001)(63696002)(65816001)(92566001)(74876001)(80022001)(90146001)(85852003)(56816005)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB172;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:; InfoNoRecordsMX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Fri, 31 Jan 2014 18:17:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClN1cmUsIEknbGwgZG8gdGhpcyBhbmQgYWxzbyBzb21lIG1vcmUgZXh0ZW5zaXZlIHRl
c3RpbmcNCm9uIHRoZSBib2FyZHMuDQoNClRoYW5rcywNCkFsZXgNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAzMSwgMjAx
NCA4OjA3IFBNDQo+IFRvOiBTYXJkYW4gQWxleGFuZHJ1IENlemFyLUI0MTcwMA0KPiBDYzogUGhp
bCBCbHVuZGVsbDsgVWRtYSBDYXRhbGluLURhbi1CMzI3MjE7IG9wZW5lbWJlZGRlZC0NCj4gY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBSZXZlcnQgImNyb3NzLWNhbmFkaWFuOiBIYW5kbGUgcG93ZXJwYw0KPiBsaW51eCB2ZXJzZXMg
bGludXgtZ251c3BlIg0KPiANCj4gT24gRnJpLCAyMDE0LTAxLTMxIGF0IDE3OjUzICswMDAwLCBh
bGV4YW5kcnUuc2FyZGFuQGZyZWVzY2FsZS5jb20gd3JvdGU6DQo+ID4gSGkgUmljaGFyZCwNCj4g
Pg0KPiA+IEkndmUgdGVzdGVkIHlvdXIgcGF0Y2ggZm9yIGJvdGggYWx0aXZlYyBhbmQgc3BlIGFu
ZCBpdCB3b3JrcyBmaW5lLg0KPiANCj4gV291bGQgeW91IGJlIGFibGUgdG8gcHV0IHRvZ2V0aGVy
IGEgcHJvcGVyIHBhdGNoIHdpdGggdGhlIGV4cGxhbmF0aW9uDQo+IGFuZCBzbyBvbiBzbyB3ZSBj
YW4gZ2V0IGl0IG1lcmdlZCBhbmQgcmVzb2x2ZSB0aGlzIGlzc3VlPw0KPiANCj4gQ2hlZXJzLA0K
PiANCj4gUmljaGFyZA0KPiANCj4gPiBSZWdhcmRzLA0KPiA+IEFsZXgNCj4gPg0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIFttYWls
dG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10NCj4gPiA+IFNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAyOSwgMjAxNCAxOjM5IFBNDQo+ID4gPiBUbzogUGhpbCBCbHVuZGVsbA0K
PiA+ID4gQ2M6IFNhcmRhbiBBbGV4YW5kcnUgQ2V6YXItQjQxNzAwOyBVZG1hIENhdGFsaW4tRGFu
LUIzMjcyMTsNCj4gb3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gUmV2ZXJ0ICJjcm9zcy1j
YW5hZGlhbjogSGFuZGxlIHBvd2VycGMNCj4gPiA+IGxpbnV4IHZlcnNlcyBsaW51eC1nbnVzcGUi
DQo+ID4gPg0KPiA+ID4gT24gRnJpLCAyMDE0LTAxLTI0IGF0IDIwOjU2ICswMDAwLCBQaGlsIEJs
dW5kZWxsIHdyb3RlOg0KPiA+ID4gPiBPbiBUaHUsIDIwMTQtMDEtMjMgYXQgMTg6MjIgKzAwMDAs
IGFsZXhhbmRydS5zYXJkYW5AZnJlZXNjYWxlLmNvbQ0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4g
W0FsZXggU2FyZGFuXSBOby4gVGhlIG1vcmUgZ2VuZXJpYyB0YXJnZXQgcG93ZXJwYy1ub25lLWxp
bnV4IHdpbGwNCj4gbm90DQo+ID4gPiA+ID4gZ2VuZXJhdGUgU1BFIGNvZGUgYW5kIHRoZSBwb3dl
cnBjLW5vbmUtbGludXgtZ251c3BlIHRhcmdldCB0aGF0DQo+ID4gPiBnZW5lcmF0ZXMNCj4gPiA+
ID4gPiBTUEUgd2lsbCBub3QgYmUgYWJsZSB0byBnZW5lcmF0ZSBBbHRpdmVjLg0KPiA+ID4gPg0K
PiA+ID4gPiBXaHkgbm90PyAgQXMgZmFyIGFzIEkgY2FuIHRlbGwgZnJvbSB0aGUgZ2NjIGNvbmZp
Z3VyeSwgdGhlIHRhcmdldA0KPiA+ID4gc3RyaW5nDQo+ID4gPiA+IG9ubHkgYWZmZWN0cyB0aGUg
ZGVmYXVsdHMgKGkuZS4gcG93ZXJwYy0qLWxpbnV4IGdldHMgLW1uby1zcGUNCj4gPiA+ID4gLW1u
by1hbHRpdmVjLCBwb3dlcnBjLSotbGludXhhbHRpdmVjIGdldHMgLW1hbHRpdmVjIC1tbm8tc3Bl
YywgYW5kDQo+ID4gPiA+IHBvd2VycGMtKi1saW51eHNwZSBnZXRzIC1tbm8tYWx0aXZlYyAtbXNw
ZSkuICBUaGVyZSBkb2Vzbid0IHNlZW0gdG8NCj4gYmUNCj4gPiA+ID4gYW55IHJlYWwgaW1wYWN0
IGJleW9uZCB0aGlzIHRoYXQgd291bGQgbWFrZSB0aGUgY29tcGlsZXIgYmluYXJ5DQo+ID4gPiA+
IGZ1bmRhbWVudGFsbHkgaW5jYXBhYmxlIG9mIGdlbmVyYXRpbmcgZWl0aGVyIHR5cGUgb2YgaW5z
dHJ1Y3Rpb24gaWYNCj4geW91DQo+ID4gPiA+IHBhc3MgdGhlIGFwcHJvcHJpYXRlIG9wdGlvbnMg
b24gdGhlIGNvbW1hbmQgbGluZS4NCj4gPiA+DQo+ID4gPiBJIGhhZCBhIGNsb3NlciBsb29rIGF0
IHRoaXMuIFRoZSBjb25maWcuZ2NjIGNhc2Ugc3RhdGVtZW50cyBmb3INCj4gcG93ZXJwYw0KPiA+
ID4gb25seSBhcHBlYXIgdG8gbGV0IHlvdSBpbmNsdWRlIHJzNjAwMC9saW51eGFsdGl2ZWMuaCBv
cg0KPiA+ID4gcnM2MDAwL2xpbnV4c3BlLmgsIHRoZXJlIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGEg
dGFyZ2V0IHlvdSBjYW4gcGFzcw0KPiBpbg0KPiA+ID4gdG8gZ2V0IGJvdGguDQo+ID4gPg0KPiA+
ID4gTG9va2luZyBhdCB0aGUgY29kZSBpbiB0aG9zZSBmaWxlcywgSSBkb24ndCBzZWUgYW55IHJl
YXNvbiB3aHkgeW91DQo+IGNhbid0DQo+ID4gPiBhY3R1YWxseSBpbmNsdWRlIHN1cHBvcnQgZm9y
IGJvdGggaG93ZXZlci4gQXMgc3VjaCwgSSBqdXN0IGhhY2tlZCBhDQo+ID4gPiBidWlsZCB3aXRo
Og0KPiA+ID4NCj4gPiA+IHRtX2ZpbGU9IiR7dG1fZmlsZX0gcnM2MDAwL2xpbnV4YWx0aXZlYy5o
Ig0KPiA+ID4gdG1fZmlsZT0iJHt0bV9maWxlfSByczYwMDAvbGludXhzcGUuaCByczYwMDAvZTUw
MC5oIg0KPiA+ID4NCj4gPiA+IGFuZCBpdCBjZXJ0YWlubHkgc2VlbXMgdG8gYnVpbGQgb2sgYW5k
IGNvbXBpbGUgdGhpbmdzICh0aGlzIHdhcyBqdXN0DQo+IGZvcg0KPiA+ID4gcWVtdXBwYykuIEkg
ZGlkbid0IHRyeSBidWlsZGluZyBhbHRpdmVjIG9yIHNwZSBzcGVjaWZpYyB0aGluZ3MgYnV0DQo+
ID4gPiBsb29raW5nIGF0IHRoZSBjb2RlLCBJIGNhbid0IHNlZSBhbnkgcmVhc29uIGl0IHdvdWxk
bid0IHdvcmsgYXQgbGVhc3QNCj4gaW4NCj4gPiA+IHRoZW9yeS4NCj4gPiA+DQo+ID4gPiBJJ2Qg
c3VnZ2VzdCB0aGUgZWFzaWVzdCB3YXkgdG8gcmVzb2x2ZSB0aGlzIG1heSBiZSB0byBwYXRjaCBn
Y2MgdG8NCj4gPiA+IGluY2x1ZGUgc3VwcG9ydCBmb3IgYWxsIHRoZSBtb2Rlcy4NCj4gPiA+DQo+
ID4gPiBDaGVlcnMsDQo+ID4gPg0KPiA+ID4gUmljaGFyZA0KPiA+ID4NCj4gPiA+DQo+ID4NCj4g
Pg0KPiANCj4gDQo+IA0KDQo=

