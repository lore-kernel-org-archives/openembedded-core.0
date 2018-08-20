Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F437748D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C2ED11813A;
	Mon, 20 Aug 2018 23:03:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CsJBNHlK9O-t; Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9957018133;
	Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87C031E05C;
	Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79DB31E056;
	Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 6C83F1A65;
	Mon, 20 Aug 2018 23:03:06 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 20 Aug 2018 23:03:06 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 20 Aug 2018 23:03:06 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 20 Aug 2018 23:03:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] busybox: Add a dependency on virtual/crypt
Thread-Index: AQHUODASkmR2jOuXm0irGC/oTKoAZ6TIQxuAgACnwQCAAAppgIAAKSPQ
Date: Mon, 20 Aug 2018 21:03:05 +0000
Message-ID: <49a3ae3e0305424992d5683f84b82816@XBOX02.axis.com>
References: <20180820024616.12501-1-pkj@axis.com>
	<9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
	<CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
	<CAJ86T=U_bNmw77eL-F7GJFUVe_zDzEMBpzRiHS397C1wxMwO7Q@mail.gmail.com>
In-Reply-To: <CAJ86T=U_bNmw77eL-F7GJFUVe_zDzEMBpzRiHS397C1wxMwO7Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Mon, 20 Aug 2018 21:03:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1j
Y3VyZHlAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMjAgYXVndXN0aSAyMDE4IDIyOjIzDQo+IFRv
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBDYzogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBQZXRlcg0KPiBLamVsbGVyc3RlZHQg
PHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zDQo+
IGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gYnVzeWJveDogQWRk
IGEgZGVwZW5kZW5jeSBvbg0KPiB2aXJ0dWFsL2NyeXB0DQo+IA0KPiBPbiBNb24sIEF1ZyAyMCwg
MjAxOCBhdCAxMjo0NSBQTSwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gT24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMjo0NSBBTSBSaWNoYXJkIFB1cmRpZQ0KPiA+IDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPj4NCj4gPj4gT24g
TW9uLCAyMDE4LTA4LTIwIGF0IDA0OjQ2ICswMjAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6
DQo+ID4+ID4gYnVzeWJveCBuZWVkcyBjcnlwdCgpIGlmIENPTkZJR19VU0VfQkJfQ1JZUFQgaXMg
bm90IGRlZmluZWQuDQo+ID4+ID4NCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4gPiAg
bWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94LmluYyB8IDMgKystDQo+ID4+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4gPg0KPiA+
PiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3guaW5jIGIv
bWV0YS9yZWNpcGVzLQ0KPiA+PiA+IGNvcmUvYnVzeWJveC9idXN5Ym94LmluYw0KPiA+PiA+IGlu
ZGV4IDhjNmRiYmFmOWIuLmE4YmExMGQyMWMgMTAwNjQ0DQo+ID4+ID4gLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvYnVzeWJveC9idXN5Ym94LmluYw0KPiA+PiA+ICsrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2J1c3lib3gvYnVzeWJveC5pbmMNCj4gPj4gPiBAQCAtMyw3ICszLDggQEAgREVTQ1JJUFRJ
T04gPSAiQnVzeUJveCBjb21iaW5lcyB0aW55IHZlcnNpb25zIG9mDQo+IG1hbnkNCj4gPj4gPiBj
b21tb24gVU5JWCB1dGlsaXRpZXMgaW50bw0KPiA+PiA+ICBIT01FUEFHRSA9ICJodHRwOi8vd3d3
LmJ1c3lib3gubmV0Ig0KPiA+PiA+ICBCVUdUUkFDS0VSID0gImh0dHBzOi8vYnVncy5idXN5Ym94
Lm5ldC8iDQo+ID4+ID4NCj4gPj4gPiAtREVQRU5EUyArPSAia2Vybi10b29scy1uYXRpdmUiDQo+
ID4+ID4gKyMgRGVwZW5kIG9uIHZpcnR1YWwvY3J5cHQgaW4gY2FzZSBDT05GSUdfVVNFX0JCX0NS
WVBUIGlzIG5vdA0KPiBkZWZpbmVkDQo+ID4+ID4gK0RFUEVORFMgKz0gImtlcm4tdG9vbHMtbmF0
aXZlIHZpcnR1YWwvY3J5cHQiDQo+ID4+DQo+ID4+IEknbSBub3QgYSBidWcgZmFuIG9mIGFkZGlu
ZyBkZXBlbmRlbmNpZXMgd2hpY2ggbWlnaHQgbm90IGJlIG5lZWRlZC4NCj4gSG93DQo+ID4+IGNv
bW1vbiBpcyBDT05GSUdfVVNFX0JCX0NSWVBUIG5vdCBiZWluZyBkZWZpbmVkPyBJIGFzc3VtZSB0
aGF0IGlzbid0DQo+ID4+IG91ciBkZWZhdWx0IGNvbmZpZz8NCj4gPg0KPiA+IHllcyBwZXJoYXBz
IGl0IHNob3VsZCBiZSBwYWNrYWdlY29uZmlnDQo+IA0KPiBCdXN5Ym94IGRvZXNuJ3QgdXNlIFBB
Q0tBR0VDT05GSUcuIENvbmRpdGlvbmFsIGNvbmZpZ3VyYXRpb24gaXMNCj4gaGFuZGxlZCBieSBh
ZGRpbmcgLyByZW1vdmluZyBjZmcgZnJhZ21lbnRzIGFuZCB0ZXN0aW5nIHdoZXRoZXIgU1JDX1VS
SQ0KPiBjb250YWlucyAiZm9vLmNmZyIgKGFuZCBhbHNvIHBhcnNpbmcgdGhlIGZpbmFsIC5jb25m
aWcgd2l0aGluIHRhc2tzDQo+IHN1Y2ggYXMgZG9faW5zdGFsbCkuIFVuZm9ydHVuYXRlbHkgdGhh
dCBhcHByb2FjaCBkb2Vzbid0IHdvcmsgc28gd2VsbA0KPiBmb3IgY29uZGl0aW9uYWwgYnVpbGQg
ZGVwZW5kZW5jaWVzLi4uDQo+IA0KPiBPdXIgQnVzeWJveCBkZWZjb25maWcgZG9lcyBlbmFibGUg
Q09ORklHX1VTRV9CQl9DUllQVCAoYW5kIHRoZXJlJ3Mgbm8NCj4gY2ZnIGZyYWdtZW50IHRvIGRp
c2FibGUgaXQpIHNvIHRoZSB2aXJ0dWFsL2NyeXB0IGRlcGVuZGVuY3kgaXNuJ3QNCj4gbmVlZGVk
IGluIG91ciBkZWZhdWx0IGJ1aWxkcy4NCg0KSW4gb3VyIGNhc2Ugd2UgaGF2ZSBvdXIgb3duIGRl
ZmNvbmZpZy4gSSBhbSBub3QgcmVzcG9uc2libGUgZm9yIGl0LCBpdCBpcyANCm1haW50YWluZWQg
Ynkgb3VyIGJ1c3lib3ggbWFpbnRhaW5lciwgYW5kIGhlIGhhcyBhcHBhcmVudGx5IGRlY2lkZWQg
dGhhdCANCndlIGRvbid0IHdhbnQgQ09ORklHX1VTRV9CQl9DUllQVCBlbmFibGVkLiANCg0KSSBj
YW4gb2YgY291cnNlIGFkZCB0aGUgZGVwZW5kZW5jeSB2aWEgYSBiYmFwcGVuZCwgYnV0IGhhdmlu
ZyB0byBkbyB0aGF0IA0Kc2VlbXMgd3JvbmcgZ2l2ZW4gaG93IHRoZSByZXN0IG9mIGJ1c3lib3gg
aXMgY29uZmlndXJlZCAod2l0aCBkZWZjb25maWcgDQphbmQgY2ZnIGZyYWdtZW50cykgYW5kIHdo
ZXJlIGVuYWJsaW5nIHNvbWUgb3B0aW9ucyB0aGF0IGRvbid0IGhhcHBlbiB0byANCmJlIGVuYWJs
ZWQgaW4gdGhlIE9FLUNvcmUgZGVmYXVsdCBjb25maWd1cmF0aW9uIHdpbGwgdGhlbiBicmVhayB0
aGUgYnVpbGQuDQoNCj4gRGlzYWJsaW5nIGJ1c3lib3gncyBpbnRlcm5hbCBjcnlwdCBmdW5jdGlv
bnMgZG9lc24ndCBzZWVtIGxpa2UgYSB2ZXJ5DQo+IGNvbW1vbiB0aGluZyB0byB3YW50IHRvIGRv
Lg0KPiANCj4gY29uZmlnIFVTRV9CQl9DUllQVA0KPiAgICAgYm9vbCAiVXNlIGludGVybmFsIGNy
eXB0IGZ1bmN0aW9ucyINCj4gICAgIGRlZmF1bHQgeQ0KPiAgICAgaGVscA0KPiAgICAgICBCdXN5
Ym94IGhhcyBpbnRlcm5hbCBERVMgYW5kIE1ENSBjcnlwdCBmdW5jdGlvbnMuDQo+ICAgICAgIFRo
ZXkgcHJvZHVjZSByZXN1bHRzIHdoaWNoIGFyZSBpZGVudGljYWwgdG8gY29ycmVzcG9uZGluZw0K
PiAgICAgICBzdGFuZGFyZCBDIGxpYnJhcnkgZnVuY3Rpb25zLg0KPiANCj4gICAgICAgSWYgeW91
IGxlYXZlIHRoaXMgZGlzYWJsZWQsIGJ1c3lib3ggd2lsbCB1c2UgdGhlIHN5c3RlbSdzDQo+ICAg
ICAgIGNyeXB0IGZ1bmN0aW9ucy4gTW9zdCBDIGxpYnJhcmllcyB1c2UgbGFyZ2UgKH43MGspDQo+
ICAgICAgIHN0YXRpYyBidWZmZXJzIHRoZXJlLCBhbmQgYWxzbyBjb21iaW5lIHRoZW0gd2l0aCBt
b3JlIGdlbmVyYWwNCj4gICAgICAgREVTIGVuY3J5cHRpb24vZGVjcnlwdGlvbi4NCj4gDQo+ICAg
ICAgIEZvciBidXN5Ym94LCBoYXZpbmcgbGFyZ2Ugc3RhdGljIGJ1ZmZlcnMgaXMgdW5kZXNpcmFi
bGUsDQo+ICAgICAgIGVzcGVjaWFsbHkgb24gTk9NTVUgbWFjaGluZXMuIEJ1c3lib3ggYWxzbyBk
b2Vzbid0IG5lZWQNCj4gICAgICAgREVTIGVuY3J5cHRpb24vZGVjcnlwdGlvbiBhbmQgY2FuIGRv
IHdpdGggc21hbGxlciBjb2RlLg0KPiANCj4gICAgICAgSWYgeW91IGVuYWJsZSB0aGlzIG9wdGlv
biwgaXQgd2lsbCBhZGQgYWJvdXQgNC44ayBvZiBjb2RlDQo+ICAgICAgIGlmIHlvdSBhcmUgYnVp
bGRpbmcgZHluYW1pY2FsbHkgbGlua2VkIGV4ZWN1dGFibGUuDQo+ICAgICAgIEluIHN0YXRpYyBi
dWlsZCwgaXQgbWFrZXMgY29kZSBfc21hbGxlcl8gYnkgYWJvdXQgMS4yaywNCj4gICAgICAgYW5k
IGxpa2VseSBtYW55IGtpbG9ieXRlcyBsZXNzIG9mIGJzcy4NCg0KLy9QZXRlcg0KDQo=

