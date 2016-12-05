Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 29D7F71A20
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 02:38:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13593328"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2016 10:38:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2398047AC8A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:38:53 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Mon, 5 Dec 2016 10:38:56 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] strace: 4.13 -> 4.14
Thread-Index: AQHSSr6pT0EyUyFLZUiqYTgl6cxm2qD4q+gw
Date: Mon, 5 Dec 2016 02:38:56 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6D68FE3@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1480507368-10692-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1480507368-10692-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2398047AC8A1.A73C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] strace: 4.13 -> 4.14
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
X-List-Received-Date: Mon, 05 Dec 2016 02:38:56 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1L7vGIOf50+4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3Zl
bWJlciAzMCwgMjAxNiA4OjAzIFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBIdWFuZywgUWl5dS+7
xiDn+dPuIDxodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IFN1Ympl
Y3Q6IFtPRS1jb3JlXSBbUEFUQ0hdIHN0cmFjZTogNC4xMyAtPiA0LjE0DQo+
IA0KPiBGcm9tOiBIdWFuZyBRaXl1IDxodWFuZ3F5LmZuc3RAY24uZnVqaXRz
dS5jb20+DQo+IA0KPiBVcGdyYWRlIHN0cmFjZSBmcm9tIDQuMTMgdG8gNC4x
NC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5ncXku
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3RyYWNlL3tzdHJhY2VfNC4xMy5iYiA9PiBzdHJhY2VfNC4x
NC5iYn0gfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pICByZW5hbWUNCj4gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N0cmFjZS97c3RyYWNlXzQuMTMuYmIgPT4gc3RyYWNlXzQu
MTQuYmJ9ICg5MSUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNC4xMy5iYg0KPiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzQuMTQuYmINCj4gc2ltaWxh
cml0eSBpbmRleCA5MSUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3N0cmFjZS9zdHJhY2VfNC4xMy5iYg0KPiByZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNC4xNC5iYg0KPiBp
bmRleCBjYWU3ZjIxLi40NTI5MjVjIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV80LjEzLmJiDQo+ICsrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzQuMTQuYmIN
Cj4gQEAgLTE1LDggKzE1LDggQEAgU1JDX1VSSSA9DQo+ICIke1NPVVJDRUZP
UkdFX01JUlJPUn0vc3RyYWNlL3N0cmFjZS0ke1BWfS50YXIueHogXA0KPiAg
ICAgICAgICAgICBmaWxlOi8vbWlwcy1TSUdFTVQucGF0Y2ggXA0KPiAgICAg
ICAgICAgICAiDQo+IA0KPiAtU1JDX1VSSVttZDVzdW1dID0gIjRiNzhjN2Zl
YmRkMjRjNzlkNTE0NzgyNGQxYTA4MGEzIg0KPiAtU1JDX1VSSVtzaGEyNTZz
dW1dID0NCj4gImQ0OGY3MzI1NzZjOTFlY2UzNmE1ODQzZDYzZjliZTA1NGM0
MGVmNTlmMWU0NzczOTg2MDQyNjM2ODYxNjI1ZDciDQo+ICtTUkNfVVJJW21k
NXN1bV0gPSAiMWUzOWI1Zjc1ODMyNTZkN2RjMjExNzBiOWRhNTI5YWUiDQo+
ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNWJlZDUxMTBiMjQzZGNlNjg2
NGJlZGJhMjY5NDQ2YzE4YzhjNjNmNTUzY2RkN2ZkNGY4MDhkODlhNzY0NzEy
ZiINCj4gDQo+ICBpbmhlcml0IGF1dG90b29scyBwdGVzdCBibHVldG9vdGgN
Cj4gDQo+IC0tDQo+IDIuNy40DQoNCgoK

