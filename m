Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50125.outbound.protection.outlook.com [40.107.5.125])
	by mail.openembedded.org (Postfix) with ESMTP id 527DF6D409
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 07:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=PkeTG9DpEDOmb1vEEAVOAbtC7exkqEojHxTSJzdUWQSJsiPL91PE9nHH7WG6lWNd4el7loJjju8a6FWCFNYAJdpFlyqdCuL+u9cVBfe4c7UtwS2mMQ+ux6vZyuUaDV9IV9U677B1sUmbO1bSDF4GMdvgdkwA8gdH25iPylpr9Fnkg8yOq5XFGQfykZLzbtIxlht6n3RByZjCgTYP8L2xFF3oLalrUp300UcneyqDejRbF8TLXGMJCtjl7YkAyijR4u5MLRFr3d8Lw3IskI0OQO6DlgQL1upM52A5mfVJBRZ8hINNkdiPvnxmuoRaqXln4KifkWq3CJNZeHUAMd0d6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KUOj85MFLi20i9n1ozk1Ry76p4zkKTM2Zi4JuO/gfow=;
	b=l3VAZJBxX8CgEsN2iedkaLnClfuk4RJ4dmFug8yLi522SQ1MCrbvgJD4+nh/EGmdO6PYWKWTVdoqHTJb5Z+BlmUUwm5615xzjlf127OkPH6aYc/CClD+/dVZ9N9mn58xJTCg4zIrr/1mWyLbaVq2SwTHaUat5I6x7HnPLd5Y+/RfIBEKPJYttyK0BOPlwaUI8XZb9EMZVXo5cg+LO1Ar082w7BbzcHfEi88qGFWKYTnqjwtxu9QdN+96eJU1+o06aPOXWwGTt9ZMuzchVxT0ffa+tQ7xSuEf1wnExe6xyeISDOai1GIbn7joWjUjWB0+Om/lYgaOeqvq5Yo7OOQHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KUOj85MFLi20i9n1ozk1Ry76p4zkKTM2Zi4JuO/gfow=;
	b=Xf6754mn3CmTC1rBJSq3c5Ahr78PKdWuqvHFxQ3Lr4WmCkfjrRi16uTuMJI6IN6bKnXn5Nm5fwgxViNCoanLSFSiEqcjaop0gnJeLIx2R/y4GeHjgdIimhwhpFi56bUCcBgWy2Cj+3b/YLR4tgR/4Y4ICaFbtKJbDwuoXGjNpAE=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.15.83) by
	VI1PR06MB4223.eurprd06.prod.outlook.com (20.177.56.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Fri, 4 Oct 2019 07:47:15 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::7d7a:b7e4:8f0d:be18%6]) with mapi id 15.20.2305.023;
	Fri, 4 Oct 2019 07:47:15 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] systemd: Expose resolv-conf alternative only
	when resolved is built
Thread-Index: AQHVeofweb8k+AGR0U6T76cEDa6uUg==
Date: Fri, 4 Oct 2019 07:47:15 +0000
Message-ID: <20191004074659.7538-1-alexandre.bard@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: PR2PR09CA0016.eurprd09.prod.outlook.com
	(2603:10a6:101:16::28) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:bd::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e08b9fa2-b317-4d75-b052-08d7489f1308
x-ms-traffictypediagnostic: VI1PR06MB4223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB4223A8C507CBD8BE915CF2B8879E0@VI1PR06MB4223.eurprd06.prod.outlook.com>
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
x-microsoft-antispam-message-info: jTJ+lulq0Pz2cmToQW5w3o6bLjCy+rxn9J7r1fMtDOrAB23zm9g6s+qATV/UbNLVu0ycxfz1j5O+zMRrqGEORB3NgJDXj3yFadJZLYrglYFMkZepeb3vyx0VhbLqZIJJpl8rZFlxztg/WFDNwtHGi5QkviMpNAp4YnDx2P9ysV0zVxCUTZF/LgD1NBUaNnOWCVyFqd5lZx4tSQo97G7JFb878CEmgc24IKP+DMvji60EcQzoIWTzSElRmnNwF0ERkso7OBH/QQajdp4yu2rR+sCafLjVqYNc1mt3eFf/mCDFJdFcUGoU5dTjrWT+/MVXhP78XLUL1cT0B2dasKdYf90t6QV77K+VlvyS33yZ2Op/fKJ/hdKgKKItzfUOP1bGoE2RV2KUspOwD/aYSszB5mOyEtwqWgcjS8I3OyZq61I=
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08b9fa2-b317-4d75-b052-08d7489f1308
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:47:15.4799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8kvA5bs+Objehigv4eDmTdAQ5N7J8qPKv6X5cIqSqki6D0q88e5UcP6vGJdfdD31nAp+rmPjVBWf1adyPr5jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4223
Cc: Alexandre Bard <Alexandre.Bard@netmodule.com>
Subject: [warrior][PATCH] systemd: Expose resolv-conf alternative only when resolved is built
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
X-List-Received-Date: Fri, 04 Oct 2019 07:47:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When systemd is built without internal resolver, it does not make
sense to expose it as a resolv-conf alternative and can even break
images where this alternative would be chosen, because of an
invalid symlink.

Signed-off-by: Alexandre Bard <alexandre.bard@netmodule.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/s=
ystemd/systemd_241.bb
index eb3242d624..0add384a7b 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -601,7 +601,7 @@ python __anonymous() {
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


