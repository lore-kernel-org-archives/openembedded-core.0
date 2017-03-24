Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B88FF77BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 209DD18254;
	Fri, 24 Mar 2017 16:10:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id aogqOi9+nPtu; Fri, 24 Mar 2017 16:10:32 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 26BF718370;
	Fri, 24 Mar 2017 16:10:32 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 159C21A092;
	Fri, 24 Mar 2017 16:10:32 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A5011A040;
	Fri, 24 Mar 2017 16:10:32 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 24 Mar 2017 16:10:32 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id F24AF1C06;
	Fri, 24 Mar 2017 16:10:31 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 24 Mar 2017 16:10:31 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 24 Mar 2017 16:10:31 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy
	<armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Using MACHINE_FEATURES in a native recipe
Thread-Index: AQHSo1VEQzGGeZuXJ0O7Pb82vZwFKqGikb4AgAGGtxA=
Date: Fri, 24 Mar 2017 15:10:31 +0000
Message-ID: <f67e1ac46aff43cfb085fd76fe0f60c6@XBOX02.axis.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<1490287404.13980.231.camel@linuxfoundation.org>
In-Reply-To: <1490287404.13980.231.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Fri, 24 Mar 2017 15:10:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBSaWNoYXJk
IFB1cmRpZQ0KPiBTZW50OiBkZW4gMjMgbWFycyAyMDE3IDE3OjQzDQo+IFRvOiBBbmRyZSBNY0N1
cmR5OyBPRSBDb3JlIG1haWxpbmcgbGlzdA0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFVzaW5n
IE1BQ0hJTkVfRkVBVFVSRVMgaW4gYSBuYXRpdmUgcmVjaXBlDQo+IA0KPiBPbiBXZWQsIDIwMTct
MDMtMjIgYXQgMTQ6NDIgLTA3MDAsIEFuZHJlIE1jQ3VyZHkgd3JvdGU6DQo+ID4gQ3VycmVudGx5
IG5hdGl2ZS5iYmNsYXNzIGNsZWFycyBNQUNISU5FT1ZFUlJJREVTIGJ1dCBsZWF2ZXMNCj4gPiBN
QUNISU5FX0ZFQVRVUkVTIGFsb25lLiBJcyB0aGF0IGFuIG92ZXJzaWdodD8gT3IgaXMgdGhlcmUg
ZXZlciBhDQo+ID4gbGVnaXRpbWF0ZSByZWFzb24gZm9yIGEgbmF0aXZlIHJlY2lwZSB0byBoYXZl
IGEgZGVwZW5kZW5jeSBvbg0KPiA+IE1BQ0hJTkVfRkVBVFVSRVM/DQo+IA0KPiBUaGVyZSBpcyBu
byBnb29kIHJlYXNvbi4gQ3VycmVudGx5IGhhdmluZyB0aGlzIGRpbGVtbWEgd2l0aA0KPiBESVNU
Uk9fRkVBVFVSRVMgdG9vIDovLg0KPiANCj4gb3BrZy1uYXRpdmUgcmVidWlsZGluZyBpZiB5b3Ug
ZW5hYmxlL2Rpc2FibGUgc3lzdGVtZCBpc24ndA0KPiBleHBlY3RlZC9uaWNlLg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gUmljaGFyZA0KDQpFdmVuIHRob3VnaCBJIGFncmVlIHRoaXMgaXMgYSBnb29k
IGNoYW5nZSBhbmQgdGhhdCBpdCBzaG91bGQgYmUgZG9uZSwgSSANCndvbmRlciBpZiB3ZSBjYW4g
ZWl0aGVyIGhvbGQgaXQgb2ZmIHVudGlsIGFmdGVyIFB5cm8gaGFzIGJlZW4gcmVsZWFzZWQgDQpv
ciBtYWtlIGl0IHBvc3NpYmxlIHRvIGF2b2lkIGl0PyBUaGUgcmVhc29uIGZvciB0aGlzIGlzIHRo
YXQgSSBrbm93IA0KdGhhdCB0aGlzIGNoYW5nZSB3aWxsIHJlcXVpcmUgYSBodWdlIGFtb3VudCBv
ZiBkZXZlbG9wbWVudCB3b3JrIGZvciB1cywgDQpzb21ldGhpbmcgdGhhdCB3aWxsIG5vdCBiZSBw
b3NzaWJsZSB0byBkbyBpbiB0aGUgdGltZSBmcmFtZSBsZWZ0IHVudGlsIA0KUHlybyBpcyByZWxl
YXNlZC4gT3IgYWx0ZXJuYXRpdmVseSB3ZSB3aWxsIGhhdmUgdG8gY29weSBuYXRpdmUuYmJjbGFz
cyANCnRvIG91ciBsYXllcnMgYW5kIG1haW50YWluIGEgZm9yayBvZiBpdCwgd2hpY2ggc3Vja3Mu
Li4NCg0KVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0aGF0IG91ciB1bml0IHRlc3QgZnJhbWV3b3Jr
IGlzIGJhc2VkIG9uIGJ1aWxkaW5nIA0KYWxsIG91ciBvd24gcGFja2FnZXMgYXMgbmF0aXZlLCBi
dXQgc3RpbGwgY29uZmlndXJlZCB2aWEsIGFtb25nc3Qgb3RoZXJzLCANCk1BQ0hJTkVfRkVBVFVS
RVMgYXMgaWYgYnVpbGRpbmcgZm9yIHRoZSByZWFsIHRhcmdldC4gVGhpcyB3aWxsIG9mIGNvdXJz
ZSANCm5vdCB3b3JrIGFueW1vcmUgaWYgTUFDSElORV9GRUFUVVJFUyBpcyBzZXQgdG8gIiIgd2l0
aCBubyB3YXkgb2YgDQpvdmVycmlkaW5nIGl0Lg0KDQovL1BldGVyDQoNCg==

