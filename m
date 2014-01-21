Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0187.outbound.protection.outlook.com [207.46.163.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4046E708
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:39:16 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	DM2PR03MB397.namprd03.prod.outlook.com (10.141.84.139) with Microsoft
	SMTP Server (TLS) id 15.0.847.13; Tue, 21 Jan 2014 17:39:15 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0847.008; Tue, 21 Jan 2014 17:39:15 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0A==
Date: Tue, 21 Jan 2014 17:39:14 +0000
Message-ID: <3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
In-Reply-To: <1390044007.14987.151.camel@ted>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0098BA6C6C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(199002)(189002)(24454002)(13464003)(377424004)(71364002)(377454003)(51704005)(76786001)(79102001)(47446002)(74662001)(74502001)(56776001)(81542001)(59766001)(77982001)(76576001)(81342001)(76796001)(65816001)(74706001)(66066001)(80022001)(74876001)(63696002)(69226001)(56816005)(74366001)(74316001)(81816001)(85852003)(47736001)(51856001)(49866001)(81686001)(53806001)(47976001)(83072002)(50986001)(4396001)(46102001)(2656002)(87936001)(19580405001)(93136001)(80976001)(54316002)(33646001)(31966008)(92566001)(93516002)(76482001)(86362001)(90146001)(19580395003)(83322001)(54356001)(87266001)(85306002)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB397;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
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
X-List-Received-Date: Tue, 21 Jan 2014 17:39:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClllcywgdGhlIGdjYyBjb25maWd1cmVkIGZvciBTUEUgKC0tdGFyZ2V0PXBvd2VycGMt
ZnNsX25ldHdvcmtpbmctbGludXgtZ251c3BlKQ0KY2FuIGdlbmVyYXRlIGJvdGggU1BFIGFuZCBu
b24tU1BFIGNvZGUgcHJvdmlkZWQgdGhhdCBzb2Z0d2FyZSANCmZsb2F0aW5nIHBvaW50IGlzIHVz
ZWQuDQoNClRoZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXJhbWV0ZXJzICgtbWFiaT1uby1zcGUgLW1u
by1zcGUpIHRoYXQgd2lsbCB0dXJuDQpvZmYgU1BFIHZlY3RvciBpbnN0cnVjdGlvbnMgZ2VuZXJh
dGlvbi4gSWYgdGhlIGNvZGUgY29udGFpbnMgZmxvYXRpbmcNCnBvaW50IGFyaXRobWV0aGljIC1t
c29mdC1mbG9hdCBuZWVkcyB0byBiZSB1c2VkIGFzIHdlbGwuIFRoaXMgbWVhbnMgdGhhdA0KdGhl
IEdDQyBtdWx0aWxpYiBzZXR1cCBoYXMgdG8gYmUgY29uZmlndXJlZCB0byBpbmNsdWRlIHNvZnQg
ZmxvYXQgYW5kDQpidWlsZCBjb3Jlc3BvbmRpbmcgdmVyc2lvbiBvZiBsaWJnY2MgYW5kIHRhcmdl
dCBmcmFnbWVudHMuDQpCdXQgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZ2VuZXJhdGUgY29kZSB3aXRo
b3V0IFNQRSBmb3IgZTUwMHYxL3YyPyANClNvZnQtZmxvYXQgY29tZXMgd2l0aCBhIG1ham9yIHBl
cmZvcm1hbmNlIHBlbmFsdHkuDQoNCk1heWJlIEkgZGlkbid0IHVuZGVyc3RhbmQgY29ycmVjdGx5
IHdoYXQga2luZCBvZiB0b29sY2hhaW4geW91IHdhbnQgdG8NCmJlIGJ1aWx0IGluIHRoZSBlbmQu
IERvIHlvdSB3YW50IHRvIGhhdmUgYSBzaW5nbGUgR0NDIHRoYXQgYnVpbGRzIGFsbA0KcG93ZXJw
YyB0YXJnZXRzIChlNTAwdjIsIGU1NTAwLCBlNjUwMCBldGMpIGFuZCBhIHNlcGFyYXRlIHN5c3Jv
b3QgZm9yIGVhY2ggDQp0YXJnZXQ/IA0KVGhpcyBtYXkgYmUgcHJvYmxlbWF0aWMgc2luY2UsIGZv
ciBleGFtcGxlLCB0aGUgY29tcGlsZXIgdGhhdCBjYW4gZ2VuZXJhdGUgDQpTUEUgKGZvciBlNTAw
djIpIGNhbid0IGdlbmVyYXRlIGFsdGl2ZWMgaW5zdHJ1Y3Rpb25zIChmb3IgZTY1MDApLg0KDQpL
aW5kIHJlZ2FyZHMsDQpBbGV4DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmddDQo+IFNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDE4LCAyMDE0IDE6MjAgUE0NCj4gVG86
IFNhcmRhbiBBbGV4YW5kcnUgQ2V6YXItQjQxNzAwDQo+IENjOiBEYXZpZCBOeXN0csO2bTsgTHVv
IFpoZW5odWEtQjE5NTM3OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gUmV2ZXJ0ICJjcm9zcy1jYW5h
ZGlhbjogSGFuZGxlIHBvd2VycGMNCj4gbGludXggdmVyc2VzIGxpbnV4LWdudXNwZSINCj4gDQo+
IE9uIEZyaSwgMjAxNC0wMS0xNyBhdCAxNDo0MyArMDAwMCwgYWxleGFuZHJ1LnNhcmRhbkBmcmVl
c2NhbGUuY29tIHdyb3RlOg0KPiA+IGU1MDB2MS92MiB1c2VzIFNQRSB0byBoYW5kbGUgZmxvYXRp
bmcgcG9pbnQgb3BlcmF0aW9ucw0KPiA+IHVzaW5nIGdlbmVyYWwgcHVycG9zZSByZWdzLg0KPiA+
IFNvIHVzaW5nIHRoZSBub24tU1BFIGNvbXBpbGVyIHdpdGggU1BFIGxpYnJhcmllcyB3b24ndCB3
b3JrLg0KPiA+IEhvd2V2ZXIgdGhlIHNvZnQtZnAgbGlicmFyaWVzIGFyZSBjb21wYXRpYmxlIHdp
dGggdGhlIGU1MDANCj4gPiBBQkkgKHdpdGggYSBjb25zaWRlcmFibGUgcGVyZm9ybWFuY2UgcGVu
YWx0eSkuDQo+ID4NCj4gPiBGcm9tIHdoYXQgSSBjYW4gc2VlLCBlZ2xpYmMgaXMgYnVpbHQgd2l0
aCBTUEUuIFNvIEdDQyBzaG91bGQNCj4gPiBiZSBidWlsdCBhbHNvIGZvciBTUEUgKHRhcmdldCBw
b3dlcnBjLXBva3ktbGludXgtZ251c3BlKS4NCj4gDQo+IFRoZSBrZXkgcXVlc3Rpb24gaXMgdGhp
czoNCj4gDQo+IENhbiBvbmUgZ2NjIGJpbmFyeSBnZW5lcmF0ZSBjb2RlIGZvciBib3RoIG5vbi1T
UEUgYW5kIFNQRSB0YXJnZXRzLA0KPiBhc3N1bWluZyBpdHMgcG9pbnRlZCBhdCBhbiBhcHByb3By
aWF0ZSBzeXNyb290IGNvbnRhaW5pbmcgYXBwcm9wcmlhdGUNCj4gbGlicmFyaWVzPw0KPiANCj4g
SWYgd2UgY2FuIGhhdmUgb25lIHN1Y2ggYmluYXJ5LCBob3cgZG8gd2UgY29uZmlndXJlIGl0PyBJ
ZiB3ZSBjYW4ndCwgd2UNCj4gbmVlZCB0byByZWRvIHRoZSB3YXkgZ2NjLWNyb3NzLWNhbmFkaWFu
IGlzIHdvcmtpbmcgb24gcG93ZXJwYy4NCj4gDQo+IFRoZSBjaGFuZ2UgdGhlcmUgd2FzIHRvIGhh
dmUgb25lIGdjYyBmb3IgZWFjaCBkaWZmZXJlbnQgdGFyZ2V0DQo+IGFyY2hpdGVjdHVyZSByYXRo
ZXIgdGhhbiBlYWNoICJ0dW5lIiBzaW5jZSB0aGF0IHdhcyBob3JyaWJseQ0KPiBpbmVmZmljaWVu
dC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KPiANCj4gDQoNCg==

