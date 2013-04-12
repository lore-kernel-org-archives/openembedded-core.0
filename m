Received: from mail-db8lp0185.outbound.messaging.microsoft.com
	([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UQeXU-0008Ea-Bc
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:01:18 +0200
Received: from mail139-db8-R.bigfish.com (10.174.8.234) by
	DB8EHSOBE030.bigfish.com (10.174.4.93) with Microsoft SMTP Server id
	14.1.225.23; Fri, 12 Apr 2013 13:28:44 +0000
Received: from mail139-db8 (localhost [127.0.0.1])	by
	mail139-db8-R.bigfish.com (Postfix) with ESMTP id 13E5920032B;
	Fri, 12 Apr 2013 13:28:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zz98dI9371I936eI542I1432I1447Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail139-db8 (localhost.localdomain [127.0.0.1]) by mail139-db8
	(MessageSwitch) id 1365773322460032_16595;
	Fri, 12 Apr 2013 13:28:42 +0000 (UTC)
Received: from DB8EHSMHS016.bigfish.com (unknown [10.174.8.244])	by
	mail139-db8.bigfish.com (Postfix) with ESMTP id 63BC83E0096;
	Fri, 12 Apr 2013 13:28:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS016.bigfish.com
	(10.174.4.26) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 12 Apr 2013 13:28:41 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.128]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Fri, 12 Apr 2013 13:28:40 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] The build issue of wayland-native on Linux distros
	with old glibc
Thread-Index: Ac42liK2o8WqNflgS5WKJV9DDJQE+gAXbx+AAABH04AAIyL2cA==
Date: Fri, 12 Apr 2013 13:28:39 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A014CE06A@039-SN2MPN1-021.039d.mgd.msft.net>
References: <CA452391058F6D4E9715FB2C29D9312A014CB5E0@039-SN2MPN1-021.039d.mgd.msft.net>
	<0D51FA37-DDC9-45EC-A3CF-543FAA905ECE@gmail.com>
	<1365712911.16702.61.camel@ted>
In-Reply-To: <1365712911.16702.61.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.33]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The build issue of wayland-native on Linux distros with old glibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 14:01:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgY29tbWVudHMgYW5kIHBhdGNoLCB0aGUgcGF0Y2ggd29ya3Mgd2VsbCBk
dXJpbmcgb3VyIGJ1aWxkIHRlc3QuIA0KDQoNCkJlc3QgUmVnYXJkcywNCg0KWmhlbmh1YQ0KDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21h
aWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBGcmlkYXks
IEFwcmlsIDEyLCAyMDEzIDQ6NDIgQU0NCj4gVG86IEtoZW0gUmFqDQo+IENjOiBMdW8gWmhlbmh1
YS1CMTk1Mzc7IEd1byBDaHVucm9uZy1CNDAyOTA7IExpdSBUaW5nLUIyODQ5NTsNCj4gb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFRoZSBidWlsZCBpc3N1ZSBvZiB3YXlsYW5kLW5hdGl2ZSBvbiBMaW51eCBkaXN0cm9zDQo+
IHdpdGggb2xkIGdsaWJjDQo+IA0KPiBPbiBUaHUsIDIwMTMtMDQtMTEgYXQgMTM6MzMgLTA3MDAs
IEtoZW0gUmFqIHdyb3RlOg0KPiA+IE9uIEFwciAxMSwgMjAxMywgYXQgMjoyMiBBTSwgTHVvIFpo
ZW5odWEtQjE5NTM3IDxCMTk1MzdAZnJlZXNjYWxlLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiA+
IEkgdHJpZWQgdG8gYnVpbGQgd2F5bGFuZC1uYXRpdmUgd2hpY2ggcmVxdWlyZXMgc3lzL3NpZ25h
bGZkLmggYW5kDQo+IHN5cy90aW1lcmZkLmgsIHRoZSB0d28gaGVhZGVycyBhcmUgbm90IHByb3Zp
ZGVkIGJ5IFlvY3RvIGJ1aWxkIGVudiwgc28NCj4gaG9zdCB2ZXJzaW9uIGlzIHNlYXJjaGVkLg0K
PiA+ID4NCj4gPg0KPiA+DQo+ID4gdGhvc2UgYXJlIGNvbWluZyBmcm9tIGxpYmMsIEkgZG9uJ3Qg
dGhpbmsgd2UgdXNlIG93biBsaWJjIGZvciBuYXRpdmUNCj4gPiBwYWNrYWdlcy4gU28gdGhleSBo
YXZlIHRvIGNvbWUgZnJvbSBob3N0IGxpYmMsIGZvciBuYXRpdmVzZGsgZGlmZmVyZW50DQo+ID4g
c3RvcnkNCj4gPg0KPiA+ID4gV2hlbiB0aGUgYnVpbGQgaXMgY29uZHVjdGVkIGluIExpbnV4IGRp
c3Ryb3Mgd2l0aCBvbGQgZ2xpYmMobm90IHN1cmUNCj4gYWJvdXQgdGhlIGFjY3VyYXRlIHZlcnNp
b24pLCBhYm92ZSB0d28gaGVhZGVycyBhcmUgbm90IGF2YWlsYWJsZSwgc28NCj4gYnVpbGQgd2ls
bCBmYWlsZWQgYXMgZm9sbG93aW5nOg0KPiA+ID4gfCAvaG9tZS95b2N0by93b3Jrc3BhY2Uvc2Rr
LWRldmVsL2J1aWxkX3A0MDgwZHNfcmVsZWFzZS90bXAvd29yay94ODYNCj4gPiA+IHwgXzY0LWxp
bnV4L3dheWxhbmQtbmF0aXZlLzEuMC42LXIwL3dheWxhbmQtMS4wLjYvc3JjL2V2ZW50LWxvb3Au
YzozDQo+ID4gPiB8IDM6MjY6IGVycm9yOiBzeXMvc2lnbmFsZmQuaDogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQ0KPiA+ID4gfCAvaG9tZS95b2N0by93b3Jrc3BhY2Uvc2RrLWRldmVsL2J1aWxk
X3A0MDgwZHNfcmVsZWFzZS90bXAvd29yay94ODYNCj4gPiA+IHwgXzY0LWxpbnV4L3dheWxhbmQt
bmF0aXZlLzEuMC42LXIwL3dheWxhbmQtMS4wLjYvc3JjL2V2ZW50LWxvb3AuYzozDQo+ID4gPiB8
IDQ6MjU6IGVycm9yOiBzeXMvdGltZXJmZC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+
ID4gPg0KPiA+ID4gQ2FuIGFueWJvZHkgc2hlZCBzb21lIGxpZ2h0IG9uIGhvdyB0byBzb2x2ZSB0
aGUgaXNzdWUgaW4gWW9jdG8gdG8NCj4gZW5zdXJlIHRoZSBidWlsZCBkb2Vzbid0IGRlcGVuZCBv
biBob3N0IGVudj8NCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9NDI0NQ0KPiANCj4gS2hlbSBpcyByaWdodCwgaXQgc2hvdWxkIGJlIHVzaW5n
IHRoZSBob3N0IGxpYmMgYnV0IHBlcmhhcHMgd2UgY2FuIGN1dA0KPiBkb3duIGhvdyBtdWNoIG9m
IHdheWxhbmQgd2UgYnVpbGQgbmF0aXZlbHkuIEhvcGVmdWxseSBSb3NzIG1pZ2h0IGhhdmUgYQ0K
PiBmaXgsIHNlZSB0aGUgYWJvdmUgYnVnLCBoZWxwIHRlc3Rpbmcgd291bGQgYmUgYXBwcmVjaWF0
ZWQuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiANCj4gDQoNCg==



