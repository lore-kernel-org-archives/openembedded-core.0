Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C73F77D1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D6B81850F;
	Thu,  8 Jun 2017 15:16:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pGKl_to3Pz3r; Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5934118260;
	Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F2111E05C;
	Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33F141E057;
	Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 280815C8;
	Thu,  8 Jun 2017 15:16:41 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 8 Jun 2017 15:16:41 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 8 Jun 2017 15:16:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patrick Ohly
	<patrick.ohly@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
Thread-Index: AQHS36NSGTWZJyr3a0+CXI7+JCHKWaIZkFKggADJKQCAAE5TAIAASq4Q
Date: Thu, 8 Jun 2017 13:16:40 +0000
Message-ID: <a0a0eb57632c422ab7ab8fac7654dd80@XBOX02.axis.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
	<13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
	<1496901892.30163.119.camel@intel.com>
	<1496918712.6630.237.camel@linuxfoundation.org>
In-Reply-To: <1496918712.6630.237.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Thu, 08 Jun 2017 13:16:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiA4IGp1
bmkgMjAxNyAxMjo0NQ0KPiBUbzogUGF0cmljayBPaGx5IDxwYXRyaWNrLm9obHlAaW50ZWwuY29t
PjsgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMl0gYml0YmFrZS5jb25mOiBESVNUUk9fRkVBVFVSRVMg
YXMNCj4gb3ZlcnJpZGVzDQo+IA0KPiBPbiBUaHUsIDIwMTctMDYtMDggYXQgMDg6MDQgKzAyMDAs
IFBhdHJpY2sgT2hseSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMTctMDYtMDcgYXQgMTY6MTEgKzAw
MDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+DQo+ID4gPiBSYXRoZXIgdGhhbiBy
ZXF1aXJpbmcgdGhhdCB0aGUgd2FudGVkIERJU1RST19GRUFUVVJFUyB0aGF0IHNob3VsZA0KPiA+
ID4gYmUNCj4gPiA+IGF2YWlsYWJsZSBhcyBvdmVycmlkZXMgYXJlIGRlZmluZWQgaW4gRElTVFJP
X0ZFQVRVUkVTX09WRVJSSURFUw0KPiA+ID4gKHdoaWNoDQo+ID4gPiBzaG91bGQgbm90IGJlIGNv
bmZ1c2VkIHdpdGggdGhlIHNpbWlsYXJseSBuYW1lZA0KPiA+ID4gRElTVFJPRkVBVFVSRVNPVkVS
UklERVMNCj4gPiA+IHZhcmlhYmxlIHRoYXQgeW91IGFsc28gYWRkLi4uKSwNCj4gPiBJIGhhZCB0
aG91Z2h0IGFib3V0IHRob3NlIG5hbWVzIGFuZCBpbiB0aGUgZW5kIHdlbnQgYWhlYWQgd2l0aCB0
aGUNCj4gPiBzaW1pbGFyIG5hbWVzIGJlY2F1c2UgdGhlIGN1c3RvbWl6YWJsZSBvbmUgbWFkZSBz
ZW5zZSB0byBtZSBhbmQgdGhlDQo+ID4gaW50ZXJuYWwgb25lIGlzIHNpbWlsYXIgdG8gdGhlIG90
aGVyIGVudHJpZXMgaW4gT1ZFUlJJREVTLg0KPiA+DQo+ID4gPg0KPiA+ID4gwqB3aHkgbm90IGFk
ZCB0aGVtIGFsbCBidXQgd2l0aCBhIHByZWZpeC4NCj4gPiA+IEkuZS4sIHNpbWlsYXIgdG8gaG93
IHBhY2thZ2UgbmFtZXMgYXJlIGF2YWlsYWJsZSBhcyBvdmVycmlkZXMNCj4gPiA+IHByZWZpeGVk
DQo+ID4gPiB3aXRoICJwbi0iLCBob3cgYWJvdXQgYWxsIGRpc3RybyBmZWF0dXJlcyBhcmUgbWFk
ZSBhdmFpbGFibGUgYXMNCj4gPiA+IG92ZXJyaWRlcyB3aXRoIGEgImRmLSIgcHJlZml4Pw0KPiA+
IFRoYXQgd291bGQgYmUgZmluZSB3aXRoIG1lLg0KPiA+DQo+ID4gSSBqdXN0IGhhdmUgYSBmZXcg
Y29uY2VybnM6DQo+ID4gwqDCoMKgwqDCoMKgKiBIb3cgcGVyZm9ybWFuY2Utc2Vuc2l0aXZlIGlz
IE9WRVJSSURFUz8gSG93IGNhbiB0aGUgaW1wYWN0IG9mDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGJv
dGggYXBwcm9hY2hlcyBiZSBiZW5jaG1hcmtlZD8gVGhlIGlkZWEgYmVoaW5kIHRoZQ0KPiA+IGNv
bmZpZ3VyYWJsZQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdWJzZXQgd2FzIHRvIGFkZCBvbmx5IGEg
ZmV3IG5ldyBvdmVycmlkZXMuIFdlIGN1cnJlbnRseSBoYXZlDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oGFsbW9zdCA3MCBpbmRpdmlkdWFsIGVudHJpZXMgaW4gRElTVFJPX0ZFQVRVUkVTLg0KPiA+IMKg
wqDCoMKgwqDCoCogSSd2ZSBzZWVuIGNvbmZ1c2lvbiBhYm91dCB0aGUgcG4tIHByZWZpeC4gQXQg
bGVhc3QgZGYtIHdvdWxkDQo+ID4gYmUNCj4gPiDCoMKgwqDCoMKgwqDCoMKgbmFtZWQgYXBwcm9w
cmlhdGVseSAoaW4gY29udHJhc3QgdG8gUE4sIHdoaWNoIGlzIGhpc3RvcmljKSwNCj4gPiBidXQN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaXQncyB5ZXQgYW5vdGhlciBjb252ZW50aW9uIHRoYXQgbWln
aHQgbm90IGJlIGltbWVkaWF0ZWx5DQo+ID4gwqDCoMKgwqDCoMKgwqDCoG9idmlvdXMuIFRoZSBz
YW1lIGlzIHRydWUgZm9yIHNlbGVjdGluZyBhIHN1YnNldCB3aXRoIHRoZQ0KPiA+IHNhbWUNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgbmFtZSBhcyB0aGUgZmVhdHVyZSwgdGhvdWdoLg0KPiA+IMKgwqDC
oMKgwqDCoCogQ2FuIGRpc3RybyBmZWF0dXJlcyBjb250YWluIGNoYXJhY3RlcnMgdGhhdCBhcmUg
aW52YWxpZCBpbiBhbg0KPiA+IMKgwqDCoMKgwqDCoMKgwqBvdmVycmlkZT8gXyBhbmQgOiB3b3Vs
ZCBoYXZlIHRvIGJlIGF2b2lkZWQsIGZvciBleGFtcGxlIGJ5DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oG1hcHBpbmcgdGhlbSB0byAtLg0KPiANCj4gTXkgZmVlbGluZ3MgYXJlOg0KPiANCj4gKiBXZSBu
ZWVkIHRvIHVzZSBhIHByZWZpeC4gV2UndmUgYmVlbiBidXJudCB0b28gbWFueSB0aW1lcyBpbiB0
aGUgcGFzdA0KPiDCoCB3aGVuIG5vdCB1c2luZyB0aGVzZS4gImRmLSIgaXMgZmluZSwgdXNlcnMg
d2lsbCBqdXN0IGhhdmUgdG8gZGVhbA0KPiDCoCB3aXRoIGl0Lg0KPiANCj4gKiBXZSBzaG91bGQg
ZmlsdGVyIHRoZSBsaXN0IG9mIG92ZXJyaWRlcyB0byB0aG9zZSB3aGljaCB0aGUgZGlzdHJvDQo+
IMKgIHdhbnRzIHRvIG5vbWluYXRlLiBJIHJlYWxseSBkb24ndCB3YW50IHRvIGVuY291cmFnZSB3
aWRlciBzcHJlYWQgb2YNCj4gwqAgdGhpbmdzIHRoYW4gd2UgbmVlZCB0bywgdGhlc2UgbmVlZCB0
byBiZSBjb25zY2lvdXMgZGVjaXNpb25zLg0KDQpJc24ndCB0aGVyZSBhIHJpc2sgdGhhdCB3aWxs
IGJlIGNvbmZ1c2luZz8gSS5lLiwgcmVjaXBlcyB0aGF0IHVzZSwgZS5nLiwgDQpiYi51dGlscy5j
b250YWlucygpIHRvIGNoZWNrIGlmIGEgZGlzdHJvIGZlYXR1cmUgaXMgc2V0IHdpbGwgYmUgYWZm
ZWN0ZWQgDQphcyBzb29uIGFzIHRoZSBmZWF0dXJlIGlzIGFkZGVkIHRvIERJU1RST19GRUFUVVJF
UywgYnV0IHJlY2lwZXMgdGhhdCANCnVzZSB0aGUgb3ZlcnJpZGUgd2lsbCBvbmx5IGJlIGFmZmVj
dGVkIGlmIHRoZSBmZWF0dXJlIGhhcyBhbHNvIGJlZW4gDQphZGRlZCB0byBzb21lIGZpbHRlciB2
YXJpYWJsZS4NCg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXINCg0K

