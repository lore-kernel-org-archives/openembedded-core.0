Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3413F608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:17:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 08:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="367436347"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2013 08:17:44 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.49]) with mapi id
	14.03.0123.003; Fri, 23 Aug 2013 16:17:43 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v3 1/4] xdg-utils: add runtime dependency on
	xprop
Thread-Index: AQHOoBLHq5pAjWCXGU2Di4hcftRooZmi55BA
Date: Fri, 23 Aug 2013 15:17:42 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C19925@IRSMSX105.ger.corp.intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
	<0f4ed0a174f9463cbd3fdea5f4e9d4b1b275ee6c.1377264698.git.cristian.iorga@intel.com>
	<1377270540.6762.93.camel@ted>
In-Reply-To: <1377270540.6762.93.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/4] xdg-utils: add runtime dependency on xprop
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
X-List-Received-Date: Fri, 23 Aug 2013 15:17:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0ssIHRoYW5rcy4NCkkgdGhvdWdodCB0aGF0IHdvdWxkIGJlIHNhZmVyIHRoaXMgd2F5Lg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IEZyaWRheSwgQXVndXN0
IDIzLCAyMDEzIDY6MDkgUE0NClRvOiBJb3JnYSwgQ3Jpc3RpYW4NCkNjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCB2MyAxLzRdIHhkZy11dGlsczogYWRkIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbiB4cHJvcA0KDQpP
biBGcmksIDIwMTMtMDgtMjMgYXQgMTY6NDIgKzAzMDAsIENyaXN0aWFuIElvcmdhIHdyb3RlOg0K
PiB4cHJvcCBpcyBjYWxsZWQgYnkgeGRnLXV0aWxzIHNjcmlwdHMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBDcmlzdGlhbiBJb3JnYSA8Y3Jpc3RpYW4uaW9yZ2FAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ZGctdXRpbHMveGRnLXV0aWxzXzEuMS4wLXJjMS5iYiB8
IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3hkZy11dGlscy94ZGctdXRpbHNfMS4xLjAtcmMxLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3hkZy11dGlscy94ZGctdXRpbHNfMS4xLjAtcmMxLmJi
DQo+IGluZGV4IGQ1YzdhYTMuLjIyMjQ3ZjcgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC94ZGctdXRpbHMveGRnLXV0aWxzXzEuMS4wLXJjMS5iYg0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQveGRnLXV0aWxzL3hkZy11dGlsc18xLjEuMC1yYzEuYmINCj4gQEAgLTIz
LDMgKzIzLDQgQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdiMDU1NThhZTRiYjhlZGUzNTY4NjNj
YWU4YzQyZTNlMDEyYWE0MjFiZjlkNDUxMzBhNTcwZmQyMDkNCj4gIA0KPiAgaW5oZXJpdCBhdXRv
dG9vbHMNCj4gIA0KPiArUkRFUEVORFNfJHtQTn0gPSAieHByb3AiDQoNClVzdWFsbHkgYmVzdCB0
byBkbyArPSB3aXRoIHRoZXNlLiBJJ3ZlIHR3ZWFrZWQgaXQgd2hlbiBhcHBseWluZy4NCg0KQ2hl
ZXJzLA0KDQpSaWNoYXJkDQoNCg==

