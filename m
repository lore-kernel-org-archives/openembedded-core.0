Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A9F7672F30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 19:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DCC812E281;
	Fri,  3 Mar 2017 20:52:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Zdor6qop+EGF; Fri,  3 Mar 2017 20:52:36 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 640812E134;
	Fri,  3 Mar 2017 20:52:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54BDE1A064;
	Fri,  3 Mar 2017 20:52:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49C8A1A062;
	Fri,  3 Mar 2017 20:52:35 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  3 Mar 2017 20:52:35 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 3DA79448;
	Fri,  3 Mar 2017 20:52:35 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 3 Mar 2017 20:52:35 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 3 Mar 2017 20:52:35 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Thread-Topic: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify needed
	dependencies
Thread-Index: AQHSlDqPV6dQtLQzV0mTn7k3g609c6GDfTXA
Date: Fri, 3 Mar 2017 19:52:34 +0000
Message-ID: <aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
In-Reply-To: <CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Fri, 03 Mar 2017 19:52:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXggS3J1bW1lbmFjaGVyIFtt
YWlsdG86bWF4Lm9zcy4wOUBnbWFpbC5jb21dDQo+IFNlbnQ6IGRlbiAzIG1hcnMgMjAxNyAxNzoy
NA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IENjOiBPRS1jb3JlDQo+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIdjMgMC81XSBBZGQgZHVtbXkgdG9vbHMgdG8gaGVscCBpZGVudGlm
eQ0KPiBuZWVkZWQgZGVwZW5kZW5jaWVzDQo+IA0KPiBIaQ0KPiANCj4gMjAxNy0wMy0wMyAxMjox
NyBHTVQrMDE6MDAgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+Og0KPiANCj4gPiBUbyBjaXJjdW12ZW50IHRoaXMsIEkgY3JlYXRlZCBkdW1teSB2ZXJz
aW9ucyBvZiB0aGUgdG9vbHMgdGhhdCBhbHdheXMNCj4gPiBmYWlsIGFuZCBwbGFjZWQgdGhlbSBp
biB0aGUgc2NyaXB0cyBkaXJlY3RvcnkuIFRodXMsIGlmIHRoZSByZWFsIHRvb2wNCj4gPiBoYXMg
bm90IGJlZW4gaW5zdGFsbGVkIGluIHRoZSBSU1MsIHRoZSBkdW1teSB2ZXJzaW9uIGlzIHVzZWQg
YW5kIHRoZQ0KPiA+IGJ1aWxkIGZhaWxzLiBGb3IgZ29vZCBtZWFzdXJlcyBJIGV2ZW4gb3V0cHV0
IGEgbWVzc2FnZSB0aGF0IHNheXMgd2hhdA0KPiA+IG5lZWRzIHRvIGJlIGNvcnJlY3RlZCBpbiB0
aGUgcmVjaXBlLg0KPiA+DQo+ID4gSW5jbHVkZWQgaXMgYWxzbyBhbiB1cGRhdGUgdG8gbGludXgt
bGliYy1oZWFkZXJzIGFzIGl0IGFwcGFyZW50bHkNCj4gPiBuZWVkcyB0byBpbmhlcml0IHBrZ2Nv
bmZpZywgd2hpY2ggdGhlIGludHJvZHVjdGlvbiBvZiB0aGUgZHVtbXkNCj4gPiB2ZXJzaW9uIG9m
IHBrZy1jb25maWcgc2hvd2VkLg0KPiA+DQo+IA0KPiBJIHRyaWVkIHRoZSB3aG9sZSBzZXJpZXMs
IGkuZS4gYXBwbGllZCBvbiB0b3Agb2Ygb3BlbmVtYmVkZGVkLWNvcmUsDQo+IDIwYzZlODcgYW5k
IGJpdGJha2UgNmZlMDdlZC4NCj4gDQo+IFRoZSByZXN1bHRpbmcgYnVpbGQgZmFpbGVkIGluIGxp
bnV4LWxpYmMtaGVhZGVycyBiZWNhdXNlIGl0IHBpY2tlZCB1cA0KPiB0aGUgZHVtbXkgc2NyaXB0
IGluc3RlYWQgb2YgdGhlIHJlYWwgcGtnLWNvbmZpZyBiaW5hcnkgd2hpY2ggYWN0dWFsbHkNCj4g
aXMgaW5zdGFsbGVkIGluIHRoZSBSU1MuDQo+IA0KPiBydW4uZG9fY29uZmlndXJlIGhhcyBhIFBB
VEggc2V0dGluZyB3aXRoIGZpcnN0IC4uLm1ldGEvc2NyaXB0cyBhbmQNCj4gb25seSB0aGVuIHRo
ZSBwYXRocyB0byB0aGUgZGlmZmVyZW50IFJTUyBkaXJlY3Rvcmllcy4NCj4gDQo+IENoYW5naW5n
IHRoYXQgb3JkZXIgaW4gbWV0YS9jb25mL2JpdGJha2UuY29uZiBsaW5lIDQ1MCBmaXhlZCB0aGlz
IGZvcg0KPiBtZSwgaG93ZXZlciBJJ20gdW5zdXJlIG9mIHBvc2libGUgc2lkZWVmZmVjdHMgb2Yg
dGhhdCByZW9yZGVyaW5nLg0KPiANCj4gTWF4DQoNCkJhaCwgeW91IGFyZSBjb3JyZWN0LiBUaGF0
IGlzIHdoYXQgSSBnZXQgZm9yIG5vdCB0ZXN0aW5nIGV4YWN0bHkgDQp3aGF0IEkgc2VudCBmb3Ig
aW50ZWdyYXRpb24uIFNoYW1lIG9uIG1lLg0KDQpBbnl3YXksIEkgc2VlIGEgY291cGxlIG9mIHBv
c3NpYmxlIHNvbHV0aW9uczoNCg0KKiBQdXQgdGhlIHNjcmlwdHMgaW4gYml0YmFrZS9iaW4gaW5z
dGVhZC4gVGhpcyBzaG91bGQgd29yayBhcyBpdCANCiAgaXMgb25seSBhZGRlZCB0byAkUEFUSCBi
eSBvZS1idWlsZGVudi1pbnRlcm5hbCAoY29udHJhcnkgdG8gDQogICR7Q09SRUJBU0V9L3Njcmlw
dHMgd2hpY2ggaXMgYWRkZWQgdG8gJFBBVEggYm90aCBieSANCiAgb2UtYnVpbGRlbnYtaW50ZXJu
YWwgYW5kIGJpdGJha2UuY29uZikuIEhvd2V2ZXIsIEkgZG8gbm90IGxpa2UgDQogIHRoaXMgaWRl
YSBhcyBpdCBmZWVscyB3cm9uZyB0byBwdXQgdGhlbSB0aGVyZS4NCiogUHV0IHRoZSBzY3JpcHRz
IGluIGEgc3ViZGlyZWN0b3J5IG9mICR7Q09SRUJBU0V9L3NjcmlwdHMsIGUuZy4sIA0KICAke0NP
UkVCQVNFfS9zY3JpcHRzL2JsYWNrbGlzdGVkLCBhbmQgYWRkIHRoYXQgcGF0aCB0byAkUEFUSCBp
biANCiAgYml0YmFrZS5jb25mLCBidXQgYXQgdGhlIG90aGVyIGVuZCBvZiBpdCBzbyB0aGF0IHRo
ZSBSU1MgcGF0aHMgDQogIGFwcGVhciBiZWZvcmUgaXQuIFRoaXMgc291bmRzIGEgbG90IG1vcmUg
YXBwZWFsaW5nIHRvIG1lLg0KKiBJbXBsZW1lbnQgdGhlIHdoaXRlbGlzdCBzb2x1dGlvbiBQYXRy
aWNrIE9obHkgbWVudGlvbmVkIGluc3RlYWQuDQogIEFsdGhvdWdoIHRoaXMgaXMgcHJvYmFibHkg
dGhlIGJlc3Qgc29sdXRpb24sIHByaW9yaXRpemluZyBpdCANCiAgZm9yIDIuMyBkb2VzIG5vdCBz
b3VuZCBsaWtlbHkgdG8gaGFwcGVuLg0KDQpJIGhhdmUgaW1wbGVtZW50ZWQgc29sdXRpb24gdHdv
IGFib3ZlIChwcm9wZXJseSB0ZXN0ZWQgdGhpcyB0aW1lKSwgDQphbmQgd2lsbCBzZW5kIHRoYXQg
YWxvbmcgaW4gYSBsaXR0bGUgd2hpbGUuDQoNCi8vUGV0ZXINCg0K

