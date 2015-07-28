Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B9C24762DB;
	Tue, 28 Jul 2015 08:48:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98976832"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 16:52:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S8kuaI020701;
	Tue, 28 Jul 2015 16:46:56 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Tue, 28 Jul 2015 16:48:46 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, Yocto discussion list
	<yocto@yoctoproject.org>
Thread-Topic: RE: [OE-core] glibc 2.22
Thread-Index: AdDJEe9PWkNDFU4aQfGK8b4NEJFlFw==
Date: Tue, 28 Jul 2015 08:48:46 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2E4B4@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: glibc 2.22
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
X-List-Received-Date: Tue, 28 Jul 2015 08:48:52 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KDQo+IGdsaWJjIDIuMjIgd2lsbCByZWxlYXNlIGVuZCBvZiB0aGlzIG1vbnRo
LiBGb3Igc29tZSB0aW1lIEkgaGF2ZSBwdXQgDQo+IHRvZ2V0aGVyIHRoZSB1cGRhdGUgaGVyZQ0K
PiANCj4gaHR0cDovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRy
aWIvY29tbWl0Lz9oPWtyYWovbQ0KPiBhc3RlciZpZD0wDQo+IDJlNzNlYTUyNmQ5NGYyMWM3ZWY4
MmViOTZiMDYyZWZmOGViYjgyNQ0KPiANCj4gSXQgd29ya3MgcHJldHR5IHdlbGwgZm9yIG1hY2hp
bmVzIEkgaGF2ZSB0ZXN0ZWQgaXQgb24gKCBhcm0veDg2ICkgYnV0IA0KPiB3b3VsZCBiZSBpbnRl
cmVzdGVkIGlmIG1vcmUgd2lkZXIgdHJpYWwgY291bGQgYmUgY2FycmllZCBvdXQgYW5kIA0KPiBp
c3N1ZXMgcmVwb3J0ZWQgYmV0d2VlbiBub3cgYW5kIHJlbGVhc2UgY2FuIGJlIGFkZHJlc3NlZC4N
Cj4gDQo+IFBsZWFzZSBnaXZlIGl0IGEgdHJ5IGlmIHlvdSBoYXZlIHNwYXJlIGN5Y2xlcw0KDQpJ
IHRlc3RlZCBpdCBvbiBwb3dlcnBjKGU1MDB2MiksYW5kIGRpZCBhIGx0cCB0ZXN0LiBJdCBkb2Vz
IHdvcmsgd2VsbC4NCg0KDQoNCkJlc3QgUmVnYXJkcw0KTGVpIE1hb2h1aQ0KDQoNCg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIA0KPiBLaGVtIFJhag0K
PiBTZW50OiBUdWVzZGF5LCBKdWx5IDE0LCAyMDE1IDE6MzcgQU0NCj4gVG86IFBhdGNoZXMgYW5k
IGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyOyBPcGVuRW1iZWRkZWQgDQo+IERl
dmVsIExpc3Q7IFlvY3RvIGRpc2N1c3Npb24gbGlzdA0KPiBTdWJqZWN0OiBbT0UtY29yZV0gZ2xp
YmMgMi4yMg0KPiANCj4gSGkgQWxsDQo+IA0KPiBnbGliYyAyLjIyIHdpbGwgcmVsZWFzZSBlbmQg
b2YgdGhpcyBtb250aC4gRm9yIHNvbWUgdGltZSBJIGhhdmUgcHV0IA0KPiB0b2dldGhlciB0aGUg
dXBkYXRlIGhlcmUNCj4gDQo+IGh0dHA6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRk
ZWQtY29yZS1jb250cmliL2NvbW1pdC8/aD1rcmFqL20NCj4gYXN0ZXImaWQ9MA0KPiAyZTczZWE1
MjZkOTRmMjFjN2VmODJlYjk2YjA2MmVmZjhlYmI4MjUNCj4gDQo+IEl0IHdvcmtzIHByZXR0eSB3
ZWxsIGZvciBtYWNoaW5lcyBJIGhhdmUgdGVzdGVkIGl0IG9uICggYXJtL3g4NiApIGJ1dCANCj4g
d291bGQgYmUgaW50ZXJlc3RlZCBpZiBtb3JlIHdpZGVyIHRyaWFsIGNvdWxkIGJlIGNhcnJpZWQg
b3V0IGFuZCANCj4gaXNzdWVzIHJlcG9ydGVkIGJldHdlZW4gbm93IGFuZCByZWxlYXNlIGNhbiBi
ZSBhZGRyZXNzZWQuDQo+IA0KPiBQbGVhc2UgZ2l2ZSBpdCBhIHRyeSBpZiB5b3UgaGF2ZSBzcGFy
ZSBjeWNsZXMNCj4gDQo+IFRoYW5rcw0KPiAtS2hlbQ0KPiANCg0K

