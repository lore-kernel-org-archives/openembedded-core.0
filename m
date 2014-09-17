Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 454CE71492
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 10:11:09 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Wed, 17 Sep 2014 12:11:08 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>, "rongqing.li@windriver.com"
	<rongqing.li@windriver.com>
Thread-Topic: [OE-core] [PATCH] kmod: remove the setting of
	INHIBIT_PACKAGE_STRIP
Thread-Index: AQHP0L7eHbp0T3QBgUW2kEz6bBqpYJwCILEAgAL1oVA=
Date: Wed, 17 Sep 2014 10:11:07 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428AC2289@SESTOEX04.enea.se>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZd_5dYP7sc-umCev+rzU_YzGNLWUq6o0Y0ZK9b6ayB3g@mail.gmail.com>
In-Reply-To: <CAJTo0LZd_5dYP7sc-umCev+rzU_YzGNLWUq6o0Y0ZK9b6ayB3g@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Wed, 17 Sep 2014 10:11:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3Mg
W21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVy
IDE1LCAyMDE0IDE3OjMyDQo+IFRvOiByb25ncWluZy5saUB3aW5kcml2ZXIuY29tDQo+IENjOiBP
RS1jb3JlOyBUdWRvciBGbG9yZWENCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGtt
b2Q6IHJlbW92ZSB0aGUgc2V0dGluZyBvZg0KPiBJTkhJQklUX1BBQ0tBR0VfU1RSSVANCj4gDQo+
IE9uIDE1IFNlcHRlbWJlciAyMDE0IDA5OjI3LCAgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+
IHdyb3RlOg0KPiA+IEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4g
Pg0KPiA+IFNldHRpbmcgSU5ISUJJVF9QQUNLQUdFX1NUUklQIGlzIGFkZGVkIGJ5IDYxY2I0NTg2
OWNba21vZDogcHRlc3QNCj4gZml4ZXNdLCBidXQgSQ0KPiA+IGNhbiBub3QgcmVwcm9kdWNlIHRo
ZSBkZXNjcmliZWQgaXNzdWUsIGFuZCBzZWVtcyBpdCBtYWtlIHdyb25nIGxvZ2ljYWwgWw0KPiA+
IHdoZW4gZW5hYmxlIHB0ZXN0LCBJTkhJQklUX1BBQ0tBR0VfU1RSSVAgaXMgYWx3YXlzIDE7IGFu
ZCB3aGVuIGRpc2FibGUNCj4gcHRlc3QsDQo+ID4gSU5ISUJJVF9QQUNLQUdFX1NUUklQIGlzIGFs
d2F5cyAwXQ0KPiA+DQo+ID4gQ2M6IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29t
Pg0KPiANCj4gQXMgVHVkb3IgYWRkZWQgdGhpcyBJJ2QgbG92ZSB0byBoZWFyIGZyb20gdGhlbSBh
Ym91dCB0aGlzLCBidXQgSSBjYW4NCj4gY29uZmlybSB0aGF0IHRoaXMgcGF0Y2ggZG9lc24ndCBj
YXVzZSB3YXJuaW5ncyB3aXRoIHB0ZXN0IGVuYWJsZWQuDQo+IA0KW1R1ZG9yIEZsb3JlYV0gSXQg
aXMgaGFyZCB0byByZW1lbWJlciB0aGUgZXhhY3QgcmF0aW9uYWxlIGF0IHRoaXMgbW9tZW50IHRo
YXQgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIHNlbGYtZXhwbGFuYXRvcnk6DQoiU2luY2Uga21vZCB0
ZXN0IGZpbGVzIGNvbnRhaW4ga2VybmVsIG1vZHVsZXMgZm9yIG1hbnkgZGlmZmVyZW50IGFyY2hp
dGVjdHVyZXMsIHN0cmlwIGFuZCBhcmNoIGdldHMgY29uZnVzZWQgYW5kIHRocm93cyBlcnJvcnMi
DQpJdCBtZWFucyBub3RoaW5nIGlmIGEgc3BlY2lmaWMgcGxhdGZvcm0gZG9lc24ndCBleGhpYml0
IHRoZSBiZWhhdmlvci4gS21vZCBwdGVzdCBhdHRlbXB0cyB0byBsb2FkIGEgcHJlY29tcGlsZWQg
KGFuZCB1bnN0cmlwcGVkIGZvciB0aGF0IG1hdHRlcikgaW5hcHByb3ByaWF0ZSBtb2R1bGUgYW5k
IHZlcmlmeSB0aGlzIGlzIG5vdCBwb3NzaWJsZS4gSSBzdGlsbCB0aGluayB3ZSBzaG91bGQgbm90
IHJlbW92ZSB0aGUgbGluZSAoZS5nLiB3ZSBzaG91bGQgbm90IGFsdGVyIGttb2QgcHJlY29tcGls
ZWQgbW9kdWxlcyBmcm9tIHB0ZXN0KS4NCg0KUmVnYXJkcywNCiAgVHVkb3IuDQoNCj4gUm9zcw0K

