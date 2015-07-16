Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 577716E648
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 03:54:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98503487"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2015 11:57:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6G3qK1f003182;
	Thu, 16 Jul 2015 11:52:20 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 16 Jul 2015 11:54:05 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Anders Darander <anders@chargestorm.se>
Thread-Topic: [OE-core] [PATCH] curl: Modify PACKAGECONFIG to enable openssl
Thread-Index: AQHQpOncN5c/NWMpZkynlw0rYOWxBZ3doZxA
Date: Thu, 16 Jul 2015 03:54:04 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390E153@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20150612082902.GA23164@ad.chargestorm.se>
In-Reply-To: <20150612082902.GA23164@ad.chargestorm.se>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Modify PACKAGECONFIG to enable openssl
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
X-List-Received-Date: Thu, 16 Jul 2015 03:54:14 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZGVycw0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbGF5Lg0KDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBjdXJsOiBNb2RpZnkgUEFDS0FHRUNPTkZJRyB0byBlbmFibGUgb3Bl
bnNzbA0KPiANCj4gKiBMaSB4aW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+IFsxNTA2MTIg
MDU6NDFdOg0KPiANCj4gPiBFbmFibGVkIG9wZW5zc2wgZGVmYWx1dGx5IHRvIHVzZSBodHRwcywg
anVzdCBsaWtlIFVidW50dSBhbmQgUmVkIEhhdCBkby4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
TGkgWGluIDxsaXhpbi5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4gPiAtUEFD
S0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCJESVNUUk9fRkVBVFVSRVMiLCAi
aXB2NiIsICJpcHY2IiwNCj4gIiIsIGQpfSBnbnV0bHMgemxpYiINCj4gPiArUEFDS0FHRUNPTkZJ
RyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCJESVNUUk9fRkVBVFVSRVMiLCAiaXB2NiIsICJp
cHY2IiwNCj4gIiIsIGQpfSBzc2wgemxpYiINCj4gDQo+IEkgdGhpbmsgeW91IG5lZWQgdG8gbW90
aXZhdGUgd2h5IHlvdSdyZSBjaGFuZ2luZyBmcm9tIGdudXRscyB0byBzc2wNCj4gKG9wZW5zc2wp
IGhlcmUuDQo+IA0KPiBOb3QgdGhhdCBJJ20gcGVyc29uYWxseSBhZ2FpbnN0IGl0LiBJJ3ZlIG9j
Y2FzaW9uYWxseSBkb25lIHRoZSBzYW1lIHRoaW5nIGxvY2FsbHkuIEJ1dA0KPiB0aGlzIGlzIGEg
Y2hhbmdlIG9mIHRoZSBkZWZhdWx0cywgYW5kIHRoZSBkZWZhdWx0IGRlcGVuZGVuY2llcy4gVGh1
cywgaXQgbmVlZHMgdG8NCj4gaGF2ZSBhIGdvb2QgbW90aXZhdGlvbi4NCg0KVGhlIG1vdGl2YXRp
b24gaXMgYXMgZm9sbG93aW5nOg0KQ3VybCBkZXBlbmRzIG9uIGdudXRscyBhbmQgZ251dGxzIGRl
cGVuZHMgb24gZ21wLCBidXQgdGhlIExJQ0VOU0Ugb2YgZ21wIGlzIExHUEx2My4NCklmIHRoZSB1
c2VycyBkbyBub3Qgd2FudCB0byB1c2UgdGhlIExHUEx2MyByZWNpcGVzKHRoZSBycG0gb2YgZ21w
IGlzIG5vdCBiZSBpbnN0YWxsZWQpLCB0aGVyZSB3aWxsIGJlIGFuIGVycm9yIHdoZW4gdXNpbmcg
aHR0cHMuDQpTdWNoIGFzOg0KLS0tLS0tLS0tLS0tLS0tLQ0KIyBjdXJsIC1rIGh0dHBzOi8vMTky
LjE2OC4yNDYuMQ0KY3VybDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQgbGlicmFyaWVzOiBs
aWJnbXAuc28uMTA6IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmlsZTogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeSANCi0tLS0tLS0tLS0tLS0tLS0NCkJ1dCBhZnRlciBjaGFuZ2luZyBnbnV0
bHMgdG8gc3NsIGluIFBBQ0tBR0VDT05GSUcsIHRoZXJlIHdpbGwgYmUgbm8gZXJyb3JzLg0KDQo+
IA0KPiA+ICBQQUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZSA9ICJpcHY2IHNzbCB6bGliIg0KPiA+
ICBQQUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZXNkayA9ICJpcHY2IHNzbCB6bGliIg0KPiANCj4g
PiBAQCAtMzYsNiArMzYsNyBAQCBFWFRSQV9PRUNPTkYgPSAiLS13aXRob3V0LWxpYmlkbiBcDQo+
ID4gICAgICAgICAgICAgICAgICAtLWRpc2FibGUtbGRhcCBcDQo+ID4gICAgICAgICAgICAgICAg
ICAtLWRpc2FibGUtbGRhcHMgXA0KPiA+DQo+ID4gLS13aXRoLWNhLWJ1bmRsZT0ke3N5c2NvbmZk
aXJ9L3NzbC9jZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0IFwNCj4gPiArICAgICAgICAgICAgICAg
IC0td2l0aC1saWJzc2gyIFwNCj4gDQo+IE5BQ0suDQo+IA0KPiBXZSBoYXZlIGEgUEFDS0FHRUNP
TkZJRyBmw7ZyIGxpYnNzaDIsIHdoaWNoIGRlZmF1bHRzIHRvIG9mZi4gRG8gL25vdC8gZW5hYmxl
IGl0DQo+IGRpcmVjdGx5IGluIEVYVFJBX09FQ09ORi4gVGhpcyB3aWxsIGJyZWFrIGJ1aWxkcyAo
YXQgbGVhc3QgdGhlIGRldGVybWluaXNtIG9mDQo+IGJ1aWxkcykuDQo+IA0KWWVzLg0KRW5hYmxp
bmcgLXdpdGgtbGlic3NoMiBpbiBFWFRSQV9PRUNPTkYgaXMgbm90IHJpZ2h0Lg0KTXkgZ29hbCBp
cyB0byBsZXQgc2Z0cCBzdXBwb3J0ZWQgYnkgY3VybCwgYnkgYWRkaW5nIGxpYnNzaDIgaW4gUEFD
S0FHRUNPTkZJRy4NCkJ1dCBsaWJzc2gyIGlzIG5vdCBpbiBPRS1jb3JlIGJ5IGRlZmF1bHQuIA0K
QW5kIEkgdGhpbmsgdGhlcmUgbWF5IGJlIHNvbWVvbmUgZWxzZSB3YW50IHRvIHVzZSBsaWJzc2gy
Lg0KU28gaG93IGFib3V0IG1vdmluZyBsaWJzc2gyIHJlY2lwZSBmcm9tIE1ldGEtb2UgdG8gT0Ut
Y29yZT8gOikNCg0KVGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KUmVnYXJkcywNCkxpDQoNCg==

