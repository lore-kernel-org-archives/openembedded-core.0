Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id CB9606098F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 5C7E019DCC;
	Fri, 31 May 2013 13:38:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bqi2we8wknHd; Fri, 31 May 2013 13:38:22 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 9747E19CFA;
	Fri, 31 May 2013 13:38:22 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 491A6AF6;
	Fri, 31 May 2013 13:38:22 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 3E34C9DE;
	Fri, 31 May 2013 13:38:22 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id 3CDF03405E;
	Fri, 31 May 2013 13:38:22 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Fri, 31 May 2013 13:38:22 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 31 May 2013 13:38:22 +0200
Thread-Topic: [OE-core] [PATCH v3 5/5] makedevs: Make count actually behave
	as a count for device blocks
Thread-Index: Ac5dcBE+Bd28DooFRvG1DtEvylt8GwAgyFyA
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7986359B291@xmail3.se.axis.com>
References: <cover.1369916015.git.pkj@axis.com>
	<d3bc55086bd5ab4f56dbad4d302beafc49fe0a84.1369916015.git.pkj@axis.com>
	<1369943898.14887.328.camel@ted>
In-Reply-To: <1369943898.14887.328.camel@ted>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/5] makedevs: Make count actually behave as a count for device blocks
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
X-List-Received-Date: Fri, 31 May 2013 11:38:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAzMCBt
YWogMjAxMyAyMTo1OA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIIHYzIDUvNV0gbWFrZWRldnM6IE1ha2UgY291bnQgYWN0dWFsbHkNCj4gYmVoYXZlIGFz
IGEgY291bnQgZm9yIGRldmljZSBibG9ja3MNCj4gDQo+IE9uIFRodSwgMjAxMy0wNS0zMCBhdCAx
NDoxOCArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+IFByZXZpb3VzbHkgY291
bnQgYWN0dWFsbHkgYmVoYXZlZCBhcyBlbmQsIGFuZCBkaWQgbm90IHRha2Ugc3RhcnQgaW50bw0K
PiA+IGFjY291bnQuDQo+ID4gLS0tDQo+ID4gIG1ldGEvZmlsZXMvZGV2aWNlX3RhYmxlLW1pbmlt
YWwudHh0ICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbWFrZWRldnMvbWFrZWRldnMtMS4wLjAvbWFrZWRldnMuYyB8IDIgKy0NCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBObyBz
aWduZWQtb2ZmLWJ5IGxpbmUgOigNCj4gDQo+IEkgbWVyZ2VkIHRoZSBvdGhlcnMuDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkFyZ2guIFRoZSBmYWN0IHRoYXQgd2UgYXJlIG5vdCB1
c2luZyBTaWduZWQtb2ZmLWJ5IGxpbmVzIGludGVybmFsbHkgDQppcyBub3QgaGVscGluZyBtZS4u
Lg0KDQpJIGhhdmUgc2VudCBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhlIGZpZnRoIHBhdGNoLg0K
DQovL1BldGVyDQoNCg==

