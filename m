Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF1FA6C2E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 14:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0C8EF1851D;
	Wed, 14 Nov 2018 15:30:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9XakDb3rJJUE; Wed, 14 Nov 2018 15:30:50 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9AFD018359;
	Wed, 14 Nov 2018 15:30:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87F011E06C;
	Wed, 14 Nov 2018 15:30:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C1771E054;
	Wed, 14 Nov 2018 15:30:49 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 14 Nov 2018 15:30:49 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 705812F0E;
	Wed, 14 Nov 2018 15:30:49 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 14 Nov 2018 15:30:49 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 14 Nov 2018 15:30:49 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Thread-Topic: [OE-core] [PATCH v2] update-alternatives: Allow using relative
	symlinks
Thread-Index: AQHUfB0hyOxQiqV8OE25wjFYNtSMmKVPVIug
Date: Wed, 14 Nov 2018 14:30:49 +0000
Message-ID: <9b684459235c4ef79645fc8475b76c56@XBOX04.axis.com>
References: <20181114132214.8694-1-zboszor@pr.hu>
In-Reply-To: <20181114132214.8694-1-zboszor@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] update-alternatives: Allow using relative	symlinks
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
X-List-Received-Date: Wed, 14 Nov 2018 14:30:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBCw7ZzesO2cm3DqW55aSBa
b2x0w6FuDQo+IHZpYSBPcGVuZW1iZWRkZWQtY29yZQ0KPiBTZW50OiBkZW4gMTQgbm92ZW1iZXIg
MjAxOCAxNDoyMg0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYyXSB1cGRhdGUtYWx0ZXJuYXRpdmVzOiBB
bGxvdyB1c2luZyByZWxhdGl2ZQ0KPiBzeW1saW5rcw0KPiANCj4gVGhlIGFsdGVybmF0aXZlIGxp
bmtzIGFyZSBpbnZhbGlkIGR1cmluZyBkb19yb290ZnMuDQo+IA0KPiBBZGQgYSBuZXcgQUxURVJO
QVRJVkVfVEFSR0VUX1JFTEFUSVZFIGZhbWlseSBvZiB2YXJpYWJsZXMgdG8NCj4gY29uZGl0aW9u
YWxseSBtYWtlIHRoZXNlIGxpbmtzIHZhbGlkLg0KPiANCj4gdjI6IEZpeCB0aGUgY2FzZSB3aGVu
IHRoZSBsaW5rIHNvdXJjZSBhbmQgdGFyZ2V0IGFyZSBub3QgaW4NCj4gICAgIHRoZSBzYW1lIGRp
cmVjdG9yeS4NCg0KVGhlIHYyIGluZm9ybWF0aW9uIHNob3VsZCBnbyBiZWxvdyB0aGUgLS0tIGFz
IGl0IGRvZXNuJ3QgcmVsYXRlIHRvIHRoZSANCmNvbW1pdCBhcyBzdWNoLCBidXQgcmF0aGVyIHRv
IHRoZSByZXZpZXcgcHJvY2Vzcy4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBCw7ZzesO2cm3DqW55aSBa
b2x0w6FuIDx6Ym9zem9yQHByLmh1Pg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy91cGRhdGUtYWx0
ZXJuYXRpdmVzLmJiY2xhc3MgfCAyNCArKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvY2xhc3Nlcy91cGRhdGUtYWx0ZXJuYXRpdmVzLmJiY2xhc3MgYi9tZXRhL2Ns
YXNzZXMvdXBkYXRlLWFsdGVybmF0aXZlcy5iYmNsYXNzDQo+IGluZGV4IGFhMDEwNThjZjkuLjU0
MGJlYzk0ZTIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy91cGRhdGUtYWx0ZXJuYXRpdmVz
LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL3VwZGF0ZS1hbHRlcm5hdGl2ZXMuYmJjbGFz
cw0KDQovL1BldGVyDQoNCg==

