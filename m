Return-Path: <Peter.Marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2F89178151
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:20:46 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v57GKgLa007695
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 18:20:42 +0200
Received: from ATNETS99132MSX.ww300.siemens.net
	(atnets99132msx.ww300.siemens.net [158.226.163.55])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTPS id v57GKgpq019756
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 18:20:42 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.215]) by
	ATNETS99132MSX.ww300.siemens.net ([158.226.163.55]) with mapi id
	14.03.0352.000; Wed, 7 Jun 2017 18:20:42 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 4/4] cve-check-tool: fix crash on exceptions
Thread-Index: AQHS36Z02zN6ulSeJkyG/Q8fHFonlaIZkxcw
Date: Wed, 7 Jun 2017 16:20:42 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A841B841076@ATVIES991UAMSX.ww300.siemens.net>
References: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
	<1496815471-23075-5-git-send-email-peter.marko@siemens.com>
	<1496851429.26945.132.camel@linux.intel.com>
In-Reply-To: <1496851429.26945.132.camel@linux.intel.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.15]
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] cve-check-tool: fix crash on exceptions
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
X-List-Received-Date: Wed, 07 Jun 2017 16:20:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiB0aGUgY29tbWl0IHNob3J0bG9nIGRvZXMgbm90IG1hdGNoIHdoYXQgdGhlIHBhdGNoIGlzIGRv
aW5nLCB1bmxlc3MgdGhlIG5ldyByZXBsYWNlZCBmdW5jdGlvbiBpcyB0aGUgb25lIGF2b2lkaW5n
IGV4Y2VwdGlvbnMuLg0KDQpUaGUgZml4ZWQgaXNzdWUgaXMgdHJhY2tlZCB1bmRlciBodHRwczov
L2dpdGh1Yi5jb20vaWtleWRvaGVydHkvY3ZlLWNoZWNrLXRvb2wvaXNzdWVzLzYwDQpJdCBzYXlz
ICJjcmFzaCBvbiBiYWQgcG9pbnRlciBmcmVlIi4NCkl0IGZpeGVzIGNyYXNoIHdoZW4gZnJlZWlu
ZyBpbnZhbGlkIHBvaW50ZXIsIHdoaWNoIGhhcHBlbmVkIG9uIHNxbGl0ZSBleGNlcHRpb25zLg0K
DQpJZiBuZWNlc3NhcnksIEkgY2FuIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCBsb25n
ZXIgZXhwbGFuYXRpb24uDQoNCk9uIFdlZCwgMjAxNy0wNi0wNyBhdCAwODowNCArMDIwMCwgUGV0
ZXIgTWFya28gd3JvdGU6DQo+IFRoaXMgZml4ZXMgY3ZlLWNoZWNrLXRvb2wgY3Jhc2hlcyBvbiBl
eGNlcHRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPg0KPiAtLS0NCj4gIC4uLi9jdmUtY2hlY2stdG9vbC9jdmUtY2hlY2stdG9v
bF81LjYuNC5iYiAgICAgICAgIHwgIDEgKw0KPiAgLi4uMDEtRml4LWZyZWVpbmctbWVtb3J5LWFs
bG9jYXRlZC1ieS1zcWxpdGUucGF0Y2ggfCA1MCANCj4gKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jdmUtY2hlY2stdG9vbC9maWxlcy8wMDAxLUZp
eC1mcmVlaW5nLW1lbW9yeS1hbGwNCj4gb2NhdGVkLWJ5LXNxbGl0ZS5wYXRjaA0KPiANCj4gZGlm
ZiAtLWdpdCANCj4gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3ZlLWNoZWNrLXRvb2wvY3ZlLWNo
ZWNrLXRvb2xfNS42LjQuYmIgDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2N2ZS1jaGVjay10
b29sL2N2ZS1jaGVjay10b29sXzUuNi40LmJiDQo+IGluZGV4IDFmOTA2ZWUuLjQ4MjliMTEgMTAw
NjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jdmUtY2hlY2stdG9vbC9jdmUtY2hl
Y2stdG9vbF81LjYuNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3ZlLWNoZWNr
LXRvb2wvY3ZlLWNoZWNrLXRvb2xfNS42LjQuYmINCj4gQEAgLTExLDYgKzExLDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2dpdGh1Yi5jb20vaWtleWRvaGVydHkvJHtCUE59L3JlbGVhc2VzL2Rvd25s
b2FkL3Yke1BWfS8ke0JQfS4NCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtcHJpbnQtcHJvZ3Jl
c3MtaW4tcGVyY2VudC13aGVuLWRvd25sb2FkaW5nLUNWRS1kYi5wYXRjaCBcDQo+ICAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWN1cmwtYWxsb3ctb3ZlcnJpZGluZy1kZWZhdWx0LUNBLWNlcnRpZmlj
YXRlLWZpbGUucGF0Y2ggXA0KPiAgICAgICAgICAgICANCj4gZmlsZTovLzAwMDEtdXBkYXRlLUNv
bXBhcmUtY29tcHV0ZWQtdnMtZXhwZWN0ZWQtc2hhMjU2LWRpZ2l0LXN0ci5wYXRjaCANCj4gXA0K
PiArICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtZnJlZWluZy1tZW1vcnktYWxsb2NhdGVkLWJ5
LXNxbGl0ZS5wYXRjaCBcDQo+ICAgICAgICAgICAgIg0KPiAgDQo+ICBTUkNfVVJJW21kNXN1bV0g
PSAiYzVmNDI0NzE0MGZjOWJlM2JmNDE0OTFkMzFhMzQxNTUiDQo+IGRpZmYgLS1naXQgDQo+IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2N2ZS1jaGVjay10b29sL2ZpbGVzLzAwMDEtRml4LWZyZWVp
bmctbWVtb3J5LWENCj4gbGxvY2F0ZWQtYnktc3FsaXRlLnBhdGNoIA0KPiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jdmUtY2hlY2stdG9vbC9maWxlcy8wMDAxLUZpeC1mcmVlaW5nLW1lbW9yeS1h
DQo+IGxsb2NhdGVkLWJ5LXNxbGl0ZS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwLi40YTgyY2YyDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2N2ZS1jaGVjay10b29sL2ZpbGVzLzAwMDEtRml4LWZyZWVpbmctbWVtbw0K
PiArKysgcnktYWxsb2NhdGVkLWJ5LXNxbGl0ZS5wYXRjaA0KPiBAQCAtMCwwICsxLDUwIEBADQo+
ICtGcm9tIGEzMzUzNDI5NjUyZjgzYmI4YjAzMTY1MDBmYWE4OGZhMjU1NTU0MmQgTW9uIFNlcCAx
NyAwMDowMDowMCANCj4gKzIwMDENCj4gK0Zyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gK0RhdGU6IFRodSwgMTMgQXByIDIwMTcgMjM6MDk6NTIgKzAyMDANCj4g
K1N1YmplY3Q6IFtQQVRDSF0gRml4IGZyZWVpbmcgbWVtb3J5IGFsbG9jYXRlZCBieSBzcWxpdGUN
Cj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiArU2lnbmVkLW9mZi1ieTogUGV0
ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiArLS0tDQo+ICsgc3JjL2NvcmUu
YyB8IDggKysrKy0tLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvc3JjL2NvcmUuYyBiL3NyYy9jb3JlLmMN
Cj4gK2luZGV4IDYyNjMwMzEuLjY3ODhmMTYgMTAwNjQ0DQo+ICstLS0gYS9zcmMvY29yZS5jDQo+
ICsrKysgYi9zcmMvY29yZS5jDQo+ICtAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgYm9vbCBlbnN1
cmVfdGFibGUoQ3ZlREIgKnNlbGYpDQo+ICsgICAgICAgICByYyA9IHNxbGl0ZTNfZXhlYyhzZWxm
LT5kYiwgcXVlcnksIE5VTEwsIE5VTEwsICZlcnIpOw0KPiArICAgICAgICAgaWYgKHJjICE9IFNR
TElURV9PSykgew0KPiArICAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImVuc3VyZV90
YWJsZSgpOiAlc1xuIiwgZXJyKTsNCj4gKy0gICAgICAgICAgICAgICAgZnJlZShlcnIpOw0KPiAr
KyAgICAgICAgICAgICAgICBzcWxpdGUzX2ZyZWUoZXJyKTsNCj4gKyAgICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOw0KPiArICAgICAgICAgfQ0KPiArICAgICAgICAgDQo+ICtAQCAtOTEsNyAr
OTEsNyBAQCBzdGF0aWMgYm9vbCBlbnN1cmVfdGFibGUoQ3ZlREIgKnNlbGYpDQo+ICsgICAgICAg
ICByYyA9IHNxbGl0ZTNfZXhlYyhzZWxmLT5kYiwgcXVlcnksIE5VTEwsIE5VTEwsICZlcnIpOw0K
PiArICAgICAgICAgaWYgKHJjICE9IFNRTElURV9PSykgew0KPiArICAgICAgICAgICAgICAgICBm
cHJpbnRmKHN0ZGVyciwgImVuc3VyZV90YWJsZSgpOiAlc1xuIiwgZXJyKTsNCj4gKy0gICAgICAg
ICAgICAgICAgZnJlZShlcnIpOw0KPiArKyAgICAgICAgICAgICAgICBzcWxpdGUzX2ZyZWUoZXJy
KTsNCj4gKyAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgICAgICAgfQ0KPiAr
IA0KPiArQEAgLTk5LDExICs5OSwxMSBAQCBzdGF0aWMgYm9vbCBlbnN1cmVfdGFibGUoQ3ZlREIg
KnNlbGYpDQo+ICsgICAgICAgICByYyA9IHNxbGl0ZTNfZXhlYyhzZWxmLT5kYiwgcXVlcnksIE5V
TEwsIE5VTEwsICZlcnIpOw0KPiArICAgICAgICAgaWYgKHJjICE9IFNRTElURV9PSykgew0KPiAr
ICAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImVuc3VyZV90YWJsZSgpOiAlc1xuIiwg
ZXJyKTsNCj4gKy0gICAgICAgICAgICAgICAgZnJlZShlcnIpOw0KPiArKyAgICAgICAgICAgICAg
ICBzcWxpdGUzX2ZyZWUoZXJyKTsNCj4gKyAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0K
PiArICAgICAgICAgfQ0KPiArICAgICAgICAgaWYgKGVycikgew0KPiArLSAgICAgICAgICAgICAg
ICBmcmVlKGVycik7DQo+ICsrICAgICAgICAgICAgICAgIHNxbGl0ZTNfZnJlZShlcnIpOw0KPiAr
ICAgICAgICAgfQ0KPiArIA0KPiArICAgICAgICAgcmV0dXJuIHRydWU7DQo+ICstLQ0KPiArMi4x
LjQNCj4gKw0KPiAtLQ0KPiAyLjEuNA0KPiANCg0KDQo=

