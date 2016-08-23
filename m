Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBC1F766A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9DEB018194;
	Tue, 23 Aug 2016 15:34:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XoPIMT5rfUr9; Tue, 23 Aug 2016 15:34:17 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 79327181A7;
	Tue, 23 Aug 2016 15:34:17 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 60B6F1B0E;
	Tue, 23 Aug 2016 15:34:17 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 552241857;
	Tue, 23 Aug 2016 15:34:17 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 53368316;
	Tue, 23 Aug 2016 15:34:17 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 23 Aug 2016 15:34:16 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Tue, 23 Aug 2016 15:34:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Thread-Topic: [OE-core] [PATCH 2/8] [cross] export CC family from BUILD_* for
	cross compilers
Thread-Index: AQHR/Q+jPAy6rQ1muUyvHlpKK6DqkKBWi7fQ
Date: Tue, 23 Aug 2016 13:34:17 +0000
Message-ID: <d169ac6b8ab445bb82c11de39098ec05@XBOX02.axis.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
In-Reply-To: <b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] [cross] export CC family from BUILD_* for	cross compilers
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
X-List-Received-Date: Tue, 23 Aug 2016 13:34:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBKw6lyw6lt
eSBSb3Nlbg0KPiBTZW50OiBkZW4gMjMgYXVndXN0aSAyMDE2IDA5OjI1DQo+IFRvOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
UEFUQ0ggMi84XSBbY3Jvc3NdIGV4cG9ydCBDQyBmYW1pbHkgZnJvbSBCVUlMRF8qDQo+IGZvciBj
cm9zcyBjb21waWxlcnMNCj4gDQo+IGNyb3NzLWNvbXBpbGVycyBhcmUgbmF0aXZlIHJlY2lwZXMg
dGhhdCBuZWVkIHRvIGJlIGNvbXBpbGVkIGJ5IHRoZSBob3N0J3MNCj4gY29tcGlsZXIuIEhvd2V2
ZXIgdGhlbiBkbyBub3QgdXNlIG5hdGl2ZS5iYmNsYXNzDQoNCkNoYW5nZSAidGhlbiIgdG8gInRo
ZXkiLg0KDQovL1BldGVyDQoNCg==

