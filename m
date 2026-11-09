Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6125.1794231665512141146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ADbKFAzA;
 spf=pass (domain: est.tech, ip: 52.101.69.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N96pwT17vRE+CqWsZ6zZbGm+MVsY5MIUnKEIgRvlHzg2dYKvRwD3owK5gCGQNKd/wU+t0zAdFfDpR9XxQGZBDxzLNlD3EolBIFQ5yh82Rnr67Tw4iX+g1kJBfJi0fr9dg6q4A/zrYi73rc2sgbj6JLFzEWXLg/K6/UZQH8LYxSivG5dSCjuXPc/F6cMj8CKiR8bS+HFg9eFr8YOWDir0yLJxhgxTyUrQ6wseSHeSlZST/kXZTH2swjP6jB1bicsbIA9Z3fJUTJdqi4OzsEaAobtE7mG4lI/Z/0RHMPNuavXVDrfjnaNihDD121hoURl/pReI6swLM568txt8Shj2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPQd9ZET3d/0dEqP+29Qr2cDszgPLijk7skQrLI6thA=;
 b=uZKcjRpYiJYvwr1KA7Ew91/1oumj+1g10DOxoNKXM6RHYScB32pNwdndehse8dLPCo4wawcxNjAw5bCop05/R3gfDkCrbYwu4SEBjn0NdXFfnZzycfUVLFx26DxnfCChHWeMtO7O5pwTrx2Ze5tIcwsBBnFhw0KpCa9eX5OwCisVjFB+rZX+zDRtx+PayLo/eU01Sc/31s3U+4ChJ7VvgFN5xA17yjxgA2Hoa6Goy9FsINsIa9hoDfHWKTFuCcyA4e/tPR4BodR1nvsdTx7Rz9Hy7nopL89PC/C0OmtKBMwApYTGJFK0bx97bD2EN3vCUppjXUfEV6rJpT0YkuzA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPQd9ZET3d/0dEqP+29Qr2cDszgPLijk7skQrLI6thA=;
 b=ADbKFAzASk0mCzFyU2h57yTY8YRLIVP2mBjCRADMHknf6c1ulBjJcTcX5eHZ5ST1e3opMO6fhXMfopLFsG1o+Ud8XKu3S/Qwq3A9t6IXCFKYXFoXs4xJNxMGf3WAFkNtmtR/qO/R9UqL5WKvYr/9pYrZo2UkNrWUW4xiirtFhHlETNPnNb7v9ydJyDTjwAIYW+iry5x6Ip7yXOOMFIoPVu7l62bKOli/BIJ7xsAuKKp4xnMXnTc55+9lssao5SOyub4JFJx2sxc5rp1VygNReGnY1kyKlqFyEC4+WGjehMD16WgMhQZBwUfsPRpJnlF617qN7bt5GVqoHUltObK60Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:41:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/21] groff: Upgrade 1.24.2 -> 1.25.0
Date: Mon,  9 Nov 2026 14:40:29 +0100
Message-ID: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0057.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: e45e4c62-2dea-4cc7-0a73-08df3e6718d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|260925021311599003|260925022911599003|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HGLbHXhm7y/B7ag6umutfXXj3wNJY19l1slmhhQMiWeBl+13cfQNGeBWw2pPRegWoBTLZpcPSsskM9CbstGK3W4MYrTRpBZ/Vyck0Cb1p9f81aapB9a+vQiENdNYVip4/izpNEU6/ryKgFdBORH3k1eh6++bVdK53fVtbd3Gz/8XsBxQbOL6XiXPu8juuR0NSzlxu8UATgevw+t5bVCsaDTEQHiqz/Kzxx/2CRjpvA4j5s3dJEoHXIMeV+u4P203XN9VzmzJS/L/KNkg1nS6cuUfpBjKpYBBHon2uHAZ8Hnxeo3wpiwHqsL577UmnbV5YFxk8VUrtxDSVdg7P10C9ceTrpU2liMvWg/AXp/EkeIAxUPCP+wSJc8r16nGmzLZrVQCV6xvTs2tATEhTXh4uekYtyu+UhPeh7euycdFwUx8M+toeJl9cSBHzdBmB+hfWDhGhxb3BTAnT0ZydF5+0a2Uw+W2JR0eMfXPsVOd1vFZ+z3mBlEks1WAJ3q+cMvVWNpYZenekYbBeW37tbfg/uYFky1uN8YRPMVA5G3ij29LWJ4qRXZQLj5q+HyIZkxFUBTWtUPBBe6J745GFNsusos4uzrw/YOxK/VdXkwy1+8UC1KHcyzBdspe+QLIkUFB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?adFWmd/oLhzNqeVU5OnEUcHXgw9VESBTkbvzh8aYOaoc74UXRbSVBMCONaXH?=
 =?us-ascii?Q?ImnRM+4QgLLhwvYSvKCbuWjBhmy4jALRL79sxTT1DVNt9hQf6n2EmfKNEozA?=
 =?us-ascii?Q?5VxDg8KVovwTvpmg7mTpbZlqEO4U0yRxWzDem6IS46+Okgc60OS1waO1CkCI?=
 =?us-ascii?Q?z2Yn2cdiceViOMGCAnVAhtMsdna2WA+Na4iJhpHc9AZy9W4XQqyzJ+X+AmXt?=
 =?us-ascii?Q?JidJRbiGaAM8mKUlZqBhjQQgQcEBryus/MSNmKv7n5emRtIvhCJZR9HHEP1h?=
 =?us-ascii?Q?sO+4zq64WMIHdvq4PZOx72a43DduGGn/ouZo+dp6niT5a9L356K/uOcbl3gg?=
 =?us-ascii?Q?6jplwQxyQZin1hUNfiFPRJn+tQIj/+Ee6Kxs8Hk6AfORapWupWBTenpKYd4Y?=
 =?us-ascii?Q?hMZUYGLz51u8Wm4przJb0kfvgv1hT6/pz4s6XJzT53G+GdrJFrPcMQ+VlmPm?=
 =?us-ascii?Q?kcxeC7gzV7gPNHHfZz0s5FALZqayvjSX5Bn3sIiETdAxU8y2q/sJJR4y9VYy?=
 =?us-ascii?Q?vrWhOuATbAB/MR8ArlMX6s9am01GH2S7Rhad60vEMifqvMnLGRmsKgd+a6XM?=
 =?us-ascii?Q?LNT/3C4ChtpXUqbjDSi3zNfgqVRhy/1vpv/LWBwtN8edaG+fGXOzTcmmL+aI?=
 =?us-ascii?Q?AYhhxWa5eraHTNYuF0Gt8VgLTPB3Q/aP+hB9+DKzRTw70ZABWxslQRZo79UA?=
 =?us-ascii?Q?jAOjkAn6Y/kdINWqAsSQN3XCdn1Jp/uO+vCpLaHfgHdHt2UNF7EsOHYB0Y9e?=
 =?us-ascii?Q?iMTPbubf6ZIVEtz9BFFs+0dy6uOoVt1Hl6NFT1+8pgA0IgI7MJGIplTlcILK?=
 =?us-ascii?Q?8nKfvF0ppy8yTY4mLXhiQsNpzbP9CP3iuSXZolucUcYbnxk3PB3hvPwNlg9X?=
 =?us-ascii?Q?QWNvZ7EGgmkQBaFkLBXKwNbsTnX4MH3muKJX1IGj9wUOp+0Gl7cIZPx7ffLa?=
 =?us-ascii?Q?K809+ydW9wwWExaqw9Hr56SMIEVTSx0x51cAFd+vUUamKNhJE9lNg/CXmuSa?=
 =?us-ascii?Q?iIKnGpa8uBc9tnEb/qAizVQXiqyqP5+1izAJTda/ZjPksOnOZ3+YyxuI22Ls?=
 =?us-ascii?Q?DrWCua69ALOe5TiibkwviWk0mscE6q0l4CJ7+Z2WJ+XKKW7MgKE8M86UWwiE?=
 =?us-ascii?Q?lI/glGY1R8n85oPC/8H2dc7SRs6hmtOcv16Kt9uRiC4ecGy/1Js+bR3BPzPE?=
 =?us-ascii?Q?RZGJOvdTPNTyvCgzQted4MvWVxGJbiCocIIhIlIDO5f630hEKpHNT3YSvZba?=
 =?us-ascii?Q?x69gmaBAxrnM6Q9y/42i7QdewfPFI9ywfQ7hHqi7uz1+4hP9eaz9t77P5X94?=
 =?us-ascii?Q?LxRPjBSrcL2V5AUQa5Sss8Ix3FRTZ+PJ1K2NG/xdHKzvgM2ePAHqfKJeJaNQ?=
 =?us-ascii?Q?BYjufohVY3uKUo8juZDJ/rGXetZGwITrrvlGBiAQZY6O+Irnq6fEPAVFxkxd?=
 =?us-ascii?Q?4XiyWgTfTeONU6v89argO/+ACyqaIJHhLE9jW6moVG7f6dPHR4L+mJW5Mfwi?=
 =?us-ascii?Q?L3o7EJninIDa96AHOfkuhNLuRya7XV0kh5I7nz1GEGmgcfQAcmAIo+7cCybt?=
 =?us-ascii?Q?QjT7OWytAgmEOyjXHo8Us9wh86ae9gxBr4BIpj17uiRtM7gfMkOXssE8P574?=
 =?us-ascii?Q?Kck3KefWkNDjz4zyPXQQFsrFdWCRpe5GUZIPCwdpmkcX96N5x65NzcZQwoZ8?=
 =?us-ascii?Q?szUPhnAkEFCCCYUsoAa6/YRwTPyMBrHfO2SR/h2hqwPcecmmT7n6dljCWWnH?=
 =?us-ascii?Q?EWvZ+EpkqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e45e4c62-2dea-4cc7-0a73-08df3e6718d9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:03.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5oGCdHJJWXMAQ/YfTtE0YzdYI/idOfDofB3zPpWGzDjhp1eqcvM4Lhe+n20dAKPxL3Uzvmq0ODO2EA4ui90LLVANJNIF4yTEVhZWuzFe3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249821
Content-Type: text/plain; charset="utf-8"

- Drop builddep.patch as fix is part of release
- Refresh exisitng patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...001-Make-manpages-mulitlib-identical.patch |  7 ++--
 ...groff-not-found-in-cross-compilation.patch | 15 ++++-----
 ...E_DATE_EPOCH-for-reproducible-builds.patch |  7 ++--
 .../groff/files/build-less.patch              | 22 +++++++++++--
 .../groff/files/builddep.patch                | 33 -------------------
 ...groff-not-search-fonts-on-build-host.patch | 13 ++++----
 .../{groff_1.24.2.bb =3D> groff_1.25.0.bb}      |  3 +-
 7 files changed, 38 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/builddep.patch
 rename meta/recipes-extended/groff/{groff_1.24.2.bb =3D> groff_1.25.0.bb} =
(95%)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-=
identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-muli=
tlib-identical.patch
index 6dc84c90623..093f447bc22 100644
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
index e9214519e78..c1db0134f8c 100644
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
index 8ab3668edce..512ba81585c 100644
--- a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-f=
or-reproducible-builds.patch
+++ b/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-f=
or-reproducible-builds.patch
@@ -1,4 +1,4 @@
-From f28f0c4d8dfdfb1c173d21df6ffbe35448fada9f Mon Sep 17 00:00:00 2001
+From ac24fa823dbe17630cfe7e1e9ec56abd5767cd4c Mon Sep 17 00:00:00 2001
 From: Zhang Peng <peng.zhang1.cn@windriver.com>
 Date: Mon, 9 Mar 2026 20:10:00 +0800
 Subject: [PATCH] gropdf: use SOURCE_DATE_EPOCH for reproducible builds
@@ -17,7 +17,7 @@ Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
  1 file changed, 7 insertions(+)
=20
 diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
-index f519a53..3a79b4c 100644
+index cf996d8..3d7ec2d 100644
 --- a/src/devices/gropdf/gropdf.pl
 +++ b/src/devices/gropdf/gropdf.pl
 @@ -30,6 +30,13 @@ use POSIX qw(mktime);
@@ -34,6 +34,3 @@ index f519a53..3a79b4c 100644
  use constant
  {
      WIDTH    =3D> 0,
---=20
-2.50.0
-
diff --git a/meta/recipes-extended/groff/files/build-less.patch b/meta/reci=
pes-extended/groff/files/build-less.patch
index dc560fbb309..62cd9f1718a 100644
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
index 71c23d60b5a..00000000000
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
index 111dbd385e5..b1e7a08cf3d 100644
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
similarity index 95%
rename from meta/recipes-extended/groff/groff_1.24.2.bb
rename to meta/recipes-extended/groff/groff_1.25.0.bb
index e13996500fc..c54bb021077 100644
--- a/meta/recipes-extended/groff/groff_1.24.2.bb
+++ b/meta/recipes-extended/groff/groff_1.25.0.bb
@@ -12,12 +12,11 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-groff-fix-test-groff-not-found-in-cross-compilation=
.patch \
            file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-build=
s.patch \
-           file://builddep.patch \
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
