Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6672A60767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:41:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC7fDtx011371
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Dec 2016 23:41:13 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.46]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Sun, 11 Dec 2016 23:41:12 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc: add -fno-builtin-strlen when not
	using -O2
Thread-Index: AQHSVEJCz/J8Jdq2uUSIIiOk30MEh6ED7VTQ
Date: Mon, 12 Dec 2016 07:41:12 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
In-Reply-To: <CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.151]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 12 Dec 2016 07:41:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTIsIDIwMTYg
MjozNyBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogUGF0Y2hlcyBhbmQgZGlz
Y3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0hdIGdsaWJjOiBhZGQgLWZuby1idWlsdGluLXN0cmxlbiB3aGVuIG5vdCB1c2luZyAt
TzINCj4gDQo+IE9uIFN1biwgRGVjIDExLCAyMDE2IGF0IDk6NDIgUE0sICA8amFja2llLmh1YW5n
QHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+IEZyb206IEphY2tpZSBIdWFuZyA8amFja2llLmh1
YW5nQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiBUaGUgc3RybGVuIHdpbGwgYmUgaW5saW5lZCB3
aGVuIGNvbXBpbGUgd2l0aCAtTywgLU8xIG9yIC1PcywNCj4gPiBzbyB0aGVyZSBpcyBubyBzeW1i
b2wgZm9yIHN0cmxlbiBpbiBsZC1saW51eC14ODYtNjQuc28uMiwNCj4gPiBjYXVzaW5nIGEgZmF0
YWwgZXJyb3IgaW4gdmFsZ3JpbmQ6DQo+ID4NCj4gPiB2YWxncmluZDogRmF0YWwgZXJyb3IgYXQg
c3RhcnR1cDogYSBmdW5jdGlvbiByZWRpcmVjdGlvbg0KPiA+IHZhbGdyaW5kOiB3aGljaCBpcyBt
YW5kYXRvcnkgZm9yIHRoaXMgcGxhdGZvcm0tdG9vbCBjb21iaW5hdGlvbg0KPiA+IHZhbGdyaW5k
OiBjYW5ub3QgYmUgc2V0IHVwLiBEZXRhaWxzIG9mIHRoZSByZWRpcmVjdGlvbiBhcmU6DQo+ID4g
dmFsZ3JpbmQ6DQo+ID4gdmFsZ3JpbmQ6IEEgbXVzdC1iZS1yZWRpcmVjdGVkIGZ1bmN0aW9uDQo+
ID4gdmFsZ3JpbmQ6IHdob3NlIG5hbWUgbWF0Y2hlcyB0aGUgcGF0dGVybjogc3RybGVuDQo+ID4g
dmFsZ3JpbmQ6IGluIGFuIG9iamVjdCB3aXRoIHNvbmFtZSBtYXRjaGluZzogbGQtbGludXgteDg2
LTY0LnNvLjINCj4gPg0KPiA+IHNvIGFkZCAtZm5vLWJ1aWx0aW4tc3RybGVuIHdoZW4gY29tcGls
ZSB3aXRoIC1PLCAtTzEgb3IgLU9zLg0KPiANCj4gVGhpcyBpcyBhIGJ1ZyBpbiB2YWxncmluZCwg
SSByZWFkIHRoZSBzYW1lIG9uIGZvcnVtcy4gS0RFIGhhcyBwcm9wb3NlZCBhIGZpeA0KPiBodHRw
czovL2J1Z3NmaWxlcy5rZGUub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTgyMDQzDQo+IGNhbiB5b3Ug
Y2hlY2sgaWYgdGhpcyBmaXhlcyB0aGUgaXNzdWUNCg0KVGhhbmtzLCBJIHdpbGwgY2hlY2sgdGhh
dCBhbmQgY2hhbmdlIHRvIHBhdGNoIGZvciB2YWxncmluZCBpZiBpdCB3b3Jrcy4NCg0KVGhhbmtz
LA0KSmFja2llDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVhbmcgPGph
Y2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtY29y
ZS9nbGliYy9nbGliYy5pbmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliYy9nbGliYy5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy5p
bmMNCj4gPiBpbmRleCBlODVjNzA0Li43ZjNlMGY2IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWJjL2dsaWJjLmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWJjL2dsaWJjLmluYw0KPiA+IEBAIC0xNiw4ICsxNiw4IEBAIHB5dGhvbiAoKSB7DQo+ID4gICAg
ICBpZiBvcHRfZWZmZWN0aXZlID09ICItTzAiOg0KPiA+ICAgICAgICAgIGJiLmZhdGFsKCIlcyBj
YW4ndCBiZSBidWlsdCB3aXRoICVzLCB0cnkgLU8xIGluc3RlYWQiICUgKGQuZ2V0VmFyKCdQTics
IFRydWUpLCBvcHRfZWZmZWN0aXZlKSkNCj4gPiAgICAgIGlmIG9wdF9lZmZlY3RpdmUgaW4gKCIt
TyIsICItTzEiLCAiLU9zIik6DQo+ID4gLSAgICAgICAgYmIubm90ZSgiJXMgZG9lc24ndCBidWls
ZCBjbGVhbmx5IHdpdGggJXMsIGFkZGluZyAtV25vLWVycm9yIHRvIFNFTEVDVEVEX09QVElNSVpB
VElPTiIgJQ0KPiAoZC5nZXRWYXIoJ1BOJywgVHJ1ZSksIG9wdF9lZmZlY3RpdmUpKQ0KPiA+IC0g
ICAgICAgIGQuYXBwZW5kVmFyKCJTRUxFQ1RFRF9PUFRJTUlaQVRJT04iLCAiIC1Xbm8tZXJyb3Ii
KQ0KPiA+ICsgICAgICAgIGJiLm5vdGUoIiVzIGRvZXNuJ3QgYnVpbGQgY2xlYW5seSB3aXRoICVz
LCBhZGRpbmcgLVduby1lcnJvciBhbmQgLWZuby1idWlsdGluLXN0cmxlbiB0bw0KPiBTRUxFQ1RF
RF9PUFRJTUlaQVRJT04iICUgKGQuZ2V0VmFyKCdQTicsIFRydWUpLCBvcHRfZWZmZWN0aXZlKSkN
Cj4gPiArICAgICAgICBkLmFwcGVuZFZhcigiU0VMRUNURURfT1BUSU1JWkFUSU9OIiwgIiAtV25v
LWVycm9yIC1mbm8tYnVpbHRpbi1zdHJsZW4iKQ0KPiA+ICB9DQo+ID4NCj4gPiAgIyBzaXRlY29u
ZmlnLmJiY2xhc3MgcnVucyBjb25maWd1cmUgd2hpY2ggbmVlZHMgYSB3b3JraW5nIGNvbXBpbGVy
DQo+ID4gLS0NCj4gPiAyLjguMw0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxp
bmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJl
ZGRlZC1jb3JlDQo=

