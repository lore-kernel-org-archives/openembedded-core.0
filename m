Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3A772FB0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 13:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 95AC61849C;
	Fri, 14 Apr 2017 15:10:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id diMb7K20NU2c; Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A9E8518494;
	Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81F321E0A9;
	Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 701951E0A8;
	Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 63FAB3337;
	Fri, 14 Apr 2017 15:10:55 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 14 Apr 2017 15:10:55 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 14 Apr 2017 15:10:54 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 14 Apr 2017 15:10:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] Allow postinst functions to be verbose
Thread-Index: AQHStMh5RV6HuEdQtkWfsQ1O7YYyl6HEbOsAgABpZkA=
Date: Fri, 14 Apr 2017 13:10:54 +0000
Message-ID: <5d709f7eb9fa49fd89cd95818ddf4018@XBOX02.axis.com>
References: <cover.1492135840.git.pkj@axis.com>
	<1492159760.19076.10.camel@linuxfoundation.org>
In-Reply-To: <1492159760.19076.10.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/2] Allow postinst functions to be verbose
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
X-List-Received-Date: Fri, 14 Apr 2017 13:10:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAxNCBh
cHJpbCAyMDE3IDEwOjQ5DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJz
dGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvMl0gQWxsb3cgcG9zdGluc3Qg
ZnVuY3Rpb25zIHRvIGJlDQo+IHZlcmJvc2UNCj4gDQo+IE9uIEZyaSwgMjAxNy0wNC0xNCBhdCAw
NDozOSArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+IFRoaXMgZW5hYmxlcyB0
cmFjaW5nIG9mIHRoZSBwb3N0aW5zdCBmdW5jdGlvbnMgY3JlYXRlZCBpbiBiYXNlLXBhc3N3ZA0K
PiA+IGFuZCB1c2VyYWRkLmJiY2xhc3MgaWYgQkJfVkVSQk9TRV9MT0dTIGlzIGVuYWJsZWQuIEkg
Zm91bmQgdGhpcw0KPiA+IGV4dHJlbWVseSB1c2VmdWwgZHVyaW5nIHZlcmlmaWNhdGlvbiBvZiB0
aGUgdXNlcmFkZCBmdW5jdGlvbmFsaXR5LA0KPiA+IGVzcGVjaWFsbHkgYXMgdGhlcmUgb3RoZXJ3
aXNlIGlzIGFic29sdXRlbHkgbm90aGluZyBpbiB0aGUgbG9ncyBvZg0KPiA+IHdoeQ0KPiA+IGEg
ZmFpbHVyZSBpbiBhIHBvc3RpbnN0IGZ1bmN0aW9uIGhhcHBlbmVkLg0KPiA+DQo+ID4gSSBhbHNv
IHNpbXBsaWZpZWQgdXNlcmFkZF9zeXNyb290X3NzdGF0ZSgpIGJ5IG9ubHkgaGF2aW5nIHRoZSBj
b2RlIHRvDQo+ID4gY3JlYXRlIHRoZSBwb3N0aW5zdCBmaWxlcyBvbmNlLg0KPiA+DQo+ID4gRmVl
bCBmcmVlIHRvIHNxdWFzaCB0aGVzZSBjb21taXRzIHdpdGggdGhlICJiYXNlLXBhc3N3ZC91c2Vy
YWRkOg0KPiA+IFZhcmlvdXMgaW1wcm92ZW1lbnRzIHRvIHVzZXJhZGQgd2l0aCBSU1MiIGNvbW1p
dCBpZiB5b3UgcHJlZmVyLg0KPiANCj4gSSdtIGFmcmFpZCBJIGNhbid0IHRha2UgdGhlc2Ugc2lu
Y2UgdGhlc2Ugc2NyaXB0cyBnZXQgd3JpdHRlbiBpbnRvIHRoZQ0KPiBzc3RhdGUgb2JqZWN0cyBm
b3IgdGhlIHJlY2lwZXMgaW4gcXVlc3Rpb24gYW5kIHRoaXMgd291bGQgbWFrZSB0aGUNCj4gc3N0
YXRlIGNoYW5nZSBkZXBlbmRpbmcgb24gdGhlIHBhcmFtZXRlcnMgeW91IGNhbGwgYml0YmFrZSB3
aXRoLiBJDQo+IHRoaW5rIHdlJ2QgYm90aCBhZ3JlZSB0aGF0IGlzIHVuZGVzaXJhYmxlLg0KDQpC
b3RoZXIuIERpZCBub3QgdGhpbmsgb2YgdGhhdCAoSSBhbSBzbyB1c2VkIHRvIGhhdmluZyBpdCBl
bmFibGVkIGluIGFsbCBteSANCmJ1aWxkcykuDQoNCj4gTm90IHN1cmUgd2hhdCB3ZSBjYW4gZG8g
YnV0IHRoaXMgbmVlZHMgbW9yZSB0aG91Z2h0Lg0KDQpZZWFoLCBpdCB3b3VsZCBiZSBncmVhdCBp
ZiB0aGUgb3V0cHV0IGZyb20gdGhlIHBvc3RpbnN0IHNjcmlwdHMgd2FzIGFjdHVhbGx5DQpjYXB0
dXJlZC4gQnV0IHdlIGNhbiB0aGluayBvZiB0aGF0IGZvciAyLjQuDQoNCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0KDQovL1BldGVyDQo=

