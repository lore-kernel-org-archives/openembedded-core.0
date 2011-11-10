Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1ROJ42-0007ty-LG
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:04:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 16:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72622565"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 16:58:05 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 10 Nov 2011 08:57:42 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Thu, 10 Nov 2011 08:57:41 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 10 Nov 2011 08:57:41 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "Zanussi, Tom" <tom.zanussi@intel.com>
Date: Thu, 10 Nov 2011 08:57:40 +0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 17/17] python: skip setup.py
	'import	check' when cross-compiling
Thread-Index: Acye5UZmNEd+QMqPQjyF4UjQtJOuygAXZH/w
Message-ID: <1865303E0DED764181A9D882DEF65FB6DFA3CBDD9E@shsmsx502.ccr.corp.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
	<1320846145.16608.0.camel@elmorro>
In-Reply-To: <1320846145.16608.0.camel@elmorro>
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
X-List-Received-Date: Thu, 10 Nov 2011 01:04:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WmFudXNzaSwgVG9tIHdyb3RlIG9uIDIwMTEtMTEtMDk6DQo+IE9uIFdlZCwgMjAxMS0xMS0wOSBh
dCAwMjozNCAtMDgwMCwgQ3VpLCBEZXh1YW4gd3JvdGU6DQo+PiBIb3cgSSB3aXNoIEkgY291bGQg
bm90aWNlIHRoZSBwYXRjaCB0aGlzIG1vcm5pbmcgc28gSSBjb3VsZCBzYXZlIDEgZGF5IQ0KPj4g
DQo+IA0KPiA/Pz8gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB3aGF0IHlvdSBtZWFuPw0KSSBtZWFu
dCBJIHNwZW50IDEgZGF5IG9uIGRlYnVnZ2luZyB0aGUgc2FtZSBpc3N1ZSBhbmQgZ290IHRoZSBj
YXVzZSBidXQgd2Fzbid0IHN1cmUgaG93IHRoZSBwYXRjaCBzaG91bGQgYmUgbWFkZSwgc28gSSB3
YW50ZWQgdG8gYXNrIGZvciBzdWdnZXN0aW9uIGluIHRoZSBNTCBhbmQgYmVmb3JlIHRoYXQgSSB0
cmllZCB0byBmaW5kIG91dCBpZiBhbnlib2R5IHJlcG9ydGVkIHRoZSBzYW1lIGlzc3VlIGFuZCBJ
IHNhdyB5b3VyIHBhdGNoIHRoYXQgd2FzIHNlbnQgMS41IGRheXMgYWdvLi4uIDotKQ0KDQo+PiBB
bnl3YXksIHRoYW5rcyBUb21aIGZvciB0aGUgcGF0Y2ghICA6LSkNCj4+IA0KPiANCj4gWW91J3Jl
IHdlbGNvbWUsIEkgZ3Vlc3MhDQo+IA0KPiBUb20NCj4gDQoNClRoYW5rcywNCi0tIERleHVhbg0K
DQoNCg==


