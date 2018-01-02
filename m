Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9F72771951
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 08:45:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33807922"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2018 16:45:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 81B8348AEA0A;
	Tue,  2 Jan 2018 16:45:39 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([169.254.1.181]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Tue, 2 Jan 2018 16:45:42 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [rocko] [PATCH] glibc:CVE-2017-17426
Thread-Index: AQHTf5txUfc0u7cVdkq2KiebMZEA8qNayFeAgAWC4iA=
Date: Tue, 2 Jan 2018 08:45:37 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C63B5900CE@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1514438375-4227-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<19404760-e3b8-aaf5-3ff8-4d22398cb4e4@gmail.com>
In-Reply-To: <19404760-e3b8-aaf5-3ff8-4d22398cb4e4@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.125]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 81B8348AEA0A.AAD02
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [rocko] [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Tue, 02 Jan 2018 08:45:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBmaXhlcyBpbiByb2Nrby4NCg0KaHVhbmdxeQ0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFrdXN0ZXI4MDgg
W21haWx0bzpha3VzdGVyODA4QGdtYWlsLmNvbV0NCj4gU2VudDogU2F0dXJk
YXksIERlY2VtYmVyIDMwLCAyMDE3IDEyOjMwIFBNDQo+IFRvOiBIdWFuZywg
UWl5dSA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3UuY29tPjsNCj4gb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtyb2Nrb10gW1BBVENIXSBnbGliYzpDVkUtMjAx
Ny0xNzQyNg0KPiANCj4gDQo+IA0KPiBPbiAxMi8yNy8yMDE3IDA5OjE5IFBN
LCBIdWFuZyBRaXl1IHdyb3RlOg0KPiA+IEZpeCB0aGUgQ1ZFLTIwMTctMTc0
MjYuDQo+IA0KPiBJcyB0aGlzIGZpeCBpbiBtYXN0ZXI/DQo+IA0KPiAtIGFy
bWluDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBRaXl1IDxodWFu
Z3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi1v
dmVyZmxvdy1pbi1tYWxsb2Mtd2hlbi10Y2FjaGUtaXMtZW5hYmxlLnBhdGNo
IHwgNDkNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliYy9nbGliY18yLjI2LmJiICAgICAgICAgICAgICB8
ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWJjL2dsaWJjLzAwMjktRml4LWludGVnZXItb3ZlcmZsb3ctaW4t
bWFsbG9jLXdoZW4NCj4gPiAtdGNhY2hlLWlzLWVuYWJsZS5wYXRjaA0KPiA+
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
YmMvZ2xpYmMvMDAyOS1GaXgtaW50ZWdlci1vdmVyZmxvdy1pbi1tYWxsb2Mt
d2gNCj4gPiBlbi10Y2FjaGUtaXMtZW5hYmxlLnBhdGNoDQo+ID4gYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy8wMDI5LUZpeC1pbnRlZ2VyLW92
ZXJmbG93LWluLW1hbGxvYy13aA0KPiA+IGVuLXRjYWNoZS1pcy1lbmFibGUu
cGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAuLmZiNTJiZTUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvMDAyOS1GaXgtaW50ZWdl
ci1vdmVyZmxvdy1pbi1tYWxsbw0KPiA+ICsrKyBjLXdoZW4tdGNhY2hlLWlz
LWVuYWJsZS5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsNDkgQEANCj4gPiArRnJv
bSAzNDY5NzY5NGU4YTkzYjMyNWIxOGYyNWY3ZGNkZWQ1NWQ2YmFlYWY2IE1v
biBTZXAgMTcgMDA6MDA6MDANCj4gPiArMjAwMQ0KPiA+ICtGcm9tOiBBcmp1
biBTaGFua2FyIDxhcmp1bkByZWRoYXQuY29tPg0KPiA+ICtEYXRlOiBUaHUs
IDMwIE5vdiAyMDE3IDEzOjMxOjQ1ICswMTAwDQo+ID4gK1N1YmplY3Q6IFtQ
QVRDSF0gRml4IGludGVnZXIgb3ZlcmZsb3cgaW4gbWFsbG9jIHdoZW4gdGNh
Y2hlIGlzDQo+ID4gK2VuYWJsZWQgW0JaICAjMjIzNzVdDQo+ID4gKw0KPiA+
ICtXaGVuIHRoZSBwZXItdGhyZWFkIGNhY2hlIGlzIGVuYWJsZWQsIF9fbGli
Y19tYWxsb2MgdXNlcyByZXF1ZXN0MnNpemUNCj4gPiArKHdoaWNoIGRvZXMg
bm90IHBlcmZvcm0gYW4gb3ZlcmZsb3cgY2hlY2spIHRvIGNhbGN1bGF0ZSB0
aGUgY2h1bmsNCj4gPiArc2l6ZSBmcm9tIHRoZSByZXF1ZXN0ZWQgYWxsb2Nh
dGlvbiBzaXplLiBUaGlzIGxlYWRzIHRvIGFuIGludGVnZXINCj4gPiArb3Zl
cmZsb3cgY2F1c2luZyBtYWxsb2MgdG8gaW5jb3JyZWN0bHkgcmV0dXJuIHRo
ZSBsYXN0IHN1Y2Nlc3NmdWxseQ0KPiA+ICthbGxvY2F0ZWQgYmxvY2sgd2hl
biBjYWxsZWQgd2l0aCBhIHZlcnkgbGFyZ2Ugc2l6ZSBhcmd1bWVudCAoY2xv
c2UgdG8NCj4gU0laRV9NQVgpLg0KPiA+ICsNCj4gPiArVGhpcyBjb21taXQg
dXNlcyBjaGVja2VkX3JlcXVlc3Qyc2l6ZSBpbnN0ZWFkLCByZW1vdmluZyB0
aGUgb3ZlcmZsb3cuDQo+ID4gKy0tLQ0KPiA+ICsgQ2hhbmdlTG9nICAgICAg
IHwgNiArKysrKysNCj4gPiArIG1hbGxvYy9tYWxsb2MuYyB8IDMgKystDQo+
ID4gKyAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBhL0NoYW5nZUxvZyBi
L0NoYW5nZUxvZw0KPiA+ICtpbmRleCBiNTVlZDIyLi44ODhmOWZiIDEwMDY0
NA0KPiA+ICstLS0gYS9DaGFuZ2VMb2cNCj4gPiArKysrIGIvQ2hhbmdlTG9n
DQo+ID4gK0BAIC0xLDMgKzEsOSBAQA0KPiA+ICsrMjAxNy0xMS0zMCAgQXJq
dW4gU2hhbmthciAgPGFyanVuQHJlZGhhdC5jb20+DQo+ID4gKysNCj4gPiAr
KwlbQlogIzIyMzc1XQ0KPiA+ICsrCSogbWFsbG9jL21hbGxvYy5jIChfX2xp
YmNfbWFsbG9jKTogVXNlIGNoZWNrZWRfcmVxdWVzdDJzaXplDQo+ID4gKysJ
aW5zdGVhZCBvZiByZXF1ZXN0MnNpemUuDQo+ID4gKysNCj4gPiArIDIwMTct
MDgtMDIgIFNpZGRoZXNoIFBveWFyZWthciAgPHNpZGRoZXNoQHNvdXJjZXdh
cmUub3JnPg0KPiA+ICsNCj4gPiArIAkqIHN5c2RlcHMvc3BhcmMvc3BhcmMz
Mi9zcGFyY3Y5L2ZwdS9tdWx0aWFyY2gvc19sbHJpbnQuUw0KPiA+ICtkaWZm
IC0tZ2l0IGEvbWFsbG9jL21hbGxvYy5jIGIvbWFsbG9jL21hbGxvYy5jIGlu
ZGV4IDc5ZjBlOWUuLjBjOWUwNzQNCj4gPiArMTAwNjQ0DQo+ID4gKy0tLSBh
L21hbGxvYy9tYWxsb2MuYw0KPiA+ICsrKysgYi9tYWxsb2MvbWFsbG9jLmMN
Cj4gPiArQEAgLTMwNTAsNyArMzA1MCw4IEBAIF9fbGliY19tYWxsb2MgKHNp
emVfdCBieXRlcykNCj4gPiArICAgICByZXR1cm4gKCpob29rKShieXRlcywg
UkVUVVJOX0FERFJFU1MgKDApKTsgICNpZiBVU0VfVENBQ0hFDQo+ID4gKyAg
IC8qIGludF9mcmVlIGFsc28gY2FsbHMgcmVxdWVzdDJzaXplLCBiZSBjYXJl
ZnVsIHRvIG5vdCBwYWQgdHdpY2UuDQo+ID4gKyovDQo+ID4gKy0gIHNpemVf
dCB0Ynl0ZXMgPSByZXF1ZXN0MnNpemUgKGJ5dGVzKTsNCj4gPiArKyAgc2l6
ZV90IHRieXRlczsNCj4gPiArKyAgY2hlY2tlZF9yZXF1ZXN0MnNpemUgKGJ5
dGVzLCB0Ynl0ZXMpOw0KPiA+ICsgICBzaXplX3QgdGNfaWR4ID0gY3NpemUy
dGlkeCAodGJ5dGVzKTsNCj4gPiArDQo+ID4gKyAgIE1BWUJFX0lOSVRfVENB
Q0hFICgpOw0KPiA+ICstLQ0KPiA+ICsyLjcuNA0KPiA+ICsNCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yNi5i
Yg0KPiA+IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yNi5i
Yg0KPiA+IGluZGV4IDEzNWVjNGYuLmQzMTQzMTYgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yNi5iYg0KPiA+
ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMjYuYmIN
Cj4gPiBAQCAtNDMsNiArNDMsNyBAQCBTUkNfVVJJID0NCj4gIiR7R0xJQkNf
R0lUX1VSSX07YnJhbmNoPSR7U1JDQlJBTkNIfTtuYW1lPWdsaWJjIFwNCj4g
Pg0KPiBmaWxlOi8vMDAyNi1hc3NlcnQtU3VwcHJlc3MtcGVkYW50aWMtd2Fy
bmluZy1jYXVzZWQtYnktc3RhdGVtZW50LnBhdGNoIFwNCj4gPiAgICAgICAg
ICAgICBmaWxlOi8vMDAyNy1nbGliYy1yZXNldC1kbC1sb2FkLXdyaXRlLWxv
Y2stYWZ0ZXItZm9ya2luZy5wYXRjaCBcDQo+ID4gICAgICAgICAgICAgZmls
ZTovLzAwMjgtQnVnLTQ1NzgtYWRkLWxkLnNvLWxvY2std2hpbGUtZm9yay5w
YXRjaCBcDQo+ID4gKw0KPiA+ICsgZmlsZTovLzAwMjktRml4LWludGVnZXIt
b3ZlcmZsb3ctaW4tbWFsbG9jLXdoZW4tdGNhY2hlLWlzLWVuYWJsZS5wYXQN
Cj4gPiArIGNoXA0KPiA+ICAiDQo+ID4NCj4gPiAgTkFUSVZFU0RLRklYRVMg
Pz0gIiINCj4gDQo+IA0KDQoKCg==

