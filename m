Return-Path: <xavier.berger@bio-logic.net>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Apr 2019 07:43:35 UTC
Received: from asp.reflexion.net (outbound-mail-211-30.reflexion.net
	[208.70.211.30])
	by mail.openembedded.org (Postfix) with ESMTP id 331F06C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:43:34 +0000 (UTC)
Received: (qmail 31199 invoked from network); 2 Apr 2019 07:36:56 -0000
Received: from unknown (HELO rtc-sm-01.app.dca.reflexion.local) (10.81.150.1)
	by 0 (rfx-qmail) with SMTP; 2 Apr 2019 07:36:56 -0000
Received: by rtc-sm-01.app.dca.reflexion.local
	(Reflexion email security v9.22.0) with SMTP;
	Tue, 02 Apr 2019 03:36:56 -0400 (EDT)
Received: (qmail 14988 invoked from network); 2 Apr 2019 07:36:56 -0000
Received: from unknown (HELO E15NYDAG-D16N01.sh11.lan) (67.214.141.234)
	by 0 (rfx-qmail) with (AES256-SHA encrypted) SMTP;
	2 Apr 2019 07:36:56 -0000
Received: from E15NYDAG-D16N01.sh11.lan (10.115.8.25) by
	E15NYDAG-D16N01.sh11.lan (10.115.8.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 2 Apr 2019 03:36:56 -0400
Received: from E15NYDAG-D16N01.sh11.lan ([fe80::98e6:86b:1724:6c80]) by
	E15NYDAG-D16N01.sh11.lan ([fe80::98e6:86b:1724:6c80%14]) with mapi id
	15.01.1591.012; Tue, 2 Apr 2019 03:36:56 -0400
From: Xavier Berger <xavier.berger@bio-logic.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PULL][PATCH 0/2] Implement debian packages GPG signing
Thread-Index: AQHU6GTx4G4h33HLE0ag9MnMsYtAJaYnpqwAgADSgPA=
Date: Tue, 2 Apr 2019 07:36:56 +0000
Message-ID: <7cbdc5ba6d0647678b7a3d2906f87a31@bio-logic.net>
References: <cover.1554106752.git.xavier.berger@bio-logic.net>
	<CANNYZj_CKFRAg9WByRfD56tOiV8FW-VfS4KyEN2YAniAxhaAtA@mail.gmail.com>
In-Reply-To: <CANNYZj_CKFRAg9WByRfD56tOiV8FW-VfS4KyEN2YAniAxhaAtA@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.154.17.42]
x-outbound-router: PLAD
x-exclaimer-md-config: f0d3a6b8-613a-409d-aea5-530a0e693ae0
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PULL][PATCH 0/2] Implement debian packages GPG signing
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
X-List-Received-Date: Tue, 02 Apr 2019 07:43:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleGVuZGVyLCANCg0KSSdtIHdvcmtpbmcgb24gdGVzdCBjYXNlIGJ1dCBJJ3ZlIGEgbG90
IG9mIHRoaW5ncyB0byB1bmRlcnN0YW5kIChhbmQgc2V0dXAgdG8gcGVyZm9ybSkuDQpJJ20gYmFz
aWNhbGx5IHRha2luZyBkbmYgYXMgZXhhbXBsZSBhbmQgY3JlYXRpbmcgYSB0ZXN0IGZvciBhcHQu
IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgbXkgc3RyYXRlZ3kgaXMgbm90IGNvcnJl
Y3QuDQoNCkknbGwgbGV0IHlvdSBrbm93IGhlcmUgd2hlbiBpdCB3aWxsIHdvcmsuDQoNClhhdmll
cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+IA0KU2VudDogbHVuZGkgMSBhdnJpbCAyMDE5IDE2OjUw
DQpUbzogWGF2aWVyIEJlcmdlciA8eGF2aWVyLmJlcmdlckBiaW8tbG9naWMubmV0Pg0KQ2M6IE9F
LWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQVUxMXVtQQVRDSCAwLzJdIEltcGxlbWVudCBkZWJpYW4gcGFja2Fn
ZXMgR1BHIHNpZ25pbmcNCg0KT24gTW9uLCAxIEFwciAyMDE5IGF0IDE1OjU3LCBYYXZpZXIgQmVy
Z2VyIDx4YXZpZXIuYmVyZ2VyQGJpby1sb2dpYy5uZXQ+IHdyb3RlOg0KPiBYYXZpZXIgQmVyZ2Vy
ICgyKToNCj4gICBncGctc2lnbjogQWRkIHBhcmFtZXRlcnMgdG8gZ3BnIHNpZ25hdHVyZSBmdW5j
dGlvbg0KPiAgIHBhY2thZ2VfbWFuYWdlcjogc2lnbiBERUIgcGFja2FnZSBmZWVkcw0KPg0KPiAg
bWV0YS9saWIvb2UvZ3BnX3NpZ24ucHkgICAgICAgIHwgIDYgKysrKystDQo+ICBtZXRhL2xpYi9v
ZS9wYWNrYWdlX21hbmFnZXIucHkgfCAxOSArKysrKysrKysrKysrKysrLS0tDQoNCkhvdyBkbyB3
ZSBtYWtlIHN1cmUgdGhpcyBkb2VzIG5vdCByZWdyZXNzPyBDYW4geW91IGFkZCBhIHRlc3QgY2Fz
ZSBzaW1pbGFyIHRvIG9uZSBmb3IgcnBtIGZlZWQgc2lnbmluZz8NCg0KQWxleA0K

