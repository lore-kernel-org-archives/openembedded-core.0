Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 24D0379480
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:51:45 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 46E4B24E0B36;
	Fri, 21 Sep 2018 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537534307; bh=MMkwkjmifnIqbmH0Aaamaxu1oUYtbd9XSYQsNP3w2ok=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KBdVzz0q8eO5Upr62+I3EthAZImcAQluIGrA8adJfZJefo93qrEk1YvA1jOGvEf8p
	MLeoXV5OOI8UJh6oq2mcHW4uhHMJbzU3pk2I4rQ6ljTDsM9czLyyRJPMbgBMBfwf+3
	UHigwjNJctEQokYjuMNU8xo4dbh2Iwodwc546FpM/dRS40DnkEZv/Sel1RbByHDX20
	KkHkrOWk+FX/SdTdIM/SrzFMPzL8NiCplpvSzezsd6ift2oAmAfPkPoSyTDawXPpzg
	pSxN4f+O6H7MiUiptGdzhsdNF30X/GrzHX3CIgjlioXZZJB4h0T4SNJwuW1QN/K2dr
	VFqWOAyZHXcNA==
Received: from US01WEHTC2.internal.synopsys.com
	(us01wehtc2.internal.synopsys.com [10.12.239.237])
	by mailhost.synopsys.com (Postfix) with ESMTP id DD32433DF;
	Fri, 21 Sep 2018 05:51:46 -0700 (PDT)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 21 Sep 2018 05:51:46 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Fri, 21 Sep 2018 14:51:44 +0200
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
Thread-Index: AQHUUSKCBPi6VmWY6ESlUYO7ohwMQKT6bAiAgAANdYCAABZnAA==
Date: Fri, 21 Sep 2018 12:51:43 +0000
Message-ID: <bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
	<CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
	<9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
In-Reply-To: <9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Fri, 21 Sep 2018 12:51:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F99F8234708214CB354FB7DFCDF4E91@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gRnJpLCAyMDE4LTA5LTIxIGF0IDE0OjMxICswMzAwLCBBbGV4ZXkgQnJv
ZGtpbiB3cm90ZToNCj4gSGkgUm9zcywNCj4gDQo+IE9uIEZyaSwgMjAxOC0wOS0yMSBhdCAxMTo0
MyArMDEwMCwgQnVydG9uLCBSb3NzIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAgU2VwIDIwMTggYXQg
MjE6NDQsIEFsZXhleSBCcm9ka2luDQo+ID4gPEFsZXhleS5Ccm9ka2luQHN5bm9wc3lzLmNvbT4g
d3JvdGU6DQo+ID4gDQo+ID4gPiAgICAgICAgIGNhc2UgJHtUQVJHRVRfQVJDSH0gaW4NCj4gPiA+
ICAgICAgICAgICBhYXJjaDY0X2JlKSBUVVBMRT1hYXJjaDY0LXVua25vd24tbGludXgtZ251IDs7
DQo+ID4gPiArICAgICAgICAgYXJjKSAgICAgICAgVFVQTEU9aTY4Ni11bmtub3duLWxpbnV4LWdu
dSA7Ow0KPiA+ID4gICAgICAgICAgIGFybSkgICAgICAgIFRVUExFPWFybS11bmtub3duLWxpbnV4
LWdudWVhYmkgOzsNCj4gPiA+ICAgICAgICAgICBhcm1lYikgICAgICBUVVBMRT1hcm0tdW5rbm93
bi1saW51eC1nbnVlYWJpIDs7DQo+ID4gPiAgICAgICAgICAgaTU4NnxpNjg2KSAgVFVQTEU9aTY4
Ni1wYy1saW51eC1nbnUgOzsNCj4gPiANCj4gPiBJcyB0aGF0IHJpZ2h0PyAgSnVzdCBzYXlpbmcs
IGl0IGxvb2tzIHdyb25nLi4uDQo+IA0KPiBUaGF0J3MgaW5kZWVkIGEgaGFjayA6KQ0KPiANCj4g
bGliZ3BnLWVycm9yIFt1cHN0cmVhbV0gcGF0Y2ggbWVudGlvbmVkIGluIHRoaXMgY29tbWl0DQo+
IGFkZHMgc3VwcG9ydCBvZiBBUkMgYXJjaGl0ZWN0dXJlIGFzIGFuIGFsaWFzIHRvICJpNjg2LXVu
a25vd24tbGludXgtZ251Ig0KPiAodGhhdCdzIGJlY2F1c2UgaGVhZGVycyBhcmUgdGhlIHNhbWUp
Lg0KPiANCj4gQnV0IHNpbmNlIEkgcHJvdmlkZWQgZ2VuZXJhdGUgaGVhZGVycyBvbmx5IGZvciBh
cmMteHh4LWxpbnV4LXVjbGliYw0KPiAoYW5kIHRoZXJlJ3Mgbm8gZ3VhcmFudGVlIGdsaWJjIGhl
YWRlciBtYXRjaGVzIHVjbGliYykgV2VybmVyIG9ubHkNCj4gYWRkZWQgc3VwcG9ydCBmb3IgdUNs
aWJjLg0KPiANCj4gVGhhdCBzYWlkIGlmIHdlIHdlcmUgYnVpbGRpbmcgdUNsaWJjIHRvb2xjaGFp
biBpbiBPRSB0aGVuIG5vIG1hcHBpbmcNCj4gd291bGQgYmUgcmVxdWlyZWQgYXQgYWxsIGJ1dCBm
b3IgR2xpYmMgdG9vbGNoYWluIHdlIHN0aWxsIG5lZWQgdG8NCj4gdXNlIGV4cGxpY2l0IGhlYWRl
ciBmb3IgQVJDIGFuZCB0aGUgb25lIHRoYXQgbWF0Y2hlcyBvdXIgbmVlZHMgaXMNCj4gZXNzZW50
aWFsbHkgIm9jay1vYmotcHViLmk2ODYtdW5rbm93bi1saW51eC1nbnUuaCIsIHNlZQ0KPiBodHRw
czovL2xpc3RzLmd0Lm5ldC9nbnVwZy9kZXZlbC84NDYzNiM4NDYzNg0KDQpTbyB0aGlzIGlzIGZp
eGVkIG5vdyBpbiBsaWJncGctZXJyb3IgdXBzdHJlbWEsIHNlZQ0KaHR0cDovL2dpdC5nbnVwZy5v
cmcvY2dpLWJpbi9naXR3ZWIuY2dpP3A9bGliZ3BnLWVycm9yLmdpdDthPWNvbW1pdDtoPWY0ZjBk
YTc0ZjUyNmQ3ZTM1Y2VkYmMyZTkzNDU0ZGY2NDQwZGJmYTUNCg0KSSdsbCBzZW5kIHYzIHNvb25p
c2ggd2l0aCB0aGF0IHBhdGNoIGJhY2stcG9ydGVkLg0KDQotQWxleGV5DQo=

