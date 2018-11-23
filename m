Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C89B6C685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:54:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="48592763"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Nov 2018 15:54:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CF4814B73497
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:54:55 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0415.000; Fri, 23 Nov 2018 15:54:55 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [question] rpm: nss problem on arm32be
Thread-Index: AdSDAZR6UBJ+2KqlRcCnTVzw1bzdsQ==
Date: Fri, 23 Nov 2018 07:54:54 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1B9F4B3@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CF4814B73497.AB1CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [question] rpm: nss problem on arm32be
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
X-List-Received-Date: Fri, 23 Nov 2018 07:54:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsOg0KDQpXaGVuIEkgdXNlIHJwbSBvbiBhcm0zMmJlLCBJIGZvdW5k
IGEgSGVhZGVyIFNIQTEgZGlnZXN0IHByb2JsZW0gYXMgZm9sbG93czoNCg0K
IyBycG0gIC1xcGkgdGVzdC1tYW51YWwtMS4yLjMtMjAxODEwMTIubm9hcmNo
LnJwbQ0KZXJyb3I6IHRlc3QtbWFudWFsLTEuMi4zLTIwMTgxMDEyLm5vYXJj
aC5ycG06IEhlYWRlciBTSEExIGRpZ2VzdDogQkFEIChFeHBlY3RlZA0KZjFk
ZWI3ZGM0YTEwNzQyZDg4Y2NkMWU5NjdkYmM2MmFlNDUwOTVhNSAhPTRhZDlk
N2RhZDZkNzBkNjA4NmVlZmVjNjI2MTJhZDVkNzdmMmZlODEpICA9PiB0aGlz
IHZhbHVlIGlzIHdyb25nDQplcnJvcjogdGVzdC1tYW51YWwtMS4yLjMtMjAx
ODEwMTIubm9hcmNoLnJwbTogbm90IGFuIHJwbSBwYWNrYWdlIChvciBwYWNr
YWdlIG1hbmlmZXN0KQ0KDQpJIGZvdW5kIGl0IGlzIGNhdXNlZCBieSB0aGUg
aGFzaCBvZiBuc3MsIGlmIEkgcmVidWlsZCBycG0gd2l0aCBiZWVjcm9wdCwg
dGhpcyBwcm9ibGVtIHdpbGwgYmUgZml4Lg0KZGlmZiAtLWdpdCBhL21ldGEt
dWJpbnV4L3JlY2lwZXMtY29udHJpYi9ycG0vcnBtXzQuMTQuMS5iYiBiL21l
dGEtdWJpbnV4L3JlY2lwZXMtY29udHJpYi9ycG0vcnBtXzQuMTQuMS5iYg0K
DQogRVhUUkFfT0VDT05GX2FwcGVuZCA9ICIgLS13aXRob3V0LWx1YSAtLWVu
YWJsZS1weXRob24iIA0KK0VYVFJBX09FQ09ORl9hcHBlbmRfYXJtZWIgPSAi
IC0td2l0aC1jcnlwdG89YmVlY3J5cHQiIA0KIEVYVFJBX09FQ09ORl9hcHBl
bmRfbGliYy1tdXNsID0gIiAtLWRpc2FibGUtbmxzIg0KDQpidXQgSSBkb24n
dCBrbm93IHdoeSBycG0gd2l0aCBuc3MgY2FuJ3Qgd29yayB3ZWxsIG9uIGFy
bTMyYmUsIGRvZXMgYW55b25lIGtub3cgdGhlIHJlYXNvbiBhYm91dCBpdD8N
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5hbmRh
IFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5vLjYg
V2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5qaW5n
LCAyMTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlz
dHUuY29tDQoNCgoK

