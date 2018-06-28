Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF7574C4D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 18:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4740B18361;
	Thu, 28 Jun 2018 20:34:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 57lOGzwPjkLo; Thu, 28 Jun 2018 20:34:05 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1C661186A7;
	Thu, 28 Jun 2018 20:34:05 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A6481A09D;
	Thu, 28 Jun 2018 20:34:05 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2A351A09B;
	Thu, 28 Jun 2018 20:34:04 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 28 Jun 2018 20:34:04 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id E5CB01F60;
	Thu, 28 Jun 2018 20:34:04 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 28 Jun 2018 20:34:04 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 28 Jun 2018 20:34:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>, "kergoth@gmail.com"
	<kergoth@gmail.com>
Thread-Topic: [OE-core] [OE-Core][PATCH 1/2] image: Set COREBASE as the git
	directory for timestamp
Thread-Index: AQHUDvUSRT5YkYp5VUGNcqE+UqvRlaR1sfIAgABH0hA=
Date: Thu, 28 Jun 2018 18:34:04 +0000
Message-ID: <5847dcfcc2cd4024befae98b7d245c45@XBOX02.axis.com>
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
	<257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
	<CABcZANkB3nH2VGMAGxtTYZu2XZfsfLc0Ch55GkpmY7peN+cdSw@mail.gmail.com>
	<CAO5Uq5RCb_b=VmdWky+6Cen5509i23mR24G3xx-RMZFoeH6wbw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RCb_b=VmdWky+6Cen5509i23mR24G3xx-RMZFoeH6wbw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git directory for timestamp
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
X-List-Received-Date: Thu, 28 Jun 2018 18:34:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEtpZXJuYW4gW21haWx0
bzphbGV4LmtpZXJuYW5AZ21haWwuY29tXQ0KPiBTZW50OiBkZW4gMjgganVuaSAyMDE4IDE3OjU3
DQo+IFRvOiBrZXJnb3RoQGdtYWlsLmNvbQ0KPiBDYzogcmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZzsgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW09FLUNvcmVdW1BBVENIIDEvMl0gaW1hZ2U6IFNldCBDT1JFQkFT
RSBhcyB0aGUNCj4gZ2l0IGRpcmVjdG9yeSBmb3IgdGltZXN0YW1wDQo+IA0KPiBPbiBUaHUsIEp1
biAyOCwgMjAxOCBhdCA0OjMxIFBNIENocmlzdG9waGVyIExhcnNvbiA8a2VyZ290aEBnbWFpbC5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gT24gVGh1LCBKdW4gMjgsIDIwMTggYXQgODoyOSBBTSBS
aWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3Jv
dGU6DQo+ID4+DQo+ID4+IE9uIFRodSwgMjAxOC0wNi0yOCBhdCAxNToxOCArMDAwMCwgUGV0ZXIg
S2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+PiA+IFRoZXJlIGlzIG5vIGd1YXJhbnRlZSB0aGF0ICR7
Q09SRUJBU0V9IHJlZmVycyB0byBhIHBhdGggdGhhdCBpcw0KPiA+PiA+IHVuZGVyIEdpdCBjb250
cm9sLiBFLmcuLCBpbiBvdXIgY2FzZSBpdCByZWZlcnMgdG8gYSBkaXJlY3RvcnkgdGhhdA0KPiA+
PiA+IGlzIHVuZGVyIHJlcG8gY29udHJvbC4gIiR7Q09SRUJBU0V9L21ldGEiIGlzIHByb2JhYmx5
IGEgYmV0dGVyDQo+ID4+ID4gb3B0aW9uLg0KPiA+Pg0KPiA+PiBZb3UgY291bGQgbWFrZSB0aGF0
IGFyZ3VtZW50IGFib3V0IC9tZXRhIHRvby4NCj4gPj4NCj4gPj4gSSdkIHN1Z2dlc3QgdGhlIGNv
ZGUgY2hlY2tzIGZvciAke0NPUkVCQVNFfS8uZ2l0IGFuZCBpZiB0aGF0IGRvZXNuJ3QNCj4gDQo+
IEluIGEgcG9reSBjaGVja291dCBmcm9tIHJlcG8gKHdoaWNoIGlzIHdoYXQgSSdtIGFsc28gdXNp
bmcpLA0KPiAke0NPUkVCQVNFfS9tZXRhLy5naXQgZG9lc24ndCBleGlzdCwgYnV0ICR7Q09SRUJB
U0V9Ly5naXQgZG9lcywgYnV0DQo+IHRoYXQgYWxsIHdvcmtzIGJlY2F1c2UgaXQncyBjbGltYmlu
ZyB0aGUgZGlyZWN0b3J5IHRyZWUgdG8gZmluZCB0aGUNCj4gLmdpdCBkaXJlY3RvcnkuDQo+IA0K
PiA+PiBleGlzdCwgZmFsbCBiYWNrIHRvIHRoZSB0aW1lc3RhbXAgb2YgdGhlDQo+ID4+ICR7Q09S
RUJBU0V9L21ldGEvY29uZi9iaXRiYWtlLmNvbmYgZmlsZS4NCj4gPg0KPiA+IFRoYXQncyBhIGdv
b2QgaWRlYSwgYnV0IEknZCBzdWdnZXN0IHVzaW5nIGJiLnV0aWxzLndoaWNoKCkgdG8gbG9jYXRl
DQo+ID4gY29uZi9iaWJha2UuY29uZiByYXRoZXIgdGhhbiBoYXJkY29kaW5nIHRoYXQgcGF0aC4N
Cj4gDQo+IEhvdyBhYm91dCAodG90YWxseSB1bnRlc3RlZCk6DQo+IA0KPiBpZiBnaXQgLUMgIiR7
Q09SRUJBU0V9L21ldGEiIHJldi1wYXJzZSAtLXNob3ctdG9wbGV2ZWw7IHRoZW4NCj4gICBSRVBS
T0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGUz1gZ2l0IC1DICIke0NPUkVCQVNFfS9tZXRhIiBsb2cg
LTEgLS1wcmV0dHk9JWN0YA0KPiBlbHNlDQo+ICAgUkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09U
RlM9YHN0YXQgLWMlWSAke0BiYi51dGlscy53aGljaChiYnBhdGgsICJjb25mL2JpdGJha2UuY29u
ZiIpfWANCj4gZmkNCj4gDQo+ID8NCg0KWW91IGRvIG5vdCByZWFsbHkgbmVlZCB0aGUgZmlyc3Qg
Z2l0IGNhbGwgYWJvdmU6DQoNClJFUFJPRFVDSUJMRV9USU1FU1RBTVBfUk9PVEZTPSQoZ2l0IC1D
ICIke0NPUkVCQVNFfS9tZXRhIiBsb2cgLTEgLS1wcmV0dHk9JWN0IDI+L2Rldi9udWxsKQ0KaWYg
WyAteiAiJFJFUFJPRFVDSUJMRV9USU1FU1RBTVBfUk9PVEZTIiBdOyB0aGVuDQoJUkVQUk9EVUNJ
QkxFX1RJTUVTVEFNUF9ST09URlM9JChzdGF0IC1jJVkgJHtAYmIudXRpbHMud2hpY2goYmJwYXRo
LCAiY29uZi9iaXRiYWtlLmNvbmYiKX0pDQpmaQ0KDQo+IC0tDQo+IEFsZXggS2llcm5hbg0KDQov
L1BldGVyDQoNCg==

