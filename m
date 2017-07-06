Return-Path: <swee.aun.khor@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2933377BDE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 23:22:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 16:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,319,1496127600"; d="scan'208";a="1148772473"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 16:22:16 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	KMSMSX153.gar.corp.intel.com (172.21.73.88) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 7 Jul 2017 07:22:15 +0800
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.4]) by
	PGSMSX110.gar.corp.intel.com ([10.221.44.111]) with mapi id
	14.03.0319.002; Fri, 7 Jul 2017 07:22:09 +0800
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 7/7] libffi: Support musl-x32 build
Thread-Index: AQHS9JlOKH183xbBQ06MZ72Or3jyiKJHWtUAgAAZA3A=
Date: Thu, 6 Jul 2017 23:22:09 +0000
Message-ID: <28423BAF0BC5B94BADBD663D77F7839024EF6EE6@PGSMSX102.gar.corp.intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
	<1499352686.7217.4.camel@intel.com>
In-Reply-To: <1499352686.7217.4.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] libffi: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 23:22:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

R290IGl0LiBXaWxsIHVwZGF0ZSB0aGF0LiANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IFdvbGQsIFNhdWwgDQpTZW50OiBUaHVyc2RheSwgSnVseSA2LCAyMDE3IDEwOjUxIFBN
DQpUbzogS2hvciwgU3dlZSBBdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwuY29tPjsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggNy83XSBsaWJmZmk6IFN1cHBvcnQgbXVzbC14MzIgYnVpbGQNCg0KT24gV2VkLCAyMDE3
LTA3LTA1IGF0IDE2OjU2IC0wNzAwLCBzd2VlLmF1bi5raG9yQGludGVsLmNvbSB3cm90ZToNCj4g
RnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+DQo+IA0KPiBVcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcuDQpUaGUgVXBzdHJlYW0tU3RhdHVzIG5lZWRzIHRvIGJlIGluIHRoZSAu
cGF0Y2ggZmlsZSwgbm90IGluIHRoZSBtYWluIHBhdGNoIGNvbW1pdC4NCg0KU2VlIGJlbG93DQoN
Cj4gQWRkZWQgdGFyZ2V0IG11c2wteDMyIGluIGNvbmZpZ3VyZS5hYyB0byBzdXBwb3J0IG11c2wt
eDMyIGJ1aWxkIGluIA0KPiBsaWJmZmkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBzd2VlYXVuIDxz
d2VlLmF1bi5raG9yQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgLi4uLzAwMDEtbGliZmZpLVN1cHBv
cnQtbXVzbC14MzItYnVpbGQucGF0Y2jCoMKgwqDCoMKgwqDCoHwgMjkNCj4gKysrKysrKysrKysr
KysrKysrKysrKw0KPiDCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy4yLjEu
YmLCoMKgwqDCoMKgwqDCoMKgfMKgwqAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
ZmZpL2xpYmZmaS8wMDAxLWxpYmZmaS0NCj4gU3VwcG9ydC1tdXNsLXgzMi1idWlsZC5wYXRjaA0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvMDAw
MS1saWJmZmktU3VwcG9ydC0NCj4gbXVzbC14MzItYnVpbGQucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJmZmkvbGliZmZpLzAwMDEtDQo+IGxpYmZmaS1TdXBwb3J0LW11c2wteDMyLWJ1
aWxkLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjk3MWE1
NDMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkv
bGliZmZpLzAwMDEtbGliZmZpLVN1cHBvcnQtbXVzbC0NCj4geDMyLWJ1aWxkLnBhdGNoDQo+IEBA
IC0wLDAgKzEsMjkgQEANCj4gK0Zyb20gNjJhYzgyMTRiM2U4YjM2OGJkOTM2NWE2OTIwYjA4MWFh
MDEyNTY3MSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IHN3ZWVhdW4gPHN3
ZWUuYXVuLmtob3JAaW50ZWwuY29tPg0KPiArRGF0ZTogTW9uLCAzIEp1bCAyMDE3IDEzOjIzOjMx
IC0wNzAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIGxpYmZmaTogU3VwcG9ydCBtdXNsIHgzMiBidWls
ZA0KPiArDQo+ICtTdXBwb3J0IGxpYmZmaSBidWlsZCB3aXRoIHRhcmdldCBtdXNsLXgzMi4NCj4g
Kw0KVXBzdHJlYW0tU3RhdHVzIGdvZXMgaGVyZQ0KDQpTYXUhDQoNCj4gK1NpZ25lZC1vZmYtYnk6
IHN3ZWVhdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwuY29tPg0KPiArLS0tDQo+ICsgY29uZmlndXJl
LmFjIHwgMyArKysNCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ICsNCj4g
K2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMgaW5kZXggYTdiZjVlZS4u
ZjRlMTAxZCANCj4gKzEwMDY0NA0KPiArLS0tIGEvY29uZmlndXJlLmFjDQo+ICsrKysgYi9jb25m
aWd1cmUuYWMNCj4gK0BAIC0xODAsNiArMTgwLDkgQEAgY2FzZSAiJGhvc3QiIGluDQo+ICvCoAnC
oMKgwqDCoCotZ251eDMyKQ0KPiArwqAJwqDCoMKgwqDCoMKgVEFSR0VUPVg4Nl82NA0KPiArwqAJ
wqDCoMKgwqDCoMKgOzsNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqLW11c2x4MzIpDQo+
ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFRBUkdFVD1YODZfNjQNCj4gKyvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgOzsNCj4gK8KgCcKgwqDCoMKgKikNCj4gK8KgCcKgwqDCoMKg
wqDCoFRBUkdFVD1YODYNCj4gK8KgCcKgwqDCoMKgwqDCoDs7DQo+ICstLQ0KPiArMi43LjQNCj4g
Kw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjIu
MS5iYg0KPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy4yLjEuYmINCj4g
aW5kZXggNDNlZWU4ZS4uMmEzZjRiNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZmZpL2xpYmZmaV8zLjIuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJmZmkvbGliZmZpXzMuMi4xLmJiDQo+IEBAIC0xMyw2ICsxMyw3IEBAIFNSQ19VUkkgPSAiZnRw
Oi8vc291cmNld2FyZS5vcmcvcHViL2xpYmZmaS8ke0JQfS50YQ0KPiByLmd6IFwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZmlsZTovL25vdC13aW4zMi5wYXRjaCBcDQo+IMKgCcKgwqDCoGZp
bGU6Ly8wMDAxLW1pcHMtVXNlLWNvbXBpbGVyLWludGVybmFsLWRlZmluZS1mb3ItDQo+IGxpbnV4
LnBhdGNoIFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmlsZTovLzAwMDEtbWlwcy1maXgt
TUlQUy1zb2Z0ZmxvYXQtYnVpbGQtaXNzdWUucGF0Y2ggXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGZpbGU6Ly8wMDAxLWxpYmZmaS1TdXBwb3J0LW11c2wteDMyLWJ1aWxkLnBhdGNoIFwNCj4g
wqAJwqDCoMKgIg0KPiDCoA0KPiDCoFNSQ19VUklbbWQ1c3VtXSA9ICI4M2I4OTU4NzYwN2UzZWI2
NWM3MGQzNjFmMTNiYWI0MyINCj4gLS0NCj4gMi43LjQNCj4gDQo=

