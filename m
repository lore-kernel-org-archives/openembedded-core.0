Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0331360786
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 03:07:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 19:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,459,1574150400"; d="scan'208";a="228962137"
Received: from kmsmsx157.gar.corp.intel.com ([172.21.138.134])
	by orsmga008.jf.intel.com with ESMTP; 18 Feb 2020 19:07:49 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	kmsmsx157.gar.corp.intel.com (172.21.138.134) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Feb 2020 11:04:33 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.200]) with mapi id
	14.03.0439.000; Wed, 19 Feb 2020 11:04:33 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-plugins-good: change
	EXTRA_OECONF -> EXTRA_OEMESON
Thread-Index: AQHV5s30/un5qhZ4LkCfcXoRAOlX76ghSPKAgAADVQCAAAKeAA==
Date: Wed, 19 Feb 2020 03:04:33 +0000
Message-ID: <92a4baed36443295a7ce12444120bb1afb09f1e5.camel@intel.com>
References: <20200219023641.3308-1-anuj.mittal@intel.com>
	<CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
	<bc67d00aa872e879748e6b05fe3a104304194c07.camel@intel.com>
	<c03634be-a243-4975-97fc-0211313ab32a@gmail.com>
In-Reply-To: <c03634be-a243-4975-97fc-0211313ab32a@gmail.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 03:07:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEA15131CA07AA4A920D57001A8CBD30@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAyLTE4IGF0IDE4OjU1IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
Mi8xOC8yMCA2OjQzIFBNLCBNaXR0YWwsIEFudWogd3JvdGU6DQo+ID4gT24gVHVlLCAyMDIwLTAy
LTE4IGF0IDE4OjM5IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgRmViIDE4
LCAyMDIwIGF0IDY6MzcgUE0gQW51aiBNaXR0YWwgPA0KPiA+ID4gYW51ai5taXR0YWxAaW50ZWwu
Y29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IFVzZSB0aGUgY29ycmVjdCB2YXJpYWJsZSBzbyBv
cHRpb25zIGFjdHVhbGx5IGdldCB1c2VkIGFuZCB1c2UNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGNv
cnJlY3QgcXQgb3B0aW9uIG5hbWUgdG8gcHJldmVudCBlcnJvcnMuDQo+ID4gPiA+IA0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gICAuLi4vZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLQ0K
PiA+ID4gPiBnb29kXzEuMTYuMS5iYiAgICAgICAgICAgICB8IDQNCj4gPiA+ID4gKystLQ0KPiA+
ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC0NCj4gPiA+ID4gcGx1Z2lucy1nb29kXzEuMTYuMS5iYiBiL21l
dGEvcmVjaXBlcy0NCj4gPiA+ID4gbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtZ29vZF8xLjE2LjEuYmINCj4gPiA+ID4gaW5kZXggYTZlYjk5ODZkZC4uMDdhMGJmNTA4
NSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLQ0KPiA+ID4gPiBnb29kXzEuMTYuMS5iYg0KPiA+ID4gPiAr
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtDQo+ID4gPiA+IGdvb2RfMS4xNi4xLmJiDQo+ID4gPiA+IEBAIC01NSw3ICs1NSw3IEBAIFBB
Q0tBR0VDT05GSUdbeDExXSAgICAgICAgPQ0KPiA+ID4gPiAiJHtYMTFFTkFCTEVPUFRTfSwke1gx
MURJU0FCTEVPUFRTfSwke1gxMURFUEVORFN9Ig0KPiA+ID4gPiAgICMgVGhpcyBpcyBiZXR0ZXIg
ZG9uZSBpbiBhIHNlcGFyYXRlIHF0NSBsYXllciAod2hpY2ggdGhlbg0KPiA+ID4gPiBzaG91bGQN
Cj4gPiA+ID4gYWRkIGEgInF0NSIgcGFja2FnZWNvbmZpZw0KPiA+ID4gPiAgICMgaW4gYSBnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1nb29kIGJiYXBwZW5kKS4NCj4gPiA+ID4gDQo+ID4gPiA+IC1FWFRS
QV9PRUNPTkYgKz0gIiBcDQo+ID4gPiA+ICtFWFRSQV9PRU1FU09OICs9ICIgXA0KPiA+ID4gPiAg
ICAgICAtRGFhbGliPWRpc2FibGVkIFwNCj4gPiA+ID4gICAgICAgLURkaXJlY3Rzb3VuZD1kaXNh
YmxlZCBcDQo+ID4gPiA+ICAgICAgIC1EZHY9ZGlzYWJsZWQgXA0KPiA+ID4gPiBAQCAtNjQsNyAr
NjQsNyBAQCBFWFRSQV9PRUNPTkYgKz0gIiBcDQo+ID4gPiA+ICAgICAgIC1Eb3NzND1kaXNhYmxl
ZCBcDQo+ID4gPiA+ICAgICAgIC1Eb3N4YXVkaW89ZGlzYWJsZWQgXA0KPiA+ID4gPiAgICAgICAt
RG9zeHZpZGVvPWRpc2FibGVkIFwNCj4gPiA+ID4gLSAgICAtRHF0PWRpc2FibGVkIFwNCj4gPiA+
ID4gKyAgICAtRHF0NT1kaXNhYmxlZCBcDQo+ID4gPiB0aGlzIHBlcmhhcHMgc2hvdWxkIGJlIGEg
cGFja2FnZWNvbmZpZyBzbyBwZW9wbGUgdXNpbmcgbWV0YS1xdDUNCj4gPiA+IGNhbg0KPiA+ID4g
ZW5hYmxlIGl0DQo+ID4gWWVzIHByb2JhYmx5IGJ1dCBpbiBhIHNlcGFyYXRlIGNoYW5nZSBJIHRo
aW5rLiBUaGlzIGp1c3QgZW5zdXJlcw0KPiA+IHRoYXQNCj4gPiB0aGUgcmlnaHQgb3B0aW9ucyBh
cmUgdXNlZCBhbmQgbm90aGluZyBlbHNlIGlzIGNoYW5nZWQuDQo+IA0KPiBwZXJoYXBzIG5vLCBz
aW5jZSBpdCB3aWxsIHJlZ3Jlc3MgbWV0YS1xdDUgd2hpY2ggYWxyZWFkeSBkb2VzDQo+IHNvbWV0
aGluZyANCj4gbGlrZSB0aGlzDQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vbWV0YS1xdDUvbWV0
YS1xdDUvYmxvYi9tYXN0ZXIvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXyUyNS5iYmFwcGVuZA0KPiANCj4gDQo+IHRoaXMgYmVpbmcgd3Jvbmcg
aW4gT0UtY29yZSB3YXMgb2sgZm9yIG1ldGEtcXQ1Lg0KDQpPa2F5LCBzaG91bGQgdGhhdCBQQUNL
QUdFQ09ORklHIGJlIGFkZGVkIGhlcmU/IEkgZG9uJ3QgdXNlIG9yIHRlc3QgcXQNCnNvIGNhbid0
IHRlc3QgdGhlIGNoYW5nZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

