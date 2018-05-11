Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94F637554F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 10:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9E29F1852C;
	Fri, 11 May 2018 12:39:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id vbI-yPDWOldi; Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9B0961839E;
	Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 766061E075;
	Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69DE81E06E;
	Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 5D3252DBD;
	Fri, 11 May 2018 12:39:51 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 11 May 2018 12:39:51 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 11 May 2018 12:39:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] rpm: Assume a max limit of 1024 open files
Thread-Index: AQHT6K1WK3BCBYiTIkGP09RKNFM8j6Qp4xkAgABeXdA=
Date: Fri, 11 May 2018 10:39:51 +0000
Message-ID: <ad98467799e844e8a8055ab4d2808ba4@XBOX02.axis.com>
References: <cover.1525990692.git.pkj@axis.com>
	<fc21a364b6714e86743cc14e43e278328f9b39ea.1525990692.git.pkj@axis.com>
	<e41c1a9f-60e1-a8b7-76d9-9af324866a33@linux.intel.com>
In-Reply-To: <e41c1a9f-60e1-a8b7-76d9-9af324866a33@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/2] rpm: Assume a max limit of 1024 open files
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
X-List-Received-Date: Fri, 11 May 2018 10:39:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBb
bWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbV0NCj4gU2VudDogZGVuIDEx
IG1haiAyMDE4IDA3OjQ0DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJz
dGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvMl0gcnBtOiBBc3N1bWUgYSBt
YXggbGltaXQgb2YgMTAyNCBvcGVuDQo+IGZpbGVzDQo+IA0KPiBPbiAwNS8xMS8yMDE4IDAxOjIw
IEFNLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gSWYgc3lzY29uZihfU0NfT1BFTl9N
QVgpIGlzIG11Y2ggZ3JlYXRlciB0aGFuIHRoZSB1c3VhbCAxMDI0IChmb3INCj4gPiBleGFtcGxl
IGluc2lkZSBhIERvY2tlciBjb250YWluZXIpLCB0aGUgcGVyZm9ybWFuY2UgZHJvcHMgc2hhcnBs
eS4NCj4gDQo+IFBsZWFzZSBkbyBub3QgZHJvcCB0aGUgbGluayB0byB0aGUgdXBzdHJlYW0gYnVn
IHdoZW4gcmVwbGFjaW5nIG9uZQ0KPiBwYXRjaCB3aXRoIGFub3RoZXIuDQoNClJpZ2h0LCBmb3Jn
b3QgYWJvdXQgdGhhdC4NCg0KPiBZb3UgY2FuIGFsc28gc2ltcGx5IGFtZW5kIG15IHBhdGNoIGFu
ZCBhZGQgeW91ciBTT0IuDQoNCldlbGwsIEkgdGhvdWdodCBpdCB3YXMgbW9yZSBjbGVhciB0aGlz
IHdheSwgc2luY2UgeW91ciBwYXRjaCByZW1vdmVkIA0KdGhlIGZ1bmN0aW9uYWxpdHkgdGhhdCBj
bG9zZWQgdGhlIGZpbGVzLCB3aGVyZWFzIG1pbmUgbW9kaWZpZXMgaXQuDQoNCj4gQWxzbywgd2h5
IGFzc3VtZSBzcGVjaWZpY2FsbHkgMTAyND8gV2UgZWl0aGVyIG5lZWQgdG8gY2xvc2UgYWxsIHRo
ZQ0KPiBvcGVuIGZpbGVzLCBvciBub25lLCBhbmQgeW91ciBwYXRjaCBjcmVhdGVzIGEgc2l0dWF0
aW9uIHdoZXJlIG9ubHkgDQo+IHNvbWUgb2YgdGhlIGZpbGVzIG1heSBiZSBjbG9zZWQuIEknZCBz
YXkgd2Ugc2hvdWxkIGRyb3AgdGhvc2UgdHdvIA0KPiBjb2RlIHNuaXBwZXRzIGFsdG9nZXRoZXIg
aW5zdGVhZCBvZiBoYXJkY29kaW5nIDEwMjQgaW50byB0aGVtLg0KDQpXZWxsLCBteSBleHBlY3Rh
dGlvbiB3YXMgdGhhdCB0aGVyZSBpcyBhIHJlYXNvbiB0aGF0IHRoZXkgd2FudCB0byBtYWtlIA0K
c3VyZSB0aGF0IGFsbCBvcGVuIGZpbGUgZGVzY3JpcHRvcnMgaGF2ZSBGRF9DTE9FWEVDIHNldCBz
byB0aGF0IHRoZXkgDQphcmUgY2xvc2VkIHdoZW4gZm9ya2luZy4gQXQgdGhlIHNhbWUgdGltZSBJ
IGRvbid0IGFzc3VtZSBycG0gdG8gYWN0dWFsbHkgDQpoYXZlIG1vcmUgdGhhbiAxMDI0IGZpbGVz
IG9wZW4gYXQgb25lIHRpbWUsIHNvIGV2ZW4gaWYgdXNpbmcgDQpzeXNjb25mKF9TQ19PUEVOX01B
WCkgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCB1c2luZyAxMDI0IHNob3VsZCB3b3JrIA0KaW4g
cHJhY3RpY2UuDQoNCkhvd2V2ZXIsIEkgZ2F2ZSB0aGlzIHNvbWUgbW9yZSB0aG91Z2h0LCBhbmQg
bWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIA0KbGV0IGJpdGJha2Ugc2V0IHRoZSBzb2Z0IGxp
bWl0IGZvciBtYXggb3BlbiBmaWxlcyB0bywgZS5nLiwgMTAyNC4gVGhhdCANCndheSB3ZSB3b3Vs
ZCBub3QgbmVlZCB0byBtb2RpZnkgdGhlIGNvZGUgaW4gcnBtIGFzIGl0IHdvdWxkIGFkYXB0IGl0
c2VsZiANCmF1dG9tYXRpY2FsbHkuIEkgdHJpZWQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgdG8gYml0
YmFrZV9tYWluIGFuZCBpdCB3b3JrZWQ6DQoNCiAgICBpbXBvcnQgcmVzb3VyY2UNCg0KICAgICMg
U2V0IHRoZSBtYXhpbXVtIG51bWJlciBvZiBvcGVuIGZpbGVzIGFzIHRoZXJlIGFyZSBwZXJmb3Jt
YW5jZSBwcm9ibGVtcw0KICAgICMgd2l0aCwgZS5nLiwgcnBtIGlmIHRoaXMgaXMgdW5saW1pdGVk
ICh3aGljaCBpdCBtYXkgYmUgaWYgcnVubmluZyBpbnNpZGUNCiAgICAjIGEgRG9ja2VyIGNvbnRh
aW5lcikuDQogICAgKHNvZnQsIGhhcmQpID0gcmVzb3VyY2UuZ2V0cmxpbWl0KHJlc291cmNlLlJM
SU1JVF9OT0ZJTEUpDQogICAgc29mdCA9IGludChvcy5lbnZpcm9uLmdldCgiQkJfTElNSVRfTk9G
SUxFIiwgIjEwMjQiKSkNCiAgICByZXNvdXJjZS5zZXRybGltaXQocmVzb3VyY2UuUkxJTUlUX05P
RklMRSwgKG1pbihzb2Z0LCBoYXJkKSwgaGFyZCkpDQoNCkkgZG8gbm90IGtub3cgaWYgYml0YmFr
ZV9tYWluIGlzIHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcywgb3IgaWYgdGhlcmUgaXMgDQpzb21l
IG1vcmUgYXBwcm9wcmlhdGUgbG9jYXRpb24gZm9yIGl0LiBSaWNoYXJkPw0KDQpJIGNhbiBzZW5k
IGEgbmV3IHBhdGNoIHRvIGFkZCB0aGlzLCBvbmNlIEkga25vdyB3aGVyZSBpdCBzaG91bGQgYmUg
YWRkZWQuDQoNCj4gT2gsIGFuZDogcGxlYXNlIGRvIGNvbW1lbnQgaW4gdGhlIHVwc3RyZWFtIGJ1
ZyAoZS5nLiB3aXRoIHlvdXINCj4gYmVuY2htYXJrcyBmcm9tIHRoZSBjb3ZlciBsZXR0ZXIpLCBv
dGhlcndpc2UgdXBzdHJlYW0gbWF5IGRvIG5vdGhpbmcNCj4gYmVjYXVzZSB0aGV5J3JlIG5vdCB1
c2luZyBEb2NrZXIuDQoNCldpbGwgZG8uIEkgdGhpbmsgc3VnZ2VzdGluZyB0aGF0IHJwbSBzaG91
bGQgc2V0IHRoZSBsaW1pdCBpdHNlbGYsIGFzIHBlciANCm15IHN1Z2dlc3Rpb24gZm9yIGJpdGJh
a2UgYWJvdmUsIG1pZ2h0IGJlIGFuIGFwcHJvcHJpYXRlIHNvbHV0aW9uIHRoYXQgDQp0aGV5IGNh
biBhY2NlcHQuDQoNCj4gQWxleA0KDQovL1BldGVyDQoNCg==

