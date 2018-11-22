Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id D19C46C557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:47:42 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id A4DAE10C127C;
	Thu, 22 Nov 2018 01:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542880063; bh=sEPgWlH5eh5INYZIG/fEXq0/k20m/U/54A8GHnz4esk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Z0AyqsYJ7WjHgeLG00r5ikA4VIwHsy98hPPZUy31oTyKE6zfre1LgHMHIzq6xshyz
	+yxFI+IMNhxIm15c6ZhfKGOmWDEx7DDLFnmyMyumjEjCAjuw3SOqiic8WzQNCnwprh
	21Zzm27bQnqHT+X2kOCq0pKzAi1oCR5oTYfY7tTI6bDf2EvIQ+b7kX/FHgx3SoQe9i
	443eI68jVLbXS1dnUyqCr0YqQ67+QVxYvX/plovY/LPgZJrtTUpKlX06jTr5q4f6ef
	BCDQHmv4S+fMRBk59tFZZzx9ylIgyoWrkPR5wRAb0ONfzmuuLBAzMKn0T/qvMxYpL6
	nbUshdMOTCTZw==
Received: from US01WEHTC2.internal.synopsys.com
	(us01wehtc2.internal.synopsys.com [10.12.239.237])
	by mailhost.synopsys.com (Postfix) with ESMTP id 2A2B833AD;
	Thu, 22 Nov 2018 01:47:43 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 22 Nov 2018 01:47:38 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Thu, 22 Nov 2018 10:47:36 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v6] u-boot: Add mkenvimage tool
Thread-Index: AQHUgj1eLrXaGF/gpkCK9CM9q6YQN6VbdqIAgAAE6oA=
Date: Thu, 22 Nov 2018 09:47:36 +0000
Message-ID: <5c54f25000309545ee74be3bc5f3e1b73296f675.camel@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
	<CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
In-Reply-To: <CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
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
Subject: Re: [PATCH v6] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 22 Nov 2018 09:47:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AAF39DEF1B26F4E8DB752C9E9749700@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpPbiBUaHUsIDIwMTgtMTEtMjIgYXQgMDc6MzAgLTAyMDAsIE90YXZpbyBT
YWx2YWRvciB3cm90ZToNCj4gSGVsbG8gQWxleGV5LA0KPiANCj4gT24gVGh1LCBOb3YgMjIsIDIw
MTggYXQgNjoyOCBBTSBBbGV4ZXkgQnJvZGtpbg0KPiA8YWxleGV5LmJyb2RraW5Ac3lub3BzeXMu
Y29tPiB3cm90ZToNCj4gPiBUaGlzIHV0aWxpdHkgaXMgdXNlZCBmb3IgY3JlYXRpb24gb2YgaW1h
Z2VzIGNvbnRhaW5pbmcNCj4gPiB1c2FibGUgaW4gcnVuLXRpbWUgVS1Cb290IGVudmlyb25tZW50
Lg0KPiA+IA0KPiA+IEFzIG9mIHRvZGF5IHRoaXMgdXRpbGl0eSBpcyBhZGRlZCBwZXItYm9hcmQg
bGlrZSBoZXJlIFsxXQ0KPiA+IGZvciBJbnRlbCBFZGlzb24gYm9hcmQuDQo+ID4gDQo+ID4gWzFd
IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNB
X19naXQueW9jdG9wcm9qZWN0Lm9yZ19jZ2l0X2NnaXQuY2dpX21ldGEtMkRpbnRlbC0yRGVkaXNv
bl90cmVlX21ldGEtMkRpbnRlbC0yRGVkaXNvbi0yRGJzcF9yZWNpcGVzLTJEYnNwX3UtMkRib290
X3UtMkRib290LTJEdG9vbHMtNUYyMDE0LjA0LmJiJmQ9RHdJQ0FnJmM9RFBMNl9YXzZKa1hGeDdB
WFdxQjB0ZyZyPWxxZGVlU1NFZXMwR0ZERGw2NTZlVmlYTzdicmVTNTV5dFdraHBrNVI4MUkmbT0w
b1NqMDRiaVM4ZnNmRmpZSE5USWZLb3pTLVRVanNlVFRleXVLSEhjbGpBJnM9aHB3R0Vuclg1Z0Fy
WUpITHhZaE1aNHg2czNpclRaeUNNampuRmlwaXA3ayZlPQ0KPiA+IA0KPiA+IEdpdmVuIHRoZXJl
J3JlIHF1aXRlIHNvbWUgVS1Cb290IHRvb2xzIHRoYXQgd2UgbWF5IHdhbnQgdG8gYWRkIGxhdGVy
DQo+ID4gdGhpcyByZWNpcGUgbmFtZSBzd2l0Y2ggZnJvbSAidS1ib290LW1raW1hZ2UiIHRvIGdl
bmVyaWMgInUtYm9vdC10b29scyINCj4gPiBzdGlsbCBmb3IgY29tcGF0aWJpbGl0eSB3ZSBwcm92
aWRlICJ1LWJvb3QtbWtpbWFnZSIgd2l0aCBoZWxwDQo+ID4gb2YgUFJPVklERVMgYXMgd2VsbCBh
cyBwcm9wb3NlZCAidS1ib290LW1rZW52aW1hZ2UiLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFsZXhleSBCcm9ka2luIDxhYnJvZGtpbkBzeW5vcHN5cy5jb20+DQo+ID4gQ2M6IFJpY2hhcmQg
UHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+IENjOiBPdGF2
aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPg0KPiA+IENjOiBNYXJ0aW4gSmFu
c2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+DQo+ID4gQ2M6IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiAN
Cj4gQWNrZWQtYnk6IE90YXZpbyBTYWx2YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+DQo+
IA0KPiBJJ2QgbGlrZSB0byB0aGFuayB5b3UgdG8ga2VlcCB0aGUgcGFjZSB1bnRpbCBpdCB3YXMg
cmVhZHkuIEkga25vdyBpdA0KPiBtYXkgYmUgY2hhbGxlbmdpbmcgdG8gY29udHJpYnV0ZSB0byBu
ZXcgcHJvamVjdHMgYW5kIE9wZW5FbWJlZGRlZCBpcw0KPiBubyBkaWZmZXJlbnQuDQo+IA0KPiBZ
b3Ugd2VyZSB2ZXJ5IHdlbGNvbWluZyB0byBjb21tZW50cyBhbmQgY2hhbmdlIHJlcXVlc3RzIGFu
ZCBJIGJlbGlldmUNCj4gaXQgd2FzIGEgZ3JlYXQgdGhyZWFkIG9mIGNoYW5nZXMgd2hpY2ggbGVh
ZCB0byBhIGdvb2QgcGF0Y2guIEkgbG9vaw0KPiBmb3J3YXJkIHRvIHRoZSBuZXcgcGF0Y2hlcyB5
b3UnbGwgc3RhcnQgc3VibWl0dGluZyBmcm9tIG5vdyBvbiA6LSkNCg0KSSdkIGxpa2UgdG8gdGhh
bmsgeW91IGd1eXMgYXMgd2VsbCBmb3IgYmVpbmcgcGF0aWVudCBhbmQgcHJvdmlkaW5nDQptZWFu
aW5nZnVsIGNvbW1lbnRzIGZvciBteSBuYWl2ZSBhbmQgc29tZXRpbWUgc2lsbHkgY2hhbmdlcy4N
Cg0KQW5kIHN1cmUgdGhlcmUgd2lsbCBiZSBtb3JlIHBhdGNoZXMgYXMgbm93IHdlIHN0YXJ0IHVz
aW5nIE9FDQpmb3IgcXVpdGUgc29tZSBwcm9qZWN0cyBiYXNpY2FsbHkgdHJ5aW5nIHRvIGdldCBB
UkMgdXAgdG8gc3BlZWQNCmluIE9FIGFzIGdvb2QgYXMgcG9zc2libGUgYW5kIGdpdmVuIG91ciBh
cmNoaXRlY3R1cmUgZGlmZmVycyBhIGJpdA0KZnJvbSBvdGhlcnMgKGFzIGFueSBvdGhlciBhcmNo
KSB3ZSdyZSBub3Qgb25seSBhZGRpbmcgZmVhdHVyZXMgYnV0DQptb3JlIGZpeCBpc3N1ZXMgdGhh
dCB3ZXJlIG5vdCBzZWVuIGJlZm9yZSBkdWUgdG8gcHVyZSBsdWNrLi4uDQpsaWtlIHdlIHR5cGlj
YWxseSBoYXZlIDhrIE1NVSBwYWdlIGEgYml0IGV4b3RpYyBpbnQ2NF90IGFsaWdubWVudA0KYnkg
MzIgYml0cyBldGMgc28gdGhlcmUnbGwgYmUgbW9yZSBzdHVmZiBmcm9tIHVzIGluIHRoZSBmb3Jl
c2VlYWJsZQ0KZnV0dXJlIDopDQoNCi1BbGV4ZXkNCg==

