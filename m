Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 394B7621CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id EE71311E26;
	Thu, 30 May 2013 09:29:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jVExalC-NlMy; Thu, 30 May 2013 09:29:24 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 1619011E24;
	Thu, 30 May 2013 09:29:23 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C1FAEA72;
	Thu, 30 May 2013 09:29:23 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id B70BE8F5;
	Thu, 30 May 2013 09:29:23 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id B541F3405E;
	Thu, 30 May 2013 09:29:23 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Thu, 30 May 2013 09:29:23 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2013 09:29:23 +0200
Thread-Topic: [OE-core] [PATCH 0/4] Fixes for makedevs
Thread-Index: Ac5ctV2XwezcvCWTQ7qJBc07yTbTrQAUcoXA
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7986359AEE4@xmail3.se.axis.com>
References: <cover.1369839249.git.pkj@axis.com>
	<1369863624.14887.247.camel@ted>
In-Reply-To: <1369863624.14887.247.camel@ted>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fixes for makedevs
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
X-List-Received-Date: Thu, 30 May 2013 07:29:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAyOSBt
YWogMjAxMyAyMzo0MA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIIDAvNF0gRml4ZXMgZm9yIG1ha2VkZXZzDQo+IA0KPiBPbiBXZWQsIDIwMTMtMDUtMjkg
YXQgMTY6NTUgKzAyMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBXaGVuIEkgd2Fu
dGVkIHRvIGNyZWF0ZSBkZXZpY2VzIGZyb20gYSBwYWNrYWdlIEkgc3R1bWJsZWQgdXBvbiBhIGNv
dXBsZQ0KPiA+IG9mIHByb2JsZW1zIHdpdGggdGhlIG1ha2VkZXZzIHByb2dyYW0uIE1vc3Qgbm90
YWJsZSB3YXMgdGhhdCBpdCBmYWlsZWQNCj4gPiB0byBzZXQgdGhlIGNvcnJlY3QgdWlkL2dpZCBm
b3IgZGV2aWNlcyBjcmVhdGVkIGFzIHBhcnQgb2YgYSBibG9jayAoaS5lLiwNCj4gPiB3aXRoIGEg
Y291bnQgPiAwKS4NCj4gPg0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
ZWZiOGE0NjBkMmE5NzdkYmQ0ODFhMDY1MGZiYThlYjYzN2M2NWJlYzoNCj4gPg0KPiA+ICAgcGFj
a2FnZS5iYmNsYXNzOiBGaXggc291cmNlcyBjb250ZW50cyAoMjAxMy0wNS0xNCAwODo1Mjo0NyAr
MDMwMCkNCj4gPg0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Og0K
PiA+DQo+ID4gICBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5LWNvbnRyaWIgcGtqL21h
a2VkZXZzDQo+ID4gICBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC5jZ2kvcG9reS1j
b250cmliL2xvZy8/aD1wa2ovbWFrZWRldnMNCj4gPg0KPiA+IFBldGVyIEtqZWxsZXJzdGVkdCAo
NCk6DQo+ID4gICBtYWtlZGV2czogQ3JlYXRlIGJsb2NrcyBvZiBkZXZpY2VzIHdpdGggdGhlIGNv
cnJlY3QgdWlkL2dpZA0KPiA+ICAgbWFrZWRldnM6IENvcnJlY3QgdGhlIGRldmljZSBudW1iZXIg
Y2FsY3VsYXRpb24gZm9yIGJsb2NrcyBvZiBkZXZpY2VzDQo+ID4gICBtYWtlZGV2czogTWFrZSB0
aGUgbW9kZSBudW1iZXIgcmVhZGFibGUgaW4gZGVidWcgbWVzc2FnZXMNCj4gPiAgIG1ha2VkZXZz
OiBBdm9pZCB1bm5lY2Vzc2FyeSB0aW1lc3RhbXAgY2FsY3VsYXRpb24NCj4gDQo+IFRoZXNlIGxv
b2sgZ29vZCB0byBtZSBidXQgY291bGQgeW91IHB1c2ggYSBicmFuY2ggd2l0aCBzaWduZWQtb2Zm
LWJ5DQo+IGxpbmVzIGluIHRoZSBjb21taXRzIHBsZWFzZT8NCj4gDQo+IENoZWVycywNCj4gDQo+
IFJpY2hhcmQNCg0KSSBoYXZlIHNlbnQgYW4gdXBkYXRlZCBwdWxsIHJlcXVlc3QgdGhhdCBhZGQg
U2lnbmVkLW9mZi1ieSBsaW5lcyBub3cuDQoNCi8vUGV0ZXINCg0K

