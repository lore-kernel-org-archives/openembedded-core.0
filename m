Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.2838.1599784722647893775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 17:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FgbWK3wucnACPCCBokQuWer/ZiqKimEC7ZvIdCh1zlyytBkGXx4/iUv+CFJHvIePqBy1TNbO11
 AegMdFzUmxSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="222864860"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="222864860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 17:38:41 -0700
IronPort-SDR: oxE69ykHRNK7BU5NKaefJLVZTkUA5n8qQ5rIQzB8v3DstnPiaxyjUCopsh/cLmIz9FVbYyIdxj
 3eWmCheXreVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="305071847"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 17:38:41 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 11 Sep 2020 08:38:40 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Fri, 11 Sep 2020 08:38:40 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ncurses: remove config.cache
Thread-Topic: [OE-core] [PATCH] ncurses: remove config.cache
Thread-Index: AQHWh7SGcomjffs6JkOzsCCq+79nDqliEkOA
Date: Fri, 11 Sep 2020 00:38:40 +0000
Message-ID: <8d9b72ddf28d2ddf4bc0d0744b69e5690fd75b98.camel@intel.com>
References: <20200910205354.900504-1-ross.burton@arm.com>
In-Reply-To: <20200910205354.900504-1-ross.burton@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <229CAB274BD9CF4691C7147F4BF8811F@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA5LTEwIGF0IDIxOjUzICswMTAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
RnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4NCg0KWW91IGZvcmdvdCB0
byB1cGRhdGUgeW91ciBlbWFpbCBzb21ld2hlcmU/IDopDQoNClRoYW5rcywNCg0KQW51ag0KDQo+
IA0KPiBJbnN0ZWFkIG9mIGhhdmluZyBhIGNvbmZpZy5jYWNoZSB0aGF0IG92ZXJyaWRlcyB0aGUg
c3lzdGVtIHNpdGUNCj4gZmlsZXMsDQo+IHNpbXBseSBzZXQgdGhlIHZhbHVlcyBpbiBDQUNIRURf
Q09ORklHVVJFVkFSUy4gV2UgY2FuIGFsc28gZHJvcCB0aGUNCj4gbWtzdGVtcCBjaGVjayBhcyB0
aGUgY29uZmlndXJlLmFjIGFzc3VtZXMgaXQgd29ya3MsIGxlYXZpbmcganVzdA0KPiBuYW5vc2xl
ZXAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNv
bT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2NvbmZpZy5jYWNo
ZSB8IDQgLS0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYyAgICAg
ICAgfCAzICsrLQ0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzXzYuMi5iYiAg
ICAgfCAzICstLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9m
aWxlcy9jb25maWcuY2FjaGUNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9u
Y3Vyc2VzL2ZpbGVzL2NvbmZpZy5jYWNoZQ0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMv
ZmlsZXMvY29uZmlnLmNhY2hlDQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCA2
YTkyMTdkNWJiLi4wMDAwMDAwMDAwDQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMv
ZmlsZXMvY29uZmlnLmNhY2hlDQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsNCArMCwwIEBADQo+
IC0jISAvYmluL3NoDQo+IC0NCj4gLWNmX2N2X2Z1bmNfbmFub3NsZWVwPXllcw0KPiAtY2ZfY3Zf
ZnVuY19ta3N0ZW1wPXllcw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNl
cy9uY3Vyc2VzLmluYyBiL21ldGEvcmVjaXBlcy0NCj4gY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5j
DQo+IGluZGV4IDQxNTZiZjRmN2QuLjE2MjdmYjkxZDMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bmN1cnNlcy9uY3Vyc2VzLmluYw0KPiBAQCAtMTYsNyArMTYsOCBAQCBpbmhlcml0IGF1dG90b29s
cyBiaW5jb25maWctZGlzYWJsZWQNCj4gbXVsdGlsaWJfaGVhZGVyIHBrZ2NvbmZpZw0KPiAgU1JD
X1VSSSA9ICJnaXQ6Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9uY3Vyc2VzLmdpdDtwcm90b2Nv
bD1odHRwcyINCj4gIA0KPiAgRVhUUkFfQVVUT1JFQ09ORiA9ICItSSBtNCINCj4gLUNPTkZJR19T
SVRFID0rICIke1dPUktESVJ9L2NvbmZpZy5jYWNoZSINCj4gKw0KPiArQ0FDSEVEX0NPTkZJR1VS
RVZBUlMgPSAiY2ZfY3ZfZnVuY19uYW5vc2xlZXA9eWVzIg0KPiAgDQo+ICBFWFRSQVNJVEVDT05G
SUcgPSAiQ0ZMQUdTPScke0NGTEFHU30NCj4gLUkke1NZU1JPT1RfREVTVERJUn0ke2luY2x1ZGVk
aXJ9JyINCj4gIA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vy
c2VzXzYuMi5iYiBiL21ldGEvcmVjaXBlcy0NCj4gY29yZS9uY3Vyc2VzL25jdXJzZXNfNi4yLmJi
DQo+IGluZGV4IDcyM2U2ODVhOWIuLjVjMDJkYjg1NDEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvbmN1cnNlcy9uY3Vyc2VzXzYuMi5iYg0KPiBAQCAtMiwxMiArMiwxMSBAQCByZXF1aXJlIG5j
dXJzZXMuaW5jDQo+ICANCj4gIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXRpYy1oYW5nLnBhdGNo
IFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDItY29uZmlndXJlLXJlcHJvZHVjaWJsZS5wYXRj
aCBcDQo+IC0gICAgICAgICAgIGZpbGU6Ly9jb25maWcuY2FjaGUgXA0KPiAgICAgICAgICAgICAi
DQo+ICAjIGNvbW1pdCBpZCBjb3JyZXNwb25kcyB0byB0aGUgcmV2aXNpb24gaW4gcGFja2FnZSB2
ZXJzaW9uDQo+ICBTUkNSRVYgPSAiYTY2OTAxM2NkNWU5ZDY0MzRlNTMwMTM0OGVhNTFiYWYzMDZj
OTNjNCINCj4gIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+IC1FWFRSQV9PRUNPTkYgKz0gIi0td2l0
aC1hYmktdmVyc2lvbj01IC0tY2FjaGUtDQo+IGZpbGU9JHtCfS9jb25maWcuY2FjaGUiDQo+ICtF
WFRSQV9PRUNPTkYgKz0gIi0td2l0aC1hYmktdmVyc2lvbj01Ig0KPiAgVVBTVFJFQU1fQ0hFQ0tf
R0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsoXCtcZCspKikiDQo+ICANCj4gICMg
VGhpcyBpcyBuZWVkZWQgd2hlbiB1c2luZyBwYXRjaGxldmVsIHZlcnNpb25zIGxpa2UgNi4xKzIw
MTgxMDEzDQo+IA0K
