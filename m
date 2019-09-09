Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1A96B7E963
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 11:08:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,484,1559491200"; d="scan'208";a="75168704"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 19:08:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F01334CE03E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 19:08:16 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Mon, 9 Sep 2019 19:08:27 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] rpm: make rpm work in toolchain.
Thread-Index: AQHVZv17+2mi7TQ9WEel4heN/cUtPqcjLR+g
Date: Mon, 9 Sep 2019 11:08:27 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E17B@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: F01334CE03E8.AB4D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Mon, 09 Sep 2019 11:08:28 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpJJ2QgbGlrZSB0byBleHBsYWluIHRoZSBwYXRoICR7U0RL
VEFSR0VUU1lTUk9PVH0gaW4gdGhpcyBwYXRjaC4NCg0KQXMgeW91IHNlZSwg
JHtTREtUQVJHRVRTWVNST09UfSBmb3IgeDg2XzY0IGlzIC9vcHQvcG9reS8y
Ljcrc25hcHNob3Qvc3lzcm9vdHMvY29yZTItNjQtcG9reXNkay1saW51eC4N
Cg0KSSBtYWtlIGl0IGJlY2F1c2UgY29uZmlnIGZpbGUgaW4gaG9zdC1zeXNy
b290IGFzIC9vcHQvcG9reS8yLjcrc25hcHNob3Qvc3lzcm9vdHMveDg2XzY0
LXBva3lzZGstbGludXggIHdpbGwgYmUgY292ZXJlZCBieSBhbm90aGVyIEFS
Q0guDQpGb3IgZXhhbXBsZSwgZmlyc3QgaW5zdGFsbCBTREsgZm9yIHg4Nl82
NCwgYW5kIG5leHQgaW5zdGFsbCBTREsgZm9yIHg4NiwgYXMgaG9zdC1zeXNy
b290IGlzIHNhbWUsIHRoZSBzYW1lIGNvbmZpZyBmaWxlIHdpbGwgYmUgY292
ZXJlZC4gSW4gdGhhdCBjYXNlIGNvbmZpZyBzZXR0aW5ncyBmb3IgeDg2XzY0
IHdpbGwgYmUgaW5lZmZpY2FjeS4NCg0KVG8gcmVzb2x2ZSB0aGF0IHByb2Js
ZW0sIEkgcHV0IGNvbmZpZyBmaWxlIGluIHRhcmdldC1zeXNyb290IGxpa2Ug
L29wdC9wb2t5LzIuNytzbmFwc2hvdC9zeXNyb290cy9jb3JlMi02NC1wb2t5
LWxpbnV4LiBBcyBlYWNoIEFSQ0ggaGFzIGl0cyBvd24gdGFyZ2V0LXN5c3Jv
b3QsIGNvbmZpZyBmaWxlIHdpbGwgbm90IGJlIGNvdmVyZWQuDQoNCi0tDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29m
dHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56
aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIx
MDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5j
b20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBNb25kYXksIFNlcHRl
bWJlciAwOSwgMjAxOSA2OjU3IFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBaaGVuZywgUnVvcWlu
L9ajIMj0x9UgPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gU3Vi
amVjdDogW09FLWNvcmVdW1BBVENIXSBycG06IG1ha2UgcnBtIHdvcmsgaW4g
dG9vbGNoYWluLg0KPiANCj4gV2UgbmVlZCB0byBjb25maWd1cmUgcnBtIHRv
IHVzZSBwYWNrYWdlIGFyY2hpdGVjdHVyZSBmcm9tIHlvY3RvIGJ1aWxkIHN5
c3RlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhl
bmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTQuMi4xLmJiIHwgMTUgKysrKysr
KysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
cG0vcnBtXzQuMTQuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29s
cy9ycG0vcnBtXzQuMTQuMi4xLmJiDQo+IGluZGV4IDA2M2Y0MjY5YTUuLmFm
OGUxNDRmOTYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ycG0vcnBtXzQuMTQuMi4xLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0vcnBtXzQuMTQuMi4xLmJiDQo+IEBAIC0xMDIsNiArMTAy
LDkgQEAgZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtbmF0aXZlKCkgew0KPiAg
ICAgICAgICBkb25lDQo+ICB9DQo+IA0KPiArUkVBTF9NVUxUSU1BQ0hfVEFS
R0VUX1NZUyA9ICIke1RVTkVfUEtHQVJDSH0ke1RBUkdFVF9WRU5ET1J9LQ0K
PiAke1RBUkdFVF9PU30iDQo+ICtTREtUQVJHRVRTWVNST09UID0NCj4gIiR7
U0RLUEFUSH0vc3lzcm9vdHMvJHtSRUFMX01VTFRJTUFDSF9UQVJHRVRfU1lT
fSINCj4gKw0KPiAgZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtbmF0aXZlc2Rr
KCkgew0KPiAgICAgICAgICBmb3IgdG9vbCBpbiAke1dSQVBQRVJfVE9PTFN9
OyBkbw0KPiAgICAgICAgICAgICAgICAgIGNyZWF0ZV93cmFwcGVyICR7RH0k
dG9vbCBcIEBAIC0xMTIsNiArMTE1LDE2IEBADQo+IGRvX2luc3RhbGxfYXBw
ZW5kX2NsYXNzLW5hdGl2ZXNkaygpIHsNCj4gICAgICAgICAgZG9uZQ0KPiAN
Cj4gICAgICAgICAgcm0gLXJmICR7RH0vdmFyDQo+ICsgICAgICAgIGluc3Rh
bGwgLWQgJHtEfS8ke1NES1RBUkdFVFNZU1JPT1R9L2V0Yy9ycG0NCj4gKw0K
PiArICAgIGNhdCA+JHtEfS8ke1NES1RBUkdFVFNZU1JPT1R9L2V0Yy9ycG1y
YyA8PEVPRg0KPiArYXJjaF9jb21wYXQ6ICR7TUFDSElORV9BUkNIfTogJHtQ
QUNLQUdFX0FSQ0hTfSBFT0YNCj4gKyAgICAgICAgc2VkIC1pICdzLy1uYXRp
dmVzZGsvL2cnICR7RH0vJHtTREtUQVJHRVRTWVNST09UfS9ldGMvcnBtcmMN
Cj4gKyAgICAgICAgc2VkIC1pICdzLy0vXy8nICR7RH0vJHtTREtUQVJHRVRT
WVNST09UfS9ldGMvcnBtcmMNCj4gKyAgICBjYXQgPiR7RH0vJHtTREtUQVJH
RVRTWVNST09UfS9ldGMvcnBtL3BsYXRmb3JtIDw8RU9GDQo+ICske01BQ0hJ
TkVfQVJDSH0tcGMtbGludXggRU9GDQo+ICB9DQo+IA0KPiAgIyBScG0ncyBt
YWtlIGluc3RhbGwgY3JlYXRlcyB2YXIvdG1wIHdoaWNoIGNsYXNoZXMgd2l0
aCBiYXNlLWZpbGVzIHBhY2thZ2luZw0KPiBAQCAtMTMzLDYgKzE0Niw4IEBA
IEZJTEVTXyR7UE59ICs9ICIke2xpYmRpcn0vcnBtLXBsdWdpbnMvKi5zbyBc
DQo+IA0KPiAgRklMRVNfJHtQTn0tZGV2ICs9ICIke2xpYmRpcn0vcnBtLXBs
dWdpbnMvKi5sYSBcDQo+ICAgICAgICAgICAgICAgICAgICAgICINCj4gK0ZJ
TEVTXyR7UE59X2FwcGVuZF9jbGFzcy1uYXRpdmVzZGsgKz0gIiR7U0RLVEFS
R0VUU1lTUk9PVH0iDQo+ICsNCj4gDQo+ICBQQUNLQUdFUyArPSAicHl0aG9u
My1ycG0iDQo+ICBQUk9WSURFUyArPSAicHl0aG9uMy1ycG0iDQo+IC0tDQo+
IDIuMTcuMQ0KDQoKCg==

