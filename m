Return-Path: <B19537@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0249.outbound.messaging.microsoft.com [213.199.154.249])
	by mail.openembedded.org (Postfix) with ESMTP id 46EA360130
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 13:26:05 +0000 (UTC)
Received: from mail30-db9-R.bigfish.com (10.174.16.251) by
	DB9EHSOBE013.bigfish.com (10.174.14.76) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Jun 2013 13:26:05 +0000
Received: from mail30-db9 (localhost [127.0.0.1])	by mail30-db9-R.bigfish.com
	(Postfix) with ESMTP id 20467402BA;
	Tue, 18 Jun 2013 13:26:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI542I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail30-db9 (localhost.localdomain [127.0.0.1]) by mail30-db9
	(MessageSwitch) id 1371561962375945_12305;
	Tue, 18 Jun 2013 13:26:02 +0000 (UTC)
Received: from DB9EHSMHS020.bigfish.com (unknown [10.174.16.239])	by
	mail30-db9.bigfish.com (Postfix) with ESMTP id 56B802A0049;
	Tue, 18 Jun 2013 13:26:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS020.bigfish.com
	(10.174.14.30) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 18 Jun 2013 13:26:02 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.148]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0328.011; Tue, 18 Jun 2013 13:26:01 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>
Thread-Topic: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
	gcc_arch check logic
Thread-Index: AQHObCPhcVh5DMWA7kOdfuDONprAqZk7cGCAgAAEXQA=
Date: Tue, 18 Jun 2013 13:26:00 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A015B71D0@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
	<1371560653.20823.113.camel@ted>
In-Reply-To: <1371560653.20823.113.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.141]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
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
X-List-Received-Date: Tue, 18 Jun 2013 13:26:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmFuZHksDQoNCkR1cmluZyB0aGUgdGVzdCBvbiBteSBtYWNoaW5lIHdpdGggZ2NjLTQuMS4y
LCBpZiAtbWFyY2g9bmF0aXZlIGlzIG5vdCBzdXBwb3J0ZWQgYnkgaG9zdCBnY2MsIGEgbm9uLXpl
cm8gdmFsdWUoMjU2KSByZXR1cm5zLCBvdGhlcndpc2UgMCByZXR1cm5zLiANCg0KW0xPR10NCnN0
YXR1cyBpcyAyNTYNCnJlc3VsdCBpcyBnY2NfdGVzdC5jOjE6IGVycm9yOiBiYWQgdmFsdWUgKG5h
dGl2ZSkgZm9yIC1tYXJjaD0gc3dpdGNoDQpnY2NfdGVzdC5jOjE6IGVycm9yOiBiYWQgdmFsdWUg
KG5hdGl2ZSkgZm9yIC1tdHVuZT0gc3dpdGNoDQoNClBsZWFzZSBjb25maXJtIGlmIHRoaXMgaXMg
c2FtZSBhcyB5b3VyIHJlc3VsdC4gDQoNCg0KQmVzdCBSZWdhcmRzLA0KDQpaaGVuaHVhDQoNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IFR1ZXNkYXks
IEp1bmUgMTgsIDIwMTMgOTowNCBQTQ0KPiBUbzogTHVvIFpoZW5odWEtQjE5NTM3OyBSYW5keSBN
YWNMZW9kDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBZ
dSBab25nY2h1bi1CNDA1MjcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbb2UtY29yZV1bcGF0
Y2ggdjJdIHNhbml0eS5iYmNsYXNzOiBjb3JyZWN0IHRoZQ0KPiBnY2NfYXJjaCBjaGVjayBsb2dp
Yw0KPiANCj4gT24gVHVlLCAyMDEzLTA2LTE4IGF0IDIxOjA4ICswODAwLCBaaGVuaHVhIEx1byB3
cm90ZToNCj4gPiBUaGUgZ2NjIGFyY2ggY2hlY2sgcmVzdWx0IGlzIGluY29ycmVjdCB3aGVuIGdj
YyB2ZXJzaW9uIGlzIG9sZGVyIHRoYW4NCj4gNC41Lg0KPiA+IFNhbml0eSBjaGVja2VyIHJlcXVl
c3RzIHVzZXIgdG8gYWRkICItbWFyY2g9bmF0aXZlIiBpbnRvIEJVSUxEX0NGTEFHUw0KPiA+IGV2
ZW4gaWYgdGhlIGZsYWcgaXMgbm90IHN1cHBvcnRlZCBieSBob3N0IGdjYy4NCj4gPg0KPiA+IFRo
ZSBzdGF0dXMgaXMgMCB3aGVuIC1tYXJjaD1uYXRpdmUgaXMgc3VwcG9ydGVkIGJ5IGhvc3QgZ2Nj
LCBzbyBzZXQNCj4gPiByZXN1bHQgdG8gVHJ1ZSwgb3RoZXJ3aXNlIHNldCByZXN1bHQgdG8gRmFs
c2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuaHVhIEx1byA8emhlbmh1YS5sdW9AZnJl
ZXNjYWxlLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzIHwg
ICAgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MgYi9t
ZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MNCj4gPiBpbmRleCAzYjk5MzRiLi5lZTA5Njc5IDEw
MDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcw0KPiA+ICsrKyBiL21l
dGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcw0KPiA+IEBAIC0zMjUsNyArMzI1LDcgQEAgZGVmIGNo
ZWNrX2djY19tYXJjaChzYW5pdHlfZGF0YSk6DQo+ID4gICAgICAgICAgaWYgc3RhdHVzICE9IDA6
DQo+ID4gICAgICAgICAgICAgICMgQ2hlY2sgaWYgR0NDIGNvdWxkIHdvcmsgd2l0aCBtYXJjaA0K
PiA+ICAgICAgICAgICAgICBzdGF0dXMscmVzdWx0ID0NCj4gb2UudXRpbHMuZ2V0c3RhdHVzb3V0
cHV0KCIke0JVSUxEX1BSRUZJWH1nY2MgLW1hcmNoPW5hdGl2ZSBnY2NfdGVzdC5jIC1vDQo+IGdj
Y190ZXN0IikNCj4gPiAtICAgICAgICAgICAgaWYgc3RhdHVzICE9IDA6DQo+ID4gKyAgICAgICAg
ICAgIGlmIHN0YXR1cyA9PSAwOg0KPiA+ICAgICAgICAgICAgICAgICAgcmVzdWx0ID0gVHJ1ZQ0K
PiA+ICAgICAgICAgICAgICBlbHNlOg0KPiA+ICAgICAgICAgICAgICAgICAgcmVzdWx0ID0gRmFs
c2UNCj4gDQo+IENhbiB5b3UgYW5kIFJhbmR5IHBsZWFzZSBzb3J0IG91dCB3aGF0IHRoZSBjb3Jy
ZWN0IHZhbHVlIGlzIGhlcmUgcGxlYXNlLg0KPiBUaGlzIGFwcGVhcnMgdG8gZGlyZWN0bHkgcmV2
ZXJ0DQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5L2NvbW1pdC8/
aWQ9YWQyNzZkN2Q4OTE5MGM1N2ExNTINCj4gODY3ZDcyNzhlZTE4Zjc4NGZmMmMNCj4gDQo+IENo
ZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KDQo=


