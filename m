Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.12549.1619793730959672584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 07:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zI7o4ZQzeOya1X3QoQI0fL1olqTTXRsuABvB9Ru2cWj26lawxFhmP/Mh8MRMbT2tjCqrYFQMOu
 7FtCJdhVlihA==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="184760266"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="184760266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 07:42:08 -0700
IronPort-SDR: bhYcvFH5tBrr6/TgK6q4KC1rBTB3nrw5VJF3WyRmdEC5Bu7x+wgKSTV6o7quRIvBu7jreU8wEM
 ReDQbXxWhfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="431462437"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2021 07:42:07 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 30 Apr 2021 22:42:06 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Fri, 30 Apr 2021 22:42:06 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "trevor.gamblin@windriver.com"
	<trevor.gamblin@windriver.com>
Subject: Re: [OE-core][zeus][PATCH] binutils: Fix include error in builds
Thread-Topic: [OE-core][zeus][PATCH] binutils: Fix include error in builds
Thread-Index: AQHXPD7Mc/x5Pym5L0St7CZfD8M6MKrMn18A
Date: Fri, 30 Apr 2021 14:42:06 +0000
Message-ID: <7c4905ed75988911944cb79ea3de6fdb10d82dbf.camel@intel.com>
References: <20210428145659.29096-1-trevor.gamblin@windriver.com>
In-Reply-To: <20210428145659.29096-1-trevor.gamblin@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6CDACBBFC53CF44AF9BF5DB856C07C3@intel.com>
Content-Transfer-Encoding: base64

emV1cyBpcyBub3QgYmVpbmcgYWN0aXZlbHkgbWFpbnRhaW5lZCBhbnkgbW9yZS4gQnV0IEkgaGFk
IHNvbWUgcGF0Y2hlcw0KaW4gbXkgYnJhbmNoIFsxXSBhbmQgYXV0b2J1aWxkZXIgd2FzIGZyZWUs
IHNvIEkgdHJpZWQgdGVzdGluZy4gU29tZSBvZg0KdGhlIGNvbmZpZ3VyYXRpb25zIGZhaWwgd2hp
bGUgaW5zdGFsbGluZyBzeXNsaW51eC1uYXRpdmUuDQoNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy82NS9idWlsZHMvMzM3Ni9zdGVwcy8x
MC9sb2dzL3N0ZXAxYg0KDQpUaGFua3MsDQoNCkFudWoNCg0KWzFdDQpodHRwczovL2dpdC5vcGVu
ZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWIvbG9nLz9oPWFudWptL3pldXMN
Cg0KT24gV2VkLCAyMDIxLTA0LTI4IGF0IDEwOjU2IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90
ZToNCj4gU2VlIFtZT0NUTyAjMTQxNjldDQo+IA0KPiBBIHVzZXIgZm91bmQgYSBwcm9ibGVtIHdp
dGggYmludXRpbHMgaW4gemV1cyBkdWUgdG8gYSBtaXNzaW5nDQo+IGluY2x1ZGUgaW4gdGhlIHNv
dXJjZS4gU3VibWl0dGluZyB0aGUgcGF0Y2ggb24gdGhlaXIgYmVoYWxmLg0KPiBUaGUgaXNzdWUg
aXMgZml4ZWQgaW4gYmludXRpbHMgMi4zMyB1cHN0cmVhbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFRyZXZvciBHYW1ibGluIDx0cmV2b3IuZ2FtYmxpbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4g
wqAuLi4vYmludXRpbHMvYmludXRpbHMtMi4zMi5pbmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEgKw0KPiDCoC4uLjAwMDEtRml4LWEtbWlzc2luZy1pbmNsdWRlLW9mLXN0cmlu
Zy5wYXRjaCB8IDQ5ICsrKysrKysrKysrKysrKysrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDUw
IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDEtRml4LWEtDQo+IG1pc3NpbmctaW5jbHVkZS1vZi1z
dHJpbmcucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmlu
dXRpbHMvYmludXRpbHMtMi4zMi5pbmMNCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRp
bHMvYmludXRpbHMtMi4zMi5pbmMNCj4gaW5kZXggMzQ5YzNlMTE1NC4uMWYyZDAzM2E2YyAxMDA2
NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMzIu
aW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0yLjMy
LmluYw0KPiBAQCAtNTEsNiArNTEsNyBAQCBTUkNfVVJJID0gIlwNCj4gwqDCoMKgwqDCoCBmaWxl
Oi8vQ1ZFLTIwMTktMTQ0NDQucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMTkt
MTc0NTAucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMTktMTc0NTEucGF0Y2jC
oFwNCj4gK8KgwqDCoMKgIGZpbGU6Ly8wMDAxLUZpeC1hLW1pc3NpbmctaW5jbHVkZS1vZi1zdHJp
bmcucGF0Y2jCoFwNCj4gwqAiDQo+IMKgU8KgID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiDCoA0KPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDEt
Rml4LWEtDQo+IG1pc3NpbmctaW5jbHVkZS1vZi1zdHJpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
DQo+IGRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDEtRml4LWEtbWlzc2luZy1pbmNsdWRl
LW9mLXN0cmluZy5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwLi45ZjUyZWQ4OTM4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDEtRml4LWEtbWlzc2luZy0NCj4gaW5jbHVkZS1v
Zi1zdHJpbmcucGF0Y2gNCj4gQEAgLTAsMCArMSw0OSBAQA0KPiArRnJvbSAxYWFmOWQ0ODFhN2Mw
ZTIwNjc1ZGYxNjVhNDk2OGUyNTU1MjFiZWE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiAr
RnJvbTogVHJldm9yIEdhbWJsaW4gPHRyZXZvci5nYW1ibGluQHdpbmRyaXZlci5jb20+DQo+ICtE
YXRlOiBXZWQsIDI4IEFwciAyMDIxIDA5OjI1OjA4IC0wNDAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hd
IEZpeCBhIG1pc3NpbmcgaW5jbHVkZSBvZiA8c3RyaW5nPg0KPiArDQo+ICtnb2xkL0NoYW5nZUxv
ZzoNCj4gKw0KPiArMjAxOS0wNi0wN8KgIE1hcnRpbiBMaXNrYcKgIDxtbGlza2FAc3VzZS5jej4N
Cj4gKw0KPiArwqDCoMKgICogZXJyb3JzLmg6IEluY2x1ZGUgc3RyaW5nLg0KPiArDQo+ICtVcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+ICsoaHR0cHM6Ly9naXRodWIuY29tL2JtaW5vci9iaW51
dGlscy1nZGIvY29tbWl0L2EzOTcyMzMwZikNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogVHJldm9y
IEdhbWJsaW4gPHRyZXZvci5nYW1ibGluQHdpbmRyaXZlci5jb20+DQo+ICstLS0NCj4gKyBnb2xk
L0NoYW5nZUxvZyB8IDMgKysrDQo+ICsgZ29sZC9lcnJvcnMuaMKgIHwgMSArDQo+ICsgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2dvbGQvQ2hh
bmdlTG9nIGIvZ29sZC9DaGFuZ2VMb2cNCj4gK2luZGV4IDQ1OGJlZDc5M2UwLi4wMGY4MDRiMWJm
NiAxMDA2NDQNCj4gKy0tLSBhL2dvbGQvQ2hhbmdlTG9nDQo+ICsrKysgYi9nb2xkL0NoYW5nZUxv
Zw0KPiArQEAgLTIsNiArMiw5IEBADQo+ICsgDQo+ICvCoMKgwqDCoMKgwqDCoDIuMzIgUmVsZWFz
ZS4NCj4gKyANCj4gKysyMDE5LTA2LTEwwqAgTWFydGluIExpc2thwqAgPG1saXNrYUBzdXNlLmN6
Pg0KPiArKw0KPiArK8KgwqDCoMKgwqDCoCogZXJyb3JzLmg6IEluY2x1ZGUgc3RyaW5nLg0KPiAr
IDIwMTktMDEtMjHCoCBOaWNrIENsaWZ0b27CoCA8bmlja2NAcmVkaGF0LmNvbT4NCj4gKyANCj4g
K8KgwqDCoMKgwqDCoMKgKiBwby91ay5wbzogVXBkYXRlZCBVa3JhbmlhbiB0cmFuc2xhdGlvbi4N
Cj4gK2RpZmYgLS1naXQgYS9nb2xkL2Vycm9ycy5oIGIvZ29sZC9lcnJvcnMuaA0KPiAraW5kZXgg
YzI2YjU1ODYzNzkuLmFjNjgxZTk2NWJiIDEwMDY0NA0KPiArLS0tIGEvZ29sZC9lcnJvcnMuaA0K
PiArKysrIGIvZ29sZC9lcnJvcnMuaA0KPiArQEAgLTI0LDYgKzI0LDcgQEANCj4gKyAjZGVmaW5l
IEdPTERfRVJST1JTX0gNCj4gKyANCj4gKyAjaW5jbHVkZSA8Y3N0ZGFyZz4NCj4gKysjaW5jbHVk
ZSA8c3RyaW5nPg0KPiArIA0KPiArICNpbmNsdWRlICJnb2xkLXRocmVhZHMuaCINCj4gKyANCj4g
Ky0tIA0KPiArMi4zMC4yDQo+ICsNCj4gDQo+IA0KPiANCg0K
