Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.21.1594314223791701030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 10:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MCseO4/l;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2058; q=dns/txt; s=axis-central1;
  t=1594314224; x=1625850224;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hEX/szZERm3oqMmp8YP/KmcKGtysjIUIB4jy+w6v/X8=;
  b=MCseO4/lgm60IpTBB7BNSMMv2xFOTLtOIqx5TBDudi9Yl0NN+EGsjjNe
   d0Wm9h/hozA3z/HhbasMs92kKkChKSdpFrJ6qtSTdmUlro+UZiXsE4pIM
   M2UAc9mbExDDadk0z33mQYX7g9F50K10h2lEtVbaU04wugmD7iMgXO5nB
   u9GhjFfhPP7mrZWYny46oV2eC7beONoFUoKN+2/gkmU7hGmJfXHp/l357
   IyfZYnFLoa5HI30xPbfhY9L+GyhOSrTfsLU0chdoSbJY2FdZJDeqK5gDf
   FRJ9fBgUdAe5DLQmtLMP5a4wx70fjtW/Xi5kq5XHfSdu95NkaWkABoxZg
   A==;
IronPort-SDR: G7baCDm7t4IVEiauQyJBFmkF8B6Kn+idUH+pEShVN+blEHfjXV1/NrDDgYkdi8bnT/F/flBLsR
 VM+Ry2gl17Etw1AXEhWxfljZzCWmjgTfyrCHHEzBb4a5r5NAY53BWKGfFTvEoaFr354rlTgPWm
 1SHUgL8fU2euNhFNeiB8wmh8ROpcc3osjCEr3EhdWpwx8JoHmCn86HSvKNusK6rITjkQfUeRoj
 lwycYGxZjkFdzyXJ3/VnZwLNN1nrkCk3ZuKHVSM4Vp1PQoqZVw1UR+lz4ddKWheMkhcka0YlHX
 rUc=
X-IronPort-AV: E=Sophos;i="5.75,332,1589234400"; 
   d="scan'208";a="10339802"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Eggleton
	<paul.eggleton@linux.microsoft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes: add workdir_save class
Thread-Topic: [OE-core] [RFC PATCH 1/1] classes: add workdir_save class
Thread-Index: AQHWVVH9/a/Ncika0kKLhlt0gZ8WGKj92mMAgAGfnmA=
Date: Thu, 9 Jul 2020 17:02:37 +0000
Message-ID: <596ec4fe9b754d35bfc71820fa3c67b3@XBOX03.axis.com>
References: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>
	 <8a17db382b6b7fde9d5dddebb0fc410dc35b5088.1594231229.git.paul.eggleton@linux.microsoft.com>
 <e1985bdd0b4be2ef216279a2af09e1d301aa97d6.camel@linuxfoundation.org>
In-Reply-To: <e1985bdd0b4be2ef216279a2af09e1d301aa97d6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiA4IGp1
bGkgMjAyMCAyMDoxMg0KPiBUbzogUGF1bCBFZ2dsZXRvbiA8cGF1bC5lZ2dsZXRvbkBsaW51eC5t
aWNyb3NvZnQuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUkZDIFBBVENIIDEvMV0gY2xhc3NlczogYWRk
IHdvcmtkaXJfc2F2ZSBjbGFzcw0KPiANCj4gT24gV2VkLCAyMDIwLTA3LTA4IGF0IDExOjAyIC0w
NzAwLCBQYXVsIEVnZ2xldG9uIHdyb3RlOg0KPiA+IElmIHlvdSBhcmUgcnVubmluZyB5b3VyIGJ1
aWxkcyBpbnNpZGUgYW4gZW52aXJvbm1lbnQgd2hlcmUgeW91IGRvbid0DQo+ID4gaGF2ZSBhY2Nl
c3MgdG8gdGhlIGJ1aWxkIHRyZWUgKGUuZy4gYW4gYXV0b2J1aWxkZXIgd2hlcmUgeW91IGNhbiBv
bmx5DQo+ID4gZG93bmxvYWQgZmluYWwgYXJ0aWZhY3RzIHN1Y2ggYXMgaW1hZ2VzKSwgdGhlbiBk
ZWJ1Z2dpbmcgYnVpbGQNCj4gPiBmYWlsdXJlcw0KPiA+IGNhbiBiZSBkaWZmaWN1bHQgLSB5b3Ug
Y2FuJ3QgZXhhbWluZSBsb2cgZmlsZXMsIHRoZSBzb3VyY2UgdHJlZSBvcg0KPiA+IG91dHB1dA0K
PiA+IGZpbGVzLiBXaGVuIGVuYWJsZWQsIHRoaXMgY2xhc3MgdHJpZ2dlcnMgb24gdGFzayBmYWls
dXJlIGFuZCBzYXZlcyBhDQo+ID4gdGFyYmFsbCBvZiB0aGUgd29yayBkaXJlY3RvcnkgZm9yIHRo
ZSB0YXNrJ3MgcmVjaXBlIGFuZCBwdXRzIGl0IGluIGENCj4gPiBjb25maWd1cmFibGUgbG9jYXRp
b24sIHdoZXJlIGl0IGNhbiBiZSBwaWNrZWQgdXAgYnkgYSBzZXBhcmF0ZQ0KPiA+IHByb2Nlc3MN
Cj4gPiBhbmQgbWFkZSBhdmFpbGFibGUgYXMgYSBkb3dubG9hZGFibGUgYXJ0aWZhY3QuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEVnZ2xldG9uIDxwYXVsLmVnZ2xldG9uQGxpbnV4Lm1p
Y3Jvc29mdC5jb20+DQo+IA0KPiBTZWVtcyBsaWtlIGEgdXNlZnVsIGlkZWEuIEkgdGhpbmsgdGhl
IG5hbWUgbWF5IG5lZWQgImZhaWxlZCIgaW4gdGhlDQo+IG5hbWUgdG8gbWFrZSBpdCBjbGVhcmVy
IHdoYXQgaXQgZG9lcy4gV2UgYWxzbyBuZWVkIGEgc2VjdGlvbiBmb3IgdGhlDQo+IGNsYXNzZXMg
Y2hhcHRlciBpbiB0aGUgbWFudWFsLg0KPiANCj4gQXMgYW5vdGhlciBkYXRhIHBvaW50LCBPRVFB
IGlzIHVzaW5nIE9FUUFfREVCVUdHSU5HX1NBVkVEX09VVFBVVCB0bw0KPiB0cmlnZ2VyIHNhdmlu
ZyBpbmZvcm1hdGlvbiBmb3IgcmVwcm9kdWNpYmxlIGJ1aWxkcy4uLg0KPiANCj4gQ2hlZXJzLA0K
PiANCj4gUmljaGFyZA0KDQpIb3cgYWJvdXQgInNhdmVfd29ya2Rpcl9vbl9mYWlsdXJlLmJiY2xh
c3MiPw0KDQovL1BldGVyDQoNCg==
