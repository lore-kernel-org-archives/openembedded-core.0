Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B12D379E36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 06:20:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,351,1539619200"; d="scan'208";a="49752610"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Dec 2018 14:20:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D374C4B734CC;
	Fri, 14 Dec 2018 14:20:28 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0415.000; Fri, 14 Dec 2018 14:20:29 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] nss: fix Upstream-Status format
Thread-Index: AQHUkKt9lUZsMvuguEyfTpdzRDG8LqV9yCxw
Date: Fri, 14 Dec 2018 06:20:27 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BBB2FE@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <20181210171141.10722-1-ross.burton@intel.com>
In-Reply-To: <20181210171141.10722-1-ross.burton@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D374C4B734CC.AD0A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH 1/4] nss: fix Upstream-Status format
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
X-List-Received-Date: Fri, 14 Dec 2018 06:20:30 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUm9zczoNCg0KTXkgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIGJ5IFVwc3Ry
ZWFtIE5TUzoNCmh0dHBzOi8vaGcubW96aWxsYS5vcmcvcHJvamVjdHMvbnNz
L3Jldi82NmNhZTZhOGY0YjY0MGJlYzVlODUxMGRjZmMyNDdlMDU0NmM5NzNj
DQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5h
bmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5v
LjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5q
aW5nLCAyMTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1
amlzdHUuY29tDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBS
b3NzIEJ1cnRvbg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMSwgMjAx
OCAxOjEyIEFNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMS80
XSBuc3M6IGZpeCBVcHN0cmVhbS1TdGF0dXMgZm9ybWF0DQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25zcy9uc3MvbnNz
LWZpeC1TSEFfSFRPTkwtYnVnLWZvci1hcm0tMzJiZS5wYXRjaCB8IDINCj4g
Ky0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L25zcy9uc3MvbnNzLWZpeC1TSEFfSFRPTkwtYnVnLWZvci1hcm0tDQo+
IDMyYmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uc3MvbnNzL25z
cy1maXgtU0hBX0hUT05MLWJ1Zy1mb3ItYXJtLQ0KPiAzMmJlLnBhdGNoDQo+
IGluZGV4IDdiYThkMTY0ODNhLi5iYjFjNmUzYjM0NSAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnNzL25zcy9uc3MtZml4LVNIQV9I
VE9OTC1idWctZm9yLWFybS0NCj4gMzJiZS5wYXRjaA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9uc3MvbnNzL25zcy1maXgtU0hBX0hUT05MLWJ1
Zy1mb3ItYXJtLQ0KPiAzMmJlLnBhdGNoDQo+IEBAIC0yLDcgKzIsNyBAQCBT
dWJqZWN0OiBbUEFUQ0hdIEZpeCBTSEFfSFRPTkwgYnVnIGZvciBhcm0gMzJi
ZS4NCj4gDQo+ICBJbiBhcm0gMzJiZSwgdGhlcmUgaXMgbm8gbmVlZCB0byBy
ZXZlcnNlIHRoZSBob3N0IHZhbHVlLg0KPiANCj4gLVVwc3RyZWFtIFN0YXR1
czogUGVuZGluZw0KPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+IA0K
PiAgU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RA
Y24uZnVqaXRzdS5jb20+DQo+ICAtLS0NCj4gLS0NCj4gMi4xMS4wDQo+IA0K
PiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QN
Cj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+IA0KDQoKCg==

