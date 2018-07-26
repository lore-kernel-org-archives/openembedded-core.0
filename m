Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC7078C61
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EC0CE184A9;
	Thu, 26 Jul 2018 22:12:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sKiNZQ6wj1JG; Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id CC5551858C;
	Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAA261A088;
	Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E69A1A084;
	Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 93EE01E1D;
	Thu, 26 Jul 2018 22:12:54 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 22:12:54 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 22:12:54 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 26 Jul 2018 22:12:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jonathan Haigh
	<Jonathan.Haigh@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] INCOMPATIBLE_LICENSE mechanism
Thread-Index: AQHUH2P1ipMkerX65UWFRjBAEJC/rqSWocT7gArf4mCAABVkgIAAYq6Q
Date: Thu, 26 Jul 2018 20:12:54 +0000
Message-ID: <2fcd0418277142e3a96b4be407f4710d@XBOX02.axis.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<d7450c2b26f644358476ea6ec27717b6@XBOX02.axis.com>
	<c8b63914e60f12cb57f569199f82390cbd069931.camel@linuxfoundation.org>
In-Reply-To: <c8b63914e60f12cb57f569199f82390cbd069931.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Thu, 26 Jul 2018 20:12:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0K
PiBTZW50OiBkZW4gMjYganVsaSAyMDE4IDE4OjE0DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQg
PHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IEpvbmF0aGFuIEhhaWdoDQo+IDxKb25hdGhh
bi5IYWlnaEBhcm0uY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBDYzogSmVyZW15IEpvaG5zb24gPEplcmVteS5Kb2huc29uQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdIElOQ09NUEFUSUJMRV9MSUNFTlNFIG1lY2hhbmlz
bQ0KPiANCj4gT24gVGh1LCAyMDE4LTA3LTI2IGF0IDEzOjE2ICswMDAwLCBQZXRlciBLamVsbGVy
c3RlZHQgd3JvdGU6DQo+ID4gVGhpcyBpcyByZWxhdGVkIHRvIGEgc2ltaWxhciBwcm9ibGVtIHdl
IGFyZSBzZWVpbmcgd2l0aCB0aGUgdXNlIG9mDQo+ID4g4oCcb3LigJ0gZm9yIGxpY2Vuc2VzLiBX
ZSB1c2UgdGhlIGFyY2hpdmVyLmJiY2xhc3MgdG8gZXhwb3J0IGFsbCBvcGVuDQo+ID4gc291cmNl
IGNvZGUgd2UgdXNlLiBIb3dldmVyLCBmb3IgcmVjaXBlcyB0aGF0IHNwZWNpZnkgbXVsdGlwbGUN
Cj4gPiBsaWNlbnNlcyB1c2luZyDigJxvcuKAnSwgd2Ugd291bGQgbGlrZSB0byBzcGVjaWZ5IHRo
ZSBvbmUgdW5kZXIgd2hpY2ggd2UNCj4gPiBhcmUgdXNpbmcgdGhlIGNvZGUuIEUuZy4sIGlmIHRo
ZSBMSUNFTlNFIGlzIOKAnEdQTC0yLjAgfCBQcm9wcmlldGFyeeKAnSwNCj4gPiB3ZSB3b3VsZCBs
aWtlIHRvIHRyZWF0IHRoZSBjb2RlIGFzIOKAnFByb3ByaWV0YXJ54oCdLCBidXQgd2hlbiBpdCBj
b21lcw0KPiA+IHRvIHRoZSBhcmNoaXZlci5iYmNsYXNzLCBldmVuIGlmIHdlIGhhdmUgdG9sZCBp
dCB0byBpZ25vcmUgcGFja2FnZXMNCj4gPiB3aXRoIFByb3ByaWV0YXJ5IGxpY2Vuc2VzLCBpdCB3
aWxsIGluY2x1ZGUgdGhlIHBhY2thZ2UgZHVlIHRvIHRoZQ0KPiA+IGFsdGVybmF0aXZlIEdQTC0y
LjAgbGljZW5zZS4NCj4gPg0KPiA+IFRoZSBpZGVhIHdlIGhhdmUgaXMgdG8gYWxsb3cgdG8gc3Bl
Y2lmeSBhIFVTRURfTElDRU5TRSAoZS5nLiwgaW4gYQ0KPiA+IGJiYXBwZW5kIG9yIGEgc2VwYXJh
dGUgY29uZmlndXJhdGlvbiBmaWxlKSwgd2hpY2ggc2hvdWxkIHRha2UgdGhlDQo+ID4gYWN0dWFs
bHkgdXNlZCBsaWNlbnNlLiBUaGlzIHNob3VsZCBiZSB2ZXJpZmllZCB0byBiZSBvbmUgb2YgdGhl
DQo+ID4gYWxsb3dlZCBsaWNlbnNlcyBzcGVjaWZpZWQgaW4gTElDRU5TRSAoaW4gY2FzZSBMSUNF
TlNFIGNoYW5nZXMgYW5kIG5vDQo+ID4gbG9uZ2VyIGFsbG93cyB0aGUgY2hvc2VuIGxpY2Vuc2Up
LCBhbmQgYWZ0ZXIgdGhhdCwgTElDRU5TRSBzaG91bGQgYmUNCj4gPiB0cmVhdGVkIGFzIGlmIHRo
aXMgd2FzIHRoZSB2YWx1ZSBpdCBoYWQgYmVlbiBnaXZlbi4gVGhpcyBkb2VzLA0KPiA+IGhvd2V2
ZXIsICBub3QgdGFrZSBpbnRvIGFjY291bnQgdGhlIHVzZSBvZiB0aGUgc2FtZSBwYWNrYWdlIGlu
DQo+ID4gbXVsdGlwbGUgaW1hZ2VzIHdpdGggZGlmZmVyZW50IGxpY2Vuc2luZyByZXF1aXJlbWVu
dHMgKHdlIG9ubHkgYnVpbGQNCj4gPiBvbmUgaW1hZ2Ugc28gdGhhdCBpcyBub3QgYSBwcm9ibGVt
IGZvciB1cykuDQo+IA0KPiBKdXN0IHRoaW5raW5nIG91dCBsb3VkIHlvdSBjb3VsZCBoYXZlIHNv
bWV0aGluZyBsaWtlIGENCj4gDQo+IGdwbHYzLWxpY2Vuc2UtaW5jb21wYXRpYmxlLmluYzoNCj4g
DQo+IExJQ0VOU0VfcG4tPHNvbWUtcmVjaXBlPiA9ICJNSVQiDQo+IExJQ0VOU0VfcG4tPHNvbWUt
LW90aGVyLXJlY2lwZT4gPSAiR1BMdjIiDQo+IElOQ09NUEFUSUJMRV9MSUNFTlNFID0gIkdQTHYz
Ig0KPiANCj4gaS5lLiBqdXN0IGZvcmNlIHRoZSBsaWNlbnNlIG9mIGEgc2V0IG9mIHJlY2lwZXMg
dG8gdmFsdWVzIGtub3duIHRvIHdvcmsNCj4gIHdpdGggR1BMdjMgZXhjbHVzaW9uPw0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpZZXMsIEkga25vdy4gSG93ZXZlciwgdGhlIGlkZWEg
d2l0aCBVU0VEX0xJQ0VOU0Ugd2FzIHRoZSB2YWxpZGF0aW9uLCB0aGF0IGl0IA0KY29udGFpbnMg
b25lIG9mIHRoZSBhbGxvd2VkIGxpY2Vuc2VzIGxpc3RlZCBpbiBMSUNFTlNFLiBJLmUuLCBpZiBM
SUNFTlNFIGlzIA0KY2hhbmdlZCBhbmQgdGhlIFVTRURfTElDRU5TRSBubyBsb25nZXIgdmFsaWRh
dGVzLCB0aGVuIHRoZXJlIHdvdWxkIGJlIGEgYnVpbGQgDQplcnJvci4gV2l0aG91dCB0aGlzLCBp
ZiB3ZSBzZXQgTElDRU5TRSBhcyBwZXIgYWJvdmUsIGFuZCB0aGUgYWN0dWFsIGxpY2Vuc2luZyAN
CmNoYW5nZXMsIHRoZXJlIGlzIGEgZ3JlYXQgcmlzayB0aGF0IHdlIGRvIG5vdCBub3RpY2UgdGhp
cyBhbmQgY29udGludWVzIHRvIA0KdXNlIHRoZSBjb2RlIGFzIHBlciB0aGUgb2xkIGxpY2Vuc2Uu
DQoNCi8vUGV0ZXINCg0K

