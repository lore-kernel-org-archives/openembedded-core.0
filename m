Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 944B26C19A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:05:55 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 85D2124E031B;
	Wed, 14 Nov 2018 21:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542258356; bh=iEqruFKrChHVBb+u6jc0O/X5hGjvV7anPl/2khXzGXs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Pso06ZUgk3SMlxJhhVfHo++T3tVYXebli/Ku8djrx3krSLETBTQZmvarNZiKTY1uY
	jm3sF+oNEYivWXMYT4sVSAP8C/U5lfyfdmev03jxXUF8E2ul3YED4EqDXj3FytMSsj
	PK6Hl5+/d42VPzkfMYTjearS315jFO8lFbc9/My+Oen1zV5mBgDuqUipTIiqmABlQ1
	j5ss1VtD+Pf8ku4xCS3F1OBlCxgOLnPFxZM7+3nVTg4cYexCUZPB52aB7EzUbmKcyn
	g/K9x3cFmGgyuGUEEwP/CCcsckKPetQcWMPY7NJhd0+o7e4lPttkS4ZuU7JO5rcLb4
	cuN6Z3UqE21lw==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id 90548360D;
	Wed, 14 Nov 2018 21:05:55 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 14 Nov 2018 21:05:55 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Thu, 15 Nov 2018 06:05:53 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [PATCH] u-boot: Add mkenvimage tool
Thread-Index: AQHUfJfMRIkZm8eQ40qk/j2ZLDr4BaVQNYGAgAACTAA=
Date: Thu, 15 Nov 2018 05:05:52 +0000
Message-ID: <c060af96f5e55e4808e4cccde2bc8c7a3633ff8f.camel@synopsys.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
In-Reply-To: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Thu, 15 Nov 2018 05:05:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0517DEA673CB8C4C849617D99EB0F6EC@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KT24gV2VkLCAyMDE4LTExLTE0IGF0IDIwOjU3IC0wODAwLCBLaGVtIFJhaiB3
cm90ZToNCj4gT24gV2VkLCBOb3YgMTQsIDIwMTggYXQgODowMCBQTSBBbGV4ZXkgQnJvZGtpbg0K
PiA8YWxleGV5LmJyb2RraW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHV0aWxpdHkg
aXMgdXNlZCBmb3IgY3JlYXRpb24gb2YgaW1hZ2VzIGNvbnRhaW5pbmcNCj4gPiB1c2FibGUgaW4g
cnVuLXRpbWUgVS1Cb290IGVudmlyb25tZW50Lg0KPiA+IA0KPiA+IEFzIG9mIHRvZGF5IHRoaXMg
dXRpbGl0eSBpcyBhZGRlZCBwZXItYm9hcmQgbGlrZSBoZXJlIFsxXQ0KPiA+IGZvciBJbnRlbCBF
ZGlzb24gYm9hcmQsIGhlcmUgWzJdIGZvciBBbHRlcmEncyBTb0NGUEdBIGFuZA0KPiA+IEkgbWF5
IGd1ZXNzIHRoZXJlJ3JlIG90aGVycyBzbyBpbnN0ZWFkIG9mIGFkZGluZyBhbm90aGVyIG9uZSBm
b3INCj4gPiBBUkMgd2h5IGRvbid0IHdlIHBhY2thZ2UgaXQgZm9yIGVhY2ggYW5kIGV2ZXJ5b25l
Lg0KPiA+IA0KPiA+IFsxXSANCj4gPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cC0zQV9fZ2l0LnlvY3RvcHJvamVjdC5vcmdfY2dpdF9jZ2l0LmNnaV9tZXRh
LTJEaW50ZWwtMkRlZGlzb25fdHJlZV9tZXRhLTJEaW50ZWwtMkRlZGlzb24tMkRic3BfcmVjaXBl
cy0yRGJzcF91LTJEYm9vdF91LTJEYm9vdC0yRHRvb2xzLTVGMjAxNC4wNC5iYiZkPUR3SUJhUSZj
PURQTDZfWF82SmtYRng3QVhXcUIwdGcmcj1scWRlZVNTRWVzMEdGRERsNjU2ZVZpWE83YnJlUzU1
eXRXa2hwazVSODFJJm09VTBJNlAtMVAzdmZ0Nm1SNHNvWjlZNnB0SnFZV2xvT29TMG9ndk8yUnp2
NCZzPVdFa25tSlQ0VG5CeUNXTU16aDRELTJzRHJZdjVfa3gyVjFRazhTWXRKWTgmZT0NCj4gPiBb
Ml0gDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBz
LTNBX19naXRodWIuY29tX2tyYWpfbWV0YS0yRGFsdGVyYV9ibG9iX21hc3Rlcl9yZWNpcGVzLTJE
YnNwX3UtMkRib290X3UtMkRib290LTJEbWtlbnZpbWFnZS01RnYyMDE2LjExLmJiJmQ9RHdJQmFR
JmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPWxxZGVlU1NFZXMwR0ZERGw2NTZlVmlYTzdicmVT
NTV5dFdraHBrNVI4MUkmbT1VMEk2UC0xUDN2ZnQ2bVI0c29aOVk2cHRKcVlXbG9Pb1Mwb2d2TzJS
enY0JnM9T2lYeTg4aEwzbzV6OUpOME84OEVVbzN0dHZ2Z0ZRbkMyTG5EY194aEd5WSZlPQ0KPiAN
Cj4gSWYgdGhpcyBpcyBhcHBsaWNhYmxlL3dvcmtzIGZvciBhbGwgdS1ib290IGJhc2VkIG1hY2hp
bmVzIHRoZW4gSSB0aGluayBpdCBtYWtlcw0KPiBzZW5zZSB0byBoYXZlIGl0IG9uIE9FLWNvcmUu
DQoNCldlbGwgIm1rZW52aW1hZ2UiIGlzIG9uZSBvZiBzdGFuZGFyZCBVLUJvb3QgdG9vbHMgc28g
aXQgaGFzIG5vdGhpbmcNCnNwZWNpZmljIGZvciBhbnkgYXJjaGl0ZWN0dXJlIG9yIGJvYXJkIHdo
YXRzb2V2ZXIuDQoNCkl0IGlzIG5vdCB1c2VkIHRoYXQgb2Z0ZW4gYXMgIm1raW1hZ2UiIHByb2Jh
Ymx5IGJlY2F1c2UgcGVvcGxlDQptb3N0bHkgZGVwZW5kcyBvbiBkZWZhdWx0IFUtQm9vdCBlbnYg
c2V0dGluZ3Mgd2hpY2ggYXJlIGNvbXBpbGVkLWluDQpVLUJvb3QgYmluYXJ5IHdpdGggaGVscCBv
ZiBDT05GSUdfRVhUUkFfRU5WX1NFVFRJTkdTPSIuLi4iDQpidXQgSU1ITyBpdCBpcyByYXRoZXIg
dXNlZnVsIGFzIHdlIG1heSBwcmVwYXJlIGZpbmUtdHVuZWQgZW52aXJvbm1lbnQNCnNldHVwcyBm
b3IgYSBwYXJ0aWN1bGFyIHVzZS1jYXNlIGZyb20gcHVyZSB0ZXh0LWJhc2VkIGlucHV0Lg0KDQot
QWxleGV5DQo=

