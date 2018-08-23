Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E087C79550
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 10:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E6BDF18147;
	Thu, 23 Aug 2018 12:19:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id wni5Pf4znaxJ; Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C31F718378;
	Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2F711E066;
	Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6F401E05C;
	Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 9AA141CE2;
	Thu, 23 Aug 2018 12:19:45 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 23 Aug 2018 12:19:45 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 23 Aug 2018 12:19:45 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 23 Aug 2018 12:19:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] busybox: update to 1.29.1
Thread-Index: AQHUH1P2j3IvBzLYn0+4pao6VLo2VKTDpXAAgAcVzYCAAEB3YP//8/IAgAJmTAA=
Date: Thu, 23 Aug 2018 10:19:45 +0000
Message-ID: <f1c98231cca34db7bd3919c1c2b9ce87@XBOX02.axis.com>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
	<20180719113037.6337-1-andrej.valek@siemens.com>
	<3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
	<5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
	<1d41027052aa40659d2d164dc15b38be@XBOX02.axis.com>
	<CAJ86T=WXac7+_PavCOcaE9ZkDyhcV=Xpn0dwbJXxxy92TPuPLw@mail.gmail.com>
In-Reply-To: <CAJ86T=WXac7+_PavCOcaE9ZkDyhcV=Xpn0dwbJXxxy92TPuPLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: update to 1.29.1
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
X-List-Received-Date: Thu, 23 Aug 2018 10:19:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1j
Y3VyZHlAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMjIgYXVndXN0aSAyMDE4IDAxOjM3DQo+IFRv
OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgQW5k
cmVqIFZhbGVrDQo+IDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+OyBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IHYyXSBidXN5Ym94OiB1cGRhdGUgdG8gMS4yOS4xDQo+IA0KPiBPbiBUdWUsIEF1ZyAyMSwgMjAx
OCBhdCAzOjQ4IFBNLCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBh
eGlzLmNvbT4gd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3Bl
bmVtYmVkZGVkLQ0KPiA+PiBjb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24g
QmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+ID4+IFNlbnQ6IGRlbiAyMSBhdWd1c3RpIDIwMTgg
MjI6MzANCj4gPj4gVG86IEFuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPjsg
b3BlbmVtYmVkZGVkLQ0KPiA+PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIGJ1c3lib3g6IHVwZGF0ZSB0byAxLjI5LjEN
Cj4gPj4NCj4gPj4gT24gRnJpLCAyMDE4LTA4LTE3IGF0IDEwOjE4ICswMjAwLCBBbmRyZWogVmFs
ZWsgd3JvdGU6DQo+ID4+ID4gcGluZw0KPiA+Pg0KPiA+PiBGYWlscyB0byBidWlsZCBvbiB0aGUg
YXV0b2J1aWxkZXIgZHVlIHRvIG1pc3NpbmcgY3J5cHQgaGVhZGVycy4gDQo+ID4+IFRoYXQgaXMg
cHJvYmFibHkgYSBtaXNzaW5nIERFUEVORFMNCj4gPg0KPiA+IFdlbGwsIHRoZSBwYXRjaCBJIHNl
bnQgdG8gYWRkIGEgZGVwZW5kZW5jeSBvbiB2aXJ0dWFsL2NyeXB0IHdpbGwNCj4gPiBzb2x2ZSB0
aGlzLCBidXQgc2VlIGJlbG93Lg0KPiA+DQo+ID4+IGJ1dCBJJ20gd29uZGVyaW5nIHdoYXQgY2hh
bmdlZCBhbmQgaWYgdGhlDQo+ID4+IGNoYW5nZSB3YXMgaW50ZW50aW9uYWwuDQo+ID4NCj4gPiBU
aGUgY2hhbmdlIHdhcyBpbnRlbnRpb25hbCwgYnV0IGl0IHNob3VsZCBoYXZlIGJlZW4gY29uZGl0
aW9uYWwuDQo+ID4gbGliYmIvcHdfZW5jcnlwdC5jIG5vdyB1bmNvbmRpdGlvbmFsbHkgaW5jbHVk
ZXMgY3J5cHQuaCwgYnV0IGl0DQo+ID4gc2hvdWxkIG9ubHkgaW5jbHVkZSBpdCBpZiBFTkFCTEVf
VVNFX0JCX0NSWVBUIGlzIG5vdCBzZXQ6DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliYmIvcHdf
ZW5jcnlwdC5jIGIvbGliYmIvcHdfZW5jcnlwdC5jDQo+ID4gaW5kZXggODY0NTVjZDBkLi40N2My
MDY5MGYgMTAwNjQ0DQo+ID4gLS0tIGEvbGliYmIvcHdfZW5jcnlwdC5jDQo+ID4gKysrIGIvbGli
YmIvcHdfZW5jcnlwdC5jDQo+ID4gQEAgLTYsNyArNiw5IEBADQo+ID4gICAqDQo+ID4gICAqIExp
Y2Vuc2VkIHVuZGVyIEdQTHYyIG9yIGxhdGVyLCBzZWUgZmlsZSBMSUNFTlNFIGluIHRoaXMgc291
cmNlIHRyZWUuDQo+ID4gICAqLw0KPiA+ICsjaWYgIUVOQUJMRV9VU0VfQkJfQ1JZUFQNCj4gPiAg
I2luY2x1ZGUgPGNyeXB0Lmg+DQo+ID4gKyNlbmRpZg0KPiA+ICAjaW5jbHVkZSAibGliYmIuaCIN
Cj4gDQo+IERvIHlvdSBwbGFuIHRvIHN1Ym1pdCB0aGUgZml4IHVwc3RyZWFtPw0KDQpJIGhhZCBu
b3QgcGxhbm5lZCBvbiBpdCwgbm8uLi4NCg0KPiA+ICAvKiBzdGF0aWMgY29uc3QgdWludDhfdCBh
c2NpaTY0W10gQUxJR04xID0NCj4gPg0KPiA+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlv
L2J1aWxkZXJzL25pZ2h0bHkteDg2L2J1aWxkcy8xMjU5L3N0ZXBzL0J1aWxkSW1hZ2VzL2xvZ3Mv
c3RkaW8NCj4gPj4NCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9idWlsZGVycy9u
aWdodGx5LXgzMi9idWlsZHMvMTIyNS9zdGVwcy9CdWlsZEltYWdlcy9sb2dzL3N0ZGlvDQo+ID4+
DQo+ID4+IGFuZCBtb3JlLi4uDQo+ID4+DQo+ID4+IENoZWVycywNCj4gPj4NCj4gPj4gUmljaGFy
ZA0KPiA+DQo+ID4gLy9QZXRlcg0KDQovL1BldGVyDQoNCg==

