Return-Path: <michael.blaettler@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC1178836
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 11:13:05 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w08BD2Yh009778
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 8 Jan 2018 12:13:03 +0100
Received: from DEFTHW99ERJMSX.ww902.siemens.net
	(defthw99erjmsx.ww902.siemens.net [139.22.70.135])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w08BD0bh016192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 8 Jan 2018 12:13:01 +0100
Received: from DENBGAT9EROMSX.ww902.siemens.net (139.22.70.195) by
	DEFTHW99ERJMSX.ww902.siemens.net (139.22.70.135) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 8 Jan 2018 12:12:59 +0100
Received: from DEFTHW99EH2MSX.ww902.siemens.net ([169.254.12.100]) by
	DENBGAT9EROMSX.ww902.siemens.net ([139.22.70.195]) with mapi id
	14.03.0361.001; Mon, 8 Jan 2018 12:12:58 +0100
From: "Blaettler, Michael" <michael.blaettler@siemens.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] package.bbclass: variable to influence
	link style
Thread-Index: AQHTiHAaI0gD7SBmr023i//QQ7MSS6Np0GCQ
Date: Mon, 8 Jan 2018 11:12:58 +0000
Message-ID: <347AAC56F29ACA4EA31B39C2109A6FE703071E90@DEFTHW99EH2MSX.ww902.siemens.net>
References: <20180108074239.13009-1-michael.blaettler@siemens.com>
	<20180108074239.13009-2-michael.blaettler@siemens.com>
	<1ce3b814-e30c-7adb-ae0d-1427a83ec9a1@linux.intel.com>
In-Reply-To: <1ce3b814-e30c-7adb-ae0d-1427a83ec9a1@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.43]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] package.bbclass: variable to influence link style
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
X-List-Received-Date: Mon, 08 Jan 2018 11:13:06 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpJIGRpZCB0aGUgdGVzdHMgbWFudWFsbHkuIEJ1dCBvZiBjb3Vyc2UgeW91J3Jl
IHJpZ2h0IGluIHJlZ2FyZCB0byBhdXRvbWF0ZWQgdGVzdGluZy4gSSdsbCBhZGQgYSB0ZXN0IHRv
ICJpbnNhbmUuYmJjbGFzcyIgYW5kIHNlbmQgYSBuZXcgcGF0Y2guDQoNClJlZ2FyZHMNCk1pY2hh
ZWwNCg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KVm9uOiBBbGV4YW5kZXIg
S2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbV0gDQpHZXNl
bmRldDogTW9udGFnLCA4LiBKYW51YXIgMjAxOCAxMjowMg0KQW46IEJsYWV0dGxlciwgTWljaGFl
bCAoQlQgQ1BTIFImRCBaRyBGVyBJVFcpOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQpCZXRyZWZmOiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIHBhY2thZ2UuYmJj
bGFzczogdmFyaWFibGUgdG8gaW5mbHVlbmNlIGxpbmsgc3R5bGUNCg0KT24gMDEvMDgvMjAxOCAw
OTo0MiBBTSwgTWljaGFlbCBCbMOkdHRsZXIgd3JvdGU6DQoNCj4gVGhpcyBjb21taXQgaW50cm9k
dWNlcyBhIG5ldyB2YXJpYWJsZSBQQUNLQUdFX0RFQlVHX1NQTElUX0xJTktfU1RZTEUgDQo+IHdo
aWNoIHNwZWNpZmllcyB0aGUgbGluayBvcHRpb24gYmV0d2VlbiBkZWJ1ZyBpbmZvcyBhbmQgYmlu
YXJ5LiBJZiANCj4gYnVpbGQtaWQgaXMgdWVzZWQgYXMgbGluayBvcHRpb24sIHRoZSBpZCBjYW4g
YmUgZGVmaW5lZCB3aXRoIHRoZSANCj4gQlVJTERfSUQgdmFyaWFibGUuDQoNCkhvdyBkaWQgeW91
IHRlc3QgdGhpcz8gQ2FuIHlvdSBhZGQgYSB0ZXN0IHRvIGluc2FuZS5iYmNsYXNzIHBsZWFzZT8g
DQpBZGRpbmcgbmV3IG9wdGlvbnMgd2l0aG91dCBoYXZpbmcgYSB3YXkgdG8gdGVzdCBpbiBhbiBh
dXRvbWF0ZWQsIHJlZ3VsYXIgZmFzaGlvbiBpcyBub3QgYSBncmVhdCBpZGVhLg0KDQpBbGV4DQo=

