Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id E8F5C6C5A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:19:01 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 870A424E1512;
	Thu, 22 Nov 2018 05:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542892743; bh=z8ALCVKvlFmA1myy54XDDT9u9NJLaylcR9DMXo7aiik=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EMJ+dDOGAtFdTk+WPukhonB3ZAxa9E+1MD21TEHYuiCCtqVO1qGA1IOgLVhjZOpbv
	wL+wAt9rKj1NCB/E3/zNZ9aos6pZjVccWXLElu7tIeR7ED4HxRVKqbico5ugbh5lzu
	YfDMe524ahU+UlLUmNPcOV7fPJGsR47XEks81y+hkmTBNjlad8kFpM8zbzYURud/sq
	NCxfbw2mGRShXo+1zmpd+B6tzDMfmMssfW/qTzTCgTS1ca//70z2YtOb0hYJMxnZUC
	5Ak6ftrDIDWsgKI2lJZd9sEDrAhNrpTFps1etKe1aSzv6lOWVgziI1a3LwgynD/B1N
	5Zf5f2s4QkQgQ==
Received: from US01WEHTC2.internal.synopsys.com
	(us01wehtc2.internal.synopsys.com [10.12.239.237])
	by mailhost.synopsys.com (Postfix) with ESMTP id DF3763095;
	Thu, 22 Nov 2018 05:19:01 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 22 Nov 2018 05:19:01 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Thu, 22 Nov 2018 14:18:58 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v6] u-boot: Add mkenvimage tool
Thread-Index: AQHUgj1eLrXaGF/gpkCK9CM9q6YQN6VbtpkA
Date: Thu, 22 Nov 2018 13:18:57 +0000
Message-ID: <dee5be3f45002c06f318bf633364aa842548cef8.camel@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
In-Reply-To: <20181122082807.39508-1-abrodkin@synopsys.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.121.8.88]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
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
X-List-Received-Date: Thu, 22 Nov 2018 13:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B664590CD091B4B8A8AF647AB909FE8@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGksIFJpY2hhcmQsIE90YXZpbywNCg0KT24gVGh1LCAyMDE4LTExLTIyIGF0IDExOjI4ICswMzAw
LCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToNCj4gVGhpcyB1dGlsaXR5IGlzIHVzZWQgZm9yIGNyZWF0
aW9uIG9mIGltYWdlcyBjb250YWluaW5nDQo+IHVzYWJsZSBpbiBydW4tdGltZSBVLUJvb3QgZW52
aXJvbm1lbnQuDQo+IA0KPiBBcyBvZiB0b2RheSB0aGlzIHV0aWxpdHkgaXMgYWRkZWQgcGVyLWJv
YXJkIGxpa2UgaGVyZSBbMV0NCj4gZm9yIEludGVsIEVkaXNvbiBib2FyZC4NCj4gDQo+IFsxXSBo
dHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLWludGVsLWVkaXNv
bi90cmVlL21ldGEtaW50ZWwtZWRpc29uLWJzcC9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRv
b2xzXzIwMTQuMDQuYmINCj4gDQo+IEdpdmVuIHRoZXJlJ3JlIHF1aXRlIHNvbWUgVS1Cb290IHRv
b2xzIHRoYXQgd2UgbWF5IHdhbnQgdG8gYWRkIGxhdGVyDQo+IHRoaXMgcmVjaXBlIG5hbWUgc3dp
dGNoIGZyb20gInUtYm9vdC1ta2ltYWdlIiB0byBnZW5lcmljICJ1LWJvb3QtdG9vbHMiDQo+IHN0
aWxsIGZvciBjb21wYXRpYmlsaXR5IHdlIHByb3ZpZGUgInUtYm9vdC1ta2ltYWdlIiB3aXRoIGhl
bHANCj4gb2YgUFJPVklERVMgYXMgd2VsbCBhcyBwcm9wb3NlZCAidS1ib290LW1rZW52aW1hZ2Ui
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5bm9wc3lz
LmNvbT4NCj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPg0KPiBDYzogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4N
Cj4gQ2M6IE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4NCj4gQ2M6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+DQo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhA
ZGVueC5kZT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIHY1IC0+IHY2Og0KPiAgKiBSZWFsbHkgZW5h
YmxlIHNlcGFyYXRlICBwYWthZ2luZyBvZiBta2ltYWdlIGFuZCBta2VudmltYWdlDQo+IA0KPiBD
aGFuZ2VzIHY0IC0+IHY1Og0KPiAgKiBBZGRlZCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGgg
InUtYm9vdC1ta2ltYWdlIiByZWNpcGUNCj4gICogSW1wcm92ZWQgaGFuZGxpbmcgb2YgbmF0aXZl
c2RrDQo+ICAqIFVwZGF0ZSBhbGwgcmVmZXJlbmNlcyBmcm9tICJ1LWJvb3QtbWtpbWFnZSIgdG8g
InUtYm9vdC10b29scyINCj4gDQo+IENoYW5nZXMgdjMgLT4gdjQ6DQo+ICAqIFVwZGF0ZWQgbWFp
bnRhaW5lciBpbmZvIHRvIG1ha2UgWW9jdG8gYXV0b2J1aWxkZXIgaGFwcHkgYWdhaW4NCj4gDQo+
IENoYW5nZXMgdjIgLT4gdjM6DQo+ICAqIFJlY2lwZSByZW5hbWVkIHRvICJ1LWJvb3QtdG9vbHMi
IHRvIGJldHRlciBtYXRjaCBpdHMgY29udGVudHMNCj4gICAgKGVzcGVjaWFsbHkgaW4gdGhlIGZ1
dHVyZSBhcyB3ZSBhZGQgbW9yZSB0b29scyB0aGVyZSkNCj4gICogRXhpc3RpbmcgInUtYm9vdC1t
a2ltYWdlIiBhbmQgbmV3bHkgaW50cm9kdWNlZCAidS1ib290LW1rZW52aW1hZ2UiDQo+ICAgIG1h
ZGUgYXZhaWFsYmxlIHZpYSBQUk9WSURFUw0KPiANCj4gQ2hhbmdlcyB2MSAtPiB2MjoNCj4gICog
R290IHJpZCBvZiBhIHNlcGFyYXRlIHJlY2lwZSBhbmQgaW5zdGVhZCBhZGRlZCBta2VudmltYWdl
DQo+ICAgIHRvIHUtYm9vdCBta2ltYWdlIHJlY2lwZQ0KDQpTbyBhcHBhcmVudGx5IHNvbWV0aGlu
ZyBpcyBzdGlsbCBicm9rZW4gOigNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCk5PVEU6IFJlc29sdmluZyBhbnkgbWlzc2luZyB0YXNr
IHF1ZXVlIGRlcGVuZGVuY2llcw0KRVJST1I6IE5vdGhpbmcgUlBST1ZJREVTICd1LWJvb3QtdG9v
bHMtbmF0aXZlLW1raW1hZ2UtbmF0aXZlJyAoYnV0IHZpcnR1YWw6bmF0aXZlOi4uLi9vcGVuZW1i
ZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtDQp0b29sc18yMDE4LjA3
LmJiIFJERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkNCg0KTk9URTogUnVudGlt
ZSB0YXJnZXQgJ3UtYm9vdC10b29scy1uYXRpdmUtbWtpbWFnZS1uYXRpdmUnIGlzIHVuYnVpbGRh
YmxlLCByZW1vdmluZy4uLg0KTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWlu
IHdhczogWyd1LWJvb3QtdG9vbHMtbmF0aXZlLW1raW1hZ2UtbmF0aXZlJ10NCg0KRVJST1I6IFJl
cXVpcmVkIGJ1aWxkIHRhcmdldCAnY29yZS1pbWFnZS1iYXNlJyBoYXMgbm8gYnVpbGRhYmxlIHBy
b3ZpZGVycy4NCk1pc3Npbmcgb3IgdW5idWlsZGFibGUgZGVwZW5kZW5jeSBjaGFpbiB3YXM6IFsn
Y29yZS1pbWFnZS1iYXNlJywgJ3ZpcnR1YWwva2VybmVsJywgJ3UtYm9vdC10b29scy1uYXRpdmUn
LCAndS1ib290LXRvb2xzLW5hdGl2ZS1ta2ltYWdlLW5hdGl2ZSddDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkluZGVlZCAidS1i
b290LXRvb2xzLW5hdGl2ZS1ta2ltYWdlLW5hdGl2ZSIgbG9va3MgcXVpdGUgb2RkLg0KDQpBbnkg
aGludHMgb24gaG93IHRoYXQgY291bGQgYmUgYWRkcmVzc2VkPw0KDQotQWxleGV5DQo=

