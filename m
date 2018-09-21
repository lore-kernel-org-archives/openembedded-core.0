Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id A859D744AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:31:35 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id BBC6C10C1B11;
	Fri, 21 Sep 2018 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537529496; bh=ypydOUnHn+RNs35LoToiIuXngubKhTLB0GF6efFs1H0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=H2R6xZeMXto+hzgBBm8NXaOORnZDm/eEAbLN2xPgzQb/3hzp+oYhFI8h7KKVeWLLO
	VZW9tqjqJ7PCBo7+zQJLIzQKw9dpo0AiT+H7FoDTwRWGMSFbrxtsny3nuQzrPThSsg
	7DXQfiHg6SkiIBBPB+XDzSMuEeP6Lt1w0S2YAmV73NFlvTKXx40EPzpU1DHdTa4OfW
	wWat/JaOD7mSjRNc6tTp55ZoC3S9o4Z7GkSi2L0CmsMHYVjZTjq5ZWqGoswa5q2yX9
	YlQ3swO6lL49x3vrWlUvwtoVfmjJvnheRrSusqt/NVero3JKJVsAdZe4QBBuwmZxw6
	FUc2kLAOtuChw==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id A2EFF34CF;
	Fri, 21 Sep 2018 04:31:36 -0700 (PDT)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 21 Sep 2018 04:31:36 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Fri, 21 Sep 2018 13:31:34 +0200
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
Thread-Index: AQHUUSKCBPi6VmWY6ESlUYO7ohwMQKT6bAiAgAANdYA=
Date: Fri, 21 Sep 2018 11:31:32 +0000
Message-ID: <9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
	<CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
In-Reply-To: <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 11:31:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DD2D72726968640B0CF259347CAA9A1@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gRnJpLCAyMDE4LTA5LTIxIGF0IDExOjQzICswMTAwLCBCdXJ0b24sIFJv
c3Mgd3JvdGU6DQo+IE9uIFRodSwgMjAgU2VwIDIwMTggYXQgMjE6NDQsIEFsZXhleSBCcm9ka2lu
DQo+IDxBbGV4ZXkuQnJvZGtpbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiANCj4gPiAgICAgICAg
IGNhc2UgJHtUQVJHRVRfQVJDSH0gaW4NCj4gPiAgICAgICAgICAgYWFyY2g2NF9iZSkgVFVQTEU9
YWFyY2g2NC11bmtub3duLWxpbnV4LWdudSA7Ow0KPiA+ICsgICAgICAgICBhcmMpICAgICAgICBU
VVBMRT1pNjg2LXVua25vd24tbGludXgtZ251IDs7DQo+ID4gICAgICAgICAgIGFybSkgICAgICAg
IFRVUExFPWFybS11bmtub3duLWxpbnV4LWdudWVhYmkgOzsNCj4gPiAgICAgICAgICAgYXJtZWIp
ICAgICAgVFVQTEU9YXJtLXVua25vd24tbGludXgtZ251ZWFiaSA7Ow0KPiA+ICAgICAgICAgICBp
NTg2fGk2ODYpICBUVVBMRT1pNjg2LXBjLWxpbnV4LWdudSA7Ow0KPiANCj4gSXMgdGhhdCByaWdo
dD8gIEp1c3Qgc2F5aW5nLCBpdCBsb29rcyB3cm9uZy4uLg0KDQpUaGF0J3MgaW5kZWVkIGEgaGFj
ayA6KQ0KDQpsaWJncGctZXJyb3IgW3Vwc3RyZWFtXSBwYXRjaCBtZW50aW9uZWQgaW4gdGhpcyBj
b21taXQNCmFkZHMgc3VwcG9ydCBvZiBBUkMgYXJjaGl0ZWN0dXJlIGFzIGFuIGFsaWFzIHRvICJp
Njg2LXVua25vd24tbGludXgtZ251Ig0KKHRoYXQncyBiZWNhdXNlIGhlYWRlcnMgYXJlIHRoZSBz
YW1lKS4NCg0KQnV0IHNpbmNlIEkgcHJvdmlkZWQgZ2VuZXJhdGUgaGVhZGVycyBvbmx5IGZvciBh
cmMteHh4LWxpbnV4LXVjbGliYw0KKGFuZCB0aGVyZSdzIG5vIGd1YXJhbnRlZSBnbGliYyBoZWFk
ZXIgbWF0Y2hlcyB1Y2xpYmMpIFdlcm5lciBvbmx5DQphZGRlZCBzdXBwb3J0IGZvciB1Q2xpYmMu
DQoNClRoYXQgc2FpZCBpZiB3ZSB3ZXJlIGJ1aWxkaW5nIHVDbGliYyB0b29sY2hhaW4gaW4gT0Ug
dGhlbiBubyBtYXBwaW5nDQp3b3VsZCBiZSByZXF1aXJlZCBhdCBhbGwgYnV0IGZvciBHbGliYyB0
b29sY2hhaW4gd2Ugc3RpbGwgbmVlZCB0bw0KdXNlIGV4cGxpY2l0IGhlYWRlciBmb3IgQVJDIGFu
ZCB0aGUgb25lIHRoYXQgbWF0Y2hlcyBvdXIgbmVlZHMgaXMNCmVzc2VudGlhbGx5ICJvY2stb2Jq
LXB1Yi5pNjg2LXVua25vd24tbGludXgtZ251LmgiLCBzZWUNCmh0dHBzOi8vbGlzdHMuZ3QubmV0
L2dudXBnL2RldmVsLzg0NjM2Izg0NjM2DQoNCi1BbGV4ZXkNCg==

