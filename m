Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40123.outbound.protection.outlook.com [40.107.4.123])
	by mail.openembedded.org (Postfix) with ESMTP id 41EA97EE19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 08:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jBSoaEH+0wZVJuI+6dLrL2Mfj0FDPlI/hUPdGS1dknFOSPB1LYD4/S4bhOG0DoPAiRQ8X9WlVDdGNMYkNEixXQvcf9Sv/WbH4++KW20NsvrE5rcOfImCgIorjVu2P1kQLM55LX+xws/QJT5Jidlud3pObmZPvsZ4AVqtq/Sv2WSBbayPJB+UPKBCatG9Agw2+ADJaR/T35FH+8KyghDFdaVXnDUA1s+4IPadVnwtxlzab1TmjDok2bzcFfdC182JMTYh7gSmcrzxtpctBxseiDgNvLpUbXHJO0QeXRGy/ecbg0WP56y5pYhKszywXMs24Q6vlyAgZBsCD2e9BEBeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tmMMfHlsWz+EfBtDbuV5XrbcFx6c893rJ+yZf7x3fas=;
	b=Z651mjFxBFSzYbohgjNp5MuFJgZ8B6cJwyD950QB34NmsWz/2vNj5UxVjs9wQTcNTSOono30MPMqJ+7cX62dddPYfYh4sV6p2oLzp+DiDM9MW6B+LBg/1qS2g4x2ctXECC+zQ2ZAh1RIiV87AupQf3I06RuRTSUCaz7yMtBSok8+4qavn5APGXLW54CQ4VsIvMR5Ay4jOL6SqfTEieakmFqbbgnv+dhXO+OHwXPio8pDBKNCm1K5gv2nFAHAv/YYG7QMf7X/h+zjG+6bBvmmSpOWCAPbcoLiSgjD33Buj1YTLdpP0VjjbJBujTh9k0twUmJhqQJ9olqTFwIfMgOQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=prevas.se;dmarc=pass action=none
	header.from=prevas.dk;dkim=pass header.d=prevas.dk;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tmMMfHlsWz+EfBtDbuV5XrbcFx6c893rJ+yZf7x3fas=;
	b=ZkyP+snlpQmAgsuAJUtrZprV8RWdwC72I1bL4r8gJY1H1qM24xeBFvA1dZco2rwBiL7ne/A5VbKh7nxKpWCIZKHnwWDwREZNGz5CYjEPcWFkAYy+vFaUl34OPv9SuMOk9kTSTck2hYMl6ve5eBAe/+wrMa+9ndxYjnNI/1N0Q/E=
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM (10.186.175.83) by
	AM0PR10MB2548.EURPRD10.PROD.OUTLOOK.COM (20.178.113.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.17; Wed, 24 Jul 2019 08:23:49 +0000
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0]) by
	AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0%2]) with mapi id 15.20.2094.017;
	Wed, 24 Jul 2019 08:23:49 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] iproute2: drop pointless configure-cross.patch
Thread-Index: AQHVQfkehntqgbGK6EWcXML6oGqGWA==
Date: Wed, 24 Jul 2019 08:23:49 +0000
Message-ID: <20190724082334.2845-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0342.eurprd05.prod.outlook.com
	(2603:10a6:7:92::37) To AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:20b:15e::19)
x-mailer: git-send-email 2.20.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c103703-36df-4160-ef2b-08d71010411a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM0PR10MB2548; 
x-ms-traffictypediagnostic: AM0PR10MB2548:
x-microsoft-antispam-prvs: <AM0PR10MB2548BF33906D16F28029FCC88AC60@AM0PR10MB2548.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(346002)(366004)(396003)(39840400004)(199004)(189003)(25786009)(6916009)(6436002)(6486002)(486006)(5640700003)(8676002)(99286004)(3846002)(4326008)(6116002)(508600001)(14454004)(316002)(44832011)(2351001)(68736007)(52116002)(2501003)(66066001)(54906003)(6512007)(102836004)(186003)(26005)(14444005)(256004)(53936002)(81166006)(107886003)(305945005)(42882007)(2906002)(5660300002)(50226002)(66476007)(64756008)(66446008)(66556008)(1076003)(476003)(8936002)(36756003)(7736002)(66946007)(8976002)(386003)(6506007)(2616005)(71200400001)(81156014)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR10MB2548;
	H:AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gwl8rGqmxEEkRbz5pwls0rG8B0F60JLmvrHrSfNNBpT0tUHTzX2UN41HfJmqG2nCgqPc3YDlPArJdX/SqMPRTY5Gkz9N+s+ar/zcBaVV7vcTD6lG02GvxnkUo31Ac2NJ8niir8amx7GZ4OMEjpWqgtmX8Bm5Y7CSzy+l9Y74GA+26CghBj3ZTcnhpZTIgNnAwTfWPI1n7tn/gz5yLSFvMgP1dj56L+E4ElObirnPS5ZD+8pyOxk8dAvrz7iz4IdE2/Sb1CKzsEen8WPHbnAeSzNrmjJ9kbfjHjXntR8S4T3vxJzp3EvsTa3j3bQ1b0xxs2Cgwy7qsl1fF+kyaGK3JMJv5onmOVOnY+/+Ksha+Ze6UnnhVA6nHZ9vgeVQV73qF99XdoP+4+esizhhqJ9/XtdzDzj2FCyja3RasXFYIKk=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c103703-36df-4160-ef2b-08d71010411a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 08:23:49.5761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rasmus.Villemoes@prevas.dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2548
Cc: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: [PATCH] iproute2: drop pointless configure-cross.patch
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
X-List-Received-Date: Wed, 24 Jul 2019 08:23:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The configure script has already found IPT_LIB_DIR via pkgconfig, so
the configure-cross.patch really just introduces dead and broken
fallback code.

Broken, because the SYSROOT variable does not actually get set to a
sensible value - the argument $1 passed to the configure script when
invoked from the Makefile is KERNEL_INCLUDE, which we set to
${STAGING_INCDIR} in EXTRA_OEMAKE. Obviously that directory does not
have /lib or /usr subdirectories, so we're not really helping the
fallback logic in check_ipt_lib_dir() - in fact, we're more or less
guaranteeing that we won't find those .so files.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 .../iproute2/iproute2/configure-cross.patch   | 32 -------------------
 .../iproute2/iproute2_4.19.0.bb               |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/configure-c=
ross.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.pa=
tch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
deleted file mode 100644
index 8b75a2ada4..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 10:46:16 +0100
-Subject: [PATCH] make configure cross compile safe
-
-According to Kevin Tian:
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-Index: iproute2-4.14.1/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- iproute2-4.14.1.orig/configure
-+++ iproute2-4.14.1/configure
-@@ -2,6 +2,7 @@
- # This is not an autoconf generated configure
- #
- INCLUDE=3D${1:-"$PWD/include"}
-+SYSROOT=3D$1
-=20
- # Output file which is input to Makefile
- CONFIG=3Dconfig.mk
-@@ -195,7 +196,7 @@ check_ipt_lib_dir()
- 		return
- 	fi
-=20
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
- 			if [ -f $file ]; then
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb b/meta/r=
ecipes-connectivity/iproute2/iproute2_4.19.0.bb
index 6db4062d68..b1db40885a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
@@ -1,7 +1,6 @@
 require iproute2.inc
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://configure-cross.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            file://0001-ip-Remove-unneed-header.patch \
           "
--=20
2.20.1


