Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10133.1794477939802739174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 02:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EycJpvMM;
 spf=pass (domain: est.tech, ip: 52.101.72.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptvsfH+TlYccl51rBlSjBVUXFlYBfGXj28+ve8T0Zqq/9DNo9idM37zSo+MvuJZf2BnQfjnU/8yASI4X9bfjJrNWXf6szDuJoemQhJzXcUYgiP+/wFfKVIcdpcap1zECDB9nyuAJsa3+qLi5Kh53dENBiBwXl5IfqHLKw/xBhHMK1QOa2K9hu+t9N5kxGIxCCUI5NCjrDarIrESdcF4DJ1Sljn7U7ajIaFw2sq5tfXVlh63R91ZKXArpKDvq3eJeqy0fjsNdhyENF4HvZ+apOGTGODvueU7xsfYOuSzB7cqX4mjt4kpLz9LU4z6MCS+E8jiRSIPcyOwFobOUZOMRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPQ5Z++COq8H7dOK/fSbldrBQk95FGQO1JZ1WCiMfhI=;
 b=g29Jped56pxbfRFz4Q2E1JSXj/1oGyy23XGugSKpc3pEaHMr/+Dj8b3ptHgh7NJGdnetufykwZOoSmLR+itekxugKDSwVCmDUJuyvdNw9Wzv15pJErSxh5z2am0jvnrzOA7xdgdQdb5ubZLz4qTyzH0pNDTUQSQJHNcD/hA/oZjH7yAWghrZhKY8Ux/bcGgSEQuk32NuDP4XiCM545tZVuuLxOVi8X+JngyGiWkVZmzHglNQipY41SvBD4af9aAf5IbTMYpkgGoAkQ2FhZQlz3oRckofpx3m3oSah8Tr3OQWVhRPwmD7c5Z03vS0mcojp8IANeknk0BgaZfBghGJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPQ5Z++COq8H7dOK/fSbldrBQk95FGQO1JZ1WCiMfhI=;
 b=EycJpvMM0c90VGhIQ5/hMNMyC9tbp4nmtyDY9bJu36MjpykYoNvZSE6W3+KUbrjxCwZhbxToDDSDEouNnydrMK3TzJ4Gu4jqmLZsfMeeL3p6QzuK4p8Y7zKp9xFOe9SCiaW9lInEARHCrZLMLXccy6sURNmSBFTxdJb2R4HEkQElYXLmQriw5/Kt6V+vL4rRXXocK4SAgOr1VSbrrFQIBGexFami7GUIt0x9eHjqBvqydKtm6REAYvd0sd3KTcTckk+3KTNF1NXhES2yP5m8r6JXXIzNQPLL20FJLFXfFGEB6ugjH/VrldGXeommPS946Vh4dtaahLIHXl6usTKgtA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0633.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:129::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:05:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 10:05:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5] groff: Upgrade 1.24.2 -> 1.25.0
Date: Thu, 12 Nov 2026 11:05:32 +0100
Message-ID: <20261112100532.91258-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR06CA0061.eurprd06.prod.outlook.com
 (2603:10a6:10:120::35) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0633:EE_
X-MS-Office365-Filtering-Correlation-Id: 5044dd08-b66b-4148-389b-08df40a47e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|3023799007|6133799003|11063799006|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003|56012099006|261021123027099003|261021121427099003|261009223327099003|261009220027099003|261102123227099003|261009221727099003|261009221227099003|260925022911599003|260925021911599003|260925021311599003|10067099003;
X-Microsoft-Antispam-Message-Info: zDTYo6cRi7ovjcHF7wYekvYJgDF71g+1wEE6nzi3WM81nNapS63RvrGFqpneoCq0rhYCO5mUtfhiMViUIuxm6lanRUHWBKxlTB4ESQtTGkGViyTIYSLRd2DvR+qRW06jXJKVsx4crN6ZHgEXux1sSvCQctguqdH4ype8F6CgLdgLoMdDyVL3anP4J1jhWxlvXEPSwpIfreJQz6OO9OuABcRms1TLeWgXW3gj8xi3j81ljTZL6yC8lu0HrYiWwzkQ0FnVNvZMGUMN06sKogAprAYG2I0PzXrz4Udf6AdGzVtdC4xozDr6sXf9pK8n+WY731WolalIE9QPn7Qb7YhXkHl6uRHCkK2R54DVQkRaD5btyHQSMJu9avn92dnlj3qWqUOQGnxofFf47z+NTfDmFmbtzuAJVs24Y85NLbN/NaUyZrTU0+X7+q7qQgNb53nL/RaqMmxqsCQVrDOVXq/CZ5UUfdqob4MItO6d0euSgKCwHqTyz6eBEKNYqTzpn9jb8cRy+IqpWZAQRHcoZF+q2bnQWz23KXO38wXrcBBnpiZwKFpxCPxac+f/yiDHs2Zfe78MgNuKyVtjDnAPMuhegRabTt1lUNc7rjeB8j6nn3T/wBEx//JU4XEiDP9apb/B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(6133799003)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003)(56012099006)(261021123027099003)(261021121427099003)(261009223327099003)(261009220027099003)(261102123227099003)(261009221727099003)(261009221227099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MwrwnxvhDktY75coRsppKd8o9wp5jD6ywrSrMMyrUjF4X/hLxXtGysZtnsp3?=
 =?us-ascii?Q?ZqQOOTJsAlP6tIR+pNASq681HmXK5Q+WMHiNEdLLj8G2kYhm9WbLIn5LNBTi?=
 =?us-ascii?Q?7wOWagt6zY+QP/whmCyF/9g16jWVwdea53eMsfpsfCrivcLuu3cL1oFU8P/w?=
 =?us-ascii?Q?lF2LvtBVcdnty120FQPLVq5ccfaBBW038iGSk9v8KvlwtNbbeLPGRGp6U3bA?=
 =?us-ascii?Q?Ot/Kv2hbxXRrQRi8Rs0TCRuC4x5QNt9a3x64S4p9uxQSFHU43dk0XGAkqDOu?=
 =?us-ascii?Q?Wm2aUWUaLaaT8lfKCibo0gCm/77wyrXBxRQaoUo8DizouTBup+mDrcjO3o2k?=
 =?us-ascii?Q?s43AYWLjWycR2nBZ5LzP8VT5RAiFgQoH9TA9fzcSUuJrMqV6BwXComdWxJcy?=
 =?us-ascii?Q?yRtILA41USKdMp1i+k7VXPDEGvv+IeQiJCk+xx7yaEfJ04/ZjYIk1D6GZcwi?=
 =?us-ascii?Q?dsBQzr8GEtnMx6XD2zkvdW+2WxbCu6wgTRa4EGo0wMv9J+tC7cSFnVngMr2S?=
 =?us-ascii?Q?aDy8pG3nUCj9PMiA41CHjFdI8WZUYIuYdAhL+oifKCQ8u05yZSJ1kPjfUrZB?=
 =?us-ascii?Q?9/o74AnutIkyyZUBVzjCdodYK+o/6rYXMybCq4qg6sq3TbK9PWsj1MX9ndp/?=
 =?us-ascii?Q?NaXJLkJLC/JVsiQQ7Wa5ATNKLKsvb0RJFRGbiY3HpDGnJZoWglFwqdz7bp70?=
 =?us-ascii?Q?0Zzi6GULWr2xC4WAOfwLpmbw72lR6+o6rXoP+EBs+QaJpBGpZLV/E67yNbCu?=
 =?us-ascii?Q?USqpXI91fv0YsTs/LVGiAgWhiBUZ27tCwwEs5tnKq6Wsi+0v8978AC5Nsr/4?=
 =?us-ascii?Q?hN/EAaLxiiK+huBXsbVRUqCu8xqRzxROxfdxkiFg58K2OY8SEzcA0RamBi+P?=
 =?us-ascii?Q?6dqJ6U0/g4ZOgaok1pjDCPt5NfGgkiC/t76E1w1fidcLCsFBfE8XvOBb0I+i?=
 =?us-ascii?Q?f23FpGK/wBbTcODIOFt4L7GaZVXe4Yyas+vrjwILblJSTGHiR4vatklWMMyq?=
 =?us-ascii?Q?7uGgSwJvJ8XddwfsgQf7kzBvs1+CKAv5N8O4sDb4LbaHmcxp2mxRq5JYarah?=
 =?us-ascii?Q?W90mc1r56B0gk4ca2SkADPn0Md8w8/zwGJ8mrBbgQr3fvFJCIP14+0psjzxh?=
 =?us-ascii?Q?xYAeeGef5fkOTFQlFFdtiISBUUsWyFYJAwWrzhZ/MQY7Cki9ZAjNSXEgjl3b?=
 =?us-ascii?Q?zabcJykNx7AZQbxB75h6d9avkzk+zGY4j+N36BnhoVASXSX6Q3iGs6C1N+9d?=
 =?us-ascii?Q?jhuQzHAjTv7+yjA2l71GvhpDtYnEgjP/KBwsOsX+dUr4sbQIFxb4DzHG23m8?=
 =?us-ascii?Q?UpZNJ9VY0gHCEzPbDSzHW15jC/x/7Hx50sPxDOtIF6mdGeOwI2zaAXxQnI21?=
 =?us-ascii?Q?yE9oMWqDiddIFVVtYWkf5Zyx3PyLfm+h9y05NCo79wzwYltBMjGja9H1NxfL?=
 =?us-ascii?Q?j3bqTR/IquWreynCUzPjW07uIM02qvKxdHpnm4t8iJE/SptFz0es3jn0XH9s?=
 =?us-ascii?Q?5vWK3tkAMvkS+Ul5h3C1kkbg6YlAtCzvzsBuszpwqp2OELdrvPyYjLtE/46N?=
 =?us-ascii?Q?FicaTUF7ukDkMkDWFAzBtSTPi1Wp31iVvG/yF9J0DyWwjLZ9FM5E5Hn6nU9v?=
 =?us-ascii?Q?xiCa+hUXv4ypiFzJckqomPZcBUN6Ke28UgpqpEle1KRZKHd6IvYUddGGmUe4?=
 =?us-ascii?Q?IBsy5QkX0DvG/GT7kkRovvZTPLsCkt+Gv9UaKG16F26L3JMuSNI6jF5pwV7q?=
 =?us-ascii?Q?r3YU2Jfu4g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5044dd08-b66b-4148-389b-08df40a47e62
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:05:35.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPQ78z52dYiTmv860nAGAmgHLuMPtQvS4ELMAuIBw0wDKnDeRO6dqOaqAroLvZVEXLMsTqyGtpHAyu4TIpakLY/Qf4JPjag5yFmzP6J6Kvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0633
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 10:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250083
Content-Type: text/plain; charset="utf-8"

- Drop builddep.patch as fix is part of release
- Drop 0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch;
  fixed upstream (Savannah #68136, released in 1.24.1). gropdf's SubTag()
  no longer uses rand(), so the SOURCE_DATE_EPOCH srand() seed is obsolete.
- Refresh exisitng patches
- Fix cross-compilation of man pages by using native soelim and stripping b=
uild paths.
- Add GROFF_G patch to keep the "g" program prefix off in cross builds;
  it dropped plain nroff/troff and broke man-db (test_mandb).
  Upstream: Savannah #68901.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v4:
- Fix patch signoff
Changes since v3:
- Fix oe-selftest failure for mandb
Changes since v2:
 - Remove dropped patch
Changes since v1:
- Fix cross-compilation of man pages

 ...001-Make-manpages-mulitlib-identical.patch |  7 ++--
 ...groff-not-found-in-cross-compilation.patch | 15 +++----
 ...E_DATE_EPOCH-for-reproducible-builds.patch | 39 ------------------
 ..._G-don-t-prefix-when-troff-fails-to-.patch | 40 +++++++++++++++++++
 .../groff/files/build-less.patch              | 22 ++++++++--
 .../groff/files/builddep.patch                | 33 ---------------
 ...groff-not-search-fonts-on-build-host.patch | 13 +++---
 .../{groff_1.24.2.bb =3D> groff_1.25.0.bb}      | 12 ++++--
 8 files changed, 83 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-gropdf-use-SOURC=
E_DATE_EPOCH-for-reproducible-builds.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-m4-groff.m4-GROF=
F_G-don-t-prefix-when-troff-fails-to-.patch
 delete mode 100644 meta/recipes-extended/groff/files/builddep.patch
 rename meta/recipes-extended/groff/{groff_1.24.2.bb =3D> groff_1.25.0.bb} =
(87%)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-=
identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-muli=
tlib-identical.patch
index 6dc84c9062..093f447bc2 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identic=
al.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identic=
al.patch
@@ -1,20 +1,19 @@
-From aa1f37f1e0ff0dc0eeb199b52959e0deb275721e Mon Sep 17 00:00:00 2001
+From 3497a04ab9bf74f7d686ebbd3bc5997227083f6c Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
=20
 Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index f7ab410..7e1f3fb 100644
+index 32deb25..b74e100 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -891,7 +891,7 @@ SUFFIXES +=3D .man
+@@ -860,7 +860,7 @@ SUFFIXES +=3D .man
  	     -e "s|[@]PAGE[@]|\\\\%$(PAGE)|g" \
  	     -e "s|[@]PDFDOCDIR[@]|`echo $(pdfdocdir) | sed -f $(makevarescape)`=
|g" \
  	     -e "s|[@]PSPRINT[@]|`echo $(PSPRINT) | sed -f $(makevarescape)`|g" =
\
diff --git a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-no=
t-found-in-cross-compilation.patch b/meta/recipes-extended/groff/files/0001=
-groff-fix-test-groff-not-found-in-cross-compilation.patch
index e9214519e7..c1db0134f8 100644
--- a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found=
-in-cross-compilation.patch
+++ b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found=
-in-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c0f835a59d7b33452f280c8a73c3214e0a3a3d9f Mon Sep 17 00:00:00 2001
+From f0dfb4b314893769659b25da145d602d1dd87499 Mon Sep 17 00:00:00 2001
 From: Zhang Peng <peng.zhang1.cn@windriver.com>
 Date: Fri, 6 Mar 2026 05:18:33 +0000
 Subject: [PATCH] groff: fix test-groff not found in cross-compilation
@@ -29,7 +29,7 @@ Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
  3 files changed, 8 insertions(+), 4 deletions(-)
=20
 diff --git a/contrib/mom/mom.am b/contrib/mom/mom.am
-index b99e869..120d3ee 100644
+index 98d1def..57a3b3e 100644
 --- a/contrib/mom/mom.am
 +++ b/contrib/mom/mom.am
 @@ -24,7 +24,7 @@ mom_srcdir =3D $(top_srcdir)/contrib/mom
@@ -42,12 +42,12 @@ index b99e869..120d3ee 100644
    GROFF_BIN_PATH=3D"$(GROFF_BIN_PATH)" \
    $(PDFMOMBIN) $(FFLAG) $(MFLAG) -M$(mom_srcdir) -K utf8 -p -e -t \
 diff --git a/doc/doc.am b/doc/doc.am
-index 6cf9db5..906a989 100644
+index 8220a5d..e159f70 100644
 --- a/doc/doc.am
 +++ b/doc/doc.am
-@@ -54,7 +54,7 @@ groffmanpagesoption =3D -P-e
- endif
-=20
+@@ -65,7 +65,7 @@ endif # HAVE_URW_FONTS
+ # Use this macro to render a document if it has forward internal
+ # references.
  DOC_PDFMOM =3D \
 -  GROFF_COMMAND=3Dtest-groff \
 +  GROFF_COMMAND=3D$(abs_top_builddir)/test-groff \
@@ -77,6 +77,3 @@ index a65898a..9c6a8b6 100644
 =20
 -exec $builddir/groff "$@"
 +exec $GROFF_BIN_PATH/groff "$@"
---=20
-2.51.2
-
diff --git a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_=
EPOCH-for-reproducible-builds.patch b/meta/recipes-extended/groff/files/000=
1-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
deleted file mode 100644
index 8ab3668edc..0000000000
--- a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-f=
or-reproducible-builds.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f28f0c4d8dfdfb1c173d21df6ffbe35448fada9f Mon Sep 17 00:00:00 2001
-From: Zhang Peng <peng.zhang1.cn@windriver.com>
-Date: Mon, 9 Mar 2026 20:10:00 +0800
-Subject: [PATCH] gropdf: use SOURCE_DATE_EPOCH for reproducible builds
-
-gropdf uses rand() to generate random font subset tags in SubTag().
-Without a deterministic seed, each build produces different PDF output.
-
-Initialize srand() with SOURCE_DATE_EPOCH when available to ensure
-reproducible builds.
-
-Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?68136]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- src/devices/gropdf/gropdf.pl | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
-index f519a53..3a79b4c 100644
---- a/src/devices/gropdf/gropdf.pl
-+++ b/src/devices/gropdf/gropdf.pl
-@@ -30,6 +30,13 @@ use POSIX qw(mktime);
- use File::Spec;
- use File::Path;
-=20
-+# Initialize random seed for reproducible builds.
-+if (defined($ENV{SOURCE_DATE_EPOCH})) {
-+    srand($ENV{SOURCE_DATE_EPOCH});
-+} else {
-+    srand();
-+}
-+
- use constant
- {
-     WIDTH    =3D> 0,
---=20
-2.50.0
-
diff --git a/meta/recipes-extended/groff/files/0001-m4-groff.m4-GROFF_G-don=
-t-prefix-when-troff-fails-to-.patch b/meta/recipes-extended/groff/files/00=
01-m4-groff.m4-GROFF_G-don-t-prefix-when-troff-fails-to-.patch
new file mode 100644
index 0000000000..3480fb0122
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-m4-groff.m4-GROFF_G-don-t-pref=
ix-when-troff-fails-to-.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 12 Nov 2026 09:00:00 +0000
+Subject: [PATCH] m4/groff.m4: Don't prefix when troff can't run.
+
+* m4/groff.m4 (GROFF_G): Apply the "g" command prefix only when the
+  troff on PATH runs and reports a non-GNU ".g" value, not whenever its
+  output differs from "1".  A troff that is installed but fails to run --
+  as the native groff does when cross compiling, lacking its device
+  files -- is no longer mistaken for a groff-incompatible troff.
+
+Continues commit 96b8274a90, 14 October.
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/index.php?68901]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+diff --git a/m4/groff.m4 b/m4/groff.m4
+index e16ff3d..7f41502 100644
+--- a/m4/groff.m4
++++ b/m4/groff.m4
+@@ -1065,11 +1065,14 @@ AC_DEFUN([GROFF_TMAC],
+ AC_DEFUN([GROFF_G], [
+   g=3D
+   AC_MSG_CHECKING([whether a groff-incompatible troff is installed])
+-  if test -n "`command -v troff`" \
+-    && test "`(echo .tm '|n(.g' | tr '|' '\\\\' | troff -z -i 2>&1) \
+-      2>/dev/null`" !=3D 1
++  if test -n "`command -v troff`"
+   then
+-    g=3Dg
++    troff_dotg=3D`(echo .tm '|n(.g' | tr '|' '\\\\' | troff -z -i 2>/dev/=
null) \
++      2>/dev/null`
++    if test -n "$troff_dotg" && test "$troff_dotg" !=3D 1
++    then
++      g=3Dg
++    fi
+   fi
+   if test "$g" =3D "g"
+   then
+--=20
+2.51.2
diff --git a/meta/recipes-extended/groff/files/build-less.patch b/meta/reci=
pes-extended/groff/files/build-less.patch
index dc560fbb30..62cd9f1718 100644
--- a/meta/recipes-extended/groff/files/build-less.patch
+++ b/meta/recipes-extended/groff/files/build-less.patch
@@ -1,12 +1,25 @@
+From d30928c7ee37eabf32075d88b1e6a406968651c2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 19 May 2026 15:15:07 +0100
+Subject: [PATCH] groff: build less in groff-native
+
 Build less bits of groff to save time and reduce random build
 failures from missing dependencies in this logic.
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.am | 15 ---------------
+ 1 file changed, 15 deletions(-)
=20
---- a/Makefile.am~	2026-05-15 13:23:08.000000000 +0100
-+++ b/Makefile.am	2026-05-15 13:29:17.053867035 +0100
-@@ -556,15 +556,0 @@
+diff --git a/Makefile.am b/Makefile.am
+index b74e100..9b5ecec 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -553,21 +553,6 @@ AM_CFLAGS =3D
+ include $(top_srcdir)/lib/gnulib.mk
+ include $(top_srcdir)/arch/mingw/mingw.am
+ include $(top_srcdir)/arch/misc/misc.am
 -include $(top_srcdir)/contrib/chem/chem.am
 -include $(top_srcdir)/contrib/eqn2graph/eqn2graph.am
 -include $(top_srcdir)/contrib/gdiffmk/gdiffmk.am
@@ -22,3 +35,6 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
 -include $(top_srcdir)/contrib/rfc1345/rfc1345.am
 -include $(top_srcdir)/contrib/sboxes/sboxes.am
 -include $(top_srcdir)/doc/doc.am
+ include $(top_srcdir)/font/devX100/devX100.am
+ include $(top_srcdir)/font/devX100-12/devX100-12.am
+ include $(top_srcdir)/font/devX75/devX75.am
diff --git a/meta/recipes-extended/groff/files/builddep.patch b/meta/recipe=
s-extended/groff/files/builddep.patch
deleted file mode 100644
index 71c23d60b5..0000000000
--- a/meta/recipes-extended/groff/files/builddep.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-[mom]: Fix example build dependencies
-
-We are seeing occasional failures for eqn being missing when building
-mom examples, e.g.:
-
-| groff-1.24.0/groff: error: couldn't exec eqn: Permission denied
-| pdfmom: fatal error: groff-1.24.0/test-groff exited with status 24
-| make[2]: *** [Makefile:19256: contrib/mom/examples/slide-demo.pdf] Error=
 1
-
-It may find eqn from the host system if installed too.
-
-Fix the build dependencies to add eqn, pic, tbl and preconv since a=20
-quick strace indicates them all being used here
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/groff.gi=
t/commit/?id=3D3f7d8ea20f91a8abf248fbf7ec73049cd8c3c9c2]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: groff-1.24.0/contrib/mom/mom.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- groff-1.24.0.orig/contrib/mom/mom.am
-+++ groff-1.24.0/contrib/mom/mom.am
-@@ -144,8 +144,8 @@ SUFFIXES +=3D .mom .pdf
- 	&& LC_ALL=3DC $(MOMPDFMOM) $< >$@
-=20
- $(MOMPROCESSEDEXAMPLEFILES): $(MOMNORMALFILES) \
--  test-groff groff troff gropdf pdfmom penguin.ps penguin.pdf \
--  font/devpdf/stamp tmac/pdf.tmac
-+  test-groff groff troff gropdf pdfmom eqn pic tbl preconv \
-+  penguin.ps penguin.pdf font/devpdf/stamp tmac/pdf.tmac
-=20
- penguin.ps:
- 	$(AM_V_at)cp $(mom_srcdir)/examples/penguin.ps $@
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-bu=
ild-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-o=
n-build-host.patch
index 111dbd385e..b1e7a08cf3 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-hos=
t.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-hos=
t.patch
@@ -1,7 +1,8 @@
-From eb16276c3e2e34aa2e57f6a0e68554657b90cd28 Mon Sep 17 00:00:00 2001
+From 6c2c062e9ccd4235a6262e1effbdd40ec7d35b25 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 11 May 2019 17:06:29 +0800
 Subject: [PATCH] groff searchs fonts which are provided by ghostscript on
+
  build host. It causes non-determinism issue. So not search font dirs on h=
ost.
=20
 Upstream-Status: Inappropriate [cross build specific]
@@ -13,25 +14,24 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
=20
 Rebase to 1.24.0
 Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
-
 ---
  font/devpdf/Foundry.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
-index e5aba65..5441734 100644
+index 56297fc..3a43aaa 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -23,7 +23,7 @@
+@@ -21,7 +21,7 @@
 =20
  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #Foundry|Name|Search path
--foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share=
/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/=
ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/s=
hare/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/:/usr/s=
hare/ghostscript/Resource/Font
+-foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share=
/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/=
ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/s=
hare/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/
 +foundry||(gs)
 =20
  # Enable the font description files for grops (generated from Adobe
  # foundry font files) to be used with gropdf.  afmtodit must not be
-@@ -79,7 +79,7 @@ EURO|N||||*../devps/freeeuro.pfa
+@@ -73,7 +73,7 @@ EURO|N||||*../devps/freeeuro.pfa
  # URW fonts are typically shipped with Ghostscript, but can be replaced.
 =20
  #Foundry|Name|Search path
@@ -39,3 +39,4 @@ index e5aba65..5441734 100644
 +foundry|U|(gs)
 =20
  # Define flags for afmtodit.
+=20
diff --git a/meta/recipes-extended/groff/groff_1.24.2.bb b/meta/recipes-ext=
ended/groff/groff_1.25.0.bb
similarity index 87%
rename from meta/recipes-extended/groff/groff_1.24.2.bb
rename to meta/recipes-extended/groff/groff_1.25.0.bb
index e13996500f..04001765ac 100644
--- a/meta/recipes-extended/groff/groff_1.24.2.bb
+++ b/meta/recipes-extended/groff/groff_1.25.0.bb
@@ -11,13 +11,12 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-groff-fix-test-groff-not-found-in-cross-compilation=
.patch \
-           file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-build=
s.patch \
-           file://builddep.patch \
+           file://0001-m4-groff.m4-GROFF_G-don-t-prefix-when-troff-fails-t=
o-.patch \
            "
=20
 SRC_URI:append:class-native =3D "file://build-less.patch"
=20
-SRC_URI[sha256sum] =3D "f9c1efd5bebbe37fc6e1063db7473ce8df1e3e0be4ff0f43ce=
04fce57e9c5dd9"
+SRC_URI[sha256sum] =3D "24d103a07eb79e418963bce206c8771b649871f83bda2fd4c2=
e65529c1c56921"
=20
 DEPENDS =3D "bison-native groff-native"
 RDEPENDS:${PN} +=3D "perl sed"
@@ -27,7 +26,7 @@ inherit autotools-brokensep texinfo multilib_script pkgco=
nfig
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
=20
 EXTRA_OECONF =3D "--without-x --with-urw-fonts-dir=3D/completely/bogus/dir=
/"
-EXTRA_OEMAKE:class-target =3D "GROFFBIN=3Dgroff GROFF_BIN_PATH=3D${STAGING=
_BINDIR_NATIVE}"
+EXTRA_OEMAKE:class-target =3D "GROFFBIN=3Dgroff GROFF_BIN_PATH=3D${STAGING=
_BINDIR_NATIVE} SOELIMBIN=3D${STAGING_BINDIR_NATIVE}/soelim"
=20
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'/usr/bin/env perl' ac_cv_pat=
h_BASH_PROG=3D'no' PAGE=3DA4"
=20
@@ -71,6 +70,11 @@ do_install:append() {
 	if [ -d ${D}${docdir}/${BP}/examples/hdtbl/ ]; then
 		sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/*.=
roff
 	fi
+
+	# Remove build paths from generated groff.7 for reproducibility.
+	if [ -f ${D}${mandir}/man7/groff.7 ]; then
+		sed -i -e 's:${S}/::g' ${D}${mandir}/man7/groff.7
+	fi
 }
=20
 do_install:append:class-native() {
