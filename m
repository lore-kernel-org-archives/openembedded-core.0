Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8777.1608293170114915900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 04:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NSCt8+KY;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608293170;
  x=1639829170;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1wYiHcpKQBTHO1nqAtQamuD+b5AJLWsuoPejwFJRJCA=;
  b=NSCt8+KYn8OIq9EPqx1DrZLCrNTBrE2lSwf/u9bL1dRsqIDoG2LJs1U7
   3ETLsZpV5vgZYefXuyrDuuPjOv1FyQyRdk4dAy/C7ucUb+pB8mZ0MuPrR
   xLLV3BExf2fB+O5Kq1G0bnYW0xZzXajKwaDSm4psIbiyTkbashlEtd9Vw
   H/fz7FEjxJWXuFt4VdrRoOg5RydUa8JqyaULAIQsKB1ub8k9azuEx9A9P
   AopO4vjmMA8xGIci18R8SpGZgSTygF55sS1xVYF4h0/SNa/8fD+cDijCx
   83PK8uxjizy/B7yyxCBluQ1aGVzPRFQK6PXK0lqGJhu17JOx4+le1CSco
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Kory Maincent <kory.maincent@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Topic: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Index: AQHW1H4Nn1xWXFMU0EmwWkfaBA2LA6n7ctHggAEJmACAAESiMA==
Date: Fri, 18 Dec 2020 12:06:06 +0000
Message-ID: <8a74e57385a4497c9e65bb3d433207df@XBOX03.axis.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
	<ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
 <20201218095214.267d7c2a@kmaincent-XPS-13-7390>
In-Reply-To: <20201218095214.267d7c2a@kmaincent-XPS-13-7390>
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
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtvcnkgTWFpbmNlbnQNCj4gU2VudDogZGVuIDE4IGRl
Y2VtYmVyIDIwMjAgMDk6NTINCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZzsNCj4gdGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbQ0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCB2Ml0gbHRwOiBmaXggcnBjIGJ1aWxkIGVycm9yDQo+IA0KPiBIZWxs
byBQZXRlciwNCj4gDQo+IE9uIFRodSwgMTcgRGVjIDIwMjAgMTY6MjE6MjAgKzAwMDANCj4gUGV0
ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiAN
Cj4gPiA+DQo+ID4gPiAgVEFSR0VUX0NDX0FSQ0ggKz0gIiR7TERGTEFHU30iDQo+ID4gPg0KPiA+
ID4gK2V4cG9ydCBsaWJkaXIgOj0gIiR7ZXhlY19wcmVmaXh9LyR7YmFzZWxpYn0iDQo+ID4gPiAr
ZXhwb3J0IGluY2RpciA6PSAiJHtleGVjX3ByZWZpeH0vaW5jbHVkZSINCj4gPg0KPiA+IFRoaXMg
c2hvdWxkIGJlIGEgbGl0dGxlIGJpdCBiZXR0ZXI6DQo+ID4NCj4gPiBleHBvcnQgbGliZGlyIDo9
ICIke2xpYmRpcn0iDQo+ID4gZXhwb3J0IGluY2RpciA6PSAiJHtpbmNkaXJ9Ig0KPiANCj4gVGhh
bmtzLA0KPiBJIGRpZCBub3Qgbm90aWNlIGJ1dCBpdCBicmluZ3MgYW4gZXJyb3IgYW5kIEkgc2Vu
dCBhIFYzIHdpdGggaXQuDQo+IFlvdXIgcmV2aWV3IHJldHVybnMgdGhpcyBlcnJvcjoNCj4gYmIu
ZGF0YV9zbWFydC5FeHBhbnNpb25FcnJvcjogRmFpbHVyZSBleHBhbmRpbmcgdmFyaWFibGUgaW5j
ZGlyLA0KPiBleHByZXNzaW9uIHdhcyAke2luY2Rpcn0gd2hpY2ggdHJpZ2dlcmVkIGV4Y2VwdGlv
biBFeGNlcHRpb246IHZhcmlhYmxlDQo+IGluY2RpciByZWZlcmVuY2VzIGl0c2VsZiENCg0KRHVo
LCBvZiBjb3Vyc2UuIFRoYXQgaXMgYmVjYXVzZSB0aGVyZSBpcyBubyBpbmNkaXIgdmFyaWFibGUs
IHNvIA0KIiR7aW5jZGlyfSIgd2lsbCBleHBhbmQgdG8gIlwke2luY2Rpcn0iLiBUaGUgcmVhbCB2
YXJpYWJsZSBpcyBjYWxsZWQgDQppbmNsdWRlZGlyLiANCg0KVGhpcyBvZiBjb3Vyc2UgYnJpbmdz
IHRoZSBxdWVzdGlvbiB3aGV0aGVyIGx0cCBleHBlY3RzIGluY2RpciBvciANCmluY2x1ZGVkaXIs
IGFuZCBpZiBpdCBpcyB0aGUgbGF0dGVyLCB0aGVuIHlvdXIgY2hhbmdlcyBzbyBmYXIgaGF2ZSBu
b3QgDQptYWRlIGFueSBkaWZmZXJlbmNlIHdoZW4gaXQgY29tZXMgdG8gaW5jbHVkZWRpciwgd2hp
Y2ggbWVhbnMgdGhleSANCnNob3VsZG4ndCBiZSBuZWVkZWQuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+
IA0KPiBLw7ZyeSwNCg0KLy9QZXRlcg0KDQo=
