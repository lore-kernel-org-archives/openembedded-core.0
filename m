Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id A0CF06C10F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 19:47:23 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id BEC0910C080C;
	Mon, 19 Nov 2018 11:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542656844; bh=JEPvbDyb/FpdRW4u/pzo+Q7vwNwV72heoSOHqMYVyFs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jXSWN6uDXa7KE/gwZ3h3ugFwDpzG+VVMyuLAW3ApJ57VCMWSshuKTbiFozyPIPV45
	Nz9HzpXA4t6iCS+ouTO4Wy5Blzn3L3xhHCUGfi6EUcjF4RHoq/fTB2/LQBAwtPAo6b
	mv7gV9UeL4QwulXpmsopZeV2L86KgvM8pwqH+pAf4zmzWTq0QsoO8U6CRo3Im2IVUS
	BHrHkUbPosAopBnjVF/7OMN9eKkcCMXx9OQ3YO/F0UAu0ixOuab3djUGCQK9DkqPaE
	pdYoEv3XQnArG8+bVuW+Y40ibjUWv/AaXqCfFRrzWOY1nV0PI8x1gZcs+rOIjblnXp
	gFo2poR4hjv3Q==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id EF60A3B54;
	Mon, 19 Nov 2018 11:47:23 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 19 Nov 2018 11:47:23 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Mon, 19 Nov 2018 20:47:23 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "trini@konsulko.com" <trini@konsulko.com>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
Thread-Index: AQHUf+9Wm3A5W5AlCkCpLvFwL9IrOqVW/JmAgABpToCAAAPSgIAABwOA
Date: Mon, 19 Nov 2018 19:47:22 +0000
Message-ID: <8a464185ba05c61c37654fcbee0783b407318425.camel@synopsys.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
In-Reply-To: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 19 Nov 2018 19:47:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <78514A1461B8154FAED58DAC09D0383B@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLCBUb20sIGFsbCwNCg0KT24gTW9uLCAyMDE4LTExLTE5IGF0IDE3OjIyIC0wMjAw
LCBPdGF2aW8gU2FsdmFkb3Igd3JvdGU6DQo+IE9uIE1vbiwgTm92IDE5LCAyMDE4IGF0IDU6MDgg
UE0gVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4gd3JvdGU6DQo+ID4gT24gTW9uLCBOb3Yg
MTksIDIwMTggYXQgMDE6NTE6NDFQTSArMDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4gPiBP
biAxMS8xOS8yMDE4IDExOjA0IEFNLCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToNCj4gPiA+ID4gVGhp
cyB1dGlsaXR5IGlzIHVzZWQgZm9yIGNyZWF0aW9uIG9mIGltYWdlcyBjb250YWluaW5nDQo+ID4g
PiA+IHVzYWJsZSBpbiBydW4tdGltZSBVLUJvb3QgZW52aXJvbm1lbnQuDQo+ID4gPiA+IA0KPiA+
ID4gPiBBcyBvZiB0b2RheSB0aGlzIHV0aWxpdHkgaXMgYWRkZWQgcGVyLWJvYXJkIGxpa2UgaGVy
ZSBbMV0NCj4gPiA+ID4gZm9yIEludGVsIEVkaXNvbiBib2FyZC4NCj4gPiA+ID4gDQo+ID4gPiA+
IFsxXSANCj4gPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91
PWh0dHAtM0FfX2dpdC55b2N0b3Byb2plY3Qub3JnX2NnaXRfY2dpdC5jZ2lfbWV0YS0yRGludGVs
LTJEZWRpc29uX3RyZWVfbWV0YS0yRGludGVsLTJEZWRpc29uLTJEYnNwX3JlY2lwZXMtMkRic3Bf
dS0yRGJvb3RfdS0yRGJvb3QtMkR0b29scy01RjIwMTQuMDQuYmImZD1Ed0lCYVEmYz1EUEw2X1hf
NkprWEZ4N0FYV3FCMHRnJnI9bHFkZWVTU0VlczBHRkREbDY1NmVWaVhPN2JyZVM1NXl0V2tocGs1
UjgxSSZtPXNRbnJ1QV9Lb0dIX2FDX1l5Tl9sQ2RkWW1XQm1jT3BNVlh6WnRTd1NiV28mcz1wWG12
MGFOUEZTQ29qOEN3R3Z3Y1pqLTRiTl9TZGpvYjNZd0hZVHp4RGx3JmU9DQo+ID4gPiA+IA0KPiA+
ID4gPiBHaXZlbiB0aGVyZSdyZSBxdWl0ZSBzb21lIFUtQm9vdCB0b29scyB0aGF0IHdlIG1heSB3
YW50IHRvIGFkZCBsYXRlcg0KPiA+ID4gPiB0aGlzIHJlY2lwZSBuYW1lIHN3aXRjaCBmcm9tICJ1
LWJvb3QtbWtpbWFnZSIgdG8gZ2VuZXJpYyAidS1ib290LXRvb2xzIg0KPiA+ID4gPiBzdGlsbCBm
b3IgY29tcGF0aWJpbGl0eSB3ZSBwcm92aWRlICJ1LWJvb3QtbWtpbWFnZSIgd2l0aCBoZWxwDQo+
ID4gPiA+IG9mIFBST1ZJREVTIGFzIHdlbGwgYXMgcHJvcG9zZWQgInUtYm9vdC1ta2VudmltYWdl
Ii4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhleSBCcm9ka2luIDxhYnJv
ZGtpbkBzeW5vcHN5cy5jb20+DQo+ID4gPiA+IENjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPiA+ID4gQ2M6IE90YXZpbyBTYWx2YWRvciA8
b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+DQo+ID4gPiA+IENjOiBNYXJ0aW4gSmFuc2EgPG1hcnRp
bi5qYW5zYUBnbWFpbC5jb20+DQo+ID4gPiA+IENjOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
aW50ZWwuY29tPg0KPiA+ID4gPiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4g
PiANCj4gPiA+IERvIHdlIHdhbnQgdG8gZ2VuZXJhdGUgb25lIHBhY2thZ2UgcGVyIHRvb2wgb3Ig
bm90ID8NCj4gPiANCj4gPiBJIHRoaW5rIHNvLCB5ZXMuICBOb3QgYWxsIHBsYWNlcyB3aWxsIHdh
bnQgYWxsIHRvb2xzLg0KPiANCj4gQW5kIGEgYm9udXMgdG8gYWRkIGEgdS1ib290LXRvb2xzLW1l
dGEgd2hpY2ggcmRlcGVuZHMgb24gYWxsLiBZb3UgY2FuDQo+IGNvcHkgY29kZSB0byBkbyB0aGF0
IGZyb20gZ3N0cmVhbWVyLXBsdWdpbnMgcGFja2FnZXMuDQoNClRoYXQncyBob3cgd2Ugc3RhcnQg
ZnJvbSBzaW1wbGUgZW5oYW5jZW1lbnQgb25lLWxpbmVyIGFuZCBlbmQtdXANCndpdGggcmV3b3Jr
IG9mIGEgZGlmZmVyZW50IHNjYWxlIDopDQoNCkknbSBzdGlsbCByYW1waW5nLXVwIHdpdGggT0Ug
YnV0IGhvcGVmdWxseSB3aWxsIGJlIGFibGUgdG8NCmltcGxlbWVudCBwcm9wb3NlZCB0b29sLXBl
ci1wYWNrYWdlIGZlYXR1cmUgc29tZXRpbWUgc29vbi4NCg0KLUFsZXhleQ0K

