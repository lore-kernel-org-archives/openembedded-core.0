Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8A3731BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:27:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8166528"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2016 09:27:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1CDE9418A70F;
	Wed, 29 Jun 2016 09:27:26 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0279.002; Wed, 29 Jun 2016 09:27:25 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] question about security_flags.inc
Thread-Index: AdHQJVv3Cvb/r9U9QXK/9AE3ORL+gf//nMoA//ydK2A=
Date: Wed, 29 Jun 2016 01:27:24 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC01410245EE@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <30DC4EDFD798C94083F3E083754532CC0141022F89@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CAMKF1sri8r0Cv3rEqt6M+q2UvojuvmfNBWnCJ+da_RFkv3n7mA@mail.gmail.com>
In-Reply-To: <CAMKF1sri8r0Cv3rEqt6M+q2UvojuvmfNBWnCJ+da_RFkv3n7mA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.22]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1CDE9418A70F.A9F1F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: biannm@cn.fujitsu.com
X-Spam-Status: No
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: question about security_flags.inc
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
X-List-Received-Date: Wed, 29 Jun 2016 01:27:38 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbiBTdW4sIEp1biAyNiwgMjAxNiBhdCA4OjQxIFBNLCBCaWFuLCBOYWlt
ZW5nIDxiaWFubm1AY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+IEhpDQo+
ID4NCj4gPiBUaGUgc2V0dGluZ3MgYXMgZm9sbG93aW5nIGluDQo+ID4gbWV0
YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdzLmluYyB3ZXJl
IGFkZGVkIGluIDIwMTMsDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
PiAgIyBUaGVzZSAyIGhhdmUgdGV4dCByZWxjbyBlcnJvcnMgd2l0aCB0aGUg
cGllIG9wdGlvbnMgZW5hYmxlZA0KPiA+IFNFQ1VSSVRZX0NGTEFHU19wbi1s
dHAgPSAiJHtTRUNVUklUWV9OT19QSUVfQ0ZMQUdTfSINCj4gPiAgU0VDVVJJ
VFlfQ0ZMQUdTX3BuLXB1bHNlYXVkaW8gPSAiJHtTRUNVUklUWV9OT19QSUVf
Q0ZMQUdTfSINCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4g
V291bGQgeW91IHRlbGwgbWUgd2hldGhlciB0aGVzZSBlcnJvcnMgdGVsbCB1
cyB0aGVyZSBhcmUgc29tZSBidWdzIGluDQo+IExUUC9QdWxzZWF1ZGlvIG9y
IEdDQz8NCj4gDQo+IHRoaXMgaXMgbW9zdCBwcm9iYWJseSBhIGJ1ZyBpbiBw
YWNrYWdlIG5vdCBpbiBnY2MuDQo+IA0KPiA+IElmIHNvLCB3aHkgaGF2ZSBu
b3QgYmVlbiBmaXhlZCBhbHRob3VnaCB0aGV5IGhhdmUgYmVlbiB0aGVyZSAz
eWVhcnMuDQo+IA0KPiBpdCBwcm9iYWJseSBoYXMgYmVlbiwgbm8gb25lIG1p
Z2h0IGhhdmUgcmV0cmllZC4gRmVlbCBmcmVlIHRvIHJlbW92ZSB0aGVzZSBh
bmQNCj4gc2VlIGlmIHRoZXkgd29yayBvayBub3cuDQo+IA0KDQpUaGFua3Mg
Zm9yIHlvdXIgYW5zd2VyLCBJIHdpbGwgY2hlY2sgaXQuDQoNClRoYW5rcw0K
IEJpYW4NCg0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gIEJpYW4NCj4gPg0KPiA+
DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxp
bmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+IA0KDQoKCg==

