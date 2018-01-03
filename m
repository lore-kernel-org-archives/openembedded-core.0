Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFB071A70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 21:46:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w03LkjW9003932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 3 Jan 2018 13:46:45 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Wed, 3 Jan 2018 13:46:45 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "BURTON, ROSS"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] allarch: do not set baselib
Thread-Index: AQHThARjR6grYLgFPUa4zUtmTfLc3aNhtOQAgACm6YCAAFH4YA==
Date: Wed, 3 Jan 2018 21:46:44 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84D87A7007@ALA-MBC.corp.ad.wrs.com>
References: <20180102200049.44793-1-jslater@windriver.com>
	<1514933138.5525.101.camel@linuxfoundation.org>
	<e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
In-Reply-To: <e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Wed, 03 Jan 2018 21:46:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5LCB3ZSBkbyBoYXZlIHRvIHByb3ZpZGUgcWVtdXdyYXBwZXIgd2l0aCBMRF9MSUJS
QVJZX1BBVEguICBXZSBjb3VsZCBoYXJkLWNvZGUgYWxsIHBvc3NpYmxlIHBhdGhzIGludG8gdGhh
dCBhbmQgbm90IHVzZSAke2xpYmRpcn0gYW5kICR7YmFzZV9saWJkaXJ9LiAgKEkgdHJpZWQgaXQg
YW5kIGl0IHdvcmtzLikgIFdlIGNvdWxkIGFsc28gY3JlYXRlIGEgY291cGxlIG9mIG5ldyB2YXJp
YWJsZXMsIGxpa2Ugb3JpZ2luYWxfYmFzZV9saWJkaXIsIHRoYXQgZG9uJ3QgZ2V0IGNsb2JiZXJl
ZCBieSBhbGxhcmNoLiAgIE1heWJlIHFlbXV3cmFwcGVyIHNob3VsZCBiZSBzbWFydCBlbm91Z2gg
dG8gY29tcHV0ZSBMRF9MSUJSQVJZX1BBVEguLi4NCg0KSm9lDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5rYW5h
dmluQGxpbnV4LmludGVsLmNvbV0gDQpTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMDMsIDIwMTgg
MTI6NDMgQU0NClRvOiBSaWNoYXJkIFB1cmRpZTsgU2xhdGVyLCBKb3NlcGg7IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEJVUlRPTiwgUk9TUw0KU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbb2UtY29yZV1bUEFUQ0ggMS8xXSBhbGxhcmNoOiBkbyBub3Qgc2V0IGJhc2Vs
aWINCg0KT24gMDEvMDMvMjAxOCAxMjo0NSBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IFNv
cnJ5LCBidXQgSSBkb24ndCB0aGluayB0aGlzIGNhbiB3b3JrIDovLg0KPiANCj4gRG8gdGhlIHNz
dGF0ZSBzaWcgc2VsZnRlc3RzIHBhc3Mgd2l0aCB0aGlzIGNoYW5nZT8NCj4gDQo+IEkgYXBwcmVj
aWF0ZSB0aGlzIHdpbGwgbWFrZSBzb21lIHRoaW5ncyAid29yayIgYnV0IGl0IHdpbGwgbWVhbiB0
aGF0IA0KPiBhbGxhcmNoIHBhY2thZ2VzIHJlYnVpbGQgZm9yIGVhY2ggYXJjaGl0ZWN0dXJlIG9y
IG11bHRpbGliIGFuZCB0aGF0IA0KPiBpc24ndCByaWdodCBlaXRoZXIuDQo+IA0KPiBTbyB3ZSBu
ZWVkIGEgYmV0dGVyIHNvbHV0aW9uIGhlcmUuIFdoeSBkbyB3ZSBuZWVkIGxpYmRpciBwYXRocyB0
byBydW4gDQo+IGJpbmFyaWVzIGFueXdheT8gSXMgdGhpcyBhIGxpYmV4ZWMgaXNzdWU/IFBlcmhh
cHMgdGhlIHRoaW5ncyBpbiANCj4gcXVlc3Rpb24gc2hvdWxkbid0IGJlIGFsbGFyY2g/DQoNCkkg
dGhpbmsgUm9zcyBoYXMgc3BlbnQgc29tZSB0aW1lIGRldmVsb3BpbmcgYSBmaXggZm9yIHRoaXMg
c2FtZSBpc3N1ZSwgcGVyaGFwcyBoZSBjYW4gY2hpbWUgaW4/DQoNCkFsZXgNCg==

