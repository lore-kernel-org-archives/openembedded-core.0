Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.5508.1619511373350270317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OLSyB0FDGPuJW3Mf0utRL459B04u3ti0rKcZr+Ua6Yc22W74qazlIcBvTWHWnpqJan/PuavIEu
 Y+QkhWQYGrYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196581368"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; 
   d="scan'208";a="196581368"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 01:16:10 -0700
IronPort-SDR: Z0NvGvZ6kOTqzOd9mhdFs0+Lf64aQwlJt9sp2AMq3nNrTyvOrHAZHLWdicOlrJ+n0hJ/Mj6AdI
 orHAvbUDbzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; 
   d="scan'208";a="425148188"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by orsmga007.jf.intel.com with ESMTP; 27 Apr 2021 01:16:09 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 16:16:08 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Tue, 27 Apr 2021 16:16:08 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "flowergom@gmail.com"
	<flowergom@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] qemu: fix CVE-2021-3392
Thread-Topic: [OE-core] [hardknott][PATCH] qemu: fix CVE-2021-3392
Thread-Index: AQHXOzx3JNngJB6jD0aq5fI7gBq/6KrHfpCA
Date: Tue, 27 Apr 2021 08:16:08 +0000
Message-ID: <f4f8ccd3bff2f7936575474c4d327e04371a9c46.camel@intel.com>
References: <20210427080727.1215-1-flowergom@gmail.com>
In-Reply-To: <20210427080727.1215-1-flowergom@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <340DD29388AAA041B073D41A650A0128@intel.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KDQpPbiBUdWUsIDIwMjEtMDQtMjcg
YXQgMTc6MDcgKzA5MDAsIE1pbmphZSBLaW0gd3JvdGU6DQo+IHNjc2k6IHVzZS1hZnRlci1mcmVl
IGluIG1wdHNhc19wcm9jZXNzX3Njc2lfaW9fcmVxdWVzdCgpIG9mIG1wdHNhczEwNjgNCj4gZW11
bGF0b3INCg0KVGhpcyB3aWxsIG5lZWQgeW91ciBTaWduZWQtb2ZmLWJ5LsKgDQoNCkl0IGxvb2tz
IGxpa2UgeW91IGFyZSBwaWNraW5nIGFuIG9sZGVyIHZlcnNpb24gb2YgdGhlIGNoYW5nZSBmcm9t
DQptYWlsaW5nIGxpc3QuIFRoZSB1cHN0cmVhbSBjb21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQg
aW5zdGVhZC4NClVwc3RyZWFtLVN0YXR1cyBzaG91bGQgYWxzbyBiZSBCYWNrcG9ydCBpbiB0aGF0
IGNhc2UuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0LzM3OTE2NDJjOGQ2
MDAyOWFkZjliMDBiY2I0ZTM0ZDdkOGExYWVhNGQNCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gLS0t
DQo+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmPCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArDQo+IMKgLi4uL3FlbXUvcWVtdS9DVkUtMjAyMS0zMzkyLnBhdGNowqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNDUgKysrKysrKysrKysrKysrKysrKw0KPiDCoDIgZmlsZXMg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDIxLTMzOTIucGF0Y2gNCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBl
cy0NCj4gZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiBpbmRleCBhNjI1ODA5NTk3Li4xYzQ4NjZl
YzBjIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0K
PiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiBAQCAtMzEsNiAr
MzEsNyBAQCBTUkNfVVJJID0gIg0KPiBodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0k
e1BWfS50YXIueHrCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vZGV0ZXJtaW5p
c20ucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCANCj4gZmlsZTovLzAwMDEtdGVz
dHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaMKg
DQo+IFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDIxLTIwMjAzLnBhdGNo
wqBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDIxLTMzOTIucGF0Y2jCoFwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiDQo+IMKgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciINCj4gwqANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjEtMzM5Mi5wYXRjaA0KPiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjEtMzM5Mi5wYXRjaA0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4xYzY4ODgyN2RiDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAy
MS0zMzkyLnBhdGNoDQo+IEBAIC0wLDAgKzEsNDUgQEANCj4gK0Zyb20gMzQzMWIwMWI0MzU4NGRl
NWY3MTBjNDA2MDVmZTMyNTFmODFjMGUxMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zy
b206IE1pbmphZSBLaW0gPGZsb3dlcmdvbUBnbWFpbC5jb20+DQo+ICtEYXRlOiBUdWUsIDI3IEFw
ciAyMDIxIDAyOjA5OjQ5ICswMDAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNjc2k6IG1wdHNhczog
ZGVxdWV1ZSByZXF1ZXN0IG9iamVjdCBpbiBjYXNlIG9mIGFuDQo+IGVycm9yDQo+ICsgKENWRS0y
MDIxLTMzOTIpDQo+ICsNCj4gK0Zyb206IFByYXNhZCBKIFBhbmRpdCA8cGpwQGZlZG9yYXByb2pl
Y3Qub3JnPg0KPiArDQo+ICtXaGlsZSBwcm9jZXNzaW5nIFNDU0kgaS9vIHJlcXVlc3RzIGluDQo+
IG1wdHNhc19wcm9jZXNzX3Njc2lfaW9fcmVxdWVzdCgpLA0KPiArdGhlIE1lZ2FyYWlkIGVtdWxh
dG9yIGFwcGVuZHMgbmV3IE1QVFNBU1JlcXVlc3Qgb2JqZWN0ICdyZXEnIHRvDQo+ICt0aGUgJ3Mt
PnBlbmRpbmcnIHF1ZXVlLiBJbiBjYXNlIG9mIGFuIGVycm9yLCB0aGlzIHNhbWUgb2JqZWN0IGdl
dHMNCj4gK2RlcXVldWVkIGluIG1wdHNhc19mcmVlX3JlcXVlc3QoKSBvbmx5IGlmIFNDU0lSZXF1
ZXN0IG9iamVjdA0KPiArJ3JlcS0+c3JlcScgaXMgaW5pdGlhbGlzZWQuIFRoaXMgbWF5IGxlYWQg
dG8gYSB1c2UtYWZ0ZXItZnJlZSBpc3N1ZS4NCj4gK1VuY29uZGl0aW9uYWxseSBkZXF1ZXVlICdy
ZXEnIG9iamVjdCBmcm9tICdzLT5wZW5kaW5nJyB0byBhdm9pZCBpdC4NCj4gKw0KPiArRml4ZXM6
IENWRS0yMDIxLTMzOTINCj4gK0J1Z2xpbms6IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3Fl
bXUvK2J1Zy8xOTE0MjM2DQo+ICtSZXBvcnRlZC1ieTogQ2hlb2x3b28gTXl1bmcgPGN3bXl1bmdA
c251LmFjLmtyPg0KPiArU2lnbmVkLW9mZi1ieTogUHJhc2FkIEogUGFuZGl0IDxwanBAZmVkb3Jh
cHJvamVjdC5vcmc+DQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQWNlcHRlZA0KPiArW2h0dHBz
Oi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIxLTAyL21zZzAwNDg4
Lmh0bWxdDQo+ICtDVkU6IENWRS0yMDIxLTMzOTINCj4gK1NpZ25lZC1vZmYtYnk6IE1pbmphZSBL
aW0gPGZsb3dlcmdvbUBnbWFpbC5jb20+DQo+ICstLS0NCj4gKyBody9zY3NpL21wdHNhcy5jIHwg
MiArLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiArDQo+ICtkaWZmIC0tZ2l0IGEvaHcvc2NzaS9tcHRzYXMuYyBiL2h3L3Njc2kvbXB0c2FzLmMN
Cj4gK2luZGV4IGY4NjYxNjU0NC4uYWRmZjViMGJmIDEwMDY0NA0KPiArLS0tIGEvaHcvc2NzaS9t
cHRzYXMuYw0KPiArKysrIGIvaHcvc2NzaS9tcHRzYXMuYw0KPiArQEAgLTI1Nyw4ICsyNTcsOCBA
QCBzdGF0aWMgdm9pZCBtcHRzYXNfZnJlZV9yZXF1ZXN0KE1QVFNBU1JlcXVlc3QNCj4gKnJlcSkN
Cj4gK8KgwqDCoMKgwqDCoMKgwqAgcmVxLT5zcmVxLT5oYmFfcHJpdmF0ZSA9IE5VTEw7DQo+ICvC
oMKgwqDCoMKgwqDCoMKgIHNjc2lfcmVxX3VucmVmKHJlcS0+c3JlcSk7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgIHJlcS0+c3JlcSA9IE5VTEw7DQo+ICstwqDCoMKgwqDCoMKgwqAgUVRBSUxRX1JFTU9W
RSgmcy0+cGVuZGluZywgcmVxLCBuZXh0KTsNCj4gK8KgwqDCoMKgIH0NCj4gKyvCoMKgwqAgUVRB
SUxRX1JFTU9WRSgmcy0+cGVuZGluZywgcmVxLCBuZXh0KTsNCj4gK8KgwqDCoMKgIHFlbXVfc2ds
aXN0X2Rlc3Ryb3koJnJlcS0+cXNnKTsNCj4gK8KgwqDCoMKgIGdfZnJlZShyZXEpOw0KPiArIH0N
Cj4gKy0tIA0KPiArMi4xNy4xDQo+ICsNCj4gDQo+IA0KPiANCg0K
