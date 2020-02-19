Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0A8C605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:43:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 18:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="434325889"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by fmsmga005.fm.intel.com with ESMTP; 18 Feb 2020 18:43:20 -0800
Received: from pgsmsx106.gar.corp.intel.com (10.221.44.98) by
	pgsmsx113.gar.corp.intel.com (10.108.55.202) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 19 Feb 2020 10:43:17 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.163]) with mapi id
	14.03.0439.000; Wed, 19 Feb 2020 10:43:16 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-plugins-good: change
	EXTRA_OECONF -> EXTRA_OEMESON
Thread-Index: AQHV5s30/un5qhZ4LkCfcXoRAOlX76ghSPKA
Date: Wed, 19 Feb 2020 02:43:16 +0000
Message-ID: <bc67d00aa872e879748e6b05fe3a104304194c07.camel@intel.com>
References: <20200219023641.3308-1-anuj.mittal@intel.com>
	<CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
In-Reply-To: <CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.22.68]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Wed, 19 Feb 2020 02:43:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <95C30C9C3F2A7D4B8E176113E2690B8F@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAyLTE4IGF0IDE4OjM5IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VHVlLCBGZWIgMTgsIDIwMjAgYXQgNjozNyBQTSBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50
ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBVc2UgdGhlIGNvcnJlY3QgdmFyaWFibGUgc28gb3B0aW9u
cyBhY3R1YWxseSBnZXQgdXNlZCBhbmQgdXNlIHRoZQ0KPiA+IGNvcnJlY3QgcXQgb3B0aW9uIG5h
bWUgdG8gcHJldmVudCBlcnJvcnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW51aiBNaXR0
YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMTYuMS5iYiAgICAgICAgICAgICB8IDQNCj4gPiAr
Ky0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtDQo+ID4gcGx1Z2lucy1nb29kXzEuMTYuMS5iYiBiL21ldGEvcmVjaXBl
cy0NCj4gPiBtdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MTYuMS5iYg0KPiA+IGluZGV4IGE2ZWI5OTg2ZGQuLjA3YTBiZjUwODUgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LQ0KPiA+IGdvb2RfMS4xNi4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLQ0KPiA+IGdvb2RfMS4xNi4xLmJiDQo+ID4g
QEAgLTU1LDcgKzU1LDcgQEAgUEFDS0FHRUNPTkZJR1t4MTFdICAgICAgICA9DQo+ID4gIiR7WDEx
RU5BQkxFT1BUU30sJHtYMTFESVNBQkxFT1BUU30sJHtYMTFERVBFTkRTfSINCj4gPiAgIyBUaGlz
IGlzIGJldHRlciBkb25lIGluIGEgc2VwYXJhdGUgcXQ1IGxheWVyICh3aGljaCB0aGVuIHNob3Vs
ZA0KPiA+IGFkZCBhICJxdDUiIHBhY2thZ2Vjb25maWcNCj4gPiAgIyBpbiBhIGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2QgYmJhcHBlbmQpLg0KPiA+IA0KPiA+IC1FWFRSQV9PRUNPTkYgKz0gIiBc
DQo+ID4gK0VYVFJBX09FTUVTT04gKz0gIiBcDQo+ID4gICAgICAtRGFhbGliPWRpc2FibGVkIFwN
Cj4gPiAgICAgIC1EZGlyZWN0c291bmQ9ZGlzYWJsZWQgXA0KPiA+ICAgICAgLURkdj1kaXNhYmxl
ZCBcDQo+ID4gQEAgLTY0LDcgKzY0LDcgQEAgRVhUUkFfT0VDT05GICs9ICIgXA0KPiA+ICAgICAg
LURvc3M0PWRpc2FibGVkIFwNCj4gPiAgICAgIC1Eb3N4YXVkaW89ZGlzYWJsZWQgXA0KPiA+ICAg
ICAgLURvc3h2aWRlbz1kaXNhYmxlZCBcDQo+ID4gLSAgICAtRHF0PWRpc2FibGVkIFwNCj4gPiAr
ICAgIC1EcXQ1PWRpc2FibGVkIFwNCj4gDQo+IHRoaXMgcGVyaGFwcyBzaG91bGQgYmUgYSBwYWNr
YWdlY29uZmlnIHNvIHBlb3BsZSB1c2luZyBtZXRhLXF0NSBjYW4NCj4gZW5hYmxlIGl0DQoNClll
cyBwcm9iYWJseSBidXQgaW4gYSBzZXBhcmF0ZSBjaGFuZ2UgSSB0aGluay4gVGhpcyBqdXN0IGVu
c3VyZXMgdGhhdA0KdGhlIHJpZ2h0IG9wdGlvbnMgYXJlIHVzZWQgYW5kIG5vdGhpbmcgZWxzZSBp
cyBjaGFuZ2VkLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4gPiAgICAgIC1Ec2hvdXQyPWRp
c2FibGVkIFwNCj4gPiAgICAgIC1EdHdvbGFtZT1kaXNhYmxlZCBcDQo+ID4gICAgICAtRHdhdmVm
b3JtPWRpc2FibGVkIFwNCj4gPiAtLQ0KPiA+IDIuMjQuMQ0KPiA+IA0KPiA+IC0tDQo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVuZW1i
ZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

