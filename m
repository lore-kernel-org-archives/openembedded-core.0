Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D325A78307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4D0272E2DD;
	Tue, 29 Aug 2017 22:59:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iP92J-TtU-E8; Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 469E42E21C;
	Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 361081A0B1;
	Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B2F11A0B0;
	Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 1D95D31FE;
	Tue, 29 Aug 2017 22:59:36 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 29 Aug 2017 22:59:36 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 29 Aug 2017 22:59:35 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 29 Aug 2017 22:59:36 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Avoid build failures due to setscene errors
Thread-Index: AQHTIQGO5Mo3T+wusUele0wVsAiFUaKbqeAAgAAhuLA=
Date: Tue, 29 Aug 2017 20:59:35 +0000
Message-ID: <70b15633357a418095d460b943d3e994@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Aug 2017 20:59:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWls
dG86YXJtY2N1cmR5QGdtYWlsLmNvbV0NCj4gU2VudDogZGVuIDI5IGF1Z3VzdGkgMjAxNyAyMjoz
OA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBPRSBDb3JlIG1haWxpbmcgbGlzdCA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMC8yXSBBdm9p
ZCBidWlsZCBmYWlsdXJlcyBkdWUgdG8gc2V0c2NlbmUNCj4gZXJyb3JzDQo+IA0KPiBPbiBUdWUs
IEF1ZyAyOSwgMjAxNyBhdCAxOjAwIFBNLCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtq
ZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+ID4gT2NjYXNpb25hbGx5LCB3ZSBzZWUgZXJy
b3JzIG9uIG91ciBhdXRvYnVpbGRlcnMgd2hlcmUgYSBzZXRzY2VuZSB0YXNrDQo+ID4gZmFpbHMg
dG8gcmV0cmlldmUgYSBmaWxlIGZyb20gb3VyIGdsb2JhbCBzc3RhdGUgY2FjaGUuIEl0IHR5cGlj
YWxseQ0KPiA+IGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+ID4NCj4gPiBXQVJOSU5HOiB6
aXAtMy4wLXIyIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmU6IEZhaWxlZCB0byBmZXRjaCBV
UkwNCj4gPiBmaWxlOi8vNjYvc3N0YXRlOnppcDpjb3JlMi02NC1wb2t5LWxpbnV4OjMuMDpyMjpj
b3JlMi02NDozOlwNCj4gPiA2NjgzMmI4YzRlN2JhYmUwZWFjOWQ5NTc5ZDFlMmI2YV9wb3B1bGF0
ZV9zeXNyb290LnRnejtcDQo+ID4gZG93bmxvYWRmaWxlbmFtZT02Ni9zc3RhdGU6emlwOmNvcmUy
LTY0LXBva3ktbGludXg6My4wOnIyOmNvcmUyLQ0KPiA2NDozOlwNCj4gPiA2NjgzMmI4YzRlN2Jh
YmUwZWFjOWQ5NTc5ZDFlMmI2YV9wb3B1bGF0ZV9zeXNyb290LnRneiwgYXR0ZW1wdGluZw0KPiA+
IE1JUlJPUlMgaWYgYXZhaWxhYmxlDQo+ID4gRVJST1I6IHppcC0zLjAtcjIgZG9fcG9wdWxhdGVf
c3lzcm9vdF9zZXRzY2VuZTogRmV0Y2hlciBmYWlsdXJlOg0KPiA+IFVuYWJsZSB0byBmaW5kIGZp
bGUNCj4gPiBmaWxlOi8vNjYvc3N0YXRlOnppcDpjb3JlMi02NC1wb2t5LWxpbnV4OjMuMDpyMjpj
b3JlMi02NDozOlwNCj4gPiA2NjgzMmI4YzRlN2JhYmUwZWFjOWQ5NTc5ZDFlMmI2YV9wb3B1bGF0
ZV9zeXNyb290LnRnejtcDQo+ID4gZG93bmxvYWRmaWxlbmFtZT02Ni9zc3RhdGU6emlwOmNvcmUy
LTY0LXBva3ktbGludXg6My4wOnIyOmNvcmUyLQ0KPiA2NDozOlwNCj4gPiA2NjgzMmI4YzRlN2Jh
YmUwZWFjOWQ5NTc5ZDFlMmI2YV9wb3B1bGF0ZV9zeXNyb290LnRneiBhbnl3aGVyZS4gVGhlDQo+
ID4gcGF0aHMgdGhhdCB3ZXJlIHNlYXJjaGVkIHdlcmU6DQo+ID4gICAgIC9ob21lL3Brai8ub3Bl
bmVtYmVkZGVkL3NzdGF0ZS1jYWNoZQ0KPiANCj4gVG8gdHJpZ2dlciB0aGlzLCBkbyB5b3UgaGF2
ZSBTU1RBVEVfTUlSUk9SUyBwb2ludGluZyB0bw0KPiAiL2hvbWUvcGtqLy5vcGVuZW1iZWRkZWQv
c3N0YXRlLWNhY2hlIiBhbmQgU1NUQVRFX0RJUiBwb2ludGVkDQo+IHNvbWV3aGVyZSBlbHNlPyBP
ciBhcmUgdGhleSBib3RoIHBvaW50aW5nIHRvIHRoZSBzYW1lIGxvY2FsIGRpcmVjdG9yeT8NCj4g
T3Igc29tZXRoaW5nIGVsc2U/DQoNCk5vLCB0aGUgZGlyZWN0b3J5IGFib3ZlIGlzIGFjdHVhbGx5
IHdoYXQgaXMgaW4gU1NUQVRFX0RJUi4gDQpTU1RBVEVfTUlSUk9SUyBpcyBzZXQgdG86DQoNClNT
VEFURV9NSVJST1JTID89ICJcDQpmaWxlOi8vLiogZmlsZTovLy9uL29lL3NzdGF0ZS1jYWNoZS9Q
QVRIO2Rvd25sb2FkZmlsZW5hbWU9UEFUSCINCg0Kd2hlcmUgL24vb2UgaXMgYW4gTkZTIG1vdW50
IHdoZXJlIHdlIHNoYXJlIGEgZ2xvYmFsIHNzdGF0ZSBjYWNoZS4gDQoNClRoZSBvbmx5IHdheSBJ
IGhhdmUgZmlndXJlZCBvdXQgdG8gbWFudWFsbHkgc2ltdWxhdGUgdGhlIHByb2JsZW0gaXMgDQpi
eSBtb2RpZnlpbmcgdGhlIGNvZGUgaW4gc3N0YXRlX2NoZWNraGFzaGVzKCkgaW4gc3N0YXRlLmJi
Y2xhc3MgYW5kIA0KY29tbWVudGluZyBvdXQgdGhlIGNhbGwgdG8gZmV0Y2hlci5jaGVja3N0YXR1
cygpLiBUaGVuIGFzIGxvbmcgYXMgDQp0aGVyZSBhY3R1YWxseSBpcyBubyBzc3RhdGUgZmlsZXMg
Zm9yIHRoZSB0YXNrIGluIGVpdGhlciB0aGUgZ2xvYmFsIA0Kb3IgdGhlIGxvY2FsIHNzdGF0ZSBj
YWNoZSwgSSB3aWxsIGdldCB0aGUgYWJvdmUuIA0KDQpJIGRvIG5vdCBrbm93IHdoYXQgdHJpZ2dl
cnMgaXQgb24gdGhlIGF1dG9idWlsZGVyIHRob3VnaC4gTXkgZ3Vlc3MgaXMgDQp0aGF0IHNvbWVo
b3cgdGhlIHNzdGF0ZSB0Z3ogZmlsZSBkaXNhcHBlYXJzIGJldHdlZW4gdGhlIGNhbGwgdG8gDQpz
c3RhdGVfY2hlY2toYXNoZXMoKSBhbmQgd2hlbiBiaXRiYWtlIGFjdHVhbGx5IHRyaWVzIHRvIGRv
d25sb2FkIHRoZSANCmZpbGUuIA0KDQpXZSBkbyBoYXZlIGEgZGFpbHkgam9iIHRoYXQgY2xlYW5z
IHVwIHRoZSBnbG9iYWwgc3N0YXRlIGNhY2hlIGFuZCANCnJlbW92ZXMgZmlsZXMgdGhhdCBoYXZl
IG5vdCBiZWVuIGFjY2Vzc2VkIGluIHRoZSBsYXN0IHRlbiBkYXlzLCBidXQgDQppdCBzZWVtcyB1
bmxpa2VseSB0aGF0IGl0IHNob3VsZCByZW1vdmUgYSBmaWxlIHRoYXQganVzdCBoYXBwZW5zIHRv
IA0KYmUgcmVxdWlyZWQgYWdhaW4sIGFuZCBkbyBpdCBhdCBleGFjdGx5IHRoZSB0aW1lIHdoZW4g
dGhhdCB0YXNrIGlzIA0KYnVpbGRpbmcuDQoNCj4gPiBFUlJPUjogemlwLTMuMC1yMiBkb19wb3B1
bGF0ZV9zeXNyb290X3NldHNjZW5lOiBObyBzdWl0YWJsZSBzdGFnaW5nDQo+ID4gcGFja2FnZSBm
b3VuZA0KPiA+IFdBUk5JTkc6IFNldHNjZW5lIHRhc2sNCj4gPiAobWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3ppcC96aXBfMy4wLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUpDQo+ID4gZmFp
bGVkIHdpdGggZXhpdCBjb2RlICcxJyAtIHJlYWwgdGFzayB3aWxsIGJlIHJ1biBpbnN0ZWFkDQoN
Ci8vUGV0ZXINCg0K

