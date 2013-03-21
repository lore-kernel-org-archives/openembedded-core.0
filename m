Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIfMC-0002hb-Gl
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 14:16:38 +0100
Received: from mail102-tx2-R.bigfish.com (10.9.14.234) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 12:29:34 +0000
Received: from mail102-tx2 (localhost [127.0.0.1])	by
	mail102-tx2-R.bigfish.com (Postfix) with ESMTP id D6F5A4200C6;
	Thu, 21 Mar 2013 12:29:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail102-tx2 (localhost.localdomain [127.0.0.1]) by mail102-tx2
	(MessageSwitch) id 136386897114990_8441;
	Thu, 21 Mar 2013 12:29:31 +0000 (UTC)
Received: from TX2EHSMHS037.bigfish.com (unknown [10.9.14.231])	by
	mail102-tx2.bigfish.com (Postfix) with ESMTP id C9753260089;
	Thu, 21 Mar 2013 12:29:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS037.bigfish.com
	(10.9.99.137) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 12:29:25 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Thu, 21 Mar 2013 12:29:25 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [oe-core] rpm: fix probably redundant RPATH issue
Thread-Index: AQHOJgE75hCN2mf7IEOfI9Pkg9bFlpiv4eiAgAAxATA=
Date: Thu, 21 Mar 2013 12:29:25 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0148460D@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363849246-9294-1-git-send-email-zhenhua.luo@freescale.com>
	<1363858329.16482.133.camel@ted>
In-Reply-To: <1363858329.16482.133.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.14]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: rpm: fix probably redundant RPATH issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 13:16:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggRlNMIHRvb2xjaGFpbiB3aGljaCBoYXMg
bm90IGJlZW4gcHVibGlzaGVkIHlldC4gDQoNCkkgYW0gbm90IHN1cmUgaWYgdGhlIGlzc3VlIGNh
biBiZSByZXByb2R1Y2VkIHdpdGggWW9jdG8gZGVmYXVsdCB0b29sY2hhaW4uIA0KDQoNCkJlc3Qg
UmVnYXJkcywNCg0KWmhlbmh1YQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjEsIDIwMTMgNTozMiBQTQ0KPiBUbzog
THVvIFpoZW5odWEtQjE5NTM3DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnOyBHdW8gQ2h1bnJvbmctQjQwMjkwDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W29lLWNvcmVdIHJwbTogZml4IHByb2JhYmx5IHJlZHVuZGFudCBSUEFUSCBpc3N1ZQ0KPiANCj4g
T24gVGh1LCAyMDEzLTAzLTIxIGF0IDE1OjAwICswODAwLCBaaGVuaHVhIEx1byB3cm90ZToNCj4g
PiBDbGVhciB0aGUgcnBhdGggZGVmaW5lIHRvIGZpeCBiZWxvdyBidWlsZCBpc3N1ZToNCj4gPiBF
UlJPUjogUUEgSXNzdWU6IHJwbS1idWlsZDoNCj4gPiAvd29yay9wcGNlNTAwbWMtZnNsX25ldHdv
cmtpbmctbGludXgvcnBtLzUuNC45LXI2MS9wYWNrYWdlcy1zcGxpdC9ycG0tDQo+ID4gYnVpbGQv
dXNyL2xpYi9ycG0vYmluL3NxbGl0ZTMgY29udGFpbnMgcHJvYmFibHktcmVkdW5kYW50IFJQQVRI
DQo+ID4gL3Vzci9saWIvLi4vbGliDQo+ID4gRVJST1I6IFFBIElzc3VlOiBycG0tYnVpbGQ6DQo+
ID4gL3dvcmsvcHBjZTUwMG1jLWZzbF9uZXR3b3JraW5nLWxpbnV4L3JwbS81LjQuOS1yNjEvcGFj
a2FnZXMtc3BsaXQvcnBtLQ0KPiBidWlsZC91c3IvbGliL3JwbS9iaW4vY3AgY29udGFpbnMgcHJv
YmFibHktcmVkdW5kYW50IFJQQVRIDQo+IC91c3IvbGliLy4uL2xpYiAuLi4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFpoZW5odWEgTHVvIDx6aGVuaHVhLmx1b0BmcmVlc2NhbGUuY29tPg0KPiA+
IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV81LjQuOS5iYiB8ICAgIDUg
KysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzUu
NC45LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV81LjQuOS5iYg0KPiA+
IGluZGV4IGNmZGMzOTAuLjEyYTE2NDIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS9ycG1fNS40LjkuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnBtL3JwbV81LjQuOS5iYg0KPiA+IEBAIC00Myw3ICs0Myw3IEBAIExJQ0VOU0UgPSAiTEdQTHYy
LjEiDQo+ID4gIExJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkcuTElCO21kNT0y
ZDUwMjVkNGFhMzQ5NWJlZmVmOGYxNzIwNmE1YjBhMSINCj4gPg0KPiA+ICBERVBFTkRTID0gImxp
YnBjcmUgYXR0ciBhY2wgcG9wdCBvc3NwLXV1aWQgZmlsZSBiaXNvbi1uYXRpdmUiDQo+ID4gLVBS
ID0gInI2MiINCj4gPiArUFIgPSAicjYzIg0KPiA+DQo+ID4gICMgcnBtMmNwaW8gaXMgYSBzaGVs
bCBzY3JpcHQsIHdoaWNoIGlzIHBhcnQgb2YgdGhlIHJwbSBzcmMucnBtLiAgSXQNCj4gPiBpcyBu
ZWVkZWQgICMgaW4gb3JkZXIgdG8gZXh0cmFjdCB0aGUgZGlzdHJpYnV0aW9uIFNSUE0gaW50byBh
IGZvcm1hdCB3ZQ0KPiBjYW4gZXh0cmFjdC4uLg0KPiA+IEBAIC0zNjgsNiArMzY4LDkgQEAgZG9f
Y29uZmlndXJlKCkgew0KPiA+ICAJc2VkIC1lICdzL3BrZy1jb25maWcgLS1leGlzdHMgdXVpZC9w
a2ctY29uZmlnIC0tZXhpc3RzIG9zc3AtdXVpZC9nJw0KPiBcDQo+ID4gIAkgICAgLWUgJ3MvcGtn
LWNvbmZpZyB1dWlkL3BrZy1jb25maWcgb3NzcC11dWlkL2cnIC1pICR7U30vY29uZmlndXJlDQo+
ID4NCj4gPiArICAgICAgICAjIENsZWFyIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWMgdG8gYXZv
aWQgcmVkdW5kYW50IHJwYXRoDQo+IGRlZmluaXRpb24NCj4gPiArICAgICAgICBzZWQgLWkNCj4g
PiArICdzL2hhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JGx0LiovaGFyZGNvZGVfbGliZGlyX2Zs
YWdfc3BlYz0vZycNCj4gPiArICR7U30vY29uZmlndXJlDQo+ID4gKw0KPiA+ICAJZXhwb3J0IHZh
cnByZWZpeD0ke2xvY2Fsc3RhdGVkaXJ9DQo+ID4gIAlvZV9ydW5jb25mDQo+ID4gIH0NCj4gDQo+
IFdlJ3JlIHNlZWluZyBhIGZldyBvZiB0aGVzZSBhbmQgd2UncmUgZ29pbmcgdG8gZW5kIHVwIGFk
ZGluZyB0aGlzIGhhY2sgdG8NCj4gZXZlcnkgcmVjaXBlLiBJJ2QgbGlrZSB0byBmaWd1cmUgb3V0
IHdoYXQgaW4gbGlidG9vbCBpcyBkb2luZyB0aGlzIGFuZA0KPiBmaXggdGhlIGxpYnRvb2wgcGF0
Y2hlcyBzbyBpdCBkb2Vzbid0IGhhcHBlbi4gVGhlcmUgbXVzdCBiZSBzb21lIHBhdGgNCj4gbm9y
bWFsaXNhdGlvbiBpc3N1ZSBpbiB0aGVyZSBzb21ld2hlcmUuDQo+IA0KPiBJcyB0aGVyZSBhbiBl
YXN5IHdheSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZT8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJp
Y2hhcmQNCj4gDQoNCg==



