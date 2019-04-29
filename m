Return-Path: <f.suligoi@asem.it>
Received: from smtp.asem.it (smtp.asem.it [151.1.184.197])
	by mail.openembedded.org (Postfix) with ESMTP id A99E87DBB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:02:25 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 5.5.0) with ESMTP id SG003839966.MSG 
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:02:24 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 29 Apr 2019 17:02:23 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
	mapi id 15.01.1261.035; Mon, 29 Apr 2019 17:02:23 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/2] kernel: check for empty .config file after
	merge_config.sh
Thread-Index: AQHU/pYV57KxXZ82Wky++1MwApI0dKZTNuWw
Date: Mon, 29 Apr 2019 15:02:23 +0000
Message-ID: <30d121834e24400695cabab95cb0ce56@asem.it>
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
	<1556546164-28522-2-git-send-email-f.suligoi@asem.it>
	<CADkTA4MjV8eMW5BZxze4midXnrhVmwMC9wA-gvfTGQFbNoNcVw@mail.gmail.com>
In-Reply-To: <CADkTA4MjV8eMW5BZxze4midXnrhVmwMC9wA-gvfTGQFbNoNcVw@mail.gmail.com>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B020E.5CC711FF.00AD, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: check for empty .config file after merge_config.sh
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
X-List-Received-Date: Mon, 29 Apr 2019 15:02:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCj4gU29tZXRpbWVzLCBmb3IgZXhhbXBsZSBpbiBjYXNlIG9mIG1pc3NlZCBk
ZXBlbmRlY2llcywgYWZ0ZXIgdGhlDQo+IGV4ZWN1dGlvbiBvZjoNCj4gDQo+IG1lcmdlX2NvbmZp
Zy5zaA0KPiANCj4gdGhlIHJlc3VsdGluZyBmaWxlICIuY29uZmlnIiBjYW4gYmUgZW1wdHkuDQo+
IFRoaXMgaXMgdGhlIHJlYXNvbiB3aHkgaXMgbmVjZXNzYXJ5IHRlc3QgaXQgYW5kLCBpbiBjYXNl
LCBkaXNwbGF5DQo+IHRoZSAiQ291bGQgbm90IGNvbmZpZ3VyZSAuLi4iIGVycm9yIG1lc3NhZ2Uu
DQo+IA0KPiBUaGlzIGRvZXNuJ3QgYmVsb25nIGhlcmUuIEF1ZGl0aW5nIG9mIHRoZSBmaW5hbCAu
Y29uZmlnIGlzIGRvbmUgaW4gYSBzZXBhcmF0ZSB0YXNrLCBhbmQgd2UgY291bGQgcGlja3VwIHRo
YXQgaXNzdWUgdGhlcmUuDQo+IA0KPiBUaGF0IGJlaW5nIHNhaWQsIHRoZXJlIGFyZSBhbHJlYWR5
IGNoZWNrcyBmb3IgaW5wdXRzIHRoYXQgY291bGQgcmVzdWx0IGluIHNvbWV0aGluZyBsaWtlIHRo
aXMuIEhvdyB3ZXJlIHlvdSB0cmlnZ2VyaW5nIHRoaXMgaXNzdWUgPyBJJ2QgbGlrZSB0byByZXBy
b2R1Y2UgaXQgaGVyZSwgYW5kIHBlcmhhcHMgY29tZSB1cCB3aXRoIGEgZGlmZmVyZW50IHNvbHV0
aW9uLg0KPiANCj4gQnJ1Y2UNCg0KSSBlbmNvdW50ZXJlZCB0aGlzIHByb2JsZW0gb2YgdGhlIGVt
cHR5IC5jb25maWcgd2hlbiBJIGludGVncmF0ZWQgDQp0aGUga2VybmVsIDQuMTkgaW4gbXkgY3Vz
dG9tIG1ldGEtbGF5ZXIgYmFzZWQgb24gYSBwb2t5ICJyb2NrbyIgKDIuNCkgdmVyc2lvbi4NCg0K
VGhlIGtlcm5lbCA0LjE5IHJlcXVpcmVzIHRoZSBmb2xsb3dpbmcgZGVwZW5kZW5jaWVzIGluIHRo
ZSBrZXJuZWwgcmVjaXBlOg0KDQpkb19rZXJuZWxfY29uZmlnbWVbZGVwZW5kc10gKz0gInZpcnR1
YWwvJHtUQVJHRVRfUFJFRklYfWJpbnV0aWxzOmRvX3BvcHVsYXRlX3N5c3Jvb3QiDQpkb19rZXJu
ZWxfY29uZmlnbWVbZGVwZW5kc10gKz0gInZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdjYzpkb19w
b3B1bGF0ZV9zeXNyb290Ig0KZG9fa2VybmVsX2NvbmZpZ21lW2RlcGVuZHNdICs9ICJiYy1uYXRp
dmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCBiaXNvbi1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCIN
Cg0KKGluIHRoZSB0aHVkIHZlcnNpb24gb2YgcG9reSB0aGVzZSBkZXBlbmRlbmNpZXMgYXJlIGFs
cmVhZHkgaW50ZWdyYXRlZCBpbiB0aGUNCmtlcm5lbC15b2N0by5iYmNsYXNzLCBidXQgbm90IGlu
IHJvY2tvKQ0KDQpXaXRob3V0IHRoZXNlIGRlcGVuZGVuY2llcyB0aGUgbWVyZ2VfY29uZmlnLnNo
IGZhaWxzIHdpdGhvdXQgYW55IGVycm9yIG1lc3NhZ2VzLA0KdGhlIGRpc3RybyBidWlsZCBwcm9j
ZXNzIHByb2NlZWRzLCBidXQgdGhlIGJ1aWx0IGtlcm5lbCBpcyBjb21wbGV0ZWx5IHdyb25nDQoo
bm8gbW9kdWxlcyBhbmQgb25seSBkZWZhdWx0IGNvbmZpZykuDQoNCkZvciB0aGlzIHJlYXNvbiBJ
IGFkZGVkIHRoZSBhZGRpdGlvbmFsIGVycm9yIGxvZzoNCg0KJHttZXRhX2Rpcn0vY2ZnL21lcmdl
X2NvbmZpZ19idWlsZC1lcnJvcnMubG9nDQoNCmFuZCB0aGUgY2hlY2sgZm9yIHRoZSBlbXB0eSAu
Y29uZmlnDQoNCkZsYXZpbw0KDQoNCg==

