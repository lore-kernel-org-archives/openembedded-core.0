Received: from mailout-afstr39.mailout.artfiles.de (mailout-afstr39.mailout.artfiles.de [212.72.187.39])
 by mx.groups.io with SMTP id smtpd.web11.6884.1601037199776185847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 05:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: garz-fricke.com, ip: 212.72.187.39, mailfrom: norman.stetter@garz-fricke.com)
Received: from [176.95.71.124] (helo=mail.garz-fricke.com)
	auth=mx@garz-fricke.com
	by mailout.artfiles.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.86_2)
	id 1kLmua-0003fU-PK; Fri, 25 Sep 2020 14:33:16 +0200
Received: from SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188]) by
 SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188%12]) with mapi id
 14.03.0487.000; Fri, 25 Sep 2020 14:33:16 +0200
From: "Norman" <norman.stetter@garz-fricke.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][Patch] sstate.bbclass: Check file ownership before doing 'touch -a'
Thread-Topic: [OE-core][Patch] sstate.bbclass: Check file ownership before
 doing 'touch -a'
Thread-Index: AQHWkzciVmIjSmPP6kKePntvEsv/Xql5SHPQ
Date: Fri, 25 Sep 2020 12:33:15 +0000
Message-ID: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FA1A2@SRV24.hamburg.garz-fricke.de>
References: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FA16E@SRV24.hamburg.garz-fricke.de>
 <CAHtQpK7FZk6ZxmkiX30Mm2hg654rw=w9Wpb7-Sgvok+BwWEFPg@mail.gmail.com>
In-Reply-To: <CAHtQpK7FZk6ZxmkiX30Mm2hg654rw=w9Wpb7-Sgvok+BwWEFPg@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.56.33]
x-esetresult: clean, is OK
x-esetid: 37303A29B687C86B6C7464
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2UgZG8gdXNlIFNTVEFURV9NSVJST1IsIHBvaW50aW5nIHRvIGEgbG9jYWxseSBtb3VudGVkIGRy
aXZlIHRoYXQgZ2V0cyBwb3B1bGF0ZWQgYnkgQ0ktYnVpbGRzOg0KDQpTU1RBVEVfTUlSUk9SUyA9
ICJmaWxlOi8vLiogZmlsZTovLy92YXIvY2FjaGUveW9jdG8vc3N0YXRlLWNhY2hlL1BBVEgiDQoN
Cg0KDQo+IC0tLS0tVXJzcHLDvG5nbGljaGUgTmFjaHJpY2h0LS0tLS0NCj4gVm9uOiBBbmRyZXkg
Wmhpemhpa2luIFttYWlsdG86YW5kcmV5LnpAZ21haWwuY29tXQ0KPiBHZXNlbmRldDogRnJpZGF5
LCBTZXB0ZW1iZXIgMjUsIDIwMjAgMjoyNyBQTQ0KPiBBbjogTm9ybWFuIFN0ZXR0ZXIgPE5vcm1h
bi5TdGV0dGVyQGdhcnotZnJpY2tlLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gQmV0cmVmZjogUmU6IFtPRS1jb3JlXVtQYXRjaF0gc3N0YXRl
LmJiY2xhc3M6IENoZWNrIGZpbGUgb3duZXJzaGlwIGJlZm9yZQ0KPiBkb2luZyAndG91Y2ggLWEn
DQo+IA0KPiBPbiBGcmksIFNlcCAyNSwgMjAyMCBhdCAyOjE5IFBNIE5vcm1hbiA8bm9ybWFuLnN0
ZXR0ZXJAZ2Fyei1mcmlja2UuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEZyb20gY2Q1MWRiMjUz
YzFhODFlNDc1MzJmMWFmYWNjZTM4NWU0MjJkOWE3MyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIw
MDENCj4gPiBGcm9tOiBOb3JtYW4gU3RldHRlciA8bm9ybWFuLnN0ZXR0ZXJAZ2Fyei1mcmlja2Uu
Y29tPg0KPiA+IERhdGU6IEZyaSwgMjUgU2VwIDIwMjAgMTM6NDk6NDMgKzAyMDANCj4gPiBTdWJq
ZWN0OiBzc3RhdGUuYmJjbGFzczogQ2hlY2sgZmlsZSBvd25lcnNoaXAgYmVmb3JlIGRvaW5nICd0
b3VjaCAtYScNCj4gPg0KPiA+IEluIGNvbnRyYXN0IHRvICd0b3VjaGluZycgYSBmaWxlIHdpdGhv
dXQgcGFyYW1ldGVycyAndG91Y2ggLWEnIGNhbg0KPiA+IG9ubHkgYmUgcGVyZm9ybWVkIGJ5IHRo
ZSBmaWxlIG93bmVyLiBJbiBjYXNlIG9mIGEgc2hhcmVkIHNzdGF0ZS1jYWNoZQ0KPiA+IHNlcnZl
ZCBsb2NhbGx5IChlLmcuIG92ZXIgTkZTKSwgIHdoZXJlIHRoZSB1c2VyIHJ1bm5pbmcgYml0YmFr
ZSBpcyBub3QNCj4gPiB0aGUgb3duZXIgb2Ygc3N0YXRlLWNhY2hlIGZpbGVzLCBldmVuIGlmIGhl
IGhhcyB3cml0ZSBhY2Nlc3Mgb24gZ3JvdXANCj4gPiBsZXZlbCwgdGhlIHNzdGF0ZV91bnBhY2tf
cGFja2FnZSB0YXNrIHdpbGwgZmFpbC4NCj4gDQo+IElzbid0IHRoZSB3aG9sZSBpbnRlbnRpb24g
b2YgdXNpbmcgU1NUQVRFX01JUlJPUiB0byBjb3ZlciBleGFjdGx5IHRob3NlDQo+IGNhc2VzPyBJ
IGRvIG5vdCB0aGluayB0aGF0IHJldXNpbmcgc3N0YXRlIGJldHdlZW4gZGlmZmVyZW50IGJ1aWxk
ZXJzIHZpYSBORlMgaXMNCj4gYSBwcm9wZXIgd2F5IHRvIGdvLg0KPiANCj4gPiBDaGVja2luZyBp
ZiB0aGUgZmlsZSBpcyBvd25lZCBieSB0aGUgdXNlciBiZWZvcmUgYXR0ZW1wdGluZyB0byBydW4N
Cj4gPiAndG91Y2ggLWEnIG9uIGl0IHNvbHZlcyB0aGlzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogTm9ybWFuIFN0ZXR0ZXIgPG5vcm1hbi5zdGV0dGVyQGdhcnotZnJpY2tlLmNvbT4NCj4gPiAt
LS0NCj4gPiAgbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzIHwgMiArLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9tZXRhL2NsYXNzZXMvc3N0YXRlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvc3N0YXRlLmJi
Y2xhc3MNCj4gPiBpbmRleCAzNzUxOTZlZjIxLi42NmE5NmE3NjAzIDEwMDY0NA0KPiA+IC0tLSBh
L21ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy9zc3Rh
dGUuYmJjbGFzcw0KPiA+IEBAIC04NDcsNyArODQ3LDcgQEAgcHl0aG9uIHNzdGF0ZV9yZXBvcnRf
dW5paGFzaCgpIHsNCj4gPiBzc3RhdGVfdW5wYWNrX3BhY2thZ2UgKCkgew0KPiA+ICAgICAgICAg
dGFyIC14dnpmICR7U1NUQVRFX1BLR30NCj4gPiAgICAgICAgICMgdXBkYXRlIC5zaWdpbmZvIGF0
aW1lIG9uIGxvY2FsL05GUyBtaXJyb3INCj4gPiAtICAgICAgIFsgLXcgJHtTU1RBVEVfUEtHfS5z
aWdpbmZvIF0gJiYgWyAtaCAke1NTVEFURV9QS0d9LnNpZ2luZm8gXSAmJiB0b3VjaA0KPiAtYSAk
e1NTVEFURV9QS0d9LnNpZ2luZm8NCj4gPiArICAgICAgIFsgLU8gJHtTU1RBVEVfUEtHfS5zaWdp
bmZvIF0gJiYgWyAtdyAke1NTVEFURV9QS0d9LnNpZ2luZm8gXQ0KPiA+ICsgJiYgWyAtaCAke1NT
VEFURV9QS0d9LnNpZ2luZm8gXSAmJiB0b3VjaCAtYSAke1NTVEFURV9QS0d9LnNpZ2luZm8NCj4g
PiAgICAgICAgICMgVXNlICIhIC13IHx8IiB0byByZXR1cm4gdHJ1ZSBmb3IgcmVhZCBvbmx5IGZp
bGVzDQo+ID4gICAgICAgICBbICEgLXcgJHtTU1RBVEVfUEtHfSBdIHx8IHRvdWNoIC0tbm8tZGVy
ZWZlcmVuY2UgJHtTU1RBVEVfUEtHfQ0KPiA+ICAgICAgICAgWyAhIC13ICR7U1NUQVRFX1BLR30u
c2lnIF0gfHwgWyAhIC1lICR7U1NUQVRFX1BLR30uc2lnIF0gfHwNCj4gPiB0b3VjaCAtLW5vLWRl
cmVmZXJlbmNlICR7U1NUQVRFX1BLR30uc2lnDQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KPiA+
DQo+ID4gDQo+ID4NCj4gDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiBBbmRyZXkuDQo=
