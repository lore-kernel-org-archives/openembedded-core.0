Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3220E77EA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 06:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 760EE18117;
	Wed, 30 Aug 2017 08:44:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id T8XpIHjA2Qoa; Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 661011826A;
	Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5536C1E09B;
	Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 400241E095;
	Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 347D01FC2;
	Wed, 30 Aug 2017 08:44:36 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 30 Aug 2017 08:44:36 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 30 Aug 2017 08:44:36 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy
	<armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Avoid build failures due to setscene errors
Thread-Index: AQHTIQGO5Mo3T+wusUele0wVsAiFUaKbqeAAgAAhuLD///JggIAAswBw
Date: Wed, 30 Aug 2017 06:44:36 +0000
Message-ID: <5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<1504043397.2175.19.camel@linuxfoundation.org>
In-Reply-To: <1504043397.2175.19.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Wed, 30 Aug 2017 06:44:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBSaWNoYXJk
IFB1cmRpZQ0KPiBTZW50OiBkZW4gMjkgYXVndXN0aSAyMDE3IDIzOjUwDQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IEFuZHJlIE1jQ3VyZHkN
Cj4gPGFybWNjdXJkeUBnbWFpbC5jb20+DQo+IENjOiBPRSBDb3JlIG1haWxpbmcgbGlzdCA8b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0ggMC8yXSBBdm9pZCBidWlsZCBmYWlsdXJlcyBkdWUgdG8gc2V0c2NlbmUN
Cj4gZXJyb3JzDQo+IA0KPiBPbiBUdWUsIDIwMTctMDgtMjkgYXQgMjA6NTkgKzAwMDAsIFBldGVy
IEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWlsdG86YXJtY2N1cmR5QGdtYWlsLmNvbV0NCj4g
PiA+IFNlbnQ6IGRlbiAyOSBhdWd1c3RpIDIwMTcgMjI6MzgNCj4gPiA+IFRvOiBQZXRlciBLamVs
bGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiA+IENjOiBPRSBDb3Jl
IG1haWxpbmcgbGlzdCA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4N
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvMl0gQXZvaWQgYnVpbGQgZmFp
bHVyZXMgZHVlIHRvDQo+ID4gPiBzZXRzY2VuZQ0KPiA+ID4gZXJyb3JzDQo+ID4gPg0KPiA+ID4g
T24gVHVlLCBBdWcgMjksIDIwMTcgYXQgMTowMCBQTSwgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+ID4g
PiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4g
T2NjYXNpb25hbGx5LCB3ZSBzZWUgZXJyb3JzIG9uIG91ciBhdXRvYnVpbGRlcnMgd2hlcmUgYSBz
ZXRzY2VuZQ0KPiA+ID4gPiB0YXNrDQo+ID4gPiA+IGZhaWxzIHRvIHJldHJpZXZlIGEgZmlsZSBm
cm9tIG91ciBnbG9iYWwgc3N0YXRlIGNhY2hlLiBJdA0KPiA+ID4gPiB0eXBpY2FsbHkNCj4gPiA+
ID4gbG9va3Mgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gPiA+ID4NCj4gPiA+ID4gV0FSTklORzog
emlwLTMuMC1yMiBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lOiBGYWlsZWQgdG8gZmV0Y2gN
Cj4gPiA+ID4gVVJMDQo+ID4gPiA+IGZpbGU6Ly82Ni9zc3RhdGU6emlwOmNvcmUyLTY0LXBva3kt
bGludXg6My4wOnIyOmNvcmUyLTY0OjM6XA0KPiA+ID4gPiA2NjgzMmI4YzRlN2JhYmUwZWFjOWQ5
NTc5ZDFlMmI2YV9wb3B1bGF0ZV9zeXNyb290LnRnejtcDQo+ID4gPiA+IGRvd25sb2FkZmlsZW5h
bWU9NjYvc3N0YXRlOnppcDpjb3JlMi02NC1wb2t5LWxpbnV4OjMuMDpyMjpjb3JlMi0NCj4gPiA+
IDY0OjM6XA0KPiA+ID4gPg0KPiA+ID4gPiA2NjgzMmI4YzRlN2JhYmUwZWFjOWQ5NTc5ZDFlMmI2
YV9wb3B1bGF0ZV9zeXNyb290LnRneiwgYXR0ZW1wdGluZw0KPiA+ID4gPiBNSVJST1JTIGlmIGF2
YWlsYWJsZQ0KPiA+ID4gPiBFUlJPUjogemlwLTMuMC1yMiBkb19wb3B1bGF0ZV9zeXNyb290X3Nl
dHNjZW5lOiBGZXRjaGVyIGZhaWx1cmU6DQo+ID4gPiA+IFVuYWJsZSB0byBmaW5kIGZpbGUNCj4g
PiA+ID4gZmlsZTovLzY2L3NzdGF0ZTp6aXA6Y29yZTItNjQtcG9reS1saW51eDozLjA6cjI6Y29y
ZTItNjQ6MzpcDQo+ID4gPiA+IDY2ODMyYjhjNGU3YmFiZTBlYWM5ZDk1NzlkMWUyYjZhX3BvcHVs
YXRlX3N5c3Jvb3QudGd6O1wNCj4gPiA+ID4gZG93bmxvYWRmaWxlbmFtZT02Ni9zc3RhdGU6emlw
OmNvcmUyLTY0LXBva3ktbGludXg6My4wOnIyOmNvcmUyLQ0KPiA+ID4gNjQ6MzpcDQo+ID4gPiA+
DQo+ID4gPiA+IDY2ODMyYjhjNGU3YmFiZTBlYWM5ZDk1NzlkMWUyYjZhX3BvcHVsYXRlX3N5c3Jv
b3QudGd6IGFueXdoZXJlLg0KPiA+ID4gPiBUaGUNCj4gPiA+ID4gcGF0aHMgdGhhdCB3ZXJlIHNl
YXJjaGVkIHdlcmU6DQo+ID4gPiA+IMKgwqDCoMKgL2hvbWUvcGtqLy5vcGVuZW1iZWRkZWQvc3N0
YXRlLWNhY2hlDQo+ID4gPiBUbyB0cmlnZ2VyIHRoaXMsIGRvIHlvdSBoYXZlIFNTVEFURV9NSVJS
T1JTIHBvaW50aW5nIHRvDQo+ID4gPiAiL2hvbWUvcGtqLy5vcGVuZW1iZWRkZWQvc3N0YXRlLWNh
Y2hlIiBhbmQgU1NUQVRFX0RJUiBwb2ludGVkDQo+ID4gPiBzb21ld2hlcmUgZWxzZT8gT3IgYXJl
IHRoZXkgYm90aCBwb2ludGluZyB0byB0aGUgc2FtZSBsb2NhbA0KPiA+ID4gZGlyZWN0b3J5Pw0K
PiA+ID4gT3Igc29tZXRoaW5nIGVsc2U/DQo+ID4gTm8sIHRoZSBkaXJlY3RvcnkgYWJvdmUgaXMg
YWN0dWFsbHkgd2hhdCBpcyBpbiBTU1RBVEVfRElSLg0KPiA+IFNTVEFURV9NSVJST1JTIGlzIHNl
dCB0bzoNCj4gPg0KPiA+IFNTVEFURV9NSVJST1JTID89ICJcDQo+ID4gZmlsZTovLy4qIGZpbGU6
Ly8vbi9vZS9zc3RhdGUtY2FjaGUvUEFUSDtkb3dubG9hZGZpbGVuYW1lPVBBVEgiDQo+ID4NCj4g
PiB3aGVyZSAvbi9vZSBpcyBhbiBORlMgbW91bnQgd2hlcmUgd2Ugc2hhcmUgYSBnbG9iYWwgc3N0
YXRlIGNhY2hlLg0KPiA+DQo+ID4gVGhlIG9ubHkgd2F5IEkgaGF2ZSBmaWd1cmVkIG91dCB0byBt
YW51YWxseSBzaW11bGF0ZSB0aGUgcHJvYmxlbSBpcw0KPiA+IGJ5IG1vZGlmeWluZyB0aGUgY29k
ZSBpbiBzc3RhdGVfY2hlY2toYXNoZXMoKSBpbiBzc3RhdGUuYmJjbGFzcyBhbmQNCj4gPiBjb21t
ZW50aW5nIG91dCB0aGUgY2FsbCB0byBmZXRjaGVyLmNoZWNrc3RhdHVzKCkuIFRoZW4gYXMgbG9u
ZyBhcw0KPiA+IHRoZXJlIGFjdHVhbGx5IGlzIG5vIHNzdGF0ZSBmaWxlcyBmb3IgdGhlIHRhc2sg
aW4gZWl0aGVyIHRoZSBnbG9iYWwNCj4gPiBvciB0aGUgbG9jYWwgc3N0YXRlIGNhY2hlLCBJIHdp
bGwgZ2V0IHRoZSBhYm92ZS4NCj4gPg0KPiA+IEkgZG8gbm90IGtub3cgd2hhdCB0cmlnZ2VycyBp
dCBvbiB0aGUgYXV0b2J1aWxkZXIgdGhvdWdoLiBNeSBndWVzcw0KPiA+IGlzDQo+ID4gdGhhdCBz
b21laG93IHRoZSBzc3RhdGUgdGd6IGZpbGUgZGlzYXBwZWFycyBiZXR3ZWVuIHRoZSBjYWxsIHRv
DQo+ID4gc3N0YXRlX2NoZWNraGFzaGVzKCkgYW5kIHdoZW4gYml0YmFrZSBhY3R1YWxseSB0cmll
cyB0byBkb3dubG9hZCB0aGUNCj4gPiBmaWxlLg0KPiA+DQo+ID4gV2UgZG8gaGF2ZSBhIGRhaWx5
IGpvYiB0aGF0IGNsZWFucyB1cCB0aGUgZ2xvYmFsIHNzdGF0ZSBjYWNoZSBhbmQNCj4gPiByZW1v
dmVzIGZpbGVzIHRoYXQgaGF2ZSBub3QgYmVlbiBhY2Nlc3NlZCBpbiB0aGUgbGFzdCB0ZW4gZGF5
cywgYnV0DQo+ID4gaXQgc2VlbXMgdW5saWtlbHkgdGhhdCBpdCBzaG91bGQgcmVtb3ZlIGEgZmls
ZSB0aGF0IGp1c3QgaGFwcGVucyB0bw0KPiA+IGJlIHJlcXVpcmVkIGFnYWluLCBhbmQgZG8gaXQg
YXQgZXhhY3RseSB0aGUgdGltZSB3aGVuIHRoYXQgdGFzayBpcw0KPiA+IGJ1aWxkaW5nLg0KPiAN
Cj4gSSBoYXZlIGxlZnQgdGhpcyBjb2RlIGFzIGFuIGVycm9yIGRlbGliZXJhdGVseSBhcyB0aGlz
IGtpbmQgb2YgdGhpbmcNCj4gc2hvdWxkIG5vdCBoYXBwZW4gYW5kIGlmIGl0IGRvZXMsIHRoZXJl
IGlzIHJlYWxseSBzb21ldGhpbmcgd3Jvbmcgd2hpY2gNCj4geW91IG5lZWQgdG8gZmlndXJlIG91
dC4gSXQgbWVhbnMgdGhhdCBhdCBvbmUgcG9pbnQgYml0YmFrZSB0aGlua3MgdGhlDQo+IHNzdGF0
ZSBpcyBwcmVzZW50IGFuZCB2YWxpZCwgdGhlbiBsYXRlciBpdCBpc24ndC4NCg0KVHJ1ZSwgYnV0
IHNpbmNlIHRoZSBvcGVyYXRpb25zIG9mIGNoZWNraW5nIGlmIGFuIHNzdGF0ZSBmaWxlIGV4aXN0
cyBhbmQgDQpyZXRyaWV2aW5nIGl0IGlzIG5vdCBhbiBhdG9taWMgb3BlcmF0aW9uLCB0aGVyZSBh
cmUgYWx3YXlzIHByb2JsZW1zIHRoYXQgDQpjYW4gb2NjdXIuIFNvbWUgbWF5IGJlIGZpeGFibGUs
IHNvbWUgbWF5IG5vdC4gSG93ZXZlciwgdXNpbmcgYSBidWlsZCANCmZhaWx1cmUgdG8gZGV0ZWN0
IHRoZXNlIGtpbmQgb2YgcHJvYmxlbXMgaXMgYSBiaXQgaGFyc2ggb24gdGhlIGRldmVsb3BlcnMg
DQp3aG8gb25seSBzZWVzIHRoZWlyIGJ1aWxkcyBjb21wbGV0ZSBvbmx5IHRvIGdldCBhbiBlcnJv
ciBmb3Igc29tZXRoaW5nIA0KdGhhdCBpcyBub3QgdGhlaXIgZmF1bHQuIFdlIGhhdmUgYmV0dGVy
IHdheXMgdG8gZGV0ZWN0IHRoZXNlIGtpbmRzIG9mIA0KcHJvYmxlbXMsIGUuZy4sIHRocm91Z2gg
bG9nIG1vbml0b3JpbmcsIHdpdGhvdXQgaGF2aW5nIHRvIGNhdXNlIA0KdW5uZWNlc3NhcnkgZ3Jp
ZWYgYW1vbmdzdCB0aGUgZGV2ZWxvcGVycy4NCg0KPiBJJ20gbm90IGNvbnZpbmNlZCBwYXRjaGlu
ZyBvdXQgdGhlIGVycm9ycyBpcyB0aGUgcmlnaHQgc29sdXRpb24gaGVyZS4uLg0KDQpIb3cgYWJv
dXQgSSBtYWtlIGl0IGNvbmRpdGlvbmFsIGJ5IGFkZGluZyBhbiBJR05PUkVfU0VUU0NFTkVfRVJS
T1JTPyANClRoYXQgd2F5IGl0IGNhbiBkZWZhdWx0IHRvICIwIiwgYnV0IHdlIGNhbiBzZXQgaXQg
dG8gIjEiIHRvIHByaW9yaXRpemUgDQp0aGUgcHJvZHVjdGlvbiBidWlsZHMuDQoNCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

