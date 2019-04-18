Return-Path: <john.ernberg@actia.se>
Received: from mail.actia.se (mail.actia.se [195.67.112.82])
	by mail.openembedded.org (Postfix) with ESMTP id D9FF17C341
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 06:37:58 +0000 (UTC)
Received: from S036ANL.actianordic.se (192.168.16.117) by
	S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 18 Apr 2019 08:37:57 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
	S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
	15.01.1713.004; Thu, 18 Apr 2019 08:37:57 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH] i2c-tools: Split binaries and library
Thread-Index: AQHU9FD/6Z7Xnp5RHEuO/HtCuDslg6ZBWKYA
Date: Thu, 18 Apr 2019 06:37:56 +0000
Message-ID: <f789129d-2037-3b01-0e33-03fd4fcecfbe@actia.se>
References: <20190416120224.6737-1-john.ernberg@actia.se>
	<20190416123603.GA25920@localhost>
In-Reply-To: <20190416123603.GA25920@localhost>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.11.53]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] i2c-tools: Split binaries and library
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
X-List-Received-Date: Thu, 18 Apr 2019 06:37:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4576E9E84564B54484B8E2F51C74CE16@actia.se>
Content-Transfer-Encoding: base64

DQpPbiA0LzE2LzE5IDI6MzYgUE0sIEFkcmlhbiBCdW5rIHdyb3RlOg0KPiBPbiBUdWUsIEFwciAx
NiwgMjAxOSBhdCAxMjowMjowNFBNICswMDAwLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+PiAuLi4N
Cj4+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9pMmMtdG9vbHMvaTJjLXRvb2xzXzQuMS5i
Yg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2kyYy10b29scy9pMmMtdG9vbHNfNC4x
LmJiDQo+PiAuLi4NCj4+IC1QQUNLQUdFUyA9KyAiJHtQTn0tbWlzYyINCj4+ICtQQUNLQUdFUyA9
KyAiJHtQTn0tbWlzYyAke1BOfS11dGlscyAiDQo+PiAuLi4NCj4gaTJjLXRvb2xzLXV0aWxzIGlz
IGEgd2VpcmQgbmFtZS4NCj4NCj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGFkZCBhIG5ldyBwYWNr
YWdlIGxpYmkyYyBmb3IgdGhlIGxpYnJhcnkgaW5zdGVhZC4NCj4NCj4gVGhpcyB3b3VsZCBhbHNv
IG5vdCBicmVhayBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBmb3IgcGVvcGxlDQo+IGFscmVhZHkg
aW5zdGFsbGluZyBpMmMtdG9vbHMgdG8gdGhlaXIgaW1hZ2VzLg0KPg0KPiBjdQ0KPiBBZHJpYW4N
Cj4NCkkgdGlua2VyZWQgd2l0aCB0aGlzIGFuZCByYW4gaW50byB0aGUgU0hMSUIgaGFuZGxpbmcg
d2hlcmUgaXQgcmVuYW1lcyANCnRoZSBwYWNrYWdlcyBiYXNlZCBvbiBsaWJyYXJpZXMsIGFyZSB0
aGVyZSBhbnkgZXhhbXBsZSByZWNpcGVzIEkgY2FuIA0KbG9vayBhdCBiZWNhdXNlIGRlZmluaW5n
IGxpYmkyYyBhcyBhIHBhY2thZ2Ugd2l0aCBQQUNLQUdFUyBicmVha3MgdGhlIA0KZGVwZW5kZW5j
eSBncmFwaCBkdWUgdG8gdGhlIFNITElCIGhhbmRsaW5nIGFuZCBJIGNhbm5vdCBmaWd1cmUgb3V0
IGhvdyANCnRvIHdyaXRlIHRoZSByZWNpcGUgc28gdGhhdCBkb2Vzbid0IGhhcHBlbi4NCg0KVGhh
bmtzLg0KDQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJnDQo=

