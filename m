Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE13F7CB01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 369B6183D0;
	Mon, 25 Feb 2019 12:38:13 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cD47QdojFMuZ; Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B44A51813C;
	Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A31731E088;
	Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9772E1E087;
	Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 8A05B5BF;
	Mon, 25 Feb 2019 12:38:11 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 25 Feb 2019 12:38:11 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 25 Feb 2019 12:38:11 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] [thud][PATCH 1/2] libaio: Extend to native
Thread-Index: AQHUmkOgBgHXk3stzUae1W+zR8VSV6XsBqOAgAA4ZgCABIQ4wA==
Date: Mon, 25 Feb 2019 11:38:11 +0000
Message-ID: <14c35309c6c8464b9609f17b1c56f523@XBOX04.axis.com>
References: <20181222221322.3768-1-pkj@axis.com>
	<db68711ecba94d9aa3fd99ff16652e78@XBOX04.axis.com>
	<f272c949-3c12-a35c-40e3-2c8ce5cb9fab@gmail.com>
In-Reply-To: <f272c949-3c12-a35c-40e3-2c8ce5cb9fab@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH 1/2] libaio: Extend to native
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
X-List-Received-Date: Mon, 25 Feb 2019 11:38:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDIyIGZlYnJ1YXJpIDIwMTkgMTY6MjENCj4gVG86
IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFt0aHVkXVtQQVRDSCAxLzJdIGxpYmFpbzogRXh0ZW5kIHRvIG5hdGl2ZQ0KPiAN
Cj4gT24gMi8yMi8xOSAzOjAwIEFNLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gKnBp
bmcqDQo+ID4NCj4gPiAvL1BldGVyDQo+IA0KPiB5b3UgbWVhbiB0aGlzPw0KPiBodHRwOi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L2NvbW1pdC9tZXRhL3JlY2lwZXMt
DQo+IGV4dGVuZGVkL2xpYmFpbz9oPXRodWQmaWQ9NDAzNTBiNDZkNWMwNTNiNDMzNmNjMTI4OTIy
ZjQ0Y2U4MGU3ZGE5YQ0KDQpOby4gVGhhdCBvbmUgZXh0ZW5kZWQgdGhlIHJlY2lwZSB0byBuYXRp
dmVzZGssIG15IHBhdGNoIGV4dGVuZHMgaXQgDQpmb3IgbmF0aXZlIGFzIHdlbGwuDQoNClRoaXMg
aXMgdGhlIG9uZSBJIHdhbnQ6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcv
cGF0Y2gvMTU3MzkyLw0KDQovL1BldGVyDQoNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IE9uIEJlaGFsZiBPZiBQZXRlcg0KPiBLamVsbGVyc3RlZHQNCj4gPj4gU2VudDogZGVuIDIy
IGRlY2VtYmVyIDIwMTggMjM6MTMNCj4gPj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDogW09FLWNvcmVdIFt0aHVkXVtQQVRDSCAxLzJd
IGxpYmFpbzogRXh0ZW5kIHRvIG5hdGl2ZQ0KPiA+Pg0KPiA+PiBGcm9tOiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPj4NCj4gPj4gbHZtMiBjdXJy
ZW50bHkgcmVxdWlyZXMgbGliYWlvLiBTbyBidWlsZGluZyBsdm0yLW5hdGl2ZSB3aWxsIHJlc3Vs
dA0KPiBpbg0KPiA+PiB0aGUgZm9sbG93aW5nIGVycm9yLg0KPiA+Pg0KPiA+PiAgIEVSUk9SOiBS
ZXF1aXJlZCBidWlsZCB0YXJnZXQgJ2x2bTItbmF0aXZlJyBoYXMgbm8gYnVpbGRhYmxlDQo+IHBy
b3ZpZGVycy4NCj4gPj4gICBNaXNzaW5nIG9yIHVuYnVpbGRhYmxlIGRlcGVuZGVuY3kgY2hhaW4g
d2FzOiBbJ2x2bTItbmF0aXZlJywNCj4gJ2xpYmFpby1uYXRpdmUnXQ0KPiA+Pg0KPiA+PiBFeHRl
bmQgbGliYWlvIHRvIG5hdGl2ZSB0byBmaXggdGhpcyBpc3N1ZS4NCj4gPj4NCj4gPj4gU2lnbmVk
LW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPg0KPiA+PiAtLS0NCj4gPj4NCj4gPj4gVGhpcyBpcyBhIGJhY2twb3J0
IGZyb20gbWFzdGVyLg0KPiA+Pg0KPiA+PiAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFpby9s
aWJhaW9fMC4zLjExMS5iYiB8IDIgKy0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYmFpby9saWJhaW9fMC4zLjExMS5iYg0KPiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhaW8vbGliYWlvXzAuMy4xMTEuYmINCj4gPj4gaW5kZXggMDRiNTBiNjFlYy4uOGUx
Y2QzNDlhMCAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFpby9s
aWJhaW9fMC4zLjExMS5iYg0KPiA+PiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYWlv
L2xpYmFpb18wLjMuMTExLmJiDQo+ID4+IEBAIC0yMCw0ICsyMCw0IEBAIGRvX2luc3RhbGwgKCkg
ew0KPiA+PiAgICAgIG9lX3J1bm1ha2UgaW5zdGFsbCBERVNURElSPSR7RH0NCj4gPj4gIH0NCj4g
Pj4NCj4gPj4gLUJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlc2RrIg0KPiA+PiArQkJDTEFTU0VYVEVO
RCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiA+PiAtLQ0KPiA+PiAyLjEyLjANCg0K

