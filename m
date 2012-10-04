Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TJlGz-00047O-Og
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:15:30 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q94D2Tum027933;
	Thu, 4 Oct 2012 08:02:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q94D2TqG018568;
	Thu, 4 Oct 2012 08:02:29 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 4 Oct 2012 08:02:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libtool: Add missing DEPENDS on libtool-cross
Thread-Index: AQHNohGpIKsqLuL3q0uUHVwyg/BmXZepFSuQgABaWID//6x+sA==
Date: Thu, 4 Oct 2012 13:02:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159242E7C@DLEE12.ent.ti.com>
References: <1349213439-14199-1-git-send-email-Chase.Maupin@ti.com>
	<1349342479.18301.68.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
	<1349355495.18301.93.camel@ted>
In-Reply-To: <1349355495.18301.93.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Add missing DEPENDS on libtool-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 13:15:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IFRodXJzZGF5
LCBPY3RvYmVyIDA0LCAyMDEyIDc6NTggQU0NCj4gVG86IE1hdXBpbiwgQ2hhc2UNCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUkU6IFtP
RS1jb3JlXSBbUEFUQ0hdIGxpYnRvb2w6IEFkZCBtaXNzaW5nIERFUEVORFMgb24NCj4gbGlidG9v
bC1jcm9zcw0KPiANCj4gT24gVGh1LCAyMDEyLTEwLTA0IGF0IDEyOjM5ICswMDAwLCBNYXVwaW4s
IENoYXNlIHdyb3RlOg0KPiA+IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgY29uc2lzdGVu
dGx5IG9uIG15IGJ1aWxkIHNlcnZlcg0KPiB3aGljaCBoYXMNCj4gPiAyNCBjb3JlcyBydW5uaW5n
IGF0IDMuNSBHSHouICBJIHdhcyB1c2luZzoNCj4gPg0KPiA+IEJCX05VTUJFUl9USFJFQURTID0g
IjI0Ig0KPiA+DQo+ID4gQW5kDQo+ID4NCj4gPiBQQVJBTExFTF9NQUtFID0gIi1qIDI0Ig0KPiA+
DQo+ID4gSSBjYW4gdHJ5IGEgYnVpbGQgcmVkdWNpbmcgdGhlIG51bWJlciBvZiB0aHJlYWRzIGFu
ZCBzZWUgaWYgdGhlDQo+IGlzc3VlDQo+ID4gZ29lcyBhd2F5IGFzIHRoaXMgbWlnaHQgYmUgYSBk
aWZmZXJlbmNlIGJldHdlZW4gb3VyIGJ1aWxkcy4NCj4gQ2FuIHlvdQ0KPiA+IHRlbGwgbWUgd2hh
dCB5b3UgYXJlIHVzaW5nPw0KPiANCj4gSSB0ZXN0ZWQgdGhpcyB3aXRoIDQ4LzQ4IGluIG1hc3Rl
ci4NCj4gDQo+ID4gSXQgc2VlbWVkIGxpa2UgYSByYWNlIGNvbmRpdGlvbiBiZWNhdXNlIGFmdGVy
IEkgZ290IHRoZSBlcnJvciBJDQo+IHdhcw0KPiA+IGFibGUgdG8gZG8gYSAtYyBjbGVhbmFsbCBv
ZiBsaWJ0b29sIGFuZCBraWNrIG9mZiB0aGUgYnVpbGQNCj4gYWdhaW4gb25jZQ0KPiA+IGxpYnRv
b2wtY3Jvc3Mgd2FzIGJ1aWx0IGFuZCBpdCB3b3VsZCBwYXNzLiAgTGlrZXdpc2UgSSBkaWQ6DQo+
ID4NCj4gPiBiaXRiYWtlIGxpYnRvb2wtY3Jvc3MNCj4gPiBiaXRiYWtlIGxpYnRvb2wNCj4gPg0K
PiA+IGFuZCB0aGF0IHdvdWxkIHdvcmsgYnV0IGp1c3QNCj4gPg0KPiA+IGJpdGJha2UgbGlidG9v
bA0KPiA+DQo+ID4gd291bGQgZmFpbC4NCj4gDQo+ICJiaXRiYWtlIGxpYnRvb2wiIHdvcmtzIGhl
cmUgcXVpdGUgY29uc2lzdGVudGx5LiBJIHRoZXJlZm9yZQ0KPiBkb24ndCB3YW50DQo+IHRvIGFk
ZCB0aGlzIGRlcGVuZGVuY3kgdW50aWwgd2UgZmlndXJlIG91dCBleGFjdGx5IHdoYXQgaXMgcmFj
aW5nDQo+IGFnYWluc3Qgd2hhdCBvciBoYXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2Ygd2h5
IHRoaXMgaXMNCj4gZmFpbGluZy4NCj4gU29tZXRoaW5nIGRvZXNuJ3Qgc2VlbSByaWdodCBhcyBp
ZiB5b3VyIHByZW1pc2Ugb2YgYSBtaXNzaW5nDQo+IGRlcGVuZGVuY3kNCj4gaXMgY29ycmVjdCwg
dGhlIGFib3ZlIHdvdWxkbid0IHdvcmsuDQoNClVuZGVyc3Rvb2QuICBMZXQgbWUgbG9vayBjbG9z
ZXIuICBNeSBidWlsZCBzZXR1cCBpcyBhbiBVYnVudHUgMTAuMDQgc3lzdGVtIGFuZCBJJ20gdXNp
bmcgYW4gZXh0ZXJuYWwgQXJhZ28gdG9vbGNoYWluIGFzIHdlbGwuICBPbiBteSBzZXR1cCBJIGNh
biBjb25zaXN0ZW50bHkgY2F1c2UgdGhpcyB0byBmYWlsIGV2ZW4gd2l0aCBhIGxvd2VyIG51bWJl
ciBvZiB0aHJlYWRzLiAgU28gcGVyaGFwcyB0aGUgaXNzdWUgaXMgbm90IHRoZSBsaWJ0b29sLWNy
b3NzIGRlcGVuZGVuY3ksIGJ1dCB0aGF0IGxpYnRvb2wtY3Jvc3MgaXRzZWxmIGZvcmNlcyBzb21l
dGhpbmcgZWxzZSB0byBiZSBidWlsdCBmaXJzdC4gIFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9u
IG9uIHlvdXIgc2V0dXAgYW5kIGNvbmZpcm1hdGlvbiB0aGF0IHlvdSBkbyBub3Qgc2VlIHRoaXMg
aXNzdWUuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KDQo=


