Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 10F7472EB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:27:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Apr 2018 01:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,300,1520924400"; d="scan'208";a="52263517"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2018 01:27:02 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.222]) with mapi id
	14.03.0319.002; Fri, 20 Apr 2018 16:27:01 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu
	boot and shutdown
Thread-Index: AQHT2HddJpqIASr7+EOELEBgZap+gqQJUSDQ
Date: Fri, 20 Apr 2018 08:27:01 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E06664@PGSMSX109.gar.corp.intel.com>
References: <1523323712-112201-1-git-send-email-ee.peng.yeoh@intel.com>
	<1524208516.18865.131.camel@linuxfoundation.org>
In-Reply-To: <1524208516.18865.131.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjlhNjMwZmMtNmNjMS00YWRhLTk3YWEtOWUxZmEzODg2NWExIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlVsRTd0eUF0b0pPWDJVYWV4M1wvNnIxcGtxdUF6K0lxXC81Wm1SSmNxVmlvZz0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Fri, 20 Apr 2018 08:27:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCwNCk5vdGVkLCB0aGFuayB5b3UgdmVyeSBtdWNoIQ0KSXQgd2FzIGZpbmUsIFFBIHRl
YW0gc2hhbGwgYmUgYWJsZSB0byBtYW51YWxseSB0cmlnZ2VyIHRoaXMgc2VsZnRlc3QsIGF0IGxl
YXN0IGl0IHdhcyBtb3JlIGVmZmljaWVudCB0aGFuIG1hbnVhbGx5IGV4ZWN1dGluZyB0aGUgdGVz
dGNhc2UuIA0KDQpDaGVlcnMsDQpZZW9oIEVlIFBlbmcgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmddIA0KU2VudDogRnJpZGF5LCBBcHJpbCAyMCwgMjAxOCAzOjE1IFBNDQpU
bzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBvZS1zZWxmdGVzdDogcnVucWVtdTogYWRkIHRlc3RzIGZvciBxZW11IGJvb3QgYW5kIHNodXRk
b3duDQoNCk9uIE1vbiwgMjAxOC0wNC0wOSBhdCAxODoyOCAtMDcwMCwgWWVvaCBFZSBQZW5nIHdy
b3RlOg0KPiBRQSB0ZWFtIHdlcmUgdGVzdGluZyBxZW11IGJvb3QgaW1hZ2UgYW5kIHNodXRkb3du
IG9uIGVhY2ggcWVtdSANCj4gYXJjaGl0ZWN0dXJlIG1hbnVhbGx5LiBBZGQgYXV0b21hdGVkIHRl
c3QgdG8gdGVzdCBxZW11IGJvb3Qgb24NCj4gZXh0NCBhbmQgbmZzLCBmaW5hbGx5IGNoZWNrIHRo
YXQgaXQgY2FuIHNodXRkb3duIHByb3Blcmx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBF
ZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBtZXRhL2xpYi9vZXFh
L3NlbGZ0ZXN0L2Nhc2VzL3J1bnFlbXUucHkgfCA3MA0KPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCg0KVGhlIHRlc3QgaXMgZ29vZCBob3dldmVyIGl0IGZhaWxzIG9uIG91ciBpbmZy
YXN0cnVjdHVyZSBzaW5jZSBwb3J0bWFwL3JwY2JpbmQgYXJlbid0IHJ1bm5pbmcuIFRoaXMgaXMg
YSBuZXcgZGVwZW5kZW5jeSBmb3IgdGhlIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgd2UnZCBoYXZlIHRv
IGRvY3VtZW50IHNvIEkgZG9uJ3Qgd2FudCB0byBtZXJnZSB0aGlzIGZvciAyLjUuwqANCg0KU2lu
Y2UgdGhlIGNvZGUgaXRzZWxmIGlzIGZpbmUsIGluc3RlYWQgSSd2ZSBtZXJnZWQgdGhlIHRlc3Qg
YnV0IGRpc2FibGVkIHRoZSBORlMgdGVzdCBieSBkZWZhdWx0IGFuZCB3ZSdsbCBuZWVkIHRvIHJl
dmlzaXQgdGhpcyBpbiAyLjYgdG8gZW5hYmxlIGl0Lg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

