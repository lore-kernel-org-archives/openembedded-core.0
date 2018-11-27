Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id A79D36C4E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 20:49:06 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 3911524E0876;
	Tue, 27 Nov 2018 12:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1543351747; bh=wbKH2+ACEicfOkiBd/zwkDhCoiXRNxbtQnPbXqptJ6k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KSp9gN79xpmAL/mPZ7Huc96VUXXYNN58DHMmMHXjy05tUkUWEC4tPRFBy/TpT389H
	Os2i9+9EawnivyZpJD1RPV1Je04nCtlmEz2/RqICCf3OC8N59ESwYDEQ3FT1eeV79W
	URKCHlSftqIWOKxZEGoND8iu99AoRTz78370TUxqcb09shxhTO6awBIt5NWaeApitv
	AFpb7NdPglEiIEljp9hcvsKMiCesyT0xPijWZfOSo3SlRyiW2NUWBgF0pIxIXYOSXa
	Iew17TedKxuHEZ3duVMNHUz9vG7VZNl0f3XVCE5w1PXFEitz6qE/o69vQVgfMQrnsI
	dx5RVpPqmbphA==
Received: from US01WEHTC2.internal.synopsys.com
	(us01wehtc2.internal.synopsys.com [10.12.239.237])
	by mailhost.synopsys.com (Postfix) with ESMTP id 6AF6442C5;
	Tue, 27 Nov 2018 12:49:06 -0800 (PST)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 27 Nov 2018 12:49:06 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Tue, 27 Nov 2018 21:49:03 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] u-boot-tools: Improve build preparation
Thread-Index: AQHUhoU4nS6EJ7zyeEqbOHRe/iJ89KVj8ZGAgAAGMwCAAA+ugA==
Date: Tue, 27 Nov 2018 20:49:02 +0000
Message-ID: <33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
References: <20181127191255.39052-1-abrodkin@synopsys.com>
	<CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
	<CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
In-Reply-To: <CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>, "trini@konsulko.com" <trini@konsulko.com>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"alexey.brodkin@synopsys.com" <alexey.brodkin@synopsys.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Tue, 27 Nov 2018 20:49:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7B66C58045E584EBD9209AB36042075@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpPbiBUdWUsIDIwMTgtMTEtMjcgYXQgMTc6NTIgLTAyMDAsIE90YXZpbyBT
YWx2YWRvciB3cm90ZToNCj4gT24gVHVlLCBOb3YgMjcsIDIwMTggYXQgNTozMCBQTSBPdGF2aW8g
U2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPiB3cm90ZToNCj4gPiBPbiBUdWUsIE5v
diAyNywgMjAxOCBhdCA1OjEzIFBNIEFsZXhleSBCcm9ka2luDQo+ID4gPGFsZXhleS5icm9ka2lu
QHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+ID4gPiBFdmVuIHRob3VnaCB3ZSdyZSBub3QgZ29pbmcg
dG8gYnVpbGQgaGVyZSByZWFsIFUtQm9vdCBiaW5hcnkNCj4gPiA+IGl0IGlzIHN0aWxsIHJlcXVp
cmVkIHRvICJjb25maWd1cmUiIFUtQm9vdCB0byBnZXQgZ2V0IHRvIHRoZQ0KPiA+ID4gdG9vbHMg
YnVpbGRpbmcuDQo+ID4gPiANCj4gPiA+IFdlIHVzZWQgdG8gdXNlICJzYW5kYm94X2RlZmNvbmZp
ZyIgZm9yIHRoYXQgcHVycG9zZSBidXQNCj4gPiA+IHNpbmNlIFUtQm9vdCB2MjAxOC4xMSBpdCBz
dGFydGVkIHRvIGNhdXNlIHByb2JsZW1zIFsxXSBkdWUgdG8gWzJdLg0KPiA+ID4gDQo+ID4gPiBT
byB0byBoYXZlIGxlc3MgZGVwZW5kZW5jaWVzIGxldCdzIGNyZWF0ZSBzdXBlciBtaW5pbWFsaXN0
aWMNCj4gPiA+IGNvbmZpZ3VyYXRpb24gd2hpY2ggaXMgZ29vZCBlbm91Z2ggdG8gYWxsb3cgdXMg
dG8gcnVuICJtYWtlIHRvb2xzIi4NCj4gPiA+IA0KPiA+ID4gWzFdIA0KPiA+ID4gaHR0cHM6Ly91
cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2Vycm9ycy55b2N0b3By
b2plY3Qub3JnX0Vycm9yc19EZXRhaWxzXzIwMjE4NV8mZD1Ed0lCYVEmYz1EUEw2X1hfNkprWEZ4
N0FYV3FCMHRnJnI9bHFkZWVTU0VlczBHRkREbDY1NmVWaVhPN2JyZVM1NXl0V2tocGs1UjgxSSZt
PTZHQmtBR2d4czRJT2gwcko0am9qMzZYdWtiX21zRV90ZElJSlFYaDhHYmcmcz12dXZBTWZrTTlX
SUtIZWs3bXd1d1NqV0tLcFVjS0otekNjS3lwRWZ4Q3V3JmU9DQo+ID4gPiBbMl0gDQo+ID4gPiBo
dHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fZ2l0LmRl
bnguZGVfLTNGcC0zRHUtMkRib290LmdpdC0zQmEtM0Rjb21taXRkaWZmLTNCaC0zRGE0OTU4YTcx
MDE3ZmIxNDI1NDJmOTc3Yzg0M2M1ZmNlNzY5ZmM2ZWEmZD1Ed0lCYVEmYz1EUEw2X1hfNkprWEZ4
N0FYV3FCMHRnJnI9bHFkZWVTU0VlczBHRkREbDY1NmVWaVhPN2JyZVM1NXl0V2tocGs1UjgxSSZt
PTZHQmtBR2d4czRJT2gwcko0am9qMzZYdWtiX21zRV90ZElJSlFYaDhHYmcmcz1HTjRVNk9mX2hp
LVdfNUNFdTNSdlJVSVZFamdhTnduSzhDYXJrd0lseTRZJmU9DQo+ID4gPiANCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhleSBCcm9ka2luIDxhYnJvZGtpbkBzeW5vcHN5cy5jb20+DQo+ID4gDQo+
ID4gVG8gYWxsb3cgZXh0ZW5kZWQgdXNlLCB3ZSBuZWVkIHRvIGVuYWJsZSBDT05GSUdfRklUX1NJ
R05BVFVSRQ0KPiA+IG90aGVyd2lzZSB3ZSB3b24ndCBoYXZlIHRoZSBzdXBwb3J0Lg0KPiA+IA0K
PiA+IFNlZToNCj4gPiANCj4gPiAjIE1YU0ltYWdlIG5lZWRzIExpYlNTTA0KPiA+IGlmbmVxICgk
KENPTkZJR19NWDIzKSQoQ09ORklHX01YMjgpJChDT05GSUdfQVJNQURBXzM4WCkkKENPTkZJR19B
Uk1BREFfMzlYKSQoQ09ORklHX0ZJVF9TSUdOQVRVUkUpLCkNCj4gPiBIT1NUTE9BRExJQkVTX21r
aW1hZ2UgKz0gXA0KPiA+ICAgICAgICAgJChzaGVsbCBwa2ctY29uZmlnIC0tbGlicyBsaWJzc2wg
bGliY3J5cHRvIDI+IC9kZXYvbnVsbCB8fA0KPiA+IGVjaG8gIi1sc3NsIC1sY3J5cHRvIikNCj4g
PiANCj4gPiBJZiB5b3UgZG8gdGhhdCwgd2UgY2FuIGxpa2VseSByZWx5IG9uIHRoaXMgYW5kIGF2
b2lkIHNvbWUgZXh0cmEgdG9vbHMNCj4gPiBwYWNrYWdlcyAoZm9yIGV4YW1wbGUgb24gbWV0YS1m
cmVlc2NhbGUpLg0KPiANCj4gTG9va2luZyBhdCB0aGlzLCBJIGFtIHdvbmRlcmluZyBpZiBmb2xv
d2luZyB3b3VsZG4ndCBiZSBhIGdlbmVyaWMNCj4gc29sdXRpb24gY2FwYWJsZSBvZiB1cHN0cmVh
bWluZzoNCj4gDQo+IGRpZmYgLS1naXQgYS9jb25maWdzL25hdGl2ZXRvb2xzX2RlZmNvbmZpZyBi
L2NvbmZpZ3MvbmF0aXZldG9vbHNfZGVmY29uZmlnDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAuLmJlNjliZGY0M2ENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9j
b25maWdzL25hdGl2ZXRvb2xzX2RlZmNvbmZpZw0KPiBAQCAtMCwwICsxLDMgQEANCj4gK0NPTkZJ
R19TWVNfVEVYVF9CQVNFPTANCj4gK0NPTkZJR19GSVQ9eQ0KPiArQ09ORklHX0ZJVF9TSUdOQVRV
UkU9eQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQ0KPiBp
bmRleCAzYzA1MjFmNjU1Li5lOTE2ZDBjZWJiIDEwMDY0NA0KPiAtLS0gYS90b29scy9NYWtlZmls
ZQ0KPiArKysgYi90b29scy9NYWtlZmlsZQ0KPiBAQCAtMTI0LDcgKzEyNCw3IEBAIGZpdF9pbmZv
LW9ianMgICA6PSAkKGR1bXBpbWFnZS1ta2ltYWdlLW9ianMpIGZpdF9pbmZvLm8NCj4gIGZpdF9j
aGVja19zaWduLW9ianMgICA6PSAkKGR1bXBpbWFnZS1ta2ltYWdlLW9ianMpIGZpdF9jaGVja19z
aWduLm8NCj4gIGZpbGUyaW5jbHVkZS1vYmpzIDo9IGZpbGUyaW5jbHVkZS5vDQo+IA0KPiAtaWZu
ZXEgKCQoQ09ORklHX01YMjMpJChDT05GSUdfTVgyOCksKQ0KPiAraWZuZXEgKCQoQ09ORklHX01Y
MjMpJChDT05GSUdfTVgyOCkkKENPTkZJR19GSVRfU0lHTkFUVVJFKSwpDQo+ICAjIEFkZCBDT05G
SUdfTVhTIGludG8gaG9zdCBDRkxBR1MsIHNvIHdlIGNhbiBjaGVjayB3aGV0aGVyIG9yIG5vdCBy
ZWdpc3Rlcg0KPiAgIyB0aGUgbXhzaW1hZ2Ugc3VwcG9ydCB3aXRoaW4gdG9vbHMvbXhzaW1hZ2Uu
YyAuDQo+ICBIT1NUQ0ZMQUdTX214c2ltYWdlLm8gKz0gLURDT05GSUdfTVhTDQoNClNvIGRvIHlv
dSB0aGluayB0aGVyZSdzIGEgcm9vbSBmb3IgaW1wcm92ZW1lbnQgaW4gbXkgcGF0Y2ggZm9yIE9F
Pw0KT3IgYmVmb3JlIHdlIGdldCBhIG1pc3NpbmcgcGFydCBmb3IgdG9vbHMvTWFrZWZpbGUgdGhl
cmUncyBub3RoaW5nIG1vcmUNCnRvIGJlIGRvbmUgaW4gT0U/DQoNCi1BbGV4ZXkNCg==

