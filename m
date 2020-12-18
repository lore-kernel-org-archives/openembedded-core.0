Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1302.1608317950968852167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 10:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eNRxm5PW;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608317951;
  x=1639853951;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eU5F024NcQsax8sP7SaeEs09Bvo8pL0HHa+ae6bjLMY=;
  b=eNRxm5PWi+BUZZNDkSuoYw68NLaSo+n4bXZg8IwyPfVDFwWGtLh6Gxm9
   n23+XdPczNtFXgjDbQQK1UovbIh0vTIoa6n/bkjcPfAgMPVy8NADuStt4
   bf3rYCwe8vRQwKnwKA8J/UpNc8UQ+T6XXsUoK2Jw84g3b0xTZnQj7zuwV
   HSCvyeVDE3TloVEEaQJag98bojW//GZIQPKxyIo8vbjNyrUfxwLs7k6gW
   iHW4MMIHT0d6ALOyMCVyid3jLT9aME3d3pZhwkk47xLbKnhmHyh7T2fl8
   5v6ti2GPZldq+2QNsxO0tCQu+X4inVrSBUGbqBJRcwPLj256PBeIpvuw9
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: =?utf-8?B?S8O2cnkgTWFpbmNlbnQ=?= <kory.maincent@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Topic: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Index: AQHW1H4Nn1xWXFMU0EmwWkfaBA2LA6n7ctHggAEJmACAAESiMIAAE3gAgABgtUA=
Date: Fri, 18 Dec 2020 18:59:08 +0000
Message-ID: <8547cb6d712e4c7cbd33fbab0ce3b74b@XBOX03.axis.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
	<ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
	<20201218095214.267d7c2a@kmaincent-XPS-13-7390>
	<8a74e57385a4497c9e65bb3d433207df@XBOX03.axis.com>
 <20201218150734.5763d3bf@kmaincent-XPS-13-7390>
In-Reply-To: <20201218150734.5763d3bf@kmaincent-XPS-13-7390>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLw7ZyeSBNYWluY2VudCA8a29y
eS5tYWluY2VudEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDE4IGRlY2VtYmVyIDIwMjAgMTU6
MDgNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsNCj4gdGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCB2Ml0gbHRwOiBmaXggcnBjIGJ1aWxkIGVycm9yDQo+IA0KPiBPbiBGcmksIDE4IERlYyAyMDIw
IDEyOjA2OjA2ICswMDAwDQo+IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPiB3cm90ZToNCj4gDQo+ID4gPiBJIGRpZCBub3Qgbm90aWNlIGJ1dCBpdCBicmlu
Z3MgYW4gZXJyb3IgYW5kIEkgc2VudCBhIFYzIHdpdGggaXQuDQo+ID4gPiBZb3VyIHJldmlldyBy
ZXR1cm5zIHRoaXMgZXJyb3I6DQo+ID4gPiBiYi5kYXRhX3NtYXJ0LkV4cGFuc2lvbkVycm9yOiBG
YWlsdXJlIGV4cGFuZGluZyB2YXJpYWJsZSBpbmNkaXIsDQo+ID4gPiBleHByZXNzaW9uIHdhcyAk
e2luY2Rpcn0gd2hpY2ggdHJpZ2dlcmVkIGV4Y2VwdGlvbiBFeGNlcHRpb246DQo+ID4gPiB2YXJp
YWJsZSBpbmNkaXIgcmVmZXJlbmNlcyBpdHNlbGYhDQo+ID4NCj4gPiBEdWgsIG9mIGNvdXJzZS4g
VGhhdCBpcyBiZWNhdXNlIHRoZXJlIGlzIG5vIGluY2RpciB2YXJpYWJsZSwgc28NCj4gPiAiJHtp
bmNkaXJ9IiB3aWxsIGV4cGFuZCB0byAiXCR7aW5jZGlyfSIuIFRoZSByZWFsIHZhcmlhYmxlIGlz
IGNhbGxlZA0KPiA+IGluY2x1ZGVkaXIuDQo+ID4NCj4gPiBUaGlzIG9mIGNvdXJzZSBicmluZ3Mg
dGhlIHF1ZXN0aW9uIHdoZXRoZXIgbHRwIGV4cGVjdHMgaW5jZGlyIG9yDQo+ID4gaW5jbHVkZWRp
ciwgYW5kIGlmIGl0IGlzIHRoZSBsYXR0ZXIsIHRoZW4geW91ciBjaGFuZ2VzIHNvIGZhciBoYXZl
IG5vdA0KPiA+IG1hZGUgYW55IGRpZmZlcmVuY2Ugd2hlbiBpdCBjb21lcyB0byBpbmNsdWRlZGly
LCB3aGljaCBtZWFucyB0aGV5DQo+ID4gc2hvdWxkbid0IGJlIG5lZWRlZC4NCj4gDQo+IFlvdXIg
cmlnaHQgaXQgbmVlZHMgb25seSAke2xpYmRpcn0uDQo+IEluIGZhY3QsIHRoZSBpc3N1ZSB3YXMg
dGhlIHJlY2lwZSBjb3VsZCBub3QgZmluZCB0aXJwYyBwa2djb25maWcuDQo+IEkgaGF2ZSBjaG9z
ZW4gdG8gZXhwb3J0IGxpYmRpciBiZWNhdXNlDQo+IFBLR19DT05GSUdfRElSPSR7U1RBR0lOR19E
SVJfSE9TVH0ke2xpYmRpcn0vcGtnY29uZmlnDQo+IEJ1dCBtYXliZSBpdCBpcyBiZXR0ZXIgdG8g
YWRkIHRoZSBwYXRoIHRvIFBLR19DT05GSUdfUEFUSD8NCg0KSWYgdGhhdCBpcyB0aGUgb25seSBy
ZWFzb24gZm9yIHRoZSBleHBvcnRlZCBsaWJkaXIsIHRoZW4gSSBhZ3JlZSwgaXQgaXMgDQpiZXR0
ZXIgdG8gYWRkOg0KDQpQS0dfQ09ORklHX1BBVEggLj0gIjoke1NUQUdJTkdfRElSX0hPU1R9JHtl
eGVjX3ByZWZpeH0vJHtiYXNlbGlifS9wa2djb25maWciDQoNClByZWZlcmFibHkgd2l0aCBhIGNv
bW1lbnQgZXhwbGFpbmluZyB3aHkgaXQgaXMgYmVpbmcgZG9uZS4NCg0KPiBSZWdhcmRzLA0KPiAN
Cj4gS8O2cnkNCg0KLy9QZXRlcg0KDQo=
