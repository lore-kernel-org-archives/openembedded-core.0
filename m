Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 716E56BF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:45:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2014 08:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,639,1389772800"; d="scan'208";a="490577328"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2014 08:45:03 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 12 Mar 2014 15:43:47 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.62]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.149]) with mapi id
	14.03.0123.003; Wed, 12 Mar 2014 15:43:47 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "Mats.Karrman@tritech.se" <Mats.Karrman@tritech.se>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc
Thread-Index: Ac8+BQu6b+elda9pTAWbBsq3s0UQDQABNfOA
Date: Wed, 12 Mar 2014 15:43:47 +0000
Message-ID: <1394639041.18740.8.camel@firebird.rb.intel.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Wed, 12 Mar 2014 15:45:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <405C11AB9452CF458883DC3C263A28F5@intel.com>
Content-Transfer-Encoding: base64

DQpIZWxsbywNCg0KSSBqdXN0IHdhbnQgdG8gcG9pbnQgb3V0IHRoYXQgdGhpcyBsb29rcyB2ZXJ5
IHNpbWlsYXIgdG8gYSBxZW11cHBjDQptYWNoaW5lIGJ1ZyB3ZSd2ZSBzZWVuIGJlZm9yZSB3aXRo
IGxpYm0gYW5kIGZsb29yKCkgY2FsbDoNCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9NDg1NA0KDQpJdCB3YXMgZml4ZWQgd2l0aDoNCmh0dHA6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD0yYTQ4ZTkwMDdj
YzkyZmVkZmRiNjkxOTQxMTg1OWZiOTQzZWFjYzk0DQoNCkhUSCwNClN0ZWZhbg0KDQpPbiBXZWQs
IDIwMTQtMDMtMTIgYXQgMTU6MzAgKzAwMDAsIE1hdHMgS8OkcnJtYW4gd3JvdGU6DQo+IEhpLA0K
PiANCj4gSSBmYWNlIGEgcHJvYmxlbSB3aXRoIGxpYm0uIFdpdGggbXkgRG9yYSBidWlsZCB0aGUg
Zm9sbG93aW5nIGFzc2VydGlvbiBkb2Vzbid0IGhvbGQ6DQo+IA0KPiBzcXJ0KCBwb3coIHNxcnQo
IDIuMCApLCA0LjAgKSApID09IDIuMA0KPiANCj4gMSkgV2l0aCBteSBvbGQgT0UtY2xhc3NpYyAv
IGdsaWJjLTIuOSAvIFBvd2VyUEMtaGYgaXQgaG9sZHMuDQo+IDIpIFdpdGggbXkgRGViaWFuIGRl
c2t0b3AgUEMgLyBnbGliYy0yLjE3IC8gYW1kNjQgaXQgaG9sZHMuDQo+IDMpIFdpdGggbXkgbmV3
IE9FLWNvcmUgRG9yYSAvIGVnbGliYy0yLjE4IC8gUG93ZXJQQy1oZiBpdCBkb2Vzbid0IGhvbGQu
DQo+IA0KPiBDbG9zZSBlbm91Z2ggb25lIGNhbiB0aGluayBidXQgdGhlIHN0YW5kYXJkaXplZCB0
ZXN0IGNhc2UgSSBydW4gcmVxdWlyZXMgdGhlIHJlc3VsdCB0byBiZSAyLjAuDQo+IEEgc2ltcGxl
IHRlc3QgcHJvZ3JhbToNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gI2luY2x1ZGUgPHN0ZGlvLmg+DQo+ICNp
bmNsdWRlIDxtYXRoLmg+DQo+IA0KPiBpbnQgbWFpbigpew0KPiANCj4gCWRvdWJsZSB0d28gPSAy
LjA7DQo+IAlkb3VibGUgZm91ciA9IDQuMDsNCj4gDQo+IAlkb3VibGUgczEgPSBzcXJ0KHR3byk7
DQo+IAlwcmludGYoInNxcnQoJS4yMGYpID0gJS4yMGZcbiIsIHR3bywgczEpOw0KPiAJZG91Ymxl
IHAgICA9IHBvdyhzMSwgZm91cik7DQo+IAlwcmludGYoInBvdyglLjIwZiwgJS4yMGYpID0gJS4y
MGZcbiIsIHMxLCBmb3VyLCBwKTsNCj4gCWRvdWJsZSBzMiA9IHNxcnQocCk7DQo+IAlwcmludGYo
InNxcnQoJS4yMGYpID0gJS4yMGZcbiIsIHAsIHMyKTsNCj4gDQo+IH0NCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+IHJlc3VsdHMgZnJvbSAxIGFuZCAyIChpZGVudGljYWwpOg0KPiBzcXJ0KDIuMDAwMDAw
MDAwMDAwMDAwMDAwMDApID0gMS40MTQyMTM1NjIzNzMwOTUxNDU0Nw0KPiBwb3coMS40MTQyMTM1
NjIzNzMwOTUxNDU0NywgNC4wMDAwMDAwMDAwMDAwMDAwMDAwMCkgPSA0LjAwMDAwMDAwMDAwMDAw
MDg4ODE4DQo+IHNxcnQoNC4wMDAwMDAwMDAwMDAwMDA4ODgxOCkgPSAyLjAwMDAwMDAwMDAwMDAw
MDAwMDAwDQo+IA0KPiByZXN1bHRzIGZyb20gMzoNCj4gc3FydCgyLjAwMDAwMDAwMDAwMDAwMDAw
MDAwKSA9IDEuNDE0MjEzNTYyMzczMDk0OTIzNDMNCj4gcG93KDEuNDE0MjEzNTYyMzczMDk0OTIz
NDMsIDQuMDAwMDAwMDAwMDAwMDAwMDAwMDApID0gMy45OTk5OTk5OTk5OTk5OTg2Njc3Mw0KPiBz
cXJ0KDMuOTk5OTk5OTk5OTk5OTk4NjY3NzMpID0gMS45OTk5OTk5OTk5OTk5OTk1NTU5MQ0KPiAN
Cj4gRG9lcyBhbnlvbmUga25vdyBpZiB0aGlzIGlzIGEga25vd24gImZlYXR1cmUiIG9mIGVnbGli
YyBvciBrbm93IGFueSBvdGhlciByZWFzb24NCj4gZm9yIHRoaXMgZGlmZmVyZW5jZT8NCj4gDQo+
IEJlc3QgUmVnYXJkcywNCj4gTWF0cw0KDQo=

