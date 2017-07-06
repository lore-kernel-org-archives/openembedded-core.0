Return-Path: <swee.aun.khor@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A224719D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:25:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 01:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="989333886"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2017 01:25:06 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	KMSMSX151.gar.corp.intel.com (172.21.73.86) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 6 Jul 2017 16:25:05 +0800
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.4]) by
	PGSMSX110.gar.corp.intel.com ([10.221.44.111]) with mapi id
	14.03.0319.002; Thu, 6 Jul 2017 16:25:05 +0800
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 7/7] libffi: Support musl-x32 build
Thread-Index: AQHS9iiwKH183xbBQ06MZ72Or3jyiKJGdlAw
Date: Thu, 6 Jul 2017 08:25:04 +0000
Message-ID: <28423BAF0BC5B94BADBD663D77F7839024EF6CFB@PGSMSX102.gar.corp.intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
	<e67110b8-07b3-768b-e80b-2a06c4fb55e4@gmail.com>
In-Reply-To: <e67110b8-07b3-768b-e80b-2a06c4fb55e4@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
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
X-List-Received-Date: Thu, 06 Jul 2017 08:25:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2lsbCBkbyB0aGF0LiANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0g
UmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29tXSANClNlbnQ6IFRodXJzZGF5LCBKdWx5IDYs
IDIwMTcgMzoyMiBQTQ0KVG86IEtob3IsIFN3ZWUgQXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNv
bT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIIDcvN10gbGliZmZpOiBTdXBwb3J0IG11c2wteDMyIGJ1aWxkDQoN
Cg0KDQpPbiA3LzUvMTcgNDo1NiBQTSwgc3dlZS5hdW4ua2hvckBpbnRlbC5jb20gd3JvdGU6DQo+
IEZyb206IHN3ZWVhdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwuY29tPg0KPiANCj4gVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nLg0KPiBBZGRlZCB0YXJnZXQgbXVzbC14MzIgaW4gY29uZmlndXJlLmFj
IHRvIHN1cHBvcnQgbXVzbC14MzIgYnVpbGQgaW4gbGliZmZpLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgLi4uLzAwMDEt
bGliZmZpLVN1cHBvcnQtbXVzbC14MzItYnVpbGQucGF0Y2ggICAgICAgfCAyOSArKysrKysrKysr
KysrKysrKysrKysrDQo+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuMi4x
LmJiICAgICAgICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGli
ZmZpLzAwMDEtbGliZmZpLVN1cHBvcnQtbXVzbC14MzItYnVpbGQuDQo+IHBhdGNoDQo+IA0KPiBk
aWZmIC0tZ2l0IA0KPiBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvMDAwMS1s
aWJmZmktU3VwcG9ydC1tdXNsLXgzMi1idWlsDQo+IGQucGF0Y2ggDQo+IGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZmZpL2xpYmZmaS8wMDAxLWxpYmZmaS1TdXBwb3J0LW11c2wteDMyLWJ1aWwN
Cj4gZC5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi45NzFh
NTQzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZp
L2xpYmZmaS8wMDAxLWxpYmZmaS1TdXBwb3J0LW11c2wteDMyLQ0KPiArKysgYnVpbGQucGF0Y2gN
Cj4gQEAgLTAsMCArMSwyOSBAQA0KPiArRnJvbSA2MmFjODIxNGIzZThiMzY4YmQ5MzY1YTY5MjBi
MDgxYWEwMTI1NjcxIE1vbiBTZXAgMTcgMDA6MDA6MDAgDQo+ICsyMDAxDQo+ICtGcm9tOiBzd2Vl
YXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4NCj4gK0RhdGU6IE1vbiwgMyBKdWwgMjAxNyAx
MzoyMzozMSAtMDcwMA0KPiArU3ViamVjdDogW1BBVENIXSBsaWJmZmk6IFN1cHBvcnQgbXVzbCB4
MzIgYnVpbGQNCj4gKw0KPiArU3VwcG9ydCBsaWJmZmkgYnVpbGQgd2l0aCB0YXJnZXQgbXVzbC14
MzIuDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IHN3ZWVhdW4gPHN3ZWUuYXVuLmtob3JAaW50ZWwu
Y29tPg0KPiArLS0tDQo+ICsgY29uZmlndXJlLmFjIHwgMyArKysNCj4gKyAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMgaW5kZXggYTdiZjVlZS4uZjRlMTAxZCANCj4gKzEwMDY0NA0KPiArLS0tIGEv
Y29uZmlndXJlLmFjDQo+ICsrKysgYi9jb25maWd1cmUuYWMNCj4gK0BAIC0xODAsNiArMTgwLDkg
QEAgY2FzZSAiJGhvc3QiIGluDQo+ICsgCSAgICAqLWdudXgzMikNCj4gKyAJICAgICAgVEFSR0VU
PVg4Nl82NA0KPiArIAkgICAgICA7Ow0KPiArKyAgICAgICAgICAgICotbXVzbHgzMikNCj4gKysg
ICAgICAgICAgICAgIFRBUkdFVD1YODZfNjQNCj4gKysgICAgICAgICAgICAgIDs7DQoNCmp1c3Qg
T1IgaXQgd2l0aCBjYXNlIGp1c3QgYWJvdmUgaXQuDQoqLWdudXgzMiB8ICotbXVzbHgzMg0KDQo+
ICsgCSAgICAqKQ0KPiArIAkgICAgICBUQVJHRVQ9WDg2DQo+ICsgCSAgICAgIDs7DQo+ICstLQ0K
PiArMi43LjQNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZp
L2xpYmZmaV8zLjIuMS5iYiANCj4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZp
XzMuMi4xLmJiDQo+IGluZGV4IDQzZWVlOGUuLjJhM2Y0YjcgMTAwNjQ0DQo+IC0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy4yLjEuYmINCj4gKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjIuMS5iYg0KPiBAQCAtMTMsNiArMTMsNyBAQCBT
UkNfVVJJID0gImZ0cDovL3NvdXJjZXdhcmUub3JnL3B1Yi9saWJmZmkvJHtCUH0udGFyLmd6IFwN
Cj4gICAgICAgICAgICAgZmlsZTovL25vdC13aW4zMi5wYXRjaCBcDQo+ICAJICAgZmlsZTovLzAw
MDEtbWlwcy1Vc2UtY29tcGlsZXItaW50ZXJuYWwtZGVmaW5lLWZvci1saW51eC5wYXRjaCBcDQo+
ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1pcHMtZml4LU1JUFMtc29mdGZsb2F0LWJ1aWxkLWlz
c3VlLnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovLzAwMDEtbGliZmZpLVN1cHBvcnQtbXVz
bC14MzItYnVpbGQucGF0Y2ggXA0KPiAgCSAgICINCj4gIA0KPiAgU1JDX1VSSVttZDVzdW1dID0g
IjgzYjg5NTg3NjA3ZTNlYjY1YzcwZDM2MWYxM2JhYjQzIg0KPiANCg0K

