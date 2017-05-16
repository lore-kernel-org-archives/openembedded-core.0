Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 19F9777DEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 16:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D4E772E3E7;
	Tue, 16 May 2017 18:29:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zGyLfGIkriQ0; Tue, 16 May 2017 18:29:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 125F82E23D;
	Tue, 16 May 2017 18:29:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEB0C1A077;
	Tue, 16 May 2017 18:29:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E36C71A073;
	Tue, 16 May 2017 18:29:30 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 16 May 2017 18:29:30 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id D5C4F3800;
	Tue, 16 May 2017 18:29:30 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 16 May 2017 18:29:30 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 16 May 2017 18:29:30 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 16 May 2017 18:29:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 0/2] Allow oe-pkgdata-util package-info to
	display more info
Thread-Index: AQHSzkZqp9gGxV6pNUqQQ7Dv3QS0/6H3ErOw
Date: Tue, 16 May 2017 16:29:30 +0000
Message-ID: <2e2982504b9f46819b0c90ad11fdde7b@XBOX02.axis.com>
References: <cover.1494932131.git.pkj@axis.com>
	<1494940489.27342.30.camel@linuxfoundation.org>
In-Reply-To: <1494940489.27342.30.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Allow oe-pkgdata-util package-info to display more info
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
X-List-Received-Date: Tue, 16 May 2017 16:29:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAxNiBt
YWogMjAxNyAxNToxNQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwLzJdIEFsbG93IG9lLXBrZ2RhdGEt
dXRpbCBwYWNrYWdlLWluZm8NCj4gdG8gZGlzcGxheSBtb3JlIGluZm8NCj4gDQo+IE9uIFR1ZSwg
MjAxNy0wNS0xNiBhdCAxMjo1NiArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+
IEFmdGVyIGEgYnVpbGQgaW4gb3VyIGF1dG9idWlsZGVyLCB3ZSB1c2UgYG9lLXBrZ2RhdGEtdXRp
bCBwYWNrYWdlLQ0KPiA+IGluZm8NCj4gPiAtZiBwYWNrYWdlLm1hbmlmZXN0YCB0byBzdG9yZSBh
IGZpbGUgd2l0aCBpbmZvcm1hdGlvbiBhYm91dCBlYWNoDQo+ID4gaW5zdGFsbGVkIHBhY2thZ2Uu
IFRoaXMgaXMgdHlwaWNhbGx5IHVzZWQgdG8gY29tcGFyZSBidWlsZHMgbGF0ZXINCj4gPiBvbi4g
U2luY2Ugbm90IGV2ZXJ5IGRpZmZlcmVuY2UgdG8gYSBwYWNrYWdlIGlzIGV4cGxhaW5lZCBieSBp
dHMNCj4gPiB2ZXJzaW9uLCB3ZSBoYXZlIGZvdW5kIGl0IGJlbmVmaWNpYWwgdG8gYWxzbyBpbmNs
dWRlIHRoZSBTUkNfVVJJIGluDQo+ID4gdGhlIGdlbmVyYXRlZCBmaWxlLg0KPiA+DQo+ID4gVGhp
cyBwYXRjaCBzZXQgYWRkcyBTUkNfVVJJIHRvIHRoZSBwa2dkYXRhIHRoYXQgaXMgc3RvcmVkIGZv
ciBlYWNoDQo+ID4gcGFja2FnZSwgYW5kIGFkZHMgYSBuZXcgb3B0aW9uIHRvIG9lLXBrZ2RhdGEt
dXRpbCBwYWNrYWdlLWluZm8sDQo+ID4gLWUgPHZhcj4sIHRoYXQgY2FuIGJlIHVzZWQgdG8gZGlz
cGxheSBleHRyYSB2YXJpYWJsZXMgZnJvbSB0aGUNCj4gPiBwa2dkYXRhLg0KPiANCj4gSSdtIGdv
aW5nIHRvIHNheSBubyB0byB0aGlzLg0KPiANCj4gVGhlIHJlYXNvbiBpcyB0aGF0IHBrZ2RhdGEg
aXMgbm90IHJlYWxseSBhYm91dCBjb2xsZWN0aW5nIHVwIGFsbCBidWlsZA0KPiBpbmZvcm1hdGlv
bi4gSWYgeW91IHdhbnQgdG8ga25vdyBob3cgdHdvIGRpZmZlcmVudCBidWlsZHMgZGlmZmVyLCB5
b3UnZA0KPiB1c2UgdGhlIHNpZ2RhdGEgZmlsZXMuIElmIEkgdGFrZSB0aGlzIHBhdGNoLCBtb3Jl
IHdpbGwgZm9sbG93IHdoZXJlIHlvdQ0KPiBmaW5kIHNvbWUgbmV3IGRpZmZlcmVuY2UgeW91IHdh
bnQgdG8gdHJhY2sgYW5kIHRoZXJlIGFyZSBvdGhlcg0KPiBtZWNoYW5pc21zIEknZCBzdWdnZXN0
IChidWlsZGhpc3RvcnkgYW5kIHNpZ2luZm8gZm9yIHN0YXJ0ZXJzKS4gSSBkb24ndA0KPiB3YW50
IHRvIHR1cm4gdGhlIHBrZ2RhdGEgZmlsZXMgaW50byBzb21ldGhpbmcgdGhleSdyZSBub3QuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkFzIHlvdSBtYXkgaGF2ZSBleHBlY3RlZCwg
dGhhdCB3YXMgbm90IHRoZSByZXNwb25zZSBJIGhhZCBob3BlZCBmb3IuDQpIb3dldmVyLCBJIHdp
bGwgc2VlIGlmIHdlIGNhbiBjb21lIHRvIGEgd29ya2luZyBzb2x1dGlvbiB0aGF0IHlvdSBjYW4g
DQphY2NlcHQuDQoNClNpbmNlIEkgaG9wZSB0aGF0IHRoZSBjaGFuZ2UgdG8gb2UtcGtnZGF0YS11
dGlsIGlzIGFjY2VwdGFibGUgdG8geW91LCANCkkgd2lsbCBmb2N1cyBvbiB0aGUgY2hhbmdlIGlu
IHBhY2thZ2UuYmJjbGFzcy4NCg0KUmVnYXJkaW5nIHNpZ2luZm86IEkgYXNzdW1lIGl0IGhhcyB0
aGUgaW5mb3JtYXRpb24gaW4gdGhlcmUgc29tZXdoZXJlLiANCkhvd2V2ZXIsIEkgaGF2ZSBiZWVu
IHdvcmtpbmcgd2l0aCBPRSBmb3IgZml2ZSB5ZWFycyBub3csIGFuZCBpdCBpcyBzdGlsbCANCmJh
c2ljYWxseSBhIGJsYWNrIGhvbGUgdG8gbWUuIEkgaGF2ZSBubyBpZGVhIGhvdyB0byBkbyBhbnl0
aGluZyB1c2VmdWwgDQp3aXRoIGl0Lg0KDQpSZWdhcmRpbmcgYnVpbGRoaXN0b3J5OiBBRkFJQ1Qg
dGhlcmUgaXMgbm90aGluZyBpbiB0aGVyZSBhYm91dCBuZWl0aGVyIA0KcmVjaXBlIG5hbWVzIG5v
ciBTUkNfVVJJLiBJIGd1ZXNzIHRoYXQgY2FuIGJlIGFkZGVkLCB0aG91Z2gsIGlmIHJlYWxseSAN
Cm5lZWRlZC4NCg0KT24gdGhlIG90aGVyIGhhbmQsIHdlIGhhdmUgYSB0b29sLCBvZS1wa2dkYXRh
LXV0aWwsIHRoYXQgcHJvdmlkZXMgYSANCnNpbXBsZSBpbnRlcmZhY2UgdG8gYWNjZXNzIHRoZSBw
YWNrYWdlIGluZm9ybWF0aW9uLCBhbmQgY2FuIHByb2R1Y2UgYSANCnNpbXBsZSBpbmZvcm1hdGlv
biBmaWxlIChvZS1wa2dkYXRhLXV0aWwgcGFja2FnZS1pbmZvKSB3aXRoIG9uZSBsaW5lIA0KcGVy
IHBhY2thZ2UuIFRoaXMgZmlsZSBpcyBzaW1wbGUgZW5vdWdoIHRoYXQgSSBjYW4gZ2l2ZSBpdCB0
byBvdXIgDQptYWludGVuYW5jZSB0ZWFtIGFuZCB0aGV5IGNhbiBsb29rIGF0IGl0IHRvIHNlZSBp
ZiB0aGVyZSBhcmUgYW55IA0KZGlmZmVyZW5jZXMgdGhleSBuZWVkIHRvIGtub3cgYWJvdXQuIEFu
IGFkZGl0aW9uYWwgYmVuZWZpdCBoZXJlIGlzIHRoYXQgDQp3ZSBjYW4gcnVuIG9lLXBrZ2RhdGEt
dXRpbCBmcm9tIHdpdGhpbiBhIGJpdGJha2UgdGFzayB0byBnZW5lcmF0ZSB0aGUgDQpmaWxlIHRv
Z2V0aGVyIHdpdGggdGhlIG90aGVyIGFydGVmYWN0cyB3ZSBwcm9kdWNlIGZvciBhIHJlbGVhc2Uu
DQoNClRoYXQgc2FpZCwgSSBjYW4gdW5kZXJzdGFuZCB0aGF0IHlvdSBkbyBub3Qgd2FudCB0byBh
ZGQgaW5mb3JtYXRpb24gdG8gDQp0aGUgcGtnZGF0YSB0aGF0IGlzIG5vdCByZWFsbHkgbmVlZGVk
IHRvIGJ1aWxkLiBIb3dldmVyLCB3b3VsZCB5b3UgYWNjZXB0IA0KYSB3YXkgdG8gYWRkIHRvIHRo
aXMgZGF0YSwgZS5nLiwgYnkgc3BlY2lmeWluZyBhIEJpdEJha2UgdmFyaWFibGUgc3VjaCBhcyAN
CkVYVFJBX1BLR0RBVEFfVkFSUyB3aXRoIHRoZSBuYW1lcyBvZiB0aGUgZXh0cmEgdmFyaWFibGVz
IHRoYXQgc2hvdWxkIGJlIA0Kc3RvcmVkIGluIHBrZ2RhdGE/IFRoYXQgd2F5IGl0IHdvdWxkIG5v
dCBhZmZlY3QgYW55b25lIHVubGVzcyB0aGV5IA0KYWN0dWFsbHkgbmVlZCB0aGlzIGV4dHJhIGRh
dGEsIGFuZCBJIHdvdWxkIG5vdCBoYXZlIHRoZSBidXJkZW4gb2YgY2FycnlpbmcgDQphIGJhY2tw
b3J0ZWQgdmVyc2lvbiBvZiBwYWNrYWdlLmJiY2xhc3MgZm9yZXZlciBpbiBvdXIgbGF5ZXJzIHdp
dGggYWxsIHRoZSANCmV4dHJhIG1haW50ZW5hbmNlIHRoYXQgaW5jdXJzLg0KDQovL1BldGVyDQoN
Cg==

