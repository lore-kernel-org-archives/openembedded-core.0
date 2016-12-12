Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 080CA71A38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 06:55:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13822044"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2016 14:55:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DEA6247A8680
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 14:55:51 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Mon, 12 Dec 2016 14:55:55 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libpcap: Disable exposed bits of WinPCAP
	remote	capture support
Thread-Index: AQHSROyx5C/9E+a1DECygs7TMHi0naED/Nuw
Date: Mon, 12 Dec 2016 06:55:54 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE5ADEB5@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1479838559-24993-1-git-send-email-fabio.berton@ossystems.com.br>
In-Reply-To: <1479838559-24993-1-git-send-email-fabio.berton@ossystems.com.br>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: DEA6247A8680.A9DEB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] libpcap: Disable exposed bits of WinPCAP remote	capture support
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
X-List-Received-Date: Mon, 12 Dec 2016 06:55:58 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYWxsDQoNCkkgbWV0IHRoZSBzYW1lIGlzc3VlIHdoZW4gSSBidWlsZCB3
aXJlc2hhcmsgY29tZXMgZnJvbSBtZXRhLW9lLg0KV2h5IHRoaXMgcGF0Y2gg
aGFzbid0IGJlZW4gbWVyZ2VkIHlldD8NCg0KQmVzdCByZWdhcmRzDQpMZWkN
Cg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9w
ZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBGYWJpbyBCZXJ0b24N
Cj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMywgMjAxNiAyOjE2IEFN
DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0hdIGxpYnBjYXA6IERp
c2FibGUgZXhwb3NlZCBiaXRzIG9mIFdpblBDQVAgcmVtb3RlDQo+IGNhcHR1
cmUgc3VwcG9ydA0KPiANCj4gRGlzYWJsZSBiaXRzIG9mIHJlbW90ZSBjYXB0
dXJlIHN1cHBvcnQgaW5oZXJpdGVkIGZyb20gdGhlIFdpblBDQVAgbWVyZ2Ug
d2hpY2gNCj4gY2F1c2UgYXBwbGljYXRpb25zIHRvIGZhaWxzIHRvIGJ1aWxk
IGlmIHRoZXkgZGVmaW5lIEhBVkVfUkVNT1RFLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRmFiaW8gQmVydG9uIDxmYWJpby5iZXJ0b25Ab3NzeXN0ZW1zLmNv
bS5icj4NCj4gLS0tDQo+ICAuLi4vbGlicGNhcC9saWJwY2FwL2Rpc2FibGUt
cmVtb3RlLnBhdGNoICAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysr
KysrKysNCj4gIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9s
aWJwY2FwXzEuOC4xLmJiIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXAvZGlzYWJsZS0N
Cj4gcmVtb3RlLnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXAvZGlzYWJsZS1yZW1v
dGUucGF0Y2gNCj4gYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBj
YXAvbGlicGNhcC9kaXNhYmxlLXJlbW90ZS5wYXRjaA0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi43ZTFlZWE2DQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9s
aWJwY2FwL2xpYnBjYXAvZGlzYWJsZS1yZW1vdGUucGF0Y2gNCj4gQEAgLTAs
MCArMSwzNiBAQA0KPiArRGlzYWJsZSBiaXRzIG9mIHJlbW90ZSBjYXB0dXJl
IHN1cHBvcnQgaW5oZXJpdGVkIGZyb20gdGhlIFdpblBDQVAgbWVyZ2UNCj4g
K3doaWNoIGNhdXNlIGFwcGxpY2F0aW9ucyB0byBGVEJGUyBpZiB0aGV5IGRl
ZmluZSBIQVZFX1JFTU9URS4NCj4gKw0KPiArUGF0Y2ggZnJvbToNCj4gK2h0
dHBzOi8vYW5vbnNjbS5kZWJpYW4ub3JnL2NnaXQvdXNlcnMvcmZyYW5jb2lz
ZS9saWJwY2FwLmdpdC9jb21taXQvPw0KPiAraWQ9ZjM1OTQ5OTY5MjY5ZGZk
Y2MzNTQ5YjEyZmFkZTYwNDc1NWUxZTMyNg0KPiArDQo+ICtVcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcNCj4gKw0KPiArLS0tIGEvcGNhcC9wY2FwLmgNCj4g
KysrKyBiL3BjYXAvcGNhcC5oDQo+ICtAQCAtNTA2LDYgKzUwNiwxMSBAQA0K
PiArICAgI2RlZmluZSBNT0RFX1NUQVQgMQ0KPiArICAgI2RlZmluZSBNT0RF
X01PTiAyDQo+ICsNCj4gKysjaWZkZWYgSEFWRV9SRU1PVEUNCj4gKysgIC8q
IEluY2x1ZGVzIG1vc3Qgb2YgdGhlIHB1YmxpYyBzdHVmZiB0aGF0IGlzIG5l
ZWRlZCBmb3IgdGhlIHJlbW90ZQ0KPiArK2NhcHR1cmUgKi8NCj4gKysgICNp
bmNsdWRlIDxyZW1vdGUtZXh0Lmg+DQo+ICsrI2VuZGlmCSAvKiBIQVZFX1JF
TU9URSAqLw0KPiArKw0KPiArICNlbGlmIGRlZmluZWQoTVNET1MpDQo+ICsN
Cj4gKyAgIC8qDQo+ICtAQCAtNTI2LDExICs1MzEsNiBAQA0KPiArDQo+ICsg
I2VuZGlmIC8qIF9XSU4zMi9NU0RPUy9VTipYICovDQo+ICsNCj4gKy0jaWZk
ZWYgSEFWRV9SRU1PVEUNCj4gKy0gIC8qIEluY2x1ZGVzIG1vc3Qgb2YgdGhl
IHB1YmxpYyBzdHVmZiB0aGF0IGlzIG5lZWRlZCBmb3IgdGhlIHJlbW90ZQ0K
PiArY2FwdHVyZSAqLw0KPiArLSAgI2luY2x1ZGUgPHJlbW90ZS1leHQuaD4N
Cj4gKy0jZW5kaWYJIC8qIEhBVkVfUkVNT1RFICovDQo+ICstDQo+ICsgI2lm
ZGVmIF9fY3BsdXNwbHVzDQo+ICsgfQ0KPiArICNlbmRpZg0KPiArDQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAv
bGlicGNhcF8xLjguMS5iYiBiL21ldGEvcmVjaXBlcy0NCj4gY29ubmVjdGl2
aXR5L2xpYnBjYXAvbGlicGNhcF8xLjguMS5iYg0KPiBpbmRleCA5MDcyZmUw
Li44Y2UxOGU1IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjguMS5iYg0KPiArKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjguMS5i
Yg0KPiBAQCAtMiw2ICsyLDcgQEAgcmVxdWlyZSBsaWJwY2FwLmluYw0KPiAN
Cj4gIFNSQ19VUkkgKz0gIiBcDQo+ICAgICAgZmlsZTovL2xpYnBjYXAtcGtn
Y29uZmlnLXN1cHBvcnQucGF0Y2ggXA0KPiArICAgIGZpbGU6Ly9kaXNhYmxl
LXJlbW90ZS5wYXRjaCBcDQo+ICAiDQo+IA0KPiAgU1JDX1VSSVttZDVzdW1d
ID0gIjNkNDhmOWNkMTcxZmYxMmIwZWZkOTEzNGI1MmYxNDQ3Ig0KPiAtLQ0K
PiAyLjEuNA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KPiANCg0KCgo=

