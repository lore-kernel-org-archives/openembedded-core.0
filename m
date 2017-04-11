Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BADC377CE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 2A5D82E280;
	Tue, 11 Apr 2017 20:06:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Eqoi3I5b+2w4; Tue, 11 Apr 2017 20:06:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 0EBA32E16B;
	Tue, 11 Apr 2017 20:06:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C92A41A065;
	Tue, 11 Apr 2017 20:06:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC7961A063;
	Tue, 11 Apr 2017 20:06:30 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 11 Apr 2017 20:06:30 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id B09DB30CB;
	Tue, 11 Apr 2017 20:06:30 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 11 Apr 2017 20:06:30 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 11 Apr 2017 20:06:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jussi Kukkonen
	<jussi.kukkonen@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv3 1/1] native/nativesdk: Use fixed
	DISTRO_FEATURES
Thread-Index: AQHSstD04kxreEE7AEyS6n9ZZbq4iKHAS65g///73YCAACzWcA==
Date: Tue, 11 Apr 2017 18:06:30 +0000
Message-ID: <16f574d161924ec89eadf24244d6cf2d@XBOX02.axis.com>
References: <cover.1491920909.git.jussi.kukkonen@intel.com>
	<ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
	<8f6fdae166cb44babe9c975f584df839@XBOX02.axis.com>
	<1491930987.12091.32.camel@linuxfoundation.org>
In-Reply-To: <1491930987.12091.32.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv3 1/1] native/nativesdk: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 18:06:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAxMSBh
cHJpbCAyMDE3IDE5OjE2DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJz
dGVkdEBheGlzLmNvbT47IEp1c3NpIEt1a2tvbmVuDQo+IDxqdXNzaS5rdWtrb25lbkBpbnRlbC5j
b20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIdjMgMS8xXSBuYXRpdmUvbmF0aXZlc2RrOiBVc2UgZml4ZWQN
Cj4gRElTVFJPX0ZFQVRVUkVTDQo+IA0KPiBPbiBUdWUsIDIwMTctMDQtMTEgYXQgMTU6MzIgKzAw
MDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmDQo+ID4gPiBPZg0KPiA+ID4gSnVz
c2kgS3Vra29uZW4NCj4gPiA+IFNlbnQ6IGRlbiAxMSBhcHJpbCAyMDE3IDE2OjM2DQo+ID4gPiBU
bzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVj
dDogW09FLWNvcmVdIFtQQVRDSHYzIDEvMV0gbmF0aXZlL25hdGl2ZXNkazogVXNlIGZpeGVkDQo+
ID4gPiBESVNUUk9fRkVBVFVSRVMNCj4gPiA+DQo+ID4gPiBUaGVyZSBzZWVtcyB0byBiZSBsaXR0
bGUgYWR2YW50YWdlIHRvIGxldHRpbmcgZGlzdHJvIGZlYXR1cmVzDQo+ID4gPiBhZmZlY3QNCj4g
PiA+IG5hdGl2ZSBidWlsZHMuIFRoZXJlIGlzIGEgc2lnbmlmaWNhbnQgZGlzYWR2YW50YWdlOiBh
IGNoYW5nZSB0bw0KPiA+ID4gRElTVFJPX0ZFQVRVUkVTIHdpbGwgdHJpZ2dlciBhIGxvdCBvZiB1
bm5lY2Vzc2FyeSBuYXRpdmUgdGFza3MuIEluDQo+ID4gPiBhDQo+ID4gPiB0ZXN0IGxpa2UgdGhp
czoNCj4gPiA+IMKgICQgYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWwNCj4gPiA+IMKgICMgYXBw
ZW5kICIgc3lzdGVtZCIgdG8gRElTVFJPX0ZFQVRVUkVTDQo+ID4gPiDCoCAkIGJpdGJha2UgY29y
ZS1pbWFnZS1taW5pbWFsDQo+ID4gPiBUaGUgbGF0dGVyIGJ1aWxkIHRha2VzIDQ0IG1pbnV0ZXMg
KDI4JSkgb2YgY3B1LXRpbWUgbGVzcyB3aXRoIHRoaXMNCj4gPiA+IHBhdGNoIChza2lwcGluZyAx
MzUgbmF0aXZlIHRhc2tzKS4gU2FkbHkgd2FsbCBjbG9jayB0aW1lIHdhcyBub3QNCj4gPiA+IGFm
ZmVjdGVkIGFzIGdsaWJjIHJlbWFpbnMgdGhlIGJvdHRsZW5lY2suDQo+ID4gPg0KPiA+ID4gU2V0
IG5hdGl2ZSBkaXN0cm8gZmVhdHVyZXMgdG8gRElTVFJPX0ZFQVRVUkVTX05BVElWRSBhcHBlbmRl
ZCB3aXRoDQo+ID4gPiBhbiBpbnRlcnNlY3Rpb24gb2YgRElTVFJPX0ZFQVRVUkVTIGFuZA0KPiA+
ID4gRElTVFJPX0ZFQVRVUkVTX0ZJTFRFUl9OQVRJVkUuDQo+ID4gPiBDdXJyZW50IGRlZmF1bHQg
dmFsdWVzIChiYWl0YmFrZS5jb25mKSBhcmUNCj4gPiA+ICogRElTVFJPX0ZFQVRVUkVTX0ZJTFRF
Ul9OQVRJVkUgPz0gImFwaS1kb2N1bWVudGF0aW9uIiAoYXMgZ3RrLWRvYy0NCj4gPiA+IG5hdGl2
ZQ0KPiA+ID4gaGFzIG11Y2ggbGVzcyBkZXBlbmRlbmNpZXMgd2hlbiBidWlsdCB3aXRob3V0IGl0
KQ0KPiA+ID4gKiBESVNUUk9fRkVBVFVSRVNfTkFUSVZFID89ICJ4MTEiICh0byBlbmFibGUgbmF0
aXZlIFVJcyBldmVuIGlmDQo+ID4gPiB0YXJnZXQNCj4gPiA+IGRvZXMgbm90IGNvbnRhaW5lIHRo
ZW0pDQo+ID4gPg0KPiA+ID4gRG8gdGhlIHZhcmlhYmxlIHNldHRpbmcgaW4gbmF0aXZlX3ZpcnRj
bGFzc19oYW5kbGVyKCkgYmVjYXVzZQ0KPiA+ID4gb3RoZXJ3aXNlDQo+ID4gPiBpdCBjb3VsZCBz
dGlsbCBiZSBvdmVycmlkZGVuIGJ5IGFwcGVuZHMgYW5kIHRoZSBmZWF0dXJlDQo+ID4gPiBiYWNr
ZmlsbGluZy4NCj4gPiA+IFNodWZmbGUgdGhlIGVhcmx5IHJldHVybnMgc28gRElTVFJPX0ZFQVRV
UkVTIGdldHMgc2V0IGFzIGxvbmcgYXMNCj4gPiA+IHRoZSBwYWNrYWdlbmFtZSBlbmRzIHdpdGgg
Ii1uYXRpdmUiLg0KPiA+ID4NCj4gPiA+IEFkZCBzaW1pbGFyIHZhcmlhYmxlcyBmb3IgbmF0aXZl
c2RrLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5r
dWtrb25lbkBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbWV0YS9jbGFzc2VzL25hdGl2
ZS5iYmNsYXNzwqDCoMKgwqB8IDE0ICsrKysrKysrKystLS0tDQo+ID4gPiDCoG1ldGEvY2xhc3Nl
cy9uYXRpdmVzZGsuYmJjbGFzcyB8wqDCoDYgKysrKysrDQo+ID4gPiDCoG1ldGEvY29uZi9iaXRi
YWtlLmNvbmbCoMKgwqDCoMKgwqDCoMKgwqB8wqDCoDkgKysrKysrKysrDQo+ID4gPiDCoDMgZmls
ZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL25hdGl2ZS5iYmNsYXNzDQo+ID4gPiBiL21ldGEv
Y2xhc3Nlcy9uYXRpdmUuYmJjbGFzcw0KPiA+ID4gaW5kZXggMTkxOWZiYy4uYWVjMTA4NyAxMDA2
NDQNCj4gPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9uYXRpdmUuYmJjbGFzcw0KPiA+ID4gKysrIGIv
bWV0YS9jbGFzc2VzL25hdGl2ZS5iYmNsYXNzDQo+ID4gPiBAQCAtMTIxLDE0ICsxMjEsMjAgQEAg
UEFUSF9wcmVwZW5kID0gIiR7Q09SRUJBU0V9L3NjcmlwdHMvbmF0aXZlLQ0KPiA+ID4gaW50ZXJj
ZXB0OiINCj4gPiA+IMKgU1NUQVRFX1NDQU5fQ01EID89ICIke1NTVEFURV9TQ0FOX0NNRF9OQVRJ
VkV9Ig0KPiA+ID4NCj4gPiA+IMKgcHl0aG9uIG5hdGl2ZV92aXJ0Y2xhc3NfaGFuZGxlciAoKSB7
DQo+ID4gPiAtwqDCoMKgwqBjbGFzc2V4dGVuZCA9IGUuZGF0YS5nZXRWYXIoJ0JCQ0xBU1NFWFRF
TkQnKSBvciAiIg0KPiA+ID4gLcKgwqDCoMKgaWYgIm5hdGl2ZSIgbm90IGluIGNsYXNzZXh0ZW5k
Og0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqByZXR1cm4NCj4gPiA+IC0NCj4gPiA+IMKgwqDCoMKg
wqBwbiA9IGUuZGF0YS5nZXRWYXIoIlBOIikNCj4gPiA+IMKgwqDCoMKgwqBpZiBub3QgcG4uZW5k
c3dpdGgoIi1uYXRpdmUiKToNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybg0KPiA+ID4N
Cj4gPiA+ICvCoMKgwqDCoCMgU2V0IGZlYXR1cmVzIGhlcmUgdG8gcHJldmVudCBhcHBlbmRzIGFu
ZCBkaXN0cm8gZmVhdHVyZXMNCj4gPiA+IGJhY2tmaWxsDQo+ID4gPiArwqDCoMKgwqAjIGZyb20g
bW9kaWZ5aW5nIG5hdGl2ZSBkaXN0cm8gZmVhdHVyZXMNCj4gPiA+ICvCoMKgwqDCoGZlYXR1cmVz
ID0gc2V0KGQuZ2V0VmFyKCJESVNUUk9fRkVBVFVSRVNfTkFUSVZFIikuc3BsaXQoKSkNCj4gPiA+
ICvCoMKgwqDCoGZpbHRlcmVkID0gc2V0KGJiLnV0aWxzLmZpbHRlcigiRElTVFJPX0ZFQVRVUkVT
IiwNCj4gPiA+IGQuZ2V0VmFyKCJESVNUUk9fRkVBVFVSRVNfRklMVEVSX05BVElWRSIpLCBkKS5z
cGxpdCgpKQ0KPiA+ID4gK8KgwqDCoMKgZC5zZXRWYXIoIkRJU1RST19GRUFUVVJFUyIsICIgIi5q
b2luKGZlYXR1cmVzIHwgZmlsdGVyZWQpKQ0KPiA+IFlvdSBzaG91bGQgc29ydCB0aGUgbGlzdCBv
ZiBmZWF0dXJlcyB0byBtYWtlIGl0IGRldGVybWluaXN0aWMuDQo+IA0KPiBEbyB3ZSBzb3J0IERJ
U1RST19GRUFUVVJFUyBhbnl3aGVyZSBlbHNlPw0KDQpObywgYnV0IGl0IGlzIG5ldmVyIHdvcmtl
ZCB1cG9uIHZpYSBzZXQoKSBhcyB0aGVzZSBhcmUgaGVyZS4uLg0KDQo+IEkgdGhvdWdodCB3ZSBv
bmx5IGFjY2Vzc2VkIERJU1RST19GRUFUVVJFUyB3aXRoIGZ1bmN0aW9ucyB3aGljaCBoYXZlDQo+
IHN1cHBvcnQgaW4gYml0YmFrZSAoY29udGFpbnMvZmlsdGVyKSB3aGljaCBtZWFucyB0aGF0IHNo
b3VsZCBiZQ0KPiB1bm5lY2Vzc2FyeT8NCg0KV2lsbCB0aGUgbGFjayBvZiBzb3J0aW5nIG5vdCBh
ZmZlY3QgdGhlIHRhc2sgaGFzaGVzIChhbmQgYml0YmFrZSAtZSkgaWYgDQp0aGVzZSBhcmUgc2V0
IHZpYSBzZXQoKSBvcGVyYXRpb25zLCB3aGljaCBtYXkgcmVzdWx0IGluIHRoZSBvcmRlciBvZiAN
CnRoZSBmZWF0dXJlcyBsaXN0ZWQgaW4gdGhlIGZpbmFsIERJU1RST19WQVJJQUJMRSBmcm9tIHZh
cnlpbmcgYmFzZWQgb24gDQpob3cgUHl0aG9uIGhhcHBlbnMgdG8gcHVsbCB0aGUgZmVhdHVyZXMg
b3V0IG9mIHRoZSBzZXQoKT8NCg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXIN
Cg0K

