Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0053.outbound.protection.outlook.com [104.47.2.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBD27545F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7rq4Szvgyp9oruWAV4nUWPOIsd5S/zat9VrXxwetxLc=;
	b=tDeNgF5J7rw5EopxL0cGt3gudfBYb/F1k7amcXTNp2KD13/gvdZteUlgenVqSCNzoGlOtHjxwnI9USp7qOt03GADo7c/E2ufvbJczuAXoMyIDnPJSzolzbOoKHA6kUFOvRuqddTScE1I/IiKfq6ImSAAQingIyh9m98t/r0J4M4=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2261.eurprd06.prod.outlook.com (10.169.212.21) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.16; Tue, 19 Jun 2018 08:25:19 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Tue, 19 Jun 2018 08:25:18 +0000
From: Tobias Olausson <TOl@hms.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCHv3] image_types.bbclass: add optional size to ubi
	vols
Thread-Index: AQHUB6a/E69A1nYl7kCK+dVIy0Iq3g==
Date: Tue, 19 Jun 2018 08:25:18 +0000
Message-ID: <DB6PR0601MB2133BE4AF264D7922494060CC3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2261;
	7:TZ7QqULhtf+gDJlwVkAh3+PvWF6DBbAAdK3xFYsnOoavExQ5NqviyKDOTVqRsXhhMvMVX//osYvcC0WxW2QhlFsUfY10Rsv2gq/ZC0yVc5JnHM6TBDfXB7r3Jbo5ftoizBUUJPXev/VuTyZosKD/zwMg39/KtmOBsgOAcyTl7Ds74N3bayFzHUapDoGhz6hrZrXeOSqaNSaoNNcsdLUy24Xv4GSNT36xqTwMFrMWLi9PQ3qfDsnS4zckMQErEYLa
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(366004)(396003)(39850400004)(376002)(39380400002)(189003)(199004)(2900100001)(7696005)(55016002)(97736004)(6436002)(102836004)(74482002)(7736002)(4326008)(25786009)(99286004)(305945005)(5640700003)(316002)(53936002)(66066001)(14454004)(6916009)(5660300001)(2351001)(74316002)(478600001)(68736007)(26005)(72206003)(3280700002)(3660700001)(1857600001)(2906002)(105586002)(81156014)(81166006)(8676002)(8936002)(33656002)(106356001)(2501003)(6506007)(5250100002)(86362001)(53546011)(9686003)(486006)(476003)(3846002)(6116002)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2261;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: c36675b9-a0b9-4679-dd01-08d5d5be312e
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2261; 
x-ms-traffictypediagnostic: DB6PR0601MB2261:
x-microsoft-antispam-prvs: <DB6PR0601MB2261E882D768EAB0B0E1401AC3700@DB6PR0601MB2261.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(3002001)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2261; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2261; 
x-forefront-prvs: 07083FF734
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: TsL9YLrs7yv0pdOTc0c+7DjHMEHhgso5AisK6tHSSAicoNH/EkNCbRgdnv4Rj+hlHGNSlRhQBe3HXqGXKubobUwmDokLRwicEYpBcoUinzEcgh//anQH3y1V4NT7xUxacFMAQZpkIGvc2Neu5hrY113mv+JcviaMuVhuE6V6zq44rhPE4NkM2uEQC7CuX3JQ44eQpPHRhrMpl1cPWsqVvVfItIYGZzoPz6+/KOCZMDds9WDDfx4E4RzzZBwqozmeg5IOidaWD+Uo5w+XOkVzGI1d0CmvOOCqtL/RDyvn3+Ilz7PwbECLGqSDaYlnrYvYu7dYUvDKrssBr7jwYvOFZg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c36675b9-a0b9-4679-dd01-08d5d5be312e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2018 08:25:18.7825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2261
Cc: Magnus Olsson <Mago@hms.se>
Subject: [PATCHv3] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Tue, 19 Jun 2018 08:57:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 320acd93c7ff9e76bf8321e4bf8c735cdc70b173 Mon Sep 17 00:00:00 2001
From: Tobias Olausson <tol@hms.se>
Date: Mon, 18 Jun 2018 15:01:53 +0200
Subject: [oe-core][PATCHv3] image_types.bbclass: add optional size to ubi v=
ols

Instead of hard coding the ubi volume to be just large enough to fit the
root file system, one can use a variable to set a preferred size.

Signed-off-by: Tobias Olausson <tol@hms.se>
---
 meta/classes/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 00a00d318f..99d49dbe7a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -164,10 +164,22 @@ multiubi_mkfs() {
 		local vname=3D"_$3"
 	fi
=20
+	# Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for multiubi
+	if [ -n "${vname}" ]; then
+		local ubi_vol_size=3D${UBI_VOL_SIZE}
+	else
+		eval local ubi_vol_size=3D\"\$UBI_VOL_SIZE${vname}\"
+	fi
+
 	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
 	echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ub=
ifs >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+	if [ -n "${ubi_vol_size}" ]; then
+		echo "vol_size=3D${ubi_vol_size}" >> ubinize${vname}-${IMAGE_NAME}.cfg
+	fi
+
 	echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
--=20
2.17.1

