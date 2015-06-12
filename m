Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD467595E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 09:23:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96918223"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2015 17:27:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5C9Lpwr009817;
	Fri, 12 Jun 2015 17:21:51 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Fri, 12 Jun 2015 17:23:33 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Anders Darander <anders@chargestorm.se>
Thread-Topic: [OE-core] [PATCH] curl: Modify PACKAGECONFIG to enable openssl
Thread-Index: AQHQpOncN5c/NWMpZkynlw0rYOWxBZ2ol0AQ
Date: Fri, 12 Jun 2015 09:23:23 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E873907D83@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20150612082902.GA23164@ad.chargestorm.se>
In-Reply-To: <20150612082902.GA23164@ad.chargestorm.se>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.85]
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
X-List-Received-Date: Fri, 12 Jun 2015 09:23:33 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kZXJzIERhcmFuZGVy
IFttYWlsdG86YW5kZXJzQGNoYXJnZXN0b3JtLnNlXQ0KPiBTZW50OiBGcmlkYXksIEp1bmUgMTIs
IDIwMTUgNDoyOSBQTQ0KPiBUbzogTGksIFhpbi/mnY4g5qyjDQo+IENjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIXSBjdXJsOiBNb2RpZnkgUEFDS0FHRUNPTkZJRyB0byBlbmFibGUgb3BlbnNzbA0KPiANCj4g
KiBMaSB4aW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+IFsxNTA2MTIgMDU6NDFdOg0KPiAN
Cj4gPiBFbmFibGVkIG9wZW5zc2wgZGVmYWx1dGx5IHRvIHVzZSBodHRwcywganVzdCBsaWtlIFVi
dW50dSBhbmQgUmVkIEhhdCBkby4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTGkgWGluIDxsaXhp
bi5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4gPiAtUEFDS0FHRUNPTkZJRyA/
Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCJESVNUUk9fRkVBVFVSRVMiLCAiaXB2NiIsICJpcHY2
IiwNCj4gIiIsIGQpfSBnbnV0bHMgemxpYiINCj4gPiArUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJi
LnV0aWxzLmNvbnRhaW5zKCJESVNUUk9fRkVBVFVSRVMiLCAiaXB2NiIsICJpcHY2IiwNCj4gIiIs
IGQpfSBzc2wgemxpYiINCj4gDQo+IEkgdGhpbmsgeW91IG5lZWQgdG8gbW90aXZhdGUgd2h5IHlv
dSdyZSBjaGFuZ2luZyBmcm9tIGdudXRscyB0byBzc2wNCj4gKG9wZW5zc2wpIGhlcmUuDQoNCj4g
Tm90IHRoYXQgSSdtIHBlcnNvbmFsbHkgYWdhaW5zdCBpdC4gSSd2ZSBvY2Nhc2lvbmFsbHkgZG9u
ZSB0aGUgc2FtZSB0aGluZyBsb2NhbGx5LiBCdXQNCj4gdGhpcyBpcyBhIGNoYW5nZSBvZiB0aGUg
ZGVmYXVsdHMsIGFuZCB0aGUgZGVmYXVsdCBkZXBlbmRlbmNpZXMuIFRodXMsIGl0IG5lZWRzIHRv
DQo+IGhhdmUgYSBnb29kIG1vdGl2YXRpb24uDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4N
ClllcywgdGhlIG1vdGl2YXRpb24gaXMgbm90IGNsZWFyIGhlcmUuIEkgd2lsbCBkbyBzb21lIGFk
ZGl0aW9uYWwgdGVzdCBhbmQgdGhlbiBhZGQgbXVjaCBtb3JlIGNvbW1lbnRzLg0KIA0KPiA+ICBQ
QUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZSA9ICJpcHY2IHNzbCB6bGliIg0KPiA+ICBQQUNLQUdF
Q09ORklHX2NsYXNzLW5hdGl2ZXNkayA9ICJpcHY2IHNzbCB6bGliIg0KPiANCj4gPiBAQCAtMzYs
NiArMzYsNyBAQCBFWFRSQV9PRUNPTkYgPSAiLS13aXRob3V0LWxpYmlkbiBcDQo+ID4gICAgICAg
ICAgICAgICAgICAtLWRpc2FibGUtbGRhcCBcDQo+ID4gICAgICAgICAgICAgICAgICAtLWRpc2Fi
bGUtbGRhcHMgXA0KPiA+DQo+ID4gLS13aXRoLWNhLWJ1bmRsZT0ke3N5c2NvbmZkaXJ9L3NzbC9j
ZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0IFwNCj4gPiArICAgICAgICAgICAgICAgIC0td2l0aC1s
aWJzc2gyIFwNCj4gDQo+IE5BQ0suDQo+IA0KPiBXZSBoYXZlIGEgUEFDS0FHRUNPTkZJRyBmw7Zy
IGxpYnNzaDIsIHdoaWNoIGRlZmF1bHRzIHRvIG9mZi4gRG8gL25vdC8gZW5hYmxlIGl0DQo+IGRp
cmVjdGx5IGluIEVYVFJBX09FQ09ORi4gVGhpcyB3aWxsIGJyZWFrIGJ1aWxkcyAoYXQgbGVhc3Qg
dGhlIGRldGVybWluaXNtIG9mDQo+IGJ1aWxkcykuDQoNCk1heSBiZSBpdCBpcyBub3QgcmlnaHQu
DQpJIHdpbGwgc2VuZCBwYXRjaCBWMi4NCg0KQ2hlZXJzLA0KTGkgeGluDQoNCg0K

