Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.6568.1619162569589409934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 00:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Y6HejFYO;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=740451202=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1619162569; x=1650698569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E8w3/ttRB6Iq41BTO3J5G9xDhPsWuSFrxACDoUFZD48=;
  b=Y6HejFYONQvi/G6vY56YqBnCuF65BP5icVTAqRWedEwjkPwIzpSSXc/H
   qIq3Xfr6xyW2+qUhjAYKc0J0HMp6SBonZjSIFCf8ScozbXuDCuYciMyqm
   o7JH/WNjx5BXm1lkKl2YFHt7N1jIffK52iFzo0Ya/DT8T926v0gn9NRyJ
   I=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Apr 2021 09:22:47 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 23 Apr 2021 09:22:46 +0200
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb4.muc with ESMTP/TLS; 23 Apr 2021 09:22:45 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Fri, 23 Apr 2021 09:22:45 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Fri,
 23 Apr 2021 09:22:45 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
Thread-Topic: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
Thread-Index: AQHXN4WoRPskzvBziEeS57cY7Phh7qrAgUAAgAD27ACAAAM7AIAAFu4A
Date: Fri, 23 Apr 2021 07:22:45 +0000
Message-ID: <YIJ1xAYDJsPFiKCP@korppu>
References: <20210422144152.29206-1-mikko.rapeli@bmw.de>
 <CAMKF1sq8YwMNdL7f-COjZLDxzNL=8CPrZmX-1WwDqYZc=aASOQ@mail.gmail.com>
 <YIJf0rTBgrKAtI3B@korppu>
 <CAMKF1spK-XtiyRnOvOp5DuwtVdx-ZYBjW1LBJJrb16Uk3xCBkg@mail.gmail.com>
In-Reply-To: <CAMKF1spK-XtiyRnOvOp5DuwtVdx-ZYBjW1LBJJrb16Uk3xCBkg@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <075ECD44BCAB6949BCF75873B801417F@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gVGh1LCBBcHIgMjIsIDIwMjEgYXQgMTE6MDA6NDBQTSAtMDcwMCwgS2hlbSBSYWogd3JvdGU6
DQo+IE9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDEwOjQ5IFBNIDxNaWtrby5SYXBlbGlAYm13LmRl
PiB3cm90ZToNCj4gPg0KPiA+IE9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDA4OjA1OjIwQU0gLTA3
MDAsIEtoZW0gUmFqIHdyb3RlOg0KPiA+ID4gT24gVGh1LCBBcHIgMjIsIDIwMjEgYXQgNzo0MiBB
TSBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBibXcuZGU+IHdyb3RlOg0KPiA+ID4NCj4gPiA+
ID4gQ3VycmVudGx5IGx6NCB1c2VzIGl0J3Mgb3duIGRlZmF1bHRzIHdoaWNoIGluY2x1ZGUgTzMg
b3B0aW1pemF0aW9uLg0KPiA+ID4gPiBTd2l0Y2ggZnJvbSBPMyB0byBiaXRiYWtlIGRlZmF1bHQg
TzIgcmVkdWNlcyBiaW5hcnkgcGFja2FnZSBzaXplDQo+ID4gPiA+IGZyb20gNDY3MDU2IHRvIDMz
MTg4OCBieXRlcy4gRW5hYmxlcyBhbHNvIGJ1aWxkaW5nIHdpdGggT3MgaWYgbmVlZGVkLg0KPiA+
ID4NCj4gPiA+DQo+ID4gPiBUaGVzZSBjb3VsZCBpbXBhY3QgcnVudGltZSBwZXJmb3JtYW5jZSBo
YXZlIHlvdQ0KPiA+ID4gQ2hlY2tlZCB3aGF0IHRoZSByb3VnaCBpbXBhY3QgaXMgPw0KPiA+DQo+
ID4gTm9wZSwgaGF2ZSBub3QgY2hlY2tlZCB0aGlzLiBJJ3ZlIGJ1aWxkIG15IHRhcmdldHMgd2l0
aCB0aGlzIHBhdGNoDQo+ID4gYW5kIGhhdmUgbm90IG5vdGljZWQgYW55IG1ham9yIHBlcmZvcm1h
bmNlIHJlZ3Jlc3Npb24uIElmIHRoZXJlIGlzDQo+ID4gYSBwZXJmb3JtYW5jZSBwcm9ibGVtLCB0
aGVuIEknZCByYXRoZXIgc2VlIE8zIGV4cGxpY2l0bHkgc2V0IGluIHRoZSByZWNpcGUsDQo+ID4g
Zm9yIGV4YW1wbGUgZm9yIG5hdGl2ZSB0YXJnZXQuDQo+ID4NCj4gPiA+IFNlY29uZGx5IHdlIHdp
bGwgYmUgdXNpbmcgbm9uIGRlZmF1bHQgc2V0IHdoaWNoIGNvdWxkIHJlc3VsdCBpbiBlcnJvcnMg
bGVzcw0KPiA+ID4gc2VlbiBieSBvdGhlcnMgb3ZlciB0aW1lIEkgaGF2ZSByZWFsaXplZCBpdOKA
mXMgYWxzbyBnb29kIHRvIG9wZW4gYSBkaWFsb2cNCj4gPiA+IHVwc3RyZWFtIGFuZCBnZXQgdGhl
IHJlYXNvbmluZyBiZWhpbmQgbm90IGxldHRpbmcgZGlzdHJvIGRlZmF1bHRzIGFwcGx5DQo+ID4g
PiBzb21lIHBhY2thZ2VzIGRvIGhhdmUgdmFsaWQgcmVhc29ucw0KPiA+DQo+ID4gSSd2ZSBzZWVu
IGJ1Z3Mgd2l0aCBPMyBvcHRpbXppYXRpb24gbGV2ZWwgdG9vIG9uIHNvbWUgdGFyZ2V0IGFyY2hz
Lg0KPiA+IEkgd291bGQgbm90IGVuYWJsZSB0aGF0IGJ5IGRlZmF1bHQuIEJ1dCBJIGRvIHVuZGVy
c3RhbmQgeW91ciBjb25jZXJuLg0KPiA+DQo+ID4gSW4gc2ltaWxhciB3YXlzLCBJIHdhcyBjaGVj
a2luZyBmZm1wZWcsIGF0dHIsIGFjbCBldGMgd2hpY2ggd2VyZSBkZWZhdWx0aW5nDQo+ID4gdG8g
TzMgaW4gb2xkZXIgdmVyc2lvbnMgYnV0IHdpdGggbmV3IHBva3kgbWFzdGVyIHZlcnNpb25zIG5v
dyBiZWhhdmUgd2VsbA0KPiA+IGFuZCB1c2UgYml0YmFrZSBkZWZhdWx0IE8yLiBJIGd1ZXNzIHRo
ZXJlIHRvbyBubyBtYWpvciBwZXJmb3JtYW5jZSByZWdyZXNzaW9ucw0KPiA+IGhhdmUgYmVlbiBk
ZXRlY3RlZC4NCj4gPg0KPiANCj4gVGhhbmtzIGZvciBjaGVja2luZyB0aGlzIG91dC4gUGVyaGFw
cyBpdCB3aWxsIGJlIGdvb2QgdG8gcGluZyB1cHN0cmVhbQ0KPiBhbmQgcmFpc2UgdGhpcw0KPiB0
aGF0IHdlIGFyZSBjaGFuZ2luZyBkZWZhdWx0IG9wdHMsICBhcmUgdGhlcmUgYW55IGNvbmNlcm5z
IHdlIHNob3VsZCBrbm93Lg0KDQpXZWxsLCB0byBtZSB0aGUgZ2xvYmFsIG9wdGltaXphdGlvbiBm
bGFncyBzZXQgYnkgYml0YmFrZSBhcmUgYSBkaXN0cm8NCndpZGUgcG9saWN5IHdoaWNoIHdlIG9u
IGJpdGJha2Ugc2lkZSBhcmUgYWxsb3dlZCBhbmQgc2hvdWxkIGRvIHdoZW4gZXZlciB3ZQ0KcGxl
YXNlLiBVcHN0cmVhbXMgbWF5IGhhdmUgZGlmZmVyZW50IG9waW5pb25zLCBidXQgYWxsIEkndmUg
c2VlbiBpcyB0aGF0DQp0aG9zZSB3aG8gdGhpbmsgTzMgaXMgZ29vZCBvciBiZXR0ZXIsIHVzdWFs
bHkgZW5kIHVwIGFkZGluZyBhIGxvdCBvZg0Kd29ya2Fyb3VuZHMgZHVlIHRvIHZhcmlvdXMgYnVn
Z3kgY29tcGlsZXIgdmVyc2lvbnMsIGUuZy4gZmFsbCBiYWNrIHRvIE8yLg0KDQpJIGNoZWNrZWQg
bHo0IGNoYXQgYW5kIGZvdW5kIHRoaXMgd2hpY2ggZXZlbiBzYXlzIHRoYXQgTzIgaXMgZmFzdGVy
DQpvbiBzb21lIGFyY2ggYW5kIGJlbmNobWFyazoNCg0KaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9nL2x6NGMvYy9MMGNhSldkLXZDWQ0KDQpOb3csIGlmIGFueW9uZSB3YW50cyB0byB0cnkgdG8g
dXNlIE9zIGV2ZXJ5d2hlcmUgdG8gcmVkdWNlIGJpbmFyeSBzaXplcywgdGhlbg0KcmVzcGVjdGlu
ZyBiaXRiYWtlIGNvbXBpbGUgZmxhZ3MgYmVjb21lcyBpbXBvcnRhbnQuIFRoZSBleGNlcHRpb25z
IHRvIHRoZQ0KZGVmYXVsdHMgbmVlZCB0byBiZSBldmFsdWF0ZWQgcGVyIHVzZSBjYXNlLCBwZXIg
dGFyZ2V0IGFuZCB3aXRoIG1lYXN1cmVtZW50cy4NCg0KQW5kIHNvcnJ5LCBmb3IgdGhpcyBjaGFu
Z2UgSSBkb24ndCBoYXZlIG1lYXN1cmVtZW50cyBvZiB0aGUgZWZmZWN0IGV4Y2VwdCBmb3INCmJp
bmFyeSBzaXplLg0KDQotTWlra28=
