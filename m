Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 46A347CE89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:53:09 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
	[10.13.135.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 48DE124E2607;
	Wed, 20 Mar 2019 22:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1553147590; bh=UXRiLRISc3Xav8EnLsA5VhCJ6S2bM4Ab34sOR1vRkC0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=c2ZDXFSKKcfOJ8CRJzwGRbYfExkumxNdWtvlnd2RLR4YxvuOGYdWMh7IFNT5ubORT
	6onA6NQT0v1DS5s6/GBBdQ+0BUAA2CWIuPcFcdoCqTNHeZSa+KBsnXCZGcawgoSt9f
	Gs5kNicRtOjKd5n5SSzA1xdI27EU7tDlAzMZmSRWYWSlmuatSFpv3KQKt5dKYXQS/g
	Sahxc7C5DNvTpNMht1RKU9D14+bu+EasLD3jPrIBQtrTWHP87l+7Gq4eb/5nkYRA0b
	UKmtDYnUBVlcSHkdUPV7exGhPJJ3/yz15t/K0DPiNcaQw0mve2xqFxALMC2yJVdJ03
	cQyxyMkfKts+A==
Received: from us01wehtc1.internal.synopsys.com
	(us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailhost.synopsys.com (Postfix) with ESMTPS id C93C3A0062;
	Thu, 21 Mar 2019 05:53:09 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 20 Mar 2019 22:53:09 -0700
Received: from DE02WEMBXA.internal.synopsys.com ([fe80::a014:7216:77d:d55c])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000;
	Thu, 21 Mar 2019 06:53:07 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: Kang Kai <Kai.Kang@windriver.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] fixup! qemu: backport patches to fix cves
Thread-Index: AQHU3x8jRtvSCqvhbUCLMs21tZ0OsaYVCkEwgABSk4CAADhDQA==
Date: Thu, 21 Mar 2019 05:53:06 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE6468225ACB@de02wembxa.internal.synopsys.com>
References: <20190320131619.58439-1-kai.kang@windriver.com>
	<4881796E12491D4BB15146FE0209CE6468225794@de02wembxa.internal.synopsys.com>
	<d6711f3c-f4d6-d469-3aa3-47691d02b605@windriver.com>
In-Reply-To: <d6711f3c-f4d6-d469-3aa3-47691d02b605@windriver.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.89]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixup! qemu: backport patches to fix cves
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
X-List-Received-Date: Thu, 21 Mar 2019 05:53:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbmcgS2Fp
IDxLYWkuS2FuZ0B3aW5kcml2ZXIuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjEsIDIw
MTkgNjoyNyBBTQ0KPiBUbzogQWxleGV5IEJyb2RraW4gPGFsZXhleS5icm9ka2luQHN5bm9wc3lz
LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
Zml4dXAhIHFlbXU6IGJhY2twb3J0IHBhdGNoZXMgdG8gZml4IGN2ZXMNCj4gDQo+IE9uIDIwMTkv
My8yMSDkuIrljYg1OjM0LCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToNCj4gPiBIaSBLYWkgS2FuZywN
Cj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KPiA+PiBTZW50OiBXZWRu
ZXNkYXksIE1hcmNoIDIwLCAyMDE5IDQ6MTYgUE0NCj4gPj4gVG86IHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmcNCj4gPj4gQ2M6IGFsZXhleS5icm9ka2luQHN5bm9wc3lzLmNvbTsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0OiBb
UEFUQ0hdIGZpeHVwISBxZW11OiBiYWNrcG9ydCBwYXRjaGVzIHRvIGZpeCBjdmVzDQo+ID4gSnVz
dCB3b25kZXJpbmcgaWYgeW91IHdlcmUgYWJsZSB0byByZXByb2R1Y2UgbWVudGlvbmVkIHByb2Js
ZW0NCj4gPiBvbiB5b3VyIHNpZGUgYmVmb3JlIGZpeGluZyBpdD8NCj4gPg0KPiA+IEdpdmVuIFJp
Y2hhcmQncyBpbnB1dCB0aGlzIHByb2JsZW0gd2FzIHN1cHBvc2VkIHRvIGJlIGNhdWdodA0KPiA+
IGJlZm9yZSB5b3VyIHByZXZpb3VzIGNvbW1pdCBoaXQgT0UgbWFzdGVyIGJyYW5jaCBidXQgc29t
ZWhvdyBpdA0KPiA+IHNsaXBwZWQgdGhyb3VnaCB0aGUgY3JhY2tzLi4uDQo+ID4NCj4gPiBPciBv
dGhlcndpc2UgbXkgc2V0dXAgc2hvdWxkIGJlIHNvbWVob3cgdmVyeSBzcGVjaWFsIGlmIGl0IG9u
bHkNCj4gPiBoYXBwZW5zIGZvciBtZS4NCj4gDQo+IEkgY2FuIHJlcHJvZHVjZSB0aGUgYnVpbGQg
ZmFpbHVyZSB3aXRoIGRlZmF1bHQgY29uZmlndXJlOg0KPiANCj4gJCAuIHBva3kvb2UtaW5pdC1i
dWlsZC1lbnYNCj4gJCBiaXRiYWtlIHFlbXUtc3lzdGVtLW5hdGl2ZQ0KPiANCj4gSXQgc2hvdWxk
IGJlIGNvdmVyZWQgYnkgYXV0b2J1aWxkZXIuIDooDQo+IA0KPiBBbmQgdGhlcmUgaXMgbm8gZXJy
b3IgdG8gYnVpbGQgcWVtdSBhbmQgcWVtdS1uYXRpdmXCoCB0aGF0DQo+IGh3L3JkbWEvcmRtYV9i
YWNrZW5kLmMgaXMgbm90IGV2ZW4gY29tcGlsZWQgYmVjYXVzZToNCj4gDQo+ICogQ09ORklHX1BD
SSBpcyBub3Qgc2V0IGZvciBxZW11LW5hdGl2ZQ0KPiAqIENPTkZJR19QVlJETUEgaXMgbm90IHNl
dCBmb3IgcWVtdQ0KDQpUaGFua3MgZm9yIGNvbmZpcm1hdGlvbiENCg0KUmljaGFyZCwgRldJVyBJ
IGhpdCB0aGlzIGlzc3VlIGJ1aWxkaW5nICJidWlsZC1hcHBsaWFuY2UtaW1hZ2UiDQp3aGljaCBJ
IHVzZSBmb3Igc21va2UtdGVzdGluZyBhcyB0aGVyZSdyZSBxdWl0ZSBhIGZldyBwYWNrYWdlcw0K
YmVpbmcgYnVpbHQuDQoNCi1BbGV4ZXkNCg==

