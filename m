Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA4971CB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 21:57:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 14:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="994893182"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 14:57:08 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 19 Jul 2017 14:57:07 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.34]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.152]) with mapi id
	14.03.0319.002; Wed, 19 Jul 2017 14:57:06 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] gcc-7.inc: add new warning
	"Wnot-cross-compiler"
Thread-Index: AQHTABeCFTelzqp1GkSzwigYs+4NqaJavLQAgAAFrYCAAAVOAIAA5u2A
Date: Wed, 19 Jul 2017 21:57:05 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
In-Reply-To: <CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 21:57:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBwcmVjaXNlbHksIHRoZSBwcm9ibGVtIGlzIHRoYXQgc29tZSBob3N0IGNvbXBpbGVyIG1heSBz
aWxlbnRseSBpZ25vcmUNCj4gdW5rbm93biB3YXJuaW5ncyBhbmQgc29tZSBob3N0IG1heSBub3Qg
YmUgdXNpbmcgZ2NjIGFzIGRlZmF1bHQgc3lzdGVtDQo+IGNvbXBpbGVyIGF0IGFsbCBlLmcuIG1h
Z2VpYSBkaXN0cm8gYW5kIG1heSBiZSBtb3JlIGluIGZ1dHVyZS4NCj4gDQoNClllcywgaXQgZG9l
cyBub3Qgbm9yIGl0IGF0dGVtcHRzIHRvIHNvbHZlIGFsbCB0b29sY2hhaW4gaXNzdWVzLg0KVGhl
IGV4cGVjdGF0aW9uIGlzIHRoYXQgYSBjb21waWxlciB3aWxsIGNob2tlIG9uIGFuIHVucmVjb2du
aXplZCBvcHRpb24uIA0KRm9yIGV4YW1wbGUsIGdjYyB3aWxsIGRvIHRoZSBmb2xsb3dpbmc6IA0K
DQokIGdjYyAtV25vdC1jcm9zcy1jb21waWxlciBoZWxsb193b3JsZC5jDQpnY2M6IGVycm9yOiB1
bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiDigJgtV25vdC1jcm9zcy1jb21waWxlcuKA
mQ0KDQpBcyBmb3Igbm9uLWdjYyBjb21waWxlcnM6IHllcywgdGhleSBtYXkgc2lsZW50bHkgaWdu
b3JlIHVucmVjb2duaXplZCBvcHRpb25zIA0KKHdoaWNoIElNSE8gaXMganVzdCB3cm9uZykuIElu
IHRoYXQgY2FzZSB0aGUgbmV3IG9wdGlvbnMgZG9lcyBub3Qgd29yayBhcyBpbnRlbmRlZCwNCmJ1
dCBpdCBkb2VzIG5vIGhhcm0gZWl0aGVyLg0KQW55d2F5LCB0aGUgaW50ZW5kZWQgdXNlIHdhcyB0
byBhZGQgc29tZXRoaW5nIGxpa2UgdGhpcyBhIC5jb25mIGZpbGU6DQoNClRBUkdFVF9DQ19BUkNI
X2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiIC1Xbm90LWNyb3NzLWNvbXBpbGVyIC1XZXJyb3I9bm90
LWNyb3NzLWNvbXBpbGVyIg0KDQoNCg==

