Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B53B46FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:48:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2015 12:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,434,1444719600"; d="scan'208";a="861431551"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2015 12:48:34 -0800
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 15 Dec 2015 12:48:34 -0800
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.39]) by
	FMSMSX154.amr.corp.intel.com ([10.18.116.70]) with mapi id
	14.03.0248.002; Tue, 15 Dec 2015 12:48:33 -0800
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Replace busybox for variable.
Thread-Index: AQHRKHkSqfVMJbHY1Ui8eaderhCRw563IpUAgBYGjYA=
Date: Tue, 15 Dec 2015 20:48:33 +0000
Message-ID: <1450212523.7482.5.camel@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
	<1448562857.29924.16.camel@intel.com>
	<1449001654.4987.7.camel@intel.com>
In-Reply-To: <1449001654.4987.7.camel@intel.com>
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
X-List-Received-Date: Tue, 15 Dec 2015 20:48:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <707B4924EF49474599DAE7EBDAEF2203@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KQUoNCk9uIG1hciwgMjAxNS0xMi0wMSBhdCAyMDoyNyArMDAwMCwgSm95YSBDcnV6LCBB
bGVqYW5kcm8gd3JvdGU6DQo+IHBpbmcNCj4gT24ganVlLCAyMDE1LTExLTI2IGF0IDE4OjM0ICsw
MDAwLCBKb3lhIENydXosIEFsZWphbmRybyB3cm90ZToNCj4gPiBBbnkgZmVlZGJhY2sgYWJvdXQg
dGhpcz8NCj4gPiANCj4gPiBPbiBtYXIsIDIwMTUtMTEtMTcgYXQgMTY6MTMgLTA2MDAsIEFsZWph
bmRybyBKb3lhIHdyb3RlOg0KPiA+ID4gVGhlc2UgcmVjaXBlcyBoYXZlIGEgaGFyZGNvZGVkIGRl
cGVuZGVuY3kgdG8gYnVzeWJveCwNCj4gPiA+IGluIG9yZGVyIHRvIGJlIGFibGUgdG8gaGF2ZSBh
IGZsZXhpYmxlIHNlbGVjdGlvbiwNCj4gPiA+IGluc3RlYWQgb2YgdGhlIGhhcmRjb2RlZCBkZXBl
bmRlbmN5LCBub3cgaXQgaXMgcG9pbnQgdG8gIHZpcnR1YWwgcmVmZXJlbmNlDQo+ID4gPiBiYXNl
LXV0aWxzLg0KPiA+ID4gDQo+ID4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDZmOThjMzk0MThjNjBiN2MwYjI1YjMwOTgzZDJlNTI1NzE1OGE2YTQ6DQo+ID4gPiANCj4gPiA+
ICAgZ2NjOiBEcm9wIDQuOCAoMjAxNS0xMS0xNiAxNDo1OTowNyArMDAwMCkNCj4gPiA+IA0KPiA+
ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4gPiANCj4gPiA+
ICAgZ2l0Oi8vZ2l0aHViLmNvbS9Bam95YWNyL29wZW5lbWJlZGRlZC1jb3JlIGJhc2UtdXRpbHMN
Cj4gPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL0Fqb3lhY3Ivb3BlbmVtYmVkZGVkLWNvcmUvdHJl
ZS9iYXNlLXV0aWxzDQo+ID4gPiANCj4gPiA+IEFsZWphbmRybyBKb3lhICg0KToNCj4gPiA+ICAg
YmFzZS11dGlsczpmbGV4aWJsZSBkZXBlbmRlbmN5IGZvciBjb21tYW5kIHV0aWxpdGllcw0KPiA+
ID4gICBjb3JlLWltYWdlLW1pbmltYWwtaW5pdHJhbWZzOiByZXBsYWNlIGJhc2UtdXRpbHMNCj4g
PiA+ICAgaW5pdHJhbWZzLWZyYW1ld29ya18xLjA6cmVwbGFjZSBidXN5Ym94IGZvciB2YXJpYWJs
ZS4NCj4gPiA+ICAgcGFja2FnZWdyb3VwLWNvcmUtYm9vdDpyZXBsYWNlIGJ1c3lib3ggdG8gdmFy
aWFibGUNCj4gPiA+IA0KPiA+ID4gIG1ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9kZWZhdWx0LXBy
b3ZpZGVycy5pbmMgICAgICAgICAgICAgfCAzICsrKw0KPiA+ID4gIG1ldGEvcmVjaXBlcy1jb3Jl
L2ltYWdlcy9jb3JlLWltYWdlLW1pbmltYWwtaW5pdHJhbWZzLmJiICAgfCAyICstDQo+ID4gPiAg
bWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFtZnMtZnJhbWV3b3JrXzEuMC5i
YiB8IDIgKy0NCj4gPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vn
cm91cC1jb3JlLWJvb3QuYmIgIHwgNCArKy0tDQo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IC0tIA0KPiA+ID4gMi4x
LjANCj4gPiA+IA0KPiA+IA0KPiANCg0K

