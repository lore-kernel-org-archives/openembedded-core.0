Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140117.outbound.protection.outlook.com [40.107.14.117])
	by mail.openembedded.org (Postfix) with ESMTP id 997757F10E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 08:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=W0vuS6IOhK9kHdnvScjCAtEjQJ5renE/DDH9D8WnhJ5WehB8vm26XUYNwlDEwQn9H60YHJAxeyM0GoDIwiCKuGyCcAo9RBUNJ3OxNbFxaC14bKXl5p9oDk2quqWEPdzrwL2WC6fiNPsqlEiL7wGR0YnDAQJ08n4U1Ziy8d4vc4b2WL8wfxa67Wvq8x61QorXtb0gsopLmCfoUBQL08PE1YhtogRu0i5yArvPRwUYsEO26CTbENpxPHL8hW14v9x8TSTpPMRuHhLfenzhN9INpZ0aI4gKnAznyLl5CWpIdjxksGNxEHh54Cnp9nIhC0fQ7WHmY+fqKjXW69bhZnHL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1+kZXjEjG8sVMHl4+ltIiyKUFnVflU5uH+N1ZzQ7aoE=;
	b=KWGgcb4+BY6Bu+3Witl+bjkpS3K9srHFHyzWOHOhYuRF/LYDRpCxf7WyvTHtgayGy9K4sZID/C7eK+xyAYNee5YVpGDItZT5m4tfATmdogDqSYFQY42VZav3DBodw7tYfpte2jZZP7gQvkBzWJTa6RTa/ci8eySxsLhr/g6TQsldqJ7XKaVRREYIebco0QqHE8Flo4G4PZ4vCf+Pk/uley8/9ChsbPTZiN2oTCavBYy/cwPt1Zd3ZaLsrC7HUKWAnAgCtcF/iSiYcegs+F+YUQzCKbkxUgUEN8DLnRGnzF7jgfRkvwv9ncPj2y/GsQKSII6eF2EiXrB5cfQF2nXR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=prevas.se;dmarc=pass action=none
	header.from=prevas.dk;dkim=pass header.d=prevas.dk;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1+kZXjEjG8sVMHl4+ltIiyKUFnVflU5uH+N1ZzQ7aoE=;
	b=aHhiwY1/qQLoEmafgq+rSmOoy+Zp5ZUUnvt75td6jBJjnQqHFSamRL4+k+qXIM62LRJnQ5aD7QnMbIlEV7SWFYj8kBJHJudVD5V6FxCp+UisYeLgEzAE3+L3NKY9Nt8cceKqxwaxUV/rP4b1o2R90KOtadLnodViOjQco4VXXS8=
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM (10.186.175.83) by
	AM0PR10MB2898.EURPRD10.PROD.OUTLOOK.COM (10.255.28.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.10; Wed, 24 Jul 2019 08:46:22 +0000
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0]) by
	AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0%2]) with mapi id 15.20.2094.017;
	Wed, 24 Jul 2019 08:46:22 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] iproute2: drop pointless configure-cross.patch
Thread-Index: AQHVQfxEwolCFLb5Q0y8Dl+1bii82w==
Date: Wed, 24 Jul 2019 08:46:22 +0000
Message-ID: <20190724084611.4390-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0053.eurprd09.prod.outlook.com
	(2603:10a6:7:15::42) To AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:20b:15e::19)
x-mailer: git-send-email 2.20.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd6c3118-8733-4ae7-236e-08d710136759
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM0PR10MB2898; 
x-ms-traffictypediagnostic: AM0PR10MB2898:
x-microsoft-antispam-prvs: <AM0PR10MB2898A479D8F725561C8F88F88AC60@AM0PR10MB2898.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(366004)(136003)(376002)(396003)(346002)(189003)(199004)(53936002)(50226002)(6116002)(6512007)(3846002)(66066001)(5660300002)(14454004)(107886003)(25786009)(99286004)(68736007)(316002)(2351001)(54906003)(2501003)(1076003)(7736002)(52116002)(305945005)(6506007)(71190400001)(6436002)(71200400001)(102836004)(4326008)(26005)(6916009)(44832011)(508600001)(256004)(14444005)(386003)(5640700003)(2906002)(476003)(2616005)(81156014)(81166006)(42882007)(8676002)(36756003)(66446008)(486006)(64756008)(66556008)(66476007)(6486002)(66946007)(8976002)(8936002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR10MB2898;
	H:AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T6ZEE4dZG8k6GtSstxb278cixiIf9zlj6CewcX0RFdNluBVghz4ONzGDlIvBTdwfyo1t8jTD6Z9B0h/DqlI1eVwHetU2u1l0w7bWTNXMMqVndOGO0pqc95dAqyHwxWLo8vpBzaH/3J9deyqKoj3JbV0eUCznJc5nxHAKnkSeQBt5/K3cyRDHNDBZUHmafhbG2EPBG4NsxOLv8CNe8rajVwa1toUAvVHzI2AZVzdJVXimkzFcaTww62mLa+/84WH4xv7htpgJd47n6wO3vYwqQJE0rI6N192Ruu/YhQ0Pl+WrPO3ckkuCic11OiZEFfZL6Px5ShW1L6YE978hzTYSLdO67EPur/yRyE2gAGXz3/05F2xg/+DCDBgB7Df8+9uUPOL2ET5rncABJv1bunk1jx+007wTlb13xsvInnCUeSg=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6c3118-8733-4ae7-236e-08d710136759
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 08:46:22.2153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rasmus.Villemoes@prevas.dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2898
Cc: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] iproute2: drop pointless configure-cross.patch
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
X-List-Received-Date: Wed, 24 Jul 2019 08:46:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The configure script has already found IPT_LIB_DIR via pkgconfig, so
the configure-cross.patch really just introduces dead and broken
fallback code.

Broken, because the SYSROOT variable does not actually get set to a
sensible value - the argument $1 passed to the configure script when
invoked from do_configure is ${STAGING_INCDIR}. Obviously that
directory does not have /lib or /usr subdirectories, so we're not
really helping the fallback logic in check_ipt_lib_dir() - in fact,
we're more or less guaranteeing that we won't find those .so files.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: apply to master instead of warrior, update patch description

 .../iproute2/iproute2/configure-cross.patch   | 39 -------------------
 .../iproute2/iproute2_5.2.0.bb                |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/configure-c=
ross.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.pa=
tch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
deleted file mode 100644
index b0c4a088fa..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3835b1cc4a55361443c2b37dea688da652217635 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 31 Mar 2019 17:32:07 +0200
-Subject: [PATCH] make configure cross compile safe
-
-According to Kevin Tian:
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
----
- configure | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 45fcffb6..0c5c9146 100755
---- a/configure
-+++ b/configure
-@@ -3,6 +3,7 @@
- # This is not an autoconf generated configure
- #
- INCLUDE=3D${1:-"$PWD/include"}
-+SYSROOT=3D$1
-=20
- # Output file which is input to Makefile
- CONFIG=3Dconfig.mk
-@@ -162,7 +163,7 @@ check_ipt_lib_dir()
- 		return
- 	fi
-=20
--	for dir in /lib /usr/lib /usr/local/lib; do
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib; do
- 		for file in "xtables" "iptables"; do
- 			file=3D"$dir/$file/lib*t_*so"
- 			if [ -f $file ]; then
---=20
-2.17.1
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb b/meta/re=
cipes-connectivity/iproute2/iproute2_5.2.0.bb
index 8ef529d91a..1728cd69a1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
@@ -1,7 +1,6 @@
 require iproute2.inc
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://configure-cross.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
=20
--=20
2.20.1


