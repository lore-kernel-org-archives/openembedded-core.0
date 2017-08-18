Return-Path: <zhengrq.fnst@cn.fujitsu.com>
X-Greylist: delayed 662 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Aug 2017 01:22:10 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB517814B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 01:22:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,390,1498492800"; d="scan'208";a="23973835"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2017 09:11:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 04B6246B5FD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:11:07 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Fri, 18 Aug 2017 09:11:06 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] (morty) rpm: Fix the Bug of SRPM String
	error
Thread-Index: AQHS68PppMd1jN84IUGe/EegDat5jaKJpSaA
Date: Fri, 18 Aug 2017 01:11:06 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EE4621F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1498182968-27962-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1498182968-27962-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.100]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 04B6246B5FD2.AC090
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v3] (morty) rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Fri, 18 Aug 2017 01:22:14 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmhl
bmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIA0KU2VudDogRnJpZGF5LCBKdW5lIDIz
LCAyMDE3IDk6NTYgQU0NClRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpDYzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKm
IDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQpTdWJqZWN0OiBbT0Ut
Y29yZV0gW1BBVENIIHYzXSAobW9ydHkpIHJwbTogRml4IHRoZSBCdWcgb2Yg
U1JQTSBTdHJpbmcgZXJyb3INCg0KQWRkIGEgcGF0Y2ggMDAwMS1GaXgtdGhl
LUJ1Zy1vZi1TUlBNLVN0cmluZy1lcnJvci5wYXRjaCB0byBmaXggU1JQTSBi
dWcNCg0KV2hlbiB1c2UgYml0YmFrZSB0byBidWlsZCBhIFNSUE0gcGFja2Fn
ZSwgc29tZSBzZWN0aW9ucyBvZiBTUlBNIGNhbid0IGJlIGRpc3BsYXllZCBu
b3JtYWxseS4NCkZvciBleGFtcGxlOg0KJCBycG0gLXFwaSBiYXNoLTQuMy4z
MC1yMC5zcmMucnBtDQp3YXJuaW5nOiBiYXNoLTQuMy4zMC1yMC5zcmMucnBt
OiBIZWFkZXIgVjQgRFNBL1NIQTEgU2lnbmF0dXJlLCBrZXkgSUQgMGE4Njhl
OGU6IE5PS0VZDQpOYW1lICAgICAgICA6IGJhc2gNClZlcnNpb24gICAgIDog
NC4zLjMwDQpSZWxlYXNlICAgICA6IHIwDQpBcmNoaXRlY3R1cmU6IGk1ODYN
Ckluc3RhbGwgRGF0ZTogKG5vdCBpbnN0YWxsZWQpDQpHcm91cCAgICAgICA6
IMOUwq8NClNpemUgICAgICAgIDogODQxMzc5Nw0KTGljZW5zZSAgICAgOiBH
UEx2MysNClNpZ25hdHVyZSAgIDogRFNBL1NIQTEsIFdlZCAyMSBKdW4gMjAx
NyAwNzozNzo1MiBQTSBQRFQsIEtleSBJRCA2MDkxMDRlNDBhODY4ZThlDQpT
b3VyY2UgUlBNICA6IChub25lKQ0KQnVpbGQgRGF0ZSAgOiBXZWQgMjEgSnVu
IDIwMTcgMDc6Mzc6NTIgUE0gUERUIEJ1aWxkIEhvc3QgIDogdWJ1bnR1IFJl
bG9jYXRpb25zIDogKG5vdCByZWxvY2F0YWJsZSkNClBhY2thZ2VyICAgIDog
UG9reSA8cG9reUB5b2N0b3Byb2plY3Qub3JnPg0KVVJMICAgICAgICAgOiBo
dHRwOi8vdGlzd3d3LmNhc2UuZWR1L3BocC9jaGV0L2Jhc2gvYmFzaHRvcC5o
dG1sDQpTdW1tYXJ5ICAgICA6IDgNCkRlc2NyaXB0aW9uIDoNCjggDQoNClNp
Z25lZC1vZmYtYnk6IHpoZW5ncnEgPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1
LmNvbT4NCi0tLQ0KIC4uLi8wMDAxLUZpeC10aGUtQnVnLW9mLVNSUE0tU3Ry
aW5nLWVycm9yLnBhdGNoICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysr
Kw0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzUuNC4xNi5iYiAg
ICAgICAgICAgIHwgIDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnBtL3JwbS8wMDAxLUZpeC10aGUtQnVnLW9mLVNSUE0tU3RyaW5n
LWVycm9yLnBhdGNoDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnBtL3JwbS8wMDAxLUZpeC10aGUtQnVnLW9mLVNSUE0tU3RyaW5n
LWVycm9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9ycG0v
MDAwMS1GaXgtdGhlLUJ1Zy1vZi1TUlBNLVN0cmluZy1lcnJvci5wYXRjaA0K
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLmI5NjI2MTcN
Ci0tLSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
cG0vcnBtLzAwMDEtRml4LXRoZS1CdWctb2YtU1JQTS1TdHJpbmctZXJybw0K
KysrIHIucGF0Y2gNCkBAIC0wLDAgKzEsNDggQEANCitTdWJqZWN0OiBbUEFU
Q0hdIEZpeCB0aGUgQnVnIG9mIFNSUE0gU3RyaW5nIGVycm9yDQorDQorVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nDQorJCBycG0gLXFwaSBiYXNoLTQuMy4z
MC1yMC5zcmMucnBtDQord2FybmluZzogYmFzaC00LjMuMzAtcjAuc3JjLnJw
bTogSGVhZGVyIFY0IERTQS9TSEExIFNpZ25hdHVyZSwga2V5IElEIDBhODY4
ZThlOiBOT0tFWQ0KK05hbWUgICAgICAgIDogYmFzaA0KK1ZlcnNpb24gICAg
IDogNC4zLjMwDQorUmVsZWFzZSAgICAgOiByMA0KK0FyY2hpdGVjdHVyZTog
aTU4Ng0KK0luc3RhbGwgRGF0ZTogKG5vdCBpbnN0YWxsZWQpDQorR3JvdXAg
ICAgICAgOiDDlMKvDQorU2l6ZSAgICAgICAgOiA4NDEzNzk3DQorTGljZW5z
ZSAgICAgOiBHUEx2MysNCitTaWduYXR1cmUgICA6IERTQS9TSEExLCBXZWQg
MjEgSnVuIDIwMTcgMDc6Mzc6NTIgUE0gUERULCBLZXkgSUQgNjA5MTA0ZTQw
YTg2OGU4ZQ0KK1NvdXJjZSBSUE0gIDogKG5vbmUpDQorQnVpbGQgRGF0ZSAg
OiBXZWQgMjEgSnVuIDIwMTcgMDc6Mzc6NTIgUE0gUERUIEJ1aWxkIEhvc3Qg
IDogdWJ1bnR1IA0KK1JlbG9jYXRpb25zIDogKG5vdCByZWxvY2F0YWJsZSkN
CitQYWNrYWdlciAgICA6IFBva3kgPHBva3lAeW9jdG9wcm9qZWN0Lm9yZz4N
CitVUkwgICAgICAgICA6IGh0dHA6Ly90aXN3d3cuY2FzZS5lZHUvcGhwL2No
ZXQvYmFzaC9iYXNodG9wLmh0bWwNCitTdW1tYXJ5ICAgICA6IDgNCitEZXNj
cmlwdGlvbiA6DQorOA0KKw0KK1NpZ25lZC1vZmYtYnk6IHpoZW5ncnEgPHpo
ZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCistLS0NCisgcnBtZGIvdGFn
bmFtZS5jIHwgNCArKy0tDQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQorDQorZGlmZiAtLWdpdCBhL3JwbWRi
L3RhZ25hbWUuYyBiL3JwbWRiL3RhZ25hbWUuYyBpbmRleCBjZmQxNDU5Li5k
YmNhZmQxIA0KKzEwMDY0NA0KKy0tLSBhL3JwbWRiL3RhZ25hbWUuYw0KKysr
KyBiL3JwbWRiL3RhZ25hbWUuYw0KK0BAIC01MTgsOSArNTE4LDkgQEAgdGFn
U3RvcmVfdCB0YWdTdG9yZUZyZWUodGFnU3RvcmVfdCBkYmlUYWdzLCBzaXpl
X3QgDQorZGJpTlRhZ3MpICB2b2lkIHRhZ1R5cGVWYWxpZGF0ZShIRV90IGhl
KTsgIHZvaWQgdGFnVHlwZVZhbGlkYXRlKEhFX3QgDQoraGUpICB7DQorLSAg
ICAvKiBYWFggUmUtbWFwIFJQTV9JMThOU1RSSU5HX1RZUEUgLT4gUlBNX1NU
UklOR19UWVBFICovDQorKyAgICAvKiBYWFggUlBNX0kxOE5TVFJJTkdfVFlQ
RSBpcyB0cmVhdGVkIGFzIHN0cmluZ3MuICovDQorICAgICBpZiAoaGUtPnQg
PT0gUlBNX0kxOE5TVFJJTkdfVFlQRSkNCistCWhlLT50ID0gUlBNX1NUUklO
R19UWVBFOw0KKysJcmV0dXJuOw0KKyANCisgICAgIC8qIFhYWCBBcmJpdHJh
cnkgdGFncyBhcmUgYWx3YXlzIHN0cmluZ3MuICovDQorICAgICBpZiAoKGhl
LT50YWcgJiAweDQwMDAwMDAwKQ0KKy0tDQorMi43LjQNCisNCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV81LjQuMTYuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV81LjQuMTYuYmINCmlu
ZGV4IDQ5N2FmOGUuLmFlNWUwYzQgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnBtL3JwbV81LjQuMTYuYmINCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ycG0vcnBtXzUuNC4xNi5iYg0KQEAgLTEyMCw2ICsx
MjAsNyBAQCBTUkNfVVJJICs9ICIgXA0KIAkgICBmaWxlOi8vMDAwMS1zeXN0
ZW0uaC1xdWVyeS5jLXN1cHBvcnQtbm9zaWduYXR1cmUucGF0Y2ggXA0KIAkg
ICBmaWxlOi8vcnBtLWVuc3VyZS1ycG0yY3Bpby1jYWxsLXJwbS1yZWxvY2F0
aW9uLWNvZGUucGF0Y2ggXA0KIAkgICBmaWxlOi8vMDAwMS1tYWNyb3MtYWRk
LV9ncGdfc2lnbl9jbWRfZXh0cmFfYXJncy5wYXRjaCBcDQorCSAgIGZpbGU6
Ly8wMDAxLUZpeC10aGUtQnVnLW9mLVNSUE0tU3RyaW5nLWVycm9yLnBhdGNo
IFwNCiAiDQogDQogIyBPRSBzcGVjaWZpYyBjaGFuZ2VzDQotLQ0KMi43LjQN
Cg0KCgo=

