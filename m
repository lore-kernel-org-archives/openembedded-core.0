Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D3670605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 07:47:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2013 00:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,733,1367996400"; d="scan'208";a="272444949"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2013 00:47:41 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 24 Jul 2013 08:47:40 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.33]) with mapi id
	14.03.0123.003; Wed, 24 Jul 2013 08:47:39 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Thread-Topic: [OE-core] How to solve the make 3.82 issue at sanity check time?
Thread-Index: AQHOiEBR5J1d4yr5vEWgItXFGIJpDJlzYxoA
Date: Wed, 24 Jul 2013 07:47:39 +0000
Message-ID: <1374652108.28370.6.camel@firebird.rb.intel.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
In-Reply-To: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 07:47:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <26B8AE28BBBEB4499E6EB57471C4F9AE@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFdlZCwgMjAxMy0wNy0yNCBhdCAwOTozMyArMDIwMCwgR2l1c2VwcGUgQ29uZG9yZWxs
aSB3cm90ZToNCj4gSGkgQWxsLA0KPiAgDQo+IGdpdmVuIHRoYXQgdGhlIG1ha2Ugdi4gMy44MiBp
cyBicm9rZW4sIGFzIHRoZSBzYW5pdHkgY2hlY2sgaGlnaGxpZ2h0cywNCj4gd2hpY2ggaXMgdGhl
IGJlc3Qgc29sdXRpb24NCj4gdG8gYWxsb3cgRmVkb3JhIHVzZXJzIChhcyBJIGFtKSB0byBnbyBh
aGVhZCB3aXRoIHRoZSBidWlsZD8NCj4gSSBkb24ndCBsaWtlIHRvIGF2b2lkIHNhbml0eSBjaGVj
a3Mgb3IgdG8gdXNlIGFuIG9sZGVyIHZlcnNpb24gb2YNCj4gc2FuaXR5LmJiY2xhc3MuDQo+IFBs
ZWFzZSBsZXQgbWUga25vdywgY3VycmVudGx5IHRoaXMgaXNzdWUgaXMgYmxvY2tpbmcgZm9yIG1l
Lg0KPiAgDQoNCg0KRmVkb3JhIHB1c2hlZCB1cGRhdGVzIGZvciBtYWtlIGluIEYxNyAmIDE4ICgx
OSB3YXNuJ3QgYnJva2VuIGFmYWlrKSBzbw0KeW91IHNob3VsZCBqdXN0IHVwZGF0ZSB5b3VyIHN5
c3RlbS4gKHl1bSB1cGRhdGUgbWFrZSBzaG91bGQgZG8gdGhlDQp0cmljaykuDQoNCkFsdGVybmF0
aXZlbHkgeW91IGNhbiBiaXRiYWtlIGJ1aWxkdG9vbHMtdGFyYmFsbCBvbiBhbiB3b3JraW5nIHN5
c3RlbQ0KKG9yIGRpc2FibGUgdGhlIHNhbml0eSBjaGVjayBiZWZvcmUsIHRvdWNoIGNvbmYvc2Fu
aXR5LmNvbmYpIGFuZCBpbnN0YWxsDQp0aGF0IG9uIHlvdXIgc3lzdGVtIChpZiB5b3UgYXJlIG9u
IEYxNiB3aGljaCBpc24ndCB1cGRhdGVkIGFueW1vcmUpDQoNCkNoZWVycywNClN0ZWZhbg0KDQoN
Cj4gQ2hlZXJzLA0KPiBHaXVzZXBwZQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoNCg==

