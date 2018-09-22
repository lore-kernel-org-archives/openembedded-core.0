Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFF9C745FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 00:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1F91C18568;
	Sat, 22 Sep 2018 02:35:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gIXwKEr2iD_8; Sat, 22 Sep 2018 02:35:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 11C5018567;
	Sat, 22 Sep 2018 02:35:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3B501E2BD;
	Sat, 22 Sep 2018 02:35:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E73AB1E2A9;
	Sat, 22 Sep 2018 02:35:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 22 Sep 2018 02:35:43 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id DB0871D90;
	Sat, 22 Sep 2018 02:35:43 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 22 Sep 2018 02:35:43 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sat, 22 Sep 2018 02:35:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Sinan Kaya <okaya@kernel.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjFdIGJ1?=
	=?utf-8?Q?sybox:_CVE-2017-15874..."_and_2_more?=
Thread-Index: AQHUUfsS1GKwbcuf+0mEb+ozfT2Rg6T7NhQAgAA8gOA=
Date: Sat, 22 Sep 2018 00:35:43 +0000
Message-ID: <0a3643b6280d453e860ed5a727ec1720@XBOX02.axis.com>
References: <20180921221553.23399-1-okaya@kernel.org>
	<20180921223301.29310.35097@do.openembedded.org>
	<4c603f5b-d4b3-0a1d-42a5-4ed594953788@kernel.org>
In-Reply-To: <4c603f5b-d4b3-0a1d-42a5-4ed594953788@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjFdIGJ1c3lib3g6IENWRS0yMDE3LTE1ODc0Li4uIiBhbmQgMiBtb3Jl?=
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
X-List-Received-Date: Sat, 22 Sep 2018 00:35:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBTaW5hbiBLYXlhDQo+IFNl
bnQ6IGRlbiAyMiBzZXB0ZW1iZXIgMjAxOCAwMDo1Mw0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIOKclyBwYXRj
aHRlc3Q6IGZhaWx1cmUgZm9yICJbdjFdIGJ1c3lib3g6IENWRS0NCj4gMjAxNy0xNTg3NC4uLiIg
YW5kIDIgbW9yZQ0KPiANCj4gT24gOS8yMS8yMDE4IDY6MzMgUE0sIFBhdGNod29yayB3cm90ZToN
Cj4gPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiA+DQo+ID4gU2VyaWVzOiAiW3YxXSBidXN5Ym94
OiBDVkUtMjAxNy0xNTg3NC4uLiIgYW5kIDIgbW9yZQ0KPiA+IFJldmlzaW9uOiAxDQo+ID4gVVJM
ICAgOiBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3Nlcmllcy8xNDE4NC8NCj4g
PiBTdGF0ZSA6IGZhaWx1cmUNCj4gPg0KPiA+ID09IFN1bW1hcnkgPT0NCj4gPg0KPiA+DQo+ID4g
VGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIE9wZW5FbWJlZGRl
ZCBDb3JlLiBUaGlzDQo+ID4gaXMgYW4gYXV0b21hdGVkIHJlc3BvbnNlLiBTZXZlcmFsIHRlc3Rz
IGhhdmUgYmVlbiBleGVjdXRlZCBvbiB0aGUNCj4gPiBwcm9wb3NlZCBzZXJpZXMgYnkgcGF0Y2h0
ZXN0IHJlc3VsdGluZyBpbiB0aGUgZm9sbG93aW5nIGZhaWx1cmVzOg0KPiA+DQo+ID4NCj4gPg0K
PiA+ICogSXNzdWUgICAgICAgICAgICAgU2VyaWVzIGRvZXMgbm90IGFwcGx5IG9uIHRvcCBvZiB0
YXJnZXQgYnJhbmNoDQo+IFt0ZXN0X3Nlcmllc19tZXJnZV9vbl9oZWFkXQ0KPiA+ICAgIFN1Z2dl
c3RlZCBmaXggICAgUmViYXNlIHlvdXIgc2VyaWVzIG9uIHRvcCBvZiB0YXJnZXRlZCBicmFuY2gN
Cj4gPiAgICBUYXJnZXRlZCBicmFuY2ggIG1hc3RlciAoY3VycmVudGx5IGF0IDk1N2EyZjk1Yjgp
DQo+ID4NCj4gDQo+IFRoZXNlIHBhdGNoZXMgZG8gbm90IGFwcGx5IHRvIHRoZSBtYXN0ZXIgYnJh
bmNoIGJlY2F1c2UgdGhleSB3ZXJlDQo+IGludGVuZGVkIGZvciB0aGUgc3VtbyBicmFuY2ggYXMg
YSBzZWN1cml0eSBmaXguIElzIHRoZXJlIGEgd2F5IHRvIA0KPiBzcGVjaWZ5IHdoYXQgcGFydGlj
dWxhciBicmFuY2ggdGhpcyBwYXRjaCBpcyB0YXJnZXRpbmc/DQoNCkFkZCAiW3N1bW9dIiB0byB0
aGUgc3ViamVjdC4NCg0KPiBBbm90aGVyIHJlYXNvbiBpcyB0aGF0IHBhY2thZ2UgdmVyc2lvbnMg
b24gbWFzdGVyIGJyYW5jaCBhcmUgbmV3ZXIuDQo+IA0KPiA+ICogSXNzdWUgICAgICAgICAgICAg
QSBwYXRjaCBmaWxlIGhhcyBiZWVuIGFkZGVkLCBidXQgZG9lcyBub3QgaGF2ZSBhDQo+IFNpZ25l
ZC1vZmYtYnkgdGFnIFt0ZXN0X3NpZ25lZF9vZmZfYnlfcHJlc2VuY2VdDQo+ID4gICAgU3VnZ2Vz
dGVkIGZpeCAgICBTaWduIG9mZiB0aGUgYWRkZWQgcGF0Y2ggZmlsZSAobWV0YS9yZWNpcGVzLQ0K
PiBtdWx0aW1lZGlhL2xpYnBuZy9maWxlcy9DVkUtMjAxOC0xMzc4NS5wYXRjaCkNCj4gPg0KPiAN
Cj4gdGhlIG9yaWdpbmFsIHBhdGNoIGRvZXNuJ3QgaGF2ZSBhIHNpZ25lZC1vZmYuIFdoYXQncyB0
aGUgcG9saWN5Pw0KDQpZb3Ugc2hvdWxkIGFkZCBhIFNpZ25lZC1vZmYtYnkgd2l0aCB5b3VyIG93
biBuYW1lIHRvIHRoZSBwYXRjaGVzLg0KDQo+ID4gKiBJc3N1ZSAgICAgICAgICAgICBBZGRlZCBw
YXRjaCBmaWxlIGlzIG1pc3NpbmcgVXBzdHJlYW0tU3RhdHVzIGluDQo+IHRoZSBoZWFkZXIgW3Rl
c3RfdXBzdHJlYW1fc3RhdHVzX3ByZXNlbmNlX2Zvcm1hdF0NCj4gPiAgICBTdWdnZXN0ZWQgZml4
ICAgIEFkZCBVcHN0cmVhbS1TdGF0dXM6IDxWYWxpZCBzdGF0dXM+IHRvIHRoZSBoZWFkZXINCj4g
b2YgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L0NWRS0yMDE3LTE1ODc0LnBhdGNo
DQo+ID4gICAgU3RhbmRhcmQgZm9ybWF0ICBVcHN0cmVhbS1TdGF0dXM6IDxWYWxpZCBzdGF0dXM+
DQo+ID4gICAgVmFsaWQgc3RhdHVzICAgICBQZW5kaW5nLCBBY2NlcHRlZCwgQmFja3BvcnQsIERl
bmllZCwNCj4gSW5hcHByb3ByaWF0ZSBbcmVhc29uXSwgU3VibWl0dGVkIFt3aGVyZV0NCj4gPg0K
PiANCj4gSSdtIGZhaXJseSBuZXcgdG8gdGhpcy4gSSBiZWxpZXZlIEkgaGF2ZSB0aGlzIHRhZy4g
RG8gSSBoYXZlIGEgbWlzdGFrZT8NCg0KVGhlIFVwc3RyZWFtLVN0YXR1cyBzaG91bGQgYmUgaW4g
dGhlIHBhdGNoLCBub3QgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQo+IGNvbW1pdCBiMzc2MWExYTli
MDVjOTcwMjgwMzRhNDRiZTI3NDAwMTE0Y2NmNTI2DQo+IEF1dGhvcjogU2luYW4gS2F5YSA8b2th
eWFAa2VybmVsLm9yZz4NCj4gRGF0ZTogICBGcmkgU2VwIDIxIDA0OjIwOjQ0IDIwMTggKzAwMDAN
Cj4gDQo+ICAgICAgYnVzeWJveDogQ1ZFLTIwMTctMTU4NzQNCj4gDQo+ICAgICAgKiBDVkUtMjAx
Ny0xNTg3NA0KPiAgICAgIGJ1c3lib3g6IEludGVnZXIgdW5kZXJmbG93IGluDQo+IGFyY2hpdmFs
L2xpYmFyY2hpdmUvZGVjb21wcmVzc191bmx6bWEuYw0KPiANCj4gICAgICAoY2hlcnJ5IHBpY2tl
ZCBmcm9tIDlhYzQyYzUwMDU4NmZhNWYxMGExZjZkMjJjM2Y3OTdkZjExYjFmNmIpDQo+IA0KPiAg
ICAgIEFmZmVjdHMgYnVzeWJveCA8PSAxLjI3LjINCj4gDQo+ICAgICAgVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbDQo+IGh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1c3lib3gvY29tbWl0Lz9p
ZD05YWM0MmM1MDA1ODZmYTVmMTBhMWY2ZDIyYzNmDQo+IDc5N2RmMTFiMWY2Yl0NCj4gICAgICBD
VkU6IENWRS0yMDE3LTE1ODc0DQo+ICAgICAgUmVmOiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5j
b20vc2hvd19idWcuY2dpP2lkPUNWRS0yMDE3LTE1ODc0DQo+ICAgICAgU2lnbmVkLW9mZi1ieTog
U2luYW4gS2F5YSA8b2theWFAa2VybmVsLm9yZz4NCj4gDQo+ID4NCj4gPg0KPiA+IElmIHlvdSBi
ZWxpZXZlIGFueSBvZiB0aGVzZSB0ZXN0IHJlc3VsdHMgYXJlIGluY29ycmVjdCwgcGxlYXNlIHJl
cGx5DQo+IHRvIHRoZQ0KPiA+IG1haWxpbmcgbGlzdCAob3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZykgcmFpc2luZyB5b3VyDQo+IGNvbmNlcm5zLg0KPiA+IE90aGVyd2lz
ZSB3ZSB3b3VsZCBhcHByZWNpYXRlIHlvdSBjb3JyZWN0aW5nIHRoZSBpc3N1ZXMgYW5kDQo+IHN1
Ym1pdHRpbmcgYSBuZXcNCj4gPiB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNldCBpZiBhcHBsaWNhYmxl
LiBQbGVhc2UgZW5zdXJlIHlvdQ0KPiBhZGQvaW5jcmVtZW50IHRoZQ0KPiA+IHZlcnNpb24gbnVt
YmVyIHdoZW4gc2VuZGluZyB0aGUgbmV3IHZlcnNpb24gKGkuZS4gW1BBVENIXSAtPiBbUEFUQ0gN
Cj4gdjJdIC0+DQo+ID4gW1BBVENIIHYzXSAtPiAuLi4pLg0KPiA+DQo+ID4gLS0tDQo+ID4gR3Vp
ZGVsaW5lczoNCj4gaHR0cHM6Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL0NvbW1pdF9QYXRj
aF9NZXNzYWdlX0d1aWRlbGluZXMNCj4gPiBUZXN0IGZyYW1ld29yazogaHR0cDovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcGF0Y2h0ZXN0DQo+ID4gVGVzdCBzdWl0ZTogICAg
IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3BhdGNodGVzdC1vZQ0K
DQovL1BldGVyDQoNCg==

