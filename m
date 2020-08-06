Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.4457.1596677927246627788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 18:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LP6USKoRNBF6CtA7BxfWxSGKAF1og3WBqtBVVFnGyl2Sc2Y851a1GukHbioY+siRwk4pCoPisx
 92PDMXqT2teA==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="237555072"
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; 
   d="scan'208";a="237555072"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 18:38:46 -0700
IronPort-SDR: WqirlD09pwHCcY7J2rL2NaB/k4o3OHRBOWP7Ha0Fat5enW4nuE2Nt+Bx0/LCa15+5jyZYcvDvJ
 bHXpmHPmxd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; 
   d="scan'208";a="293142788"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga006.jf.intel.com with ESMTP; 05 Aug 2020 18:38:44 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Aug 2020 09:38:41 +0800
Received: from pgsmsx106.gar.corp.intel.com (10.221.44.98) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Aug 2020 09:38:41 +0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.74]) by
 PGSMSX106.gar.corp.intel.com ([169.254.9.42]) with mapi id 14.03.0439.000;
 Thu, 6 Aug 2020 09:38:40 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] xf86-video-intel: Fix build with -fno-common
Thread-Topic: [OE-core] [PATCH 1/2] xf86-video-intel: Fix build with
 -fno-common
Thread-Index: AQHWa1vPwKmJf1DT9USyG3zVeEZK76kpx8qA
Date: Thu, 6 Aug 2020 01:38:40 +0000
Message-ID: <042aa5f860ca83daf551472440bb9a06c1629850.camel@intel.com>
References: <20200805190819.935438-1-raj.khem@gmail.com>
In-Reply-To: <20200805190819.935438-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.139.88]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <28DD5BDC230C4C498EAFAB52028ACC50@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA4LTA1IGF0IDEyOjA4IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAuLi4w
MDAxLWk4MTAtTWFrZS1JODEwUGF0dGVyblJPUC1leHRlcm4ucGF0Y2ggfCAyOQ0KPiArKysrKysr
KysrKysrKysrKysrDQo+ICAuLi4veG9yZy1kcml2ZXIveGY4Ni12aWRlby1pbnRlbF9naXQuYmIg
ICAgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni12
aWRlby0NCj4gaW50ZWwvMDAwMS1pODEwLU1ha2UtSTgxMFBhdHRlcm5ST1AtZXh0ZXJuLnBhdGNo
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hm
ODYtdmlkZW8taW50ZWwvMDAwMS0NCj4gaTgxMC1NYWtlLUk4MTBQYXR0ZXJuUk9QLWV4dGVybi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLQ0KPiBkcml2ZXIveGY4Ni12aWRlby1p
bnRlbC8wMDAxLWk4MTAtTWFrZS1JODEwUGF0dGVyblJPUC1leHRlcm4ucGF0Y2gNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNjEwZWZkNjVkOQ0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LXZp
ZGVvLWludGVsLzAwMDEtaTgxMC0NCj4gTWFrZS1JODEwUGF0dGVyblJPUC1leHRlcm4ucGF0Y2gN
Cj4gQEAgLTAsMCArMSwyOSBAQA0KPiArRnJvbSBjOWE5NzkxNTc2MDI1ZTQ2ZjQ0MTEzNDJjMGUy
OWZmY2M3OTg2OWNhIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gK0RhdGU6IFdlZCwgNSBBdWcgMjAyMCAxMTo1MTo1
NCAtMDcwMA0KPiArU3ViamVjdDogW1BBVENIXSBpODEwOiBNYWtlIEk4MTBQYXR0ZXJuUk9QIGV4
dGVybg0KPiArDQo+ICtJdHMgYWxzbyBkZWZpbmVkIGluIGk4MTBfYWNjZWwuYw0KPiArRml4ZXMg
YnVpbGQgd2l0aCAtZm5vLWNvbW1vbg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcN
Cg0KU2hvdWxkIHdlIHRha2UgdGhpcyBleGFjdCBzYW1lIGNoYW5nZSBzbyB3ZSBjYW4gbWFyayB0
aGlzIGFzIGENCmJhY2twb3J0Pw0KDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9y
Zy9kcml2ZXIveGY4Ni12aWRlby1pbnRlbC8tL2NvbW1pdC82NTJkOTNjYmJkYzE1OWMwODgzZjFi
NjI2ZWE0OGUyOGJhYzYzYWUzDQoNClRoYW5rcywNCg0KQW51ag0KDQo+ICtTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiArLS0tDQo+ICsgc3JjL2xlZ2FjeS9p
ODEwL2k4MTAuaCB8IDIgKy0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL3NyYy9sZWdhY3kvaTgxMC9pODEwLmgg
Yi9zcmMvbGVnYWN5L2k4MTAvaTgxMC5oDQo+ICtpbmRleCAzNDcxODhjOS4uMTliZTA0OWMgMTAw
NjQ0DQo+ICstLS0gYS9zcmMvbGVnYWN5L2k4MTAvaTgxMC5oDQo+ICsrKysgYi9zcmMvbGVnYWN5
L2k4MTAvaTgxMC5oDQo+ICtAQCAtMzIyLDYgKzMyMiw2IEBAIGV4dGVybiB2b2lkIEk4MTBJbml0
TUMoU2NyZWVuUHRyIHBTY3JlZW4pOw0KPiArIGV4dGVybiBjb25zdCBPcHRpb25JbmZvUmVjICpJ
ODEwQXZhaWxhYmxlT3B0aW9ucyhpbnQgY2hpcGlkLCBpbnQNCj4gYnVzaWQpOw0KPiArIA0KPiAr
IGV4dGVybiBjb25zdCBpbnQgSTgxMENvcHlST1BbMTZdOw0KPiArLWNvbnN0IGludCBJODEwUGF0
dGVyblJPUFsxNl07DQo+ICsrZXh0ZXJuIGNvbnN0IGludCBJODEwUGF0dGVyblJPUFsxNl07DQo+
ICsgDQo+ICsgI2VuZGlmIC8qIF9JODEwX0hfICovDQo+ICstLSANCj4gKzIuMjguMA0KPiArDQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni12aWRl
by0NCj4gaW50ZWxfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hm
ODYtdmlkZW8tDQo+IGludGVsX2dpdC5iYg0KPiBpbmRleCA3YWIyMjM2MjM3Li4zYzk3YjhjNGY0
IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni12
aWRlby1pbnRlbF9naXQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJp
dmVyL3hmODYtdmlkZW8taW50ZWxfZ2l0LmJiDQo+IEBAIC0xNSw2ICsxNSw3IEBAIFMgPSAiJHtX
T1JLRElSfS9naXQiDQo+ICANCj4gIFNSQ19VUkkgPSAiZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3Rv
cC5vcmcveG9yZy9kcml2ZXIveGY4Ni12aWRlby0NCj4gaW50ZWwgXA0KPiAgICAgICAgICAgICBm
aWxlOi8vMDAwMS1TeW5jLWk5MTVfcGNpaWRzLXVwdG8tODcxN2M2Yjc0MTRmLnBhdGNoIFwNCj4g
KyAgICAgICAgICAgZmlsZTovLzAwMDEtaTgxMC1NYWtlLUk4MTBQYXR0ZXJuUk9QLWV4dGVybi5w
YXRjaCBcDQo+ICAiDQo+ICANCj4gIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxw
dmVyPlxkKyhcLlxkKykrKSINCj4gDQo=
