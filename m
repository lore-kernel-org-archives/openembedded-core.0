Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.11413.1614094413970524495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fxnY3Uv1gLFaLLNrPrtsDu7OOZuU6AS6IG0uxweTYMDwh9mIqpXZzm1YQ0RkbzI64iEHdOdWdh
 ZT3QM9iNdbDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="184887863"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="184887863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 07:33:33 -0800
IronPort-SDR: EBRi5y07krGLVTs+Zdqj5TWpgRQKYCdTbftpujtOw8dshoGXHLxzHn59UVTUjgkAPdjCJfyYq1
 lR0tIGsfJSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="403209470"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2021 07:33:31 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 23:33:30 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Tue, 23 Feb 2021 23:33:30 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "zbodek@gmail.com"
	<zbodek@gmail.com>
CC: "andrei.gherzan@huawei.com" <andrei.gherzan@huawei.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "wojciech.zmuda@huawei.com" <wojciech.zmuda@huawei.com>,
	"zbigniew.bodek@huawei.com" <zbigniew.bodek@huawei.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
Thread-Topic: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so
 symlink when using dev package
Thread-Index: AQHXCd7y6nJB0VJgK0qIyRFhmgCR7KplWJ8A
Date: Tue, 23 Feb 2021 15:33:30 +0000
Message-ID: <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com>
References: <166535D1ACD90C64.29685@lists.openembedded.org>
	 <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
In-Reply-To: <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C75873D74969B4BAAA0143CE627F730@intel.com>
Content-Transfer-Encoding: base64

SXMgdGhpcyBjaGFuZ2UgbmVlZGVkIGZvciB0aGUgdmVyc2lvbiBpbiBnYXRlc2dhcnRoIHRvbz8N
Cg0KVGhhbmtzLA0KDQpBbnVqDQoNCk9uIFR1ZSwgMjAyMS0wMi0yMyBhdCAxMzoyNCArMDEwMCwg
WmJpZ25pZXcgQm9kZWsgd3JvdGU6DQo+IEFueSBjb21tZW50cywgcXVlc3Rpb25zLCByZW1hcmtz
IHRvIHRoYXQ/DQo+IA0KPiBLaW5kIHJlZ2FyZHMNCj4gWmJpZ25pZXcNCj4gDQo+IHB0LiwgMTkg
bHV0IDIwMjEgbyAxODoyMCBaYmlnbmlldyBCb2RlayB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA8emJvZGVrPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBuYXBpc2HFgihh
KToNCj4gPiANCj4gPiBGcm9tOiBaYmlnbmlldyBCb2RlayA8emJpZ25pZXcuYm9kZWtAaHVhd2Vp
LmNvbT4NCj4gPiANCj4gPiBQcm9ibGVtIHNwb3R0ZWQgb24gZHVuZmVsbC0yMy4wLjQNCj4gPiAN
Cj4gPiBOb3JtYWxseSwgdW52ZXJzaW9uZWQgLnNvIGlzIHJlbW92ZWQgZnJvbSAtZGV2IChkZWZh
dWx0KSBwYWNrYWdlDQo+ID4gaG93ZXZlciBpdCBpcyBzdGlsbCBiZWluZyByZWZlcnJlZCBieSBv
dGhlciBhZ2VudHMsIHN1Y2ggYXMNCj4gPiB3ZWJraXRndGsuDQo+ID4gVGhhdCBjYW4gYmUgb2Jz
ZXJ2ZWQgd2hpbGUgZXhlY3V0aW5nIGkuZS4gRXBpcGhhbnkgQnJvd3Nlci4NCj4gPiANCj4gPiBG
b3IgaW5zdGFuY2U6DQo+ID4gcGxhdGZvcm1Jbml0aWFsaXplV2ViUHJvY2VzcygpDQo+ID4gY2Fs
bHMNCj4gPiB3cGVfbG9hZGVyX2luaXQoImxpYldQRUJhY2tlbmQtZmRvLTEuMC5zbyIpDQo+ID4g
DQo+ID4gYXMgYSByZXN1bHQgb25lIGNhbiBzZWU6DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPiB3cGVfbG9hZGVyX2luaXQgY291bGQgbm90IGxvYWQgdGhlIGxpYnJhcnkgJ2xpYldQRUJh
Y2tlbmQtZmRvLQ0KPiA+IDEuMC5zbyc6DQo+ID4gbGliV1BFQmFja2VuZC1mZG8tMS4wLnNvOiBj
YW5ub3Qgb3BlbiBzaGFyZWQgb2JqZWN0IGZpbGU6DQo+ID4gTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gDQo+ID4gIm1hc3RlciIgYnJhbmNo
IGNvbnRhaW5zIGEgYnVtcGVkLXVwIHZlcnNpb24gb2Ygd2Via2l0Z3RrDQo+ID4gdG8gd2hpY2gg
dGhpcyBpc3N1ZSBkb2VzIG5vdCBhcHBseSAodGhlIGNvZGUgaGFzIGNoYW5nZWQpLg0KPiA+IA0K
PiA+IEZvcmNlZnVsbHkga2VlcCB0aGlzIC5zbyBzeW1saW5rIHRvIHJlc29sdmUgdGhlIHByb2Js
ZW0gaW4gZHVuZmVsbC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBCb2RlayA8
emJpZ25pZXcuYm9kZWtAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjQuMS5iYiB8IDMgKysrDQo+ID4gwqAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zYXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjQuMS5iYg0KPiA+IGIvbWV0YS9yZWNp
cGVzLXNhdG8vd2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuNC4xLmJiDQo+ID4gaW5kZXggY2QyZjdm
YWJkYS4uMTY1ZmM3NGRkZSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd3BlYmFja2VuZC1mZG9fMS40LjEuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd3BlYmFja2VuZC1mZG9fMS40LjEuYmINCj4gPiBAQCAtMTUsMyArMTUsNiBAQCBSRVFV
SVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAib3BlbmdsIg0KPiA+IMKgU1JDX1VSSSA9ICJodHRwczov
L3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiINCj4gPiDCoFNSQ19V
Uklbc2hhMjU2c3VtXSA9DQo+ID4gIjYyNDlhMGI3Y2JmYTY2MjIwNmE4ZDJmYTI0ZTJjNTc0ZTc1
YzY4MWFkMGU5MzQ2ODA5MWYxZGM2OGRkYjI5OWQiDQo+ID4gDQo+ID4gK0ZJTEVTXyR7UE59ICs9
ICIke2xpYmRpcn0vbGliV1BFQmFja2VuZC1mZG8tMS4wLnNvIg0KPiA+ICtGSUxFU19TT0xJQlNE
RVYgPSAiIg0KPiA+ICtJTlNBTkVfU0tJUF8ke1BOfSArPSAiZGV2LXNvIg0KPiA+IC0tDQo+ID4g
Mi4xNy4xDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+IA0KPiANCj4gDQoNCg==
