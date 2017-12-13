Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E79278093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 07:24:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBD7OPco020842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Dec 2017 23:24:25 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.47]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Tue, 12 Dec 2017 23:24:24 -0800
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gmp: depends on flex-native to fix parallel
	building issue
Thread-Index: AQHTcgkHuOync75SXUuUF7sziNr0L6M/R05AgACwNgCAAOlJ8A==
Date: Wed, 13 Dec 2017 07:24:24 +0000
Message-ID: <C2A454FDE6C23F41BD5011E2458C46C9CEF087D4@ALA-MBD.corp.ad.wrs.com>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
	<1512946109.19417.136.camel@linuxfoundation.org>
	<C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
	<1513070552.19417.153.camel@linuxfoundation.org>
In-Reply-To: <1513070552.19417.153.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.79]
MIME-Version: 1.0
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Wed, 13 Dec 2017 07:24:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBzaXIsICBJIGRpZCBub3QgcmVwcm9kdWNlIHRoaXMgb24gbWFzdGVyLiAgRXZlbiBvbiBt
b3J0eSwgSSBvbmx5IHNhdw0KdHdpY2UuICBNYXliZSB3ZSBjYW4gaG9sZCBvbiB0aGlzIGFuZCBs
ZXQgbWUga2VlcCBtb25pdG9yaW5nLiAgVGhhbmtzLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmddIA0KU2VudDogMjAxN+W5tDEy5pyIMTLml6UgMTc6MjMNClRvOiBCYWks
IEhhaXFpbmc7IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbXA6IGRlcGVuZHMgb24gZmxleC1uYXRpdmUgdG8g
Zml4IHBhcmFsbGVsIGJ1aWxkaW5nIGlzc3VlDQoNCkxldCBtZSBtYWtlIHRoaXMgc2ltcGxlci4g
V2hpY2ggcmVsZWFzZSBvZiB0aGUgcHJvamVjdCBkaWQgeW91IHNlZSB0aGlzIGlzc3VlIHdpdGg/
DQoNCkkgYmVsaWV2ZSB0aGlzIGlzc3VlIHdvdWxkIG9ubHkgb2NjdXIgd2l0aCBtb3J0eSBhbmQg
ZWFybHksIHB5cm8sIHJvY2tvIGFuZCBtYXN0ZXIgYXJlIG5vdCBhZmZlY3RlZC4NCg0KQ2hlZXJz
LA0KDQpSaWNoYXJkDQoNCk9uIFR1ZSwgMjAxNy0xMi0xMiBhdCAwNzoxMyArMDAwMCwgQmFpLCBI
YWlxaW5nIHdyb3RlOg0KPiBDb21tZW50cyBiZWxvdy4gdGhhbmtzDQo+IA0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IDIwMTflubQxMuaciDEx5pelIDY6
NDgNCj4gVG86IEJhaSwgSGFpcWluZzsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZ21wOiBkZXBlbmRzIG9u
IGZsZXgtbmF0aXZlIHRvIGZpeCANCj4gcGFyYWxsZWwgYnVpbGRpbmcgaXNzdWUNCj4gDQo+IE9u
IFdlZCwgMjAxNy0xMS0yOSBhdCAxNDo1NCArMDgwMCwgSGFpcWluZyBCYWkgd3JvdGU6DQo+ID4g
DQo+ID4gZml4IGJlbG93IHBhcmFsbGVsIGJ1aWxkaW5nIGlzc3VlOg0KPiA+IGNvbmZpZ3VyZToy
NzM2NTogcmVzdWx0OiBmbGV4DQo+ID4gY29uZmlndXJlOjI3NDAzOiBmbGV4IGNvbmZ0ZXN0LmwN
Cj4gPiAuLi4vc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4vZmxleC5yZWFsOiBObyBzdWNo
IGZpbGUgb3IgDQo+ID4gZGlyZWN0b3J5DQo+ID4gY29uZmlndXJlOjI3NDA3OiAkPyA9IDEyNw0K
PiA+IGNvbmZpZ3VyZToyNzQwOTogY2hlY2tpbmcgbGV4IG91dHB1dCBmaWxlIHJvb3QNCj4gPiBj
b25maWd1cmU6Mjc0MjA6IGVycm9yOiBjYW5ub3QgZmluZCBvdXRwdXQgZnJvbSBmbGV4OyBnaXZp
bmcgdXANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlxaW5nIEJhaSA8SGFpcWluZy5CYWlA
d2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dtcC9n
bXAuaW5jIHwgMiArKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbXAvZ21wLmluYyBiL21l
dGEvcmVjaXBlcy0gDQo+ID4gc3VwcG9ydC9nbXAvZ21wLmluYyBpbmRleCBhYmFjOGNmLi4xYjM1
ZWFhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dtcC9nbXAuaW5jDQo+
ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ21wL2dtcC5pbmMNCj4gPiBAQCAtMTAsMyAr
MTAsNSBAQCBQQUNLQUdFQ09ORklHW3JlYWRsaW5lXSA9ICItLXdpdGgtcmVhZGxpbmU9eWVzLCAN
Cj4gPiAtLXdpdGgtcmVhZGxpbmU9bm8scmVhZGxpbmUiDQo+ID4gwqANCj4gPiDCoEFSTV9JTlNU
UlVDVElPTl9TRVRfYXJtdjQgPSAiYXJtIg0KPiA+IMKgQVJNX0lOU1RSVUNUSU9OX1NFVF9hcm12
NSA9ICJhcm0iDQo+ID4gKw0KPiA+ICtERVBFTkRTID0gImZsZXgtbmF0aXZlIg0KPiBXaXRoIHJl
Y2lwZSBzcGVjaWZpYyBzeXNyb290cyB0aGlzIHNob3VsZCBub3cgYmUgZGV0ZXJtaW5pc3RpYy4g
VGhlIA0KPiBsb2cgYWJvdmUgc3VnZ2VzdHMgeW91IHdlcmUgbm90IHVzaW5nIHJlY2lwZSBzcGVj
aWZpYyBzeXNyb290cz8gVGhpcyANCj4gd291bGQgdGhlcmVmb3JlIG9ubHkgYmUgYXBwbGljYWJs
ZSB0byBtb3J0eSBhbmQgZWFybGllcj8NCj4gW1RoaXMgaXNzdWUgaXMgZm91bmRlZCBvbiB4ODYt
NjQgYnVpbGRpbmcswqDCoGJ1dCBpdCBkb2VzIG5vdCBtZWFuIGl0IGlzIA0KPiBvbmx5IHJlbGF0
ZWQgd2l0aCB4ODYuwqDCoEFjdHVhbGx5IHRoaXMgaXMgY2F1c2VkIGJ5IHRoZSBkZWZlY3Qgb2Yg
dGhlIA0KPiB0cmFkaXRpb25hbCBwcm9iZSBtZWNoYW5pc20gb2YgJ2NvbmZpZ3VyZScswqDCoHRo
ZSBwYWNrYWdlIGNvbmZpZ3VyZSANCj4gc2NyaXB0IHRyeSB0byBwcm9iZSB3aGV0aGVyIGhhcyBw
YWNrYWdlICdmbGV4JyAsIHRoZW4gc29tZSBvcHRpb25hbCANCj4gYWN0aW9ucyB3aWxsIGJlIGRv
bmUgYnkgaXQuwqDCoEluIHRoaXMgaXNzdWUswqDCoHdoZW4gdGhpcyBwcm9iZSBoYXBwZW5zLMKg
wqDCoA0KPiAvdXNyL2Jpbi9mbGV4IGV4aXN0cyBidXQgJy91c3IvYmluL2ZsZXgucmVhbCcgaGFz
IG5vdCBjcmVhdGVkIGZvciB0aGUgDQo+IHBhcmFsbGVsIGJ1aWxkaW5nLMKgwqB0aGVuIGNvbmZp
Z3VyZSByZXBvcnRzIHRoZSBlcnJvciBhbmQgZXhpdHMgZnJvbSANCj4gYnVpbGRpbmcuwqDCoMKg
U2luY2UgdGhlcmUgYXJlIG5vIGF0b21pYyBndWFyYW50ZWUgZm9yIHRoZSBwYWNrYWdlIG91dHB1
dCANCj4gZHVyaW5nIHBhcmFsbGVsIGJ1aWxkaW5nLCBzbyBoZXJlIGFkZCB0aGlzIGRlcGVuZHNd
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0K

