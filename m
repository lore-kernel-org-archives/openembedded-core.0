Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8ED76059E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:22:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8R8MfCh012997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 27 Sep 2016 01:22:42 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 27 Sep 2016 01:22:41 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2 v2] boost: add support for additional
	boost libs
Thread-Index: AQHSF9N8MJNVTEFs4EyooyC5Dmn5t6CMhxeQgADrVoD//41AAA==
Date: Tue, 27 Sep 2016 08:22:40 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2E0FAA@ALA-MBA.corp.ad.wrs.com>
References: <cover.1474875470.git.jackie.huang@windriver.com>
	<b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
	<1474880010.31418.8.camel@andred.net>
	<1B858668EC6A94408DCA5225FDFA85AA013A2E03AC@ALA-MBA.corp.ad.wrs.com>
	<1474963725.666.7.camel@andred.net>
In-Reply-To: <1474963725.666.7.camel@andred.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2 v2] boost: add support for additional boost libs
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
X-List-Received-Date: Tue, 27 Sep 2016 08:22:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcsOpIERyYXN6aWsg
W21haWx0bzpnaXRAYW5kcmVkLm5ldF0NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDI3LCAy
MDE2IDQ6MDkgUE0NCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSk7IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0gg
Mi8yIHYyXSBib29zdDogYWRkIHN1cHBvcnQgZm9yIGFkZGl0aW9uYWwgYm9vc3QgbGlicw0KPiAN
Cj4gT24gRGksIDIwMTYtMDktMjcgYXQgMDI6MjYgKzAwMDAsIEh1YW5nLCBKaWUgKEphY2tpZSkg
d3JvdGU6DQo+ID4NCj4gPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogQW5kcsOpIERyYXN6aWsgW21haWx0bzpnaXRAYW5kcmVkLm5ldF0NCj4gPiA+IFNl
bnQ6IE1vbmRheSwgU2VwdGVtYmVyIDI2LCAyMDE2IDQ6NTQgUE0NCj4gPiA+IFRvOiBIdWFuZywg
SmllIChKYWNraWUpOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzIgdjJdIGJvb3N0OiBhZGQgc3Vw
cG9ydCBmb3IgYWRkaXRpb25hbA0KPiA+ID4gYm9vc3QgbGlicw0KPiA+ID4NCj4gPiA+IE9uIE1v
LCAyMDE2LTA5LTI2IGF0IDE1OjU2ICswODAwLCBqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbSB3
cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdA
d2luZHJpdmVyLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gKiBBZGRlZCBsaWJzOg0KPiA+ID4gPiDC
oCAtIGNvbnRhaW5lcg0KPiA+ID4gPiDCoCAtIGNvbnRleHQNCj4gPiA+ID4gwqAgLSBjb3JvdXRp
bmUNCj4gPiA+ID4gwqAgLSBleGNlcHRpb24NCj4gPiA+ID4gwqAgLSBncmFwaF9wYXJhbGxlbA0K
PiA+ID4gPiDCoCAtIGxvY2FsZQ0KPiA+ID4gPiDCoCAtIG1hdGgNCj4gPiA+ID4gwqAgLSBtcGkN
Cj4gPiA+ID4gwqAgLSB3YXZlDQo+ID4gPiA+DQo+ID4gPiA+ICogQWRkIFBBQ0tBR0VDT05GSUcg
dG8gYWRkIHByb3BlciBkZXBlbmRlbmNpZXMgZm9yOg0KPiA+ID4gPiDCoCBncmFwaF9wYXJhbGxl
bCwgbG9jYWxlLCBhbmQgbXBpLg0KPiA+ID4gPg0KPiA+ID4gPiAqIGJvb3N0LW1waSBkZXBlbmRz
IG9uIG1waWNoIHdoaWNoIGlzIGluIG1ldGEtb2UsDQo+ID4gPiA+IMKgIGFuZCBib29zdC1ncmFw
aF9wYXJhbGxlbCBkZXBlbmRzIG9uIGJvb3N0LW1waSwNCj4gPiA+ID4gwqAgc28gdGhleSBhcmUg
ZGlzYWJsZWQgYnkgZGVmYXVsdCwgYnV0IGNhbiBiZSBlbmFibGVkDQo+ID4gPiA+IMKgIGluIGEg
ZGlzdHJvIHRoYXQgbmVlZHMgdGhlbS4NCj4gPiA+ID4NCj4gPiA+ID4gKiBjb250ZXh0IGFuZCBj
b3JvdXRpbmUgYXJlIGFkZGVkIG9ubHkgZm9yIHg4NiBhbmQgcG93ZXJwYy4NCj4gPiA+ID4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdAd2luZHJpdmVy
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3Qv
Ym9vc3QuaW5jIHwgMzMNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ID4gPiAtLQ0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QuaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiA+ID4gPiBzdXBwb3J0
L2Jvb3N0L2Jvb3N0LmluYw0KPiA+ID4gPiBpbmRleCA1Njk2YjZhLi43NjM3YTRlIDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC5pbmMNCj4gPiA+
ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QuaW5jDQo+ID4gPiA+IEBA
IC04LDExICs4LDE0IEBAIEFSTV9JTlNUUlVDVElPTl9TRVRfYXJtdjUgPSAiYXJtIg0KPiA+ID4g
PiDCoEJPT1NUX0xJQlMgPSAiXA0KPiA+ID4gPiDCoAlhdG9taWMgXA0KPiA+ID4gPiDCoAljaHJv
bm8gXA0KPiA+ID4gPiArCWNvbnRhaW5lciBcDQo+ID4gPiA+IMKgCWRhdGVfdGltZSBcDQo+ID4g
PiA+ICsJZXhjZXB0aW9uIFwNCj4gPiA+ID4gwqAJZmlsZXN5c3RlbSBcDQo+ID4gPiA+IMKgCWdy
YXBoIFwNCj4gPiA+ID4gwqAJaW9zdHJlYW1zIFwNCj4gPiA+ID4gwqAJbG9nIFwNCj4gPiA+ID4g
KwltYXRoIFwNCj4gPiA+ID4gwqAJcHJvZ3JhbV9vcHRpb25zIFwNCj4gPiA+ID4gwqAJcmFuZG9t
IFwNCj4gPiA+ID4gwqAJcmVnZXggXA0KPiA+ID4gPiBAQCAtMjIsMTIgKzI1LDI4IEBAIEJPT1NU
X0xJQlMgPSAiXA0KPiA+ID4gPiDCoAl0aW1lciBcDQo+ID4gPiA+IMKgCXRlc3QgXA0KPiA+ID4g
PiDCoAl0aHJlYWQgXA0KPiA+ID4gPiArCXdhdmUgXA0KPiA+ID4gPiDCoAkiDQo+ID4gPiA+DQo+
ID4gPiA+IC0jIG9wdGlvbmFsIGJvb3N0LXB5dGhvbiBsaWJyYXJ5DQo+ID4gPiA+IC1QQUNLQUdF
Q09ORklHID8/PSAiIg0KPiA+ID4gPiArIyBvbmx5IHN1cHBvcnRlZCBieSB4ODYgYW5kIHBvd2Vy
cGMNCj4gPiA+ID4gK0JPT1NUX0xJQlNfYXBwZW5kX3g4NiA9ICIgY29udGV4dCBjb3JvdXRpbmUi
DQo+ID4gPiA+ICtCT09TVF9MSUJTX2FwcGVuZF94ODYtNjQgPSAiIGNvbnRleHQgY29yb3V0aW5l
Ig0KPiA+ID4gPiArQk9PU1RfTElCU19hcHBlbmRfcG93ZXJwYyA9ICIgY29udGV4dCBjb3JvdXRp
bmUiDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyMgb3B0aW9uYWwgbGlicmFyaWVzDQo+ID4gPiA+ICtQ
QUNLQUdFQ09ORklHID8/PSAibG9jYWxlIg0KPiA+ID4gPiArUEFDS0FHRUNPTkZJR1tsb2NhbGVd
ID0gIiwsaWN1Ig0KPiA+ID4gPiArUEFDS0FHRUNPTkZJR1tncmFwaF9wYXJhbGxlbF0gPSAiLCws
Ym9vc3QtbXBpIG1waWNoIg0KPiA+ID4gPiArUEFDS0FHRUNPTkZJR1ttcGldID0gIiwsbXBpY2gi
DQo+ID4gPiA+IMKgUEFDS0FHRUNPTkZJR1tweXRob25dID0gIiwscHl0aG9uIHB5dGhvbjMiDQo+
ID4gPiA+IC1CT09TVF9MSUJTICs9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJ
RycsICdweXRob24nLA0KPiA+ID4gPiAncHl0aG9uDQo+ID4gPiA+IHB5dGhvbjMnLCAnJywgZCl9
Ig0KPiA+ID4gPiArDQo+ID4gPiA+ICtCT09TVF9MSUJTICs9ICJcDQo+ID4gPiA+ICvCoMKgwqDC
oCR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2xvY2FsZScsICdsb2NhbGUn
LCAnJywgZCl9DQo+ID4gPiA+IFwNCj4gPiA+ID4gK8KgwqDCoMKgJHtAYmIudXRpbHMuY29udGFp
bnMoJ1BBQ0tBR0VDT05GSUcnLCAnZ3JhcGhfcGFyYWxsZWwnLA0KPiA+ID4gPiAnZ3JhcGhfcGFy
YWxsZWwgbXBpJywgXA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdtcGkn
LA0KPiA+ID4gPiAnbXBpJywNCj4gPiA+ID4gJycsIGQpLCBkKX0gXA0KPiA+ID4gPiArwqDCoMKg
wqAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdweXRob24nLCAncHl0aG9u
IHB5dGhvbjMnLA0KPiA+ID4gPiAnJywNCj4gPiA+ID4gZCl9IFwNCj4gPiA+ID4gKyINCj4gPiA+
DQo+ID4gPiBSYXRoZXIgdGhhbiBoYXZpbmcgdHdvIHdheXMgdG8gZGVmaW5lIHdoYXQgcGFja2Fn
ZXMgdG8gYnVpbGQsDQo+ID4gPiBQQUNLQUdFQ09ORklHDQo+ID4gPiBhbmQgQk9PU1RfTElCUywg
d2hlcmUgZWFjaCBvZiB0aGVtIG9ubHkgc3VwcG9ydHMgYSBkaWZmZXJlbnQgc3Vic2V0IG9mDQo+
ID4NCj4gPiBJJ20gbm90IGEgZmFuIG9mIHRoaXMgd2F5LCBJIGp1c3Qga2VlcCB1c2luZyB0aGUg
d2F5IGl0IHdhcy4NCj4gPg0KPiA+ID4NCj4gPiA+IGJvb3N0J3MgbGlicmFyaWVzLCBjYW4gd2Ug
anVzdCBoYXZlIG9uZSwgUEFDS0FHRUNPTkZJRywgYW5kIGhhdmUgaXQNCj4gPiA+IHN1cHBvcnQN
Cj4gPiA+IGFsbCBvZiB0aGUgcG90ZW50aWFsIGxpYnJhcmllcz8NCj4gPg0KPiA+IFllcywgSSB0
aGluayBpdCdzIHBvc3NpYmxlLCBidXQgaXQgd2lsbCBtb3N0IGxpa2VseSBlbmQgdXAgd2l0aCBt
YW55IGVtcHR5DQo+ID4gUEFDS0FHRUNPTkZJRyBkZWZpbml0aW9ucyBsaWtlOg0KPiA+IFBBQ0tB
R0VDT05GSUdbYXRvbWljXSA9ICIsLCwiDQo+ID4gUEFDS0FHRUNPTkZJR1tjaHJvbm9dID0gIiws
LCINCj4gPiBQQUNLQUdFQ09ORklHW2NvbnRhaW5lcl0gPSAiLCwsIg0KPiA+IFBBQ0tBR0VDT05G
SUdbZGF0ZV90aW1lXSA9ICIsLCwiDQo+ID4gUEFDS0FHRUNPTkZJR1tleGNlcHRpb25dID0gIiws
LCINCj4gPg0KPiA+IElmIHlvdSB0aGluayBpdCdzIGEgYmV0dGVyIHdheSBhbmQgbm8gb3RoZXIg
b2JqZWN0aW9uLCBJIHRoaW5rIEkgd2lsbCBkbw0KPiA+IHRoYXQgaW4gYQ0KPiA+IHNlcGFyYXRl
IGNvbW1pdCBhcyBmb2xsb3ctdXAuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHlvdSdkIG5lZWQgZW1w
dHkgUEFDS0FHRUNPTkZJR1tmbGFnXSBkZWZpbml0aW9ucywgc2VlDQo+IGJhc2UuYmJjbGFzcy4N
Cg0KQ291bGQgeW91IGJlIG1vcmUgc3BlY2lmaWM/IA0KDQpJIHRoaW5rIGl0J3MgbmVlZGVkIGJl
Y2F1c2UgSSBnb3QgUUEgaXNzdWVzIHdpdGhvdXQgdGhlIGRlZmluaXRpb25zOg0KDQpXQVJOSU5H
OiBib29zdC0xLjYxLjAtcjAgZG9fY29uZmlndXJlOiBRQSBJc3N1ZTogYm9vc3Q6IGludmFsaWQg
UEFDS0FHRUNPTkZJRzogYXRvbWljIFtpbnZhbGlkLXBhY2thZ2Vjb25maWddDQoNClRoYW5rcywN
CkphY2tpZQ0KDQo+IA0KPiBDaGVlcnMsDQo+IEFuZHJlJw0KDQo=

