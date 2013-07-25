Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D949060FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 06:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jul 2013 23:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,741,1367996400"; d="scan'208";a="375712676"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2013 23:22:12 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 25 Jul 2013 07:22:11 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Thu, 25 Jul 2013 07:22:11 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Simon Busch <morphis@gravedo.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] wpa-supplicant: enable required
	configuration	options for connman
Thread-Index: AQHOiL1/qLjTgixrwE+o7GOPkAftKpl07Qxg
Date: Thu, 25 Jul 2013 06:22:10 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C0E129@IRSMSX105.ger.corp.intel.com>
References: <1374704965-23479-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1374704965-23479-1-git-send-email-morphis@gravedo.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] wpa-supplicant: enable required configuration	options for connman
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
X-List-Received-Date: Thu, 25 Jul 2013 06:22:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QUNLLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgU2ltb24gQnVz
Y2gNClNlbnQ6IFRodXJzZGF5LCBKdWx5IDI1LCAyMDEzIDE6MjkgQU0NClRvOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENI
XSB3cGEtc3VwcGxpY2FudDogZW5hYmxlIHJlcXVpcmVkIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBm
b3IgY29ubm1hbg0KDQpEZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiB0aGUgY29ubm1hbiBkb2N1bWVu
dGF0aW9uOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L25ldHdvcmsvY29ubm1hbi9jb25u
bWFuLmdpdC90cmVlL1JFQURNRSNuMjgwDQoNClNpZ25lZC1vZmYtYnk6IFNpbW9uIEJ1c2NoIDxt
b3JwaGlzQGdyYXZlZG8uZGU+DQotLS0NCiAuLi4vd3BhLXN1cHBsaWNhbnQvd3BhLXN1cHBsaWNh
bnQvZGVmY29uZmlnLWdudXRscyAgfCAyMSArKysrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS93cGEtc3VwcGxpY2FudC93cGEtc3VwcGxpY2FudC9k
ZWZjb25maWctZ251dGxzIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS93cGEtc3VwcGxpY2Fu
dC93cGEtc3VwcGxpY2FudC9kZWZjb25maWctZ251dGxzDQppbmRleCBlMDQxYjRkLi44YmU0MTA3
IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS93cGEtc3VwcGxpY2FudC93
cGEtc3VwcGxpY2FudC9kZWZjb25maWctZ251dGxzDQorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3dwYS1zdXBwbGljYW50L3dwYS1zdXBwbGljYW50L2RlZmNvbmZpZy0NCisrKyBnbnV0
bHMNCkBAIC0xOTAsNyArMTkwLDcgQEAgQ09ORklHX0VBUF9MRUFQPXkNCiAjQ09ORklHX0VBUF9U
TkM9eQ0KIA0KICMgV2ktRmkgUHJvdGVjdGVkIFNldHVwIChXUFMpDQotI0NPTkZJR19XUFM9eQ0K
K0NPTkZJR19XUFM9eQ0KIA0KICMgRUFQLUlLRXYyDQogI0NPTkZJR19FQVBfSUtFVjI9eQ0KQEAg
LTQwNywzICs0MDcsMjIgQEAgQ09ORklHX1RMUyA9IGdudXRscyAgI0NPTkZJR19HTlVUTFNfRVhU
UkE9eSAgQ09ORklHX0NUUkxfSUZBQ0VfREJVUz15ICBDT05GSUdfQ1RSTF9JRkFDRV9EQlVTX05F
Vz15DQorDQorIyBBUCBtb2RlIG9wZXJhdGlvbnMgd2l0aCB3cGFfc3VwcGxpY2FudCAjIFRoaXMg
Y2FuIGJlIHVzZWQgZm9yIA0KK2NvbnRyb2xsaW5nIEFQIG1vZGUgb3BlcmF0aW9ucyB3aXRoIHdw
YV9zdXBwbGljYW50LiBJdCAjIHNob3VsZCBiZSANCitub3RlZCB0aGF0IHRoaXMgaXMgbWFpbmx5
IGFpbWVkIGF0IHNpbXBsZSBjYXNlcyBsaWtlICMgV1BBMi1QZXJzb25hbCANCit3aGlsZSBtb3Jl
IGNvbXBsZXggY29uZmlndXJhdGlvbnMgbGlrZSBXUEEyLUVudGVycHJpc2Ugd2l0aCBhbiAjIA0K
K2V4dGVybmFsIFJBRElVUyBzZXJ2ZXIgY2FuIGJlIHN1cHBvcnRlZCB3aXRoIGhvc3RhcGQuDQor
Q09ORklHX0FQPXkNCisNCitDT05GSUdfQkdTQ0FOX1NJTVBMRT15DQorDQorIyBBdXRvc2Nhbg0K
KyMgVGhpcyBjYW4gYmUgdXNlZCB0byBlbmFibGUgYXV0b21hdGljIHNjYW4gc3VwcG9ydCBpbiB3
cGFfc3VwcGxpY2FudC4NCisjwqBTZWUgd3BhX3N1cHBsaWNhbnQuY29uZiBmb3IgbW9yZSBpbmZv
cm1hdGlvbiBvbiBhdXRvc2NhbiB1c2FnZS4NCisjDQorIyBFbmFibGluZyBkaXJlY3RseSBhIG1v
ZHVsZSB3aWxsIGVuYWJsZSBhdXRvc2NhbiBzdXBwb3J0Lg0KKyMgRm9yIGV4cG9uZW50aWFsIG1v
ZHVsZToNCitDT05GSUdfQVVUT1NDQU5fRVhQT05FTlRJQUw9eQ0KKyMgRm9yIHBlcmlvZGljIG1v
ZHVsZToNCisjQ09ORklHX0FVVE9TQ0FOX1BFUklPRElDPXkNCi0tDQoxLjguMS4yDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQt
Y29yZSBtYWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLWNvcmUNCg==

