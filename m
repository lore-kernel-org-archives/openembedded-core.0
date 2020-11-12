Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.17020.1605149158083406059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 18:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; 
   d="scan'208";a="101259922"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Nov 2020 10:45:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 64C204CE4BBE;
	Thu, 12 Nov 2020 10:45:53 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 12 Nov 2020 10:45:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::549d:26ce:6b90:da77])
 by G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::549d:26ce:6b90:da77%14]) with
 mapi id 15.00.1497.006; Thu, 12 Nov 2020 10:45:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
Thread-Topic: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
Thread-Index: AQHWuBhE2wGeBp7H1Ei2qrutyg/uVqnDy3nA
Date: Thu, 12 Nov 2020 02:45:53 +0000
Message-ID: <bbdb2694c9f04c0481ca6b9c77a0cd11@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAAnfSTvGf5YJaXF=sPrf_3HH1EoxznD+2F-==jaPrJVUJ1xV4g@mail.gmail.com>
In-Reply-To: <CAAnfSTvGf5YJaXF=sPrf_3HH1EoxznD+2F-==jaPrJVUJ1xV4g@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 64C204CE4BBE.A803B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIHdlIHdpbGwgaW1wcm92ZSBpbiB0aGUgZnV0dXJlLCBidXQgd2UgZG9u4oCZdCBrbm93
IGhvdyB0byBkZXRlcm1pbmUgd2hpY2ggcmVjaXBlcyBuZWVkIHRvIGJlIHRlc3RlZCBkdXJpbmcg
dGhlIHVwZ3JhZGUuIElzIHRoZXJlIGFueSB3YXkgeW91IGNhbiBwcm92aWRlIHVzPw0KDQpaYW5n
IFJ1b2NoZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1
cnRvbiA8cm9zc0BidXJ0b25pbmkuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDEx
LCAyMDIwIDY6NDkgUE0NCj4gVG86IFphbmcsIFJ1b2NoZW4v6IenIOiLpeWwmCA8emFuZ3JjLmZu
c3RAY24uZnVqaXRzdS5jb20+DQo+IENjOiBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gaWN1
OiB1cGdyYWRlIDY3LjEgLT4gNjguMQ0KPiANCj4gUGxlYXNlIHJlbWVtYmVyIHRvIGJ1aWxkIG1v
cmUgdGhhbiBqdXN0IGEgc2luZ2xlIHJlY2lwZSB3aGVuIHRlc3RpbmcsIGluDQo+IHBhcnRpY3Vs
YXIgZGVwZW5kZW50cy4gIFRoaXMgdXBncmFkZSBicm9rZSBsaWJpY2FsIGFuZCB3ZWJraXRndGss
IHdoaWNoDQo+IHJlc3VsdGVkIGluIHRocmVlIGl0ZXJhdGlvbnMgdGhvdWdoIHRoZSBhdXRvYnVp
bGRlciBhbmQgbWUNCj4gZmluZGluZy9iYWNrcG9ydGluZyBmaXhlcyBhcyBhcHByb3ByaWF0ZS4N
Cj4gDQo+IFJvc3MNCj4gDQo+IE9uIE1vbiwgOSBOb3YgMjAyMCBhdCAwMzozOSwgemFuZ3JjIDx6
YW5ncmMuZm5zdEBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiAtTGljZW5zZS1VcGRh
dGU6VGhlIGFkZHJlc3MgY2hhbmdlcyBhcmUgYXMgZm9sbG93czoNCj4gPiAgICMgUHJvamVjdDog
aHR0cDovL2NvZGUuZ29vZ2xlLmNvbS9wL2xhby1kaWN0aW9uYXJ5Lw0KPiA+ICAgIyBEaWN0aW9u
YXJ5OiBodHRwOi8vbGFvLWRpY3Rpb25hcnkuZ29vZ2xlY29kZS5jb20vZ2l0L0xhby1EaWN0aW9u
YXJ5LnR4dA0KPiA+ICAgIyBMaWNlbnNlOg0KPiA+IGh0dHA6Ly9sYW8tZGljdGlvbmFyeS5nb29n
bGVjb2RlLmNvbS9naXQvTGFvLURpY3Rpb25hcnktTElDRU5TRS50eHQNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFphbmcgUnVvY2hlbiA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4g
LS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS97aWN1XzY3LjEuYmIgPT4gaWN1XzY4
LjEuYmJ9IHwgNiArKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkgIHJlbmFtZQ0KPiA+IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS97aWN1
XzY3LjEuYmIgPT4gaWN1XzY4LjEuYmJ9ICg5NSUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82Ny4xLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pY3UvaWN1XzY4LjEuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk1JQ0KPiA+IHJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNjcuMS5iYg0KPiA+IHJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzY4LjEuYmINCj4gPiBpbmRleCA5ZTgwOTFi
YTAxLi45OGFhNmI3YmU2IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3VfNjcuMS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNjgu
MS5iYg0KPiA+IEBAIC04Myw3ICs4Myw3IEBAIEZJTEVTX2xpYmljdWlvID0gIiR7bGliZGlyfS9s
aWJpY3Vpby5zby4qIg0KPiA+DQo+ID4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayINCj4gPg0KPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly8uLi9MSUNFTlNFO21k
NT1hMzgwOGE1YjcwMDcxYjA3Zjg3ZmYyMjA1ZTRkNzVhMCINCj4gPiArTElDX0ZJTEVTX0NIS1NV
TSA9DQo+ICJmaWxlOi8vLi4vTElDRU5TRTttZDU9MDAyZDJmZGMzMmQxN2YwZWMwNmU5YTQ3ZjJj
MGM4ZDAiDQo+ID4NCj4gPiAgZGVmIGljdV9kb3dubG9hZF92ZXJzaW9uKGQpOg0KPiA+ICAgICAg
cHZzcGxpdCA9IGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJykgQEAgLTExMiw4ICsxMTIsOCBAQCBT
UkNfVVJJID0NCj4gPiAiJHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcICBTUkNfVVJJX2FwcGVu
ZF9jbGFzcy10YXJnZXQgPSAiXA0KPiA+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURpc2FibGUt
TERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaCBcDQo+ID4gICAgICAgICAgICAiDQo+ID4gLVNS
Q19VUklbY29kZS5zaGEyNTZzdW1dID0NCj4gIjk0YTgwY2Q2ZjI1MWE1M2JkMmE5OTdmNmYxYjVh
YzY2NTNmZTc5MWRmYWI2NmUxZWIwMjI3NzQwZmI4NmQ1DQo+IGRjIg0KPiA+IC1TUkNfVVJJW2Rh
dGEuc2hhMjU2c3VtXSA9DQo+ICI3YzE2YTU5Y2M4YzA2MTI4YjdlY2MxZGM0ZmMwNTZiMzZiMTcz
NDkzMTI4MjliMTc0MDhiOWU2N2IwNWM0DQo+IGE3ZSINCj4gPiArU1JDX1VSSVtjb2RlLnNoYTI1
NnN1bV0gPQ0KPiAiYTlmMmUzZDhiNDQzNGI4ZTUzODc4YjQzMDhiZDFlNmVlNTFjOWM3MDQyZTJi
MWEzNzZhYmVmYjZmYmIyDQo+IDlmMmQiDQo+ID4gK1NSQ19VUklbZGF0YS5zaGEyNTZzdW1dID0N
Cj4gIjAzZWE4YjQ2OTQxNTU2MjA1NDhjOGMwYmEyMDQ0NGYxZTdkYjI0NmNjNzllM2I5YzRmYzdh
OTYwYjE2MGQNCj4gNTEwIg0KPiA+DQo+ID4gIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImljdTRj
LSg/UDxwdmVyPlxkKyhfXGQrKSspLXNyYyINCj4gPiAgVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHBzOi8vZ2l0aHViLmNvbS91bmljb2RlLW9yZy9pY3UvcmVsZWFzZXMiDQo+ID4gLS0NCj4gPiAy
LjI1LjENCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IA0KPiA+DQo+IA0KDQoKCg==
