Return-Path: <saul.wold@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFFA71D9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:51:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 07:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="107883682"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2017 07:51:29 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.9]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.145]) with mapi id
	14.03.0319.002; Thu, 6 Jul 2017 07:51:28 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 7/7] libffi: Support musl-x32 build
Thread-Index: AQHS9JlO2T5bfL0g0EezM2qKWICkVqJHWtUA
Date: Thu, 6 Jul 2017 14:51:28 +0000
Message-ID: <1499352686.7217.4.camel@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
In-Reply-To: <722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.112.29]
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
X-List-Received-Date: Thu, 06 Jul 2017 14:51:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F6D7A95364D4C45943C05F6DE9216A9@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA3LTA1IGF0IDE2OjU2IC0wNzAwLCBzd2VlLmF1bi5raG9yQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+DQo+IA0K
PiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcuDQpUaGUgVXBzdHJlYW0tU3RhdHVzIG5lZWRzIHRv
IGJlIGluIHRoZSAucGF0Y2ggZmlsZSwgbm90IGluIHRoZSBtYWluDQpwYXRjaCBjb21taXQuDQoN
ClNlZSBiZWxvdw0KDQo+IEFkZGVkIHRhcmdldCBtdXNsLXgzMiBpbiBjb25maWd1cmUuYWMgdG8g
c3VwcG9ydCBtdXNsLXgzMiBidWlsZCBpbg0KPiBsaWJmZmkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBzd2VlYXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgLi4uLzAwMDEt
bGliZmZpLVN1cHBvcnQtbXVzbC14MzItYnVpbGQucGF0Y2jCoMKgwqDCoMKgwqDCoHwgMjkNCj4g
KysrKysrKysrKysrKysrKysrKysrKw0KPiDCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9s
aWJmZmlfMy4yLjEuYmLCoMKgwqDCoMKgwqDCoMKgfMKgwqAxICsNCj4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDMwIGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZmZpL2xpYmZmaS8wMDAxLWxpYmZmaS0NCj4gU3VwcG9ydC1tdXNsLXgzMi1i
dWlsZC5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZm
aS9saWJmZmkvMDAwMS1saWJmZmktU3VwcG9ydC0NCj4gbXVzbC14MzItYnVpbGQucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpLzAwMDEtDQo+IGxpYmZmaS1TdXBwb3J0
LW11c2wteDMyLWJ1aWxkLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAuLjk3MWE1NDMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJmZmkvbGliZmZpLzAwMDEtbGliZmZpLVN1cHBvcnQtbXVzbC0NCj4geDMyLWJ1aWxk
LnBhdGNoDQo+IEBAIC0wLDAgKzEsMjkgQEANCj4gK0Zyb20gNjJhYzgyMTRiM2U4YjM2OGJkOTM2
NWE2OTIwYjA4MWFhMDEyNTY3MSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206
IHN3ZWVhdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwuY29tPg0KPiArRGF0ZTogTW9uLCAzIEp1bCAy
MDE3IDEzOjIzOjMxIC0wNzAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIGxpYmZmaTogU3VwcG9ydCBt
dXNsIHgzMiBidWlsZA0KPiArDQo+ICtTdXBwb3J0IGxpYmZmaSBidWlsZCB3aXRoIHRhcmdldCBt
dXNsLXgzMi4NCj4gKw0KVXBzdHJlYW0tU3RhdHVzIGdvZXMgaGVyZQ0KDQpTYXUhDQoNCj4gK1Np
Z25lZC1vZmYtYnk6IHN3ZWVhdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwuY29tPg0KPiArLS0tDQo+
ICsgY29uZmlndXJlLmFjIHwgMyArKysNCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMNCj4g
K2luZGV4IGE3YmY1ZWUuLmY0ZTEwMWQgMTAwNjQ0DQo+ICstLS0gYS9jb25maWd1cmUuYWMNCj4g
KysrKyBiL2NvbmZpZ3VyZS5hYw0KPiArQEAgLTE4MCw2ICsxODAsOSBAQCBjYXNlICIkaG9zdCIg
aW4NCj4gK8KgCcKgwqDCoMKgKi1nbnV4MzIpDQo+ICvCoAnCoMKgwqDCoMKgwqBUQVJHRVQ9WDg2
XzY0DQo+ICvCoAnCoMKgwqDCoMKgwqA7Ow0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCot
bXVzbHgzMikNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgVEFSR0VUPVg4Nl82NA0K
PiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA7Ow0KPiArwqAJwqDCoMKgwqAqKQ0KPiAr
wqAJwqDCoMKgwqDCoMKgVEFSR0VUPVg4Ng0KPiArwqAJwqDCoMKgwqDCoMKgOzsNCj4gKy0twqAN
Cj4gKzIuNy40DQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZm
aS9saWJmZmlfMy4yLjEuYmINCj4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZp
XzMuMi4xLmJiDQo+IGluZGV4IDQzZWVlOGUuLjJhM2Y0YjcgMTAwNjQ0DQo+IC0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy4yLjEuYmINCj4gKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjIuMS5iYg0KPiBAQCAtMTMsNiArMTMsNyBAQCBT
UkNfVVJJID0gImZ0cDovL3NvdXJjZXdhcmUub3JnL3B1Yi9saWJmZmkvJHtCUH0udGENCj4gci5n
eiBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpbGU6Ly9ub3Qtd2luMzIucGF0Y2ggXA0K
PiDCoAnCoMKgwqBmaWxlOi8vMDAwMS1taXBzLVVzZS1jb21waWxlci1pbnRlcm5hbC1kZWZpbmUt
Zm9yLQ0KPiBsaW51eC5wYXRjaCBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpbGU6Ly8w
MDAxLW1pcHMtZml4LU1JUFMtc29mdGZsb2F0LWJ1aWxkLWlzc3VlLnBhdGNoIFwNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqBmaWxlOi8vMDAwMS1saWJmZmktU3VwcG9ydC1tdXNsLXgzMi1idWls
ZC5wYXRjaCBcDQo+IMKgCcKgwqDCoCINCj4gwqANCj4gwqBTUkNfVVJJW21kNXN1bV0gPSAiODNi
ODk1ODc2MDdlM2ViNjVjNzBkMzYxZjEzYmFiNDMiDQo+IC0twqANCj4gMi43LjQNCj4g

