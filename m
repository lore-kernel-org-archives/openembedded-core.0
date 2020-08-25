Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4451.1598317041187474237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 17:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: leimaohui@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,350,1592841600"; 
   d="scan'208";a="98493278"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 08:57:16 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CB8F548990D7;
	Tue, 25 Aug 2020 08:57:10 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 08:57:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Tue, 25 Aug 2020 08:57:09 +0800
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>
Subject: Re: Why there is a RCONFLICTS in wireless-regdb recipe file
Thread-Topic: Why there is a RCONFLICTS in wireless-regdb recipe file
Thread-Index: AdZ3b3b/6pPOCdBPSVaJ2RAzFGBb8gDCvjig
Date: Tue, 25 Aug 2020 00:57:09 +0000
Message-ID: <0c5dd55d267349999d0ab3ad9ec4c641@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <162D2C87C5727928.19371@lists.openembedded.org>
In-Reply-To: <162D2C87C5727928.19371@lists.openembedded.org>
Accept-Language: en-AU, zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CB8F548990D7.AB10E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9w
ZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBP
biBCZWhhbGYgT2YgbGVpbWFvaHVpDQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0
IDIxLCAyMDIwIDEyOjAwIFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBX
aHkgdGhlcmUgaXMgYSBSQ09ORkxJQ1RTIGluIHdpcmVsZXNzLXJlZ2RiIHJl
Y2lwZSBmaWxlDQo+IA0KPiBIaSwNCj4gDQo+IFRoZXJlIGlzIGEgUkNPTkZM
SUNUUyBpbiB3aXJlbGVzcy1yZWdkYiByZWNpcGUgZmlsZToNCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAjIElu
c3RhbGwgc3RhdGljIHJlZ3VsYXRvcnkgREIgaW4gL2xpYi9maXJtd2FyZSBm
b3Iga2VybmVsIHRvIGxvYWQuDQo+ICMgVGhpcyByZXF1aXJlcyBMaW51eCBr
ZXJuZWwgPj0gdjQuMTUuDQo+ICMgRm9yIGtlcm5lbCA8PSB2NC4xNCwgaW5o
ZXJpdCB0aGUga2VybmVsX3dpcmVsZXNzX3JlZ2RiLmJiY2xhc3MgIyAoaW4g
bWV0YS0NCj4gbmV0d29ya2luZykgaW4ga2VybmVsJ3MgcmVjaXBlLg0KPiBQ
QUNLQUdFUyA9ICIke1BOfS1zdGF0aWMgJHtQTn0iDQo+IFJDT05GTElDVFNf
JHtQTn0gPSAiJHtQTn0tc3RhdGljIiAgICA8LS0tSGVyZQ0KPiANCj4gRklM
RVNfJHtQTn0tc3RhdGljID0gIiBcDQo+ICAgICAke25vbmFyY2hfYmFzZV9s
aWJkaXJ9L2Zpcm13YXJlL3JlZ3VsYXRvcnkuZGIgXA0KPiAgICAgJHtub25h
cmNoX2Jhc2VfbGliZGlyfS9maXJtd2FyZS9yZWd1bGF0b3J5LmRiLnA3cyBc
ICINCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gDQo+IEJ1dCBJJ20gbm90IHVuZGVyc3RhbmQgd2h5IHRo
aXMgcGFyYW1ldGVyIGhhcyBiZWVuIGFkZGVkPyBUaGVyZSBpcyBubw0KPiBj
b25mbGljdCBmaWxlIGJldHdlZW4gdGhlc2UgdHdvIHBhY2thZ2VzPw0KPiBP
ciBmb3Igb3RoZXIgcmVhc29ucz8NCj4gDQo+IFRoZSBmb2xsb3dpbmcgaXMg
dGhlIGZpbGUgbGlzdCBvZiB3aXJlbGVzcy1yZWdkYi1zdGF0aWMgYW5kIHdp
cmVsZXNzLXJlZ2RiLg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+IC93aXJlbGVzcy1yZWdkYi8yMDIwLjA0LjI5
LXIwL3BhY2thZ2VzLXNwbGl0L3dpcmVsZXNzLXJlZ2RiLXN0YXRpYy8NCj4g
4pSU4pSA4pSAIGxpYg0KPiAgICAg4pSU4pSA4pSAIGZpcm13YXJlDQo+ICAg
ICAgICAg4pSc4pSA4pSAIHJlZ3VsYXRvcnkuZGINCj4gICAgICAgICDilJTi
lIDilIAgcmVndWxhdG9yeS5kYi5wN3MNCj4gDQo+IDIgZGlyZWN0b3JpZXMs
IDIgZmlsZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiB3aXJlbGVzcy1yZWdkYi8yMDIwLjA0LjI5LXIwL3Bh
Y2thZ2VzLXNwbGl0L3dpcmVsZXNzLXJlZ2RiDQo+IOKUnOKUgOKUgCBldGMN
Cj4g4pSCwqDCoCDilJTilIDilIAgd2lyZWxlc3MtcmVnZGINCj4g4pSCwqDC
oCAgICAg4pSU4pSA4pSAIHB1YmtleXMNCj4g4pSCwqDCoCAgICAgICAgIOKU
lOKUgOKUgCBzZm9yc2hlZS5rZXkucHViLnBlbQ0KPiDilJTilIDilIAgdXNy
DQo+ICAgICDilJTilIDilIAgbGliDQo+ICAgICAgICAg4pSU4pSA4pSAIGNy
ZGENCj4gICAgICAgICAgICAg4pSU4pSA4pSAIHJlZ3VsYXRvcnkuYmluDQo+
IA0KPiA2IGRpcmVjdG9yaWVzLCAyIGZpbGVzDQo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+IEJlc3Qgd2lz
aGVkDQo+IExlaQ0KPiANCg0KCgo=
