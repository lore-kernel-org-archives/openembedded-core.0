Return-Path: <Rob.Walton@arm.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
	by mail.openembedded.org (Postfix) with ESMTP id BEECC7D279
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector2-armh-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4kctDOSTHvm/652Aqhm3NQe1bCKxArDqXb8k19B923w=;
	b=BfRYeJZ3pLturqnl3nx93o+Dhd90mJtExPgePKrQrzL06dbZpXGWaBx806piuw8VA9bQjCO7pXnb4oN03Zg+nDeMRSJIpxOG5C9sS3+kmpx6sG+w1NC0Ni4YH+NHpRoKMrXddlp1akSG+8AiLpOYE1smib5+Hp67mDKqWjg0D6E=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB3863.eurprd08.prod.outlook.com (20.178.90.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1900.16; Sun, 19 May 2019 18:21:13 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1900.010;
	Sun, 19 May 2019 18:21:13 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
Thread-Index: AQHVDm+kQ+RwFmqtKkSXE2t4dM6odQ==
Date: Sun, 19 May 2019 18:21:13 +0000
Message-ID: <1558290038-110415-2-git-send-email-rob.walton@arm.com>
References: <1558290038-110415-1-git-send-email-rob.walton@arm.com>
In-Reply-To: <1558290038-110415-1-git-send-email-rob.walton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0431.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:a0::35) To AM6PR08MB3685.eurprd08.prod.outlook.com
	(2603:10a6:20b:6f::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf1414bb-0c23-47da-383c-08d6dc86c602
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB3863; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:|AM6PR08MB3863:|AM6PR08MB3863:|AM6PR08MB3863:
x-microsoft-antispam-prvs: <AM6PR08MB38632D92E0DAAAF9CA15C93D95050@AM6PR08MB3863.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00429279BA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(366004)(396003)(346002)(39850400004)(376002)(189003)(199004)(40434004)(66066001)(4326008)(71190400001)(305945005)(7736002)(72206003)(53936002)(71200400001)(256004)(3846002)(6116002)(5024004)(14444005)(86362001)(36756003)(2351001)(8676002)(81156014)(81166006)(25786009)(316002)(6916009)(4744005)(14454004)(66476007)(5660300002)(8936002)(478600001)(68736007)(73956011)(486006)(50226002)(2501003)(6512007)(2616005)(446003)(11346002)(66446008)(66946007)(476003)(66556008)(64756008)(2906002)(102836004)(26005)(6506007)(52116002)(6436002)(386003)(5640700003)(99286004)(76176011)(44832011)(186003)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3863;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8HQ8QShI0ppyyjqHaJ0Tga11DEjHuWNz77mD7BxHMo1kLJ8sWCD20FLw1T8yE86h+N3fNskSYb78xXQBqYoDdbdxRobaKtO4rWSjSghbXBi43x3xz9odiadp/TmKj6GzK7tqlao/ttzUzqCTQs0UOuSMPbUMICvkfgLY23Xz9K5PjNdebtQmR/LoTS/ApSw8msUkdBaU+toTMFDewr3lZWpG9bgNvKuWvci/pheBuwE62aeoV6DsN7Z4JWiT7iM+j/4+NMAjWbUu/0+w/xVU+CQmaSDDQLVSCLsLYxA0BkPZXAfL7AoJ0J6fqRc86lSg0A1Tyq7B+keLNGAV7H0RVe6YI7tSy/m0Om8hsVRVCGjIWPFyLVNVk/duOjZ7KTjHyAYhVHcKcckkDUG+JoHx73eqj4JgbfKBXYZZRPWCoj0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1414bb-0c23-47da-383c-08d6dc86c602
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2019 18:21:13.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
X-OriginatorOrg: arm.com
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
X-List-Received-Date: Mon, 20 May 2019 02:52:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RW1pdCB0aGUgY29udGVudHMgb2YgSE9NRVBBR0UgaW4gdGhlIGV4dHJhIHBrZ2RhdGEuIFRoaXMg
aXMgdXNlZnVsDQppbmZvcm1hdGlvbiB0byBoYXZlIHdoZW4gY3JlYXRpbmcgbGljZW5zZSBtYW5p
ZmVzdHMuDQotLS0NCiBtZXRhL2NsYXNzZXMvcGFja2FnZS5iYmNsYXNzIHwgMSArDQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvcGFj
a2FnZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KaW5kZXggNGMwYTg1
OS4uYTA4YWVmZSAxMDA2NDQNCi0tLSBhL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MNCisr
KyBiL21ldGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MNCkBAIC0xNDU4LDYgKzE0NTgsNyBAQCBm
aQ0KICAgICAgICAgd3JpdGVfaWZfZXhpc3RzKHNmLCBwa2csICdQS0dSJykNCiAgICAgICAgIHdy
aXRlX2lmX2V4aXN0cyhzZiwgcGtnLCAnTElDRU5TRScpDQogICAgICAgICB3cml0ZV9pZl9leGlz
dHMoc2YsIHBrZywgJ0RFU0NSSVBUSU9OJykNCisgICAgICAgIHdyaXRlX2lmX2V4aXN0cyhzZiwg
cGtnLCAnSE9NRVBBR0UnKQ0KICAgICAgICAgd3JpdGVfaWZfZXhpc3RzKHNmLCBwa2csICdTVU1N
QVJZJykNCiAgICAgICAgIHdyaXRlX2lmX2V4aXN0cyhzZiwgcGtnLCAnUkRFUEVORFMnKQ0KICAg
ICAgICAgcnByb3YgPSB3cml0ZV9pZl9leGlzdHMoc2YsIHBrZywgJ1JQUk9WSURFUycpDQotLQ0K
Mi43LjQNCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5k
IGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxl
Z2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMg
dG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3Ig
Y29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

