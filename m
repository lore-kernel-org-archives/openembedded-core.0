Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.5673.1591083014609517149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=O0wh3jjE;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2928; q=dns/txt; s=axis-central1;
  t=1591083015; x=1622619015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=466QxQZn/gM+6BW3h868eqAuAtVIzJ4FZnVmAEfZO3Y=;
  b=O0wh3jjEDv7X+4UyKGvrB7la28wVJTMSPQZLFnIpz3zLjM3QrHsVJzdC
   ye5eTDCAgCBWLktfWoqX9K+r1O6K2Ya7NioUiuzOFSQHqY8lDLypK1mUU
   5LcS9t2WE0u2JdqF/yNT+uJmRa+q1zwQ6Vd95jMG0OVy44bmpY6PRt1N5
   3BYvBgabI3QuZGEPTBjNb2Yd6oSxvmMyeoyBNL0f2rlkcVbhdhtsPIU1i
   oRJ0knWZ8ONNMxifF2GfIBiK5iStPxAujyMIIWyhZfMrqo0cD1Avavyx2
   ao5azjisck4TXfihnnD+1yH+GK4zC5stKUHqwxgcT4VFowmlkvAzMBtow
   A==;
IronPort-SDR: zdItJKmkLPiYAEvUHCIP0ysr07+lt4m0S448Knd9IDTvh7bjDM1rsMp9fKQrYkwm2Co5iqcgOz
 U+/g43j/mZP4Xw+DemGqOKu27Vu6by8sGFCRNATm5TPRwv2+B/9CXAety0KjIje74VutkOAGZT
 4JuYvzZf2y0z1A/dHqOjv3OjyxW6nuy7LhaQQMhGhI297l1pTCT2GbdVN1mtcDCfEc6IYxbudo
 rN/oLaP5A/Ld+vQqWVcfxnBz1Oyu8prTK13Yv8pCzOrNDvDcBsIhmjKxGk431w+qb+h+KTzp9i
 yd0=
X-IronPort-AV: E=Sophos;i="5.73,463,1583190000"; 
   d="scan'208";a="9383065"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Adrian Bunk <bunk@stusta.de>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
Thread-Topic: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
 copyright year lines.
Thread-Index: AQHWN2Ue81/0BuJcrkeHoTmFj/MVKajEUx1QgABhM4CAADTpYA==
Date: Tue, 2 Jun 2020 07:30:12 +0000
Message-ID: <0468979023144c509a026191885f3a9a@XBOX03.axis.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com>
 <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
 <20200602055445.GA12053@localhost>
In-Reply-To: <20200602055445.GA12053@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbiBCdW5rDQo+IFNlbnQ6IGRlbiAyIGp1bmkg
MjAyMCAwNzo1NQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+DQo+IENjOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDY1LzcwXSBsaWJ5YW1sOiBhZGp1c3QgbGljZW5zZSBj
aGVja3N1bSB0bw0KPiBvbWl0IGNvcHlyaWdodCB5ZWFyIGxpbmVzLg0KPiANCj4gT24gTW9uLCBK
dW4gMDEsIDIwMjAgYXQgMTA6MTI6MTZQTSArMDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3Rl
Og0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gPiA+IGNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmlu
DQo+ID4gPiBTZW50OiBkZW4gMzEgbWFqIDIwMjAgMTc6NTMNCj4gPiA+IFRvOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBDYzogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BB
VENIIDY1LzcwXSBsaWJ5YW1sOiBhZGp1c3QgbGljZW5zZSBjaGVja3N1bSB0byBvbWl0DQo+ID4g
PiBjb3B5cmlnaHQgeWVhciBsaW5lcy4NCj4gPg0KPiA+IEVoLCB3aGF0PyBUaGF0J3MgZGVmaW5p
dGVseSBub3QgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBGb3IgYSBsaWNlbnNlDQo+ID4gdGhhdCBz
YXlzICJUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGlj
ZSBzaGFsbA0KPiA+IGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9y
dGlvbnMgb2YgdGhlIFNvZnR3YXJlLiIsDQo+ID4gcmVtb3ZpbmcgdGhlIGNvcHlyaWdodCBpbmZv
cm1hdGlvbiBtYWtlcyB0aGUgZmlsZSB1c2VsZXNzIGFzIHBhcnQgb2YsDQo+ID4gZS5nLiwgJHtQ
Tn0tbGljLg0KPiANCj4gVGhpcyBpcyBub3Qgd2hhdCB0aGUgcGF0Y2ggZG9lcy4NCj4gDQo+ID4u
Li4NCj4gPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MaWNlbnNlO21kNT03YmJkMjhj
YWE2OWY4MWY1Y2Q1ZjQ4NjQ3MjM2NjYzZCINCj4gPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MaWNlbnNlO21kNT01MTU5MTU5NDc1M2YwNTAxODY4MGY2ZGI3NjVkNWE0NjtiZWdpbmxp
bmU9MyINCj4gPi4uLg0KPiANCj4gSXQgb25seSBleGNsdWRlcyB0aGUgZmlyc3QgbGluZXMgZnJv
bSB0aGUgY2hlY2tzdW0uDQoNCldoaWNoIG1lYW5zIHRoZSBsaW5lcyB3aXRoIHRoZSBjb3B5cmln
aHQgc3RhdGVtZW50cyB3aWxsIGFsc28gYmUgZXhjbHVkZWQgDQpmcm9tIHRoZSBmaWxlIHRoYXQg
aXMgaW5jbHVkZWQgd2l0aCB0aGUgY29waWVkIGxpY2Vuc2UgZmlsZXMuDQoNClRoaXMgYmVoYXZp
b3IgaXMgd2hhdCB3ZSB3YW50LCBzaW5jZSB3aGVuIHVzaW5nIGEgbGljZW5zZSBzdGF0ZW1lbnQg
ZnJvbSBhIA0Kc291cmNlIGZpbGUsIHlvdSB0eXBpY2FsbHkgZG8gbm90IHdhbnQgdGhlIHdob2xl
IG9mIHRoZSBzb3VyY2UgZmlsZSB0byBiZSANCmluY2x1ZGVkIHdpdGggdGhlIGNvcGllZCBsaWNl
bnNlIGZpbGVzLCBvbmx5IHRoZSBwYXJ0IHNwZWNpZmllZCBpbiANCkxJQ19GSUxFU19DSEtTVU0u
IEJ1dCBpdCBhbHNvIG1lYW5zIHRoZSBjb3B5cmlnaHQgaW5mb3JtYXRpb24gbmVlZHMgdG8gYmUg
DQppbmNsdWRlZCBpbiB0aGF0IHBhcnQuDQoNClNlZSBjb21taXQgNTE1ZjRjMTIgZm9yIHdoZW4g
dGhpcyB3YXMgaW50cm9kdWNlZCB0aHJlZSB5ZWFycyBhZ28uDQoNCj4gPiAvL1BldGVyDQo+IA0K
PiBjdQ0KPiBBZHJpYW4NCg0KLy9QZXRlcg0KDQo=
