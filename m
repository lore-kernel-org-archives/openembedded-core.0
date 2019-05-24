Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADBBE7E4FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1304A18594;
	Fri, 24 May 2019 21:23:17 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id u9m0vOJksDMY; Fri, 24 May 2019 21:23:10 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AFC5518661;
	Fri, 24 May 2019 21:23:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65F011A16D;
	Fri, 24 May 2019 21:23:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59A8A1A167;
	Fri, 24 May 2019 21:23:09 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 24 May 2019 21:23:09 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 4D78A30C4;
	Fri, 24 May 2019 21:23:09 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 24 May 2019 21:23:09 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 24 May 2019 21:23:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
	default init manager
Thread-Index: AQHVEapyhdypJH02fUqoRKE0CUUnvqZ6pjHg
Date: Fri, 24 May 2019 19:23:08 +0000
Message-ID: <7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
	<CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
In-Reply-To: <CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Fri, 24 May 2019 19:23:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPiANCj4gU2VudDogZGVuIDIzIG1haiAyMDE5IDIyOjU5DQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IGthaS5rYW5n
QHdpbmRyaXZlci5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7
IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggdjMgMS8yXSBsb2NhbC5jb25mLnNhbXBsZTogbWFrZSBzeXN0ZW1kIGFzIGRl
ZmF1bHQgaW5pdCBtYW5hZ2VyDQo+IA0KPiBPbiBUaHUsIE1heSAyMywgMjAxOSBhdCAxOjQxIFBN
IFBldGVyIEtqZWxsZXJzdGVkdCA8bWFpbHRvOnBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4g
d3JvdGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBtYWlsdG86
b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1i
ZWRkZWQtDQo+ID4gbWFpbHRvOmNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBP
biBCZWhhbGYgT2YNCj4gPiBtYWlsdG86a2FpLmthbmdAd2luZHJpdmVyLmNvbQ0KPiA+IFNlbnQ6
IGRlbiAyMyBtYWogMjAxOSAxMDoyNg0KPiA+IFRvOiBtYWlsdG86cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZw0KPiA+IENjOiBtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggdjMgMS8yXSBs
b2NhbC5jb25mLnNhbXBsZTogbWFrZSBzeXN0ZW1kIGFzDQo+ID4gZGVmYXVsdCBpbml0IG1hbmFn
ZXINCj4gPiANCj4gPiBGcm9tOiBLYWkgS2FuZyA8bWFpbHRvOmthaS5rYW5nQHdpbmRyaXZlci5j
b20+DQo+ID4gDQo+ID4gTW92ZSBjb25maWd1cmF0aW9ucyBmcm9tIGxvY2FsLmNvbmYuc2FtcGxl
LmV4dGVuZGVkIHRvIGxvY2FsLmNvbmYuc2FtcGxlDQo+ID4gdG8gbWFrZSBzeXN0ZW1kIGFzIGRl
ZmF1bHQgaW5pdCBtYW5hZ2VyIGZvciBwb2t5Lg0KPiANCj4gSWYgd2UncmUgZ29pbmcgdG8gY2hh
bmdlIHRoZSBkZWZhdWx0IGluaXQgbWFuYWdlciB0byBiZSBzeXN0ZW1kLCB3b3VsZG4ndCANCj4g
aXQgYmUgbW9yZSBhcHByb3ByaWF0ZSB0byBjaGFuZ2UgdGhlIHJlYWwgZGVmYXVsdCB2YWx1ZXMg
aW4gYml0YmFrZS5jb25mIA0KPiBhbmQgaHR0cDovL3BhY2thZ2Vncm91cC1jb3JlLWJvb3QuYmI/
IEFuZCB0aGVuIGluY2x1ZGUgYW4gZXhhbXBsZSBpbiANCj4gbG9jYWwuY29uZi5zYW1wbGUuZXh0
ZW5kZWQgdG8gc2hvdyBob3cgdG8gY29uZmlndXJlIHN5c3Zpbml0IGFzIGluaXQgDQo+IG1hbmFn
ZXI/DQo+IA0KPiBUaGF0IHdvdWxkIGNoYW5nZSBpdCBmb3IgT2UtY29yZSBhbmQgb3RoZXIgZGlz
dHJpYnV0aW9ucyBhcyB3ZWxsIHdoaWNoIA0KPiBpcyBub3QgdGhlIGludGVudGlvbsKgDQoNCk9r
LCB0aGVuIEknZCBzYXkgdGhlIGNoYW5nZSBiZWxvbmdzIGluIHBva3kuY29uZi4gRG9pbmcgdGhp
cyBraW5kIG9mIGNoYW5nZXMgDQppbiBsb2NhbC5jb25mLnNhbXBsZSBzZWVtcyB2ZXJ5IHdyb25n
IHRvIG1lLiBXaHk/IEJlY2F1c2UgaWYgSSBoYXZlIGFuIA0KZXhpc3RpbmcgYnVpbGQgdHJlZSBp
dCB3aWxsIG5vdCBiZSBhZmZlY3RlZCwgYnV0IGlmIEkgc2V0dXAgYSBuZXcgdHJlZSB3aXRoIA0K
b2UtaW5pdC1idWlsZC1lbnYgaXQgd2lsbCBhbGwgb2YgYSBzdWRkZW4gYmVoYXZlIGRpZmZlcmVu
dGx5IGZyb20gdGhlIG9sZCANCnRyZWUuIEluIG15IG1pbmQsIGxvY2FsLmNvbmYuc2FtcGxlIHNo
b3VsZCBvbmx5IGJlIHVzZWQgZm9yIHRoaW5ncyB0aGUgdXNlciANCmFyZSBsaWtlbHkgdG8gd2Fu
dCB0byBjb25maWd1cmUgdG8gYWRhcHQgdGhlIGJ1aWxkIGZvciBoaXMvaGVyIGVudmlyb25tZW50
LCANCm5vdCB0byBkZWZpbmUgdGhlIGRpc3RyaWJ1dGlvbiAodGhhdCdzIHdoYXQgcG9reS5jb25m
IGlzIGZvcikuDQoNCi8vUGV0ZXINCg0K

