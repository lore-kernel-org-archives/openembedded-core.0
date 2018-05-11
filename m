Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96D277532F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id ED168183C6;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NbAxE7MHZS3J; Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 434DD18531;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A5BA1A06B;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E37B1A065;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 125D52E14;
	Fri, 11 May 2018 12:49:29 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 11 May 2018 12:49:28 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 11 May 2018 12:49:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [pyro][PATCH 2/2] gcc: Remove patch causing ICE on
	x86_64	valgrind compile (on x86-64 only)
Thread-Index: AQHT6P+TIMIkP4spCkOAS/0WkbsfXaQqWOUg
Date: Fri, 11 May 2018 10:49:28 +0000
Message-ID: <19669c4b49dc45399515691005a1c6ed@XBOX02.axis.com>
References: <20180511081012.12843-1-git@andred.net>
	<20180511081012.12843-2-git@andred.net>
In-Reply-To: <20180511081012.12843-2-git@andred.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [pyro][PATCH 2/2] gcc: Remove patch causing ICE on x86_64	valgrind compile (on x86-64 only)
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
X-List-Received-Date: Fri, 11 May 2018 10:49:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBBbmRyw6kg
RHJhc3ppaw0KPiBTZW50OiBkZW4gMTEgbWFqIDIwMTggMTA6MTANCj4gVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogW09FLWNvcmVdIFtweXJv
XVtQQVRDSCAyLzJdIGdjYzogUmVtb3ZlIHBhdGNoIGNhdXNpbmcgSUNFIG9uDQo+IHg4Nl82NCB2
YWxncmluZCBjb21waWxlIChvbiB4ODYtNjQgb25seSkNCj4gDQo+IEZyb206IEFuZHLDqSBEcmFz
emlrIDxhbmRyZS5kcmFzemlrQGpjaS5jb20+DQo+IA0KPiBUaGlzIGlzIHNpbWlsYXIgdG8gY29t
bWl0IGY3NmVlNTI1YTc1ZCwgYnV0IGluc3RlYWQgb2YgZGlzYWJsaW5nDQo+IHRoZSBwYXRjaCBv
biBhbGwgYnVpbGRzLCB3ZSBvbmx5IHJlbW92ZSBpdCBmb3IgeDg2LTY0IGJ1aWxkcywgYXMNCj4g
dGhlIG9yaWdpbmFsIGNoYW5nZSdzIGNvbW1pdCBtZXNzYWdlIG1lbnRpbmVkIGlzc3VlcyB3aXRo
IHRoaXMNCg0KQ2hhbmdlICJtZW50aW5lZCIgdG8gIm1lbnRpb25lZCIuDQoNCj4gcGF0Y2ggYXBw
bGllZCBvbiB0aGF0IGFyY2hpdGVjdHVyZSBvbmx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5k
csOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4NCg0KLy9QZXRlcg0KDQo=

