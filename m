Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50132.outbound.protection.outlook.com [40.107.5.132])
	by mail.openembedded.org (Postfix) with ESMTP id E64717F021
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 07:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CB//f1YZ5cqt5k9NnJn2WPmph+l5mEIgY0VECEiSxKdbekGvKjDNQQZwyShXu28oSypg+700XNipvFz9JrrwvglWEJiRco2e3udEAv+fLeImPya5TdK/rPO290Z+y6sRrVP3QiR9mf8oNRsnDvqtnZJvQiO2ghxaG8wXNCqnL1Fr3udRjUOpLvLdae1Bt9uUq4pe7yh2Hrim/2nxOgdI6DXLnJj+a9Gl1BMCsU+slP7er0VofVOWelQkELRvsIU7tMoZugejH81sP8LUlzNHvzbUDBDV1n2UlXBGLVCrQzWWUPOSqFEv+rk/QR7VIUo1x6lzl4hPFXYuTVla1O1kYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OGvJUMfOTzvvEscKW5PZauZnzY6DHaEYDaP4V9f73Uc=;
	b=Ma2pYfscS0wLn/F0/KoIOK13ZnLnxPDMvuaquv/V6K557VjfJuZxE8vnvVBCxkxaxM/PalpaKHrdMzd2YId7/EWqbYi22BDx43B9D5J/9iEgZDQu5JU65iHVfsqnuY25QKCBAqwFkdv2+lliyvLwUQsUjE838tBswsYRbFGT8J5SJ/Iloe2DUFFkWKRqqeqsVc9vH70Qacby8/ZXPR/9iE2K30O1hJR4N+PzHUQw2rG1uurpUrumd73UNH7zc7C6QPIJllV8K7xotEQ9Paggz0bOyW7rlKmS6gezc1v3XocaM3A5mYUjK57D96TgYzrtr6IhffAr8yCZM40Po4bV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OGvJUMfOTzvvEscKW5PZauZnzY6DHaEYDaP4V9f73Uc=;
	b=VoMqW119I42ohwcFoJB2NaxYiGygYOijXz+vj7NGspMk6s4YF4pMJ9J3BMJJ1nK0JQxdOo970D4OdePqSUFLPVvd4xE/WG2yhagX7nAw9MJF2snqmQRibtC4hcz/NPp2/MWKNDlzRefva24IAG5tlg9vYf/klLpY+YIEPvv8fO8=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) by
	VI1PR06MB4223.eurprd06.prod.outlook.com (20.177.56.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Fri, 4 Oct 2019 07:49:19 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18%6]) with mapi id 15.20.2305.023;
	Fri, 4 Oct 2019 07:49:19 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud][PATCH] systemd: Expose resolv-conf alternative only when
	resolved is built
Thread-Index: AQHVeog6D/dxB0xVskKN3imZJOJ1iQ==
Date: Fri, 4 Oct 2019 07:49:18 +0000
Message-ID: <20191004074848.7972-1-alexandre.bard@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: GVAP278CA0011.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:710:20::21) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:bd::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2719f32-ca4a-40f9-9b29-08d7489f5c72
x-ms-traffictypediagnostic: VI1PR06MB4223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB4223F3424A4739062E1CE3AF879E0@VI1PR06MB4223.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39830400003)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(186003)(6486002)(102836004)(5640700003)(66476007)(44832011)(99286004)(5660300002)(2906002)(6436002)(107886003)(26005)(2351001)(71190400001)(86362001)(508600001)(71200400001)(6512007)(386003)(2616005)(256004)(14444005)(36756003)(316002)(6916009)(52116002)(486006)(476003)(7736002)(8676002)(81166006)(81156014)(6116002)(3846002)(50226002)(64756008)(66066001)(66446008)(25786009)(2501003)(4326008)(305945005)(14454004)(1076003)(66946007)(66556008)(8936002)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4223;
	H:VI1PR06MB5261.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w0vI7kRfFEGTlwMsUZLGxO70kLY2swREalHnGqzilLwFwTTfpMxooC81iXSzuyk2rGmuXlw48xtp8nk1WU+JeSfyCtOx3NnIKSaa3zhcTvHITWua1zOajfn5nfAcmyHs5flKOo9bIAzvbZL6Savu+uQOhFsZspBwpMWbI87l50+F4p2p+zPhLiG+TH7pCHwCTAg0FkJPhhHGQJIJ+noWUW4KS5UU8m05q/m2Tnen+ibio4tZT+lRIVb+rsjU8K5rdknUAk+VBWIWhrfC36gUA5J8kiBp/fri7i/cZ9j1vMqlmlsIvxzT0V02lMbPmOWOXTD67inOBegFk9uubCe8giBeDtnxOjYivd6AFCy6S0ENf0IhDpoXXnIlMI8qORYD3BA0XRFMLnnv/y/tzxAiwmawx7XwsO7AjXo04k5+PyU=
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2719f32-ca4a-40f9-9b29-08d7489f5c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:49:18.9086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svrQ6S4jo6SyZvJSFMXgh12pohE5gRg1WvfsohCI1ufC/6QJOyEa3c5ywyfogSPH4bwKZLnH6yLcr8bxaMO4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4223
Cc: Alexandre Bard <Alexandre.Bard@netmodule.com>
Subject: [thud][PATCH] systemd: Expose resolv-conf alternative only when resolved is built
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
X-List-Received-Date: Fri, 04 Oct 2019 07:49:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When systemd is built without internal resolver, it does not make
sense to expose it as a resolv-conf alternative and can even break
images where this alternative would be chosen, because of an
invalid symlink.

Signed-off-by: Alexandre Bard <alexandre.bard@netmodule.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/s=
ystemd/systemd_239.bb
index 7fbd64ced7..0a3492f5b8 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -614,7 +614,7 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
-ALTERNATIVE_${PN} =3D "halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} =3D "halt reboot shutdown poweroff runlevel ${@bb.utils.=
contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
=20
 ALTERNATIVE_TARGET[resolv-conf] =3D "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] =3D "${sysconfdir}/resolv.conf"
--=20
2.20.1


