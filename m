Return-Path: <saul.wold@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 417CA78280
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 16:54:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 12 Jun 2017 09:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,334,1493708400"; d="scan'208";a="98529554"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2017 09:54:27 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 12 Jun 2017 09:54:26 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.128]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.119]) with mapi id
	14.03.0319.002; Mon, 12 Jun 2017 09:54:25 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"akuster@mvista.com" <akuster@mvista.com>
Thread-Topic: [OE-core] [PATCH][pyro] mkelfimage: Fix broken patch when
	building native
Thread-Index: AQHS45yL8KZnpMJ0kEG6eaW0DEr/Lg==
Date: Mon, 12 Jun 2017 16:54:24 +0000
Message-ID: <1497286463.20768.57.camel@intel.com>
References: <1496702876-32494-1-git-send-email-sgw@linux.intel.com>
	<1496702876-32494-2-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1496702876-32494-2-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.86.32]
MIME-Version: 1.0
Subject: Re: [PATCH][pyro] mkelfimage: Fix broken patch when building native
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
X-List-Received-Date: Mon, 12 Jun 2017 16:54:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <65965D7E7D2B5F4F81999EFFA95D8B19@intel.com>
Content-Transfer-Encoding: base64

QXJtaW4sDQoNClRoaXMgc2hvdWxkIGJlIGEgMi4zLjEgY2FuZGlkYXRlLCBpdCdzIG5vdyBtZXJn
ZWQgaW4gbWFzdGVyDQoNClNhdSENCg0KDQpPbiBNb24sIDIwMTctMDYtMDUgYXQgMTU6NDcgLTA3
MDAsIFNhdWwgV29sZCB3cm90ZToNCj4gQSBjaGFuZ2Ugb2NjdXJlZCBhYm91dCBhIHllYXIgYWdv
IHRoYXQgYnJva2UgdGhlIG5hdGl2ZSBidWlsZCwgZml4DQo+IHRoYXQgcGF0Y2gNCj4gDQo+IFtZ
T0NUTyAjMTE1OTBdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXVsIFdvbGQgPHNnd0BsaW51eC5p
bnRlbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9ta2VsZmltYWdlL21rZWxmaW1hZ2UvZml4LW1ha2Vm
aWxlLXRvLWZpbmQtbGliei5wYXRjaCB8IDE1DQo+ICsrKysrKysrKy0tLS0tLQ0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21rZWxmaW1hZ2UvbWtlbGZpbWFnZS9maXgtDQo+
IG1ha2VmaWxlLXRvLWZpbmQtbGliei5wYXRjaCBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMv
bWtlbGZpbWFnZS9ta2VsZmltYWdlL2ZpeC1tYWtlZmlsZS10by1maW5kLWxpYnoucGF0Y2gNCj4g
aW5kZXggNzU2YTY1Yy4uYmU1NDc1NCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21rZWxmaW1hZ2UvbWtlbGZpbWFnZS9maXgtbWFrZWZpbGUtdG8tDQo+IGZpbmQtbGliei5w
YXRjaA0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWtlbGZpbWFnZS9ta2VsZmltYWdl
L2ZpeC1tYWtlZmlsZS10by0NCj4gZmluZC1saWJ6LnBhdGNoDQo+IEBAIC0zLDggKzMsMTEgQEAg
TGV0IG1ha2VmaWxlIGZpbmQgbGlieiBhbmQgemxpYi5oIGJ5IENGTEFHUyBhbmQNCj4gTERGTEFH
Uy4NCj4gwqBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+DQo+IMKgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+IMKgLS0tDQo+ICsgY29uZmlndXJl
LmFjIHwgNCArKy0tDQo+ICsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gKw0KPiDCoGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMNCj4gLWluZGV4IGQxYWNjMzYuLjZmODY1YjAgMTAwNjQ0DQo+ICtpbmRleCAwZjJhYzcyLi5m
OTA5OWEyIDEwMDY0NA0KPiDCoC0tLSBhL2NvbmZpZ3VyZS5hYw0KPiDCoCsrKyBiL2NvbmZpZ3Vy
ZS5hYw0KPiDCoEBAIC02Miw3ICs2Miw3IEBAIEFDX0NIRUNLX1BST0coW1JQTV0swqDCoMKgcnBt
LMKgwqDCoHJwbSzCoMKgwqBbXSwgWyRQQVRIXSkNCj4gQEAgLTE2LDE1ICsxOSwxNSBAQCBpbmRl
eCBkMWFjYzM2Li42Zjg2NWIwIDEwMDY0NA0KPiDCoMKgDQo+IMKgIGRubCBGaW5kIHRoZSBkZWZh
dWx0IHByb2dyYW1zDQo+IMKgIGlmIHRlc3QgIndpdGhfZGVmYXVsdCIgIT0gbm8gOyB0aGVuDQo+
IC1AQCAtMTc1LDcgKzE3NSw3IEBAIGZpDQo+IC3CoA0KPiArQEAgLTE3Niw3ICsxNzYsNyBAQCBm
aQ0KPiDCoCBkbmwgLS0tT3V0cHV0IHZhcmlhYmxlcy4uLg0KPiDCoMKgDQo+IC0tSE9TVF9DRkxB
R1M9IiRIT1NUX0NGTEFHUyAtTzIgLVdhbGwgXCQoSE9TVF9DUFBGTEFHUykiDQo+IC0rSE9TVF9D
RkxBR1M9IiRIT1NUX0NGTEFHUyAtTzIgLVdhbGwgXCQoSE9TVF9DUFBGTEFHUykgJENGTEFHUyIN
Cj4gKyBDRkxBR1M9IiR7Q0ZMQUdTOi0tTzJ9IC1XYWxsIFwkKENQUEZMQUdTKSINCj4gKy1IT1NU
X0NGTEFHUz0iJHtIT1NUX0NGTEFHUzotLU8yfSAtV2FsbCBcJChIT1NUX0NQUEZMQUdTKSINCj4g
KytIT1NUX0NGTEFHUz0iJHtIT1NUX0NGTEFHUzotLU8yfSAtV2FsbCBcJChIT1NUX0NQUEZMQUdT
KSAkQ0ZMQUdTIg0KPiDCoMKgDQo+IMKgIGRubCBUT0RPOiBmaWd1cmUgb3V0IGhvdyB0byBzZXQg
dGhlc2UgYXBwcm9wcmlhdGVseSBmb3IgY29tcGlsZXJzDQo+IG90aGVyIHRoYW4gZ2NjDQo+IMKg
IEkzODZfQ0ZMQUdTPSIkSTM4Nl9DRkxBR1MgLU9zIC1mZnJlZXN0YW5kaW5nIC1XYWxsIC1XIC1X
bm8tZm9ybWF0DQo+IFwkKEkzODZfQ1BQRkxBR1MpIg0KPiDCoC0twqANCj4gLTEuNy4xMC40DQo+
ICsyLjcuNA0KPiDCoA0KPiAtLcKgDQo+IDIuNy40DQo+IA==

