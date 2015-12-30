Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CDE1460745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 01:07:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2077282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Dec 2015 09:07:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 49B9841887DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 09:07:09 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Wed, 30 Dec 2015 09:07:09 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] jpeg: To enable non-JPEG file formats for
	djpeg/cjpeg command.
Thread-Index: AQHROXmDZr16n6MCa02ak8FKQFO/C57iyb4g
Date: Wed, 30 Dec 2015 01:07:09 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE3FDEC8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1450429709-32736-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1450429709-32736-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 49B9841887DE.ABD7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] jpeg: To enable non-JPEG file formats for djpeg/cjpeg command.
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
X-List-Received-Date: Wed, 30 Dec 2015 01:07:29 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTgsIDIw
MTUgNTowOCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBDYzogTGVpLCBNYW9odWkNCj4gU3ViamVjdDog
W09FLWNvcmVdW1BBVENIXSBqcGVnOiBUbyBlbmFibGUgbm9uLUpQRUcgZmls
ZSBmb3JtYXRzIGZvciBkanBlZy9janBlZw0KPiBjb21tYW5kLg0KPiANCj4g
VG8gZml4IHRoZSBlcnJvciBhcyBmb2xsb3dpbmcgd2hlbiB1c2UgZGpwZWcv
Y2pwZWcgY29tbWFuZDoNCj4gVW5zdXBwb3J0ZWQgb3V0cHV0IGZpbGUgZm9y
bWF0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9o
dWlAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNv
cmUvanBlZy9qcGVnXzlhLmJiIHwgMTMgKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9qcGVnL2pwZWdfOWEuYmIgYi9tZXRh
L3JlY2lwZXMtDQo+IGNvcmUvanBlZy9qcGVnXzlhLmJiDQo+IGluZGV4IGVh
MmU2NWQuLjA5MjA1N2QgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2pwZWcvanBlZ185YS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9qcGVnL2pwZWdfOWEuYmINCj4gQEAgLTIxLDYgKzIxLDE5IEBAIEZJTEVT
X2pwZWctdG9vbHMgPSAJIiR7YmluZGlyfS8qIg0KPiANCj4gIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIg0KPiANCj4gKyNUbyBlbmFibGUgbm9uLUpQRUco
Ym1wLGdpZixwcG0gYW5kIHRhcmdhKSBmaWxlIGZvcm1hdHMgZm9yIGRqcGVn
L2NqcGVnDQo+IGNvbW1hbmQNCj4gK2RvX2NvbXBpbGVfcHJlcGVuZCgpIHsN
Cj4gKyAgICAgICAgZWNobyAnI2lmZGVmIEpQRUdfQ0pQRUdfREpQRUcgJyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPj4gamNvbmZpZy5o
DQo+ICsgICAgICAgIGVjaG8gJyNkZWZpbmUgQk1QX1NVUFBPUlRFRCAgICAv
KiBCTVAgaW1hZ2UgZmlsZSBmb3JtYXQgKi8nICAgICAgID4+DQo+IGpjb25m
aWcuaA0KPiArICAgICAgICBlY2hvICcjZGVmaW5lIEdJRl9TVVBQT1JURUQg
ICAgLyogR0lGIGltYWdlIGZpbGUgZm9ybWF0ICovJyAgICAgICA+PiBqY29u
ZmlnLmgNCj4gKyAgICAgICAgZWNobyAnI2RlZmluZSBQUE1fU1VQUE9SVEVE
ICAgIC8qIFBCTVBMVVMgUFBNL1BHTSBpbWFnZSBmaWxlIGZvcm1hdA0KPiAq
LycgPj4gamNvbmZpZy5oDQo+ICsgICAgICAgIGVjaG8gJyN1bmRlZiBSTEVf
U1VQUE9SVEVEICAgICAvKiBVdGFoIFJMRSBpbWFnZSBmaWxlIGZvcm1hdCAq
LycgID4+DQo+IGpjb25maWcuaA0KPiArICAgICAgICBlY2hvICcjZGVmaW5l
IFRBUkdBX1NVUFBPUlRFRCAgLyogVGFyZ2EgaW1hZ2UgZmlsZSBmb3JtYXQg
Ki8nICAgICA+Pg0KPiBqY29uZmlnLmgNCj4gKyAgICAgICAgZWNobyAnI2Vu
ZGlmIC8qIEpQRUdfQ0pQRUdfREpQRUcgKi8nICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPj4gamNvbmZpZy5oDQo+ICt9DQo+ICsNCj4gKw0KPiAr
DQo+ICBwa2dfcG9zdGluc3RfJHtQTn1fbGludXhzdGRiYXNlICgpIHsNCj4g
ICAgICBpZiBbICEgLWUgJEQke2xpYmRpcn0vbGlianBlZy5zby42MiBdOyB0
aGVuDQo+ICAgICAgICAgIEpQRUc9YGZpbmQgJEQke2xpYmRpcn0gLXR5cGUg
ZiAtbmFtZSBsaWJqcGVnLnNvLlwqLlwqLlwqYA0KPiAtLQ0KPiAxLjguNC4y
DQoNCgoK

