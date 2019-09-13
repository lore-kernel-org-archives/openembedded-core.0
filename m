Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1604D7ED5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 17:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A513818521;
	Fri, 13 Sep 2019 19:32:01 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WWOWzFg0CRaI; Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A4BC4182A0;
	Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9421E1E078;
	Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88CC71E06E;
	Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from xbox06.axis.com (xbox06.axis.com [10.0.15.176])
	by thoth.se.axis.com (Postfix) with ESMTP id 7C9E211D4;
	Fri, 13 Sep 2019 19:32:00 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by xbox06.axis.com (10.0.15.176)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 13 Sep 2019 19:32:00 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Fri, 13 Sep 2019 19:32:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Nathan Rossi <nathan@nathanrossi.com>
Thread-Topic: [OE-core] [PATCH] glibc-testsuite: SkipRecipe if libc is not
	glibc
Thread-Index: AQHVagfFyaN8nXgPBUK/zBWNQxtywacpfhYAgABehNA=
Date: Fri, 13 Sep 2019 17:32:00 +0000
Message-ID: <5226ddceb0784a8d88c4a6fe1db4ddcc@xbox06.axis.com>
References: <20190913074910.23384-1-nathan@nathanrossi.com>
	<CAMKF1sr5W3a2mT46Gt=GG=A32gWLVABiOL7PHc2TwNksH5CrSw@mail.gmail.com>
In-Reply-To: <CAMKF1sr5W3a2mT46Gt=GG=A32gWLVABiOL7PHc2TwNksH5CrSw@mail.gmail.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-testsuite: SkipRecipe if libc is not glibc
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
X-List-Received-Date: Fri, 13 Sep 2019 17:32:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTMgc2VwdGVtYmVyIDIwMTkgMTU6NDgNCj4gVG86IE5h
dGhhbiBSb3NzaSA8bmF0aGFuQG5hdGhhbnJvc3NpLmNvbT4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRp
c2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2pl
bGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZ2xp
YmMtdGVzdHN1aXRlOiBTa2lwUmVjaXBlIGlmIGxpYmMgaXMNCj4gbm90IGdsaWJjDQo+IA0KPiBP
biBGcmksIFNlcCAxMywgMjAxOSBhdCAxMjo0OSBBTSBOYXRoYW4gUm9zc2kgPG5hdGhhbkBuYXRo
YW5yb3NzaS5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVG8gcHJldmVudCBpc3N1ZXMgd2l0aCBw
YXJzaW5nIG9yIGRlcGVuZGVuY2llcywgbGltaXQgdGhpcyByZWNpcGUgdG8NCj4gdXNlDQo+ID4g
b25seSB3aGVuIHRoZSBsaWJjIGlzIGdsaWJjIChhbmQgbGliYy1sb2NhbGUgaXMgZ2xpYmMtbG9j
YWxlKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBSb3NzaSA8bmF0aGFuQG5hdGhh
bnJvc3NpLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMt
dGVzdHN1aXRlXzIuMzAuYmIgfCA3ICsrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJj
L2dsaWJjLXRlc3RzdWl0ZV8yLjMwLmJiDQo+IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xp
YmMtdGVzdHN1aXRlXzIuMzAuYmINCj4gPiBpbmRleCA2NGZhOGQ4N2RmLi42NTdmZDRkYmMxIDEw
MDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLXRlc3RzdWl0ZV8y
LjMwLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtdGVzdHN1aXRl
XzIuMzAuYmINCj4gPiBAQCAtOCw2ICs4LDEzIEBAIFBST1ZJREVTID0gIiINCj4gPiAgIyBzZXR1
cCBkZXBlbmRzDQo+ID4gIElOSElCSVRfREVGQVVMVF9ERVBTID0gIiINCj4gPg0KPiA+ICtweXRo
b24gKCkgew0KPiA+ICsgICAgbGliYyA9IGQuZ2V0VmFyKCJQUkVGRVJSRURfUFJPVklERVJfdmly
dHVhbC9saWJjIikNCj4gPiArICAgIGxpYmNsb2NhbGUgPSBkLmdldFZhcigiUFJFRkVSUkVEX1BS
T1ZJREVSX3ZpcnR1YWwvbGliYy1sb2NhbGUiKQ0KPiA+ICsgICAgaWYgbGliYyAhPSAiZ2xpYmMi
IG9yIGxpYmNsb2NhbGUgIT0gImdsaWJjLWxvY2FsZSI6DQo+ID4gKyAgICAgICAgcmFpc2UgYmIu
cGFyc2UuU2tpcFJlY2lwZSgiZ2xpYmMtdGVzdHN1aXRlIHJlcXVpcmVzIHRoYXQgdmlydHVhbC9s
aWJjIGlzIGdsaWJjIikNCj4gPiArfQ0KPiA+ICsNCj4gd291bGQgc29tZXRoaW5nIGxpa2UgYmVs
b3cgd29yaw0KPiANCj4gQ09NUEFUSUJMRV9IT1NUID89ICJudWxsIg0KPiBDT01BUFRJQkxFX0hP
U1RfbGliYy1nbGliYyA9ICIoKikiDQoNCk5vLCB0aGF0IHdpbGwgbm90IHdvcmsuIFRoZSBnbGli
YyB3ZSB1c2UgaXMgc3RpbGwgZ2xpYmMsIGV2ZW4gaWYgaXQgaXMgbm90IA0KdGhlIHZlcnNpb24g
ZnJvbSBPRS1Db3JlLiBUaHVzIHRoZSBsaWJjLWdsaWJjIG92ZXJyaWRlIGlzIGFjdGl2ZSBhbHNv
IGluIA0Kb3VyIGNhc2UuDQoNCj4gPiAgREVQRU5EUyArPSAiZ2xpYmMtbG9jYWxlIGxpYmdjYyBn
Y2MtcnVudGltZSINCj4gPg0KPiA+ICAjIHJlbW92ZSB0aGUgaW5pdGlhbCBkZXBlbmRzDQo+ID4g
LS0tDQo+ID4gMi4yMy4wDQoNCkknbGwgYmUgYmFjayB3aGVuIEkgaGF2ZSBoYWQgdGltZSB0byB0
ZXN0IHRoZSBzdWdnZXN0ZWQgcGF0Y2guDQoNCi8vUGV0ZXINCg0K

