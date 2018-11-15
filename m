Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8966C185
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 10:32:12 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 9661810C0EC0;
	Thu, 15 Nov 2018 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542277933; bh=U9/7qfBR3vDrbKn+1MI3pqBo2dLoWgnfStGYH8NFtzQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RcK8NDIDbQi0kADjPxMdaYU3vDkQGW4aG8zDn3YXBddUPnKFrb3crx/tIzqzr5lMk
	uOXZ5bFygH4H/OtQbkFrb9wQEN4tch9aU2EArw6fhj6rDhCzuaGsM9CHAEzTQvc+YW
	oInpFD4aSWI3o3rEtacX6vaGRBjjyCkOS0xnNyx2C7melbcYsaB5/8w4UqeFoTdeRg
	TKpPvrXo9Hlm/oii1i30Jwiv7zSF5XX+lrvZpWQ0hNcgn25wBm80oYqRw7K0q3e6B7
	ZJYTIw4nvKWtqgjPySGyyfDApU5NHAIIFEmElnZVijalmgpONdmvwpQXY39lwxdEXA
	4RGg4BxZdyKmA==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id 0FB8F5E88;
	Thu, 15 Nov 2018 02:32:12 -0800 (PST)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 15 Nov 2018 02:32:12 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Thu, 15 Nov 2018 11:32:10 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] u-boot: Add mkenvimage tool
Thread-Index: AQHUfJfMRIkZm8eQ40qk/j2ZLDr4BaVQNYGAgAABmQCAAANFAIAARqsAgAAR74A=
Date: Thu, 15 Nov 2018 10:32:10 +0000
Message-ID: <104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
	<804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
	<20181115092758.GA1430@jama>
In-Reply-To: <20181115092758.GA1430@jama>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.121.8.88]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 10:32:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <37D91D8699E04946B0945F5E9F070476@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpPbiBUaHUsIDIwMTgtMTEtMTUgYXQgMTA6MjcgKzAxMDAsIE1hcnRpbiBK
YW5zYSB3cm90ZToNCj4gT24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDU6MTU6MDNBTSArMDAwMCwg
QWxleGV5IEJyb2RraW4gd3JvdGU6DQo+ID4gSGkgTWFyZWssDQoNCltzbmlwXQ0KDQo+ID4gPiBS
ZXZpZXdlZC1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4gPiANCj4gPiA+IFRo
YXQgc2FpZCwgY291bGQgdGhlIHJlY2lwZSBmb3IgbWtpbWFnZSBhbmQgbWtlbnZpbWFnZSBiZSBz
b21laG93DQo+ID4gPiBkZWR1cGxpY2F0ZWQgPyBUaGVyZSBzZWVtcyB0byBiZSBhIGxvdCBvZiBj
b21tb24gc3R1ZmYuDQo+ID4gDQo+ID4gSSdkIHNheSB3aHkgZG9uJ3Qgd2UganVzdCBoYXZlIG9u
ZSByZWNpcGUgZm9yIGFsbCBVLUJvb3QgdG9vbHMNCj4gPiBpbnN0ZWFkIG9mIGFkZGluZyB0b29s
cyBvbmUtYnktb25lPw0KPiANCj4gT3IgYWRkOg0KPiAgICAgaW5zdGFsbCAtbSAwNzU1IHRvb2xz
L21rZW52aW1hZ2UgJHtEfSR7YmluZGlyfS91Ym9vdC1ta2VudmltYWdlDQo+ICAgICBsbiAtc2Yg
dWJvb3QtbWtlbnZpbWFnZSAke0R9JHtiaW5kaXJ9L21rZW52aW1hZ2UNCj4gDQo+IHRvIGV4aXN0
aW5nIHUtYm9vdC1ta2ltYWdlIHJlY2lwZSwgdGhhdCdzIHdoYXQgSSdtIGRvaW5nIGluDQo+IHUt
Ym9vdC1ta2ltYWdlIGJiYXBwZW5kLg0KDQpTdXJlIGFuZCBpbmRlZWQgdGhhdCB3YXMgbXkgaW5p
dGlhbCBpbnRlbnRpb24gYnV0IHRoZW4gSSBub3RpY2VkDQp0aGVyZSdyZSBzZXBhcmF0ZSByZWNp
cGVzIGZvciBta2ltYWdlIGFuZCBmdy11dGlscyBhbmQgZGVjaWRlZA0KdG8gYWN0IHNpbWlsYXJs
eS4NCg0KSWYgT0UgcGVvcGxlIGlzIGZpbmUgd2l0aCBhZGRpdGlvbiBvZiBhbm90aGVyIChwcmV0
dHkgc2ltaWxhciBpZGVvbG9naWNhbGx5KQ0KdXRpbGl0eSBpbiB1LWJvb3QtbWtpbWFnZV94eC5i
YiB0aGVuIEknbSBoYXBweSB0byBpbXBsZW1lbnQgaXQgdGhhdCB3YXkuDQoNCi1BbGV4ZXkNCg==

