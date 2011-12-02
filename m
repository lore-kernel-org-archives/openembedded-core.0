Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWIVa-0004q4-A6
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 03:05:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 17:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81334630"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 17:59:05 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 09:59:03 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 2 Dec 2011
	09:59:02 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 09:59:01 +0800
Thread-Topic: [OE-core] [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
Thread-Index: AcyvrePJhsasgAK+QuSr3xn8n1nQQAA524xA
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A756@shsmsx502.ccr.corp.intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
	<CAMKF1srX6OY7OEUdTggi-26v3zdN5-s0imC4_tMC88sRymc4=g@mail.gmail.com>
In-Reply-To: <CAMKF1srX6OY7OEUdTggi-26v3zdN5-s0imC4_tMC88sRymc4=g@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
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
X-List-Received-Date: Fri, 02 Dec 2011 02:05:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S2hlbSBSYWogd3JvdGUgb24gMjAxMS0xMi0wMToNCj4gT24gV2VkLCBOb3YgMzAsIDIwMTEgYXQg
NjoxMiBBTSwgRGV4dWFuIEN1aSA8ZGV4dWFuLmN1aUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPj4g
dXBkYXRlZCBMSUNfRklMRVNfQ0hLU1VNIHNpbmNlIHRoZSBjb2RlIHdhcyByZS1vcmdhbml6ZWQs
IGJ1dCB0aGUNCj4+IGxpY2Vuc2UgcmVtYWlucyB0aGUgc2FtZS4NCj4+IC0tLSAvZGV2L251bGwN
Cj4+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94Y2IveGNiLXV0aWxfMC4zLjguYmINCj4+
IEBAIC0wLDAgKzEsOSBAQA0KPj4gDQo+ICsiZmlsZTovL3NyYy94Y2JfYXV4LmM7ZW5kbGluZT0z
MDttZDU9YWUzMDViOWMyYTM4ZjliYTI3MDYwMTkxMDQ2YTY0DQo+IDYwDQo+PiArXA0KPj4gK8Kg
ZmlsZTovL3NyYy94Y2JfZXZlbnQuaDtlbmRsaW5lPTI3O21kNT02MjdiZTM1DQo+IDVhZWU1OWUx
YjhhZGU4MGQ1YmQ5MGZhZDkiDQo+IA0KPiBpZiBsaWNlbnNlIHJlbWFpbnMgc2FtZSB0aGVuIHdo
eSBkbyB3ZSBub3QgY2hlY2sgZm9yIHRoZSByZW1haW5pbmcNCj4gZmlsZXMgZnJvbSB0aGVyZSBu
ZXcgbG9jYXRpb24gd2hlcmV2ZXIgdGhleSBtb3ZlZCB0byBhZnRlciBjb2RlIHJlb3JnID8NClNv
bWUgZmlsZXMgaW4gMC4zLjYgZG9lc24ndCBleGlzdCBpbiAwLjMuOC4gQWNjb3JkaW5nIHRoZSBD
aGFuZ2Vsb2csIHRoZXkgc2VlbSB0byBiZSBkZW1vIGNvZGUsIG9yIG9ic29sZXRlIGNvZGUuDQpJ
IHJlc2VydmVkIHRoZSAyIGZpbGVzIG9mIExJQ19GSUxFU19DSEtTVU0gc2luY2UgdGhleSdyZSBz
dGlsbCBpbiAwLjMuOCwgYnV0IHdpdGggYSBkaWZmZXJlbnQgZGlyZWN0b3J5LiBUaGUgb3RoZXIg
ZmlsZXMgZG9uJ3QgZXhpc3Qgbm93Lg0KDQpUaGFua3MsDQotLSBEZXh1YW4NCg0KDQo=


