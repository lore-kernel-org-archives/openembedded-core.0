Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D190A7665F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 02:38:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBE2cc78030325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 13 Dec 2016 18:38:38 -0800
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.46]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 13 Dec 2016 18:38:38 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc: add -fno-builtin-strlen when not
	using -O2
Thread-Index: AQHSVEJCz/J8Jdq2uUSIIiOk30MEh6ED7VTQgACrxYCAALvZkIAAy+WAgACcmaA=
Date: Wed, 14 Dec 2016 02:38:37 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013DE4B67D@ALA-MBA.corp.ad.wrs.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
In-Reply-To: <CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.151]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Wed, 14 Dec 2016 02:38:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmUgTWNDdXJkeSBb
bWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEz
LCAyMDE2IDU6MTcgUE0NCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gQ2M6IEtoZW0gUmFq
OyBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZ2xpYmM6IGFkZCAtZm5vLWJ1aWx0aW4tc3RybGVu
IHdoZW4gbm90IHVzaW5nIC1PMg0KPiANCj4gT24gTW9uLCBEZWMgMTIsIDIwMTYgYXQgOToxNCBQ
TSwgSHVhbmcsIEppZSAoSmFja2llKQ0KPiA8SmFja2llLkh1YW5nQHdpbmRyaXZlci5jb20+IHdy
b3RlOg0KPiA+PiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWlsdG86YXJtY2N1cmR5QGdtYWlsLmNv
bV0NCj4gPj4gRm9yIHJlZmVyZW5jZSwgaGVyZSdzIHRoZSBwYXRjaCBJJ3ZlIGJlZW4gdXNpbmcu
IEl0J3MgYSBzbGlnaHRseSBtb3JlDQo+ID4+IGdlbmVyaWMgZml4IHRoYW4gdGhlIG9uZSBpbiB0
aGUgS0RFIGJ1ZyByZXBvcnQuDQo+ID4NCj4gPiBUaGFua3MsIEl0J3MgYSBiZXR0ZXIgcGF0Y2gg
YW5kIEkgd2lsbCB0YWtlIGl0IGFuZCBzZW5kIGFzIHYyIG9mIHRoaXMgaXNzdWUgaWYgeW91J3Jl
DQo+ID4gbm90IGdvaW5nIHRvIHNlbmQgaXQgeW91cnNlbGYsIGlzIGl0IGZpbmUgZm9yIHlvdSBh
bmQgY291bGQgeW91IHByb3ZpZGUgZXh0cmEgaW5mbw0KPiA+IGZvciB0aGUgcGF0Y2ggaGVhZGVy
IGxpa2UsIHVwc3RyZWFtLXN0YXR1cywgd3JpdHRlbiBieSBvciBTaWduZWQtb2ZmLWJ5Pw0KPiAN
Cj4gU3VyZS4gSSBmb3JnZXQgd2h5IEkgZGlkbid0IHN1Ym1pdCB0aGlzIGF0IHRoZSB0aW1lLiBU
aGUgZnVsbCBwYXRjaCBpczoNCg0KVGhhbmtzLCBJIHJlYmFzZWQgdGhlIHBhdGNoIHNpbmNlIHZh
bGdyaW5kIHVwZGF0ZWQgIGFuZCBzZW50IHYyIGZvciB0aGlzIGlzc3VlOg0KDQpbT0UtY29yZV0g
W3YyXVtQQVRDSF0gdmFsZ3JpbmQ6IG1ha2UgbGQtWFhYLnNvIHN0cmxlbiBpbnRlcmNlcHQgb3B0
aW9uYWwNCg0KVGhhbmtzLA0KSmFja2llDQoNCg0KPiANCj4gRnJvbSBkMzRlMmE1MGNhNTQ5M2Y1
YTBjZTljY2FkODNhMzZhYzMzNjg5MjY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiBGcm9t
OiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPg0KPiBEYXRlOiBGcmksIDEyIEZl
YiAyMDE2IDE4OjIyOjEyIC0wODAwDQo+IFN1YmplY3Q6IFtQQVRDSF0gbWFrZSBsZC1YWFguc28g
c3RybGVuIGludGVyY2VwdCBvcHRpb25hbA0KPiANCj4gSGFjazogRGVwZW5kaW5nIG9uIGhvdyBn
bGliYyB3YXMgY29tcGlsZWQgKGUuZy4gb3B0aW1pc2VkIGZvciBzaXplIG9yDQo+IGJ1aWx0IHdp
dGggX0ZPUlRJRllfU09VUkNFIGVuYWJsZWQpIHRoZSBzdHJsZW4gc3ltYm9sIG1pZ2h0IG5vdCBi
ZQ0KPiBmb3VuZCBpbiBsZC1YWFguc28uIFRoZXJlZm9yZSBhbHRob3VnaCB3ZSBzaG91bGQgc3Rp
bGwgdHJ5IHRvDQo+IGludGVyY2VwdCBpdCwgZG9uJ3QgbWFrZSBpdCBtYW5kYXRvcnkgdG8gZG8g
c28uDQo+IA0KPiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgY29y
ZWdyaW5kL21fcmVkaXIuYyB8IDEzICsrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvY29yZWdy
aW5kL21fcmVkaXIuYyBiL2NvcmVncmluZC9tX3JlZGlyLmMNCj4gaW5kZXggN2U0ZGY4ZC4uNjQw
YTM0NiAxMDA2NDQNCj4gLS0tIGEvY29yZWdyaW5kL21fcmVkaXIuYw0KPiArKysgYi9jb3JlZ3Jp
bmQvbV9yZWRpci5jDQo+IEBAIC0xMjIwLDcgKzEyMjAsMTggQEAgc3RhdGljIHZvaWQgYWRkX2hh
cmR3aXJlZF9zcGVjIChjb25zdCAgSENoYXIqDQo+IHNvcGF0dCwgY29uc3QgSENoYXIqIGZucGF0
dCwNCj4gICAgIHNwZWMtPmZyb21fZm5wYXR0ID0gQ09OU1RfQ0FTVChIQ2hhciAqLGZucGF0dCk7
DQo+ICAgICBzcGVjLT50b19hZGRyICAgICA9IHRvX2FkZHI7DQo+ICAgICBzcGVjLT5pc1dyYXAg
ICAgICA9IEZhbHNlOw0KPiAtICAgc3BlYy0+bWFuZGF0b3J5ICAgPSBtYW5kYXRvcnk7DQo+ICsN
Cj4gKyAgIC8qIEhhY2s6IERlcGVuZGluZyBvbiBob3cgZ2xpYmMgd2FzIGNvbXBpbGVkIChlLmcu
IG9wdGltaXNlZCBmb3Igc2l6ZSBvcg0KPiArICAgICAgYnVpbHQgd2l0aCBfRk9SVElGWV9TT1VS
Q0UgZW5hYmxlZCkgdGhlIHN0cmxlbiBzeW1ib2wgbWlnaHQgbm90IGJlIGZvdW5kLg0KPiArICAg
ICAgVGhlcmVmb3JlIGFsdGhvdWdoIHdlIHNob3VsZCBzdGlsbCB0cnkgdG8gaW50ZXJjZXB0IGl0
LCBkb24ndCBtYWtlIGl0DQo+ICsgICAgICBtYW5kYXRvcnkgdG8gZG8gc28uIFdlIG92ZXItcmlk
ZSAibWFuZGF0b3J5IiBoZXJlIHRvIGF2b2lkIHRoZSBuZWVkIHRvDQo+ICsgICAgICBwYXRjaCB0
aGUgbWFueSBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGNhbGxlcnMgdG8NCj4gKyAg
ICAgIGFkZF9oYXJkd2lyZWRfc3BlYygpLiAqLw0KPiArICAgaWYgKDA9PVZHXyhzdHJjbXApKCJz
dHJsZW4iLCBmbnBhdHQpKQ0KPiArICAgICAgc3BlYy0+bWFuZGF0b3J5ID0gTlVMTDsNCj4gKyAg
IGVsc2UNCj4gKyAgICAgIHNwZWMtPm1hbmRhdG9yeSA9IG1hbmRhdG9yeTsNCj4gKw0KPiAgICAg
LyogVkFSSUFCTEUgUEFSVFMgKi8NCj4gICAgIHNwZWMtPm1hcmsgICAgICAgID0gRmFsc2U7IC8q
IG5vdCBzaWduaWZpY2FudCAqLw0KPiAgICAgc3BlYy0+ZG9uZSAgICAgICAgPSBGYWxzZTsgLyog
bm90IHNpZ25pZmljYW50ICovDQo+IC0tDQo+IDEuOS4xDQo=

