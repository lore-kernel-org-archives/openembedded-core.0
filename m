Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0140.outbound.protection.outlook.com [207.46.100.140])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB067374F
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 19:45:35 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.99.14; Fri, 27 Feb 2015 19:31:13 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0099.004; Fri, 27 Feb 2015 19:31:13 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] Build error on Fedora 21: "Unsupported version of git
	(2.1.0)"
Thread-Index: AdBSr0Pbn4LHvR7cQFutEJRdFkGOxQACdmWAAAJy9tA=
Date: Fri, 27 Feb 2015 19:31:13 +0000
Message-ID: <BN3PR0501MB10906A6C2E1881943A2C7770BB150@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090B6DA7D327EEE4D86FA72BB150@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<CADkTA4MBgcCvdUbDr_Zo9Aj0bBJ+t3oguWvYWEUUB2qvZ9WbZQ@mail.gmail.com>
In-Reply-To: <CADkTA4MBgcCvdUbDr_Zo9Aj0bBJ+t3oguWvYWEUUB2qvZ9WbZQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 0166F3B70094520166F504
x-originating-ip: [98.100.91.242]
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1090;
x-microsoft-antispam-prvs: <BN3PR0501MB1090EB99324C5EE46964C5D3C8150@BN3PR0501MB1090.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(601004)(5005006);
	SRVR:BN3PR0501MB1090; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0501MB1090; 
x-forefront-prvs: 05009853EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(51704005)(24454002)(13464003)(377454003)(164054003)(40100003)(87936001)(76176999)(54356999)(99286002)(33656002)(46102003)(19580405001)(19580395003)(86362001)(2656002)(122556002)(50986999)(74316001)(102836002)(110136001)(1720100001)(62966003)(77156002)(15975445007)(2900100001)(76576001)(66066001)(92566002)(2950100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1090;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2015 19:31:13.1392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1090
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Build error on Fedora 21: "Unsupported version of git (2.1.0)"
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
X-List-Received-Date: Fri, 27 Feb 2015 19:45:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QnJ1Y2UsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNo
ZmllbGQgW21haWx0bzpicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwg
RmVicnVhcnkgMjcsIDIwMTUgMToxNCBQTQ0KPiBUbzogQnJ5YW4gRXZlbnNvbg0KPiBDYzogT3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIEJ1aWxkIGVycm9yIG9uIEZlZG9yYSAyMTogIlVuc3VwcG9ydGVkIHZlcnNpb24gb2Yg
Z2l0DQo+ICgyLjEuMCkiDQo+IA0KPiBPbiBGcmksIEZlYiAyNywgMjAxNSBhdCAxMjoxNyBQTSwg
QnJ5YW4gRXZlbnNvbg0KPiA8YmV2ZW5zb25AbWVsaW5rY29ycC5jb20+IHdyb3RlOg0KPiA+IEFs
bCwNCj4gPg0KPiA+IEknbSB0cmFuc2l0aW9uaW5nIHRvIGEgbmV3IGxhcHRvcCBhbmQgSSd2ZSBp
bnN0YWxsZWQgRmVkb3JhIDIxIG9uIHRoZSBuZXcNCj4gb25lLiAgSSdtIHRyeWluZyB0byBidWls
ZCBmb3IgdGhlIGZpcnN0IHRpbWUgYW5kIEknbSBydW5uaW5nIGludG8gc29tZSBpc3N1ZXMuDQo+
ID4NCj4gPiBJJ20gc3RpbGwgb24gdGhlIGR5bGFuIGJyYW5jaC4gIEkgaGF2ZSBhbiBpbWFnZSB0
aGF0IGlzIGJhc2VkIG9uIGNvcmUtaW1hZ2UtDQo+IG1pbmltYWwgd2l0aCBhIGZldyBhZGRpdGlv
bmFsIHBhY2thZ2VzLiAgV2hlbiBJIGF0dGVtcHQgdG8gYnVpbGQgbXkgaW1hZ2UsIGl0DQo+IGZh
aWxzIHdoZW4gYXR0ZW1wdGluZyB0byBwYXRjaCB0aGUgTGludXgga2VybmVsLiAgVGhlIGZhaWx1
cmUgbWVzc2FnZSBpbg0KPiBsb2cuZG9fcGF0Y2ggc2F5czoNCj4gPg0KPiA+ICAgICAgICAgVW5z
dXBwb3J0ZWQgdmVyc2lvbiBvZiBnaXQgKDIuMS4wKQ0KPiA+ICAgICAgICAgW0VSUk9SXSB1bmFi
bGUgdG8gY29tcGxldGUgcHVzaA0KPiA+ICAgICAgICAgcGVuZGluZyBwYXRjaGVzIGFyZToNCj4g
PiAgICAgICAgIFVuc3VwcG9ydGVkIHZlcnNpb24gb2YgZ2l0ICgyLjEuMCkNCj4gPiAgICAgICAg
IEVSUk9SLiBjb3VsZCBub3QgdXBkYXRlIGdpdCB0cmVlDQo+ID4gICAgICAgICBFUlJPUi4gQ291
bGQgbm90IGFwcGx5IHBhdGNoZXMgZm9yIGF0OTFzYW05eDVlay4NCj4gPg0KPiA+IFNvIEknbSBh
c3N1bWluZyB3aGF0IGhhcHBlbmVkIHdhcyB0aGUgYnVpbGQgc3lzdGVtJ3MgdmVyc2lvbiBvZiBH
aXQgd2FzDQo+IHVzZWQgZm9yIHRoZSBpbml0aWFsIGtlcm5lbCBjaGVja291dCBidXQgdGhlIGhv
c3QncyB2ZXJzaW9uIG9mIEdpdCBpcyBiZWluZyB1c2VkDQo+IGluIHRoZSBkb19wYXRjaCBzdGVw
LiAgSG93ZXZlciwgSSBoYXZlbid0IGEgY2x1ZSB3aGF0IHRvIGRvIGFib3V0IGl0LiAgQW55DQo+
IGlkZWFzPw0KPiANCj4gVGhhdCBvbGRlciBzZXQgb2Yga2VybiB0b29scyB1c2VkIGd1aWx0IHRv
IHB1c2ggLyBtYWludGFpbiB0aGUga2VybmVsIHBhdGNoDQo+IHF1ZXVlLiBndWlsdCB1bmZvcnR1
bmF0ZWx5IGhhcyBhIHZlcnNpb24gY2hlY2ssIGFuZCBpZiB0aGUgdmVyc2lvbiBoYXNuJ3QgYmVl
bg0KPiBhZGRlZCwgaXQgYWJvcnRzLg0KPiANCj4gU28geW91J2QgbmVlZCB0byBwYXRjaCBndWls
dCB0byBhZGQgdGhhdCB2ZXJzaW9uIGludG8gaXRzIGNhc2Ugc3RhdGVtZW50IChhbmQNCj4gdGhl
biBob3BlIHRoYXQgbm8gb3RoZXIgYmVoYXZpb3VycyBoYXZlIGNoYW5nZWQgdG8gYnJlYWsgdGhl
IGNvbW1hbmRzDQo+IGd1aWx0IGlzIHJ1bm5pbmcpLg0KDQpUaGFua3MsIHRoYXQgc2VlbXMgdG8g
aGF2ZSBzb2x2ZWQgdGhpcyBwcm9ibGVtLiAgQnV0LCBJIGtlZXAgcnVubmluZyBpbnRvIG90aGVy
IGJ1aWxkIHByb2JsZW1zLiAgSSd2ZSBjaGVycnktcGlja2VkIGEgZmV3IGNvbW1pdHMgdG8gZml4
IGlzc3VlcyBzbyBmYXIsIGJ1dCBJJ20gZ2V0dGluZyBhIGZldyBtb3JlIHByb2JsZW1zIHRoYXQg
YXJlIGxlc3Mgb2J2aW91cy4gIEknZCBiZWVuIHdvcmtpbmcgb24gdXBkYXRpbmcgdG8gZGFpc3kg
YW5kIHdhcyBob3BpbmcgdG8gZ2V0IGR5bGFuIHRvIGJ1aWxkIG9uIHRoZSBuZXcgbGFwdG9wIGZp
cnN0IHRvIG1ha2Ugc3VyZSB0aGUgYnVpbHQgaW1hZ2UgZnVuY3Rpb25zIG9rYXkuICBJIG1heSBu
ZWVkIHRvIGdvIHRoZSBvdGhlciB3YXkgYXJvdW5kLi4uDQoNClRoYW5rcywNCkJyeWFuDQoNCj4g
DQo+IEJydWNlDQo+IA0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IEJyeWFuDQo+ID4gLS0NCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5l
bWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+IA0KPiANCj4gDQo+IC0tDQo+ICJUaG91IHNo
YWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3
YWl0IHRoZWUNCj4gYXQgaXRzIGVuZCINCg==

