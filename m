Return-Path: <john.ernberg@actia.se>
Received: from mail.actia.se (mail.actia.se [195.67.112.82])
	by mail.openembedded.org (Postfix) with ESMTP id 6723E7D697
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:56:05 +0000 (UTC)
Received: from S036ANL.actianordic.se (192.168.16.117) by
	S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Tue, 7 May 2019 17:56:03 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
	S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
	15.01.1713.004; Tue, 7 May 2019 17:56:03 +0200
From: John Ernberg <john.ernberg@actia.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] i2c-tools: Split binaries and library
Thread-Index: AQHU9FD/6Z7Xnp5RHEuO/HtCuDslg6ZBWKYAgB54TQA=
Date: Tue, 7 May 2019 15:56:03 +0000
Message-ID: <ec7a98bc-ed23-6817-1d37-a0028a9ae51f@actia.se>
References: <20190416120224.6737-1-john.ernberg@actia.se>
	<20190416123603.GA25920@localhost>
	<f789129d-2037-3b01-0e33-03fd4fcecfbe@actia.se>
In-Reply-To: <f789129d-2037-3b01-0e33-03fd4fcecfbe@actia.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.11.53]
x-esetresult: clean, is OK
x-esetid: 37303A2967933E6D667566
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 07 May 2019 15:56:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEEE60DE9A64DF458CCFE9BC869FB640@actia.se>
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gNC8xOC8xOSA4OjM5IEFNLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+IA0KPiBP
biA0LzE2LzE5IDI6MzYgUE0sIEFkcmlhbiBCdW5rIHdyb3RlOg0KPj4gT24gVHVlLCBBcHIgMTYs
IDIwMTkgYXQgMTI6MDI6MDRQTSArMDAwMCwgSm9obiBFcm5iZXJnIHdyb3RlOg0KPj4+IC4uLg0K
Pj4+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9pMmMtdG9vbHMvaTJjLXRvb2xzXzQuMS5i
Yg0KPj4+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9pMmMtdG9vbHMvaTJjLXRvb2xzXzQu
MS5iYg0KPj4+IC4uLg0KPj4+IC1QQUNLQUdFUyA9KyAiJHtQTn0tbWlzYyINCj4+PiArUEFDS0FH
RVMgPSsgIiR7UE59LW1pc2MgJHtQTn0tdXRpbHMgIg0KPj4+IC4uLg0KPj4gaTJjLXRvb2xzLXV0
aWxzIGlzIGEgd2VpcmQgbmFtZS4NCj4+DQo+PiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWRkIGEg
bmV3IHBhY2thZ2UgbGliaTJjIGZvciB0aGUgbGlicmFyeSBpbnN0ZWFkLg0KPj4NCj4+IFRoaXMg
d291bGQgYWxzbyBub3QgYnJlYWsgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgZm9yIHBlb3BsZQ0K
Pj4gYWxyZWFkeSBpbnN0YWxsaW5nIGkyYy10b29scyB0byB0aGVpciBpbWFnZXMuDQo+Pg0KPj4g
Y3UNCj4+IEFkcmlhbg0KPj4NCj4gSSB0aW5rZXJlZCB3aXRoIHRoaXMgYW5kIHJhbiBpbnRvIHRo
ZSBTSExJQiBoYW5kbGluZyB3aGVyZSBpdCByZW5hbWVzIA0KPiB0aGUgcGFja2FnZXMgYmFzZWQg
b24gbGlicmFyaWVzLCBhcmUgdGhlcmUgYW55IGV4YW1wbGUgcmVjaXBlcyBJIGNhbiANCj4gbG9v
ayBhdCBiZWNhdXNlIGRlZmluaW5nIGxpYmkyYyBhcyBhIHBhY2thZ2Ugd2l0aCBQQUNLQUdFUyBi
cmVha3MgdGhlIA0KPiBkZXBlbmRlbmN5IGdyYXBoIGR1ZSB0byB0aGUgU0hMSUIgaGFuZGxpbmcg
YW5kIEkgY2Fubm90IGZpZ3VyZSBvdXQgaG93IA0KPiB0byB3cml0ZSB0aGUgcmVjaXBlIHNvIHRo
YXQgZG9lc24ndCBoYXBwZW4uDQo+IA0KPiBUaGFua3MuDQo+IA0KPiBCZXN0IHJlZ2FyZHMgLy8g
Sm9obiBFcm5iZXJnDQo+IA0K

