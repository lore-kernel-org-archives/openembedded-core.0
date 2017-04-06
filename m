Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 637497760E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7B08C18196;
	Thu,  6 Apr 2017 09:21:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LWuK9pi9mRlk; Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6486618159;
	Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CF891A08E;
	Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 418151A08D;
	Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 3574F2ACA;
	Thu,  6 Apr 2017 09:21:01 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 6 Apr 2017 09:21:01 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 6 Apr 2017 09:21:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 3/3] base-files: profile: Simplify setting
	variables conditionally
Thread-Index: AQHSrh51ZWCpuxhdmEu0uVcmdIpDLqG37PoQ
Date: Thu, 6 Apr 2017 07:21:01 +0000
Message-ID: <9b7ae17fdbea49a9b0383cb8b6a8dffa@XBOX02.axis.com>
References: <20170405134642.12572-1-pkj@axis.com>
	<20170405134642.12572-3-pkj@axis.com>
	<1491403440.17200.16.camel@linuxfoundation.org>
In-Reply-To: <1491403440.17200.16.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2 3/3] base-files: profile: Simplify setting variables conditionally
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
X-List-Received-Date: Thu, 06 Apr 2017 07:21:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiA1IGFw
cmlsIDIwMTcgMTY6NDQNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0
ZWR0QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0h2MiAzLzNdIGJhc2UtZmlsZXM6IHBy
b2ZpbGU6IFNpbXBsaWZ5DQo+IHNldHRpbmcgdmFyaWFibGVzIGNvbmRpdGlvbmFsbHkNCj4gDQo+
IE9uIFdlZCwgMjAxNy0wNC0wNSBhdCAxNTo0NiArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdy
b3RlOg0KPiA+IEl0IGlzIHByZWZlcnJlZCB0byB1c2UgYFsgPGNvbmRpdGlvbj4gXSB8fCAuLi5g
IGluc3RlYWQgb2YNCj4gPiBgWyA8bmVnYXRlZCBjb25kaXRpb24+IF0gJiYgLi4uYCBhcyB0aGUg
bGF0dGVyIGxlYXZlcyAkPyBzZXQgdG8gMS4NCj4gDQo+IFlvdXIgcGF0Y2ggYW5kIHRoZSBkZXNj
cmlwdGlvbiBhYm92ZSBkb24ndCBtYXRjaC4gVGhlcmUgYXJlIGNoYW5nZXMNCj4gaGVyZSB3aGlj
aCBhcmVuJ3TCoDxuZWdhdGVkIGNvbmRpdGlvbj4gYW5kIGFyZSBzdHlsaXN0aWMgY2hhbmdlcyBp
bnN0ZWFkDQoNCldlbGwsIHRoZSBpbnRlbmRlZCBtZWFuaW5nIHdhcyB0aGF0IHdoYXRldmVyIDxj
b25kaXRpb24+IHdhcyB1c2VkIGluIHRoZSAgDQpmaXJzdCBleGFtcGxlIHNob3VsZCBiZSBuZWdh
dGVkIGluIHRoZSBzZWNvbmQgb25lLCBub3QgdG8gbWVhbiBhbiBleHBsaWNpdCANCm5lZ2F0ZSBv
cGVyYXRvciBzaG91bGQgYmUgdXNlZCwgZS5nLiwgaWYgdGhlIGZpcnN0IDxjb25kaXRpb24+IGlz
IA0KWyAteiAiJFZBUiIgXSwgdGhlIHNlY29uZCBvbmUgd291bGQgYmUgWyAiJFZBUiIgXSwgbm90
IFsgISAteiAiJFZBUiIgXS4NCg0KTWF5YmUgbXkgZXhhbXBsZXMgYXJlIGp1c3QgY29uZnVzaW5n
IHRoaW5ncyBhbmQgSSBzaG91bGQganVzdCByZW1vdmUNCnRoZW0/DQoNCj4gYWZhaWN0LiBXZSdy
ZSBwYXN0IGZlYXR1cmUgZnJlZXplIHNvIHdoaWxzdCBJJ20gaW50ZXJlc3RlZCBpbiBnZW51aW5l
DQo+IGJ1Z3MsIEkgZG8gbm90IHJlYWxseSB3YW50IGNvZGUgY2h1cm4gd2hpY2gganVzdCBpbnRy
b2R1Y2VzIHJpc2suDQoNCkFzIGxvbmcgYXMgeW91IHRha2UgdGhlIHNlY29uZCBwYXRjaCAod2hp
Y2ggaXMgYSBnZW51aW5lIGJ1ZyksIEkgYW0gZmluZSANCih0aGUgZmlyc3Qgb25lIGlzIHB1cmUg
d2hpdGVzcGFjZSBjbGVhbiB1cCwgc28gaXQgc2hvdWxkIGJlIHNhZmUgdG8gdGFrZSANCmFzIHdl
bGwpLg0KDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0t
DQo+ID4gwqBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvcHJvZmlsZSB8
IDE0ICsrKysrKy0tLS0tLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2Jhc2UtZmlsZXMvYmFzZS1maWxlcy9wcm9maWxlDQo+ID4gYi9tZXRhL3JlY2lwZXMtY29yZS9i
YXNlLWZpbGVzL2Jhc2UtZmlsZXMvcHJvZmlsZQ0KPiA+IGluZGV4IGNlYWYxNWY3OTkuLmEwNjIw
MjgyMjYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNl
LWZpbGVzL3Byb2ZpbGUNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jh
c2UtZmlsZXMvcHJvZmlsZQ0KPiA+IEBAIC0zLDE1ICszLDEzIEBADQo+ID4NCj4gPiDCoFBBVEg9
Ii91c3IvbG9jYWwvYmluOi91c3IvYmluOi9iaW4iDQo+ID4gwqBFRElUT1I9InZpIgkJCSMgbmVl
ZGVkIGZvciBwYWNrYWdlcyBsaWtlDQo+IGNyb24sDQo+ID4gZ2l0LWNvbW1pdA0KPiA+IC10ZXN0
IC16ICIkVEVSTSIgJiYgVEVSTT0idnQxMDAiCSMgQmFzaWMgdGVybWluYWwgY2FwYWIuIEZvcg0K
PiA+IHNjcmVlbiBldGMuDQo+ID4gK1sgIiRURVJNIiBdIHx8IFRFUk09InZ0MTAwIgkjIEJhc2lj
IHRlcm1pbmFsIGNhcGFiLiBGb3INCj4gPiBzY3JlZW4gZXRjLg0KPiA+DQo+ID4gLWlmIFsgIiRI
T01FIiA9ICJST09USE9NRSIgXTsgdGhlbg0KPiA+IC0JUEFUSD0kUEFUSDovdXNyL2xvY2FsL3Ni
aW46L3Vzci9zYmluOi9zYmluDQo+ID4gLWZpDQo+ID4gLWlmIFsgIiRQUzEiIF07IHRoZW4NCj4g
PiAtCSMgd29ya3MgZm9yIGJhc2ggYW5kIGFzaCAobm8gb3RoZXIgc2hlbGxzIGtub3duIHRvIGJl
IGluIHVzZQ0KPiA+IGhlcmUpDQo+ID4gLQlQUzE9J1x1QFxoOlx3XCQgJw0KPiA+IC1maQ0KPiA+
ICsjIEFkZCAvc2JpbiAmIGNvIHRvICRQQVRIIGZvciB0aGUgcm9vdCB1c2VyDQo+ID4gK1sgIiRI
T01FIiAhPSAiUk9PVEhPTUUiIF0gfHwNCj4gPiBQQVRIPSRQQVRIOi91c3IvbG9jYWwvc2Jpbjov
dXNyL3NiaW46L3NiaW4NCj4gPiArDQo+ID4gKyMgU2V0IHRoZSBwcm9tcHQgZm9yIGJhc2ggYW5k
IGFzaCAobm8gb3RoZXIgc2hlbGxzIGtub3duIHRvIGJlIGluDQo+ID4gdXNlIGhlcmUpDQo+ID4g
K1sgLXogIiRQUzEiIF0gfHwgUFMxPSdcdUBcaDpcd1wkICcNCj4gPg0KPiA+IMKgaWYgWyAtZCAv
ZXRjL3Byb2ZpbGUuZCBdOyB0aGVuDQo+ID4gwqAJZm9yIGkgaW4gL2V0Yy9wcm9maWxlLmQvKi5z
aDsgZG8NCj4gPiAtLQ0KPiA+IDIuMTIuMA0KDQovL1BldGVyDQoNCg==

