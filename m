Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E42378199
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 13:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3681C183DA;
	Thu, 21 Sep 2017 15:02:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LTrZiu3Tv5AE; Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5EE9918A43;
	Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A1B61A07E;
	Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F2A31A07D;
	Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 3399719D8;
	Thu, 21 Sep 2017 15:02:43 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 21 Sep 2017 15:02:43 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 21 Sep 2017 15:02:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd-staticids: don't create username-group
	if	gid is specified
Thread-Index: AQHTJWF4toec1K4qAk+f6bkPzn7VpKKkgswggAFFdACAF7EeAIAAbSzAgAETHQCAAG2XgA==
Date: Thu, 21 Sep 2017 13:02:43 +0000
Message-ID: <1715a84caf6d4c67841c871fef8068ae@XBOX02.axis.com>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
	<1504597240.29140.10.camel@andred.net>
	<1505899714.19222.9.camel@andred.net>
	<973534e8429b40d0bcad50c5adecee50@XBOX02.axis.com>
	<1505982238.19222.12.camel@andred.net>
In-Reply-To: <1505982238.19222.12.camel@andred.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] useradd-staticids: don't create username-group if	gid is specified
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
X-List-Received-Date: Thu, 21 Sep 2017 13:02:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyw6kgRHJhc3ppayBbbWFp
bHRvOmdpdEBhbmRyZWQubmV0XQ0KPiBTZW50OiBkZW4gMjEgc2VwdGVtYmVyIDIwMTcgMTA6MjQN
Cj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsg
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHVzZXJhZGQtc3RhdGljaWRzOiBkb24ndCBjcmVhdGUNCj4g
dXNlcm5hbWUtZ3JvdXAgaWYgZ2lkIGlzIHNwZWNpZmllZA0KPiANCj4gT24gV2VkLCAyMDE3LTA5
LTIwIGF0IDE0OjIwICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQW5kcsOpIERyYXN6aWsgW21haWx0
bzpnaXRAYW5kcmVkLm5ldF0NCj4gPiA+IFNlbnQ6IGRlbiAyMCBzZXB0ZW1iZXIgMjAxNyAxMToy
OQ0KPiA+ID4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMu
Y29tPjsgb3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdXNlcmFkZC1zdGF0aWNpZHM6IGRv
bid0IGNyZWF0ZQ0KPiA+ID4gdXNlcm5hbWUtZ3JvdXAgaWYgZ2lkIGlzIHNwZWNpZmllZA0KPiA+
ID4NCj4gPiA+IHBpbmcNCj4gPg0KPiA+IFNvcnJ5LCBJIGZvcmdvdCB0byByZXBseSB0byB0aGlz
Lg0KPiA+DQo+ID4gPiBPbiBUdWUsIDIwMTctMDktMDUgYXQgMDg6NDAgKzAxMDAsIEFuZHLDqSBE
cmFzemlrIHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIDIwMTctMDktMDQgYXQgMTA6MjIgKzAwMDAs
IFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
IFsuLi5dDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3Rh
dGljaWRzLmJiY2xhc3MNCj4gPiA+ID4gPiA+IGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGlj
aWRzLmJiY2xhc3MNCj4gPiA+ID4gPiA+IGluZGV4IGNlNGFjNjJhYjUuLjFiNjFhOGJmOWIgMTAw
NjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvdXNlcmFkZC1zdGF0aWNpZHMuYmJj
bGFzcw0KPiA+ID4gPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJi
Y2xhc3MNCj4gPiA+ID4gPiA+IEBAIC0xMDIsNyArMTAyLDcgQEAgZGVmIHVwZGF0ZV91c2VyYWRk
X3N0YXRpY19jb25maWcoZCk6DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCMgU28gaWYgdGhlIGltcGxpY2l0IHVzZXJuYW1lLWdyb3VwIGNyZWF0aW9uIGlzDQo+IG9uLA0K
PiA+ID4gPiA+ID4gdGhlbiB0aGUgaW1wbGljaXQgZ3JvdXBuYW1lIChMT0dJTikNCj4gPiA+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIyBpcyB1c2VkLCBhbmQgd2UgZGlzYWJsZSB0
aGUgdXNlcl9ncm91cCBvcHRpb24uDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCMNCj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1c2VyX2dyb3VwID0g
dWFhcmdzLnVzZXJfZ3JvdXAgaXMgTm9uZSBvcg0KPiA+ID4gPiA+ID4gdWFhcmdzLnVzZXJfZ3Jv
dXAgaXMgVHJ1ZQ0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVzZXJfZ3Jv
dXAgPSB1YWFyZ3MuZ2lkIGlzIE5vbmUgb3INCj4gdWFhcmdzLnVzZXJfZ3JvdXANCj4gPiA+ID4g
PiA+IGlzIFRydWUNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhtbSwgSSBiZWxpZXZlIHRoYXQgc2hv
dWxkIGJlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdXNl
cl9ncm91cCA9IHVhYXJncy5naWQgaXMgTm9uZSBhbmQNCj4gdWFhcmdzLnVzZXJfZ3JvdXAgaXMN
Cj4gPiA+ID4gPiBOb25lIG9yIHVhYXJncy51c2VyX2dyb3VwIGlzIFRydWUNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IEkuZS4sIGlmIG5laXRoZXIgLS1naWQgbm9yIC0tdXNlci1ncm91cCBpcyBzcGVj
aWZpZWQsIHRoZW4gaXQNCj4gc2hvdWxkDQo+ID4gPiA+ID4gdHJlYXQgaXQgYXMgaWYgLS11c2Vy
LWdyb3VwIHdhcyBzcGVjaWZpZWQuDQo+ID4gPiA+DQo+ID4gPiA+IEhtLCBpc24ndCB0aGlzIHN0
aWxsIHRoZSBzYW1lIGFzDQo+ID4gPiA+DQo+ID4gPiA+IHVzZXJfZ3JvdXAgPSB1YWFyZ3MuZ2lk
IGlzIE5vbmUgb3IgdWFhcmdzLnVzZXJfZ3JvdXAgaXMgVHJ1ZQ0KPiA+DQo+ID4gTm8sIGJlY2F1
c2UgdWFhcmdzLnVzZXJfZ3JvdXAgbWF5IGJlIEZhbHNlIGlmIC0tbm8tdXNlci1ncm91cCBpcw0K
PiA+IHNwZWNpZmllZCAod2hpY2ggSSBvZiBjb3Vyc2Ugc2hvdWxkIGhhdmUgbWVudGlvbmVkIGlu
IG15IHByZXZpb3VzDQo+ID4gcmVwbHkpLiBXaXRoIHlvdXIgdmVyc2lvbiwgeW91IHdvdWxkIHN0
aWxsIGdldCBhIHVzZXIgZ3JvdXAgZXZlbg0KPiA+IGlmIC0tbm8tdXNlci1ncm91cCBpcyBzcGVj
aWZpZWQuDQo+IA0KPiBPSywgdGhpcyBpcyBob3cgdXNlcmFkZCBiZWhhdmVzOg0KPiANCj4gdXNl
cmFkZCAtLXN5c3RlbSAtLWhvbWUgL2Rldi9udWxsIC0tbm8tY3JlYXRlLWhvbWUgLS1uby11c2Vy
LWdyb3VwDQo+IGRpc3RjYw0KPiAgIC0+IHdpbGwgYWRkIHRoZSBuZXcgdXNlciB0byB0aGUgZ3Jv
dXAgJ3VzZXJzJyAoYXMgcGVyIEdST1VQIGZyb20NCj4gL2V0Yy9kZWZhdWx0L3VzZXJhZGQpDQo+
IA0KPiB1c2VyYWRkIC0tc3lzdGVtIC0taG9tZSAvZGV2L251bGwgLS1uby1jcmVhdGUtaG9tZSAt
LWdpZCBmb28gLS11c2VyLQ0KPiBncm91cCBkaXN0Y2MNCj4gwqDCoC0+IC0tZ2lkIGFuZCAtLXVz
ZXItZ3JvdXAgdG9nZXRoZXIgY29uZmxpY3QNCj4gDQo+IHVzZXJhZGQgLS1zeXN0ZW0gLS1ob21l
IC9kZXYvbnVsbCAtLW5vLWNyZWF0ZS1ob21lIC0tdXNlci1ncm91cCBkaXN0Y2MNCj4gdXNlcmFk
ZCAtLXN5c3RlbSAtLWhvbWUgL2Rldi9udWxsIC0tbm8tY3JlYXRlLWhvbWUgZGlzdGNjDQo+IMKg
LT4gaW4gYm90aCBjYXNlcyBkaXN0Y2MgdXNlciBhbmQgZ3JvdXAgYXJlIGNyZWF0ZWQNCj4gDQo+
IA0KPiBTcCwgd2hhdCBhYm91dCB0aGlzIGluc3RlYWQ6DQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiB1YWFyZ3MuZ2lkOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHVhYXJncy5ncm91cG5hbWUgPSB1YWFyZ3MuZ2lkDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdWFhcmdzLmdyb3VwaWQgPSBmaWVsZFszXSBvciB1YWFyZ3MuZ2lkDQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGVsaWYgdWFhcmdzLnVzZXJfZ3JvdXAgaXMgbm90IEZhbHNlOg0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhYXJncy5ncm91cG5hbWUgPSB1YWFy
Z3MuTE9HSU4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1YWFyZ3MuZ3JvdXBp
ZCA9IGZpZWxkWzNdIG9yIHVhYXJncy5MT0dJTg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBl
bHNlOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhYXJncy5ncm91cG5hbWUg
PSAndXNlcnMnDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWFhcmdzLmdyb3Vw
aWQgPSBmaWVsZFszXSBvciAndXNlcnMnDQoNCkxvb2tzIGNvcnJlY3QuIEhvd2V2ZXIsIHlvdSBj
YW4gc2ltcGxpZnkgaXQgdG86DQoNCiAgICAgICAgICAgICBpZiB1YWFyZ3MuZ2lkOg0KICAgICAg
ICAgICAgICAgICB1YWFyZ3MuZ3JvdXBuYW1lID0gdWFhcmdzLmdpZA0KICAgICAgICAgICAgIGVs
aWYgdWFhcmdzLnVzZXJfZ3JvdXAgaXMgbm90IEZhbHNlOg0KICAgICAgICAgICAgICAgICB1YWFy
Z3MuZ3JvdXBuYW1lID0gdWFhcmdzLkxPR0lODQogICAgICAgICAgICAgZWxzZToNCiAgICAgICAg
ICAgICAgICAgdWFhcmdzLmdyb3VwbmFtZSA9ICd1c2VycycNCiAgICAgICAgICAgICB1YWFyZ3Mu
Z3JvdXBpZCA9IGZpZWxkWzNdIG9yIHVhYXJncy5ncm91cG5hbWUNCg0KPiBDaGVlcnMsDQo+IEFu
ZHJlJw0KPiANCj4gPiA+ID4gPyBJZiBuZWl0aGVyIC0tZ2lkIG5vciAtLXVzZXItZ3JvdXAgaXMg
c3BlY2lmaWVkLCB0aGVuIGdpZCBpcw0KPiBOb25lLCBzbw0KPiA+ID4gPiBpdA0KPiA+ID4gPiB3
aWxsIGRvIHdoYXQgeW91IHdhbnQgYWxyZWFkeS4gSU9XLCB1bmxlc3MgdGhlIGdyb3VwIG5hbWUg
KGdpZCkNCj4gaXMNCj4gPiA+ID4gc3BlY2lmaWVkLCBhIHVzZXJuYW1lLWdyb3VwIGlzIGJlaW5n
IGNyZWF0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IENoZWVycywNCj4gPiA+ID4gQW5k
cmUnDQo+ID4NCj4gPiAvL1BldGVyDQoNCi8vUGV0ZXINCg0K

