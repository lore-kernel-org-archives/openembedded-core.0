Return-Path: <prvs=767f4520c=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id B9C2379609
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1535128881; x=1566664881;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=UZM/ubi3qJFONTiitO8RN5FiOxK05jhGNlFtBHV9Bls=;
	b=a1CaVLgzzZ8D1QCvTimSugusBkC57z5xZmBoDBOzccC35Ni+cMUXy0aV
	UaGbchRJs9NUtNZOu8Y01j3epxdCsZlR/REFR6BYVh3rkhsUCAwvXF5ue
	QWlGcj+Uxzkd+LVeiZ0Y4RNL5Ipa5lxDHsbXSjyuGE65nAAP9ox+jTSVT 8=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Aug 2018 18:41:20 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
	24 Aug 2018 18:41:19 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb2.muc with ESMTP/TLS; 24 Aug 2018 18:41:19 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Fri, 24 Aug 2018 18:41:19 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Fri, 24 Aug 2018 18:41:19 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO7TfP39PtwdlbkOrx+nUTU/G7KTO2KyAgAAHkQCAAAqXAIAAAO8AgAAHMYCAAAHDgIAABOmA
Date: Fri, 24 Aug 2018 16:41:19 +0000
Message-ID: <20180824164118.GM20864@hiutale>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
	<20180824154822.GK20864@hiutale>
	<CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
	<20180824161727.GL20864@hiutale>
	<CAMKF1soK8gJP6NNwX3-7EWESEs11czMpi_qt5HBMJXaRp6tXAw@mail.gmail.com>
In-Reply-To: <CAMKF1soK8gJP6NNwX3-7EWESEs11czMpi_qt5HBMJXaRp6tXAw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.37]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 16:41:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AEED13121DE4E4C9A73D1E93E1B1B67@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDk6MjM6NDVBTSAtMDcwMCwgS2hlbSBSYWogd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDI0LCAyMDE4IGF0IDk6MTcgQU0gPE1pa2tvLlJhcGVsaUBibXcuZGU+
IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDg6NTE6NDJBTSAtMDcw
MCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiBPbiBGcmksIEF1ZyAyNCwgMjAxOCBhdCA4OjQ4IEFN
IDxNaWtrby5SYXBlbGlAYm13LmRlPiB3cm90ZToNCj4gPiA+ID4gU28gdG8gbWUgaXQgbG9va3Mg
bGlrZSB1c2luZyBTWVNURU0gd2l0aCB0YXJnZXRfaW5jbHVkZV9kaXJlY3RvcmllcygpDQo+ID4g
PiA+IGlzIG5vIGxvbmdlciBwb3NzaWJsZSB3aXRoIENNYWtlIGFuZCBnY2MgPiA2Og0KPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBodHRwczovL2NtYWtlLm9yZy9jbWFrZS9oZWxwL3YzLjEwL2Nv
bW1hbmQvdGFyZ2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMuaHRtbD9oaWdobGlnaHQ9dGFyZ2V0X2lu
Y2x1ZGVfZGlyZWN0b3JpZXMNCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGF04oCZcyByaWdodCB0
aGVyZSBpcyBhIHBhdGNoIEkgZGlkICBpbiBXZWJLaXRndGsgcmVjaXBlIGluIE9lIENvcmUgeW91
DQo+ID4gPiBtaWdodCB3YW50IHRvIGluY2x1ZGUgc2ltaWxhciBmaXhlcyBmb3IgdGhpcyBwYWNr
YWdlIHRoZSBwYXRjaCBhY3R1YWxseSBpdA0KPiA+ID4gYSB3b3JrYXJvdW5kIGJ1dCB0aGVuIEkg
YWxzbyB0aGluayB1c2luZyBpc3lzdGVtIGluIGFwcHMgaXMgYSBiYWQgaWRlYQ0KPiA+DQo+ID4g
WWVzLCBJIHRlbmQgdG8gYWdyZWUsIGJ1dCBkZXZlbG9wZXJzIGhhdmUgdXNlZCB0aGlzIHRvIHNp
bGVuY2UgY29tcGlsZXINCj4gPiB3YXJuaW5ncyBmcm9tIHN5c3RlbSBoZWFkZXIgZmlsZXMuDQo+
ID4NCj4gPiBJbiBhIGZldyBjYXNlcyBJIHNhdyB0aGF0IHRoZXJlIHdlcmUgbm8gbG9uZ2VyIGFu
eSB3YXJuaW5ncyBjb21pbmcgZnJvbSB0aGUNCj4gPiBoZWFkZXJzIGJ1dCBpbiBzb21lIG90aGVy
cyB0aGVyZSB3ZXJlLg0KPiA+DQo+IA0KPiBVbmxpa2Ugb2xkZW4gZGF5cywgY3Jvc3MgZ2NjIGNv
bXBpbGVyIG5vdyBhIGRheXMga25vd3MgYWJvdXQgaXRzDQo+IHN5c3RlbSBoZWFkZXJzIGFuZCBh
ZGRzIHRoZW0gaW1wbGljaXRseSB3aXRoIHJpZ2h0IG9wdGlvbnMNCj4gc28gZG9pbmcgdGhpcyBp
bmNsdWRlIGRhbmNlIG1hbnVhbGx5IGlzIG5vdCB1c2VmdWwuIExldCBjb21waWxlcg0KPiBkZWNp
ZGUgdG8gZG8gdGhlIG5lZWRlZA0KPiBmb3Igc3lzdGVtIGhlYWRlcnMsIG9uZSBtdXN0IGp1c3Qg
c3BlY2lmeSAtLXN5c3Jvb3QgYW5kIGxldCBpdCBoYW5kbGUNCj4gZXZlcnl0aGluZyBmcm9tIHN5
c3Jvb3QuDQo+IA0KPiA+IEFueSBvdGhlciBpZGVhcyBob3cgdG8gc3VwcHJlc3MgY29tcGlsZXIg
d2FuaW5ncyBmcm9tIHN5c3RlbSBoZWFkZXJzPw0KPiA+DQo+IA0KPiB3aGF0IGtpbmQgb2Ygd2Fy
bmluZ3MgZG8geW91IHNlZSA/DQoNCkFmdGVyIGEgdG9uIG9mIGNvbXBvbmVudHMgaGF2ZSBleHBv
cnRlZCB0aGVpciBoZWFkZXJzIHRvIHN5c3RlbSBwYXRocywNCkkgc2VlIGFsbCBraW5kcyBvZiBj
cmFwLiBTb21lIGRldmVsb3BlcnMgaGF2ZSBjbGVhbmVkIHVwIHRoZWlyIG93biB0cmVlDQphbmQg
YWRkZWQgc3RyaWN0IGNvbXBpbGVyIGZsYWdzLCB3aGljaCBJIG5vdyBoYXZlIHRvIHJlbGF4IHNp
bmNlDQpoZWFkZXIgZmlsZSB3YXJuaW5nIHN1cHByZXNzaW9ucyBkb24ndCB3b3JrLCBhbmQgbmV3
IGNvbXBpbGVyIHByb2R1Y2VzDQpuZXcgYnVuY2ggb2Ygd2FybmluZ3MuIEhlcmUgYXJlIGZldyBz
YW1wbGUgd2FybmluZ3MgZnJvbSBhbiBvbmdvaW5nIGJ1aWxkDQp3aXRoIGNvdW50cyByZWRhY3Rl
ZDoNCg0KJCBlZ3JlcCAtaG8gIndhcm5pbmc6IC4qIiB0bXAtZ2xpYmMvd29yay8qLyovKi90ZW1w
L2xvZy5kb19jb21waWxlfCBzb3J0IHwgdW5pcSAtY3xzb3J0IC1ybiB8IGhlYWQgLTgNCg0Kd2Fy
bmluZzogZHluYW1pYyBleGNlcHRpb24gc3BlY2lmaWNhdGlvbnMgYXJlIGRlcHJlY2F0ZWQgaW4g
QysrMTEgWy1XZGVwcmVjYXRlZF0NCndhcm5pbmc6ICd0ZW1wbGF0ZTxjbGFzcz4gY2xhc3Mgc3Rk
OjphdXRvX3B0cicgaXMgZGVwcmVjYXRlZCBbLVdkZXByZWNhdGVkLWRlY2xhcmF0aW9uc10NCndh
cm5pbmc6IGNvbnZlcnNpb24gdG8gJ2ludCcgZnJvbSAnbG9uZyB1bnNpZ25lZCBpbnQnIG1heSBh
bHRlciBpdHMgdmFsdWUgWy1XY29udmVyc2lvbl0NCndhcm5pbmc6IG1pc3NlZCBsb29wIG9wdGlt
aXphdGlvbiwgdGhlIGxvb3AgY291bnRlciBtYXkgb3ZlcmZsb3cgWy1XdW5zYWZlLWxvb3Atb3B0
aW1pemF0aW9uc10NCndhcm5pbmc6IGNvbW1hbmQgbGluZSBvcHRpb24gJy1zdGQ9YysrMTEnIGlz
IHZhbGlkIGZvciBDKysvT2JqQysrIGJ1dCBub3QgZm9yIEMNCndhcm5pbmc6IHRoaXMgc3RhdGVt
ZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQ0Kd2FybmluZzog
SVNPIEMrKyBmb3JiaWRzIHplcm8tc2l6ZSBhcnJheSAnZl9oYW5kbGUnIFstV3BlZGFudGljXQ0K
DQotTWlra28=

