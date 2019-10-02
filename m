Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40094.outbound.protection.outlook.com [40.107.4.94])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB907E71B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 12:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=a9Qq5H+Rac7sHFXXTCPI9MvC+TXth5DKVc7BpSXNU5ansCDocYHdxxFT1lukKkNXV9FBUR0SPvCcnAHB6DXfUOLnk3PKGkeLQKXnVH5Tdm5lkx+0FV5li5p/Es4Jyz6QFLFRXhbM3+AB82FQDHsl7ViICQu3Jms8pzNvQ4GtEqWEtdYAi0m/a8mazJIdaVRZUNhlPPZ8wCMEPGSxcrUYLvd/Kis1c/lvpGyeUZdo0T5xNctAU4JZgpNBXF8KYWMG4ZWnK7ruP6Uabzm1CvNnL1T60vNc7vFbZz7CXV68bZjRqCxy+j93792qZlBavofhk4rPP/eknHqSF3qs1qZcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nSfSgdsNb7Qb+3jlO1Ej4Q2OUnPt82SzHYGG0S1d0/g=;
	b=XuO2m8+6/abg5ibgeieOqgFylB0eG82nA3O2zObTD7qoNjelg0NAI7EYSmjuEQOpc1n0fQVmAsKYM0jE0bmhBWQDrMXzSOYBQWOdqHcrOOTxjO0OXby9eZV70n/mkH+Jox1cYcOiOYFP1zgz4CXYrlX1V92k9TIOAsfEHim4pdi7XS5PpeVJTNw9syWptKw78HRLFXBssAEebW9Xy+ogHUzi+p5+7ysaMMfQrKFukKLvElSmIhm+CVOZ0CDxgmQXNzOGIXfZN83slBpvRpqaPBNJtEe1O+ZxrwzAvFBU1czLQoVZvIpnlrylKA///5rPhAw8fhoL09A9sBgE3ghvRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nSfSgdsNb7Qb+3jlO1Ej4Q2OUnPt82SzHYGG0S1d0/g=;
	b=EihDYioj9KLEWZ2ZYqIKy+QvU4n82xnzCu+RN/YzLXKh/QQwl0wOD8MakoBR9mbOkh7NEoh+OxXjWv+/55Q3woZEWHdTNhHdhKimuQTcDGe4NiRxDj5Saq176AzKYoWB2A64z5g//iLd1gAU8jYApPmm/Wjrj9EHLLfb4XOd834=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) by
	VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.17; Wed, 2 Oct 2019 12:12:22 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18%6]) with mapi id 15.20.2305.023;
	Wed, 2 Oct 2019 12:12:22 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] systemd: Expose resolv-conf alternative only when
	resolved is built
Thread-Index: AQHVeRqlUKpGNoQ700iXQIhKAD9POA==
Date: Wed, 2 Oct 2019 12:12:22 +0000
Message-ID: <20191002121211.11081-1-alexandre.bard@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1d::22) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:bd::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38fc579d-5705-4f26-a0a2-08d74731c7b0
x-ms-traffictypediagnostic: VI1PR06MB5261:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB526159D5B27667079B4117CF879C0@VI1PR06MB5261.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(39840400004)(136003)(366004)(376002)(189003)(199004)(26005)(186003)(2906002)(102836004)(6116002)(3846002)(386003)(486006)(6506007)(476003)(2616005)(7736002)(44832011)(305945005)(14454004)(1076003)(5660300002)(52116002)(2351001)(25786009)(316002)(508600001)(6916009)(66476007)(66946007)(64756008)(2501003)(66446008)(50226002)(8936002)(8676002)(81156014)(81166006)(36756003)(4326008)(14444005)(107886003)(99286004)(71190400001)(71200400001)(66066001)(256004)(6512007)(5640700003)(86362001)(6436002)(6486002)(66556008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5261;
	H:VI1PR06MB5261.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cniz7q+cAVaEoLkt1Ds208PGXLsEODnW8nCV2GYFaXi2xjAcWFVBBiBPaeV8DN3yRlZNxnyeAgJ+gBxdnYyNo1YR4orTX+wAxzH9rx2i1Dq4kiCBFIS73lBTRDb+P3YQ/Y9nWxpBrGVH7SgqVxBOYhSNFBzci+4DYKkJ6aScJQI2ub7kiwkoHbrN/60ASK0PfmwyHsS6VAsmtr2vFgmKbgL4EVOI86k1PCwKjYzxiky9EtGloAjEA94AKiv6HKasVaK0V9ZuQX51QNTvlnkDgayaTbuxtsArXSESb/9MqB1U0lI5Hs1hWZ2qM12RkYiC9xCjrE8pQQ+tTZWMG2MaU8Z4dHg0syCaydDRANV3H2A4bkJBdtO0W/Xi13cd5Oyn6xosrIjg5R3S10tJpoGXA04R3V8U9YnImhaoKDD6zdA=
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fc579d-5705-4f26-a0a2-08d74731c7b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 12:12:22.6704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foeph1JaYo71Jw+k1pJDOk7ArD6lXRyRzZg1SDxwJmHyb0znm9x6pk17e8jPVu5rq9OYcI8Vjjthiw13+yPx5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5261
Subject: [PATCH] systemd: Expose resolv-conf alternative only when resolved is built
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
X-List-Received-Date: Wed, 02 Oct 2019 12:12:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When systemd is built without internal resolver, it does not make
sense to expose it as a resolv-conf alternative and can even break
images where this alternative would be chosen, because of an
invalid symlink.

Signed-off-by: Alexandre Bard <alexandre.bard@netmodule.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/s=
ystemd/systemd_243.bb
index eaa12ed107..b9097593f1 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -637,7 +637,7 @@ python do_warn_musl() {
 }
 addtask warn_musl before do_configure
=20
-ALTERNATIVE_${PN} =3D "halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} =3D "halt reboot shutdown poweroff runlevel ${@bb.utils.=
contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
=20
 ALTERNATIVE_TARGET[resolv-conf] =3D "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] =3D "${sysconfdir}/resolv.conf"
--=20
2.20.1


