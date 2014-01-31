Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0206.outbound.protection.outlook.com [207.46.163.206])
	by mail.openembedded.org (Postfix) with ESMTP id A06436E8EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:53:48 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	BLUPR03MB166.namprd03.prod.outlook.com (10.255.212.142) with Microsoft
	SMTP Server (TLS) id 15.0.868.8; Fri, 31 Jan 2014 17:53:34 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0859.020; Fri, 31 Jan 2014 17:53:34 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Phil Blundell
	<pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfCAAcCFgIAHP+YAgAOMSPA=
Date: Fri, 31 Jan 2014 17:53:33 +0000
Message-ID: <da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
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
In-Reply-To: <1390995512.24655.62.camel@ted>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(51704005)(377454003)(24454002)(199002)(189002)(13464003)(377424004)(74662001)(80976001)(54356001)(54316002)(87266001)(53806001)(66066001)(59766001)(94316002)(79102001)(80022001)(69226001)(63696002)(65816001)(92566001)(74502001)(81816001)(2656002)(85306002)(56776001)(81686001)(31966008)(47446002)(76482001)(87936001)(85852003)(90146001)(56816005)(83072002)(47736001)(49866001)(47976001)(51856001)(77982001)(74706001)(86362001)(19580395003)(19580405001)(83322001)(81342001)(93516002)(74366001)(33646001)(74316001)(81542001)(76786001)(76576001)(46102001)(76796001)(4396001)(93136001)(74876001)(50986001)(94946001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB166;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:EAC8C5C6.A62A96EA.32E1DD7B.C2EDD960.20341; InfoNoRecordsA:1;
	MX:1; LANG:en; 
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
X-List-Received-Date: Fri, 31 Jan 2014 17:53:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSd2ZSB0ZXN0ZWQgeW91ciBwYXRjaCBmb3IgYm90aCBhbHRpdmVjIGFu
ZCBzcGUgYW5kIGl0IHdvcmtzIGZpbmUuDQoNClJlZ2FyZHMsDQpBbGV4DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkg
MjksIDIwMTQgMTozOSBQTQ0KPiBUbzogUGhpbCBCbHVuZGVsbA0KPiBDYzogU2FyZGFuIEFsZXhh
bmRydSBDZXphci1CNDE3MDA7IFVkbWEgQ2F0YWxpbi1EYW4tQjMyNzIxOyBvcGVuZW1iZWRkZWQt
DQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gUmV2ZXJ0ICJjcm9zcy1jYW5hZGlhbjogSGFuZGxlIHBvd2VycGMNCj4gbGludXgg
dmVyc2VzIGxpbnV4LWdudXNwZSINCj4gDQo+IE9uIEZyaSwgMjAxNC0wMS0yNCBhdCAyMDo1NiAr
MDAwMCwgUGhpbCBCbHVuZGVsbCB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMTQtMDEtMjMgYXQgMTg6
MjIgKzAwMDAsIGFsZXhhbmRydS5zYXJkYW5AZnJlZXNjYWxlLmNvbQ0KPiB3cm90ZToNCj4gPiA+
IFtBbGV4IFNhcmRhbl0gTm8uIFRoZSBtb3JlIGdlbmVyaWMgdGFyZ2V0IHBvd2VycGMtbm9uZS1s
aW51eCB3aWxsIG5vdA0KPiA+ID4gZ2VuZXJhdGUgU1BFIGNvZGUgYW5kIHRoZSBwb3dlcnBjLW5v
bmUtbGludXgtZ251c3BlIHRhcmdldCB0aGF0DQo+IGdlbmVyYXRlcw0KPiA+ID4gU1BFIHdpbGwg
bm90IGJlIGFibGUgdG8gZ2VuZXJhdGUgQWx0aXZlYy4NCj4gPg0KPiA+IFdoeSBub3Q/ICBBcyBm
YXIgYXMgSSBjYW4gdGVsbCBmcm9tIHRoZSBnY2MgY29uZmlndXJ5LCB0aGUgdGFyZ2V0DQo+IHN0
cmluZw0KPiA+IG9ubHkgYWZmZWN0cyB0aGUgZGVmYXVsdHMgKGkuZS4gcG93ZXJwYy0qLWxpbnV4
IGdldHMgLW1uby1zcGUNCj4gPiAtbW5vLWFsdGl2ZWMsIHBvd2VycGMtKi1saW51eGFsdGl2ZWMg
Z2V0cyAtbWFsdGl2ZWMgLW1uby1zcGVjLCBhbmQNCj4gPiBwb3dlcnBjLSotbGludXhzcGUgZ2V0
cyAtbW5vLWFsdGl2ZWMgLW1zcGUpLiAgVGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlDQo+ID4gYW55
IHJlYWwgaW1wYWN0IGJleW9uZCB0aGlzIHRoYXQgd291bGQgbWFrZSB0aGUgY29tcGlsZXIgYmlu
YXJ5DQo+ID4gZnVuZGFtZW50YWxseSBpbmNhcGFibGUgb2YgZ2VuZXJhdGluZyBlaXRoZXIgdHlw
ZSBvZiBpbnN0cnVjdGlvbiBpZiB5b3UNCj4gPiBwYXNzIHRoZSBhcHByb3ByaWF0ZSBvcHRpb25z
IG9uIHRoZSBjb21tYW5kIGxpbmUuDQo+IA0KPiBJIGhhZCBhIGNsb3NlciBsb29rIGF0IHRoaXMu
IFRoZSBjb25maWcuZ2NjIGNhc2Ugc3RhdGVtZW50cyBmb3IgcG93ZXJwYw0KPiBvbmx5IGFwcGVh
ciB0byBsZXQgeW91IGluY2x1ZGUgcnM2MDAwL2xpbnV4YWx0aXZlYy5oIG9yDQo+IHJzNjAwMC9s
aW51eHNwZS5oLCB0aGVyZSBkb2Vzbid0IGFwcGVhciB0byBiZSBhIHRhcmdldCB5b3UgY2FuIHBh
c3MgaW4NCj4gdG8gZ2V0IGJvdGguDQo+IA0KPiBMb29raW5nIGF0IHRoZSBjb2RlIGluIHRob3Nl
IGZpbGVzLCBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHdoeSB5b3UgY2FuJ3QNCj4gYWN0dWFsbHkg
aW5jbHVkZSBzdXBwb3J0IGZvciBib3RoIGhvd2V2ZXIuIEFzIHN1Y2gsIEkganVzdCBoYWNrZWQg
YQ0KPiBidWlsZCB3aXRoOg0KPiANCj4gdG1fZmlsZT0iJHt0bV9maWxlfSByczYwMDAvbGludXhh
bHRpdmVjLmgiDQo+IHRtX2ZpbGU9IiR7dG1fZmlsZX0gcnM2MDAwL2xpbnV4c3BlLmggcnM2MDAw
L2U1MDAuaCINCj4gDQo+IGFuZCBpdCBjZXJ0YWlubHkgc2VlbXMgdG8gYnVpbGQgb2sgYW5kIGNv
bXBpbGUgdGhpbmdzICh0aGlzIHdhcyBqdXN0IGZvcg0KPiBxZW11cHBjKS4gSSBkaWRuJ3QgdHJ5
IGJ1aWxkaW5nIGFsdGl2ZWMgb3Igc3BlIHNwZWNpZmljIHRoaW5ncyBidXQNCj4gbG9va2luZyBh
dCB0aGUgY29kZSwgSSBjYW4ndCBzZWUgYW55IHJlYXNvbiBpdCB3b3VsZG4ndCB3b3JrIGF0IGxl
YXN0IGluDQo+IHRoZW9yeS4NCj4gDQo+IEknZCBzdWdnZXN0IHRoZSBlYXNpZXN0IHdheSB0byBy
ZXNvbHZlIHRoaXMgbWF5IGJlIHRvIHBhdGNoIGdjYyB0bw0KPiBpbmNsdWRlIHN1cHBvcnQgZm9y
IGFsbCB0aGUgbW9kZXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiANCg0K

