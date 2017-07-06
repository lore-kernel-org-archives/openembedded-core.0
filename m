Return-Path: <swee.aun.khor@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED5871C14
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 09:15:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 06 Jul 2017 02:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="282816082"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2017 02:15:04 -0700
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.4]) by
	PGSMSX105.gar.corp.intel.com ([10.221.44.96]) with mapi id
	14.03.0319.002; Thu, 6 Jul 2017 17:15:04 +0800
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/7] openssl: Support musl-x32 build
Thread-Index: AQHS9ijVi7HydjRIn0mBknHiWKJPRqJGeNlQ
Date: Thu, 6 Jul 2017 09:15:03 +0000
Message-ID: <28423BAF0BC5B94BADBD663D77F7839024EF6D4F@PGSMSX102.gar.corp.intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>
	<20517da0-d00c-a85b-7bdb-a1fd16fb9659@gmail.com>
In-Reply-To: <20517da0-d00c-a85b-7bdb-a1fd16fb9659@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] openssl: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 09:15:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WW91IGFyZSByaWdodCwgdGhlIGxpbnV4LW11c2wqIHJlbW92aW5nIGlzIGJyZWFraW5nIG90aGVy
IG11c2wgYXJjaGVzLiBJIHdpbGwgY2hhbmdlIHRvIHRoaXMuIA0KDQpAQCAtNjUsOCArNjUsNyBA
QCBkb19jb25maWd1cmUgKCkgew0KIAlvcz0ke0hPU1RfT1N9DQogCWNhc2UgJG9zIGluDQogCWxp
bnV4LWdudWVhYmkgfFwNCglsaW51eC1nbnVzcGUgfFwNCi0JbGludXgtbXVzbCopDQorCWxpbnV4
LW11c2xlYWJpIHxcDQorCWxpbnV4LW11c2xzcGUpDQoJCW9zPWxpbnV4DQogCQk7Ow0KIAkJKikN
Cg0KSSB3aWxsIGNvbWJpbmUgdGhlIGxpbnV4LWdudXgzMi14ODZfNjQgYW5kIGxpbnV4LW11c2x4
MzIteDg2XzY0LiANCg0KQEAgLTEwMSw2ICsxMDAsOSBAQCBkb19jb25maWd1cmUgKCkgew0KLQls
aW51eC1nbnV4MzIteDg2XzY0DQorCWxpbnV4LWdudXgzMi14ODZfNjR8IGxpbnV4LW11c2x4MzIt
eDg2XzY0KQ0KIAkJdGFyZ2V0PWxpbnV4LXgzMg0KIAkJOzsNCglsaW51eC1nbnU2NC14ODZfNjQp
DQogCQl0YXJnZXQ9bGludXgteDg2XzY0DQogCQk7Ow0KLS0gDQoyLjcuNA0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWls
LmNvbV0gDQpTZW50OiBUaHVyc2RheSwgSnVseSA2LCAyMDE3IDM6MjQgUE0NClRvOiBLaG9yLCBT
d2VlIEF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCA1LzddIG9w
ZW5zc2w6IFN1cHBvcnQgbXVzbC14MzIgYnVpbGQNCg0KDQoNCk9uIDcvNS8xNyA0OjU2IFBNLCBz
d2VlLmF1bi5raG9yQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogc3dlZWF1biA8c3dlZS5hdW4u
a2hvckBpbnRlbC5jb20+DQo+IA0KPiBTdXBwb3J0IG11c2wteDMyIGJ1aWxkIHdoaWNoIHRvIGJ1
aWxkIG9wZW5zc2wgd2l0aCAzMiBiaXRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogc3dlZWF1biA8
c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2wuaW5jIHwgNiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wuaW5jIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wuaW5jDQo+IGluZGV4IDM5ODBlYzIuLmJjYmJlMDYg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3Ns
LmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC5p
bmMNCj4gQEAgLTY1LDggKzY1LDcgQEAgZG9fY29uZmlndXJlICgpIHsNCj4gIAlvcz0ke0hPU1Rf
T1N9DQo+ICAJY2FzZSAkb3MgaW4NCj4gIAlsaW51eC1nbnVlYWJpIHxcDQo+IC0JbGludXgtZ251
c3BlIHxcDQo+IC0JbGludXgtbXVzbCopDQoNCnJlbW92aW5nIHRoaXMgd2lsbCBicmVhayBvdGhl
ciBtdXNsIGFyY2hlcy4NCg0KPiArCWxpbnV4LWdudXNwZSkNCj4gIAkJb3M9bGludXgNCj4gIAkJ
OzsNCj4gIAkJKikNCj4gQEAgLTEwMSw2ICsxMDAsOSBAQCBkb19jb25maWd1cmUgKCkgew0KPiAg
CWxpbnV4LWdudXgzMi14ODZfNjQpDQo+ICAJCXRhcmdldD1saW51eC14MzINCj4gIAkJOzsNCj4g
KyAgICAgICAgbGludXgtbXVzbHgzMi14ODZfNjQpDQo+ICsgICAgICAgICAgICAgICAgdGFyZ2V0
PWxpbnV4LXgzMg0KPiArICAgICAgICAgICAgICAgIDs7DQoNCnlvdSBjYW4gbW92ZSBpdCBhYm92
ZSB0aGUgZ2VuZXJpYyBjaGVjayBhYm92ZQ0KDQo+ICAJbGludXgtZ251NjQteDg2XzY0KQ0KPiAg
CQl0YXJnZXQ9bGludXgteDg2XzY0DQo+ICAJCTs7DQo+IA0KDQoNCg==

