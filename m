Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.1757.1616689186958803673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cwz6bY3i;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616689187;
  x=1648225187;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EXjZ6yWn7F4ml2tW25gFk7Inljmx0ze+63UV/QwI8EY=;
  b=cwz6bY3ikYjl62vsWXps/jIDnaK9DPv1PR+AD6sG77y9+uiz5NnqIwAq
   xpzdcVcYE0ERzcJRrVVSUc4/j7xbqrO3niyNgfajnG78JLuuamk97OooO
   zGBWwhJvQB0wCP3ob40DGaEGrOChSLXiObXuyJ5FvyiHAkvaMtrHMIVnL
   tWWqYodZKnw4qtkfBGaZncPZTjb0cfM6z3Sjwb/qQf6mfH6pLGjN3vdOp
   blVl8pDp8vjLDD/QC3TXLOJm8oWIaZQoqCnbKuL/afIWOZ0ZvAcRSqacp
   TBeX0L7XmTPlZKAxuGb1WbW8nqGDTMSE67yQClYQ+zYftUuIUuu1u+VQ3
   Q==;
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
Thread-Index: AQHXFoim/dfc6J43RUKcvVlCArgZNqqUcYuAgAAEogCAAF+kAP//8j4AgAAuUTA=
Date: Thu, 25 Mar 2021 16:19:44 +0000
Message-ID: <bffd569338fe4f9f9e5671443d6cdbc6@XBOX03.axis.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
	 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
 <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
In-Reply-To: <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
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
MSAxNToyNw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBPbGVrc2l5IE9iaXRvdHNreWkgLQ0KPiBYIChvb2JpdG90cyAtIEdMT0JBTExPR0lD
IElOQyBhdCBDaXNjbykgPG9vYml0b3RzQGNpc2NvLmNvbT47IEx1Y2EgQm9jYXNzaQ0KPiA8bHVj
YS5ib2NjYXNzaUBnbWFpbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IENjOiBibHVlbGlnaHRuaW5nQGJsdWVsaWdodG5pbmcub3JnOyBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2MTFd
IHV0aWwtbGludXg6IHNwbGl0IHV1aWQgaW4gc2VwYXJhdGUNCj4gcmVjaXBlIHRvIGFsbG93IGJv
b3RzdHJhcHBpbmcNCj4gDQo+IE9uIFRodSwgMjAyMS0wMy0yNSBhdCAxNDoyMiArMDAwMCwgUGV0
ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPg0KPiA+ID4gU2VudDogZGVuIDI1IG1hcnMgMjAyMSAxMDozNA0KPiA+ID4gVG86IE9s
ZWtzaXkgT2JpdG90c2t5aSAtWCAob29iaXRvdHMgLSBHTE9CQUxMT0dJQyBJTkMgYXQgQ2lzY28p
DQo+ID4gPiA8b29iaXRvdHNAY2lzY28uY29tPjsgTHVjYSBCb2Nhc3NpIDxsdWNhLmJvY2Nhc3Np
QGdtYWlsLmNvbT47DQo+ID4gPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gPiBDYzogYmx1ZWxpZ2h0bmluZ0BibHVlbGlnaHRuaW5nLm9yZzsgUGV0ZXIgS2pl
bGxlcnN0ZWR0DQo+ID4gPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IHYxMV0gdXRpbC1saW51eDogc3BsaXQgdXVpZCBpbiBzZXBhcmF0ZQ0KPiA+ID4gcmVjaXBlIHRv
IGFsbG93IGJvb3RzdHJhcHBpbmcNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDIwMjEtMDMtMjUgYXQg
MDk6MTcgKzAwMDAsIE9sZWtzaXkgT2JpdG90c2t5aSAtWCAob29iaXRvdHMgLQ0KPiA+ID4gR0xP
QkFMTE9HSUMgSU5DIGF0IENpc2NvKSB3cm90ZToNCj4gPiA+ID4gQ291bGQgeW91IGxvb2sgaW50
byB0aGlzIHdhcm5pbmcuDQo+ID4gPiA+DQo+ID4gPiA+IFdBUk5JTkc6IHV0aWwtbGludXgtMi4z
Ni4yLXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiB1dGlsLWxpbnV4LQ0KPiBkZXYNCj4gPiA+
IHJkZXBlbmRzIG9uIHV0aWwtbGludXgtbGlidXVpZC1kZXYsIGJ1dCBpdCBpc24ndCBhIGJ1aWxk
IGRlcGVuZGVuY3k/DQo+ID4gPiBbYnVpbGQtZGVwc10NCj4gPiA+ID4NCj4gPiA+ID4NCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy82MS9i
dWlsZHMvMzIyNg0KPiA+ID4NCj4gPiA+IFRoYXQgZmFpbHVyZSB3YXMgbXkgZmF1bHQgd2hlbiB0
ZXN0aW5nIHNvbWUgZml4ZXMuDQo+ID4gPg0KPiA+ID4gSSd2ZSBzZW50IG91dCBhIHBhdGNoIHdo
aWNoIHJlbmFtZXMgdXRpbC1saW51eC11dWlkIHRvIHV0aWwtbGludXgtDQo+IGxpYnV1aWQNCj4g
PiA+IGFuZCBzb3J0cyBvdXQgdGhlIGxpY2Vuc2UgaXNzdWUgUGV0ZXIgcmVwb3J0ZWQuDQo+ID4N
Cj4gPiBJIGRvbid0IG1pbmQgdGhlIHJlY2lwZSBiZWluZyByZW5hbWVkIGFuZCBjbGVhbmVkIHVw
LCBidXQgSSB3b3VsZCBwcmVmZXINCj4gPiB0byBzZWUgbXkgZW50aXJlIHBhdGNoIGZvciB0aGUg
bGljZW5zZSBwYXJ0cyBiZWluZyBlaXRoZXIgaW50ZWdyYXRlZA0KPiBiZWZvcmUNCj4gPiB0aGlz
IG9yIHNxdWFzaGVkIGludG8gaXQsIHdoaWNoZXZlciB5b3UgcHJlZmVyLiBJdCBkb2VzIG5vdCBt
YWtlIHNlbnNlDQo+IHRvDQo+ID4gdXNlIHRoZSBzYW1lIExJQ19GSUxFU19DSEtTVU0gZm9yIHV0
aWwtbGludXgtbGlidXVpZCBhcyBmb3IgdXRpbC1saW51eCwNCj4gPiBhbmQgc2V0dGluZyB0aGUg
b3RoZXIgTElDRU5TRSB2YXJpYWJsZXMgaW4gdXRpbC1saW51eC5pbmMgbm8gbG9uZ2VyDQo+IG1h
a2VzDQo+ID4gc2Vuc2UgYXMgdGhleSBhcmUgb25seSByZWxldmFudCBmb3IgdXRpbC1saW51eC4N
Cj4gDQo+IEknbSB0b3JuIG9uIHRoYXQuIENvZGUgd2l0aCB0aGUgb3RoZXIgbGljZW5zZXMgaXMg
cHJlc2VudCwganVzdCBub3QgdXNlZA0KPiBpbiB0aGUgZmluYWwgb3V0cHV0IGFuZCBJIHBlcnNv
bmFsbHkgc3VzcGVjdCB0aGF0IGhhdmluZyBvbmUgTElDX0ZJTEVTX0NIS1NVTQ0KPiBpcyBnb2lu
ZyB0byBiZSBlYXNpZXIgdG8gbWFpbnRhaW4gaW4gdGhlIGZ1dHVyZSByYXRoZXIgdGhhbiB0d28g
c2VwYXJhdGUNCj4gb25lcy4NCg0KSSBhY3R1YWxseSBjaGVja2VkIGFsbCB0aGUgZmlsZXMgdGhh
dCBnbyBpbnRvIC1kZXYgYW5kIC1zcmMgYmVmb3JlIHN1Z2dlc3RpbmcgDQp0aGlzIGNoYW5nZSwg
YW5kIGFsbCBmaWxlcyBhcmUgZWl0aGVyIG1hcmtlZCBhcyBwdWJsaWMgZG9tYWluIG9yIHVzZSBh
IA0KQlNELTMtQ2xhdXNlIGxpY2Vuc2UuDQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQov
L1BldGVyDQoNCg==
