Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62C0578412
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:46:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35393558"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2018 10:46:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6026349F0F43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 10:46:23 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([169.254.1.181]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Wed, 17 Jan 2018 10:46:27 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [rocko] [PATCH] glibc:CVE-2017-17426
Thread-Index: AQHTf5txUfc0u7cVdkq2KiebMZEA8qN3e3FQ
Date: Wed, 17 Jan 2018 02:46:22 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C63B593986@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1514438375-4227-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1514438375-4227-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.130.24
dlp-reaction: no-action
x-originating-ip: [10.167.225.125]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6026349F0F43.A7B3E
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
X-List-Received-Date: Wed, 17 Jan 2018 02:46:26 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1IA0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMjgs
IDIwMTcgMToyMCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogSHVhbmcsIFFpeXUgPGh1YW5ncXku
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gU3ViamVjdDogW09FLWNvcmVdIFty
b2Nrb10gW1BBVENIXSBnbGliYzpDVkUtMjAxNy0xNzQyNg0KPiANCj4gRml4
IHRoZSBDVkUtMjAxNy0xNzQyNi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1
YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0t
DQo+ICAuLi4tb3ZlcmZsb3ctaW4tbWFsbG9jLXdoZW4tdGNhY2hlLWlzLWVu
YWJsZS5wYXRjaCB8IDQ5DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4g
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMjYuYmIgICAgICAg
ICAgICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYmMvZ2xpYmMvMDAyOS1GaXgtaW50ZWdlci1vdmVyZmxvdy1p
bi1tYWxsb2Mtd2hlbi10Y2FjaGUNCj4gLWlzLWVuYWJsZS5wYXRjaA0KPiAN
Cj4gZGlmZiAtLWdpdA0KPiBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjLzAwMjktRml4LWludGVnZXItb3ZlcmZsb3ctaW4tbWFsbG9jLXdoZW4t
dGNhYw0KPiBoZS1pcy1lbmFibGUucGF0Y2gNCj4gYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliYy9nbGliYy8wMDI5LUZpeC1pbnRlZ2VyLW92ZXJmbG93LWlu
LW1hbGxvYy13aGVuLXRjYWMNCj4gaGUtaXMtZW5hYmxlLnBhdGNoDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLmZiNTJiZTUN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliYy9nbGliYy8wMDI5LUZpeC1pbnRlZ2VyLW92ZXJmbG93LWluLW1hbGxv
Yy0NCj4gKysrIHdoZW4tdGNhY2hlLWlzLWVuYWJsZS5wYXRjaA0KPiBAQCAt
MCwwICsxLDQ5IEBADQo+ICtGcm9tIDM0Njk3Njk0ZThhOTNiMzI1YjE4ZjI1
ZjdkY2RlZDU1ZDZiYWVhZjYgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAx
DQo+ICtGcm9tOiBBcmp1biBTaGFua2FyIDxhcmp1bkByZWRoYXQuY29tPg0K
PiArRGF0ZTogVGh1LCAzMCBOb3YgMjAxNyAxMzozMTo0NSArMDEwMA0KPiAr
U3ViamVjdDogW1BBVENIXSBGaXggaW50ZWdlciBvdmVyZmxvdyBpbiBtYWxs
b2Mgd2hlbiB0Y2FjaGUgaXMgZW5hYmxlZA0KPiArW0JaICAjMjIzNzVdDQo+
ICsNCj4gK1doZW4gdGhlIHBlci10aHJlYWQgY2FjaGUgaXMgZW5hYmxlZCwg
X19saWJjX21hbGxvYyB1c2VzIHJlcXVlc3Qyc2l6ZQ0KPiArKHdoaWNoIGRv
ZXMgbm90IHBlcmZvcm0gYW4gb3ZlcmZsb3cgY2hlY2spIHRvIGNhbGN1bGF0
ZSB0aGUgY2h1bmsgc2l6ZQ0KPiArZnJvbSB0aGUgcmVxdWVzdGVkIGFsbG9j
YXRpb24gc2l6ZS4gVGhpcyBsZWFkcyB0byBhbiBpbnRlZ2VyIG92ZXJmbG93
DQo+ICtjYXVzaW5nIG1hbGxvYyB0byBpbmNvcnJlY3RseSByZXR1cm4gdGhl
IGxhc3Qgc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZA0KPiArYmxvY2sgd2hlbiBj
YWxsZWQgd2l0aCBhIHZlcnkgbGFyZ2Ugc2l6ZSBhcmd1bWVudCAoY2xvc2Ug
dG8gU0laRV9NQVgpLg0KPiArDQo+ICtUaGlzIGNvbW1pdCB1c2VzIGNoZWNr
ZWRfcmVxdWVzdDJzaXplIGluc3RlYWQsIHJlbW92aW5nIHRoZSBvdmVyZmxv
dy4NCj4gKy0tLQ0KPiArIENoYW5nZUxvZyAgICAgICB8IDYgKysrKysrDQo+
ICsgbWFsbG9jL21hbGxvYy5jIHwgMyArKy0NCj4gKyAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiArDQo+ICtk
aWZmIC0tZ2l0IGEvQ2hhbmdlTG9nIGIvQ2hhbmdlTG9nDQo+ICtpbmRleCBi
NTVlZDIyLi44ODhmOWZiIDEwMDY0NA0KPiArLS0tIGEvQ2hhbmdlTG9nDQo+
ICsrKysgYi9DaGFuZ2VMb2cNCj4gK0BAIC0xLDMgKzEsOSBAQA0KPiArKzIw
MTctMTEtMzAgIEFyanVuIFNoYW5rYXIgIDxhcmp1bkByZWRoYXQuY29tPg0K
PiArKw0KPiArKwlbQlogIzIyMzc1XQ0KPiArKwkqIG1hbGxvYy9tYWxsb2Mu
YyAoX19saWJjX21hbGxvYyk6IFVzZSBjaGVja2VkX3JlcXVlc3Qyc2l6ZQ0K
PiArKwlpbnN0ZWFkIG9mIHJlcXVlc3Qyc2l6ZS4NCj4gKysNCj4gKyAyMDE3
LTA4LTAyICBTaWRkaGVzaCBQb3lhcmVrYXIgIDxzaWRkaGVzaEBzb3VyY2V3
YXJlLm9yZz4NCj4gKw0KPiArIAkqIHN5c2RlcHMvc3BhcmMvc3BhcmMzMi9z
cGFyY3Y5L2ZwdS9tdWx0aWFyY2gvc19sbHJpbnQuUw0KPiArZGlmZiAtLWdp
dCBhL21hbGxvYy9tYWxsb2MuYyBiL21hbGxvYy9tYWxsb2MuYyBpbmRleCA3
OWYwZTllLi4wYzllMDc0DQo+ICsxMDA2NDQNCj4gKy0tLSBhL21hbGxvYy9t
YWxsb2MuYw0KPiArKysrIGIvbWFsbG9jL21hbGxvYy5jDQo+ICtAQCAtMzA1
MCw3ICszMDUwLDggQEAgX19saWJjX21hbGxvYyAoc2l6ZV90IGJ5dGVzKQ0K
PiArICAgICByZXR1cm4gKCpob29rKShieXRlcywgUkVUVVJOX0FERFJFU1Mg
KDApKTsgICNpZiBVU0VfVENBQ0hFDQo+ICsgICAvKiBpbnRfZnJlZSBhbHNv
IGNhbGxzIHJlcXVlc3Qyc2l6ZSwgYmUgY2FyZWZ1bCB0byBub3QgcGFkIHR3
aWNlLg0KPiArKi8NCj4gKy0gIHNpemVfdCB0Ynl0ZXMgPSByZXF1ZXN0MnNp
emUgKGJ5dGVzKTsNCj4gKysgIHNpemVfdCB0Ynl0ZXM7DQo+ICsrICBjaGVj
a2VkX3JlcXVlc3Qyc2l6ZSAoYnl0ZXMsIHRieXRlcyk7DQo+ICsgICBzaXpl
X3QgdGNfaWR4ID0gY3NpemUydGlkeCAodGJ5dGVzKTsNCj4gKw0KPiArICAg
TUFZQkVfSU5JVF9UQ0FDSEUgKCk7DQo+ICstLQ0KPiArMi43LjQNCj4gKw0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNf
Mi4yNi5iYg0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MjYuYmINCj4gaW5kZXggMTM1ZWM0Zi4uZDMxNDMxNiAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yNi5iYg0KPiAr
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjI2LmJiDQo+
IEBAIC00Myw2ICs0Myw3IEBAIFNSQ19VUkkgPQ0KPiAiJHtHTElCQ19HSVRf
VVJJfTticmFuY2g9JHtTUkNCUkFOQ0h9O25hbWU9Z2xpYmMgXA0KPiANCj4g
ZmlsZTovLzAwMjYtYXNzZXJ0LVN1cHByZXNzLXBlZGFudGljLXdhcm5pbmct
Y2F1c2VkLWJ5LXN0YXRlbWVudC5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZp
bGU6Ly8wMDI3LWdsaWJjLXJlc2V0LWRsLWxvYWQtd3JpdGUtbG9jay1hZnRl
ci1mb3JraW5nLnBhdGNoIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMjgt
QnVnLTQ1NzgtYWRkLWxkLnNvLWxvY2std2hpbGUtZm9yay5wYXRjaCBcDQo+
ICsNCj4gKyBmaWxlOi8vMDAyOS1GaXgtaW50ZWdlci1vdmVyZmxvdy1pbi1t
YWxsb2Mtd2hlbi10Y2FjaGUtaXMtZW5hYmxlLnBhdGNoDQo+ICsgXA0KPiAg
Ig0KPiANCj4gIE5BVElWRVNES0ZJWEVTID89ICIiDQo+IC0tDQo+IDIuNy40
DQoNCgoK

