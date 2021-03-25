Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.8602.1616682146815463267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AszMVPxj;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616682147;
  x=1648218147;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GJsDZXVV47fTGNAGHrpzGtjFoF9h4CyPisYUAHud13o=;
  b=AszMVPxjPPbXF7s6q0nmz91OqmrWXNPFrTAvtdgSetMX1wX6MfZ5IXHh
   p1NNeUabQyjVtRxKtANU1GKikXPTAzKE9HF3BGDBR6solf1t2PpZtPQ8C
   gxtf5iX3r8DpcvvSnbhsBc86TqRZFTroIrIwmkb33GV4xfqoH4YAySA7W
   8Wo6S+pDyy3M3hkE2LBifykJvLsk1OLcBXUcT3P/cMRnt3U5PghR86/+h
   Ntl5MkSrRmijcQz5R8iExBpvaeU7kbzCBw79EDAS3HbOd1hO/lBgeI0uJ
   DfSj26dg0bUoDmP44gZeNs3HHymvAYh/XY37rCRF31djhgdOla5gzSTdx
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Oleksiy Obitotskyi
 -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>, Luca Bocassi
	<luca.boccassi@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, "Khem
 Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
Thread-Topic: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe
 to allow bootstrapping
Thread-Index: AQHXFoim/dfc6J43RUKcvVlCArgZNqqUcYuAgAAEogCAAF+kAA==
Date: Thu, 25 Mar 2021 14:22:23 +0000
Message-ID: <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
In-Reply-To: <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDI1IG1hcnMgMjAy
MSAxMDozNA0KPiBUbzogT2xla3NpeSBPYml0b3Rza3lpIC1YIChvb2JpdG90cyAtIEdMT0JBTExP
R0lDIElOQyBhdCBDaXNjbykNCj4gPG9vYml0b3RzQGNpc2NvLmNvbT47IEx1Y2EgQm9jYXNzaSA8
bHVjYS5ib2NjYXNzaUBnbWFpbC5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBibHVlbGlnaHRuaW5nQGJsdWVsaWdodG5pbmcub3JnOyBQZXRl
ciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYx
MV0gdXRpbC1saW51eDogc3BsaXQgdXVpZCBpbiBzZXBhcmF0ZQ0KPiByZWNpcGUgdG8gYWxsb3cg
Ym9vdHN0cmFwcGluZw0KPiANCj4gT24gVGh1LCAyMDIxLTAzLTI1IGF0IDA5OjE3ICswMDAwLCBP
bGVrc2l5IE9iaXRvdHNreWkgLVggKG9vYml0b3RzIC0NCj4gR0xPQkFMTE9HSUMgSU5DIGF0IENp
c2NvKSB3cm90ZToNCj4gPiBDb3VsZCB5b3UgbG9vayBpbnRvIHRoaXMgd2FybmluZy4NCj4gPg0K
PiA+IFdBUk5JTkc6IHV0aWwtbGludXgtMi4zNi4yLXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3Vl
OiB1dGlsLWxpbnV4LWRldg0KPiByZGVwZW5kcyBvbiB1dGlsLWxpbnV4LWxpYnV1aWQtZGV2LCBi
dXQgaXQgaXNuJ3QgYSBidWlsZCBkZXBlbmRlbmN5Pw0KPiBbYnVpbGQtZGVwc10NCj4gPg0KPiA+
IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMv
NjEvYnVpbGRzLzMyMjYNCj4gDQo+IFRoYXQgZmFpbHVyZSB3YXMgbXkgZmF1bHQgd2hlbiB0ZXN0
aW5nIHNvbWUgZml4ZXMuDQo+IA0KPiBJJ3ZlIHNlbnQgb3V0IGEgcGF0Y2ggd2hpY2ggcmVuYW1l
cyB1dGlsLWxpbnV4LXV1aWQgdG8gdXRpbC1saW51eC1saWJ1dWlkDQo+IGFuZCBzb3J0cyBvdXQg
dGhlIGxpY2Vuc2UgaXNzdWUgUGV0ZXIgcmVwb3J0ZWQuDQoNCkkgZG9uJ3QgbWluZCB0aGUgcmVj
aXBlIGJlaW5nIHJlbmFtZWQgYW5kIGNsZWFuZWQgdXAsIGJ1dCBJIHdvdWxkIHByZWZlciANCnRv
IHNlZSBteSBlbnRpcmUgcGF0Y2ggZm9yIHRoZSBsaWNlbnNlIHBhcnRzIGJlaW5nIGVpdGhlciBp
bnRlZ3JhdGVkIGJlZm9yZSANCnRoaXMgb3Igc3F1YXNoZWQgaW50byBpdCwgd2hpY2hldmVyIHlv
dSBwcmVmZXIuIEl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gDQp1c2UgdGhlIHNhbWUgTElDX0ZJ
TEVTX0NIS1NVTSBmb3IgdXRpbC1saW51eC1saWJ1dWlkIGFzIGZvciB1dGlsLWxpbnV4LCANCmFu
ZCBzZXR0aW5nIHRoZSBvdGhlciBMSUNFTlNFIHZhcmlhYmxlcyBpbiB1dGlsLWxpbnV4LmluYyBu
byBsb25nZXIgbWFrZXMgDQpzZW5zZSBhcyB0aGV5IGFyZSBvbmx5IHJlbGV2YW50IGZvciB1dGls
LWxpbnV4Lg0KDQo+IEknbSBvcHRpbWlzdGljIHRoaXMgZml4ZXMgdGhlIHZhcmlvdXMgaXNzdWVz
IHBlb3BsZSBoYXZlIGJlZW4gaGF2aW5nDQo+IGFuZCBzaW1wbGlmaWVzIHRoZSByZWNpcGUgYSBi
aXQgYXMgYW4gYWRkZWQgYm9udXMuDQo+IA0KPiBUaGUgcGF0Y2ggaGFzIGFscmVhZHkgdGVzdGVk
IGNsZWFubHkgb24gdGhlIGF1dG9idWlsZGVyICh0aGUgYWJvdmUgd2FybmluZw0KPiB3YXMgZnJv
bSBhbiBlYXJsaWVyIGFib3J0ZWQgYnVpbGQgYmVmb3JlIEkgb3B0ZWQgdG8gcmVuYW1lIHRoZSBy
ZWNpcGUpLg0KPiANCj4gS2hlbTogVGhhbmtzIGZvciB0aGUgcmVsYXRlZCBtZXRhLW9lIHR3ZWFr
LCBJIHRoaW5rIHRoZSByZW5hbWUgd2hpbHN0DQo+IHNsaWdodGx5IHBhaW5mdWwgbm93IGlzIHRo
ZSBiZXN0IHdheSBmb3J3YXJkIG92ZXJhbGwuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJk
DQoNCi8vUGV0ZXINCg0K
