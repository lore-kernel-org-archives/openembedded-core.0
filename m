Return-Path: <steven.hung@mediatek.com>
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by mail.openembedded.org (Postfix) with ESMTP id 062C66C108
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 03:46:23 +0000 (UTC)
X-UUID: 8ce54c906ab0491b93c6820b095fe68a-20190313
X-UUID: 8ce54c906ab0491b93c6820b095fe68a-20190313
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
	mailgw02.mediatek.com (envelope-from <steven.hung@mediatek.com>)
	(mhqrelay.mediatek.com ESMTP with TLS)
	with ESMTP id 1438839854; Wed, 13 Mar 2019 11:46:15 +0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
	mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 13 Mar 2019 11:46:13 +0800
Received: from MTKMBS06N1.mediatek.inc ([fe80::893a:dede:6681:ca4b]) by
	mtkmbs06n1.mediatek.inc ([fe80::893a:dede:6681:ca4b%18]) with mapi id
	15.00.1395.000; Wed, 13 Mar 2019 11:46:13 +0800
From: =?big5?B?U3RldmVuIEh1bmcgKKx4pF+lySk=?= <Steven.Hung@mediatek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] class/sanity: fix broken function check_not_nfs()
Thread-Index: AdTZTbpPmVQG5oF8Rv6cLETYGczbMw==
Date: Wed, 13 Mar 2019 03:46:13 +0000
Message-ID: <645555c96f7d4fdc84e1292df014d0da@mtkmbs06n1.mediatek.inc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.101.239]
x-tm-snts-smtp: 0676F346B81812809735664E852385D596A68A74B14B5D9963FAE5C41DCE78FB2000:8
MIME-Version: 1.0
Subject: [PATCH] class/sanity: fix broken function check_not_nfs()
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
X-List-Received-Date: Wed, 13 Mar 2019 03:46:24 -0000
Content-Language: zh-TW
Content-Transfer-Encoding: base64
Content-Type: multipart/related;
	boundary="__=_Part_Boundary_006_1112801411.1304228975"

--__=_Part_Boundary_006_1112801411.1304228975
Content-Transfer-Encoding: base64
Content-Type: multipart/alternative;
	boundary="__=_Part_Boundary_007_918434469.1429469268"

--__=_Part_Boundary_007_918434469.1429469268
Content-Type: text/html
Content-Transfer-Encoding: base64

PHByZT4NCkEmIzMyO3ByZXZpb3VzJiMzMjtjb21taXQmIzMyOzJmNDRiOWImIzMyO3JlcGxhY2Um
IzMyO29lLnV0aWxzLmdldHN0YXR1c291dHB1dCgpJiMzMjt0byYjMzI7c3VicHJvY2Vzcy5jaGVj
a19vdXRwdXQoKS4mIzMyO2NoZWNrX291dHB1dCgpJiMzMjtkb24mIzM5O3QmIzMyO3JlbW92ZSYj
MzI7YSYjMzI7dHJhaWxsaW5nJiMzMjtuZXdsaW5lLiYjMzI7Rml4JiMzMjtjaGVja19ub3RfbmZz
KCkmIzMyO2J5JiMzMjtjb21wYXJpbmcmIzMyOyZxdW90OzY5NjkmIzkyO24mcXVvdDsuDQoNClNp
Z25lZC1vZmYtYnk6JiMzMjtTdGV2ZW4mIzMyO0h1bmcmIzMyOygmIzI3OTQ2OyYjMjAxMTA7JiMy
OTU3NzspJiMzMjsmbHQ7U3RldmVuLkh1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KLS0tDQomIzMyO21l
dGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyYjMzI7fCYjMzI7MiYjMzI7Ky0NCiYjMzI7MSYjMzI7
ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwmIzMyOzEmIzMyO2RlbGV0
aW9uKC0pDQoNCmRpZmYmIzMyOy0tZ2l0JiMzMjthL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFz
cyYjMzI7Yi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MmIzMyO2luZGV4JiMzMjszNzRkYWNm
NGQwLi4yZDk2ZTFlMTYxJiMzMjsxMDA2NDQNCi0tLSYjMzI7YS9tZXRhL2NsYXNzZXMvc2FuaXR5
LmJiY2xhc3MNCisrKyYjMzI7Yi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MNCkBAJiMzMjst
MzQ2LDcmIzMyOyszNDYsNyYjMzI7QEAmIzMyO2RlZiYjMzI7Z2V0X2ZpbGVzeXN0ZW1faWQocGF0
aCk6DQomIzMyOyMmIzMyO0NoZWNrJiMzMjt0aGF0JiMzMjt0aGUmIzMyO3BhdGgmIzMyO2lzbiYj
Mzk7dCYjMzI7bG9jYXRlZCYjMzI7b24mIzMyO25mcy4NCiYjMzI7ZGVmJiMzMjtjaGVja19ub3Rf
bmZzKHBhdGgsJiMzMjtuYW1lKToNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsjJiMzMjtUaGUm
IzMyO25mcyYjMzk7JiMzMjtmaWxlc3lzdGVtJiMzMjtpZCYjMzI7aXMmIzMyOzY5NjkNCi0mIzMy
OyYjMzI7JiMzMjsmIzMyO2lmJiMzMjtnZXRfZmlsZXN5c3RlbV9pZChwYXRoKSYjMzI7PT0mIzMy
OyZxdW90OzY5NjkmcXVvdDs6DQorJiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7Z2V0X2ZpbGVz
eXN0ZW1faWQocGF0aCkmIzMyOz09JiMzMjsmcXVvdDs2OTY5JiM5MjtuJnF1b3Q7Og0KJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjsmcXVvdDtU
aGUmIzMyOyVzOiYjMzI7JXMmIzMyO2NhbiYjMzk7dCYjMzI7YmUmIzMyO2xvY2F0ZWQmIzMyO29u
JiMzMjtuZnMuJiM5MjtuJnF1b3Q7JiMzMjslJiMzMjsobmFtZSwmIzMyO3BhdGgpDQomIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjsmcXVvdDsmcXVvdDsNCiYjMzI7DQotLQ0KMi4x
OC4wDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBF
bWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rDQogeW91ITwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_007_918434469.1429469268
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: base64

QSBwcmV2aW91cyBjb21taXQgMmY0NGI5YiByZXBsYWNlIG9lLnV0aWxzLmdldHN0YXR1c291dHB1
dCgpIHRvIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCkuIGNoZWNrX291dHB1dCgpIGRvbid0IHJl
bW92ZSBhIHRyYWlsbGluZyBuZXdsaW5lLiBGaXggY2hlY2tfbm90X25mcygpIGJ5IGNvbXBhcmlu
ZyAiNjk2OVxuIi4NCg0KU2lnbmVkLW9mZi1ieTogU3RldmVuIEh1bmcgKKx4pF+lySkgPFN0ZXZl
bi5IdW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIG1ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyB8
IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9z
YW5pdHkuYmJjbGFzcyBpbmRleCAzNzRkYWNmNGQwLi4yZDk2ZTFlMTYxIDEwMDY0NA0KLS0tIGEv
bWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzDQorKysgYi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJi
Y2xhc3MNCkBAIC0zNDYsNyArMzQ2LDcgQEAgZGVmIGdldF9maWxlc3lzdGVtX2lkKHBhdGgpOg0K
ICMgQ2hlY2sgdGhhdCB0aGUgcGF0aCBpc24ndCBsb2NhdGVkIG9uIG5mcy4NCiBkZWYgY2hlY2tf
bm90X25mcyhwYXRoLCBuYW1lKToNCiAgICAgIyBUaGUgbmZzJyBmaWxlc3lzdGVtIGlkIGlzIDY5
NjkNCi0gICAgaWYgZ2V0X2ZpbGVzeXN0ZW1faWQocGF0aCkgPT0gIjY5NjkiOg0KKyAgICBpZiBn
ZXRfZmlsZXN5c3RlbV9pZChwYXRoKSA9PSAiNjk2OVxuIjoNCiAgICAgICAgIHJldHVybiAiVGhl
ICVzOiAlcyBjYW4ndCBiZSBsb2NhdGVkIG9uIG5mcy5cbiIgJSAobmFtZSwgcGF0aCkNCiAgICAg
cmV0dXJuICIiDQogDQotLQ0KMi4xOC4wDQo=

--__=_Part_Boundary_007_918434469.1429469268--

--__=_Part_Boundary_006_1112801411.1304228975--
