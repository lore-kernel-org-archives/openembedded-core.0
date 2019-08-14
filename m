Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38C8F7EC64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 14:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5266318512;
	Wed, 14 Aug 2019 16:57:32 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id UlzGkFGyk24p; Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 92B9218507;
	Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 802F01E075;
	Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 745B91E04F;
	Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from xbox06.axis.com (xbox06.axis.com [10.0.15.176])
	by seth.se.axis.com (Postfix) with ESMTP id 67865A7;
	Wed, 14 Aug 2019 16:57:28 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by xbox06.axis.com (10.0.15.176)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Wed, 14 Aug 2019 16:57:28 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Wed, 14 Aug 2019 16:57:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] Long delays with latest bitbake (was: [PATCH 1/7]
	insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
Thread-Index: AQHVUbYUaWhe7G44v0KL60s/PsXgbab5UuGAgAEOBACAAANLgIAACLKAgAANRwCAAD4VgA==
Date: Wed, 14 Aug 2019 14:57:28 +0000
Message-ID: <8e7c2ed75a5f499c88fba9bf692882b4@xbox06.axis.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
In-Reply-To: <123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 14:57:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiByaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0K
PiBTZW50OiBkZW4gMTQgYXVndXN0aSAyMDE5IDE0OjU2DQo+IFRvOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gQ2M6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgS2hlbSBSYWoNCj4gPHJhai5raGVtQGdtYWlsLmNv
bT47IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
Pg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIExvbmcgZGVsYXlzIHdpdGggbGF0ZXN0IGJpdGJh
a2UgKHdhczogW1BBVENIDQo+IDEvN10gaW5zYW5lLmJiY2xhc3M6IGluIGZpbGUtcmRlcHMgZG8g
bm90IGxvb2sgaW50byBSREVQRU5EUw0KPiByZWN1cnNpdmVseSkNCj4gDQo+IE9uIFdlZCwgMjAx
OS0wOC0xNCBhdCAxNDowOCArMDIwMCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+ID4gT24g
V2VkLCAxNCBBdWcgMjAxOSBhdCAxMzozNiwgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQo+ID4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMTktMDgtMTQgYXQgMTM6MjUgKzAy
MDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDEzIEF1ZyAyMDE5
IGF0IDIxOjE4LCBSaWNoYXJkIFB1cmRpZSA8DQo+ID4gPiA+IHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+ID4gPiA+IEkgaGFkIGEgZ2xhbmNlIGF0IHRoZSBw
cm9maWxlIG91dHB1dCBmcm9tIG1hc3Rlci1uZXh0IGFuZCB0aGUNCj4gPiA+ID4gPiBwcm9ibGVt
DQo+ID4gPiA+ID4gd2Fzbid0IHdoZXJlIEkgdGhvdWdodCBpdCB3b3VsZCBiZSwgaXQgd2FzIGlu
IHRoZSBzY2hlZHVsZXINCj4gPiA+IGNvZGUuDQo+ID4gPiA+ID4gVGhhdA0KPiA+ID4gPiA+IGlz
IGdvb2QgYXMgdGhvc2UgY2xhc3NlcyBhcmUgZWZmZWN0aXZlbHkgaW5kZXBlbmRlbnQgb2YgdGhl
DQo+ID4gPiBvdGhlcg0KPiA+ID4gPiA+IGNoYW5nZXMgYW5kIGhlbmNlIGFyZSBhIHNlcGFyYXRl
IGZpeC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkndmUgcHV0IGEgcGF0Y2ggaW4gLW5leHQgd2hp
Y2ggdGFrZXMgdGhlIGFib3ZlIHRlc3QgdG8gMzZzDQo+ID4gPiB3aGljaA0KPiA+ID4gPiA+IGlz
DQo+ID4gPiA+ID4gY2xvc2UgdG8gdGhlIG9sZGVyIGJpdGJha2UuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBDb3VsZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgaG93IGl0IGxvb2tzIGZvciBvdGhlcnMg
YW5kDQo+ID4gPiBkaWZmZXJlbnQNCj4gPiA+ID4gPiB3b3JrbG9hZHMuDQo+ID4gPiA+DQo+ID4g
PiA+IEkganVzdCB0cmllZCB0aGUgc2FtZSB0ZXN0IEkgZGlkIHllc3RlcmRheSB3aXRoDQo+ID4g
PiA+IGFiNTZkNDY2NDUyMTQ4ZTVmY2UzMzBkMjc5ZDEzZTI0OTVlY2ViMWYuIFVuZm9ydHVuYXRl
bHkgaXQNCj4gPiA+IGRvZXNuJ3QNCj4gPiA+ID4gc2VlbSB0byBpbXByb3ZlIHRoaW5ncyBtdWNo
OiBiaXRiYWtlIGlzIHN0dWNrIGF0ICJOT1RFOiBFeGVjdXRpbmcNCj4gPiA+ID4gVGFza3MiIGZv
ciAxNSBtaW51dGVzIG5vdy4NCj4gPiA+DQo+ID4gPiBUaGlzIG1pZ2h0IHNvdW5kIHNsaWdodGx5
IGNyYXp5IGJ1dCBjYW4geW91IHRyeSBjb21tZW50aW5nIG91dCB0aGlzDQo+ID4gPiBsaW5lIGlu
IHJ1bnF1ZXVlLnB5Og0KPiA+ID4NCj4gPiA+IGxvZ2dlci5kZWJ1ZygyLCAiSG9sZGluZyBvZmYg
dGFza3MgJXMiICUNCj4gPiA+IHBwcmludC5wZm9ybWF0KHNlbGYuaG9sZG9mZl90YXNrcykpDQo+
ID4gPg0KPiA+ID4gPw0KPiA+DQo+ID4gRXZlbiBjcmF6aWVyIGlzIHRoZSBvdXRjb21lOiBpdCBo
ZWxwZWQhDQo+IA0KPiBDb29sLCBJIHRoaW5rIEkgY2FuIGV4cGxhaW4gaXQuDQo+IA0KPiBUaGUg
aG9sZG9mZl90YXNrcyBsaXN0IGNhbiBjb250YWluIGEgbGlzdCBvZiBuZWFybHkgYWxsIHRoZSB0
YXNrcyBhdA0KPiBzb21lIHBvaW50cyBpbiBleGVjdXRpb24uIEV2ZW4gdGhvdWdoIHRoZSBkZWJ1
ZyBtZXNzYWdlcyBhcmVuJ3QgYmVpbmcNCj4gcHJpbnRlZCBvbiB0aGUgY29uc29sZSwgdGhleSBh
cmUgYmVpbmcgc2VudCBvdmVyIHRoZSBpbnRlcm5hbCBJUEMgYnVzDQo+IGJldHdlZW4gdGhlIGNv
b2tlciwgVUkgYW5kIG90aGVyIGV2ZW50IGhhbmRsZXJzLiBPYnZpb3VzbHkgZm9yIHNtYWxsDQo+
IHRhc2sgbGlzdHMgaXRzIG5vdCBhIHByb2JsZW0sIGZvciBsYXJnZSBvbmVzIGl0cyBtdWx0aXBs
ZSA0ayBjaHVua3MNCj4gb3ZlciBwaXBlcyB3aGljaCBpc24ndCBnb2luZyB0byBiZSBmYXN0Lg0K
PiANCj4gV2UgaGF2ZSBkb25lIGEgbG90IG9mIG9wdGltaXNhdGlvbiBpbiB0aGUgcGFzdCBidXQg
aXRzIGFsbCB0b28gZWFzeSB0bw0KPiB0cmVuZCBvbiBzb21ldGhpbmcgbGlrZSB0aGlzIGFuZCB1
cHNldCB0aGluZ3MgOi8uDQo+IA0KPiA+IFRoZSB3aG9sZSB0aGluZyBjb21wbGV0ZWQgYWZ0ZXIg
MTVtNDlzZWNvbnMgKHdpdGggbXVjaCBvZiB0aGUgdGltZQ0KPiA+IGdvaW5nIHRvIHRoZSBlbXB0
eSB0YXNrIHNwaW4pLCB0aGF0J3Mgc29tZSAzIG1pbnV0ZXMgc2xvd2VyLCBidXQNCj4gPiBjZXJ0
YWlubHkgaXQncyB1c2FibGUgYWdhaW4uDQo+IA0KPiBZb3UgZm9sbG93ZWQgdXAgbWVudGlvbmlu
ZyB0aGlzIHdhc24ndCB3aXRoIG1hc3Rlci1uZXh0LiBJIHRoaW5rIHRoZXJlDQo+IGlzIGEgcGF0
Y2ggaW4gLW5leHQgd2hpY2ggd2lsbCBoZWxwIHdpdGggdGhlIGVtcHR5IHRhc2sgc3BpbiBzbyBi
b3RoDQo+IHRvZ2V0aGVyIG1pZ2h0IGdldCB1cyBiYWNrIHRvIG1vcmUgbm9ybWFsIG51bWJlcnMu
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkkgY2FuIGp1c3QgY29uZmlybSB0aGF0
IHJlbW92aW5nIHRoZSBkZWJ1ZyBsaW5lIHJlbW92ZXMgYWxtb3N0IGFsbCBvZiANCnRoZSBkZWxh
eXMgSSB3YXMgc2VlaW5nLiBIZXJlIGFyZSBzb21lIHRpbWUgc3RhdGlzdGljcyBmcm9tIG15IGJ1
aWxkczoNCg0KNmM3YzBjZWY6IDAyOjUwDQo3ZGYzMWZmMzogMDY6MTMgIChmaXJzdCBhdHRlbXB0
KQ0KYTA1NDJlZDM6IDA2OjMyICAobWFzdGVyKQ0KMTlhODhjNjg6IDQzOjE5KiAofnllc3RlcmRh
eSdzIG1hc3Rlci1uZXh0KQ0KYjBhMGU0YTY6IDA2OjU1ICAobWFzdGVyLW5leHQpDQpubyBkZWJ1
ZzogMDM6MDQgIChtYXN0ZXItbmV4dCArIHJlbW92YWwgb2YgIkhvbGRpbmcgb2ZmIHRhc2tzIiBk
ZWJ1ZykNCg0KKiBJIGFib3J0ZWQgdGhpcyBidWlsZCBhZnRlciBhYm91dCBoYWxmIG9mIHRoZSAx
MjU0MCB0YXNrcyB3ZXJlIGRvbmUuLi4NCg0KT25lIHRoaW5nIEkgaGF2ZSBub3RpY2VkIHdoaWxl
IEkgd2FzIGRvaW5nIHRoZSB0aW1pbmdzIGlzIHRoYXQgSSBkbyANCm5vdCBzZWVtIHRvIGJlIGFi
bGUgdG8ga2lsbCB0aGUgYml0YmFrZSBzZXJ2ZXIgd2l0aCBiaXRiYWtlIC1tIGFmdGVyIA0KdGhl
IGJ1aWxkcyBoYXZlIGNvbXBsZXRlZCwgYnV0IGhhdmUgdG8gcmVzb3J0IHRvIHVzaW5nIGtpbGwg
LTkgbW9zdCANCm9mIHRoZSB0aW1lLi4uIA0KDQovL1BldGVyDQoNCg==

