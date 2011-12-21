Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RdIwK-0001Bm-Cx
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 10:58:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 01:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98722155"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 01:51:17 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 17:51:15 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 21 Dec 2011 17:51:14 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 21 Dec 2011 17:51:13 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 21 Dec 2011 17:51:13 +0800
Thread-Topic: opkg still breaks meta-toolchain-gmae
Thread-Index: Acy/wIfX2gi/cf+3QpW2nVcdaSDASQABNDFg
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E1B67@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6EA8B6E1A65@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6EA8B6E1B0D@shsmsx502.ccr.corp.intel.com>
	<1324458622.3622.25.camel@ted>
In-Reply-To: <1324458622.3622.25.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg still breaks meta-toolchain-gmae
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
X-List-Received-Date: Wed, 21 Dec 2011 09:58:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCBQdXJkaWUgd3JvdGUgb24gMjAxMS0xMi0yMToNCj4gT24gV2VkLCAyMDExLTEyLTIx
IGF0IDE2OjUxICswODAwLCBDdWksIERleHVhbiB3cm90ZToNCj4+IEN1aSwgRGV4dWFuIHdyb3Rl
IG9uIDIwMTEtMTItMjE6DQo+Pj4gSGkgYWxsLA0KPj4+IEFmdGVyIEkgdXBncmFkZWQgdG8gdGhl
IGxhdGVzdCBwb2t5IG1hc3RlciAoY29tbWl0IDQ2NDhhYWRmKSwNCj4+PiBjb3JlLWltYWdlLXNh
dG8tc2RrIGNhbiBidWlsZCBmaWxlLCBidXQgbWV0YS10b29sY2hhaW4tZ21hZSAod2l0aA0KPj4+
IGlwaw0KPj4+IHBhY2thZ2luZykgc3RpbGwgZG9lc24ndCB3b3JrLiBOb3cgdGhlIGZhaWx1cmUg
aXM6DQo+Pj4gDQo+Pj4gfCBlcnJvcjogRmFpbGVkIGRlcGVuZGVuY2llczoNCj4+PiB8ICAgbGli
c2RsLW5hdGl2ZXNkayBpcyBuZWVkZWQgYnkgcWVtdS1uYXRpdmVzZGstMC4xNS4xLXIxLng4Nl82
NA0KPj4+IE5PVEU6IHBhY2thZ2UgbWV0YS10b29sY2hhaW4tZ21hZS0xLjAtcjY6IHRhc2sgZG9f
cG9wdWxhdGVfc2RrOg0KPj4+IEZhaWxlZA0KPj4gU29ycnksIEkgbmVlZCB0byBjb3JyZWN0IHRo
aXMgYWJvdmU6IEl0J3MgYWN0dWFsbHkgcnBtIHBhY2thZ2luZyhycG0NCj4+IGRpZCB3b3JrIGZp
bmUgd2l0aCB0aGUgc2xpZ2h0bHkgb2xkZXIgY29tbWl0IDQ1OTg3YzUxMzUpIHJhdGhlciB0aGFu
DQo+PiBpcGsuDQo+PiANCj4+IElmIEkgdXNlIGlwayBwYWNrYWdpbmcsIEkgZ2V0IHRoZSBzaW1p
bGFyIG1rZGlyIGZhaWx1cmU6IG1rZGlyOiBjYW5ub3QNCj4+IGNyZWF0ZSBkaXJlY3RvcnkgYC92
YXIvbGliL29wa2cnOiBQZXJtaXNzaW9uIGRlbmllZCBhbmQsIEkgZmluYWxseSBnb3QNCj4+IGEg
bGlic2RsIGZhaWx1cmUsIHRvbzogfCBDb2xsZWN0ZWQgZXJyb3JzOiB8ICAqDQo+PiBzYXRpc2Z5
X2RlcGVuZGVuY2llc19mb3I6IENhbm5vdCBzYXRpc2Z5IHRoZSBmb2xsb3dpbmcgfCBkZXBlbmRl
bmNpZXMNCj4+IGZvciB0YXNrLXNkay1ob3N0LW5hdGl2ZXNkazogfCAgKiAgICBsaWJzZGwtbmF0
aXZlc2RrICogU28gSSBzdXBwb3NlDQo+PiB0aGUgbGlic2RsIHBhdGNoKCIgZml4IHBhY2thZ2lu
ZyIpIGlzIHN1c3BpY2lvdXMuDQo+PiANCj4+IEJUVywgSSB1c2UgIk1BQ0hJTkU9cWVtdXg4NiIu
DQo+IA0KPiBJIGhhdmUgYSBzdXNwaWNpb24gdGhpcyBpcyBhIG1pc3NpbmcgUFIgYnVtcCBvbiBx
ZW11IGFmdGVyIHRoZSBsaWJzZGwgY2hhbmdlLg0KPiBEb2VzIHJlYnVpbGRpbmcgcWVtdS1uYXRp
dmVzZGsgaGVscD8NClllYWgsIGl0IGRvZXMgaGVscCAoZm9yIHJwbSBwYWNrYWdpbmcpISAgUGxl
YXNlIG1ha2UgYSBwYXRjaCB0byBidW1wIHRoZSBQUi4gOi0pDQoNCkJUVywgd2l0aCBpcGssIEkg
c3RpbGwgZ290IHRoZSBiZWxvdyBpc3N1ZToNCm1rZGlyOiBjYW5ub3QgY3JlYXRlIGRpcmVjdG9y
eSBgL3Zhci9saWIvb3BrZyc6IFBlcm1pc3Npb24gZGVuaWVkDQoNClRoYW5rcywNCi0tIERleHVh
bg0KDQoNCg==


