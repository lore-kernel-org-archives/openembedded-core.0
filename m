Return-Path: <Rob.Walton@arm.com>
X-Greylist: delayed 11850 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 May 2019 04:35:33 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20067.outbound.protection.outlook.com [40.107.2.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4B17D44D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 04:35:33 +0000 (UTC)
Received: from AM6PR08MB4691.eurprd08.prod.outlook.com (10.255.96.144) by
	DBBPR08MB4696.eurprd08.prod.outlook.com (10.255.79.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.17; Wed, 22 May 2019 18:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ngrA4eBhBtbsu4MV6FV1WJOZVfV53mJt7ObPqtouo8w=;
	b=bFIQaSbQk9wN9YGJHJ+qI87mWhP78QA5WbkN5BgysRE2rAQzxM4XWnfvyGxIPmpvGrn9XxGcDgTWz7zt2zghv62HNL+mhg36qGZ+13cp2moxo/QsDY0Wz18xg8ep79ojo49T6t3l3KrNj8xbOo3A86ULSYvWbO0FvTg5sL3CqTc=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB4691.eurprd08.prod.outlook.com (10.255.96.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1878.24; Wed, 22 May 2019 12:44:33 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1922.016;
	Wed, 22 May 2019 12:44:33 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] image_license.bbclass: Write JSON files containing
	license data.
Thread-Index: AQHVEJwbiV1SZfIUw0K8X84e11xKYw==
Date: Wed, 22 May 2019 12:44:33 +0000
Message-ID: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:c::30) To AM6PR08MB3685.eurprd08.prod.outlook.com
	(2603:10a6:20b:6f::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c383b2e-ca69-46c6-4669-08d6deb33d3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB4691; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:|AM6PR08MB4691:|DBBPR08MB4696:
x-microsoft-antispam-prvs: <AM6PR08MB4691CDC135CD17566697873095000@AM6PR08MB4691.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(346002)(136003)(376002)(39860400002)(40434004)(189003)(199004)(6916009)(486006)(8676002)(52116002)(81156014)(81166006)(476003)(7736002)(305945005)(2616005)(44832011)(386003)(26005)(6506007)(186003)(102836004)(99286004)(8936002)(4326008)(72206003)(2501003)(36756003)(25786009)(478600001)(68736007)(5660300002)(50226002)(6116002)(3846002)(14454004)(2351001)(5640700003)(86362001)(14444005)(2906002)(6436002)(6512007)(5024004)(6486002)(256004)(316002)(53936002)(66476007)(66556008)(66946007)(71200400001)(71190400001)(64756008)(66446008)(73956011)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4691;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MADw7X+gPaRYmsADDuciowNkqndJUbCEz3yCN1d0CuE8KQzkczX29ohRor0ChNbms2P+iFx7oeNBB/RX3DSwVgugFhRoJJXHHyHIdOqZ8gV+P9YWV+eFfc56JqrSr3IgmhSsfuHBnY3L1/PyW5JeSpxKquxwadCIYklvP+ssSsEbczgiV4Pj0FUnxORtKL122LnBhS4R3s3829TqIlNXbsW5ntGkDxrEUAWpFhF1p/jDc8VdPVXfKksFWo0flRVJ2r6HkNwjx4+RrjFqV1CdN4FscthstQC4YOPuPYquhoXJ3Buy/XGsISb5xuy2DUIpGlAy0SofsbacsxQXHgxU1pCSDsYiwCW/k4PTUWFN2VDh43fKtkhNXrEPRBdZ9ZH7xgUxuCNpNEpzO792D5cyuvwsTDzVEos0EdPa4Mka36A=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c383b2e-ca69-46c6-4669-08d6deb33d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 12:44:33.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
X-OriginatorOrg: arm.com
Subject: [PATCH 1/2] image_license.bbclass: Write JSON files containing license data.
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
X-List-Received-Date: Thu, 23 May 2019 04:35:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIGVhc2llciBtYWNoaW5lIHJlYWRhYmlsaXR5IG9mIGxpY2Vuc2UgbWFuaWZlc3RzLCB3cml0
ZSBhDQptYW5pZmVzdC5qc29uIGNvbnRhaW5pbmcgbGljZW5zZSBkYXRhIGFuZCBwYWNrYWdlIGlu
Zm8uDQoNClNpZ25lZC1vZmYtYnk6IFJvYiBXYWx0b24gPHJvYi53YWx0b25AYXJtLmNvbT4NCi0t
LQ0KIG1ldGEvY2xhc3Nlcy9saWNlbnNlX2ltYWdlLmJiY2xhc3MgfCAyMyArKysrKysrKysrKysr
KysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvbGljZW5zZV9pbWFnZS5iYmNsYXNzIGIv
bWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1hZ2UuYmJjbGFzcw0KaW5kZXggNjc1MDAzOC4uNjk1MjQx
NyAxMDA2NDQNCi0tLSBhL21ldGEvY2xhc3Nlcy9saWNlbnNlX2ltYWdlLmJiY2xhc3MNCisrKyBi
L21ldGEvY2xhc3Nlcy9saWNlbnNlX2ltYWdlLmJiY2xhc3MNCkBAIC0zNiw2ICszNiw3IEBAIHB5
dGhvbiBsaWNlbnNlX2NyZWF0ZV9tYW5pZmVzdCgpIHsNCiB9DQoNCiBkZWYgd3JpdGVfbGljZW5z
ZV9maWxlcyhkLCBsaWNlbnNlX21hbmlmZXN0LCBwa2dfZGljLCByb290ZnM9VHJ1ZSk6DQorICAg
IGltcG9ydCBqc29uDQogICAgIGltcG9ydCByZQ0KICAgICBpbXBvcnQgc3RhdA0KDQpAQCAtNDMs
NiArNDQsNyBAQCBkZWYgd3JpdGVfbGljZW5zZV9maWxlcyhkLCBsaWNlbnNlX21hbmlmZXN0LCBw
a2dfZGljLCByb290ZnM9VHJ1ZSk6DQogICAgIGJhZF9saWNlbnNlcyA9IG1hcChsYW1iZGEgbDog
Y2Fub25pY2FsX2xpY2Vuc2UoZCwgbCksIGJhZF9saWNlbnNlcykNCiAgICAgYmFkX2xpY2Vuc2Vz
ID0gZXhwYW5kX3dpbGRjYXJkX2xpY2Vuc2VzKGQsIGJhZF9saWNlbnNlcykNCg0KKyAgICBqc29u
X2RhdGEgPSBkaWN0KCkNCiAgICAgd2l0aCBvcGVuKGxpY2Vuc2VfbWFuaWZlc3QsICJ3IikgYXMg
bGljZW5zZV9maWxlOg0KICAgICAgICAgZm9yIHBrZyBpbiBzb3J0ZWQocGtnX2RpYyk6DQogICAg
ICAgICAgICAgaWYgYmFkX2xpY2Vuc2VzOg0KQEAgLTYzLDcgKzY1LDE0IEBAIGRlZiB3cml0ZV9s
aWNlbnNlX2ZpbGVzKGQsIGxpY2Vuc2VfbWFuaWZlc3QsIHBrZ19kaWMsIHJvb3Rmcz1UcnVlKToN
CiAgICAgICAgICAgICAgICAgbGljZW5zZV9maWxlLndyaXRlKCJQQUNLQUdFIFZFUlNJT046ICVz
XG4iICUgcGtnX2RpY1twa2ddWyJQViJdKQ0KICAgICAgICAgICAgICAgICBsaWNlbnNlX2ZpbGUu
d3JpdGUoIlJFQ0lQRSBOQU1FOiAlc1xuIiAlIHBrZ19kaWNbcGtnXVsiUE4iXSkNCiAgICAgICAg
ICAgICAgICAgbGljZW5zZV9maWxlLndyaXRlKCJMSUNFTlNFOiAlc1xuXG4iICUgcGtnX2RpY1tw
a2ddWyJMSUNFTlNFIl0pDQotDQorICAgICAgICAgICAgICAgIGpzb25fZGF0YVtwa2ddID0gew0K
KyAgICAgICAgICAgICAgICAgICAgIlJFQ0lQRSBOQU1FIjogcGtnX2RpY1twa2ddWyJQTiJdLA0K
KyAgICAgICAgICAgICAgICAgICAgIlBBQ0tBR0UgVkVSU0lPTiI6IHBrZ19kaWNbcGtnXVsiUFYi
XSwNCisgICAgICAgICAgICAgICAgICAgICJQQUNLQUdFIE5BTUUiOiBwa2csDQorICAgICAgICAg
ICAgICAgICAgICAiTElDRU5TRSI6IHBrZ19kaWNbcGtnXVsiTElDRU5TRSJdLA0KKyAgICAgICAg
ICAgICAgICAgICAgIkhPTUVQQUdFIjogcGtnX2RpY1twa2ddLmdldCgiSE9NRVBBR0UiLCAiIiks
DQorICAgICAgICAgICAgICAgICAgICAiU1VNTUFSWSI6IHBrZ19kaWNbcGtnXS5nZXQoIlNVTU1B
UlkiLCAiIiksDQorICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgICMgSWYg
dGhlIHBhY2thZ2UgZG9lc24ndCBjb250YWluIGFueSBmaWxlLCB0aGF0IGlzLCBpdHMgc2l6ZSBp
cyAwLCB0aGUgbGljZW5zZQ0KICAgICAgICAgICAgICAgICAjIGlzbid0IHJlbGV2YW50IGFzIGZh
ciBhcyB0aGUgZmluYWwgaW1hZ2UgaXMgY29uY2VybmVkLiBTbyBkb2luZyBsaWNlbnNlIGNoZWNr
DQogICAgICAgICAgICAgICAgICMgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UsIHNraXAgaXQuDQpA
QCAtNzUsNiArODQsMTQgQEAgZGVmIHdyaXRlX2xpY2Vuc2VfZmlsZXMoZCwgbGljZW5zZV9tYW5p
ZmVzdCwgcGtnX2RpYywgcm9vdGZzPVRydWUpOg0KICAgICAgICAgICAgICAgICBsaWNlbnNlX2Zp
bGUud3JpdGUoIlZFUlNJT046ICVzXG4iICUgcGtnX2RpY1twa2ddWyJQViJdKQ0KICAgICAgICAg
ICAgICAgICBsaWNlbnNlX2ZpbGUud3JpdGUoIkxJQ0VOU0U6ICVzXG4iICUgcGtnX2RpY1twa2dd
WyJMSUNFTlNFIl0pDQogICAgICAgICAgICAgICAgIGxpY2Vuc2VfZmlsZS53cml0ZSgiRklMRVM6
ICVzXG5cbiIgJSBwa2dfZGljW3BrZ11bIkZJTEVTIl0pDQorICAgICAgICAgICAgICAgIGpzb25f
ZGF0YVtwa2ddID0gew0KKyAgICAgICAgICAgICAgICAgICAgIlJFQ0lQRSBOQU1FIjogcGtnX2Rp
Y1twa2ddWyJQTiJdLA0KKyAgICAgICAgICAgICAgICAgICAgIlZFUlNJT04iOiBwa2dfZGljW3Br
Z11bIlBWIl0sDQorICAgICAgICAgICAgICAgICAgICAiRklMRVMiOiBwa2dfZGljW3BrZ11bIkZJ
TEVTIl0sDQorICAgICAgICAgICAgICAgICAgICAiTElDRU5TRSI6IHBrZ19kaWNbcGtnXVsiTElD
RU5TRSJdLA0KKyAgICAgICAgICAgICAgICAgICAgIkhPTUVQQUdFIjogcGtnX2RpY1twa2ddLmdl
dCgiSE9NRVBBR0UiLCAiIiksDQorICAgICAgICAgICAgICAgICAgICAiU1VNTUFSWSI6IHBrZ19k
aWNbcGtnXS5nZXQoIlNVTU1BUlkiLCAiIiksDQorICAgICAgICAgICAgICAgICAgICB9DQoNCiAg
ICAgICAgICAgICBmb3IgbGljIGluIHBrZ19kaWNbcGtnXVsiTElDRU5TRVMiXToNCiAgICAgICAg
ICAgICAgICAgbGljX2ZpbGUgPSBvcy5wYXRoLmpvaW4oZC5nZXRWYXIoJ0xJQ0VOU0VfRElSRUNU
T1JZJyksDQpAQCAtODksNiArMTA2LDEwIEBAIGRlZiB3cml0ZV9saWNlbnNlX2ZpbGVzKGQsIGxp
Y2Vuc2VfbWFuaWZlc3QsIHBrZ19kaWMsIHJvb3Rmcz1UcnVlKToNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImxpY2Vuc2VzIGNvbGxlY3RlZCBmb3IgcmVjaXBlICVzIg0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAlIChsaWMsIHBrZ19kaWNbcGtnXVsiUE4iXSkpDQoNCisgICAg
IyBXcml0ZSBhIGpzb24gZmlsZSBjb250YWluaW5nIHRoZSBsaWNlbnNlIGRhdGEuDQorICAgIHdp
dGggb3Blbigie30uanNvbiIuZm9ybWF0KGxpY2Vuc2VfbWFuaWZlc3QpLCAidyIpIGFzIGxpY2Vu
c2VfZmlsZV9qc29uOg0KKyAgICAgICAgbGljZW5zZV9maWxlX2pzb24ud3JpdGUoanNvbi5kdW1w
cyhqc29uX2RhdGEpKQ0KKw0KICAgICAjIFR3byBvcHRpb25zIGhlcmU6DQogICAgICMgLSBKdXN0
IGNvcHkgdGhlIG1hbmlmZXN0DQogICAgICMgLSBDb3B5IHRoZSBtYW5pZmVzdCBhbmQgdGhlIGxp
Y2Vuc2UgZGlyZWN0b3JpZXMNCi0tDQoyLjcuNA0KDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29u
dGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwg
YW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90
IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFu
eSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVt
LiBUaGFuayB5b3UuDQo=

