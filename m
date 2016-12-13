Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A95971A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 05:14:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD5ENUT016991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Dec 2016 21:14:24 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.46]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 12 Dec 2016 21:14:23 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc: add -fno-builtin-strlen when not
	using -O2
Thread-Index: AQHSVEJCz/J8Jdq2uUSIIiOk30MEh6ED7VTQgACrxYCAALvZkA==
Date: Tue, 13 Dec 2016 05:14:22 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
In-Reply-To: <CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 05:14:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmUgTWNDdXJkeSBb
bWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTIs
IDIwMTYgNTo1NSBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogS2hlbSBSYWo7
IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbGliYzogYWRkIC1mbm8tYnVpbHRpbi1zdHJsZW4g
d2hlbiBub3QgdXNpbmcgLU8yDQo+IA0KPiBPbiBTdW4sIERlYyAxMSwgMjAxNiBhdCAxMTo0MSBQ
TSwgSHVhbmcsIEppZSAoSmFja2llKQ0KPiA8SmFja2llLkh1YW5nQHdpbmRyaXZlci5jb20+IHdy
b3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLaGVtIFJh
aiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0NCj4gPj4gU2VudDogTW9uZGF5LCBEZWNlbWJl
ciAxMiwgMjAxNiAyOjM3IFBNDQo+ID4+IFRvOiBIdWFuZywgSmllIChKYWNraWUpDQo+ID4+IENj
OiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiA+PiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZ2xpYmM6IGFkZCAtZm5vLWJ1aWx0aW4tc3Ry
bGVuIHdoZW4gbm90IHVzaW5nIC1PMg0KPiA+Pg0KPiA+PiBPbiBTdW4sIERlYyAxMSwgMjAxNiBh
dCA5OjQyIFBNLCAgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPj4gPiBG
cm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+PiA+DQo+
ID4+ID4gVGhlIHN0cmxlbiB3aWxsIGJlIGlubGluZWQgd2hlbiBjb21waWxlIHdpdGggLU8sIC1P
MSBvciAtT3MsDQo+ID4+ID4gc28gdGhlcmUgaXMgbm8gc3ltYm9sIGZvciBzdHJsZW4gaW4gbGQt
bGludXgteDg2LTY0LnNvLjIsDQo+ID4+ID4gY2F1c2luZyBhIGZhdGFsIGVycm9yIGluIHZhbGdy
aW5kOg0KPiA+PiA+DQo+ID4+ID4gdmFsZ3JpbmQ6IEZhdGFsIGVycm9yIGF0IHN0YXJ0dXA6IGEg
ZnVuY3Rpb24gcmVkaXJlY3Rpb24NCj4gPj4gPiB2YWxncmluZDogd2hpY2ggaXMgbWFuZGF0b3J5
IGZvciB0aGlzIHBsYXRmb3JtLXRvb2wgY29tYmluYXRpb24NCj4gPj4gPiB2YWxncmluZDogY2Fu
bm90IGJlIHNldCB1cC4gRGV0YWlscyBvZiB0aGUgcmVkaXJlY3Rpb24gYXJlOg0KPiA+PiA+IHZh
bGdyaW5kOg0KPiA+PiA+IHZhbGdyaW5kOiBBIG11c3QtYmUtcmVkaXJlY3RlZCBmdW5jdGlvbg0K
PiA+PiA+IHZhbGdyaW5kOiB3aG9zZSBuYW1lIG1hdGNoZXMgdGhlIHBhdHRlcm46IHN0cmxlbg0K
PiA+PiA+IHZhbGdyaW5kOiBpbiBhbiBvYmplY3Qgd2l0aCBzb25hbWUgbWF0Y2hpbmc6IGxkLWxp
bnV4LXg4Ni02NC5zby4yDQo+ID4+ID4NCj4gPj4gPiBzbyBhZGQgLWZuby1idWlsdGluLXN0cmxl
biB3aGVuIGNvbXBpbGUgd2l0aCAtTywgLU8xIG9yIC1Pcy4NCj4gPj4NCj4gPj4gVGhpcyBpcyBh
IGJ1ZyBpbiB2YWxncmluZCwgSSByZWFkIHRoZSBzYW1lIG9uIGZvcnVtcy4gS0RFIGhhcyBwcm9w
b3NlZCBhIGZpeA0KPiA+PiBodHRwczovL2J1Z3NmaWxlcy5rZGUub3JnL2F0dGFjaG1lbnQuY2dp
P2lkPTgyMDQzDQo+ID4+IGNhbiB5b3UgY2hlY2sgaWYgdGhpcyBmaXhlcyB0aGUgaXNzdWUNCj4g
Pg0KPiA+IFRoYW5rcywgSSB3aWxsIGNoZWNrIHRoYXQgYW5kIGNoYW5nZSB0byBwYXRjaCBmb3Ig
dmFsZ3JpbmQgaWYgaXQgd29ya3MuDQo+IA0KPiBGb3IgcmVmZXJlbmNlLCBoZXJlJ3MgdGhlIHBh
dGNoIEkndmUgYmVlbiB1c2luZy4gSXQncyBhIHNsaWdodGx5IG1vcmUNCj4gZ2VuZXJpYyBmaXgg
dGhhbiB0aGUgb25lIGluIHRoZSBLREUgYnVnIHJlcG9ydC4NCg0KVGhhbmtzLCBJdCdzIGEgYmV0
dGVyIHBhdGNoIGFuZCBJIHdpbGwgdGFrZSBpdCBhbmQgc2VuZCBhcyB2MiBvZiB0aGlzIGlzc3Vl
IGlmIHlvdSdyZQ0Kbm90IGdvaW5nIHRvIHNlbmQgaXQgeW91cnNlbGYsIGlzIGl0IGZpbmUgZm9y
IHlvdSBhbmQgY291bGQgeW91IHByb3ZpZGUgZXh0cmEgaW5mbw0KZm9yIHRoZSBwYXRjaCBoZWFk
ZXIgbGlrZSwgdXBzdHJlYW0tc3RhdHVzLCB3cml0dGVuIGJ5IG9yIFNpZ25lZC1vZmYtYnk/DQoN
ClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvY29yZWdyaW5kL21fcmVkaXIu
YyBiL2NvcmVncmluZC9tX3JlZGlyLmMNCj4gaW5kZXggN2U0ZGY4ZC4uNjQwYTM0NiAxMDA2NDQN
Cj4gLS0tIGEvY29yZWdyaW5kL21fcmVkaXIuYw0KPiArKysgYi9jb3JlZ3JpbmQvbV9yZWRpci5j
DQo+IEBAIC0xMjIwLDcgKzEyMjAsMTggQEAgc3RhdGljIHZvaWQgYWRkX2hhcmR3aXJlZF9zcGVj
IChjb25zdCAgSENoYXIqDQo+IHNvcGF0dCwgY29uc3QgSENoYXIqIGZucGF0dCwNCj4gICAgIHNw
ZWMtPmZyb21fZm5wYXR0ID0gQ09OU1RfQ0FTVChIQ2hhciAqLGZucGF0dCk7DQo+ICAgICBzcGVj
LT50b19hZGRyICAgICA9IHRvX2FkZHI7DQo+ICAgICBzcGVjLT5pc1dyYXAgICAgICA9IEZhbHNl
Ow0KPiAtICAgc3BlYy0+bWFuZGF0b3J5ICAgPSBtYW5kYXRvcnk7DQo+ICsNCj4gKyAgIC8qIEhh
Y2s6IERlcGVuZGluZyBvbiBob3cgZ2xpYmMgd2FzIGNvbXBpbGVkIChlLmcuIG9wdGltaXNlZCBm
b3Igc2l6ZSBvcg0KPiArICAgICAgYnVpbHQgd2l0aCBfRk9SVElGWV9TT1VSQ0UgZW5hYmxlZCkg
dGhlIHN0cmxlbiBzeW1ib2wgbWlnaHQgbm90IGJlIGZvdW5kLg0KPiArICAgICAgVGhlcmVmb3Jl
IGFsdGhvdWdoIHdlIHNob3VsZCBzdGlsbCB0cnkgdG8gaW50ZXJjZXB0IGl0LCBkb24ndCBtYWtl
IGl0DQo+ICsgICAgICBtYW5kYXRvcnkgdG8gZG8gc28uIFdlIG92ZXItcmlkZSAibWFuZGF0b3J5
IiBoZXJlIHRvIGF2b2lkIHRoZSBuZWVkIHRvDQo+ICsgICAgICBwYXRjaCB0aGUgbWFueSBkaWZm
ZXJlbnQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGNhbGxlcnMgdG8NCj4gKyAgICAgIGFkZF9oYXJk
d2lyZWRfc3BlYygpLiAqLw0KPiArICAgaWYgKDA9PVZHXyhzdHJjbXApKCJzdHJsZW4iLCBmbnBh
dHQpKQ0KPiArICAgICAgc3BlYy0+bWFuZGF0b3J5ID0gTlVMTDsNCj4gKyAgIGVsc2UNCj4gKyAg
ICAgIHNwZWMtPm1hbmRhdG9yeSA9IG1hbmRhdG9yeTsNCj4gKw0KPiAgICAgLyogVkFSSUFCTEUg
UEFSVFMgKi8NCj4gICAgIHNwZWMtPm1hcmsgICAgICAgID0gRmFsc2U7IC8qIG5vdCBzaWduaWZp
Y2FudCAqLw0KPiAgICAgc3BlYy0+ZG9uZSAgICAgICAgPSBGYWxzZTsgLyogbm90IHNpZ25pZmlj
YW50ICovDQo=

