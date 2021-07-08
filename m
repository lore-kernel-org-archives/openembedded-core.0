Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.8361.1625725063322878943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 23:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189828138"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="189828138"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 23:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="482435777"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2021 23:17:29 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 8 Jul 2021 14:17:28 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Thu, 8 Jul 2021 14:17:27 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mingli.yu@windriver.com"
	<mingli.yu@windriver.com>
Subject: Re: [OE-core] [hardknott][PATCH] busybox: fix traceroute failure
Thread-Topic: [OE-core] [hardknott][PATCH] busybox: fix traceroute failure
Thread-Index: AQHXc577DWQLLy6pXUmFhAcKJS4JIas4FH6A
Date: Thu, 8 Jul 2021 06:17:27 +0000
Message-ID: <a47e873a4c7cd91ca798e92f6ecc04c9332037c5.camel@intel.com>
References: <20210708021253.38713-1-mingli.yu@windriver.com>
In-Reply-To: <20210708021253.38713-1-mingli.yu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <574791E81F43E141BD935D61B83BDC00@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIxLTA3LTA4IGF0IDEwOjEyICswODAwLCBZdSwgTWluZ2xpIHdyb3RlOg0KPiBG
cm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPiANCj4gQmFja3BvcnQg
YSBwYXRjaCB0byBmaXggdGhlIGJlbG93IHRyYWNlcm91dGUgZmFpbHVyZToNCj4gwqAkIHRyYWNl
cm91dGUgLWYgNjQgLUkgLW4gLW0gMjQwIDEwLjIyNi40My44NCA0Ng0KPiB0cmFjZXJvdXRlOiBO
TyBPUFQgeCENCg0KV2UgY2FuIGp1c3QgdGFrZSB0aGUgMS4zMy4xIHVwZ3JhZGUgZnJvbSBtYXN0
ZXIgYnJhbmNoIGluc3RlYWQgYXMgaXQncw0KYSBidWcgZml4IHVwZGF0ZToNCg0KaHR0cHM6Ly9n
aXQuYnVzeWJveC5uZXQvYnVzeWJveC9sb2cvP2g9MV8zM19zdGFibGUmcXQ9cmFuZ2UmcT0xXzMz
XzEuLi4xXzMzXzANCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1p
bmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiDCoC4uLi8wMDAxLXRy
YWNlcm91dGUtZml4LW9wdGlvbi1wYXJzaW5nLnBhdGNowqAgfCAzMSArKysrKysrKysrKysrKysr
KysrDQo+IMKgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzMuMC5iYsKgwqAg
fMKgIDEgKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvMDAwMS10cmFj
ZXJvdXRlLQ0KPiBmaXgtb3B0aW9uLXBhcnNpbmcucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvMDAwMS10cmFjZXJvdXRlLWZpeC0NCj4g
b3B0aW9uLXBhcnNpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gv
MDAwMS0NCj4gdHJhY2Vyb3V0ZS1maXgtb3B0aW9uLXBhcnNpbmcucGF0Y2gNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMWUwM2I3ZGJmYg0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC8wMDAxLXRyYWNl
cm91dGUtZml4LW9wdGlvbi0NCj4gcGFyc2luZy5wYXRjaA0KPiBAQCAtMCwwICsxLDMxIEBADQo+
ICtGcm9tIDg5MzU4YTcxMzFkM2U3NWM3NGFmODM0YmIxMTdiNGZhZDc5MTQ5ODMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxDQo+ICtGcm9tOiBEZW55cyBWbGFzZW5rbyA8dmRhLmxpbnV4QGdvb2ds
ZW1haWwuY29tPg0KPiArRGF0ZTogVHVlLCAyIEZlYiAyMDIxIDEzOjQ4OjIxICswMTAwDQo+ICtT
dWJqZWN0OiBbUEFUQ0hdIHRyYWNlcm91dGU6IGZpeCBvcHRpb24gcGFyc2luZw0KPiArDQo+ICtG
aXggb3B0aW9uIHBhcnNpbmcNCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiBb
aHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC9jb21taXQvP2g9MV8zM19zdGFibGUmaWQ9
ODkzNThhNzEzMWQzZTc1Yzc0YWY4MzRiYjExN2I0ZmFkNzkxNDk4Mw0KPiBdDQo+ICsNCj4gK1Np
Z25lZC1vZmYtYnk6IERlbnlzIFZsYXNlbmtvIDx2ZGEubGludXhAZ29vZ2xlbWFpbC5jb20+DQo+
ICtTaWduZWQtb2ZmLWJ5OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPiAr
LS0tDQo+ICsgbmV0d29ya2luZy90cmFjZXJvdXRlLmMgfCAyICstDQo+ICsgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9u
ZXR3b3JraW5nL3RyYWNlcm91dGUuYyBiL25ldHdvcmtpbmcvdHJhY2Vyb3V0ZS5jDQo+ICtpbmRl
eCAzZjFhOWFiNDYuLjI5ZjVlNDgwYiAxMDA2NDQNCj4gKy0tLSBhL25ldHdvcmtpbmcvdHJhY2Vy
b3V0ZS5jDQo+ICsrKysgYi9uZXR3b3JraW5nL3RyYWNlcm91dGUuYw0KPiArQEAgLTg5Niw3ICs4
OTYsNyBAQCB0cmFjZXJvdXRlX2luaXQoaW50IG9wLCBjaGFyICoqYXJndikNCj4gKyANCj4gK8Kg
wqDCoMKgwqDCoMKgb3AgfD0gZ2V0b3B0MzIoYXJndiwgIl4iDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBPUFRfU1RSSU5HDQo+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCJcMCIgIi0xOngteCIgLyogbWluaW11bSAxIGFyZyAqLw0KPiArK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAiXDAiICItMSIgLyogbWluaW11bSAxIGFyZyAqLw0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLCAmdG9zX3N0ciwgJmRldmljZSwgJm1heF90dGxfc3RyLCAmcG9y
dF9zdHIsDQo+ICZucHJvYmVzX3N0cg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LCAmc291cmNlLCAmd2FpdHRpbWVfc3RyLCAmcGF1c2Vtc2Vjc19zdHIsDQo+ICZmaXJzdF90dGxf
c3RyDQo+ICvCoMKgwqDCoMKgwqDCoCk7DQo+ICstLSANCj4gKzIuMzEuMQ0KPiArDQo+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3hfMS4zMy4wLmJiDQo+IGIv
bWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzMuMC5iYg0KPiBpbmRleCBiMmEz
MGJhMTZmLi4yZDE4ZWMwNzJjIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9idXN5
Ym94L2J1c3lib3hfMS4zMy4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gv
YnVzeWJveF8xLjMzLjAuYmINCj4gQEAgLTQ4LDYgKzQ4LDcgQEAgU1JDX1VSSSA9DQo+ICJodHRw
czovL2J1c3lib3gubmV0L2Rvd25sb2Fkcy9idXN5Ym94LSR7UFZ9LnRhci5iejI7bmFtZT10YXJi
YWxswqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL3BncmVwLmNmZ8KgXA0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IGZpbGU6Ly8wMDAxLWRlY29tcHJlc3NfZ3VuemlwLUZp
eC1Eb1MtaWYtZ3ppcC1pcy1jb3JydXB0LnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqANCj4gZmlsZTovLzAwMDEtZ2VuX2J1aWxkX2ZpbGVzLVVzZS1DLWxvY2FsZS13aGVuLWNhbGxp
bmctc2VkLW9uLWdsby5wYXRjaMKgDQo+IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6
Ly8wMDAxLXRyYWNlcm91dGUtZml4LW9wdGlvbi1wYXJzaW5nLnBhdGNowqBcDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIg0KPiDCoFNSQ19VUklfYXBwZW5kX2xpYmMtbXVzbCA9ICIgZmlsZTov
L211c2wuY2ZnwqAiDQo+IMKgDQo+IA0KPiANCj4gDQoNCg==
