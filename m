Return-Path: <saul.wold@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0565371AC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:21:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 14 Feb 2017 22:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,164,1484035200"; d="scan'208";a="934038310"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga003.jf.intel.com with ESMTP; 14 Feb 2017 22:21:19 -0800
Received: from orsmsx111.amr.corp.intel.com ([169.254.12.23]) by
	ORSMSX106.amr.corp.intel.com ([169.254.1.225]) with mapi id
	14.03.0248.002; Tue, 14 Feb 2017 22:21:19 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "Sullivan, California L" <california.l.sullivan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] kernel.bbclass: Make sanity check
	opt-out and provide easy opt-out
Thread-Index: AQHSh1O4YJcH/oMoeEWRq1MRdBpG0Q==
Date: Wed, 15 Feb 2017 06:21:18 +0000
Message-ID: <1487139667.10318.32.camel@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
In-Reply-To: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.195.61]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Wed, 15 Feb 2017 06:21:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E6C146057D62C4CA2F6164C7B185643@intel.com>
Content-Transfer-Encoding: base64

DQpUaGlzIHNob3VsZCBhbHNvIGJlIGFwcGxpZWQgTW9ydHkgcGxlYXNlDQoNClNhdSENCg0KT24g
VGh1LCAyMDE3LTAyLTA5IGF0IDE1OjU1IC0wODAwLCBDYWxpZm9ybmlhIFN1bGxpdmFuIHdyb3Rl
Og0KPiBIYXZpbmcgbm8gb3B0LW91dCBtZXRob2QgYW5kIGFkZGluZyB0aGUgdGFzayB0byBsaW51
eC15b2N0by5pbmMgd2FzDQo+IGNhdXNpbmcgaXNzdWVzLiBGb3IgZXhhbXBsZSwgbGludXgteW9j
dG8tZGV2IHdvdWxkIG9mdGVuIGZhaWwgYmVjYXVzZQ0KPiBpdCB1c2VzIEFVVE9JTkMgd2l0aCBu
byB3YXkgdG8gZHluYW1pY2FsbHkgY2hhbmdlIHRoZSBQVi4NCj4gDQo+IEFkZCBhIHZhcmlhYmxl
IHRvIHR1cm4gb2ZmIHRoZSBzYW5pdHkgY2hlY2sgdG8gZWFzaWx5IG9wdCBvdXQuDQo+IEFkZCB0
aGUgdGFzayB0byB0aGUga2VybmVsIGJ1aWxkIGJ5IGRlZmF1bHQgc28gdGhhdCBpdCBpcyBub3Qg
Ym90aA0KPiBvcHQtaW4gYW5kIG9wdCBvdXQuDQo+IFNldCB0aGUgb3B0LW91dCB2YXJpYWJsZSBp
biBsaW51eC15b2N0by1kZXYsIGZpeGluZyB0aGUgaXNzdWUgd2l0aA0KPiBBVVRPSU5DLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2FsaWZvcm5pYSBTdWxsaXZhbiA8Y2FsaWZvcm5pYS5sLnN1bGxp
dmFuQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCA4ICsrKysrKystDQo+IMKgbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1kZXYuYmIgfCAxICsNCj4gwqBtZXRhL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLmluY8KgwqDCoMKgfCAxIC0NCj4gwqAzIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MNCj4gYi9tZXRhL2NsYXNzZXMva2Vy
bmVsLmJiY2xhc3MNCj4gaW5kZXggZjQ2MmIyZi4uMzk2OGQ4YiAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJj
bGFzcw0KPiBAQCAtMzI1LDYgKzMyNSwxMCBAQCBkb19pbnN0YWxsW3ByZWZ1bmNzXSArPSAicGFj
a2FnZV9nZXRfYXV0b19wciINCj4gwqANCj4gwqAjIE11c3QgYmUgcmFuIG5vIGVhcmxpZXIgdGhh
biBhZnRlciBkb19rZXJuZWxfY2hlY2tvdXQgb3IgZWxzZQ0KPiBNYWtlZmlsZSB3b24ndCBiZSBp
biAke1N9L01ha2VmaWxlDQo+IMKgZG9fa2VybmVsX3ZlcnNpb25fc2FuaXR5X2NoZWNrKCkgew0K
PiArCWlmIFsgIngke0tFUk5FTF9WRVJTSU9OX1NBTklUWV9TS0lQfSIgPSAieDEiIF07IHRoZW4N
Cj4gKwkJZXhpdCAwDQo+ICsJZmkNCj4gKw0KPiDCoAkjIFRoZSBNYWtlZmlsZSBkZXRlcm1pbmVz
IHRoZSBrZXJuZWwgdmVyc2lvbiBzaG93biBhdA0KPiBydW50aW1lDQo+IMKgCSMgRG9uJ3QgdXNl
IEtFUk5FTF9WRVJTSU9OIGJlY2F1c2UgdGhlIGhlYWRlcnMgaXQgZ3JhYnMgdGhlDQo+IHZlcnNp
b24gZnJvbSBhcmVuJ3QgZ2VuZXJhdGVkIHVudGlsIGRvX2NvbXBpbGUNCj4gwqAJVkVSU0lPTj0k
KGdyZXAgIl5WRVJTSU9OID0iICR7U30vTWFrZWZpbGUgfCBzZWQgcy8uKj1cICovLykNCj4gQEAg
LTM0OCwxMSArMzUyLDEzIEBAIGRvX2tlcm5lbF92ZXJzaW9uX3Nhbml0eV9jaGVjaygpIHsNCj4g
wqAJcmVnPSIke3JlZ30ke0VYVFJBVkVSU0lPTn0iDQo+IMKgDQo+IMKgCWlmIFsgLXogYGVjaG8g
JHtQVn0gfCBncmVwIC1FICIke3JlZ30iYCBdOyB0aGVuDQo+IC0JCWJiZmF0YWwgIlBhY2thZ2Ug
VmVyc2lvbiAoJHtQVn0pIGRvZXMgbm90IG1hdGNoIG9mDQo+IGtlcm5lbCBiZWluZyBidWlsdCAo
JHt2ZXJzfSkuIFBsZWFzZSB1cGRhdGUgdGhlIFBWIHZhcmlhYmxlIHRvIG1hdGNoDQo+IHRoZSBr
ZXJuZWwgc291cmNlLiINCj4gKwkJYmJmYXRhbCAiUGFja2FnZSBWZXJzaW9uICgke1BWfSkgZG9l
cyBub3QgbWF0Y2ggb2YNCj4ga2VybmVsIGJlaW5nIGJ1aWx0ICgke3ZlcnN9KS4gUGxlYXNlIHVw
ZGF0ZSB0aGUgUFYgdmFyaWFibGUgdG8gbWF0Y2gNCj4gdGhlIGtlcm5lbCBzb3VyY2Ugb3Igc2V0
IEtFUk5FTF9WRVJTSU9OX1NBTklUWV9TS0lQPVwiMVwiIGluIHlvdXINCj4gcmVjaXBlLiINCj4g
wqAJZmkNCj4gwqAJZXhpdCAwDQo+IMKgfQ0KPiDCoA0KPiArYWRkdGFzayBrZXJuZWxfdmVyc2lv
bl9zYW5pdHlfY2hlY2sgYWZ0ZXIgZG9fa2VybmVsX21ldGFkYXRhDQo+IGRvX2tlcm5lbF9jaGVj
a291dCBiZWZvcmUgZG9fY29tcGlsZQ0KPiArDQo+IMKgYWRkdGFzayBzaGFyZWRfd29ya2RpciBh
ZnRlciBkb19jb21waWxlIGJlZm9yZQ0KPiBkb19jb21waWxlX2tlcm5lbG1vZHVsZXMNCj4gwqBh
ZGR0YXNrIHNoYXJlZF93b3JrZGlyX3NldHNjZW5lDQo+IMKgDQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLWRldi5iYg0KPiBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tZGV2LmJiDQo+IGluZGV4IDBjZGE1NTMuLjE0MTA5
NTQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8t
ZGV2LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tZGV2
LmJiDQo+IEBAIC00MywzICs0Myw0IEBAIEtFUk5FTF9GRUFUVVJFU19hcHBlbmRfcWVtdXg4Nj0i
IGNmZy9zb3VuZC5zY2MNCj4gY2ZnL3BhcmF2aXJ0X2t2bS5zY2MiDQo+IMKgS0VSTkVMX0ZFQVRV
UkVTX2FwcGVuZF9xZW11eDg2LTY0PSIgY2ZnL3NvdW5kLnNjYyINCj4gwqBLRVJORUxfRkVBVFVS
RVNfYXBwZW5kID0gIiAke0BiYi51dGlscy5jb250YWlucygiVFVORV9GRUFUVVJFUyIsDQo+ICJt
eDMyIiwgIiBjZmcveDMyLnNjYyIsICIiICxkKX0iDQo+IMKgDQo+ICtLRVJORUxfVkVSU0lPTl9T
QU5JVFlfU0tJUCA9ICIxIg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51
eC9saW51eC15b2N0by5pbmMNCj4gYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlv
Y3RvLmluYw0KPiBpbmRleCA1NTY1NDZmLi4zZWEzZTQwIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLmluYw0KPiBAQCAtNjQsNyArNjQsNiBAQCBkb19pbnN0
YWxsX2FwcGVuZCgpew0KPiDCoH0NCj4gwqANCj4gwqAjIGV4dHJhIHRhc2tzDQo+IC1hZGR0YXNr
IGtlcm5lbF92ZXJzaW9uX3Nhbml0eV9jaGVjayBhZnRlciBkb19rZXJuZWxfbWV0YWRhdGENCj4g
ZG9fa2VybmVsX2NoZWNrb3V0IGJlZm9yZSBkb19jb21waWxlDQo+IMKgYWRkdGFzayBrZXJuZWxf
bGlua19pbWFnZXMgYWZ0ZXIgZG9fY29tcGlsZSBiZWZvcmUgZG9fc3RyaXANCj4gwqBhZGR0YXNr
IHZhbGlkYXRlX2JyYW5jaGVzIGJlZm9yZSBkb19wYXRjaCBhZnRlciBkb19rZXJuZWxfY2hlY2tv
dXQNCj4gwqBhZGR0YXNrIGtlcm5lbF9jb25maWdjaGVjayBhZnRlciBkb19jb25maWd1cmUgYmVm
b3JlIGRvX2NvbXBpbGUNCj4gLS3CoA0KPiAyLjUuNQ0KPiA=

