Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4C377E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:01:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7N81pW5011229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 01:01:51 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Wed, 23 Aug 2017 01:01:50 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] boost: add python to default PACKAGECONFIG
	options
Thread-Index: AQHTG4AEWVh7122takuejULtbCxCfqKRP6wAgABca4D//+37MA==
Date: Wed, 23 Aug 2017 08:01:49 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B86FA85@ALA-MBD.corp.ad.wrs.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
In-Reply-To: <e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.90]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Wed, 23 Aug 2017 08:01:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFjTGVvZCwgUmFuZHkN
Cj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjMsIDIwMTcgMDk6MjcNCj4gVG86IFJpY2hhcmQg
UHVyZGllOyBBbmRyZSBNY0N1cmR5OyBIdWFuZywgSmllIChKYWNraWUpDQo+IENjOiBPRSBDb3Jl
IG1haWxpbmcgbGlzdA0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gYm9vc3Q6IGFk
ZCBweXRob24gdG8gZGVmYXVsdCBQQUNLQUdFQ09ORklHDQo+IG9wdGlvbnMNCj4gDQo+IE9uIDIw
MTctMDgtMjIgMDM6NTUgUE0sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAx
Ny0wOC0yMiBhdCAxMjo1MSAtMDcwMCwgQW5kcmUgTWNDdXJkeSB3cm90ZToNCj4gPj4gT24gVHVl
LCBBdWcgMjIsIDIwMTcgYXQgMTI6NDIgQU0sICA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+
DQo+ID4+IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEZyb206IEphY2tpZSBIdWFuZyA8amFja2llLmh1
YW5nQHdpbmRyaXZlci5jb20+DQo+ID4+Pg0KPiA+Pj4gV2Ugd2FudCB0byBwcm92aWRlIHB5dGhv
biBsaWJzIGJ5IGRlZmF1bHQsIGFuZCBzb21lIG90aGVyDQo+ID4+PiBwb3B1bGFyIExpbnV4IGRp
c3RyaWJ1dGlvbnMgbGlrZSByZWRoYXQvZmVkb3JhIGRvZXMgdGhlIHNhbWUuDQo+ID4+IEhhcyBz
b21ldGhpbmcgY2hhbmdlZD8gSXMgdGhlcmUgYW55dGhpbmcgaW4gb2UtY29yZSBvciBtZXRhLW9l
IHdoaWNoDQo+ID4+IG5vdyBuZWVkcyBib29zdCBweXRob24gc3VwcG9ydCBlbmFibGVkPw0KPiA+
DQo+ID4gRG9lcyBpdCBldmVuIGFjdHVhbGx5IGJ1aWxkIG9uIGFsbCBhcmNoZXM/ID4NCj4gPiBJ
J20gcmF0aGVyIGJlaGluZCB3aXRoIHBhdGNoIHJldmlldyByaWdodCBub3cgYXMgcGVvcGxlIGFy
ZSBwdXR0aW5nIHNvDQo+ID4gbWFueSBwYXRjaGVzIG91dCB0aGVyZSB3aXRoIHdoYXQgc2VlbXMg
bGlrZSBtaW5pbWFsIHRlc3RpbmcgYW5kDQo+ID4gZXhwZWN0aW5nIG1lL1Jvc3MgYW5kIHRoZSBh
dXRvYnVpbGRlciB0byBmaWd1cmUgb3V0IHRoZSBwcm9ibGVtcyBmb3INCj4gPiB0aGVtLg0KPiA+
DQo+ID4gRWFjaCB0aW1lIG9uZSBmYWlscywgaXQgYmxvY2tzIHRoZSBxdWV1ZSB3aXRoIHRoZSBy
ZXN0IG9mIHRoZW0gaW4gYW5kIEkNCj4gPiBoYXZlIHRvIHJldGVzdCB1bnRpbCBJIGdldCBzb21l
dGhpbmcgY2xlYW4uDQo+ID4NCj4gPiBUZXN0aW5nIHRoaXMgY2hhbmdlIGlzIHF1aXRlIGEgd2F5
IGRvd24gbXkgcHJpb3JpdHkgbGlzdCBJJ20gYWZyYWlkLg0KPiA+DQo+IA0KPiBNYXliZSB0aGlz
IGlzIGJldHRlciBkb25lIGluIG91ciBkaXN0cm8gY29uZmlndXJhdGlvbi4NCj4gDQo+IFdlJ3Jl
IHRyeWluZyB0byBtaW5pbWl6ZSBkaWZmZXJlbmNlcyB3aXRoIG9lLWNvcmUgYW5kDQo+IHRoZSBi
b29zdCBweXRob24gc3VwcG9ydCBkb2Vzbid0IHNlZW0gdG8gYmUgbXVjaCBvZiBhbg0KPiBpbXBh
Y3QgYmFzZWQgb24gbG9va2luZyBhdCBsb2dzIHJhdGhlciB0aGFuIGEgaGF2aW5nIGENCj4gZGV0
YWlsZWQgdW5kZXJzdGFuZGluZyBvZiBib29zdC4NCj4gDQo+IFdlJ3ZlIGhhZCB0aGlzIGNvbW1p
dCBpbiBvdXIgbG9jYWwgYnJhbmNoIHNpbmNlIGJlZm9yZToNCj4gDQo+IENvbW1pdERhdGU6IFdl
ZCBEZWMgMjEgMjI6MTY6MzEgMjAxNiAtMDgwMA0KPiANCj4gICAgICBib29zdDogYWRkIHB5dGhv
biB0byBkZWZhdWx0IFBBQ0tBR0VDT05GSUcgb3B0aW9ucw0KPiANCj4gICAgICBXZSB3YW50IHRv
IHByb3ZpZGUgcHl0aG9uIGxpYnMgYnkgZGVmYXVsdCwgYW5kIHNvbWUgb3RoZXINCj4gICAgICBw
b3B1bGFyIExpbnV4IGRpc3RyaWJ1dGlvbnMgbGlrZSByZWRoYXQvZmVkb3JhIGRvZXMgdGhlIHNh
bWUuDQo+IA0KPiAgICAgIChMT0NBTCBSRVY6IE5PVCBVUFNUUkVBTSkgLS0gc2VudCB0byBvZS1j
b3JlIG9uIDIwMTYwOTMwDQo+IA0KPiBzbyBpdCBjZXJ0YWlubHkgYnVpbGRzIGZvciBhbGwgcWVt
dSogZm9yIGdsaWJjIGNvbmZpZ3VyYXRpb25zLg0KPiANCj4gSSdsbCBzZWUgaWYgd2UgY2FuIGFk
ZCBtdXNsIGJ1aWxkcyB0byBvdXIgYXV0b21hdGVkIGJ1aWxkcyB0b25pZ2h0Lg0KPiANCj4gSmFj
a2llLA0KPiANCj4gRGlkL0NhbiB5b3UgYnVpbGQgZm9yIG11c2w/DQoNCk5vLCBJIGRpZG4ndCBi
dWlsZCBmb3IgbXVzbCB5ZXQsIGJ1dCB5ZXMsIEkgY2FuIGFuZCB3aWxsIGRvIHRoZSB0ZXN0IHdp
dGggbXVzbA0KYW5kIGZpeCBpc3N1ZXMgYXMgbmVlZGVkLg0KDQo+IERvIHlvdSBoYXZlIGFueSBp
ZGVhIG9mIHRoZSBpbXBhY3Qgb2YgdGhpcyBjb25maWcgb24gdXNlcnMgdGhhdCBhcmUgbm90DQo+
IGludGVyZXN0ZWQgaW4gdGhlIHB5dGhvbiBpbnRlcmZhY2Ugd2l0aCBib29zdD8NCg0KSSBkb24n
dCB0aGluayB0aGVyZSBpcyBhbnkgaW1wYWN0LCBlYWNoIGxpYnJhcnkgaXMgcGFja2FnZWQgaW50
byBhIHNlcGFyYXRlDQpwYWNrYWdlIG5hbWVkIHdpdGggYm9vc3QtPGxpYiBuYW1lPg0KDQo+IFdo
YXQncyB0aGUgYWRkaXRpb25hbCBjb3N0IGluIGNvbXBpbGUgdGltZT8NCg0KQSBxdWljayB0ZXN0
IGluZGljYXRlcyB0aGF0IGl0J3MgbGVzcyB0aGFuIDEgc2Vjb25kOg0KDQokIGdyZXAgLXIgJ0Vs
YXBzZWQgdGltZTonIDIwMTcwODIzMDczMzA2L2Jvb3N0LTEuNjQuMC1yMC9kb19jb21waWxlIDIw
MTcwODIzMDc1MzAyL2Jvb3N0LTEuNjQuMC1yMC9kb19jb21waWxlDQoyMDE3MDgyMzA3MzMwNi9i
b29zdC0xLjY0LjAtcjAvZG9fY29tcGlsZTpFbGFwc2VkIHRpbWU6IDUwLjk2IHNlY29uZHMNCjIw
MTcwODIzMDc1MzAyL2Jvb3N0LTEuNjQuMC1yMC9kb19jb21waWxlOkVsYXBzZWQgdGltZTogNTEu
NjMgc2Vjb25kcw0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gDQo+IA0KPiBUaGVyZSBjZXJ0
YWlubHkgYXJlIGEgcnVzaCBvZiBwYWNrYWdlIHVwZGF0ZXMgYW5kIG90aGVyIGNoYW5nZXMNCj4g
Y29taW5nIGluOyBhcG9sb2dpZXMgZm9yIHRoZSBsYWNrIG9mIHdhcm5pbmcgYW5kIGxhdGUgYXJy
aXZhbHMuDQo+IE90aGVyIHRoYW4gZG9pbmcgbW9yZSB0ZXN0aW5nIGFuZCBleHBsYWluaW5nIHdo
YXQgdGVzdHMgd2VyZSBkb25lLA0KPiB3aGF0IGVsc2UgY2FuIHdlIGRvIHRvIGhlbHA/DQo+IA0K
PiANCj4gLi4vUmFuZHkNCj4gDQo+IA0KPiA+IENoZWVycywNCj4gPg0KPiA+IFJpY2hhcmQNCj4g
Pg0KPiA+DQo+IA0KPiANCj4gLS0NCj4gIyBSYW5keSBNYWNMZW9kLiBTTVRTLCBMaW51eCwgV2lu
ZCBSaXZlcg0KPiBEaXJlY3Q6IDYxMy45NjMuMTM1MCB8IDM1MCBUZXJyeSBGb3ggRHJpdmUsIFN1
aXRlIDIwMCwgT3R0YXdhLCBPTiwNCj4gQ2FuYWRhLCBLMksgMlc1DQo=

