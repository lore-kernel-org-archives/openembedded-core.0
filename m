Return-Path: <B19537@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id E600C6A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 03:29:41 +0000 (UTC)
Received: from mail34-co9-R.bigfish.com (10.236.132.252) by
	CO9EHSOBE012.bigfish.com (10.236.130.75) with Microsoft SMTP Server id
	14.1.225.23; Thu, 20 Jun 2013 03:29:42 +0000
Received: from mail34-co9 (localhost [127.0.0.1])	by mail34-co9-R.bigfish.com
	(Postfix) with ESMTP id 681941000FF;
	Thu, 20 Jun 2013 03:29:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI542I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail34-co9 (localhost.localdomain [127.0.0.1]) by mail34-co9
	(MessageSwitch) id 1371698937443768_14896;
	Thu, 20 Jun 2013 03:28:57 +0000 (UTC)
Received: from CO9EHSMHS028.bigfish.com (unknown [10.236.132.254])	by
	mail34-co9.bigfish.com (Postfix) with ESMTP id 6BD9B4A007B;
	Thu, 20 Jun 2013 03:28:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS028.bigfish.com
	(10.236.130.38) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 20 Jun 2013 03:28:43 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.148]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Thu, 20 Jun 2013 03:28:42 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Thread-Topic: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
	gcc_arch check logic
Thread-Index: AQHObCPhcVh5DMWA7kOdfuDONprAqZk7cGCAgAAEXQCAAn9mMA==
Date: Thu, 20 Jun 2013 03:28:42 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A015BA748@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
	<1371560653.20823.113.camel@ted> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Yu Zongchun-B40527 <B40527@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch v2] sanity.bbclass: correct the gcc_arch check logic
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
X-List-Received-Date: Thu, 20 Jun 2013 03:29:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdW8gWmhlbmh1
YS1CMTk1MzcNCj4gU2VudDogVHVlc2RheSwgSnVuZSAxOCwgMjAxMyA5OjI2IFBNDQo+IFRvOiAn
UmljaGFyZCBQdXJkaWUnOyBSYW5keSBNYWNMZW9kDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnOyBZdSBab25nY2h1bi1CNDA1MjcNCj4gU3ViamVjdDogUkU6
IFtPRS1jb3JlXSBbb2UtY29yZV1bcGF0Y2ggdjJdIHNhbml0eS5iYmNsYXNzOiBjb3JyZWN0IHRo
ZQ0KPiBnY2NfYXJjaCBjaGVjayBsb2dpYw0KPiANCj4gSGkgUmFuZHksDQo+IA0KPiBEdXJpbmcg
dGhlIHRlc3Qgb24gbXkgbWFjaGluZSB3aXRoIGdjYy00LjEuMiwgaWYgLW1hcmNoPW5hdGl2ZSBp
cyBub3QNCj4gc3VwcG9ydGVkIGJ5IGhvc3QgZ2NjLCBhIG5vbi16ZXJvIHZhbHVlKDI1NikgcmV0
dXJucywgb3RoZXJ3aXNlIDAgcmV0dXJucy4NCj4gDQo+IFtMT0ddDQo+IHN0YXR1cyBpcyAyNTYN
Cj4gcmVzdWx0IGlzIGdjY190ZXN0LmM6MTogZXJyb3I6IGJhZCB2YWx1ZSAobmF0aXZlKSBmb3Ig
LW1hcmNoPSBzd2l0Y2gNCj4gZ2NjX3Rlc3QuYzoxOiBlcnJvcjogYmFkIHZhbHVlIChuYXRpdmUp
IGZvciAtbXR1bmU9IHN3aXRjaA0KPiANCj4gUGxlYXNlIGNvbmZpcm0gaWYgdGhpcyBpcyBzYW1l
IGFzIHlvdXIgcmVzdWx0Lg0KPiANCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gDQo+IFpoZW5odWEN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFy
ZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiA+
IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIwMTMgOTowNCBQTQ0KPiA+IFRvOiBMdW8gWmhlbmh1
YS1CMTk1Mzc7IFJhbmR5IE1hY0xlb2QNCj4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZzsgWXUgWm9uZ2NodW4tQjQwNTI3DQo+ID4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbb2UtY29yZV1bcGF0Y2ggdjJdIHNhbml0eS5iYmNsYXNzOiBjb3JyZWN0IHRoZQ0K
PiA+IGdjY19hcmNoIGNoZWNrIGxvZ2ljDQo+ID4NCj4gPiBPbiBUdWUsIDIwMTMtMDYtMTggYXQg
MjE6MDggKzA4MDAsIFpoZW5odWEgTHVvIHdyb3RlOg0KPiA+ID4gVGhlIGdjYyBhcmNoIGNoZWNr
IHJlc3VsdCBpcyBpbmNvcnJlY3Qgd2hlbiBnY2MgdmVyc2lvbiBpcyBvbGRlcg0KPiA+ID4gdGhh
bg0KPiA+IDQuNS4NCj4gPiA+IFNhbml0eSBjaGVja2VyIHJlcXVlc3RzIHVzZXIgdG8gYWRkICIt
bWFyY2g9bmF0aXZlIiBpbnRvDQo+ID4gPiBCVUlMRF9DRkxBR1MgZXZlbiBpZiB0aGUgZmxhZyBp
cyBub3Qgc3VwcG9ydGVkIGJ5IGhvc3QgZ2NjLg0KPiA+ID4NCj4gPiA+IFRoZSBzdGF0dXMgaXMg
MCB3aGVuIC1tYXJjaD1uYXRpdmUgaXMgc3VwcG9ydGVkIGJ5IGhvc3QgZ2NjLCBzbyBzZXQNCj4g
PiA+IHJlc3VsdCB0byBUcnVlLCBvdGhlcndpc2Ugc2V0IHJlc3VsdCB0byBGYWxzZS4NCj4gPiA+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuaHVhIEx1byA8emhlbmh1YS5sdW9AZnJlZXNjYWxl
LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIG1ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyB8ICAg
IDIgKy0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNz
DQo+ID4gPiBiL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyBpbmRleCAzYjk5MzRiLi5lZTA5
Njc5IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzDQo+ID4g
PiArKysgYi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MNCj4gPiA+IEBAIC0zMjUsNyArMzI1
LDcgQEAgZGVmIGNoZWNrX2djY19tYXJjaChzYW5pdHlfZGF0YSk6DQo+ID4gPiAgICAgICAgICBp
ZiBzdGF0dXMgIT0gMDoNCj4gPiA+ICAgICAgICAgICAgICAjIENoZWNrIGlmIEdDQyBjb3VsZCB3
b3JrIHdpdGggbWFyY2gNCj4gPiA+ICAgICAgICAgICAgICBzdGF0dXMscmVzdWx0ID0NCj4gPiBv
ZS51dGlscy5nZXRzdGF0dXNvdXRwdXQoIiR7QlVJTERfUFJFRklYfWdjYyAtbWFyY2g9bmF0aXZl
IGdjY190ZXN0LmMNCj4gPiAtbw0KPiA+IGdjY190ZXN0IikNCj4gPiA+IC0gICAgICAgICAgICBp
ZiBzdGF0dXMgIT0gMDoNCj4gPiA+ICsgICAgICAgICAgICBpZiBzdGF0dXMgPT0gMDoNCj4gPiA+
ICAgICAgICAgICAgICAgICAgcmVzdWx0ID0gVHJ1ZQ0KPiA+ID4gICAgICAgICAgICAgIGVsc2U6
DQo+ID4gPiAgICAgICAgICAgICAgICAgIHJlc3VsdCA9IEZhbHNlDQo+ID4NCj4gPiBDYW4geW91
IGFuZCBSYW5keSBwbGVhc2Ugc29ydCBvdXQgd2hhdCB0aGUgY29ycmVjdCB2YWx1ZSBpcyBoZXJl
IHBsZWFzZS4NCj4gPiBUaGlzIGFwcGVhcnMgdG8gZGlyZWN0bHkgcmV2ZXJ0DQo+ID4gaHR0cDov
L2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD1hZDI3NmQ3ZDg5
MTkwYzU3YQ0KPiA+IDE1Mg0KPiA+IDg2N2Q3Mjc4ZWUxOGY3ODRmZjJjDQo+ID4NCj4gPiBDaGVl
cnMsDQo+ID4NCj4gPiBSaWNoYXJkDQo+ID4NCj4gPg0KDQo=


