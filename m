Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 374C177A2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B2D1318337;
	Tue, 28 Mar 2017 12:47:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id u43Xmv9aC0zB; Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 92B2F182F5;
	Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B8D61E079;
	Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 309801E078;
	Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 248831FBD;
	Tue, 28 Mar 2017 12:46:57 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 28 Mar 2017 12:46:57 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 28 Mar 2017 12:46:56 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] classes: Replace "if test" file tests with
	POSIX file tests
Thread-Index: AQHSpZI3ZjVwGSTz7EKvL8IAyo7U7qGokDGAgAFWVACAAC7HUA==
Date: Tue, 28 Mar 2017 10:46:56 +0000
Message-ID: <e91ff8ce530942ef8f6711d3c7726f36@XBOX02.axis.com>
References: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
	<1490621485.13980.263.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
In-Reply-To: <alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Replace "if test" file tests with POSIX file tests
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
X-List-Received-Date: Tue, 28 Mar 2017 10:47:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBSb2JlcnQg
UC4gSi4gRGF5DQo+IFNlbnQ6IGRlbiAyOCBtYXJzIDIwMTcgMTE6NTcNCj4gVG86IFJpY2hhcmQg
UHVyZGllDQo+IENjOiBPRSBDb3JlIG1haWxpbmcgbGlzdA0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gY2xhc3NlczogUmVwbGFjZSAiaWYgdGVzdCIgZmlsZSB0ZXN0cw0KPiB3aXRo
IFBPU0lYIGZpbGUgdGVzdHMNCj4gDQo+IE9uIE1vbiwgMjcgTWFyIDIwMTcsIFJpY2hhcmQgUHVy
ZGllIHdyb3RlOg0KPiANCj4gPiBPbiBTYXQsIDIwMTctMDMtMjUgYXQgMTQ6MDMgLTA0MDAsIFJv
YmVydCBQLiBKLiBEYXkgd3JvdGU6DQo+ID4gPiBJbiBlbnRpcmUgbWV0YS9jbGFzc2VzLyBkaXJl
Y3RvcnksIHJlcGxhY2Ugc2hlbGwgdGVzdHMgb2YgdGhlIGZvcm0NCj4gPiA+ICJpZiB0ZXN0IC0/
IC4uLiIgd2l0aCBQT1NJWCB0ZXN0cyBvZiB0aGUgZm9ybSAiaWYgWyAtPyAuLi4NCj4gPiA+DQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgUC4gSi4gRGF5IDxycGpkYXlAY3Jhc2hjb3Vyc2Uu
Y2E+DQo+ID4gPg0KPiA+ID4gLS0tDQo+ID4gPg0KPiA+ID4gwqAgYXMgaSBjYW5ub3QgYWJpZGUg
dGhvc2Ugc2lsbHkgImlmIHRlc3QiIGNvbnN0cnVjdHMsIGkgemlwcGVkDQo+ID4gPiB0aHJvdWdo
DQo+ID4gPiBhbmQgY2hhbmdlZCB0aGVtIHRvIFBPU0lYIGZvcm0uIGlzIHRoZXJlIGFueSBvYmpl
Y3Rpb24gdG8gdGhpcyBraW5kDQo+ID4gPiBvZg0KPiA+ID4gY2xlYW51cD8gbmV4dCB1cCAuLi4g
YWxsIHRob3NlICJ4JHtWQVJ9ID0geCIgdGVzdHMgLi4uDQo+ID4NCj4gPiBJJ3ZlIG1lcmdlZCBt
b3N0IG9mIHRoaXMuIFRoZXJlIHdlcmUgcGllY2VzIG9mIHRoZSBkaWZmIHRoYXQgc2ltcGx5DQo+
ID4gZGlkbid0IGFwcGx5IHNvIEkgc2tpcHBlZCB0aGVtLg0KPiA+DQo+ID4gVGhlIHJlYXNvbiBJ
J3ZlIHRha2VuIHdoYXQgYXBwbGllZCBpcyB0aGF0IHRoaXMgaXMgdmVyeSBleHBlbnNpdmUNCj4g
PiBmb3IgdXMgdG8gdGVzdCByaWdodCBub3cgYW5kIEkgbWFkZSB0aGUgbW9zdCBvZiB0aGUgdGVz
dGluZyB0aW1lIEkNCj4gPiBoYWQgb24gdGhlIHdlZWtlbmQuIFRoZSBpc3N1ZSBpcyBjaGFuZ2Vz
IHRvIHRoZSBjb3JlIGNsYXNzZXMgcmVidWlsZA0KPiA+IGV2ZXJ5dGhpbmcgc28gd2UgY2FuJ3Qg
cmV1c2Ugc3N0YXRlIGFuZCB0aGUgdGVzdHMgYXJlIG11Y2ggc2xvd2VyLg0KPiA+DQo+ID4gV2Un
cmUgcnVubmluZyBsYXRlIHdpdGggTTMgcmMyIGJ1dCBqdXN0IGFib3V0IHRvIGJ1aWxkIGl0IGFu
ZCBJDQo+ID4gdGhvdWdodCBpdCB3YXMgd29ydGggZ2V0dGluZyBzb21lIG9mIHRoaXMgaW4gcmF0
aGVyIG5vbmUgYXQgYWxsLg0KPiA+IFBsZWFzZSBkbyBmaWd1cmUgb3V0IHRoZSByZW1haW5pbmcg
cGllY2VzIGFuZCBzZW5kIHRoZW0gYW5kIHdlIG1heQ0KPiA+IG9yIG1heSBub3QgdHdlYWsgdGhl
IHJlbWFpbmluZyBiaXRzIGluIE00Lg0KPiANCj4gICBteSBuZXh0IGNsZWFudXAgd2FzIGdvaW5n
IHRvIGJlIChhcyBtZW50aW9uZWQgYWJvdmUpIHJlcGxhY2UgYWxsDQo+IHRob3NlIHNpbGx5ICJ4
JHtWQVJ9ID0geCIgc3RyaW5nIHRlc3RzIHdpdGggZWl0aGVyIG9mOg0KPiANCj4gICBbIC16ICIk
e1ZBUn0iIF0NCj4gICBbIC1uICIke1ZBUn0iIF0NCg0KVGhlcmUgaXMgbm8gcmVhc29uIHRvIGhh
dmUgdGhlIC1uIGluIHRoZXJlLiBUaGlzIGlzIGJldHRlcjoNCg0KICBbIC16ICIke1ZBUn0iIF0N
CiAgWyAiJHtWQVJ9IiBdDQoNCj4gaXMgdGhlcmUgdGltZSB0byBnZXQgdGhhdCBpbiBiZWZvcmUg
dGhlIG5leHQgZnJlZXplPyBpZiBzbywgaSBjYW4gZG8NCj4gaXQgcXVpY2tseSBmb3IgdGVzdGlu
ZzsgaWYgbm90LCBpIGd1ZXNzIGl0IGNhbiBqdXN0IHdhaXQuDQo+IA0KPiByZGF5DQoNCi8vUGV0
ZXINCg0K

