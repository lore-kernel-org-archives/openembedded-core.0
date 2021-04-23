Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.5953.1619157255755149708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: sza9taMypnIbeZWK6DSOgYe2MS4j6Uo0LecZrrxCRXyHhVRVOpW5y3QNcO2bHpqHdqvndEUPsT
 lMjbIzdvy1Jw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="183151060"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; 
   d="scan'208";a="183151060"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 22:54:13 -0700
IronPort-SDR: uNv5TZ9/Fc0M1mj8h9chXwCfFv8mXBuHNYwk0xG/csRXWDjl1lrpfzSxQLOyFFVqssZC6eqOnh
 Y47cQDvCP9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; 
   d="scan'208";a="424136448"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by orsmga007.jf.intel.com with ESMTP; 22 Apr 2021 22:54:13 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 23 Apr 2021 13:54:12 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Fri, 23 Apr 2021 13:54:12 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][hardknott] gdk-pixbuf: fix CVE-2021-20240
Thread-Topic: [OE-core] [PATCH][hardknott] gdk-pixbuf: fix CVE-2021-20240
Thread-Index: AQHXN07nTO4XoxehGUGC8rIdy+rRgarBFW4A
Date: Fri, 23 Apr 2021 05:54:12 +0000
Message-ID: <04ce3eb269095b9a704ad969b9b5e242fa3df4c8.camel@intel.com>
References: <20210422080959.3147-1-changqing.li@windriver.com>
In-Reply-To: <20210422080959.3147-1-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9389C891E048ED41B2D2A9F1A6879B10@intel.com>
Content-Transfer-Encoding: base64

VGhpcyBzaG91bGQgYmUgcHJvcG9zZWQgZm9yIG1hc3RlciB0b28uIFdlJ3JlIHN0aWxsIGF0IDIu
NDAuMCB0aGVyZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCk9uIFRodSwgMjAyMS0wNC0yMiBhdCAx
NjowOSArMDgwMCwgQ2hhbmdxaW5nIExpIHdyb3RlOg0KPiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNo
YW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5n
IExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IMKgLi4uL2dkay1waXhi
dWYvQ1ZFLTIwMjEtMjAyNDAucGF0Y2jCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQwDQo+ICsrKysr
KysrKysrKysrKysrKysNCj4gwqAuLi4vZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDAuMC5iYsKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2Vy
dGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdub21lL2dkay1w
aXhidWYvZ2RrLXBpeGJ1Zi9DVkUtDQo+IDIwMjEtMjAyNDAucGF0Y2gNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL0NWRS0yMDIxLQ0K
PiAyMDI0MC5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYv
Q1ZFLTIwMjEtDQo+IDIwMjQwLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAuLmZlNTk0YjI0YmINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL0NWRS0yMDIxLTIwMjQwLnBhdGNoDQo+
IEBAIC0wLDAgKzEsNDAgQEANCj4gK0Zyb20gMDg2ZThhZGY0Y2MzNTJjZDExNTcyZjk2MDY2YjAw
MWI1NDVmMzU0ZSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEVtbWFudWVs
ZSBCYXNzaSA8ZWJhc3NpQGdub21lLm9yZz4NCj4gK0RhdGU6IFdlZCwgMSBBcHIgMjAyMCAxODox
MTo1NSArMDEwMA0KPiArU3ViamVjdDogW1BBVENIXSBDaGVjayB0aGUgbWVtc2V0IGxlbmd0aCBh
cmd1bWVudA0KPiArDQo+ICtBdm9pZCBvdmVyZmxvd3MgYnkgdXNpbmcgdGhlIGNoZWNrZWQgbXVs
dGlwbGljYXRpb24gbWFjcm8gZm9yIGdzaXplLg0KPiArDQo+ICtGaXhlczogIzEzMg0KPiArDQo+
ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0ZWQNCj4gW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9nZGstcGl4YnVmLy0vY29tbWl0LzA4NmU4YWRmNGNjMzUyY2QxMTU3MmY5NjA2NmIw
MDFiNTQ1ZjM1NGUNCj4gXQ0KPiArQ1ZFOiBDVkUtMjAyMS0yMDI0MA0KPiArDQo+ICtTaWduZWQt
b2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPiArLS0t
DQo+ICsgZ2RrLXBpeGJ1Zi9pby1naWYtYW5pbWF0aW9uLmMgfCA2ICsrKysrLQ0KPiArIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAt
LWdpdCBhL2dkay1waXhidWYvaW8tZ2lmLWFuaW1hdGlvbi5jIGIvZ2RrLXBpeGJ1Zi9pby1naWYt
DQo+IGFuaW1hdGlvbi5jDQo+ICtpbmRleCBjOWRiM2M2NmUuLjQ5Njc0ZmQyZSAxMDA2NDQNCj4g
Ky0tLSBhL2dkay1waXhidWYvaW8tZ2lmLWFuaW1hdGlvbi5jDQo+ICsrKysgYi9nZGstcGl4YnVm
L2lvLWdpZi1hbmltYXRpb24uYw0KPiArQEAgLTQxMiwxMSArNDEyLDE1IEBAIGdka19waXhidWZf
Z2lmX2FuaW1faXRlcl9nZXRfcGl4YnVmDQo+IChHZGtQaXhidWZBbmltYXRpb25JdGVyICphbmlt
X2l0ZXIpDQo+ICsgDQo+ICvCoMKgwqDCoMKgwqDCoMKgIC8qIElmIG5vIHJlbmRlcmVkIGZyYW1l
LCByZW5kZXIgdGhlIGZpcnN0IGZyYW1lICovDQo+ICvCoMKgwqDCoMKgwqDCoMKgIGlmIChhbmlt
LT5sYXN0X2ZyYW1lID09IE5VTEwpIHsNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ3NpemUgbGVuID0gMDsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChhbmltLT5sYXN0X2ZyYW1lX2RhdGEgPT0gTlVMTCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbmltLT5sYXN0X2ZyYW1lX2RhdGEgPSBnZGtf
cGl4YnVmX25ldw0KPiAoR0RLX0NPTE9SU1BBQ0VfUkdCLCBUUlVFLCA4LCBhbmltLT53aWR0aCwg
YW5pbS0+aGVpZ2h0KTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChh
bmltLT5sYXN0X2ZyYW1lX2RhdGEgPT0gTlVMTCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4gKy3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbWVtc2V0IChnZGtfcGl4YnVmX2dldF9waXhlbHMgKGFuaW0tDQo+
ID5sYXN0X2ZyYW1lX2RhdGEpLCAwLCBnZGtfcGl4YnVmX2dldF9yb3dzdHJpZGUgKGFuaW0tDQo+
ID5sYXN0X2ZyYW1lX2RhdGEpICogYW5pbS0+aGVpZ2h0KTsNCj4gKyvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGdfc2l6ZV9jaGVja2VkX211bCAoJmxlbiwNCj4gZ2RrX3BpeGJ1
Zl9nZXRfcm93c3RyaWRlIChhbmltLT5sYXN0X2ZyYW1lX2RhdGEpLCBhbmltLT5oZWlnaHQpKQ0K
PiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtc2V0
IChnZGtfcGl4YnVmX2dldF9waXhlbHMgKGFuaW0tDQo+ID5sYXN0X2ZyYW1lX2RhdGEpLCAwLCBs
ZW4pOw0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlDQo+ICsrwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvc2l0ZV9mcmFtZSAoYW5pbSwg
Z19saXN0X250aF9kYXRhIChhbmltLQ0KPiA+ZnJhbWVzLCAwKSk7DQo+ICvCoMKgwqDCoMKgwqDC
oMKgIH0NCj4gKyANCj4gKy0tIA0KPiArR2l0TGFiDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDAuMC5iYg0KPiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40MC4wLmJiDQo+IGluZGV4IDIyNmUxYzdi
ODkuLmYwMWRhMzJlNzEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4
YnVmL2dkay1waXhidWZfMi40MC4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWZfMi40MC4wLmJiDQo+IEBAIC0yNiw2ICsyNiw3IEBAIFNSQ19VUkkg
PQ0KPiAiJHtHTk9NRV9NSVJST1J9LyR7QlBOfS8ke01BSl9WRVJ9LyR7QlBOfS0ke1BWfS50YXIu
eHogXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IGZpbGU6Ly8wMDA2LUJ1aWxkLXRodW1i
bmFpbGVyLWFuZC10ZXN0cy1hbHNvLWluLWNyb3NzLWJ1aWxkcy5wYXRjaMKgXA0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9taXNzaW5nLXRlc3QtZGF0YS5wYXRjaMKgXA0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMC0yOTM4NS5wYXRjaMKgXA0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDIxLTIwMjQwLnBhdGNowqBcDQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoA0KPiDCoFNSQ19VUklfYXBwZW5kX2NsYXNzLXRhcmdl
dCA9ICIgXA0KPiANCj4gDQo+IA0KDQo=
