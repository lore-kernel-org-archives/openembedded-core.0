Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 745FE65CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 00:58:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7891964"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jun 2016 08:58:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E64CC498F583
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 08:58:05 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Tue, 21 Jun 2016 08:58:05 +0800
From: "Dai, Caiyun" <daicy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] openssh: add systemd service file sshd.service
Thread-Index: AdHLV+hi7Ep2JczOTq6sJJOWKCMSjg==
Date: Tue, 21 Jun 2016 00:58:05 +0000
Message-ID: <F96CF52C4114D94498E9D1443A2CDDE2CDA30D0B@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.68]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E64CC498F583.A9E59
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] openssh: add systemd service file sshd.service
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
X-List-Received-Date: Tue, 21 Jun 2016 00:58:15 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQoNCklmIHN5c3Zpbml0IGlzIGRpc2FibGVkIGZyb20gRElTVFJP
X0ZFQVRVUkVTLHRoZW4gL2V0Yy9pbml0LmQvc3NoZCB3aWxsIGJlIHJlbW92
ZWQsYW5kIHRoaXMgd2lsbCBjYXVzZSBzc2hkIGRhZW1vbiBmYWlsZWQgdG8g
c3RhcnQgYnkgc3lzdGVtZCwgU28gYWRkIGl0Lg0KDQpTaWduZWQtb2ZmLWJ5
OiBMaSBYaW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+DQotLS0NCiAu
Li4vcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQu
c2VydmljZSB8IDE5ICsrKysrKysrKysrKysrKysrKysNCiBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF83LjFwMi5iYiAgICB8
ICA5ICsrKysrKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hkLnNl
cnZpY2UNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZSBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZQ0K
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjZjMDVmMjMN
Ci0tLSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZQ0KQEAgLTAsMCArMSwx
OSBAQA0KK1tVbml0XQ0KK0Rlc2NyaXB0aW9uPU9wZW5TU0ggc2VydmVyIGRh
ZW1vbg0KK0RvY3VtZW50YXRpb249bWFuOnNzaGQoOCkgbWFuOnNzaGRfY29u
ZmlnKDUpIEFmdGVyPW5ldHdvcmsudGFyZ2V0IA0KK3NzaGQta2V5Z2VuLnNl
cnZpY2UgV2FudHM9c3NoZC1rZXlnZW4uc2VydmljZQ0KKw0KK1tTZXJ2aWNl
XQ0KK1R5cGU9Zm9ya2luZw0KK1BJREZpbGU9QGxvY2Fsc3RhdGVkaXJAL3J1
bi9zc2hkLnBpZA0KK0Vudmlyb25tZW50RmlsZT0tQFNZU0NPTkZESVJAL3N5
c2NvbmZpZy9zc2hkDQorRXhlY1N0YXJ0PUBTQklORElSQC9zc2hkICRPUFRJ
T05TDQorRXhlY1JlbG9hZD1AQkFTRV9CSU5ESVJAL2tpbGwgLUhVUCAkTUFJ
TlBJRCBLaWxsTW9kZT1wcm9jZXNzIA0KK1Jlc3RhcnQ9b24tZmFpbHVyZSBS
ZXN0YXJ0U2VjPTQycw0KKw0KK1tJbnN0YWxsXQ0KK1dhbnRlZEJ5PW11bHRp
LXVzZXIudGFyZ2V0DQorDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfNy4xcDIuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF83LjFwMi5iYg0K
aW5kZXggM2I1ZTI4YS4uOGIzMWI0MCAxMDA2NDQNCi0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuMXAyLmJiDQor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNz
aF83LjFwMi5iYg0KQEAgLTIzLDcgKzIzLDkgQEAgU1JDX1VSSSA9ICJmdHA6
Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvT3BlblNTSC9wb3J0YWJs
ZS9vcGVuc3NoLSR7UFZ9LnRhci4NCiAgICAgICAgICAgIGZpbGU6Ly9ydW4t
cHRlc3QgXA0KICAgICAgICAgICAgZmlsZTovL0NWRS0yMDE2LTE5MDdfdXBz
dHJlYW1fY29tbWl0LnBhdGNoIFwNCiAgICAgICAgICAgIGZpbGU6Ly9DVkUt
MjAxNi0xOTA3XzIucGF0Y2ggXA0KLSAgICAgICAgICAgZmlsZTovL0NWRS0y
MDE2LTE5MDdfMy5wYXRjaCAiDQorICAgICAgICAgICBmaWxlOi8vQ1ZFLTIw
MTYtMTkwN18zLnBhdGNoIFwNCisgICAgICAgICAgIGZpbGU6Ly9zc2hkLnNl
cnZpY2UiDQorDQogDQogUEFNX1NSQ19VUkkgPSAiZmlsZTovL3NzaGQiDQog
DQpAQCAtMzksNyArNDEsNyBAQCBJTklUU0NSSVBUX05BTUVfJHtQTn0tc3No
ZCA9ICJzc2hkIg0KIElOSVRTQ1JJUFRfUEFSQU1TXyR7UE59LXNzaGQgPSAi
ZGVmYXVsdHMgOSINCiANCiBTWVNURU1EX1BBQ0tBR0VTID0gIiR7UE59LXNz
aGQiDQotU1lTVEVNRF9TRVJWSUNFXyR7UE59LXNzaGQgPSAic3NoZC5zb2Nr
ZXQiDQorU1lTVEVNRF9TRVJWSUNFXyR7UE59LXNzaGQgPSAic3NoZC5zb2Nr
ZXQgc3NoZC5zZXJ2aWNlIg0KIA0KIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tl
bnNlcCBwdGVzdA0KIA0KQEAgLTExOCw5ICsxMjAsMTIgQEAgZG9faW5zdGFs
bF9hcHBlbmQgKCkgew0KIAlpbnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElS
fS9zc2hkLnNvY2tldCAke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbQ0K
IAlpbnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElSfS9zc2hkQC5zZXJ2aWNl
ICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtDQogCWluc3RhbGwgLWMg
LW0gMDY0NCAke1dPUktESVJ9L3NzaGRnZW5rZXlzLnNlcnZpY2UgJHtEfSR7
c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0NCisJaW5zdGFsbCAtYyAtbSAwNjQ0
ICR7V09SS0RJUn0vc3NoZC5zZXJ2aWNlIA0KKyR7RH0ke3N5c3RlbWRfdW5p
dGRpcn0vc3lzdGVtDQogCXNlZCAtaSAtZSAncyxAQkFTRV9CSU5ESVJALCR7
YmFzZV9iaW5kaXJ9LGcnIFwNCiAJCS1lICdzLEBTQklORElSQCwke3NiaW5k
aXJ9LGcnIFwNCiAJCS1lICdzLEBCSU5ESVJALCR7YmluZGlyfSxnJyBcDQor
CQktZSAncyxAU1lTQ09ORkRJUkAsJHtzeXNjb25mZGlyfSxnJyBcDQorCQkt
ZSAncyxAbG9jYWxzdGF0ZWRpckAsJHtsb2NhbHN0YXRlZGlyfSxnJyBcDQog
CQkke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS9zc2hkLnNvY2tldCAk
e0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS8qLnNlcnZpY2UNCiB9DQog
DQotLQ0KMS44LjQuMg0KDQoNCg0KLS0gDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVtYmVkZGVkLWNv
cmUgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoKCg==

