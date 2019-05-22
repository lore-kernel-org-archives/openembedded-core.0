Return-Path: <Rob.Walton@arm.com>
X-Greylist: delayed 9620 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 May 2019 05:16:43 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
	by mail.openembedded.org (Postfix) with ESMTP id 64A297CBDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector2-armh-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zySCthuGFz1I8U7Q2xX+DPiOzHOSmbGkoOrwNzhWjOc=;
	b=pC8p0SfRMHik6cAOLDMr7oc3e2I58Kf8xqeZ3QMImFuEsWkJ8qIpU7sHz35pikvL9Fl0ioE6Inbcsq0C0uC9ILhMtoEHxbiEVkk/+7/McIbfeq4qYL4xILQ3hJ3Fa8J2C7LG6UG5cOPSPYs0smGRl3wQ8qMM/MuCxh9OTn/WEAE=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB5064.eurprd08.prod.outlook.com (10.255.120.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.16; Wed, 22 May 2019 12:44:37 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1922.016;
	Wed, 22 May 2019 12:44:37 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
Thread-Index: AQHVEJwdeDxIADRRKEmYI513wzcNyw==
Date: Wed, 22 May 2019 12:44:37 +0000
Message-ID: <1558529060-79451-2-git-send-email-rob.walton@arm.com>
References: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
In-Reply-To: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
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
x-ms-office365-filtering-correlation-id: 267e14d5-e077-45a5-1a9f-08d6deb33fbb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB5064; 
x-ms-traffictypediagnostic: AM6PR08MB5064:
x-microsoft-antispam-prvs: <AM6PR08MB5064C408F5E4F4E2FE68D54A95000@AM6PR08MB5064.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(396003)(346002)(136003)(39860400002)(40434004)(189003)(199004)(72206003)(44832011)(446003)(476003)(486006)(14454004)(186003)(66066001)(66476007)(66556008)(64756008)(66446008)(11346002)(26005)(86362001)(2906002)(316002)(68736007)(66946007)(73956011)(2616005)(53936002)(5024004)(14444005)(4326008)(386003)(6506007)(2351001)(76176011)(305945005)(5640700003)(478600001)(7736002)(6512007)(36756003)(256004)(71200400001)(71190400001)(102836004)(6916009)(52116002)(25786009)(8676002)(50226002)(6116002)(6436002)(99286004)(8936002)(81166006)(6486002)(5660300002)(3846002)(2501003)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5064;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6YaT8SrIrE6mUjF0zGWQfifJlrDAWRIPQdj+n23vWC07h9zwQDarRrcHf0X29TSJ0pg3mDa/eSSCu3H6cw6o7PXImRBgerBWpbry2cEgX+WiTaNdShCpXKW1Le2bv9qzvx2JF+ogHS+Btfg1lwIvivtkoIIiS74NiehdX+fNdPr1fkkhR5IRM1LuT6BZ87XSgv3aTuHY24DRkCBqkFEz5VcJ1FPjTYAjeNw2Wz/1tNaSxK49PAV+hAMAXZg8PXXRHnOsxXzRPFvbaUMexp4M7X1WY5FT94igMy4Ym16RV6l/J42wqXFDhqmNvCjRtifpASUcQwZQqUvMDU+Wxre8ZrV+QvMUywrb9VnEsrtvsthtPShIUBtF9Uh6F7qFKNNtFwNHch9EJWL2ztwr4LvfwkjmUJxwucET/67pQWTRmn4=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e14d5-e077-45a5-1a9f-08d6deb33fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 12:44:37.2561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rob.Walton@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5064
Subject: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
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
X-List-Received-Date: Thu, 23 May 2019 05:16:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RW1pdCB0aGUgY29udGVudHMgb2YgSE9NRVBBR0UgaW4gdGhlIGV4dHJhIHBrZ2RhdGEuIFRoaXMg
aXMgdXNlZnVsDQppbmZvcm1hdGlvbiB0byBoYXZlIHdoZW4gY3JlYXRpbmcgbGljZW5zZSBtYW5p
ZmVzdHMuDQoNClNpZ25lZC1vZmYtYnk6IFJvYiBXYWx0b24gPHJvYi53YWx0b25AYXJtLmNvbT4N
Ci0tLQ0KIG1ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MgfCAxICsNCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJi
Y2xhc3MgYi9tZXRhL2NsYXNzZXMvcGFja2FnZS5iYmNsYXNzDQppbmRleCA0YzBhODU5Li5hMDhh
ZWZlIDEwMDY0NA0KLS0tIGEvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KKysrIGIvbWV0
YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KQEAgLTE0NTgsNiArMTQ1OCw3IEBAIGZpDQogICAg
ICAgICB3cml0ZV9pZl9leGlzdHMoc2YsIHBrZywgJ1BLR1InKQ0KICAgICAgICAgd3JpdGVfaWZf
ZXhpc3RzKHNmLCBwa2csICdMSUNFTlNFJykNCiAgICAgICAgIHdyaXRlX2lmX2V4aXN0cyhzZiwg
cGtnLCAnREVTQ1JJUFRJT04nKQ0KKyAgICAgICAgd3JpdGVfaWZfZXhpc3RzKHNmLCBwa2csICdI
T01FUEFHRScpDQogICAgICAgICB3cml0ZV9pZl9leGlzdHMoc2YsIHBrZywgJ1NVTU1BUlknKQ0K
ICAgICAgICAgd3JpdGVfaWZfZXhpc3RzKHNmLCBwa2csICdSREVQRU5EUycpDQogICAgICAgICBy
cHJvdiA9IHdyaXRlX2lmX2V4aXN0cyhzZiwgcGtnLCAnUlBST1ZJREVTJykNCi0tDQoyLjcuNA0K
DQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkg
b3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRo
ZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=

