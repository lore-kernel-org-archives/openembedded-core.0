Return-Path: <steven.hung@mediatek.com>
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
	by mail.openembedded.org (Postfix) with ESMTP id DB6336D749
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 06:26:09 +0000 (UTC)
X-UUID: 9a7beb1ccf954c52be390a280a99316a-20190313
X-UUID: 9a7beb1ccf954c52be390a280a99316a-20190313
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
	mailgw01.mediatek.com (envelope-from <steven.hung@mediatek.com>)
	(mhqrelay.mediatek.com ESMTP with TLS)
	with ESMTP id 2030249587; Wed, 13 Mar 2019 14:26:07 +0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
	mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 13 Mar 2019 14:26:05 +0800
Received: from MTKMBS06N1.mediatek.inc ([fe80::893a:dede:6681:ca4b]) by
	mtkmbs06n1.mediatek.inc ([fe80::893a:dede:6681:ca4b%18]) with mapi id
	15.00.1395.000; Wed, 13 Mar 2019 14:26:05 +0800
From: =?big5?B?U3RldmVuIEh1bmcgKKx4pF+lySk=?= <Steven.Hung@mediatek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] class/sanity: strip the output of get_filesystem_id()
Thread-Index: AdTZZVQ+nj1cPgvrTlCf1i07e9V3EQ==
Date: Wed, 13 Mar 2019 06:26:05 +0000
Message-ID: <c5e9c47ab8dc4955b0d1a3acf6572ed9@mtkmbs06n1.mediatek.inc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.101.239]
x-tm-snts-smtp: 6956FA51C0CF0157748F192A7AC986B048CB957A4D6E3252057DC4CBE5D1AF9B2000:8
MIME-Version: 1.0
Subject: [PATCH] class/sanity: strip the output of get_filesystem_id()
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
X-List-Received-Date: Wed, 13 Mar 2019 06:26:10 -0000
Content-Language: zh-TW
Content-Transfer-Encoding: base64
Content-Type: multipart/related;
	boundary="__=_Part_Boundary_009_770446822.833434662"

--__=_Part_Boundary_009_770446822.833434662
Content-Transfer-Encoding: base64
Content-Type: multipart/alternative;
	boundary="__=_Part_Boundary_001_2084418468.1460852539"

--__=_Part_Boundary_001_2084418468.1460852539
Content-Type: text/html
Content-Transfer-Encoding: base64

PHByZT4NCkEmIzMyO3ByZXZpb3VzJiMzMjtjb21taXQmIzMyOzJmNDRiOWImIzMyO3JlcGxhY2Um
IzMyO29lLnV0aWxzLmdldHN0YXR1c291dHB1dCgpJiMzMjt0byYjMzI7c3VicHJvY2Vzcy5jaGVj
a19vdXRwdXQoKS4mIzMyO2NoZWNrX291dHB1dCgpJiMzMjtkb24mIzM5O3QmIzMyO3JlbW92ZSYj
MzI7YSYjMzI7dHJhaWxsaW5nJiMzMjtuZXdsaW5lLiYjMzI7QWRkJiMzMjtzdHJpcCgpDQoNClNp
Z25lZC1vZmYtYnk6JiMzMjtTdGV2ZW4mIzMyO0h1bmcmIzMyOygmIzI3OTQ2OyYjMjAxMTA7JiMy
OTU3NzspJiMzMjsmbHQ7U3RldmVuLkh1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KLS0tDQomIzMyO21l
dGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcyYjMzI7fCYjMzI7MiYjMzI7Ky0NCiYjMzI7MSYjMzI7
ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwmIzMyOzEmIzMyO2RlbGV0
aW9uKC0pDQoNCmRpZmYmIzMyOy0tZ2l0JiMzMjthL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFz
cyYjMzI7Yi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MmIzMyO2luZGV4JiMzMjszNzRkYWNm
NGQwLi5jYWIwOTIxNDAxJiMzMjsxMDA2NDQNCi0tLSYjMzI7YS9tZXRhL2NsYXNzZXMvc2FuaXR5
LmJiY2xhc3MNCisrKyYjMzI7Yi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MNCkBAJiMzMjst
MzM4LDcmIzMyOyszMzgsNyYjMzI7QEAmIzMyO2RlZiYjMzI7Y2hlY2tfcGF0aF9sZW5ndGgoZmls
ZXBhdGgsJiMzMjtwYXRobmFtZSwmIzMyO2xpbWl0KToNCiYjMzI7ZGVmJiMzMjtnZXRfZmlsZXN5
c3RlbV9pZChwYXRoKToNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpbXBvcnQmIzMyO3N1YnBy
b2Nlc3MNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt0cnk6DQotJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7c3VicHJvY2Vzcy5jaGVja19vdXRwdXQo
WyZxdW90O3N0YXQmcXVvdDssJiMzMjsmcXVvdDstZiZxdW90OywmIzMyOyZxdW90Oy1jJnF1b3Q7
LCYjMzI7JnF1b3Q7JXQmcXVvdDssJiMzMjtwYXRoXSkuZGVjb2RlKCYjMzk7dXRmLTgmIzM5OykN
CismIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtzdWJw
cm9jZXNzLmNoZWNrX291dHB1dChbJnF1b3Q7c3RhdCZxdW90OywmIzMyOyZxdW90Oy1mJnF1b3Q7
LCYjMzI7JnF1b3Q7LWMmcXVvdDssJiMzMjsmcXVvdDsldCZxdW90OywmIzMyOw0KKyYjMzI7cGF0
aF0pLmRlY29kZSgmIzM5O3V0Zi04JiMzOTspLnN0cmlwKCkNCiYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtleGNlcHQmIzMyO3N1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOg0KJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YmIud2FybigmcXVvdDtDYW4mIzM5
O3QmIzMyO2dldCYjMzI7ZmlsZXN5c3RlbSYjMzI7aWQmIzMyO29mOiYjMzI7JXMmcXVvdDsmIzMy
OyUmIzMyO3BhdGgpDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZXR1cm4mIzMyO05vbmUNCi0tDQoyLjE4LjANCg0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0K
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuaw0KIHlvdSE8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_2084418468.1460852539
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: base64

QSBwcmV2aW91cyBjb21taXQgMmY0NGI5YiByZXBsYWNlIG9lLnV0aWxzLmdldHN0YXR1c291dHB1
dCgpIHRvIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCkuIGNoZWNrX291dHB1dCgpIGRvbid0IHJl
bW92ZSBhIHRyYWlsbGluZyBuZXdsaW5lLiBBZGQgc3RyaXAoKQ0KDQpTaWduZWQtb2ZmLWJ5OiBT
dGV2ZW4gSHVuZyAorHikX6XJKSA8U3RldmVuLkh1bmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogbWV0
YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Nhbml0
eS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzIGluZGV4IDM3NGRhY2Y0ZDAu
LmNhYjA5MjE0MDEgMTAwNjQ0DQotLS0gYS9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MNCisr
KyBiL21ldGEvY2xhc3Nlcy9zYW5pdHkuYmJjbGFzcw0KQEAgLTMzOCw3ICszMzgsNyBAQCBkZWYg
Y2hlY2tfcGF0aF9sZW5ndGgoZmlsZXBhdGgsIHBhdGhuYW1lLCBsaW1pdCk6DQogZGVmIGdldF9m
aWxlc3lzdGVtX2lkKHBhdGgpOg0KICAgICBpbXBvcnQgc3VicHJvY2Vzcw0KICAgICB0cnk6DQot
ICAgICAgICByZXR1cm4gc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoWyJzdGF0IiwgIi1mIiwgIi1j
IiwgIiV0IiwgcGF0aF0pLmRlY29kZSgndXRmLTgnKQ0KKyAgICAgICAgcmV0dXJuIHN1YnByb2Nl
c3MuY2hlY2tfb3V0cHV0KFsic3RhdCIsICItZiIsICItYyIsICIldCIsIA0KKyBwYXRoXSkuZGVj
b2RlKCd1dGYtOCcpLnN0cmlwKCkNCiAgICAgZXhjZXB0IHN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vz
c0Vycm9yOg0KICAgICAgICAgYmIud2FybigiQ2FuJ3QgZ2V0IGZpbGVzeXN0ZW0gaWQgb2Y6ICVz
IiAlIHBhdGgpDQogICAgICAgICByZXR1cm4gTm9uZQ0KLS0NCjIuMTguMA0KDQo=

--__=_Part_Boundary_001_2084418468.1460852539--

--__=_Part_Boundary_009_770446822.833434662--
