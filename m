Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 735AB77E33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id E46522E0D4;
	Thu, 31 Aug 2017 15:58:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id J0n1AqTN23h0; Thu, 31 Aug 2017 15:58:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 086D52E118;
	Thu, 31 Aug 2017 15:58:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBB921A06B;
	Thu, 31 Aug 2017 15:58:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0BDD1A063;
	Thu, 31 Aug 2017 15:58:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 31 Aug 2017 15:58:28 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id D4F365D7;
	Thu, 31 Aug 2017 15:58:28 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 31 Aug 2017 15:58:29 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 31 Aug 2017 15:58:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Armin Kuster
	<akuster808@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [pyro][PATCH 19/25] texinfo: Avoid a problem with a
	dependency on perl(Locale::gettext_xs)
Thread-Index: AQHTIdgSuwE1fk3lLkeMO0MYhPMqjaKeVAMg
Date: Thu, 31 Aug 2017 13:58:28 +0000
Message-ID: <2088ae078cf041f2a22dce5299f5b54f@XBOX02.axis.com>
References: <cover.1504041416.git.pkj@axis.com>
	<34d28d52f32fd1866e3570fcd07f6d1a73be1774.1504041417.git.pkj@axis.com>
	<1504128997.2175.38.camel@linuxfoundation.org>
In-Reply-To: <1504128997.2175.38.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [pyro][PATCH 19/25] texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
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
X-List-Received-Date: Thu, 31 Aug 2017 13:58:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAzMCBh
dWd1c3RpIDIwMTcgMjM6MzcNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPjsgQXJtaW4gS3VzdGVyDQo+IDxha3VzdGVyODA4QGdtYWlsLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbcHlyb11bUEFUQ0ggMTkvMjVdIHRleGluZm86IEF2b2lkIGEgcHJvYmxlbQ0K
PiB3aXRoIGEgZGVwZW5kZW5jeSBvbiBwZXJsKExvY2FsZTo6Z2V0dGV4dF94cykNCj4gDQo+IE9u
IFR1ZSwgMjAxNy0wOC0yOSBhdCAyMzoyMSArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3Rl
Og0KPiA+IFdlIGRvIG5vdCBidWlsZCB0aGUgTG9jYWxlOjpnZXR0ZXh0X3hzIFBlcmwgbW9kdWxl
IGFuZCB0aGUgY29kZSB3aWxsDQo+ID4gdGVzdCBmb3IgaXQgYW5kIGhhcHBpbHkgdXNlIExvY2Fs
ZTo6Z2V0dGV4dF9wcCBpbnN0ZWFkIGlmIGl0IGlzIG5vdA0KPiA+IGZvdW5kLiBIb3dldmVyLCB0
aGlzIHN0aWxsIGNhdXNlcyBhIGZpbGUgZGVwZW5kZW5jeSBvbg0KPiA+IHBlcmwoTG9jYWxlOjpn
ZXR0ZXh0X3hzKSB0byBiZSBnZW5lcmF0ZWQsIHdoaWNoIG11c3QgYmUgc2F0aXNmaWVkIGJ5DQo+
ID4gYWRkaW5nIGFuIGV4cGxpY2l0IHByb3ZpZGUgZm9yIGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogTWFyayBIYXRsZSA8bWFyay5oYXRsZUB3aW5kcml2ZXIuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGlu
Zm8vdGV4aW5mb182LjMuYmIgfCA2ICsrKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90
ZXhpbmZvL3RleGluZm9fNi4zLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5m
by90ZXhpbmZvXzYuMy5iYg0KPiA+IGluZGV4IGQ4MjczMWUxMWUuLmY1OGRmOTI4YWEgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb182LjMuYmIN
Cj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZvXzYuMy5iYg0K
PiA+IEBAIC03OSw0ICs3OSwxMCBAQCBGSUxFU18ke1BOfS1kb2MgPSAiJHtpbmZvZGlyfS90ZXhp
bmZvKiBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCR7ZGF0
YWRpcn0vJHt0ZXhfdGV4aW5mb30gXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAke21hbmRpcn0vbWFuMSAke21hbmRpcn0vbWFuNSINCj4gPg0KPiA+ICsjIExp
ZSBhYm91dCBwcm92aWRpbmcgdGhlIExvY2FsZTo6Z2V0dGV4dF94cyBtb2R1bGUuIEl0IGlzIG5v
dA0KPiA+IGFjdHVhbGx5IGJ1aWx0LA0KPiA+ICsjIGJ1dCB0aGUgY29kZSB3aWxsIHRlc3QgZm9y
IGl0IGFuZCBpZiBub3QgZm91bmQgdXNlDQo+ID4gTG9jYWxlOjpnZXR0ZXh0X3BwIGluc3RlYWQu
DQo+ID4gKyMgSG93ZXZlciwgdGhpcyBjYXVzZXMgYSBmaWxlIGRlcGVuZGVuY3kgb24gcGVybChM
b2NhbGU6OmdldHRleHRfeHMpDQo+ID4gdG8gYmUNCj4gPiArIyBnZW5lcmF0ZWQsIHdoaWNoIG11
c3QgYmUgc2F0aXNmaWVkLg0KPiA+ICtSUFJPVklERVNfJHtQTn0gKz0gInBlcmwoTG9jYWxlOjpn
ZXR0ZXh0X3hzKSINCj4gPiArDQo+ID4gwqBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVz
ZGsiDQo+IA0KPiBCcmVha3MgaW4gZG9fcGFja2FnZV93cml0ZV9kZWI6DQo+IA0KPiBlLmcuDQo+
IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy9tYWluL2J1aWxkZXJzL25pZ2h0
bHktDQo+IGFybTY0L2J1aWxkcy84MjcNCj4gDQo+IGJ1dCBhbHNvIG1hbnkgb3RoZXIgYnVpbGRz
LiBQb3NzaWJseSBtaXNzaW5nIHNvbWUgb3RoZXIgYmFja3BvcnQ/DQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiBSaWNoYXJkDQoNCk9rLCB0aGUgcHJvYmxlbSB3YXMgZWFzaWx5IHJlcHJvZHVjaWJsZSBi
eSBidWlsZGluZyBuYXRpdmVzZGstdGV4aW5mbyANCndpdGggcGFja2FnZV9kZWIgaW4gUEFDS0FH
RV9DTEFTU0VTLiBXaGF0IHRoYXQgcmVzdWx0IGluLCBpcyBhbiBlcnJvciANCmxpa2UgdGhpczoN
Cg0KZHBrZy1kZWI6IGVycm9yOiBwYXJzaW5nIGZpbGUgJ3RtcC93b3JrL3g4Nl82NC1uYXRpdmVz
ZGstcG9reXNkay1saW51eC9uYXRpdmVzZGstdGV4aW5mby82LjMtcjAvcGFja2FnZXMtc3BsaXQv
bmF0aXZlc2RrLXRleGluZm8vREVCSUFOL2NvbnRyb2wnIG5lYXIgbGluZSAxNSBwYWNrYWdlICdu
YXRpdmVzZGstdGV4aW5mbyc6DQogJ1Byb3ZpZGVzJyBmaWVsZCwgcmVmZXJlbmNlIHRvICduYXRp
dmVzZGstcGVybF9fTG9jYWxlJzogaW52YWxpZCBhcmNoaXRlY3R1cmUgbmFtZSAnOmdldHRleHRf
eHNfXyc6IG11c3Qgc3RhcnQgd2l0aCBhbiBhbHBoYW51bWVyaWMNCg0KV2hpY2ggaXMgZHVlIHRv
IHRoZSBmb2xsb3dpbmcgbGluZSBpbiB0aGUgRGViaWFuIGNvbnRyb2wgZmlsZToNCg0KUHJvdmlk
ZXM6IG5hdGl2ZXNkay1wZXJsX19Mb2NhbGU6OmdldHRleHRfeHNfXw0KDQpBbmQgaXQgaXMgY2xl
YXIgdGhhdCBkcGtnIGRvZXMgbm90IGxpa2UgdGhlIHR3byBjb2xvbnMgb24gdGhhdCBsaW5lLiAN
Ckhvd2V2ZXIsIHRoYXQgZ290IG1lIHRoaW5raW5nLiBXaHkgaXMgdGhpcyBub3QgYSBwcm9ibGVt
IHdoZW4gYnVpbGRpbmcgDQp3aXRoIG1hc3RlciBvZiBQb2t5PyBTbyBJIHdlbnQgYW5kIGJ1aWx0
IHRoZSBzYW1lIHdpdGggbWFzdGVyIGFuZCANCmxvb2tlZCBhdCBsb2cuZG9fcGFja2FnZV93cml0
ZV9kZXAgZm9yIG5hdGl2ZXNkbC10ZXhpbmZvLCBhbmQgYXMgSSANCnN1c3BlY3RlZCB0aGUgZXJy
b3Igd2FzIHRoZXJlIGFzIHdlbGwuIEhvd2V2ZXIsIHRoZSBlcnJvciB3YXMgaWdub3JlZCANCndo
aWNoIGxlZCB0byB0aGUgYnVpbGQgc3VjY2VlZGluZywgYnV0IHdpdGhvdXQgYWN0dWFsbHkgcHJv
ZHVjaW5nIHRoZSANCnRleGluZm8gZGViIHBhY2thZ2UhDQoNCkFmdGVyIHNvbWUgdGVzdGluZyBp
dCB0dXJuZWQgb3V0IHRoYXQgY29tbWl0IGRkNTQwZmJhICJwYWNrYWdlX2RlYjogDQpFbmFibGUg
bXVsdGl0aHJlYWRlZCBwYWNrYWdlIGNyZWF0aW9uIiBpcyB0aGUgY3VscHJpdC4gSWYgSSByZXZl
cnQgDQp0aGF0LCBidWlsZGluZyBuYXRpdmVzZGstdGV4aW5mbyB3aWxsIHN0YXJ0IHRvIGZhaWwg
Zm9yIG1hc3RlciBpZiANCkRlYmlhbiBwYWNrYWdpbmcgaXMgZW5hYmxlZC4NCg0KR2l2ZW4gdGhh
dCBNYXJrIGRpc2FibGVkIFBlcmwgZGVwZW5kZW5jaWVzIGZyb20gYmVpbmcgZ2VuZXJhdGVkLCBJ
IA0KdGhpbmsgdGhlIGVhc2llc3Qgc29sdXRpb24gaXMgdG8ganVzdCBkcm9wIHRoaXMgcGF0Y2gg
ZnJvbSBQeXJvLCBhbmQgDQpyZXZlcnQgdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2ggZnJvbSBtYXN0
ZXIuIA0KDQpJIHdpbGwgbGVhdmUgZml4aW5nIHRoZSBtdWx0aXRocmVhZGVkIHBhY2thZ2UgY3Jl
YXRpb24gc3VwcG9ydCBpbiANCnBhY2thZ2VfZGViLmJiY2xhc3MgdG8geW91IGJlY2F1c2UgSSBo
YXZlIG5vIGlkZWEgYWJvdXQgdGhhdC4uLg0KDQovL1BldGVyDQoNCg==

