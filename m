Return-Path: <meier.dennis@siemens.com>
X-Greylist: delayed 1207 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jun 2014 10:21:47 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id D6F1660167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 10:21:46 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by lizzard.sbs.de (8.14.3/8.14.3) with ESMTP id s5OA1cYj015311;
	Tue, 24 Jun 2014 12:01:38 +0200
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id s5OA1cxd018742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jun 2014 12:01:38 +0200
Received: from DENBGAT9ERNMSX.ww902.siemens.net (139.22.70.144) by
	DEFTHW99ERGMSX.ww902.siemens.net (139.22.70.132) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 24 Jun 2014 12:01:37 +0200
Received: from DEFTHW99EI0MSX.ww902.siemens.net ([169.254.5.157]) by
	DENBGAT9ERNMSX.ww902.siemens.net ([139.22.70.144]) with mapi id
	14.03.0181.006; Tue, 24 Jun 2014 12:01:37 +0200
From: "Meier, Dennis" <meier.dennis@siemens.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] populate_sdk_base: add auto-completion in setup
Thread-Index: AQHPii7vSamUFL9cm0+k8h2pM7QJdZt1PgIAgArTibA=
Date: Tue, 24 Jun 2014 10:01:36 +0000
Message-ID: <6F22A92316C68C42A591A48A6291DA9DD95C99@DEFTHW99EI0MSX.ww902.siemens.net>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
In-Reply-To: <CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.25]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Tue, 24 Jun 2014 10:21:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvdGF2aW8uc2FsdmFkb3JAZ21h
aWwuY29tIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQGdtYWlsLmNvbV0gT24NCj4gQmVoYWxmIE9m
IE90YXZpbyBTYWx2YWRvcg0KPiBTZW50OiBEaWVuc3RhZywgMTcuIEp1bmkgMjAxNCAxNjo0MA0K
PiBUbzogTWVpZXIsIERlbm5pcw0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQg
dGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHBvcHVs
YXRlX3Nka19iYXNlOiBhZGQgYXV0by1jb21wbGV0aW9uDQo+IGluIHNldHVwDQo+IA0KPiBPbiBU
dWUsIEp1biAxNywgMjAxNCBhdCAxMDoxNiBBTSwgRGVubmlzIE1laWVyDQo+IDxtZWllci5kZW5u
aXNAc2llbWVucy5jb20+IHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IERlbm5pcyBNZWllciA8
bWVpZXIuZGVubmlzQHNpZW1lbnMuY29tPg0KPiANCj4gSSBkbyBsaWtlIHRoZSBpZGVhIGJ1dCBo
b3cgcG9ydGFibGUgaXMgaXQ/DQo+IA0KPiBGb3IgZXhhbXBsZSBpbiBteSBlbnZpbnJvbm1lbnQg
aXQgZG9lcyBub3Qgd29yayBhcyBJIHVzZSB6c2guDQoNClllYWggdGhhdCdzIHdoYXQgSSB3YXMg
YWZyYWlkIG9mLiBXZSBmaWd1cmVkIHRoYXQgdGhlIHNjcmlwdCBtaWdodCBzdGlsbCBiZSBpbnZv
a2VkIGJ5IGJhc2ggYmVjYXVzZSBpdCBzdGFydHMgd2l0aCAiIyEvYmluL2Jhc2giIGFuZCB0aHVz
IGl0IG1pZ2h0IHdvcmssIGJ1dCBpZiB5b3UgdGVzdGVkIGl0IGFuZCBpdCBkaWRuJ3Qgd29yayBm
b3IgeW91IEkgdGhpbmsgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGFwcGx5IHRoaXMgcGF0Y2gu
DQoNClJlZ2FyZHMsDQpEZW5uaXMNCg==

