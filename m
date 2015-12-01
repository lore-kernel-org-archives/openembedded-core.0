Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D29BD60589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 20:27:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2015 12:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,370,1444719600"; d="scan'208";a="864458166"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2015 12:27:31 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 1 Dec 2015 12:27:31 -0800
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.39]) by
	fmsmsx124.amr.corp.intel.com ([169.254.1.61]) with mapi id
	14.03.0248.002; Tue, 1 Dec 2015 12:27:31 -0800
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Replace busybox for variable.
Thread-Index: AQHRKHkSqfVMJbHY1Ui8eaderhCRw563IpUA
Date: Tue, 1 Dec 2015 20:27:30 +0000
Message-ID: <1449001654.4987.7.camel@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
	<1448562857.29924.16.camel@intel.com>
In-Reply-To: <1448562857.29924.16.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.128.81]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Replace busybox for variable.
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
X-List-Received-Date: Tue, 01 Dec 2015 20:27:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F72885CD67DE4642BD7A2E8BA00E1EE3@intel.com>
Content-Transfer-Encoding: base64

cGluZw0KT24ganVlLCAyMDE1LTExLTI2IGF0IDE4OjM0ICswMDAwLCBKb3lhIENydXosIEFsZWph
bmRybyB3cm90ZToNCj4gQW55IGZlZWRiYWNrIGFib3V0IHRoaXM/DQo+IA0KPiBPbiBtYXIsIDIw
MTUtMTEtMTcgYXQgMTY6MTMgLTA2MDAsIEFsZWphbmRybyBKb3lhIHdyb3RlOg0KPiA+IFRoZXNl
IHJlY2lwZXMgaGF2ZSBhIGhhcmRjb2RlZCBkZXBlbmRlbmN5IHRvIGJ1c3lib3gsDQo+ID4gaW4g
b3JkZXIgdG8gYmUgYWJsZSB0byBoYXZlIGEgZmxleGlibGUgc2VsZWN0aW9uLA0KPiA+IGluc3Rl
YWQgb2YgdGhlIGhhcmRjb2RlZCBkZXBlbmRlbmN5LCBub3cgaXQgaXMgcG9pbnQgdG8gIHZpcnR1
YWwgcmVmZXJlbmNlDQo+ID4gYmFzZS11dGlscy4NCj4gPiANCj4gPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IDZmOThjMzk0MThjNjBiN2MwYjI1YjMwOTgzZDJlNTI1NzE1OGE2
YTQ6DQo+ID4gDQo+ID4gICBnY2M6IERyb3AgNC44ICgyMDE1LTExLTE2IDE0OjU5OjA3ICswMDAw
KQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Og0KPiA+
IA0KPiA+ICAgZ2l0Oi8vZ2l0aHViLmNvbS9Bam95YWNyL29wZW5lbWJlZGRlZC1jb3JlIGJhc2Ut
dXRpbHMNCj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9Bam95YWNyL29wZW5lbWJlZGRlZC1jb3Jl
L3RyZWUvYmFzZS11dGlscw0KPiA+IA0KPiA+IEFsZWphbmRybyBKb3lhICg0KToNCj4gPiAgIGJh
c2UtdXRpbHM6ZmxleGlibGUgZGVwZW5kZW5jeSBmb3IgY29tbWFuZCB1dGlsaXRpZXMNCj4gPiAg
IGNvcmUtaW1hZ2UtbWluaW1hbC1pbml0cmFtZnM6IHJlcGxhY2UgYmFzZS11dGlscw0KPiA+ICAg
aW5pdHJhbWZzLWZyYW1ld29ya18xLjA6cmVwbGFjZSBidXN5Ym94IGZvciB2YXJpYWJsZS4NCj4g
PiAgIHBhY2thZ2Vncm91cC1jb3JlLWJvb3Q6cmVwbGFjZSBidXN5Ym94IHRvIHZhcmlhYmxlDQo+
ID4gDQo+ID4gIG1ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9kZWZhdWx0LXByb3ZpZGVycy5pbmMg
ICAgICAgICAgICAgfCAzICsrKw0KPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29yZS1p
bWFnZS1taW5pbWFsLWluaXRyYW1mcy5iYiAgIHwgMiArLQ0KPiA+ICBtZXRhL3JlY2lwZXMtY29y
ZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1mcmFtZXdvcmtfMS4wLmJiIHwgMiArLQ0KPiA+ICBt
ZXRhL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLWJvb3QuYmIg
IHwgNCArKy0tDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IC0tIA0KPiA+IDIuMS4wDQo+ID4gDQo+IA0KDQo=

