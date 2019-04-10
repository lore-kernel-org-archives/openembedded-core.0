Return-Path: <prvs=996be2310=Alistair.Francis@wdc.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Apr 2019 17:30:28 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 16B307D8CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554917431; x=1586453431;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=89vAIifbaCPk2AEfe1nrOPYdCkU7uBsBrgxUB7OV87U=;
	b=JfkZn7IPypFoA111tyAkh0kfG3AnnMxVdzUOkp7ltr3CLZaITGWx1OaK
	iJSgvOrQrzs3pYZwwpQbJNP2CVoPLiauyXQSbx+6NshmcxNgWSSI/c1o/
	7AJOWl+Mpunmr4rjs4u4QEF46BD0/tEIPWBFyH04n3FZxIPn+qxt7Q1jU
	GEF/RRkJK+t6SQ1Miykig6irrmbmZc0/3pD3OnuJLVEMWCCevJCgHtYro
	mpxpgaL7V6zlQZGUqe5tpeef6T2hibfpNeH2QPpEqAkABsrBnmmF1APYP
	rkMRWNUANHAOJaU3K769DULLagYRelBrVRKJTU6QTwufUbUjwr14jOW7P w==;
X-IronPort-AV: E=Sophos;i="5.60,334,1549900800"; d="scan'208";a="107174168"
Received: from mail-bn3nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.58])
	by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 01:23:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=89vAIifbaCPk2AEfe1nrOPYdCkU7uBsBrgxUB7OV87U=;
	b=nXLbj0nT89F27B6KxHLm3Xc3cQqVsY4oc4sn6ZIyntZEymNncSr29fpKM0XMgYl/z6G9wuoMmdnCo+N0cBZmwwBSqeltiXRmib3CLg3CE8uvPbxpj8NnzF7R4xJ8rLKdg2MKuruCminio5iFXoHqizYlfa1zkRQ6hlRSg9g4tnU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5013.namprd04.prod.outlook.com (52.135.234.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.21; Wed, 10 Apr 2019 17:23:09 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1771.021;
	Wed, 10 Apr 2019 17:23:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] u-boot: Upgrade from 2019.01 to 2019.04
Thread-Index: AQHU78IRms2092dF6Ui6rgmc/QyA6A==
Date: Wed, 10 Apr 2019 17:23:09 +0000
Message-ID: <20190410172152.13509-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0073.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::14) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4701177-fd78-4df1-8bb9-08d6bdd93384
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5013; 
x-ms-traffictypediagnostic: BYAPR04MB5013:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB50132E818FF9A2E2EFDA9B5D902E0@BYAPR04MB5013.namprd04.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(5640700003)(186003)(36756003)(86362001)(52116002)(4326008)(2906002)(66066001)(102836004)(386003)(6506007)(26005)(44832011)(99286004)(256004)(6512007)(54906003)(97736004)(1076003)(5660300002)(50226002)(6436002)(6116002)(6486002)(3846002)(476003)(53936002)(2616005)(14444005)(486006)(106356001)(2351001)(25786009)(6916009)(72206003)(105586002)(2501003)(305945005)(7736002)(8936002)(81166006)(81156014)(14454004)(68736007)(478600001)(8676002)(71190400001)(71200400001)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5013;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m9yNh9qrVYzHw9Ft/K1RFBOdDmpfZC/p2SU9tz38r13YXO2xKSvPUtu73U1Z7VrBElT8+D4vKNZsvxSRR9JvyT8tx8exkTjzFuXqrIufk2QG1/561T+4yW+nWdEst4X9cnHKZ2r111rZC7aUm/YhkHxmnV2H8jrc+kWWZ589VQ6rwBpuJZGfjzHNkbQ8qlC4b89eR5O+UW5/eA0Otx9O2WY6W/FrnypBJRiPtS5imxL3+kVjER+mFKmS69n/Iq8RE1Ho2U52gdL5QLMss9yAZ+Wkg2Hlfo+/DpfNIY56doOyGqMqUmJIOnR0AKQh7cMqS21p5HAchEIzoMTbO6CABHkbWrlcm+xJFG0cvaC9zpgXYpGvZxf22/z3UesVZ/hRZCoXLqqs1f8jkIvbNg8GOYLxQzAx6jsITYkHs1qlAeA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4701177-fd78-4df1-8bb9-08d6bdd93384
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 17:23:09.3764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5013
Subject: [PATCH] u-boot: Upgrade from 2019.01 to 2019.04
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
X-List-Received-Date: Wed, 10 Apr 2019 17:30:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQ0KIC4uLi97dS1ib290LWZ3LXV0aWxzXzIwMTkuMDEuYmIg
PT4gdS1ib290LWZ3LXV0aWxzXzIwMTkuMDQuYmJ9ICB8IDANCiAuLi4vdS1ib290L3t1LWJvb3Qt
dG9vbHNfMjAxOS4wMS5iYiA9PiB1LWJvb3QtdG9vbHNfMjAxOS4wNC5iYn0gfCAwDQogLi4uL3Jl
Y2lwZXMtYnNwL3UtYm9vdC97dS1ib290XzIwMTkuMDEuYmIgPT4gdS1ib290XzIwMTkuMDQuYmJ9
IHwgMA0KIDQgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC91LWJvb3Qve3UtYm9vdC1mdy11dGlsc18yMDE5LjAxLmJi
ID0+IHUtYm9vdC1mdy11dGlsc18yMDE5LjA0LmJifSAoMTAwJSkNCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWJzcC91LWJvb3Qve3UtYm9vdC10b29sc18yMDE5LjAxLmJiID0+IHUtYm9vdC10b29sc18y
MDE5LjA0LmJifSAoMTAwJSkNCiByZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC91LWJvb3Qve3UtYm9v
dF8yMDE5LjAxLmJiID0+IHUtYm9vdF8yMDE5LjA0LmJifSAoMTAwJSkNCg0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMNCmluZGV4IGRjZmI5Y2M2M2YuLmEwMjEyZTFi
NmIgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmlu
Yw0KKysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMNCkBAIC04
LDcgKzgsNyBAQCBQRSA9ICIxIg0KIA0KICMgV2UgdXNlIHRoZSByZXZpc2lvbiBpbiBvcmRlciB0
byBhdm9pZCBoYXZpbmcgdG8gZmV0Y2ggaXQgZnJvbSB0aGUNCiAjIHJlcG8gZHVyaW5nIHBhcnNl
DQotU1JDUkVWID0gImQzNjg5MjY3ZjkyYzU5NTZlMDljYzdkMWJhYTQ3MDAxNDE2NjJiZmYiDQor
U1JDUkVWID0gIjNjOTkxNjY0NDFiZjNlYTMyNWFmMmRhODNjZmU2NTQzMGI0OWMwNjYiDQogDQog
U1JDX1VSSSA9ICJnaXQ6Ly9naXQuZGVueC5kZS91LWJvb3QuZ2l0Ig0KIA0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1mdy11dGlsc18yMDE5LjAxLmJiIGIvbWV0
YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWZ3LXV0aWxzXzIwMTkuMDQuYmINCnNpbWlsYXJp
dHkgaW5kZXggMTAwJQ0KcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290
LWZ3LXV0aWxzXzIwMTkuMDEuYmINCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91
LWJvb3QtZnctdXRpbHNfMjAxOS4wNC5iYg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3Av
dS1ib290L3UtYm9vdC10b29sc18yMDE5LjAxLmJiIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3Qv
dS1ib290LXRvb2xzXzIwMTkuMDQuYmINCnNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIwMTkuMDEuYmINCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtdG9vbHNfMjAxOS4wNC5iYg0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdF8yMDE5LjAxLmJiIGIvbWV0
YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMTkuMDQuYmINCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQ0KcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMTkuMDEu
YmINCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAxOS4wNC5iYg0K
LS0gDQoyLjIxLjANCg0K

