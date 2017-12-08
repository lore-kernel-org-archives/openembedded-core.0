Return-Path: <Ben.Guan@cn.bosch.com>
Received: from smtp6-v.fe.bosch.de (smtp6-v.fe.bosch.de [139.15.237.11])
	by mail.openembedded.org (Postfix) with ESMTP id 942936060F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 03:14:57 +0000 (UTC)
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 06189D80217;
	Fri,  8 Dec 2017 04:12:19 +0100 (CET)
Received: from FE-MBX2039.de.bosch.com (vsgw23.fe.internet.bosch.com
	[10.4.98.23])
	by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id A78202380470; 
	Fri,  8 Dec 2017 04:14:58 +0100 (CET)
Received: from SGPMBX1024.APAC.bosch.com (10.187.56.74) by
	FE-MBX2039.de.bosch.com (10.3.231.49) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1034.26; Fri, 8 Dec 2017 04:14:57 +0100
Received: from SGPMBX1024.APAC.bosch.com ([fe80::cc15:fcae:2d92:acc0]) by
	SGPMBX1024.APAC.bosch.com ([fe80::cc15:fcae:2d92:acc0%17]) with mapi id
	15.00.1236.000; Fri, 8 Dec 2017 11:14:55 +0800
From: "GUAN Ben (ST-FIR/ENG1-Zhu)" <Ben.Guan@cn.bosch.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] How to add group for multiple recipes
Thread-Index: AdNuaevA+9tqv6t3Tdqly4iy1vT6o///fe8A//ytITA=
Date: Fri, 8 Dec 2017 03:14:55 +0000
Message-ID: <d1248e8e019d4cd8bb41b83bedc47031@SGPMBX1024.APAC.bosch.com>
References: <86cb51797fed46e7a8fc40606f317a2c@SGPMBX1024.APAC.bosch.com>
	<8cf29333-cb70-d1a4-01ec-13a092beff3c@windriver.com>
In-Reply-To: <8cf29333-cb70-d1a4-01ec-13a092beff3c@windriver.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.54.142.76]
MIME-Version: 1.0
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-23514.006
X-TMASE-MatchedRID: HXSqh3WYKftlx7C8em/tVlu4M/xm4KZedAB35LoCrtT1yiN1CBWeTXfh
	tJyQegT+RFsqph676uDJNNpJtRbyHfnVY0DWsTq3XP5rFAucBUEjkrgJ37Rqjw1xyQQ/F/PYwgR
	bAo3t3pXlGURVqJwV2yDPvaiz6uw78fXsZfWEfGRCnGIuUMP0VcMdI0UcXEHzS4KPPiCB23BRwH
	fcraIOlFEi/iSm23WqCrIa8v3SvtdjDV//SvkH3khwlOfYeSqxE+VNlwE+VkWbKItl61J/yfmS+
	aPr0Ve8SXhbxZVQ5H+OhzOa6g8KrcRMpYO2uPJZypk7eCBOAr5Y2N1nE8Af650mbxCowfLht7NQ
	8njf8m8=
Cc: "Jonas Mark \(ST-FIR/ENG1\)" <Mark.Jonas@de.bosch.com>
Subject: Re: How to add group for multiple recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 03:14:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9iZXJ0LA0KDQpJIGhhZCB0cmllZCB3aGF0IHNhaWQgYmVmb3JlIGFuZCBmYWlsZWQgdG8g
bWFrZSBpdCB3b3JrLiBBbmQgSSByZXRyaWVkIHRoaXMgc29sdXRpb24gYWZ0ZXIgSSBnb3QgaW5m
b3JtYXRpb24gZnJvbSB5b3UuIEl0IHdvcmtzIHBlcmZlY3RseSBub3cuIFRoYW5rIHlvdSENCg0K
QmVzdCByZWdhcmRzDQoNCkJlbiBHVUFODQpTVC1GSVIvRU5HMS1aaHUgIA0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUm9iZXJ0IFlhbmcgW21haWx0bzpsaWV6aGkueWFuZ0B3
aW5kcml2ZXIuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMDYsIDIwMTcgNDoyNyBQ
TQ0KVG86IEdVQU4gQmVuIChTVC1GSVIvRU5HMS1aaHUpIDxCZW4uR3VhbkBjbi5ib3NjaC5jb20+
OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogSm9uYXMgTWFy
ayAoU1QtRklSL0VORzEpIDxNYXJrLkpvbmFzQGRlLmJvc2NoLmNvbT4NClN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gSG93IHRvIGFkZCBncm91cCBmb3IgbXVsdGlwbGUgcmVjaXBlcw0KDQpIaSBCZW4s
DQoNCk9uIDEyLzA2LzIwMTcgMDQ6MTIgUE0sIEdVQU4gQmVuIChTVC1GSVIvRU5HMS1aaHUpIHdy
b3RlOg0KPiBIZWxsbywNCj4gDQo+IEluIG9lLWNvcmUsIHRoZXJlIGFyZSBzb21lIGRlZmF1bHQg
Z3JvdXBzIHByb3ZpZGVkIGJ5IHJlY2lwZSAiYmFzZS1wYXNzd2QiLiBBbnkgb3RoZXIgcmVjaXBl
cyBjb3VsZCByZWZlciB0byB0aGVzZSBncm91cHMgd2hlbiB0aGV5IHdhbnQgdG8gY3JlYXRlIGEg
bmV3IHVzZXIuDQo+IA0KPiBOb3cgd2UgaGF2ZSBhIHJlcXVpcmVtZW50OiB0aGVyZSBhcmUgc2V2
ZXJhbCByZWNpcGVzIHdoaWNoIGNyZWF0ZSB0aGVpciBvd24gdXNlcnMsIGFuZCB0aGV5IHNoYWxs
IGJlbG9uZ3MgdG8gYSBjb21tb24gZ3JvdXAuIEhvdyBjb3VsZCB3ZSBhZGQgdGhpcyBncm91cD8g
SXQgc2VlbXMgdGhhdCBncm91cHMgb3IgdXNlcnMgY3JlYXRlZCBpbiBhIHJlY2lwZSBhcmUgb25s
eSB2aXNpYmxlIHRvIHRoZSBzYW1lIHJlY2lwZS4gT3RoZXIgcmVjaXBlcyBjYW5ub3QgcmVmZXIg
dG8gdGhlbSAoZS5nLiB1c2luZyBjaG93bi9jaGdycCkuDQo+IA0KPiBXZSBhbHJlYWR5IHRyaWVk
IHRvIGFkZCBhIHJlY2lwZSB3aGljaCBvbmx5IGdlbmVyYXRlcyB0aGUgZ3JvdXAgYW5kIGFkZGVk
IHRoaXMgdG8gREVQRU5EUyBvZiB0aGUgb3RoZXIgcmVjaXBlcy4gQnV0IGl0IHNlZW0gYXMgaWYg
dGhlIGdyb3VwIHdhcyBub3QgZ2VuZXJhdGVkIGluIHRpbWUuIFdoZW4gdGhlIG90aGVyIHJlY2lw
ZXMgcmFuLCB0aGUgZ3JvdXAgd2FzIG5vdCB0aGVyZS4gQnV0IHRoZSBmaW5hbCBpbWFnZSBjb250
YWluZWQgdGhlIGdyb3VwLg0KDQpXaGF0J3MgdGhlIGVycm9yLCBwbGVhc2UgPyBXaGVyZSBkaWQg
eW91IGNoZWNrIHRoZSBncm91cCA/IElmIHlvdSBoYXZlIGFkZGVkIHRoZQ0KdGhlIHJlY2lwZSB0
byBhbm90aGVyJ3MgREVQRU5EUywgdGhlbiB0aGUgZ3JvdXAgc2hvdWxkIGJlIGluIGFub3RoZXIg
cmVjaXBlJ3MNCnJlY2lwZS1zeXNyb290Lg0KDQovLyBSb2JlcnQNCg0KPiANCj4gQmVzdCByZWdh
cmRzDQo+IA0KPiBCZW4gR1VBTg0KPiBTVC1GSVIvRU5HMS1aaHUNCj4gDQo=

