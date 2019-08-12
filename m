Return-Path: <JOFR@foss.dk>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70E557C79F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 10:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=n0mwqVdxjvzME0e1d77VGp+Ku2iA9a77jAL+faoq/WrGGPMwOUapY6ONGlpiQh7UkEpviloC40Cw2b7tm7xvp9PnfJ2s2ZImkbKkzGch+4YtybCnpe6WVBldWJPYJdBYe/GIUZdKL0kBjDZfH46sxG4x5wqQ/mxM0CkoHXBVPUbeHSv9+/lxNpRvnSp8e0JqkEI5nT1SB3txApeYLWMSbL0dlqf8/hwD0wAglzXf5mbtLuTVs72tT/Z1zr9AN7/ji/GbKcBIvmhZxPOoH277fYcQqyYowJFA3MPQJK3JnroMNpXDhyJc+PhbkNlbiKgnw54K2jQeyR8FtiBHttgSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8UwfkmKnrPZfTIGYFDmAaxusn+7IOBRBMMgWP4zuMBs=;
	b=FFow58Qh+IvC88Xmh3MRk7O1W7pY/K4GNVQ/m9oRjCkPW/Pa0nKFcZEify8SVPcUi5yYRiL6/ud7MyQ1DSgrUCoZwb3iSK0AHDzFuAClV3XJGddjm53ptmyFDS7YSSaPko3GBe6nnlmCpybk3I0Yfd5d4O4W2pw/z0bRJAyrPQTVZ3jeC6aPPobmbxOmQQ4Gsdlm2o2K7K3N8YMhIYG4kzfLKL50Nm+rYpolX8UMG6aNwAKD3nqs2pBroET93x0JZKGDyi+J4qY0RXRYDYoEVdxR0C1jxVqlZtN+gH9d8+YLy8mHWZe7j36zSjj8+zDZIMDJV/B1jF4+j2+diFIHog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=foss.dk; dmarc=pass action=none header.from=foss.dk;
	dkim=pass header.d=foss.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.dk; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8UwfkmKnrPZfTIGYFDmAaxusn+7IOBRBMMgWP4zuMBs=;
	b=Ior0X/SYSMwLkxuf9hUKAOAR8BDJg3xv7jrHLvWWyfAcVXquWnJlBSjOzY229oQ3R0llWb7kciQ/2vY2ZGOA+disRvDnV5Lqn0bg1FNIzfNgLqLiWSeeuewUzg6ehfFYqu43qztzjxkAzRcotEuOrSylSYFUWlWuk1uSvpG7Onc=
Received: from AM4PR08MB2787.eurprd08.prod.outlook.com (10.171.191.17) by
	AM4PR08MB2804.eurprd08.prod.outlook.com (10.171.191.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.20; Mon, 12 Aug 2019 10:27:07 +0000
Received: from AM4PR08MB2787.eurprd08.prod.outlook.com
	([fe80::f878:f317:1667:7150]) by
	AM4PR08MB2787.eurprd08.prod.outlook.com
	([fe80::f878:f317:1667:7150%5]) with mapi id 15.20.2157.022;
	Mon, 12 Aug 2019 10:27:07 +0000
From: Johann Fridriksson <JOFR@foss.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] ruby: Adding zlib-native to native dependencies
Thread-Index: AQHVUPh+LsQ0Hh41FUOfYzwldKyOqw==
Date: Mon, 12 Aug 2019 10:27:07 +0000
Message-ID: <20190812102655.16834-1-jofr@foss.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.182.166.3]
x-clientproxiedby: AM0PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:208:17c::19) To AM4PR08MB2787.eurprd08.prod.outlook.com
	(2603:10a6:205:d::17)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=JOFR@foss.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 542fceed-bb0a-4004-efab-08d71f0fa077
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM4PR08MB2804; 
x-ms-traffictypediagnostic: AM4PR08MB2804:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM4PR08MB280413865CDB0F7DB2145EE9C3D30@AM4PR08MB2804.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(39850400004)(396003)(366004)(189003)(199004)(8936002)(50226002)(8976002)(66574012)(1076003)(8676002)(7736002)(4744005)(2616005)(80792005)(64756008)(66556008)(66476007)(476003)(99286004)(6306002)(6512007)(66446008)(66946007)(71190400001)(71200400001)(486006)(2906002)(5660300002)(2501003)(4326008)(386003)(86362001)(6506007)(25786009)(14454004)(52116002)(6116002)(6916009)(256004)(107886003)(14444005)(36756003)(478600001)(2351001)(102836004)(316002)(66066001)(6486002)(81156014)(305945005)(81166006)(26005)(6436002)(5640700003)(53936002)(186003)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2804;
	H:AM4PR08MB2787.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: foss.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DhB5K5kZv74E+4BgnDFvIZR8S3+53LeB+ZByhZtXIzdyYrEtuKncY28cSsZ1O8QU/BbDhB+SLWVhdJnBJWIwfc0zLbedymp9SuUGd4jBNfnzDbfw49uZDfZQtbI2/WWS6j7X83BY6hl7V9ijrsLQulJagGQLCCmJ9YtyjltYTxGElWWjv6dKL+CTp2JJATMYU37J30PrtUZrTMUtVcnGL8DgUZZ13Zb4FY2ipHXKSV630sMrr2sQsBQc76AWNPvgYRfPhLzyGeJtA6kWGMMs3dIBRFu+mRArZZFyvnsRzAvVsLrGt5MiFE8Ykc/6mBSlCJT2VcbiHjDmhfGsvh+JHDYaAkocoBszkdtxhhj4ktpbIjxhlMR+ym7UYlxtJ7H2eMHoK8ZrOm/yPdzontdzdUcS/BefmcyWLRcD1PHxUQg=
MIME-Version: 1.0
X-OriginatorOrg: foss.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 542fceed-bb0a-4004-efab-08d71f0fa077
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 10:27:07.5248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c239cf4a-b8ff-44ff-98ee-49f2a96d6ff1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3j9zVOaoml5IpFoQbbAIjiSvm8jZJ34wCPBZcUwoIHd2G4l/WGG2RahR8Ez79Gz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2804
Subject: [PATCH] ruby: Adding zlib-native to native dependencies
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
X-List-Received-Date: Mon, 12 Aug 2019 10:27:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E45AD1E807511439A812FC1D576E563@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogSsOzaGFubiBGcmnDsHJpa3Nzb24gPGpvZnJAZm9zcy5kaz4NCi0tLQ0K
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkuaW5jIHwgMiArLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LmluYw0KaW5kZXggMWVjZDA4N2Q3ZC4uYTk4MjQ5YWZiZCAxMDA2NDQNCi0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkuaW5jDQorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LmluYw0KQEAgLTE1LDcgKzE1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJcDQogIg0KIA0KIERFUEVORFMgPSAicnVieS1uYXRpdmUgemxpYiBvcGVuc3NsIHRjbCBsaWJ5
YW1sIGdkYm0gcmVhZGxpbmUgbGliZmZpIg0KLURFUEVORFNfY2xhc3MtbmF0aXZlID0gIm9wZW5z
c2wtbmF0aXZlIGxpYnlhbWwtbmF0aXZlIHJlYWRsaW5lLW5hdGl2ZSINCitERVBFTkRTX2NsYXNz
LW5hdGl2ZSA9ICJvcGVuc3NsLW5hdGl2ZSBsaWJ5YW1sLW5hdGl2ZSByZWFkbGluZS1uYXRpdmUg
emxpYi1uYXRpdmUiDQogDQogU0hSVF9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIk
e1BWfSIsIDIpfSINCiBTUkNfVVJJID0gImh0dHA6Ly9jYWNoZS5ydWJ5LWxhbmcub3JnL3B1Yi9y
dWJ5LyR7U0hSVF9WRVJ9L3J1YnktJHtQVn0udGFyLmd6IFwNCi0tIA0KMi4xNy4xDQoNCg==

