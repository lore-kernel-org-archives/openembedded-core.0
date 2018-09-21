Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id C7E96798C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 13:07:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id CEF1424E2631;
	Fri, 21 Sep 2018 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537535281; bh=flBbK1TIHy2GfDyAXnXWtr+F/crdF/7mfMz6LhuO9lE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SoU/irUQA6ViKaD11rFcZmu/f2f7SCnlwrLCWfXiIVrOw/nwtFVcBEg+zc6TnPkb3
	FRpg8PixVjpMMxlcmwJEAAOHiy019vepu3KHBWwd1hgmZj723hXWNGeEYzG+IjarQA
	CsOm9tbj5BudC3AxEGR94QQVxfLJcamoDyK4+1IDR0cRO6dSBzc9y50nHhgLqMt4jQ
	sEmSJzrjih0REuqZzIXZmKO6L1aYKU6Fo5teZPFrwjE0cjkgR02CymuTMxOJI8E/07
	mc7FdlHB4HHnt8U3Z0BeIpNCFypVdT+diedXLAFn/tZWStJf+votYqBUXUjtPvaXFA
	m3WIqx/XbMZyw==
Received: from US01WXQAHTC1.internal.synopsys.com
	(us01wxqahtc1.internal.synopsys.com [10.12.238.230])
	by mailhost.synopsys.com (Postfix) with ESMTP id 98D5E38F9;
	Fri, 21 Sep 2018 06:08:00 -0700 (PDT)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 21 Sep 2018 06:07:59 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Fri, 21 Sep 2018 15:07:58 +0200
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
Thread-Index: AQHUUSKCBPi6VmWY6ESlUYO7ohwMQKT6bAiAgAANdYCAABZnAIAAAKIAgAAD5oA=
Date: Fri, 21 Sep 2018 13:07:57 +0000
Message-ID: <27a89d5d978dbe51cd05d7c68c067d46dcdde71e.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
	<CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
	<9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
	<bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
	<CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
In-Reply-To: <CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "wk@gnupg.org" <wk@gnupg.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
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
X-List-Received-Date: Fri, 21 Sep 2018 13:07:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFFDF939DB29354D9C4C1DA746A83E11@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gRnJpLCAyMDE4LTA5LTIxIGF0IDEzOjUzICswMTAwLCBCdXJ0b24sIFJv
c3Mgd3JvdGU6DQo+IENhbiB5b3UgY2hlY2sgdGhhdCB2MyB3b3JrcyB3aXRoIHg4Ni02NCB0YXJn
ZXRzPw0KPiANCj4gRVJST1I6IGxpYmdwZy1lcnJvci0xLjMyLXIwIGRvX2NvbXBpbGU6IEZ1bmN0
aW9uIGZhaWxlZDogZG9fY29tcGlsZQ0KPiAobG9nIGZpbGUgaXMgbG9jYXRlZCBhdA0KPiAvZGF0
YS9wb2t5LXRtcC9tYXN0ZXIvd29yay9jb3JlaTctNjQtcG9reS1saW51eC9saWJncGctZXJyb3Iv
MS4zMi1yMC90ZW1wL2xvZy5kb19jb21waWxlLjEzMzQ1KQ0KPiBFUlJPUjogTG9nZmlsZSBvZiBm
YWlsdXJlIHN0b3JlZCBpbjoNCj4gL2RhdGEvcG9reS10bXAvbWFzdGVyL3dvcmsvY29yZWk3LTY0
LXBva3ktbGludXgvbGliZ3BnLWVycm9yLzEuMzItcjAvdGVtcC9sb2cuZG9fY29tcGlsZS4xMzM0
NQ0KPiBMb2cgZGF0YSBmb2xsb3dzOg0KPiA+IERFQlVHOiBTSVRFIGZpbGVzIFsnZW5kaWFuLWxp
dHRsZScsICdjb21tb24tbGludXgnLCAnY29tbW9uLWdsaWJjJywNCj4gDQo+ICdiaXQtNjQnLCAn
eDg2XzY0LWxpbnV4JywgJ2NvbW1vbiddDQo+ID4gREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5j
dGlvbiBkb19jb21waWxlDQo+ID4gY3A6IGNhbm5vdCBzdGF0DQo+IA0KPiAnL2RhdGEvcG9reS10
bXAvbWFzdGVyL3dvcmsvY29yZWk3LTY0LXBva3ktbGludXgvbGliZ3BnLWVycm9yLzEuMzItcjAv
bGliZ3BnLWVycm9yLTEuMzIvc3JjL3N5c2NmZy9sb2NrLW9iai1wdWIueDg2XzY0LXBjLWxpbnV4
LWdudS5oJzoNCj4gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+IFdBUk5JTkc6IGV4aXQg
Y29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLg0KPiA+IEVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6
IGRvX2NvbXBpbGUgKGxvZyBmaWxlIGlzIGxvY2F0ZWQgYXQNCj4gDQo+IC9kYXRhL3Bva3ktdG1w
L21hc3Rlci93b3JrL2NvcmVpNy02NC1wb2t5LWxpbnV4L2xpYmdwZy1lcnJvci8xLjMyLXIwL3Rl
bXAvbG9nLmRvX2NvbXBpbGUuMTMzNDUpDQoNClllYWggdGhhdCdzIHByZXR0eSB1bmZvcnR1bmF0
ZSB0aGF0ICJzaW1wbGUgYWRkaXRpb24gb2YgQVJDIg0KYnJva2UgYW50aGVyIGFyY2ggOigNCg0K
V2hhdCBoYXBwZW5lZCBpcyBpbiB0aGUgc2FtZSBvbmUgY29tbWl0IHRoYXQgYWRkcyBBUkMgcXVp
dGUgYSBmZXcNCmhlYWRlcnMgZm9yIG90aGVyIGFyY2hlcyBnZXQgcmVuYW1lZCwgc2VlOg0KaHR0
cDovL2dpdC5nbnVwZy5vcmcvY2dpLWJpbi9naXR3ZWIuY2dpP3A9bGliZ3BnLWVycm9yLmdpdDth
PWNvbW1pdDtoPTQ4YzhmOGRkZmM4MDU1MWRiNzYxNWUxZWIzNTU1YzFkYzNmNmE2NTcNCg0KQW5k
ICJsb2NrLW9iai1wdWIueDg2XzY0LXBjLWxpbnV4LWdudS5oIiBpcyBvbmUgb2YgdGhlbS4NClNv
IEknbGwgdXBkYXRlIGxpYmdwZy1lcnJvcl8xLjMyLmJiIHdpdGg6DQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS4zMi5iYg0KKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjMyLmJiDQpAQCAtNDQsNyAr
NDQsNyBAQCBkb19jb21waWxlX3ByZXBlbmQoKSB7DQogICAgICAgICAgbWlwczY0KikgICAgVFVQ
TEU9bWlwczY0ZWwtdW5rbm93bi1saW51eC1nbnVhYmk2NCA7Ow0KICAgICAgICAgIG1pcHMqZWwp
ICAgIFRVUExFPW1pcHNlbC11bmtub3duLWxpbnV4LWdudSA7Ow0KICAgICAgICAgIG1pcHMqKSAg
ICAgIFRVUExFPW1pcHMtdW5rbm93bi1saW51eC1nbnUgOzsNCi0gICAgICAgICB4ODZfNjQpICAg
ICBUVVBMRT14ODZfNjQtcGMtbGludXgtZ251IDs7DQorICAgICAgICAgeDg2XzY0KSAgICAgVFVQ
TEU9eDg2XzY0LXVua25vd24tbGludXgtZ251IDs7DQogICAgICAgICAgKikgICAgICAgICAgVFVQ
TEU9JHtUQVJHRVRfQVJDSH0tdW5rbm93bi1saW51eC1nbnUgOzsNCiAgICAgICAgZXNhYw0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkNhcmUg
dG8gdHJ5IHRoYXQgY2hhbmdlIGluIHlvdXIgc2V0dXAgb25jZSB5b3UgaGF2ZSBldmV5dGhpbmcg
ZWxzZSBidWlsdCBmb3IgeDg2XzY0Pw0KDQotQWxleGV5DQo=

