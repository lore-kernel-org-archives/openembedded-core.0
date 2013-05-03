Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1UYPgm-0002XN-O3
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 01:47:05 +0200
Received: from NAEMCASHT02.na.leapfrog.com (unknown [10.12.2.36])
	by mx4.leapfrog.com (Postfix) with ESMTP
	id 99BB55EAF; Fri,  3 May 2013 15:57:00 -0700 (PDT)
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0379.000;
	Fri, 3 May 2013 15:56:59 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Custom tasks not running when dependency changes
	version
Thread-Index: Ac5DrIpzedIa/uaVTKO+PfHdmZXrjQEoKXUAAAEKb1A=
Date: Fri, 3 May 2013 22:57:00 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0FE6C9F11D@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0FE6C9AF83@NAEMMAIL01.na.leapfrog.com>
	<1367594760.5379.157.camel@ted>
In-Reply-To: <1367594760.5379.157.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.206.208]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Custom tasks not running when dependency changes version
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
X-List-Received-Date: Fri, 03 May 2013 23:47:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IEZyaWRheSwg
TWF5IDAzLCAyMDEzIDg6MjYgQU0NCj4gVG86IERhbmllbCBMYXp6YXJpDQo+IENjOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gQ3VzdG9tIHRhc2tzIG5vdCBydW5uaW5nIHdoZW4gZGVwZW5kZW5jeSBjaGFuZ2VzDQo+IHZl
cnNpb24NCj4gDQo+IE9uIFN1biwgMjAxMy0wNC0yOCBhdCAwMToxNCArMDAwMCwgRGFuaWVsIExh
enphcmkgd3JvdGU6DQo+ID4gSSd2ZSBnb3QgYSB3ZWlyZCBpc3N1ZSB0aGF0IEkganVzdCBjYW4n
dCBzZWVtIHRvIGZpZ3VyZSBvdXQgYW5kIG5lZWQgc29tZQ0KPiBoZWxwIG9uLiBJbiBvdXIgY3Vz
dG9tIGxheWVyIHdlIGhhdmUgYSBiYmNsYXNzIHRoYXQgaGFzIDIgY3VzdG9tIHRhc2tzLCBsaWtl
DQo+IHNvOg0KPiA+DQo+ID4gYWRkdGFzayBjb21wbGV0ZV9tZXRhZGF0YSBhZnRlciBkb19wYWNr
YWdlIGJlZm9yZSBkb19wYWNrYWdlX3dyaXRlDQo+ID4gYWRkdGFzayBjcmVhdGVfb3RoZXJfcGFj
a2FnZSBhZnRlciBkb19wYWNrYWdlX3dyaXRlIGJlZm9yZSBkb19idWlsZA0KPiA+DQo+ID4gTm93
IHRoaXMgaXMgaW5oZXJpdGVkIGJ5IGEgcmVjaXBlIEIgd2hpY2ggZGVwZW5kcyBvbiByZWNpcGUg
QS4gSWYgSSBidWlsZCBhDQo+IHJvb3RmcyBpbWFnZSwgdGhlbiBjaGFuZ2UgdGhlIHZlcnNpb24g
KFBWKSBvbiByZWNpcGUgQSwgdGhlbiBidWlsZCB0aGUgcm9vdGZzDQo+IGltYWdlIGFnYWluLCBy
ZWNpcGUgQSByZWJ1aWxkcywgdGhlbiByZWNpcGUgQiByZWJ1aWxkcywgYnV0IGl0IHJlYnVpbGRz
IHdpdGhvdXQNCj4gcnVubmluZyBteSBjdXN0b20gdGFza3MuIFRoZXJlJ3MgcHJvYmFibHkgc29t
ZSB0YXNrIGZsYWcgdGhhdCBJIG5lZWQgdG8gc2V0DQo+IHRvIG1ha2UgdGhpcyB3b3JrLCBidXQg
SSBjYW4ndCBmaWd1cmUgb3V0IHdoYXQgaXQgaXMuIEFueSBoZWxwIGlzIGFwcHJlY2lhdGVkLCBh
cw0KPiBhbHdheXMuDQo+ID4NCj4gPiBCVFcsIEknbSBhbGwgdGhlIHdheSBiYWNrIG9uIHRoZSBk
ZW56aWwgYnJhbmNoIGluIGNhc2UgdGhhdCBtYXR0ZXJzLg0KPiANCj4gV2UgaGF2ZSByZWNlbnRs
eSBmb3VuZCBhIGNhY2hlIGlzc3VlIGluIGJpdGJha2Ugd2l0aCByZWdhcmQgdG8gYWRkdGFzaw0K
PiBoYW5kbGluZy4gVGhlIGZpeCBpcyBub3cgaW4gbWFzdGVyOg0KPiANCj4gaHR0cDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD02ZGIyMDI1MzIxMjJiMjEz
YWU2DQo+IGNmY2U5YTQ5YWM5ZmFkMmRiMjBmNQ0KPiANCj4gWW91IGNhbiB3b3JrYXJvdW5kIHRo
aXMgYnkgcmVtb3ZpbmcgdG1wL2NhY2hlLyB0byBlbnN1cmUgYml0YmFrZQ0KPiBjb3JyZWN0bHkg
cmVwYXJzZXMgdGhpbmdzIHdoZW4gaXQgc2hvdWxkLiBJdCBtYXkgYmUgdGhlIHByb2JsZW0geW91
J3JlDQo+IHNlZWluZywgaXQgbWF5IG5vdCBidXQgaXRzIHdvcnRoIGEgdHJ5Li4uDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNClRoaXMgd29ya2VkIHBlcmZlY3RseS4gVGhhbmsgeW91
IHNvIG11Y2ghDQo=


