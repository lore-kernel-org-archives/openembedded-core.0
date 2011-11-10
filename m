Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1ROJWi-0000DN-RO
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:34:01 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72642773"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:26:37 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 10 Nov 2011 09:25:49 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Thu, 10 Nov 2011 09:25:48 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 10 Nov 2011 09:25:48 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "Zanussi, Tom" <tom.zanussi@intel.com>
Date: Thu, 10 Nov 2011 09:25:46 +0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 17/17] python: skip setup.py
	'import	check' when cross-compiling
Thread-Index: AcyfRNQSQ04qPM5KSve9f7GSyk2lTwAAVHbA
Message-ID: <1865303E0DED764181A9D882DEF65FB6DFA3CBDE15@shsmsx502.ccr.corp.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
	<1320846145.16608.0.camel@elmorro>
	<1865303E0DED764181A9D882DEF65FB6DFA3CBDD9E@shsmsx502.ccr.corp.intel.com>
	<1320887191.16608.116.camel@elmorro>
In-Reply-To: <1320887191.16608.116.camel@elmorro>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 17/17] python: skip setup.py 'import	check' when cross-compiling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 01:34:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WmFudXNzaSwgVG9tIHdyb3RlIG9uIDIwMTEtMTEtMTA6DQo+IE9uIFdlZCwgMjAxMS0xMS0wOSBh
dCAxNjo1NyAtMDgwMCwgQ3VpLCBEZXh1YW4gd3JvdGU6DQo+PiBaYW51c3NpLCBUb20gd3JvdGUg
b24gMjAxMS0xMS0wOToNCj4+PiBPbiBXZWQsIDIwMTEtMTEtMDkgYXQgMDI6MzQgLTA4MDAsIEN1
aSwgRGV4dWFuIHdyb3RlOg0KPj4+PiBIb3cgSSB3aXNoIEkgY291bGQgbm90aWNlIHRoZSBwYXRj
aCB0aGlzIG1vcm5pbmcgc28gSSBjb3VsZCBzYXZlIDEgZGF5IQ0KPj4+PiANCj4+PiANCj4+PiA/
Pz8gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB3aGF0IHlvdSBtZWFuPw0KPj4gSSBtZWFudCBJIHNw
ZW50IDEgZGF5IG9uIGRlYnVnZ2luZyB0aGUgc2FtZSBpc3N1ZSBhbmQgZ290IHRoZSBjYXVzZQ0K
Pj4gYnV0IHdhc24ndCBzdXJlIGhvdyB0aGUgcGF0Y2ggc2hvdWxkIGJlIG1hZGUsIHNvIEkgd2Fu
dGVkIHRvIGFzayBmb3INCj4+IHN1Z2dlc3Rpb24gaW4gdGhlIE1MIGFuZCBiZWZvcmUgdGhhdCBJ
IHRyaWVkIHRvIGZpbmQgb3V0IGlmIGFueWJvZHkNCj4+IHJlcG9ydGVkIHRoZSBzYW1lIGlzc3Vl
IGFuZCBJIHNhdyB5b3VyIHBhdGNoIHRoYXQgd2FzIHNlbnQgMS41IGRheXMNCj4+IGFnby4uLiA6
LSkNCj4+IA0KPiANCj4gWWVhaCwgc3VyZSAtIEknbSBqdXN0IGtpbmQgb2YgY3VyaW91cyBzaW5j
ZSBJJ2QgbmV2ZXIgc2VlbiBpdCBiZWZvcmUNCj4gdW50aWwgSSBhZGRlZCB0aGUgYXZ4IGluc3Ry
dWN0aW9uIHN1cHBvcnQuDQpBY3R1YWxseSBJIHRoaW5rIHRoZSBpc3N1ZSBpcyBhbHdheXMgdGhl
cmUoYXQgbGVhc3QgZnJvbSB3aGVuIHB5dGhvbiB3YXMgdXBncmFkZSB0byAyLjcueCkuDQplLmcu
LCBpbiB0YXJnZXQsIHJ1biAicHl0aG9uIiBhbmQgdHJ5ICJpbXBvcnQgZ3JwIiwgd2UnbGwgZ2V0
IGFuIGVycm9yIHNheWluZyB0aGUgYnVpbHQtaW4gbW9kdWxlIGdycCBjb3VsZG4ndCBiZSBmb3Vu
ZDsgaW4gcHl0aG9uJ3MgbG9nLmRvX2NvbXBpbGUsIHdlIGNhbiBzZWUgdGhlIG9idmlvdXMgd2Fy
bmluZ3MuDQoNCj4gDQo+IEp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgd2hhdCB3ZXJlIHlvdXIgaG9z
dCBhbmQgdGFyZ2V0IGFyY2hlcz8NCkknbSB0cnlpbmcgdGhlIHRhc2sgInNlbGYgaG9zdGVkIGlt
YWdlIihodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL0J1aWxkX0FwcGxpYW5jZV9E
ZXNpZ24pOg0KaW4gdGFyZ2V0LCBJIGZvdW5kIGJpdGJha2UncyBkb19wYWNrYWdlIGZhaWxlZCBi
ZWNhdXNlICJpbXBvcnQgZ3JwIiBmYWlsZWQsIHNvIEkgaGFkIHRvIGxvb2sgaW50byB0aGUgaXNz
dWUuDQoNClRoYW5rcywNCi0tIERleHVhbg0KDQoNCg==


