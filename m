Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWI1Z-0003ca-Tv
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 02:34:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 17:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81987972"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 17:28:06 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 09:27:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Fri, 2 Dec 2011
	09:26:50 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 09:26:49 +0800
Thread-Topic: [OE-core] [PATCH 3/8] lzo: upgrade from 2.05 to the latest
	version 2.06
Thread-Index: Acyvrav9+Y6MFvNMQ0mL970sFrsFzQA44DWQ
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A6E0@shsmsx502.ccr.corp.intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<685dc1375188fc90c1b3f8fd3b38442ec9bafddc.1322662245.git.dexuan.cui@intel.com>
	<CAMKF1soKtwMPU_fs3ZBjMG4sxq5xRnPKqD1s--nDa5KLH-h9Cg@mail.gmail.com>
In-Reply-To: <CAMKF1soKtwMPU_fs3ZBjMG4sxq5xRnPKqD1s--nDa5KLH-h9Cg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] lzo: upgrade from 2.05 to the latest version 2.06
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
X-List-Received-Date: Fri, 02 Dec 2011 01:34:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S2hlbSBSYWogd3JvdGUgb24gMjAxMS0xMi0wMToNCj4gT24gV2VkLCBOb3YgMzAsIDIwMTEgYXQg
NjoxMiBBTSwgRGV4dWFuIEN1aSA8ZGV4dWFuLmN1aUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPj4g
U2lnbmVkLW9mZi1ieTogRGV4dWFuIEN1aSA8ZGV4dWFuLmN1aUBpbnRlbC5jb20+DQo+PiAtLS0N
Cj4+IMKgLi4uL2x6by97bHpvLTIuMDUgPT4gbHpvLTIuMDZ9L2FjaW5jbHVkZS5tNCDCoCDCoCDC
oCDCoHwgwqAgwqAwDQo+PiDCoC4uLi9sem8ve2x6by0yLjA1ID0+IGx6by0yLjA2fS9hdXRvY29u
Zi5wYXRjaCDCoCDCoCDCoHwgwqAgwqA5ICsrKysrKysrLQ0KPj4gwqAtLS0NCj4+IMKgZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYw0KPj4gwqBpbmRleCA2NTA3NDlhLi4y
YTc4ODQ1IDEwMDY0NA0KPj4gQEAgLTE2LDYgKzIzLDYgQEAgaW5kZXggNjUwNzQ5YS4uMmE3ODg0
NSAxMDA2NDQNCj4+IA0KPj4gwqAtQUNfUFJFUkVRKDIuNjcpDQo+PiDCoCtBQ19QUkVSRVEoMi42
NSkNCj4gDQo+IGlzIHRoaXMgcGF0Y2ggbmVlZGVkIHN0aWxsLiBXZSB1c2UgbmV3ZXIgYXV0b2Nv
bmYgc28gd2h5IGRvIHdlIGdvIGJhY2sNCj4gdG8gMi42NSBpbiB0aGlzIGNhc2UgPw0KSGkgS2hl
bSwNClRoYW5rcyBhIGxvdCBmb3IgdGhlIHJlbWluZGVyIQ0KWW91J3JlIGNvcnJlY3QuIFdlIGRv
bid0IG5lZWQgdGhlIHBhdGNoIGFueSBsb25nZXIgYWNjb3JkaW5nIHRvIG15IHRlc3QuDQpJJ2xs
IHNlbmQgYSBuZXcgY29tbWl0IHRvIHJlbW92ZSB0aGUgcGF0Y2guDQoNClRoYW5rcywNCi0tIERl
eHVhbg0KDQoNCg==


