Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11551.1589658876805423016
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 12:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=qGbGnh9M;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1794; q=dns/txt; s=axis-central1;
  t=1589658877; x=1621194877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nh/916lKyGowEFNWZN12algEMviR0XSMHMO5IXg69CM=;
  b=qGbGnh9MEazgJIObJT5DUkc52CC6+TXeDSY/ljfTnuGrER1qnbhLlwmL
   B6yoiH5HEFIkeGXsI9ZfhD494vb81aYsEUt13xumrBDi8rXko1q8WTunK
   YABsAB3MDPdkiUMXFHtyymxQqjlFR4V9mxLW+rWgFDiNZ6G6pApFckCPS
   oyrFlh3OraoGPhvfyvg2Ji/zYtgPM7vUAe+sJfmnpMnyNtjyq3cuSwoEk
   ToTdETl2zufoUxVqxOoxy4mo8g1FGRJ2UK1SspRcZZgxW01g/dPdRAm9O
   UwUNDvlXCwrKoOOlNsQ1i9/8rb7mkyrYdxxGN7G5xGe05b7Ww75LJSvAN
   Q==;
IronPort-SDR: JpqHzmAm8c0Tjk82rRjxR3SRbXKPFojzeO9YTjkIsNNhs3i2K2JQdQf7DDZOK32S6T9FPhrbjC
 R4jjMQwbLyC596Yqj3RKajlFInKRYxnoIOquMbxks/lZjF9CkHlEfTAwP31r5lW2fgS2cZln+i
 tBj9L47wJ6N+X1apvNzMorkI71rheVttis2xD3Vq3WA8QXhmnTxLEX7zAdgvJspmwLaRnqgv2Q
 mlG5CBtppnfZWy/pyu/Vgq0aQZCnsas94o0O4lBRQxDfSeDRHFMvHl8u4LUDFJBd/lTLFnWoyh
 1DA=
X-IronPort-AV: E=Sophos;i="5.73,400,1583190000"; 
   d="scan'208";a="8795051"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Adrian Bunk <bunk@stusta.de>, Steve Sakoman <sakoman@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko
	<denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>, "Patches and
 discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>, "jdmason@kudzu.us"
	<jdmason@kudzu.us>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Thread-Topic: [OE-core][PATCH 0/4] Import recipes from meta-python
Thread-Index: AQHWKjNpTgSWpSyKKEOa6BxNqjTClqipXm4AgAADXwCAAGkNgIABEzoAgABEssA=
Date: Sat, 16 May 2020 19:54:32 +0000
Message-ID: <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
In-Reply-To: <20200516174702.GA22042@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbiBCdW5rDQo+IFNlbnQ6IGRlbiAxNiBtYWog
MjAyMCAxOTo0Nw0KPiBUbzogU3RldmUgU2Frb21hbiA8c2Frb21hbkBnbWFpbC5jb20+DQo+IENj
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47IERl
bnlzDQo+IERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+OyBKb3NodWEgV2F0dCA8anBld2hh
Y2tlckBnbWFpbC5jb20+Ow0KPiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2Ut
Y29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
OyBqZG1hc29uQGt1ZHp1LnVzOyBLaGVtIFJhag0KPiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIDAvNF0gSW1wb3J0IHJlY2lwZXMgZnJvbSBtZXRh
LXB5dGhvbg0KPiANCj4gT24gRnJpLCBNYXkgMTUsIDIwMjAgYXQgMDM6MjE6NTdQTSAtMTAwMCwg
U3RldmUgU2Frb21hbiB3cm90ZToNCj4gPg0KPiA+IEknbSBzZWVpbmcgYSBmZXcgdm90ZXMgb2Yg
InllcyBmb3IgZHVuZmVsbCIgYW5kIG5vIG9wcG9zaXRpb24gYXMgeWV0DQo+ID4gKGF0IGxlYXN0
IGhlcmUgb24gdGhlIGxpc3QpLg0KPiA+DQo+ID4gSSBzdXBwb3J0IHRoZSBkZXNpcmUgdG8gZ2V0
IHJpZCBvZiBhIG1ldGEtcHl0aG9uIGRlcGVuZGVuY3kgaW4gYnNwDQo+ID4gbGF5ZXJzIHNvIEkn
bSBhbHNvIGEgeWVzIHZvdGUgdW5sZXNzIHNvbWVvbmUgY29tZXMgdXAgd2l0aCBhIGdvb2QNCj4g
PiByZWFzb24gd2h5IHdlIHNob3VsZG4ndC4NCj4gDQo+IG1ldGEtb3BlbmVtYmVkZGVkL21ldGEt
cHl0aG9uIGhhcyBhIGhpZ2hlciBsYXllciBwcmlvcml0eSB0aGFuIE9FLWNvcmUuDQo+IA0KPiBB
ZGRpbmcgaGlnaGVyIHVwc3RyZWFtIHZlcnNpb25zIG9mIHRoZXNlIHJlY2lwZXMgdG8gYSBsb3dl
ci1wcmlvcml0eQ0KPiBsYXllciBpbiBhIHN0YWJsZSBzZXJpZXMgaXMgYSBwb3RlbnRpYWwgc291
cmNlIGZvciB3ZWlyZCBwcm9ibGVtcy4NCj4gDQo+ID4gU3RldmUNCj4gDQo+IGN1DQo+IEFkcmlh
bg0KDQpJIHdvdWxkIGFzc3VtZSB0aGV5J2QgYmUgcmVtb3ZlZCBmcm9tIG1ldGEtcHl0aG9uIGF0
IHRoZSBzYW1lIHRpbWUgDQp0aGV5IGFyZSBhZGRlZCB0byBtZXRhLg0KDQovL1BldGVyDQoNCg==
