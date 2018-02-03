Return-Path: <alejandr@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0080.outbound.protection.outlook.com [104.47.36.80])
	by mail.openembedded.org (Postfix) with ESMTP id 6132171A60
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 02:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=alChxd9RiLq3IUw7gTrVl6cCSfO8lYA3U1RtBzfYmyk=;
	b=GgkOPfqsQbhlHJKa3sL8qi7XPZP5RlsYDAhJHMRo+Hrg7sced1GP/CHXZpKM+7W6SAfOxmSgP98aiMNVFTtwwDXkXEJWt1hYHmp7NZR5wc7VcQz5tWKdzv76+jZv7JppPu4LRTmYbESVmPI9rPLeU5WC/eQIOBgqpdQ6mZUiLeM=
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com (10.167.161.138) by
	MWHPR0201MB3596.namprd02.prod.outlook.com (10.167.162.33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Sat, 3 Feb 2018 02:08:08 +0000
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::4c59:559a:af68:232e]) by
	MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::4c59:559a:af68:232e%13]) with mapi id 15.20.0464.012;
	Sat, 3 Feb 2018 02:08:08 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: Cal Sullivan <california.l.sullivan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] ninja: Upgrade from 1.7.2 to major release
	1.8.2
Thread-Index: AQHTm6mkqHsexkPeckKs0k47cdOoPqORwJoAgAAvZxA=
Date: Sat, 3 Feb 2018 02:08:07 +0000
Message-ID: <MWHPR0201MB3401B6F1844FD779D3537BB9ACF80@MWHPR0201MB3401.namprd02.prod.outlook.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<40632d02-90d3-02ab-47cf-afa6ddb333fb@intel.com>
In-Reply-To: <40632d02-90d3-02ab-47cf-afa6ddb333fb@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR0201MB3596;
	7:UlOMgV111+SHqLR7zhq8U+SGJOiOf12y7pyOl9npmjbl+reT+KMQOiqRtaEYCuHeaqaE1f8ABXVo13Ezfqp9drVV3FDqfvrdt66+kvChAk3ixdvvo1qiTivOu/G7biWDm3Cn2cNuKl0Jg0ASaLCvHm3X3Im9BCZPKD1cqPkAOzZwbtNR4ZoubJl61tUhsLucBryyzcZKF45GcDiPxbLcXCwygeLX0eLub8Iumm63xiSN/Ev/bD6O5PijI6GoG34J
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d714430a-4816-42eb-f0d6-08d56aaaf804
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0201MB3596; 
x-ms-traffictypediagnostic: MWHPR0201MB3596:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-microsoft-antispam-prvs: <MWHPR0201MB3596213BC9AC02EF0E615D36ACF80@MWHPR0201MB3596.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231101)(2400082)(944501161)(3002001)(6055026)(6041288)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:MWHPR0201MB3596; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3596; 
x-forefront-prvs: 05724A8921
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(366004)(396003)(39860400002)(39380400002)(28163001)(189003)(199004)(97736004)(3846002)(229853002)(3660700001)(3280700002)(106356001)(6116002)(68736007)(76176011)(2950100002)(6436002)(7696005)(86362001)(2900100001)(575784001)(186003)(59450400001)(6506007)(81166006)(81156014)(5660300001)(53936002)(5250100002)(102836004)(7736002)(6246003)(14454004)(110136005)(316002)(53546011)(478600001)(55016002)(33656002)(2906002)(26005)(6306002)(74316002)(105586002)(5890100001)(9686003)(25786009)(2501003)(8676002)(66066001)(305945005)(99286004)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3596;
	H:MWHPR0201MB3401.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: a/FIzuLLNpNUH8heC5Guc9F0yfh1P/aJUyUx9nWwNmDgJ5Zyd0MJmZ3lBtWvwa3SxdUklh+xUySF9wQjvS3J3g==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d714430a-4816-42eb-f0d6-08d56aaaf804
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2018 02:08:07.9132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3596
Subject: Re: [PATCH v2] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Sat, 03 Feb 2018 02:08:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGV5IENhbCwNCg0KT24gMDIvMDEvMjAxOCAwMjoxMCBQTSwgQWxlamFuZHJvIEVuZWRpbm8gSGVy
bmFuZGV6IFNhbWFuaWVnbyB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQWxlamFuZHJvIEVuZWRp
bm8gSGVybmFuZGV6IFNhbWFuaWVnbyANCj4gPGFsZWphbmRyQHhpbGlueC5jb20+DQo+IC0tLQ0K
PiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjcuMi5iYiB8IDMwIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5q
YS9uaW5qYV8xLjguMi5iYiB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+ICAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjcu
Mi5iYg0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEv
bmluamFfMS44LjIuYmINCkFkZGluZyB0aGUgZm9sbG93aW5nIHRvIHlvdXIgLmdpdGNvbmZpZyB3
aWxsIGdpdmUgeW91IG1vcmUgcmVhZGFibGUgcGF0Y2hlcyBmb3IgcGFja2FnZSB1cGdyYWRlczoN
CltkaWZmXQ0KIMKgwqDCoMKgwqDCoMKgIHJlbmFtZXMgPSBjb3BpZXMNCg0KSXQgc2ltcGxpZmll
cyB0aGUgZGVsZXRlIC0+IGNyZWF0aW9uIHRvIGEgcmVuYW1lLCB0aGVuIHNob3dzIHdoYXQgY2hh
bmdlZCBpbiB0aGUgcmVuYW1lZCBmaWxlIChTUkNfVVJJIGFuZCBTUkNSRVYpLg0KDQpUaGFua3Ms
DQpDYWwNCg0KR29vZCB0byBoZWFyIGZyb20geW91ISwgSSB0aG91Z2h0IGdpdCBtdiBhdXRvbWF0
aWNhbGx5IGRpZCB0aGF0LCBJIHdhcyBhY3R1YWxseSBzdXJwcmlzZWQgaXQgZGlkbnQgYnV0IEkg
ZGlkbuKAmXQgc3BlbmQgdG9vIG11Y2ggdGltZSBvbiB0aGF0IGVpdGhlci4NClRoYW5rcyENCg0K
QWxlamFuZHJvDQoNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5q
YS9uaW5qYV8xLjcuMi5iYiANCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFf
MS43LjIuYmINCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDRkM2IyNzIuLjAw
MDAwMDANCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuNy4yLmJi
DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsMzAgKzAsMCBAQA0KPiAtU1VNTUFSWSA9ICJOaW5q
YSBpcyBhIHNtYWxsIGJ1aWxkIHN5c3RlbSB3aXRoIGEgZm9jdXMgb24gc3BlZWQuIg0KPiAtSE9N
RVBBR0UgPSAiaHR0cDovL21hcnRpbmUuZ2l0aHViLmNvbS9uaW5qYS8iDQo+IC1MSUNFTlNFID0g
IkFwYWNoZS0yLjAiDQo+IC1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1h
ODE1ODZhNjRhZDRlNDc2Yzc5MWNkYTdlMmYyYzUyZSINCj4gLQ0KPiAtREVQRU5EUyA9ICJyZTJj
LW5hdGl2ZSBuaW5qYS1uYXRpdmUiDQo+IC0NCj4gLVNSQ1JFViA9ICI3MTdiN2I0YTMxZGI2MDI3
MjA3NTg4YzBmYjg5YzNlYWQzODQ3NDdiIg0KPiAtDQo+IC1TUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vbWFydGluZS9uaW5qYS5naXQ7YnJhbmNoPXJlbGVhc2UiDQo+IC1VUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+LiopIg0KPiAtDQo+IC1TID0gIiR7V09SS0RJUn0v
Z2l0Ig0KPiAtDQo+IC1kb19jb25maWd1cmVbbm9leGVjXSA9ICIxIg0KPiAtDQo+IC1kb19jb21w
aWxlX2NsYXNzLW5hdGl2ZSgpIHsNCj4gLSAgICAgICAuL2NvbmZpZ3VyZS5weSAtLWJvb3RzdHJh
cA0KPiAtfQ0KPiAtDQo+IC1kb19jb21waWxlKCkgew0KPiAtICAgICAgIC4vY29uZmlndXJlLnB5
DQo+IC0gICAgICAgbmluamENCj4gLX0NCj4gLQ0KPiAtZG9faW5zdGFsbCgpIHsNCj4gLSAgICAg
ICBpbnN0YWxsIC1EIC1tIDA3NTUgICR7U30vbmluamEgJHtEfSR7YmluZGlyfS9uaW5qYQ0KPiAt
fQ0KPiAtDQo+IC1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS44LjIuYmIgDQo+IGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuOC4yLmJiDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLmM2ZmNmZWYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS44LjIuYmINCj4gQEAgLTAsMCAr
MSwzMCBAQA0KPiArU1VNTUFSWSA9ICJOaW5qYSBpcyBhIHNtYWxsIGJ1aWxkIHN5c3RlbSB3aXRo
IGEgZm9jdXMgb24gc3BlZWQuIg0KPiArSE9NRVBBR0UgPSAiaHR0cDovL21hcnRpbmUuZ2l0aHVi
LmNvbS9uaW5qYS8iDQo+ICtMSUNFTlNFID0gIkFwYWNoZS0yLjAiDQo+ICtMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hODE1ODZhNjRhZDRlNDc2Yzc5MWNkYTdlMmYyYzUy
ZSINCj4gKw0KPiArREVQRU5EUyA9ICJyZTJjLW5hdGl2ZSBuaW5qYS1uYXRpdmUiDQo+ICsNCj4g
K1NSQ1JFViA9ICIyNTNlOTRjMWZhNTExNzA0YmFlYjYxY2Y2OTk5NWJiZjA5YmE0MzVlIg0KPiAr
DQo+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbmluamEtYnVpbGQvbmluamEuZ2l0O2Jy
YW5jaD1yZWxlYXNlIg0KPiArVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVy
Pi4qKSINCj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gKw0KPiArZG9fY29uZmlndXJl
W25vZXhlY10gPSAiMSINCj4gKw0KPiArZG9fY29tcGlsZV9jbGFzcy1uYXRpdmUoKSB7DQo+ICsg
ICAgICAgLi9jb25maWd1cmUucHkgLS1ib290c3RyYXANCj4gK30NCj4gKw0KPiArZG9fY29tcGls
ZSgpIHsNCj4gKyAgICAgICAuL2NvbmZpZ3VyZS5weQ0KPiArICAgICAgIG5pbmphDQo+ICt9DQo+
ICsNCj4gK2RvX2luc3RhbGwoKSB7DQo+ICsgICAgICAgaW5zdGFsbCAtRCAtbSAwNzU1ICAke1N9
L25pbmphICR7RH0ke2JpbmRpcn0vbmluamEgfQ0KPiArDQo+ICtCQkNMQVNTRVhURU5EID0gIm5h
dGl2ZSBuYXRpdmVzZGsiDQo+IC0tDQo+IDIuNy40DQo+DQo+IFRoaXMgZW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyBhcmUgaW50ZW5kZWQgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgbmFtZWQgcmVj
aXBpZW50KHMpIGFuZCBjb250YWluKHMpIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiB0aGF0IG1h
eSBiZSBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCBvciBjb3B5cmlnaHRlZCB1bmRlciBhcHBsaWNh
YmxlIGxhdy4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgZG8gbm90IHJl
YWQsIGNvcHksIG9yIGZvcndhcmQgdGhpcyBlbWFpbCBtZXNzYWdlIG9yIGFueSBhdHRhY2htZW50
cy4gRGVsZXRlIHRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGltbWVkaWF0
ZWx5Lg0KDQo=

