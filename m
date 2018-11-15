Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id BE8306C19A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:15:14 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 286AF24E09C8;
	Wed, 14 Nov 2018 21:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542258916; bh=qUt4eBHk6GUOIfQjtOjJ8ZCSDtdmv9fN92FgCStMA58=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gBBsdiatgwRysu/GkApOBye+Y0dS1EfsxOOb4bgwP99KlUlxTvFq72Jbx3aM+AePa
	P+rV8i3iRGjp4nA7v3HyTkraXmHh2WGkd1fB3uA+CN9955iT+1515ihnNHcrMZIYpl
	qxWD5T/qP53GLy8OfToElJbdGUl3/QYSEnWttzoYOIlYiBL87REf1qe+vu0ljK9J3S
	virFVM4J/vhtjOCrdCUM+ELhC/HqmTH0vWbEZAfhwj58F/mQMfQRLDprjGBRbmO2vO
	i2mzBtD5s+NUAFNfXBHSasXu566PqV9uNXdCwSnjHDw4M9nhfEwDWfXcmYRjmyijZS
	476fnP9IKBkDQ==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id 0B8DE5BB1;
	Wed, 14 Nov 2018 21:15:15 -0800 (PST)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 14 Nov 2018 21:15:07 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Thu, 15 Nov 2018 06:15:04 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "marex@denx.de" <marex@denx.de>
Thread-Topic: [PATCH] u-boot: Add mkenvimage tool
Thread-Index: AQHUfJfMRIkZm8eQ40qk/j2ZLDr4BaVQNYGAgAABmQCAAANFAA==
Date: Thu, 15 Nov 2018 05:15:03 +0000
Message-ID: <804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
In-Reply-To: <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
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
X-List-Received-Date: Thu, 15 Nov 2018 05:15:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C43D7915807524D99614CCE87091580@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgTWFyZWssDQoNCk9uIFRodSwgMjAxOC0xMS0xNSBhdCAwNjowMyArMDEwMCwgTWFyZWsgVmFz
dXQgd3JvdGU6DQo+IE9uIDExLzE1LzIwMTggMDU6NTcgQU0sIEtoZW0gUmFqIHdyb3RlOg0KPiA+
IE9uIFdlZCwgTm92IDE0LCAyMDE4IGF0IDg6MDAgUE0gQWxleGV5IEJyb2RraW4NCj4gPiA8YWxl
eGV5LmJyb2RraW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiA+IFRoaXMgdXRpbGl0eSBpcyB1
c2VkIGZvciBjcmVhdGlvbiBvZiBpbWFnZXMgY29udGFpbmluZw0KPiA+ID4gdXNhYmxlIGluIHJ1
bi10aW1lIFUtQm9vdCBlbnZpcm9ubWVudC4NCj4gPiA+IA0KPiA+ID4gQXMgb2YgdG9kYXkgdGhp
cyB1dGlsaXR5IGlzIGFkZGVkIHBlci1ib2FyZCBsaWtlIGhlcmUgWzFdDQo+ID4gPiBmb3IgSW50
ZWwgRWRpc29uIGJvYXJkLCBoZXJlIFsyXSBmb3IgQWx0ZXJhJ3MgU29DRlBHQSBhbmQNCj4gPiA+
IEkgbWF5IGd1ZXNzIHRoZXJlJ3JlIG90aGVycyBzbyBpbnN0ZWFkIG9mIGFkZGluZyBhbm90aGVy
IG9uZSBmb3INCj4gPiA+IEFSQyB3aHkgZG9uJ3Qgd2UgcGFja2FnZSBpdCBmb3IgZWFjaCBhbmQg
ZXZlcnlvbmUuDQo+ID4gPiANCj4gPiA+IFsxXSANCj4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5w
cm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNBX19naXQueW9jdG9wcm9qZWN0Lm9yZ19jZ2l0
X2NnaXQuY2dpX21ldGEtMkRpbnRlbC0yRGVkaXNvbl90cmVlX21ldGEtMkRpbnRlbC0yRGVkaXNv
bi0yRGJzcF9yZWNpcGVzLTJEYnNwX3UtMkRib290X3UtMkRib290LTJEdG9vbHMtNUYyMDE0LjA0
LmJiJmQ9RHdJQ2FRJmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPWxxZGVlU1NFZXMwR0ZERGw2
NTZlVmlYTzdicmVTNTV5dFdraHBrNVI4MUkmbT1jSzV1ckFBN1AyRVIxQXZLWmREM0NFTDVyMjNE
d2R0SjRJb2h5X1FDVVNRJnM9VnlWT0hxNUkzRnNPWHZPZjdTUWdWbHd0VGZLWDBiTjVabVBQZWhq
RC16dyZlPQ0KPiA+ID4gWzJdIA0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQu
Y29tL3YyL3VybD91PWh0dHBzLTNBX19naXRodWIuY29tX2tyYWpfbWV0YS0yRGFsdGVyYV9ibG9i
X21hc3Rlcl9yZWNpcGVzLTJEYnNwX3UtMkRib290X3UtMkRib290LTJEbWtlbnZpbWFnZS01RnYy
MDE2LjExLmJiJmQ9RHdJQ2FRJmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPWxxZGVlU1NFZXMw
R0ZERGw2NTZlVmlYTzdicmVTNTV5dFdraHBrNVI4MUkmbT1jSzV1ckFBN1AyRVIxQXZLWmREM0NF
TDVyMjNEd2R0SjRJb2h5X1FDVVNRJnM9VERQdHBtb2ZjdEd1UDRkZWpSR2xpMFNCVVJlUVFQb2lG
UXNXUEhzNHZWOCZlPQ0KPiA+IA0KPiA+IElmIHRoaXMgaXMgYXBwbGljYWJsZS93b3JrcyBmb3Ig
YWxsIHUtYm9vdCBiYXNlZCBtYWNoaW5lcyB0aGVuIEkgdGhpbmsgaXQgbWFrZXMNCj4gPiBzZW5z
ZSB0byBoYXZlIGl0IG9uIE9FLWNvcmUuDQo+IA0KPiBJdCBpcy4NCj4gDQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4ZXkgQnJvZGtpbiA8YWJyb2RraW5Ac3lub3BzeXMuY29tPg0KPiA+ID4gQ2M6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4YW5kZXIua2FuYXZpbkBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiBDYzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+ID4gPiBDYzogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4N
Cj4gPiA+IENjOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPg0KPiA+ID4gQ2M6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPg0KPiANCj4gVGhhdCBzYWlkLCBjb3VsZCB0aGUgcmVjaXBlIGZv
ciBta2ltYWdlIGFuZCBta2VudmltYWdlIGJlIHNvbWVob3cNCj4gZGVkdXBsaWNhdGVkID8gVGhl
cmUgc2VlbXMgdG8gYmUgYSBsb3Qgb2YgY29tbW9uIHN0dWZmLg0KDQpJJ2Qgc2F5IHdoeSBkb24n
dCB3ZSBqdXN0IGhhdmUgb25lIHJlY2lwZSBmb3IgYWxsIFUtQm9vdCB0b29scw0KaW5zdGVhZCBv
ZiBhZGRpbmcgdG9vbHMgb25lLWJ5LW9uZT8NCg0KLUFsZXhleQ0K

