Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D4DA17E468
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 09:17:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2019 02:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="356395540"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by orsmga005.jf.intel.com with ESMTP; 29 Aug 2019 02:17:06 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.232]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.25]) with mapi id
	14.03.0439.000; Thu, 29 Aug 2019 17:17:03 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"akuster808@gmail.com" <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/5] kernel-devsrc: tweak for v5.3+
Thread-Index: AQHVUrVw/zgdwcBqJ0WG3yKphxMuUqcRaYEA
Date: Thu, 29 Aug 2019 09:17:02 +0000
Message-ID: <b132395fc39af7592af4a4d1c5d8bc25ccf7a31a.camel@intel.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
In-Reply-To: <3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.162.95]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Thu, 29 Aug 2019 09:17:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <988AE2E38DBC2D4FB8CC7FE7FD95C1C1@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA4LTE0IGF0IDExOjMxIC0wNDAwLCBicnVjZS5hc2hmaWVsZEBnbWFpbC5j
b20gd3JvdGU6DQo+IEZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5j
b20+DQo+IA0KPiBUaGUgNS4zIGtlcm5lbCBoYXMgdHdvIGNoYW5nZXMgdGhhdCByZXF1aXJlIHR3
ZWFrcyB0byB0aGUgbWluaW1hbA0KPiBrZXJuZWwtZGV2c3JjIHBhY2thZ2UuDQo+IA0KPiAtIDRj
ZTk3MzE3ZiBbeDg2L3B1cmdhdG9yeTogRG8gbm90IHVzZSBfX2J1aWx0aW5fbWVtY3B5IGFuZA0K
PiBfX2J1aWx0aW5fbWVtc2V0XQ0KPiANCj4gICBUaGlzIGNoYW5nZSByZW1vdmVzIHRoZSBuZWVk
IGZvciBhcmNoL3g4Ni9wdXJnYXRvcnkvc3RyaW5nLmMgYW5kDQo+ICAgaW5zdGVhZCByZXVzZXMg
YSBjb3B5IGluIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC8sIHNvIHdlIGNhbid0DQo+IGNvcHkN
Cj4gICB0aGUgZmlsZSBhbnltb3JlLiBUbyBzdXBwb3J0IG9sZGVyIGtlcm5lbHMsIHdlIG1ha2Ug
dGhlIGNvcHkNCj4gc3Vydml2ZQ0KPiAgIHRoZSBub24tZXhpc3RlbmNlIG9mIHRoZSBmaWxlLg0K
PiANCg0KVGhpcyBjaGFuZ2Ugd2FzIG1lcmdlZCBpbiA0LjE5IHN0YWJsZSBrZXJuZWwgYXMgd2Vs
bC4gQ2FuIHRoaXMgYmUNCm1lcmdlZCBpbiBvdXIgc3RhYmxlIGJyYW5jaGVzIGFzIHdlbGwgcGxl
YXNlPw0KDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXguZ2l0L2NvbW1pdC8/aD1saW51eC00LjE5LnkmaWQ9ZTBkMjYyYTU3ZmM3NDFh
OWIzNjJlNDU4YzcxNGUzN2E3N2RkYjYyZA0KDQpUaGFua3MsDQoNCkFudWoNCg==

