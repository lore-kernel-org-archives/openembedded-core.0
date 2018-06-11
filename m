Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 545A278A6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0D9061839A;
	Mon, 11 Jun 2018 10:45:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RG8Z0c_WYngP; Mon, 11 Jun 2018 10:45:02 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1118618070;
	Mon, 11 Jun 2018 10:45:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFB111E082;
	Mon, 11 Jun 2018 10:45:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C5E1E080;
	Mon, 11 Jun 2018 10:45:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Jun 2018 10:45:01 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id D6628293A;
	Mon, 11 Jun 2018 10:45:01 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 10:45:01 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 11 Jun 2018 10:45:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [v5][PATCH] busybox: update to 1.28.4
Thread-Index: AQHUATtLE+0LS6zqYkaP/l2c5Lv2F6RavX3w
Date: Mon, 11 Jun 2018 08:45:01 +0000
Message-ID: <9739bd9dd81149458033ba72cb7ce411@XBOX02.axis.com>
References: <1528690704-338-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1528690704-338-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 08:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBBcm1pbiBL
dXN0ZXINCj4gU2VudDogZGVuIDExIGp1bmkgMjAxOCAwNjoxOA0KPiBUbzogYWt1c3RlcjgwOEBn
bWFpbC5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogW09FLWNvcmVdIFt2NV1bUEFUQ0hdIGJ1c3lib3g6IHVwZGF0ZSB0byAxLjI4LjQNCj4g
DQo+IHJlZmFjdG9yZWQgYnVzeWJveC11ZGhjcGMtbm9fZGVjb25maWcucGF0Y2ggZm9yIHRoaXMg
dXBkYXRlDQo+IHVwZGF0ZWQgMS4yOC4zDQo+IA0KPiBbdjFdDQo+IHJlbW92ZWQgcGF0Y2hlcyBp
bmNsdWRlZCBpbiB1cGRhdGU6DQo+IGJ1c3lib3gvQ1ZFLTIwMTEtNTMyNS5wYXRjaA0KPiBidXN5
Ym94L0NWRS0yMDE3LTE1ODczLnBhdGNoDQo+IGJ1c3lib3gvYnVzeWJveC1DVkUtMjAxNy0xNjU0
NC5wYXRjaA0KPiANCj4gW3YyXQ0KPiBBZGQgYmFjayBidXN5Ym94LXVkaGNwYy1ub19kZWNvbmZp
Zy5wYXRjaCB0aSBTUkNfVVJJLCBtaXNzZWQgZWFybGllcg0KPiANCj4gW3YzXQ0KPiBVcGRhdGUg
ZGVmY29uZmlnIGJhc2VkIG9uIGZlZWRiYWNrDQo+IA0KPiBbdjRdDQo+IERlY2lkZWQgdG8gdXBk
YXRlIGFnYWluLg0KPiAxLjI4LjQNCj4gDQo+IFt2NV0NCj4gcmViYXNlZCBjaGFuZ2UgZG8gdG8g
Y2hhbmdlcyBpbiBtYXN0ZXINCj4gc3F1YXNoZWQgLmNmZyBpbnRvIGRlZmNvbmZpZyBhbmQgcmVt
b3ZlIGZpbGVzDQo+IERlbGV0ZSBidXN5Ym94LWZpeC1sem1hLXNlZ2ZhdWx0cy5wYXRjaCB3aGlj
aCBpcyBpbmNsdWRlZCBpbiB1cGRhdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJtaW4gS3Vz
dGVyIDxha3VzdGVyODA4QGdtYWlsLmNvbT4NCg0KVGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBi
ZSByZXdyaXR0ZW4gdG8gZG9jdW1lbnQgdGhlIGZpbmFsIGNvbW1pdCwgDQp3aXRob3V0IGFueSBw
YXRjaCBzZXJpZXMgcmVmZXJlbmNlcy4gVGhleSBiZWxvbmcgYWZ0ZXIgLS0tIGJlbG93Lg0KDQo+
IC0tLQ0KPiAgLi4uL2J1c3lib3gvYnVzeWJveC9DVkUtMjAxMS01MzI1LnBhdGNoICAgICAgICAg
ICAgfCA0ODEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAuLi4vYnVzeWJveC9idXN5Ym94L0NW
RS0yMDE3LTE1ODczLnBhdGNoICAgICAgICAgICB8ICA5NSAtLS0tDQo+ICAuLi4vYnVzeWJveC9i
dXN5Ym94L2J1c3lib3gtQ1ZFLTIwMTctMTY1NDQucGF0Y2ggICB8ICA0MyAtLQ0KPiAgLi4uL2J1
c3lib3gvYnVzeWJveC1maXgtbHptYS1zZWdmYXVsdHMucGF0Y2ggICAgICAgfCAxMDYgLS0tLS0N
Cj4gIC4uLi9idXN5Ym94L2J1c3lib3gtdWRoY3BjLW5vX2RlY29uZmlnLnBhdGNoICAgICAgIHwg
IDM2ICstDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvZGVmY29uZmlnICAg
ICAgICB8IDI3OCArKysrKystLS0tLS0NCj4gIG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVz
eWJveC9nZXRvcHRzLmNmZyAgICAgIHwgICAzIC0NCj4gIC4uLi9idXN5Ym94L2J1c3lib3gvbG9n
aW4tdXRpbGl0aWVzLmNmZyAgICAgICAgICAgIHwgIDEzIC0NCj4gIG1ldGEvcmVjaXBlcy1jb3Jl
L2J1c3lib3gvYnVzeWJveC9tZGV2LmNmZyAgICAgICAgIHwgICAyIC0NCj4gIC4uLi9idXN5Ym94
L2J1c3lib3gvbW91bnQtdmlhLWxhYmVsLmNmZyAgICAgICAgICAgIHwgICA5IC0NCj4gIG1ldGEv
cmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9yZXNpemUuY2ZnICAgICAgIHwgICAyIC0NCj4g
IG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9zaGExc3VtLmNmZyAgICAgIHwgICAx
IC0NCj4gIG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9zaGEyNTZzdW0uY2ZnICAg
IHwgICAxIC0NCj4gIG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9zeXNsb2cuY2Zn
ICAgICAgIHwgIDExIC0NCj4gIC4uLi97YnVzeWJveF8xLjI3LjIuYmIgPT4gYnVzeWJveF8xLjI4
LjQuYmJ9ICAgICAgIHwgIDE1ICstDQo+ICAxNSBmaWxlcyBjaGFuZ2VkLCAxNjIgaW5zZXJ0aW9u
cygrKSwgOTM0IGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUgMTAwNzU1IG1ldGEvcmVjaXBl
cy1jb3JlL2J1c3lib3gvYnVzeWJveC9DVkUtMjAxMS01MzI1LnBhdGNoDQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L0NWRS0yMDE3LTE1ODcz
LnBhdGNoDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9i
dXN5Ym94L2J1c3lib3gtQ1ZFLTIwMTctMTY1NDQucGF0Y2gNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvYnVzeWJveC1maXgtbHptYS1zZWdm
YXVsdHMucGF0Y2gNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9idXN5
Ym94L2J1c3lib3gvZ2V0b3B0cy5jZmcNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS9idXN5Ym94L2J1c3lib3gvbG9naW4tdXRpbGl0aWVzLmNmZw0KPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9tb3VudC12aWEtbGFi
ZWwuY2ZnDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9i
dXN5Ym94L3Jlc2l6ZS5jZmcNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29y
ZS9idXN5Ym94L2J1c3lib3gvc2hhMXN1bS5jZmcNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvc2hhMjU2c3VtLmNmZw0KPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9zeXNsb2cuY2ZnDQo+
ICByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC97YnVzeWJveF8xLjI3LjIuYmIgPT4g
YnVzeWJveF8xLjI4LjQuYmJ9ICg3MiUpDQoNCi8vUGV0ZXINCg0K

