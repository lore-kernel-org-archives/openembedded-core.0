Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web08.5803.1619156950402867243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=pAbG4443;
 spf=pass (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=740451202=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1619156950; x=1650692950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=daBpY1zkj6im2ZN2Bi0vRc0c1rvho+yRLjvJT2tQnNc=;
  b=pAbG4443T3/u6VxPvQCLGBKaLoTyI7UBu3jtKSlySCLPD3lf48n6XW8w
   mNr5uQIQpyyHy87O6KxxVBwLbEXDsc41hyB4iCUHsjp7KcqC3WAtkkEv+
   iB4VVzuaNj99/pnh3539S4hbZeUfBR3TWCl0GE0OwEFuNn+jm8raokr6Z
   k=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Apr 2021 07:49:08 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
 23 Apr 2021 07:49:07 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb2.muc with ESMTP/TLS; 23 Apr 2021 07:49:07 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Fri, 23 Apr 2021 07:49:07 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Fri,
 23 Apr 2021 07:49:07 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
Thread-Topic: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
Thread-Index: AQHXN4WoRPskzvBziEeS57cY7Phh7qrAgUAAgAD27AA=
Date: Fri, 23 Apr 2021 05:49:07 +0000
Message-ID: <YIJf0rTBgrKAtI3B@korppu>
References: <20210422144152.29206-1-mikko.rapeli@bmw.de>
 <CAMKF1sq8YwMNdL7f-COjZLDxzNL=8CPrZmX-1WwDqYZc=aASOQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq8YwMNdL7f-COjZLDxzNL=8CPrZmX-1WwDqYZc=aASOQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E360B1917EBE7F4CA83948C2983B9081@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gVGh1LCBBcHIgMjIsIDIwMjEgYXQgMDg6MDU6MjBBTSAtMDcwMCwgS2hlbSBSYWogd3JvdGU6
DQo+IE9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDc6NDIgQU0gTWlra28gUmFwZWxpIDxtaWtrby5y
YXBlbGlAYm13LmRlPiB3cm90ZToNCj4gDQo+ID4gQ3VycmVudGx5IGx6NCB1c2VzIGl0J3Mgb3du
IGRlZmF1bHRzIHdoaWNoIGluY2x1ZGUgTzMgb3B0aW1pemF0aW9uLg0KPiA+IFN3aXRjaCBmcm9t
IE8zIHRvIGJpdGJha2UgZGVmYXVsdCBPMiByZWR1Y2VzIGJpbmFyeSBwYWNrYWdlIHNpemUNCj4g
PiBmcm9tIDQ2NzA1NiB0byAzMzE4ODggYnl0ZXMuIEVuYWJsZXMgYWxzbyBidWlsZGluZyB3aXRo
IE9zIGlmIG5lZWRlZC4NCj4gDQo+IA0KPiBUaGVzZSBjb3VsZCBpbXBhY3QgcnVudGltZSBwZXJm
b3JtYW5jZSBoYXZlIHlvdQ0KPiBDaGVja2VkIHdoYXQgdGhlIHJvdWdoIGltcGFjdCBpcyA/DQoN
Ck5vcGUsIGhhdmUgbm90IGNoZWNrZWQgdGhpcy4gSSd2ZSBidWlsZCBteSB0YXJnZXRzIHdpdGgg
dGhpcyBwYXRjaA0KYW5kIGhhdmUgbm90IG5vdGljZWQgYW55IG1ham9yIHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb24uIElmIHRoZXJlIGlzDQphIHBlcmZvcm1hbmNlIHByb2JsZW0sIHRoZW4gSSdkIHJh
dGhlciBzZWUgTzMgZXhwbGljaXRseSBzZXQgaW4gdGhlIHJlY2lwZSwNCmZvciBleGFtcGxlIGZv
ciBuYXRpdmUgdGFyZ2V0Lg0KDQo+IFNlY29uZGx5IHdlIHdpbGwgYmUgdXNpbmcgbm9uIGRlZmF1
bHQgc2V0IHdoaWNoIGNvdWxkIHJlc3VsdCBpbiBlcnJvcnMgbGVzcw0KPiBzZWVuIGJ5IG90aGVy
cyBvdmVyIHRpbWUgSSBoYXZlIHJlYWxpemVkIGl04oCZcyBhbHNvIGdvb2QgdG8gb3BlbiBhIGRp
YWxvZw0KPiB1cHN0cmVhbSBhbmQgZ2V0IHRoZSByZWFzb25pbmcgYmVoaW5kIG5vdCBsZXR0aW5n
IGRpc3RybyBkZWZhdWx0cyBhcHBseQ0KPiBzb21lIHBhY2thZ2VzIGRvIGhhdmUgdmFsaWQgcmVh
c29ucw0KDQpJJ3ZlIHNlZW4gYnVncyB3aXRoIE8zIG9wdGltemlhdGlvbiBsZXZlbCB0b28gb24g
c29tZSB0YXJnZXQgYXJjaHMuDQpJIHdvdWxkIG5vdCBlbmFibGUgdGhhdCBieSBkZWZhdWx0LiBC
dXQgSSBkbyB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4NCg0KSW4gc2ltaWxhciB3YXlzLCBJIHdh
cyBjaGVja2luZyBmZm1wZWcsIGF0dHIsIGFjbCBldGMgd2hpY2ggd2VyZSBkZWZhdWx0aW5nDQp0
byBPMyBpbiBvbGRlciB2ZXJzaW9ucyBidXQgd2l0aCBuZXcgcG9reSBtYXN0ZXIgdmVyc2lvbnMg
bm93IGJlaGF2ZSB3ZWxsDQphbmQgdXNlIGJpdGJha2UgZGVmYXVsdCBPMi4gSSBndWVzcyB0aGVy
ZSB0b28gbm8gbWFqb3IgcGVyZm9ybWFuY2UgcmVncmVzc2lvbnMNCmhhdmUgYmVlbiBkZXRlY3Rl
ZC4NCg0KQ2hlZXJzLA0KDQotTWlra28=
