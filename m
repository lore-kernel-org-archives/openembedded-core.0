Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1RdW5i-0007yu-6H
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 01:00:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 15:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90182701"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 15:52:34 -0800
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 15:52:34 -0800
Received: from orsmsx102.amr.corp.intel.com ([169.254.1.40]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.229]) with mapi id
	14.01.0355.002; Wed, 21 Dec 2011 15:52:33 -0800
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gdb-cross-canadian: build gdb with	python
	support
Thread-Index: AQHMwDV+hIOAWt/Oy0yLPW99aAve7JXm9U9g
Date: Wed, 21 Dec 2011 23:52:33 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C2401D1A6@ORSMSX102.amr.corp.intel.com>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
	<4EF19E06.6030004@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
	<4EF266E0.8040302@eukrea.com>
In-Reply-To: <4EF266E0.8040302@eukrea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with	python	support
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
X-List-Received-Date: Thu, 22 Dec 2011 00:00:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRXJpYywNCg0KWWVzLCB1bmRlcnN0YW5kIHRoZSB1c2FnZSBhbmQgYWR2YW50YWdlLCBidXQg
c3RpbGwgdGhpbmsgYXBwbHkgdGhlIHBhdGNoIGluIG1ldGEtb2UgZmlyc3QgdGhlbiBpZiBsYXRl
ciBvbiB0aGVyZSdzIHN0cm9uZyBkZW1hbmQgZm9yIHRoaXMgZmVhdHVyZSB3ZSBjYW4gcHVsbCBp
bnRvIG9lLWNvcmUgaXMgdGhlIHJpZ2h0IGFwcHJvYWNoLg0KDQpUaGFua3MsDQpKZXNzaWNhDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBFcmljIELDqW5hcmQNClNl
bnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMjEsIDIwMTEgMzowOCBQTQ0KVG86IFBhdGNoZXMgYW5k
IGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gZ2RiLWNyb3NzLWNhbmFkaWFuOiBidWlsZCBnZGIgd2l0aCBweXRob24gc3Vw
cG9ydA0KDQpIaSBKZXNzaWNhLA0KDQpMZSAyMS8xMi8yMDExIDIzOjEyLCBaaGFuZywgSmVzc2lj
YSBhIMOpY3JpdCA6DQo+IENhbiB5b3Ugc3VibWl0IHRoZSBwYXRjaCBhZ2FpbnN0IHF0IGxheWVy
IG9yIG1ldGEtb2UgaW5zdGVhZCBvZiBvZS1jb3JlLCBzaW5jZSBweXRob24gZW5hYmxlZCBnZGIg
c2hvdWxkbid0IGJlIHR1cm5lZCBvbiBieSBkZWZhdWx0IGluIG9lLWNvcmUgYmFzZWQgb24gaXRz
IHVzYWdlLCBxdGNyZWF0b3IsIGV0Yy4NCj4NCkkgY2FuIHN1Ym1pdCB0aGF0IHRvIG1ldGEtb2Ug
KGFzIHF0IGlzIGluc2lkZSBvZS1jb3JlKSBidXQgaGF2aW5nIGEgZ2RiIHdpdGgNCnB5dGhvbiBj
YW4NCmFsc28gbWFrZSBzZW5zZSBpbiBvZS1jb3JlIGFzIHRoaXMgaXMgbm90IGRlZGljYXRlZCB0
byBxdGNyZWF0b3IgYnV0IGdpdmVzDQp2ZXJ5IGdvb2Qgc2NyaXB0aW5nIGNhcGFiaWxpdGllcyB0
byBkZWJ1ZyB3aXRoIGdkYiA6DQpodHRwOi8vc291cmNld2FyZS5vcmcvZ2RiL2N1cnJlbnQvb25s
aW5lZG9jcy9nZGIvUHl0aG9uLmh0bWwjUHl0aG9uDQoNCkVyaWMNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxp
bmcgbGlzdA0KT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDov
L2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1jb3JlDQo=


