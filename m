Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DB5B278287
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 12:52:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 05:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="866245332"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2017 05:52:57 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.126]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.9]) with mapi id
	14.03.0319.002; Fri, 9 Jun 2017 13:52:12 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Ohly, Patrick" <patrick.ohly@intel.com>
Thread-Topic: [OE-core] [PATCH v2 01/25] bitbake.conf: support for merged
	usr with DISTRO_FEATURE usrmerge
Thread-Index: AQHS34SLF2f8zG32RUaRu44S1XEiR6IZZcUAgAAqkACAAOMrAIAB+00A
Date: Fri, 9 Jun 2017 12:52:12 +0000
Message-ID: <1497012770.756.9.camel@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1496836331.6630.213.camel@linuxfoundation.org>
	<1496845904.30163.102.camel@intel.com>
	<2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
	<1496903828.6630.215.camel@linuxfoundation.org>
In-Reply-To: <1496903828.6630.215.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.170]
MIME-Version: 1.0
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Fri, 09 Jun 2017 12:52:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <95C5D4929C8A144BBE9892A6FEB86AB4@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTA2LTA4IGF0IDA3OjM3ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDE3LTA2LTA3IGF0IDE3OjA0ICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQg
d3JvdGU6DQo+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+ID4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmddIE9uDQo+ID4gPiBCZWhhbGYNCj4gPiA+IE9mDQo+ID4gPiBQYXRy
aWNrIE9obHkNCj4gPiA+IFNlbnQ6IGRlbiA3IGp1bmkgMjAxNyAxNjozMg0KPiA+ID4gVG86IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+ID4g
Q2M6IEpvc2h1YSBMb2NrIDxqb3NodWEuZy5sb2NrQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC0N
Cj4gPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0ggdjIgMDEvMjVdIGJpdGJha2UuY29uZjogc3VwcG9ydCBmb3INCj4gPiA+
IG1lcmdlZCB1c3Igd2l0aCBESVNUUk9fRkVBVFVSRSB1c3JtZXJnZQ0KPiA+ID4gDQo+ID4gPiBP
biBXZWQsIDIwMTctMDYtMDcgYXQgMTI6NTIgKzAxMDAsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0K
PiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdlZCwgMjAxNy0wMi0yMiBhdCAxMDoyNiAr
MDIwMCwgQW1hcm5hdGggVmFsbHVyaSB3cm90ZToNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBGcm9tOiBKb3NodWEgTG9jayA8am9zaHVhLmcubG9ja0BpbnRlbC5jb20+DQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gTW9kaWZ5IGJpbmRpciwgbGliZGlyIGFuZCBzYmluZGlyIHRvIGJl
IGV4ZWNfcHJlZml4LyRkLA0KPiA+ID4gPiA+IHJhdGhlcg0KPiA+ID4gPiA+IHRoYW4NCj4gPiA+
ID4gPiBiYXNlX3ByZWZpeC8kZCwgd2hlbiB0aGUgdXNybWVyZ2UgRElTVFJPX0ZFQVRVUkUgaXMg
ZW5hYmxlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgTG9j
ayA8am9zaHVhLmcubG9ja0BpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gwqBt
ZXRhL2NvbmYvYml0YmFrZS5jb25mIHwgMTIgKysrKysrKystLS0tDQo+ID4gPiA+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiBJIHdh
cyBhc2tlZCB0byBjbGFyaWZ5IHRoZSBzdGF0dXMgb2YgdGhpcyBzZXJpZXMuIFdlJ3ZlIHRha2Vu
DQo+ID4gPiA+IG1hbnkgb2YNCj4gPiA+ID4gdGhlIGNoYW5nZXMgYnV0IHRoZSBjb3JlIGNoYW5n
ZXMgdG8gYml0YmFrZS5jb25mIGhhdmVuJ3QgYmVlbg0KPiA+ID4gPiBtZXJnZWQuDQo+ID4gPiA+
IA0KPiA+ID4gPiBSb3NzL0kgZGlzY3Vzc2VkIGl0IGFuZCB3ZSBib3RoIGZlZWwgdGhhdCB0aGUg
Yml0YmFrZS5jb25mIG1ha2UNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGZpbGUgcHJldHR5IHVucmVh
ZGFibGUuIFdlJ2QgdGhlcmVmb3JlIGxpa2UgdG8gc2VlIHRoaXMNCj4gPiA+ID4gaW1wbGVtZW50
ZWQNCj4gPiA+ID4gYXMgYSAuaW5jIGZpbGUgd2hpY2ggZ2V0cyBpbmNsdWRlZCB3aGVuIHRoZSBy
ZWxldmFudA0KPiA+ID4gPiBESVNUUk9fRkVBVFVSRcKgDQo+ID4gPiA+IGlzIHNldCAob3IgY291
bGQganVzdCBiZSBpbmNsdWRlZCBieSB0aGUgYXBwcm9wcmlhdGUgZGlzdHJvDQo+ID4gPiA+IGNv
bmZpZ3MpLsKgDQo+ID4gPiA+IFRoaXMgLmluYyBmaWxlIHdvdWxkIHRoZW4gc2ltcGx5IG92ZXJy
aWRlIHRoZSBwYXRocy4gSSBiZWxpZXZlDQo+ID4gPiA+IHRoaXPCoA0KPiA+ID4gPiB3b3VsZCBi
ZSBhIGxvdCBtb3JlIHJlYWRhYmxlIHRoYW4gdGhlIGN1cnJlbnQgYXBwcm9hY2ggd2hpY2ggaXMN
Cj4gPiA+ID4gYcKgDQo+ID4gPiA+IGtleSBjb25jZXJuIGluIHRoZSBjb3JlIGNvbmZpZy4NCj4g
PiBJIGFjdHVhbGx5IHN1Z2dlc3RlZCBhbiBhbHRlcm5hdGl2ZSBjaGFuZ2UgdG8gYml0YmFrZS5j
b25mIGluIHRoZQ0KPiA+IEdpdEh1YsKgDQo+ID4gcmV2aWV3IHRoYXQgY2hhbmdlcyBiaXRiYWtl
LmNvbmYgdG8gdGFrZSB1c3JtZXJnZSBpbnRvIGFjY291bnQ6DQo+ID4gDQo+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL2F2YWxsdXJpL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8xNjU1YTkzMjM4OTAy
YQ0KPiA+IDg4DQo+ID4gMzA1MmE1NWQ4OGFlMTRkZDAyMjQzNTMwDQo+ID4gDQo+ID4gSSB3aWxs
IGluY2x1ZGUgbXkgc3VnZ2VzdGVkIHNvbHV0aW9uIGhlcmUgc2luY2UgSSB3aWxsIHJlZmVyIHRv
IGl0wqANCj4gPiBiZWxvdzoNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL2JpdGJh
a2UuY29uZiBiL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gPiBpbmRleCAwZjI3ZTkyZTk2Li4z
MDVlYWZmNTgzIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gPiAr
KysgYi9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+ID4gQEAgLTE3LDExICsxNywxMyBAQCBleHBv
cnQgYmFzZV9wcmVmaXggPSAiIg0KPiA+IMKgZXhwb3J0IHByZWZpeCA9ICIvdXNyIg0KPiA+IMKg
ZXhwb3J0IGV4ZWNfcHJlZml4ID0gIiR7cHJlZml4fSINCj4gPiDCoA0KPiA+ICtyb290X3ByZWZp
eCA9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3Vzcm1lcmdlJywN
Cj4gPiAnJHtleGVjX3ByZWZpeH0nLCAnJHtiYXNlX3ByZWZpeH0nLCBkKX0iDQo+ID4gKw0KPiA+
IMKgIyBCYXNlIHBhdGhzDQo+ID4gLWV4cG9ydCBiYXNlX2JpbmRpciA9ICIke2Jhc2VfcHJlZml4
fS9iaW4iDQo+ID4gLWV4cG9ydCBiYXNlX3NiaW5kaXIgPSAiJHtiYXNlX3ByZWZpeH0vc2JpbiIN
Cj4gPiAtZXhwb3J0IGJhc2VfbGliZGlyID0gIiR7YmFzZV9wcmVmaXh9LyR7YmFzZWxpYn0iDQo+
ID4gLWV4cG9ydCBub25hcmNoX2Jhc2VfbGliZGlyID0gIiR7YmFzZV9wcmVmaXh9L2xpYiINCj4g
PiArZXhwb3J0IGJhc2VfYmluZGlyID0gIiR7cm9vdF9wcmVmaXh9L2JpbiINCj4gPiArZXhwb3J0
IGJhc2Vfc2JpbmRpciA9ICIke3Jvb3RfcHJlZml4fS9zYmluIg0KPiA+ICtleHBvcnQgYmFzZV9s
aWJkaXIgPSAiJHtyb290X3ByZWZpeH0vJHtiYXNlbGlifSINCj4gPiArZXhwb3J0IG5vbmFyY2hf
YmFzZV9saWJkaXIgPSAiJHtyb290X3ByZWZpeH0vbGliIg0KPiA+IMKgDQo+ID4gwqAjIEFyY2hp
dGVjdHVyZSBpbmRlcGVuZGVudCBwYXRocw0KPiA+IMKgZXhwb3J0IHN5c2NvbmZkaXIgPSAiJHti
YXNlX3ByZWZpeH0vZXRjIg0KPiA+IA0KPiA+IEkgdGhpbmsgdGhhdCBiZXR0ZXIgbWFpbnRhaW5z
IHRoZSByZWFkYWJpbGl0eSBvZiB0aGUgYml0YmFrZS5jb25mDQo+ID4gZmlsZSzCoA0KPiA+IHdo
aWxlIG1ha2luZyB0aGUgJHJvb3RfcHJlZml4IHZhcmlhYmxlIGF2YWlsYWJsZSBhcyBpdCBjYW4g
YmUNCj4gPiB1c2VmdWwNCj4gPiBpbsKgDQo+ID4gaXRzIG93biAoZS5nLiwgaW4gdGhlIHN5c3Rl
bWQgcmVjaXBlKS4NCj4gQWdyZWVkLCBJJ20gaGFwcGllciB3aXRoIHRoaXMgYW5kIGNhbiBwcm9i
YWJseSBhY2NlcHQgYSBzaW5nbGUNCj4gRElTVE9fRkVBVFVSRVMgbGluZSB3aXRob3V0IHRoZSAu
aW5jIHN0dWZmLi4uDQpSaWNoYXJkLCBXZSBuZWVkIHRoZSBESVNUT19GRUFUVVJFIGNoZWNrIGV2
ZW4gZm9yIHNldHRpbmcNCm5hdGl2ZXNka19iYXNlXyBwYXRocywgQXMgbmF0aXZlc2RrcyBjYW5u
b3QgdXNlIHRoaXMgJHtyb290X3ByZWZpeH0uDQoNCityb290X3ByZWZpeF9uYXRpdmVzZGsgPSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsDQondXNybWVyZ2UnLCAnJHtw
cmVmaXhfbmF0aXZlc2RrfScsICcnLCBkKX0iDQotYmFzZV9iaW5kaXJfbmF0aXZlc2RrID0gIi9i
aW4iDQotYmFzZV9zYmluZGlyX25hdGl2ZXNkayA9ICIvc2JpbiINCitiYXNlX2JpbmRpcl9uYXRp
dmVzZGsgPSAiJHtyb290X3ByZWZpeF9uYXRpdmVzZGt9L2JpbiINCitiYXNlX3NiaW5kaXJfbmF0
aXZlc2RrID0gIiR7cm9vdF9wcmVmaXhfbmF0aXZlc2RrfS9zYmluIg0KLWJhc2VfbGliZGlyX25h
dGl2ZXNkayA9ICIvbGliIg0KK2Jhc2VfbGliZGlyX25hdGl2ZXNkayA9ICIke3Jvb3RfcHJlZml4
X25hdGl2ZXNka30vbGliIg0KDQpJZiBvayB3aXRoIHRoaXMsIEkgY2FuIHNlbmQgdGhlIHJldmlz
ZWQgcGF0Y2guDQoNCi0gQW1hcm5hdGg=

