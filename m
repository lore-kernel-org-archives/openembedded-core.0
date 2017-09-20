Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 22E4777F7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id A4E302E3D1;
	Wed, 20 Sep 2017 16:20:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sP-1KehzaRM3; Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 6DF5B2E3FB;
	Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 421281A0A1;
	Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 372201A0A0;
	Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 2AE7C1875;
	Wed, 20 Sep 2017 16:20:26 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 20 Sep 2017 16:20:26 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 20 Sep 2017 16:20:25 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 20 Sep 2017 16:20:26 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd-staticids: don't create username-group
	if	gid is specified
Thread-Index: AQHTJWF4toec1K4qAk+f6bkPzn7VpKKkgswggAFFdACAF7EeAIAAbSzA
Date: Wed, 20 Sep 2017 14:20:26 +0000
Message-ID: <973534e8429b40d0bcad50c5adecee50@XBOX02.axis.com>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
	<1504597240.29140.10.camel@andred.net>
	<1505899714.19222.9.camel@andred.net>
In-Reply-To: <1505899714.19222.9.camel@andred.net>
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
X-List-Received-Date: Wed, 20 Sep 2017 14:20:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyw6kgRHJhc3ppayBbbWFp
bHRvOmdpdEBhbmRyZWQubmV0XQ0KPiBTZW50OiBkZW4gMjAgc2VwdGVtYmVyIDIwMTcgMTE6MjkN
Cj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsg
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHVzZXJhZGQtc3RhdGljaWRzOiBkb24ndCBjcmVhdGUNCj4g
dXNlcm5hbWUtZ3JvdXAgaWYgZ2lkIGlzIHNwZWNpZmllZA0KPiANCj4gcGluZw0KDQpTb3JyeSwg
SSBmb3Jnb3QgdG8gcmVwbHkgdG8gdGhpcy4NCg0KPiBPbiBUdWUsIDIwMTctMDktMDUgYXQgMDg6
NDAgKzAxMDAsIEFuZHLDqSBEcmFzemlrIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAxNy0wOS0wNCBh
dCAxMDoyMiArMDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+ID4gPg0KPiA+DQo+
ID4gWy4uLl0NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy91c2VyYWRkLXN0YXRp
Y2lkcy5iYmNsYXNzDQo+ID4gPiA+IGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJi
Y2xhc3MNCj4gPiA+ID4gaW5kZXggY2U0YWM2MmFiNS4uMWI2MWE4YmY5YiAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJiY2xhc3MNCj4gPiA+ID4g
KysrIGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJiY2xhc3MNCj4gPiA+ID4gQEAg
LTEwMiw3ICsxMDIsNyBAQCBkZWYgdXBkYXRlX3VzZXJhZGRfc3RhdGljX2NvbmZpZyhkKToNCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIFNvIGlmIHRoZSBpbXBsaWNpdCB1c2Vy
bmFtZS1ncm91cCBjcmVhdGlvbiBpcyBvbiwgdGhlbiB0aGUgaW1wbGljaXQgZ3JvdXBuYW1lIChM
T0dJTikNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIGlzIHVzZWQsIGFuZCB3
ZSBkaXNhYmxlIHRoZSB1c2VyX2dyb3VwIG9wdGlvbi4NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAjDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1c2VyX2dyb3Vw
ID0gdWFhcmdzLnVzZXJfZ3JvdXAgaXMgTm9uZSBvciB1YWFyZ3MudXNlcl9ncm91cCBpcyBUcnVl
DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1c2VyX2dyb3VwID0gdWFhcmdzLmdp
ZCBpcyBOb25lIG9yIHVhYXJncy51c2VyX2dyb3VwIGlzIFRydWUNCj4gPiA+DQo+ID4gPiBIbW0s
IEkgYmVsaWV2ZSB0aGF0IHNob3VsZCBiZToNCj4gPiA+DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB1c2VyX2dyb3VwID0gdWFhcmdzLmdpZCBpcyBOb25lIGFuZCB1YWFyZ3MudXNlcl9n
cm91cCBpcyBOb25lIG9yIHVhYXJncy51c2VyX2dyb3VwIGlzIFRydWUNCj4gPiA+DQo+ID4gPiBJ
LmUuLCBpZiBuZWl0aGVyIC0tZ2lkIG5vciAtLXVzZXItZ3JvdXAgaXMgc3BlY2lmaWVkLCB0aGVu
IGl0IHNob3VsZA0KPiA+ID4gdHJlYXQgaXQgYXMgaWYgLS11c2VyLWdyb3VwIHdhcyBzcGVjaWZp
ZWQuDQo+ID4NCj4gPiBIbSwgaXNuJ3QgdGhpcyBzdGlsbCB0aGUgc2FtZSBhcw0KPiA+DQo+ID4g
dXNlcl9ncm91cCA9IHVhYXJncy5naWQgaXMgTm9uZSBvciB1YWFyZ3MudXNlcl9ncm91cCBpcyBU
cnVlDQoNCk5vLCBiZWNhdXNlIHVhYXJncy51c2VyX2dyb3VwIG1heSBiZSBGYWxzZSBpZiAtLW5v
LXVzZXItZ3JvdXAgaXMgDQpzcGVjaWZpZWQgKHdoaWNoIEkgb2YgY291cnNlIHNob3VsZCBoYXZl
IG1lbnRpb25lZCBpbiBteSBwcmV2aW91cyANCnJlcGx5KS4gV2l0aCB5b3VyIHZlcnNpb24sIHlv
dSB3b3VsZCBzdGlsbCBnZXQgYSB1c2VyIGdyb3VwIGV2ZW4gDQppZiAtLW5vLXVzZXItZ3JvdXAg
aXMgc3BlY2lmaWVkLg0KDQo+ID4gPyBJZiBuZWl0aGVyIC0tZ2lkIG5vciAtLXVzZXItZ3JvdXAg
aXMgc3BlY2lmaWVkLCB0aGVuIGdpZCBpcyBOb25lLCBzbyBpdA0KPiA+IHdpbGwgZG8gd2hhdCB5
b3Ugd2FudCBhbHJlYWR5LiBJT1csIHVubGVzcyB0aGUgZ3JvdXAgbmFtZSAoZ2lkKSBpcw0KPiA+
IHNwZWNpZmllZCwgYSB1c2VybmFtZS1ncm91cCBpcyBiZWluZyBjcmVhdGVkLg0KPiA+DQo+ID4N
Cj4gPiBDaGVlcnMsDQo+ID4gQW5kcmUnDQoNCi8vUGV0ZXINCg0K

