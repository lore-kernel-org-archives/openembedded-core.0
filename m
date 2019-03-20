Return-Path: <alexey.brodkin@synopsys.com>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Mar 2019 12:12:38 UTC
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id ECF3E7CE66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:12:38 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
	[10.12.135.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 1AAEE10C1264;
	Wed, 20 Mar 2019 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1553083960; bh=7KacoQAGNBoprUwobdjocK1l0e4TgacYIiSDm4rG/PQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Tcn+667gI8MagzfjA9l4De+FeHOpoHJ6NGIhHmA1EOZwbbjI0bFiOkv7nzY8rRTYN
	BrZk7qtHpWz0A657spbc9h31/+uBAepzTnoLsXkWlnSIu8rnDhi6d3Ftqr00oEjp11
	b3Hho6DQWNQ7BhTnTa4EZUA/hFWC1PbrYZE2C3q5WOOKbPWMMJZi84/D7XvqWpkOL8
	nv9AVSFkCostyCVaynU7WTXXlhti58b/IZvqRr6B8sQZzfCIiXBkjecY+FpsSJuSIc
	bksggoDWL2m0b+571TMbO+4PrzI65GUnBQ4G+J90m96yRGzRN1tgvxasswGstDtxsf
	9WkbsFFr3gKDg==
Received: from US01WXQAHTC1.internal.synopsys.com
	(us01wxqahtc1.internal.synopsys.com [10.12.238.230])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mailhost.synopsys.com (Postfix) with ESMTPS id AF4E6A0095;
	Wed, 20 Mar 2019 12:12:39 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 20 Mar 2019 05:12:39 -0700
Received: from DE02WEMBXA.internal.synopsys.com ([fe80::a014:7216:77d:d55c])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000;
	Wed, 20 Mar 2019 13:12:37 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: qemu: backport patches to fix cves breaks qemu-system-native
Thread-Index: AdTe7+qwmvsUURxbRQOHAa7d7YdYyQAHL3MAAAIeTYD///BKAP//7sgw
Date: Wed, 20 Mar 2019 12:12:37 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE6468224CFD@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
	<861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
	<4881796E12491D4BB15146FE0209CE6468224CEA@de02wembxa.internal.synopsys.com>
	<bf8d76f02a71a362cbc1dd9faa68014ed68d9569.camel@linuxfoundation.org>
In-Reply-To: <bf8d76f02a71a362cbc1dd9faa68014ed68d9569.camel@linuxfoundation.org>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.89]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 12:12:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KW3NuaXBdDQoNCj4gPg0KPiA+ID4gV2UncmUgbm90IHNlZWluZyB0aGlz
IG9uIHRoZSBhdXRvYnVpbGRlciwgaXMgdGhpcyBnYXRlZCBieSBzb21lDQo+ID4gPiBub24tDQo+
ID4gPiBkZWZhdWx0IGNvbmZpZyBvcHRpb24/DQo+ID4NCj4gPiBNYXliZS4NCj4gPg0KPiA+IEJ1
dCBpZiB5b3UgZ3JlcCBieSBxZW11IHNvdXJjZXMgeW91IG1heSBub3RpY2UgdGhhdCBpbmRlZWQN
Cj4gPiBWRU5ET1JfRVJSX0lOVl9OVU1fU0dFIGlzIG5vdCBkZWZpbmVkIGFueXdoZXJlLiBTbyBy
ZWdhcmRsZXNzIG9mIG15DQo+ID4gc2V0dXANCj4gPiB0aGF0IGxvb2tzIGxpa2UgYSB2YWxpZCBh
bmQgZXhwZWN0ZWQgYnVpbGQgZmFpbHVyZS4NCj4gPg0KPiA+IEF0IGxlYXN0IHRoYXQgd2FzIHRo
ZSBjYXNlIGFmdGVyIEkgZmV0Y2hlZCBPRS1jb3JlIGNoYW5nZXMgdGhpcw0KPiA+IG1vcm5pbmcu
DQo+IA0KPiBJIGRvbid0IGRvdWJ0IGl0LCBJJ20ganVzdCB3b25kZXJpbmcgd2h5IG91ciB0ZXN0
aW5nIGRpZG4ndCBoaWdobGlnaHQNCj4gaXQuLi4NCg0KV2VsbCB0aGF0J3MgaW5kZWVkIHN0cmFu
Z2UgYXMgdGhpcyBpcyBob3N0IHBhY2thZ2UgYW5kIHNvIHNob3VsZG4ndCBoYXZlDQphbnl0aGlu
ZyB0YXJnZXQgYXJjaC1zcGVjaWZpYy4NCg0KQnV0IGRvIHlvdSBidWlsZCAicWVtdS1zeXN0ZW0t
bmF0aXZlIiBieSBhdXRvYnVpbGRlcj8NCkp1c3QgYSBndWVzcy4uLg0KDQotQWxleGV5DQo=

