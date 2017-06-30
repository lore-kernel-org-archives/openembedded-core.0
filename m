Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9835D71CA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:03:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 00:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,285,1496127600"; d="scan'208";a="987098516"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2017 00:03:11 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.126]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.83]) with mapi id
	14.03.0319.002; Fri, 30 Jun 2017 08:03:11 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4 0/7] Fix for #7040 - Support for /usr merge
Thread-Index: AQHS5QHnvPvL3IKq5UWmOTZcuJ38PaI9A3IA
Date: Fri, 30 Jun 2017 07:03:09 +0000
Message-ID: <1498806268.35191.2.camel@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.170]
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/7] Fix for #7040 - Support for /usr merge
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
X-List-Received-Date: Fri, 30 Jun 2017 07:03:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <24F7B5A72952874B9FCF1516853673CC@intel.com>
Content-Transfer-Encoding: base64

UlAsIGNhbiB5b3UgcGxlYXNlIHlvdXIgZ2l2ZSB5b3VyIGNvbW1lbnRzIGlmIHRoZXNlIHBhdGNo
ZXNldCBjYW4gYmUNCmFjY2VwdGVkLg0KDQotIEFtYXJuYXRoDQpPbiBXZWQsIDIwMTctMDYtMTQg
YXQgMTQ6MzAgKzAzMDAsIEFtYXJuYXRoIFZhbGx1cmkgd3JvdGU6DQo+IENoYW5nZXMgaW4gdjQ6
DQo+IMKgwqDCoMKgLSByb290IHN5bWxpbmtzIGNyZWF0aW9uIGZvciBuYXRpdmVzZGsgaW1hZ2Vz
Lg0KPiDCoMKgwqDCoC0gYWRkZWQgUEFDS0FHRUNPTkZJRyBvcHRpb24gZm9yICd1c3JtZXJnZScg
aW4gc3lzdGVtZA0KPiANCj4gQW1hcm5hdGggVmFsbHVyaSAoNyk6DQo+IMKgIGJpdGJha2UuY29u
Zjogc3VwcG9ydCBmb3IgbWVyZ2VkIHVzciB3aXRoIERJU1RST19GRUFUVVJFIHVzcm1lcmdlDQo+
IMKgIGNyb3NzLmJiY2xhc3M6IG1lcmdlZCAvdXNyIHN1cHBvcnQNCj4gwqAgc3lzdGVtZDogY2hh
bmdlcyB0byBzdXBwb3J0IG1lcmdlZCAvdXNyDQo+IMKgIGltYWdlOiBjcmVhdGUgc3ltbGlua3Mg
bmVlZGVkIGZvciBtZXJnZWQgL3Vzcg0KPiDCoCBpbnNhbmUuYmJjbGFzczogQWRkIHBhY2thZ2Ug
UUEgY2hlY2sgZm9yIG1lcmdlZCAvdXNyLg0KPiDCoCBtZXRhL2xpYi9vZS9zZGsucHk6IHN1cHBv
cnQgYWRkZWQgZm9yIGV4ZWN1dGluZyBwcmUtdGFyZ2V0IGNvbW1hbmRzDQo+IMKgIGltYWdlLmJi
Y2xhc3M6IGNyZWF0ZSByb290IHN5bWxpbmtzIGluIG5hdGl2ZXNkayB0YXJnZXQgc3lzcm9vdA0K
PiANCj4gwqBtZXRhL2NsYXNzZXMvY3Jvc3MuYmJjbGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHzCoMKgMiArLQ0KPiDCoG1ldGEvY2xhc3Nlcy9pbWFnZS5iYmNsYXNzwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfCAzMg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiDCoG1ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB8IDE2ICsrKysrKysrKysrKysrKysNCj4gwqBtZXRhL2NsYXNzZXMvcG9wdWxhdGVf
c2RrX2Jhc2UuYmJjbGFzc8KgwqDCoHzCoMKgMyArLS0NCj4gwqBtZXRhL2NvbmYvYml0YmFrZS5j
b25mwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8IDEwICsrKysrKy0tLS0N
Cj4gwqBtZXRhL2xpYi9vZS9zZGsucHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgfMKgwqA2ICsrKysrKw0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZF8yMzIuYmIgfMKgwqA4ICsrKystLS0tDQo+IMKgNyBmaWxlcyBjaGFuZ2VkLCA2NiBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4g

