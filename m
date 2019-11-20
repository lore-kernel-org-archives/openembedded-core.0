Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130081.outbound.protection.outlook.com [40.107.13.81])
	by mail.openembedded.org (Postfix) with ESMTP id 666417F833
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RhRDVVbiu4sQGpDbOPajoKTUbyK63ikR+u6rGzTPtwKZxB+hmA/7RG9jH15Fv+97msGAVCU0DMdE3ccuNQRgpunB/NPq/5pqSIMqrYcM9wCYQNyDpfuR8BVxLOXlZsV1t+REYw5asgJvtAJdd4RQtaRS0viCvIS/OYL0wqCD5Tl94G/6tkWtowyKewfgpG+koSUAfTgEBynTC1BKMmgJhHj6z45UsRF+6bM9EduFHjBL2bbIixdeheNkMB0IcQXh4+8fvFRI0fpr/e1VnBbdQouPLINBY70ldtFOfCysGUYo0g8D4hsq5cAKhNgvGzVn77uR9eWI5/XffDe6bPiNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kyhJinzXBVJIZN82y3YxF+surkrbRLakCFCh/ahIS1k=;
	b=mRHWT7GdClKVk9cYdYhAxmstLefAHjidzPW7JRycpZfK7swpRIiFvgU55uVIk+HndhBQgb3D2t4zJEjd/zDy0Wl/84FN0PGXAQGBdkaDw/cogoJazUMR7qHoEpzHnKn5gXtBS0KQMSWOp3CeFNhFOG4jV3RgeTZegXursxodCmbu0N5xFpPKBg0kwrrR8dHEE48c/kGVUFLzkKTaRDjMBjA6GdnSHMhfWJ80Dk0XQMHlLYhFujHW7d4JxlBXgGioDlqBif4zMspuzb5+lAZ9k+hVf2HtWIWYFzJY1yv1/Kq2LoEr1dB43rkOIQo5Fqt/VyvyQCFSdv4fYC11r0qYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kyhJinzXBVJIZN82y3YxF+surkrbRLakCFCh/ahIS1k=;
	b=f3vXm90lGML2JOQy9ZaraW273wGcy5FPRYN1BnqEUhy1oiq+TqQo1pdp7dkJ1pVnzO4WNNdW+/zkpxwSCCZaIoTlGaOa67etRUGLB4Z2tlmxc9LdfPrLlH8vScBt9zV6k2B0qAe/8qsoKTTkXlHUL4s+R4mBEZennfevMOzOb1k=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6350.eurprd04.prod.outlook.com (20.179.234.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.30; Wed, 20 Nov 2019 19:25:45 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::45c6:6829:40a0:107]) by VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::45c6:6829:40a0:107%7]) with mapi id 15.20.2474.015;
	Wed, 20 Nov 2019 19:25:44 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] devtool/standard.py: Allow recipe to disable
	menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajFw==
Date: Wed, 20 Nov 2019 19:25:44 +0000
Message-ID: <20191120192419.7352-1-tom.hochstein@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR10CA0018.namprd10.prod.outlook.com
	(2603:10b6:5:60::31) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5aa391ed-f886-4536-385f-08d76def7068
x-ms-traffictypediagnostic: VE1PR04MB6350:|VE1PR04MB6350:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB63507CB93A6DA351423BE75CE24F0@VE1PR04MB6350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(189003)(199004)(99286004)(66476007)(66066001)(52116002)(6506007)(386003)(81166006)(8936002)(81156014)(25786009)(256004)(478600001)(966005)(50226002)(71200400001)(8676002)(71190400001)(26005)(186003)(2616005)(102836004)(316002)(305945005)(86362001)(1076003)(476003)(2501003)(7736002)(486006)(3846002)(2906002)(6116002)(66556008)(64756008)(5660300002)(44832011)(36756003)(66946007)(14454004)(6916009)(4326008)(6486002)(2351001)(6306002)(6512007)(6436002)(66446008)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6350;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tPZDn4a+eZ9TNR5YrwnIx8bJMToPqBlIHXsCFX46MZCetAbng3RO5JnjStN0cXk8eEN2fyep8QIvYE4J57iXWB9on2gmxyCU8sRxGwOUNB5k4scB9NBq8X6so55ESUjF5Px/cpWujDzotQs5UG2rOczriLle5PqDMZwM4AW1z0U4wGWpt2piLbvH9HeuRe4dQP/iYKtkFdJ8AO1Kbod6UZ8hPf7iX5cMni2gdhXyqr4UzLye3KFd0EkN0Vf8yPFjyj/gxm7H9UJuPq93p7rZ6Xb0tXKxoYykig0FMQtmfD1PN87OEttJ/L+/o7NoliIrN0zA6lXzsVVgZXTabQnrwAw9S99XJo3GyLtxdUplM+FYQIjUjVmiTvbnY0o513gXCMMA74FB+VbJKKwHqCCOjUUP97ZBfVPsaibxbRRA5rcF9EYCB43UvlfYtcJG+quw3/t8lADT8Ef3jQpcTDSgmzNLM+s4nt6glL6dNSIDzpw=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa391ed-f886-4536-385f-08d76def7068
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 19:25:44.9222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: up5YWOql1vVRGG2zQS6DA+UKIyzmoOBnsXZdPuWErDLT2Y33nS3TA2mV52hE3a7vVOIqjlZZ+Zwo2VDuUAzXVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6350
Subject: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Wed, 20 Nov 2019 19:25:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

u-boot.inc supports u-boot recipes with or without menuconfig [1].
However, running devtool on a u-boot recipe that does not support menuconfi=
g
results in an error:

cp: cannot stat '/home/r60874/upstream/fsl-xwayland/tmp/work/imx8mmevk-fsl-=
linux/u-boot-imx/2018.03-r0/u-boot-imx-2018.03//.config': No such file or d=
irectory

The problem is the devtool logic assumes that any recipe with a do_menuconf=
ig task
will generate a .config in do_configure().

Fix the problem by removing the assumption with a flag that the recipe can =
control,
like this:

do_configure() {
    if [ menuconfig-supported ]; then
        ...
    else
        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
    fi
}

[1] https://github.com/openembedded/openembedded-core/commit/11278e3b2c75be=
80645b9841763a97dbb35daadc

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 scripts/lib/devtool/standard.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 8d9c1a3022..66bd1415c3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -940,8 +940,10 @@ def modify(args, config, basepath, workspace):
                         '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure_append() {\n'
-                '    cp ${B}/.config ${S}/.config.baseline\n'
-                '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
+                '        cp ${B}/.config ${S}/.config.baseline\n'
+                '        ln -sfT ${B}/.config ${S}/.config.new\n'
+                '    fi\n'
                 '}\n')
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
--=20
2.17.1


