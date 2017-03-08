Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5847785D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 09:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D6FF22E4ED;
	Wed,  8 Mar 2017 10:34:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3XpPxUiRj0Fk; Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id A6F242E177;
	Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94AAF1E083;
	Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89B321E060;
	Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 7DB30766;
	Wed,  8 Mar 2017 10:34:30 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 8 Mar 2017 10:34:30 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 8 Mar 2017 10:34:30 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 8 Mar 2017 10:34:30 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] recipes: Move out stale GPLv2 versions to a
	seperate layer
Thread-Index: AQHSl3AHY/z7o+zpl0OVdUdpcMOj7KGKqrDg
Date: Wed, 8 Mar 2017 09:34:30 +0000
Message-ID: <08203c70694442b388883c73d7f160b0@XBOX02.axis.com>
References: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Move out stale GPLv2 versions to a	seperate layer
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
X-List-Received-Date: Wed, 08 Mar 2017 09:34:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBSaWNoYXJk
IFB1cmRpZQ0KPiBTZW50OiBkZW4gNyBtYXJzIDIwMTcgMTk6MjMNCj4gVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRD
SF0gcmVjaXBlczogTW92ZSBvdXQgc3RhbGUgR1BMdjIgdmVyc2lvbnMgdG8gYQ0KPiBzZXBlcmF0
ZSBsYXllcg0KPiANCj4gVGhlc2UgYXJlIHJlY2lwZXMgd2hlcmUgdGhlIHVwc3RyZWFtIGhhcyBt
b3ZlZCB0byBHUEx2MyBhbmQgdGhlc2Ugb2xkDQo+IHZlcnNpb25zIGFyZSB0aGUgbGFzdCBvbmVz
IHVuZGVyIHRoZSBHUEx2MiBsaWNlbnNlLg0KPiANCj4gVGhlcmUgYXJlIHNldmVyYWwgcmVhc29u
cyBmb3IgbWFraW5nIHRoaXMgbW92ZS4gVGhlcmUgaXMgYSBkaWZmZXJlbnQNCj4gcXVhbGl0eSBv
ZiBzZXJ2aWNlIHdpdGggdGhlc2UgcmVjaXBlcyBpbiB0aGF0IHRoZXkgZG9uJ3QgZ2V0IHNlY3Vy
aXR5DQo+IGZpeGVzIGFuZCB1cHN0cmVhbSBubyBsb25nZXIgY2FyZSBhYm91dCB0aGVtLCBpbiBm
YWN0IHRoZXkncmUgYWN0aXZlbHkNCj4gaG9zdGlsZSBhZ2FpbnN0IHBlb3BsZSB1c2luZyBvbGQg
dmVyc2lvbnMuIFRoZSByZWNpcGVzIHRlbmQgdG8gbmVlZCBhDQo+IGRpZmZlcmVudCBraW5kIG9m
IG1haW50ZW5hbmNlIHRvIHdvcmsgd2l0aCBjaGFuZ2VzIGluIHRoZSB3aWRlciBlY29zeXN0ZW0N
Cj4gYW5kIHRoZXJlIG5lZWRzIHRvIGJlIGlzb2xhdGlvbiBiZXR3ZWVuIGNoYW5nZXMgbWFkZSBp
biB0aGUgdjMgdmVyc2lvbnMNCj4gYW5kIHRob3NlIGluIHRoZSB2MiB2ZXJzaW9ucy4NCj4gDQo+
IFRoZXJlIGFyZSBwcm9iYWJseSBiZXR0ZXIgd2F5cyB0byBoYW5kbGUgYSAibm9uLUdQTHYzIiBz
eXN0ZW0gYnV0IHJpZ2h0DQo+IG5vdyBoYXZpbmcgdGhlc2UgaW4gT0UtQ29yZSBtYWtlcyB0aGVt
IGxvb2sgbGlrZSBhIGZpcnN0IGNsYXNzIGNpdGl6ZW4NCj4gd2hlbiBJIGJlbGlldmUgdGhleSBo
YXZlIHBvdGVudGlhbCBmb3IgYSB2YXJpZXR5IG9mIHVuZGVzaXJlYWJsZQ0KPiBpc3N1ZXMuDQo+
IA0KPiBNb3ZpbmcgdGhlbSBpbnRvIGEgc2VwYXJhdGUgbGF5ZXIgbWFrZXMgdGhlaXIgZGlmZmVy
ZW50IG5lZWRzIGNsZWFyZXIsIGl0DQo+IGFsc28gbWFrZXMgaXQgY2xlYXIgaG93IG1hbnkgb2Yg
dGhlc2UgdGhlcmUgYXJlLiBTb21lIGFyZSBwcm9iYWJseSBub3QNCj4gbmVlZGVkIChlLmcuIG1j
KSwgSSBhbHNvIHdvbmRlciB3aGV0aGVyIHNvbWUgYXJlIHVzZWZ1bCAoZS5nLiBnbXApDQo+IHNp
bmNlIG1vc3QgdGhpbmdzIHRoYXQgdXNlIHRoZW0gYXJlIEdQTHYzIG9ubHkgYWxyZWFkeS4gU29t
ZW9uZSBjb3VsZA0KPiBub3cgbW9yZSBjbGVhcmx5IHNlZSBob3cgdG8gc3RyZWFtbGluZSB0aGUg
bGlzdCBvZiByZWNpcGVzIGhlcmUuDQo+IA0KPiBJJ20gcHJvcG9zaW5nIHdlIG1tb3ZlIHRvIHRo
aXMgc2VwYXJhdGUgbGF5ZXIgZm9yIDIuMyB3aXRoIGl0cyBmdXR1cmUNCj4gbWFpbnRpbmVyc2hp
cCBhbmQgdGVzdGluZyB0byBiZSBkZXRlcm1pbmVkIGluIDIuNCBhbmQgYmV5b25kLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQoNClNpbmNlIHRoaXMgaGFzIG5vdyBiZWVuIGludGVncmF0ZWQsIGFubm91bmNp
bmcgd2hlcmUgdG8gZmluZCB0aGUgbmV3IA0KbGF5ZXIgbWlnaHQgaGF2ZSBiZWVuIGEgZ29vZCBp
ZGVhLCBhcyBpdCBpcyBubyBsb25nZXIgcGFydCBvZiBQb2t5Lg0KDQpGb3IgdGhlIHJlY29yZCwg
dGhlIG5ldyBsYXllciBjYW4gYmUgZm91bmQgaGVyZToNCg0KaHR0cDovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1ncGx2Mi8NCg0KWW91IHByb2JhYmx5IGFsc28gd2Fu
dCB0byB1cGRhdGUgdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBsYXllciBzbyANCnRoYXQgaXQg
YXBwZWFycyBjb3JyZWN0bHkgb24gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnLw0KDQpBbmQg
dGhlIGxheWVyIHNob3VsZCBiZSBhZGRlZCB0byB0aGUgbGF5ZXIgaW5kZXguLi4NCg0KLy9QZXRl
cg0KDQo=

