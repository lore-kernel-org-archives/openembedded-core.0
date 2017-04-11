Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A99C977C20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 2CE812E258;
	Tue, 11 Apr 2017 18:22:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Y5bmGp7HXFW6; Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id C643D2E0DA;
	Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B61EC1A060;
	Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB2E61A05B;
	Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 9F6103090;
	Tue, 11 Apr 2017 18:22:50 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 11 Apr 2017 18:22:50 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 11 Apr 2017 18:22:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] M4 rc1 build prerequisites
Thread-Index: AQHSsrT70tt+a8I9EUuBwCNihu76xKHAWKew
Date: Tue, 11 Apr 2017 16:22:50 +0000
Message-ID: <4be35b51250c406b8d3073250b4a04d6@XBOX02.axis.com>
References: <1491909040.12091.11.camel@linuxfoundation.org>
In-Reply-To: <1491909040.12091.11.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: M4 rc1 build prerequisites
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
X-List-Received-Date: Tue, 11 Apr 2017 16:22:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBSaWNoYXJk
IFB1cmRpZQ0KPiBTZW50OiBkZW4gMTEgYXByaWwgMjAxNyAxMzoxMQ0KPiBUbzogb3BlbmVtYmVk
ZGVkLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1
YmplY3Q6IFtPRS1jb3JlXSBNNCByYzEgYnVpbGQgcHJlcmVxdWlzaXRlcw0KPiANCj4gSSBqdXN0
IHdhbnRlZCB0byBnaXZlIHBlb3BsZSBhbiBpZGVhIG9mIHdoZXJlIHdlJ3JlIGF0IHdpdGggMi4z
LiBJJ20NCj4gYXdhcmUgb2YgYW5kIHdvdWxkIGxpa2UgdG8gc2VlIHRoZSBmb2xsb3dpbmcgaXNz
dWVzIGZpeGVkOg0KPiANCj4gYSkgcnVucWVtdSBhbmQgb3RoZXIgdG9vbHMgZmFpbGluZyBpbiB2
YXJpb3VzIGNpcmN1bXN0YW5jZXMgZHVlIHRvIFJTUy4NCj4gDQo+IGIpIERJU1RST19GRUFUVVJF
UyBjb250YW1pbmF0aW5nIG5hdGl2ZS9uYXRpdmVzZGsgYnVpbGRzLCB3ZSBuZWVkDQo+IMKgIMKg
c2VwYXJhdGUgY29uZmlndXJhdGlvbiBvZiB0aGVzZS4NCj4gDQo+IGMpIFBhdHJpY2sgaGFzIGZv
dW5kIHNvbWUgdGFzayBjaGVja3N1bSBjaGFuZ2VzIHdoaWNoIGFyZSBjb25jZXJuaW5nDQo+IMKg
IMKgYW5kIHdlIG5lZWQgdG8gbG9vayBpbnRvLg0KPiANCj4gSWYgYW55b25lIGhhcyBvdGhlciB0
aGluZ3MgdGhleSdyZSBleHBlY3RpbmcgdG8gc2VlIGluIDIuMyBhbmQgd2hpY2gNCj4gYXJlbid0
IGluIG1hc3Rlci1uZXh0LCB5b3UgbWlnaHQgd2FudCB0byBtZW50aW9uIHRoZW0uDQo+IA0KPiBJ
J20gbWVhbnQgdG8gYmUgdHJ5aW5nIHRvIHRha2Ugc29tZSB2YWNhdGlvbiB3aGljaCByZWFsbHkg
aXNuJ3Qgd29ya2luZw0KPiBvdXQgOiguDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoN
CkF0IGxlYXN0IGZvciB1cywgd2hvIGhhdmUgYSBsb3Qgb2YgcmVjaXBlcyB0aGF0IGNyZWF0ZSB1
c2Vycy9ncm91cHMsIGEgZml4IA0KZm9yIGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTExMjQgaXMgbmVlZGVkLg0KDQpDdXJyZW50bHksIGlmIGFueXRo
aW5nIGhhcHBlbnMgdG8gaW52YWxpZGF0ZXMgYmFzZS1wYXNzd2Qgd2l0aG91dCBhbHNvIA0KaW52
YWxpZGF0aW5nIGV2ZXJ5dGhpbmcgZWxzZSwgd2UgZW5kIHVwIGluIGEgc2l0dWF0aW9uIHdoZXJl
IGV2ZXJ5IG90aGVyIA0KcmVjaXBlIGZhaWxzIGFuZCB0aGUgb25seSAoc2ltcGxlKSBzb2x1dGlv
biBpcyB0byByZW1vdmUgdG1wIGFuZCBzdGFydCANCm92ZXIuIFdoaWNoIGF0IGxlYXN0IHRvIG1l
IGlzIG5vdCB2ZXJ5IG5pY2UgdG8gdGhlIHVzZXIuLi4NCg0KSSBnb3Qgc29tZSB0aXBzIGZyb20g
UlAgYW5kIEkgaG9wZSBJIGNhbiB3b3JrIG9uIHRoaXMgYW5kIGZpbmQgYSBzb2x1dGlvbiANCmlu
IHRpbWUgZm9yIDIuMy4NCg0KLy9QZXRlcg0KDQo=

