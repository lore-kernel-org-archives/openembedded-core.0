Return-Path: <TOl@hms.se>
X-Greylist: delayed 942 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jun 2018 11:45:11 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0076.outbound.protection.outlook.com [104.47.2.76])
	by mail.openembedded.org (Postfix) with ESMTP id 65C1D74FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k7/TIicuOVoPaYjjykpjpnJ24fQ1456sH2BEZVAcSsk=;
	b=sd9/mGx5UCUMN3fIX3cMnFu8+lJSpyGlGZGmSAB+Eyz+W1fwUmlli3Nm/2nbCZB99i7XHeocb0IzCO3onLEnrEaF7DpjVj88K9+OLSPyRJUIw+pVgmz3hVgK/W9WJouZ0RPTYWroJRjSGVo71M3p2dluWjuU0ZyfEV+vPzdTrvw=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2343.eurprd06.prod.outlook.com (10.169.213.10) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.16; Mon, 18 Jun 2018 11:29:29 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 11:29:28 +0000
From: Tobias Olausson <TOl@hms.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi
	vols
Thread-Index: AQHUBvcTlXRZUcnoxUaU+gFSlCW74Q==
Date: Mon, 18 Jun 2018 11:29:28 +0000
Message-ID: <DB6PR0601MB2133494840B64E5FA74F9A63C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2343;
	7:GRy9hLEamZVcTxzbyYh9delQMhtvcPVGUA765urpW5R6H9yAtwSWf6lEiQB1IyF8yO2jC3KsJBJJ0OqIn29IFMfsavAzi7Js5JTcbGcLplW9GDoArzWs0nN0eBWcq2qvuFVgbjtDAbEzE4qzKa6iaVYNlPyHxAgli9QKRG05aXJ8fg5GShLwMP6A+ITelDLnpbLSqJrlIxKXmecAI3xpAHTiP0VloGRCJCajRz7tG0eE7YsziFfblW/DqH9mOBZV
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39380400002)(39850400004)(396003)(376002)(346002)(366004)(189003)(199004)(86362001)(2900100001)(575784001)(97736004)(9686003)(74482002)(6116002)(3846002)(6436002)(4326008)(8936002)(74316002)(3660700001)(7736002)(81156014)(81166006)(25786009)(68736007)(2906002)(8676002)(316002)(6916009)(3280700002)(14454004)(72206003)(478600001)(305945005)(99286004)(476003)(26005)(102836004)(6506007)(53546011)(1857600001)(7696005)(66066001)(486006)(105586002)(106356001)(5640700003)(53936002)(5660300001)(33656002)(5250100002)(55016002)(2501003)(2351001)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2343;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 5de43f08-9ad9-47fc-6352-08d5d50ec0b8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2343; 
x-ms-traffictypediagnostic: DB6PR0601MB2343:
x-microsoft-antispam-prvs: <DB6PR0601MB2343E36B916DB244EBC43741C3710@DB6PR0601MB2343.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2343; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2343; 
x-forefront-prvs: 0707248B64
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 4FqupjJ+pFks9zZrMBqIOSYiOa6+X9ToQaRfUs7FU0uVccGSkBxoNQlzpJRJvfiu1TOW0NinToXKhwCsD3i4thsPbrIs7iUGVqdmZ07wzd5fs8MFYECUnL2GIzIw5MY+ea2WmyS1y23tN6VrqC8r+JOCcWmor97pC/XNx8A/X6deuStErLz1yxEL7p9vQlPbaa0D0lrzL9JxT2YdHJ75MrjvdFTvtGIDYEI6Dl6ktjxBCe6vFilQyR60RBpxz/mKXK8OnSN9JuVbuopZtrE09Y/n3+v62PBchYkG7tQVhgxNzYBK0AhbWmvy7qss39EjHgC+FyzEd+z/Y5KQ5JZnaQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de43f08-9ad9-47fc-6352-08d5d50ec0b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 11:29:28.1579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2343
Cc: Magnus Olsson <Mago@hms.se>
Subject: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Mon, 18 Jun 2018 11:45:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From d7b8be3f844c10ace0d4c04e35986145fc20d0d8 Mon Sep 17 00:00:00 2001
From: Tobias Olausson <tol@hms.se>
Date: Mon, 18 Jun 2018 13:22:04 +0200
Subject: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vol=
s

Instead of hard coding the ubi volume to be just large enough to fit the
root file system, one can use a variable to set a preferred size.

Signed-off-by: Tobias Olausson <tol@hms.se>
---
 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 00a00d318f..ae23aeaa8a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -164,10 +164,18 @@ multiubi_mkfs() {
 		local vname=3D"_$3"
 	fi
=20
+	# Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_name for multiubi
+	eval local UBI_VOL_SIZE=3D\"\$UBI_VOL_SIZE_${name}\"
+
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ub=
ifs >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+	if [ -n "${UBI_VOL_SIZE}" ]; then
+		echo "vol_size=3D${UBI_VOL_SIZE}" >> ubinize${vname}-${IMAGE_NAME}.cfg
+	fi
+
 	echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
--=20
2.17.1

=20
    =

