Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web10.3926.1611214188878153789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 23:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HBkhdzun;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9FT1Ua6LI5l45MBOhEfMsI8rFBva0lu8ephsuakBCBDhdLR/je10AhJxEII6FJRQqPxhqqwpSUuBxwTdT5U9xMeYRQa5iZs4cxNnyGHxvcNHNOECwGwYxY/Gp4yaUFsUGtuFBfqVyO5Bnx/haBhgwaR4T9ZW/87pO/IqoH9lwO9O2hRwGEKZW1vmAcv1xdUunwP+BVbLNGhpnXLJZRdGTRH3UcyuQxYxjrjCZuS1mB92rcDlWe7sphezyqz4+XWx3xC7h4lqa1cYFVQbac6u0cA/prSfDaaMiiZeDyrLooDczrTZdHWr0wItiH4Df5jqmRsYxvAU2DAfs36osRQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHE921GuGqmm+B092lwkSmE62+s8LLZ+KRTQdnd607M=;
 b=KIaEq2xZwhcEH+l7nw3E1u9jcggp0PKMMd7Cyp8FG0zs3UNDIwYaAhP3umOLN0Ahj90ho7LC0Ze82JMxdpTR0RE2DnPq1qqX4GR3atln8NrtTIR5MddEaD5MgYXO3nI2XQryNuMzbdzk/72bZ9BLtvnp5z0uiCyoN30tTKv/XRydD8y2+SK4BnKVYni2g/5OC5RXMrwXjcqZs2s/cOlWjwxDTC/uApQjRMOKrJdXojv7+SIeGDBRX7PSP2GvH9gXx/8gbyhEAIkgAbcoIuZqjs2gEgC0wnJbhMfJlnX8H/AhijhklQXlFpiW3EWIAFBRXyH+XqGjLBd805e27hh1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHE921GuGqmm+B092lwkSmE62+s8LLZ+KRTQdnd607M=;
 b=HBkhdzune9wSZ5XQCJpIsQFTcfroNr4bcXC09Ukvq1fQ7ag20P3Xbi0qikoyLaNgfndRlE16j/fbEvT/7OAck0i3SpRBrz0rL/sdOWzSZ6x64aoBxEpmop5TRTjLbaONhQwUVyph9c0ymcdHD1Jxi1TwmgsWzU3QdHmClkQByOA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by BYAPR11MB3270.namprd11.prod.outlook.com (2603:10b6:a03:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 07:29:47 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28%5]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 07:29:47 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] adwaita-icon-theme: add version 3.34.3 back
Date: Thu, 21 Jan 2021 15:29:22 +0800
Message-Id: <20210121072922.34474-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0057.apcprd03.prod.outlook.com
 (2603:1096:202:17::27) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR03CA0057.apcprd03.prod.outlook.com (2603:1096:202:17::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend Transport; Thu, 21 Jan 2021 07:29:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4104ef5f-0271-471a-2a46-08d8bdde53cf
X-MS-TrafficTypeDiagnostic: BYAPR11MB3270:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32706285294166D900AF187395A10@BYAPR11MB3270.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CojgrFw+iUIciBUVwgwPwKb9n3IQDbRe4FebpMK22bdz3knRCoJcB+Qe9OQsTMZV4wwYLNDyp4wUeVatMhk/E5VmVpHZH0du0t05201yRVPaSIjVp6krGsVBZZ+HHKvQkBxTwOY2ojd2ErNIAQc/8CuQENQRfdbEOx1qQhaydiNSQf71ld87tcLeqbIi4tIetgZn9Ou3Bu9TFokdW0CaRbWNLE6U47Ibrpuul7m/DSXPYkRpijOakboLipqZL5ZydaXiOz5+mBynuP6LkVVaRRf05a8WvtYWLGCjNGZ3cyEPWEphUk0z7xwojJuNdSJ+p2dLkfLOQZG1tsfFEkQKDLxEeGCKlEear4Fy/4TCmJBcu3F1SC9vGyT3QJEJmWNenj7/UVx3X5AM8ERu61nNWICnBBJqBfk3IkA4uVWUS5i01o1kuBeFuSIGB03K67R8qPtlKX7slWoYTgSBXAt+7DlJMOw9fwfJSdHGKCli4xW+bejjER4bLtGcAMhf9qSrYLvT44MYAPn4q6eJvepc2eI0MWgmfnoYSzpYhS1RF+qY0U7xUpy3OSVrODiOlSzuYaD2ibWf7kcw3T3ktl9WLmCbKvQdGhh4KF80ZS5Cjnc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(346002)(136003)(66556008)(478600001)(9686003)(26005)(5660300002)(6512007)(83380400001)(6506007)(8936002)(52116002)(16526019)(186003)(6666004)(66476007)(66946007)(956004)(1076003)(86362001)(6916009)(36756003)(8676002)(2906002)(966005)(316002)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?tmBG+F2densQprco1jDCedJeZiEB649So/qFVK87V1Fj81FOpygPdPkwXsjd?=
 =?us-ascii?Q?Es9zFdOqLwyy0k754hYTlIV1+iAUgoCbEtUso6DbHOvXZeDIc2CTzkeVfrZ5?=
 =?us-ascii?Q?E1wSFIkgpFenw0VYcrOQQGnSJn8T+fFebR2ondYEFd4DyXUg9+mSQ3uvaHoR?=
 =?us-ascii?Q?XzTxPZuD3cowHuTX0fbgZKB7R4lffHFU9mq9tINBk6h8p7qPPYrvBCMn2Qvw?=
 =?us-ascii?Q?vz9SalFE7u0TmxeGWN4yqcdcL3N9wKFhclrJTPUSh+2AbnV32X/o25mqPdAj?=
 =?us-ascii?Q?3Z6b/rTs3+tSYQjwige8sYZfkugS9f4iIvwP+ftCsgEiCvyY7z9quSqhGVBg?=
 =?us-ascii?Q?gv2gRDvEEzhCyu/u9GSetybB4xjIsXnZaZ4F1+QO0b0hsKSE5UrZ6grx7Yu9?=
 =?us-ascii?Q?ZOhHIHO7zAYnxtUWe5FH7ExcyyfHwp9wOlrwAAZmH6DEWyt6gvfaA9ODiJle?=
 =?us-ascii?Q?ShejETbSxCkxEFLsgRL4gvazqw8W+wHJFqyVBjixPE42MWOOfu2aeA5f1STo?=
 =?us-ascii?Q?zcJN8cMhK80tmuQyoMhza8oSVSzT+RZ6Z0UkmEwJgB2u3fT/ibVPtk45aBYY?=
 =?us-ascii?Q?LJ79pDqylIBq9IEk32qhCPc62fUDMMlsrgiILn8+MK3Dk/xn79IgvYhq/+Br?=
 =?us-ascii?Q?I5ys6PqIpsMo4HkN7x/7y6Sop3gj82bKHqcUew/+cPgW1YKxtqmPGYKKxSls?=
 =?us-ascii?Q?+QpzwGbB4/cR1z2DVv1KWZGn6Z5V2GpL0IEvicvWmalCl3Xmz5uxSQ3se9Lx?=
 =?us-ascii?Q?ReO3NP0REkint/qZxjZ7xBWpKOpr0cUKXm4HOIgp04/a/i9ocuc01QZqy0i0?=
 =?us-ascii?Q?k4H3wkuEqHIX4UuCSKIWRLqimJl+4XIwLdK90BjYYbhNZhk5bZwjS3QruwAE?=
 =?us-ascii?Q?jiT3n7iUScwuSeqtrkYuEg9aJ5IcZLl+r8SUhbfLpFFuUgFwK4/ljWX6jLCX?=
 =?us-ascii?Q?OkBy7Lmw4ykSbCy8bVEVMH8qDRLhIPDg3CfDsshLmSuUMGudT7R4YF1DBUK2?=
 =?us-ascii?Q?f4d8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4104ef5f-0271-471a-2a46-08d8bdde53cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:29:46.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmgiN2fBCD0e1L+5U0uyMRZwAFz5RzZ12SZbkh1oM6RDHOVzL/GUigLnHiW8NHt99QPMoODzowNjjpbFmY5hbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3270
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Newer versions of adwaita-icon-theme can't work well with librsvg 2.40.
Boot up the core-image-sato image, and start "Media Player", most of the
icons are not showed properly.

The source code of librsvg has been adapted to rust, so it is impossible
to update librsvg in oe core for now. Then add adwaita-icon-theme 3.34.3
back and set as preferred version.

Duplicate one patch as well to fix patch fuzz issue.

Ref:
1. https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/84
2. https://people.gnome.org/~federico/blog/do-not-use-librsvg-2.40.x.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/distro/include/default-versions.inc |  1 +
 ...1-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch | 27 ++++++++++++
 .../gnome/adwaita-icon-theme_3.34.3.bb        | 43 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index a6f331350e..5e6fd8a267 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,3 +2,4 @@
 # Default preferred versions
 #
 
+PREFERRED_VERSION_adwaita-icon-theme ?= "3.34.3"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
new file mode 100644
index 0000000000..4ed5e151ee
--- /dev/null
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch
@@ -0,0 +1,27 @@
+From 8b3b153b6b95662316528ef083365b46cf5f7841 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 30 May 2017 14:55:49 +0300
+Subject: [PATCH] Don't use AC_CANONICAL_HOST
+
+This won't work when building allarch (and is only used to find out if
+target is windows).
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 449865d..888649e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
+ 
+ AC_INIT([adwaita-icon-theme], [3.34.3],
+         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
+-AC_CANONICAL_HOST
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_SRCDIR([index.theme.in])
+ 
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
new file mode 100644
index 0000000000..6cde6fffa3
--- /dev/null
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
@@ -0,0 +1,43 @@
+SUMMARY = "GTK+ icon theme"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
+SECTION = "x11/gnome"
+
+LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
+                    file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
+                    file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://0001-Don-t-use-AC_CANONICAL_HOST-3.34.3.patch \
+           file://0001-Run-installation-commands-as-shell-jobs.patch \
+           "
+
+SRC_URI[md5sum] = "9aea4ad9bc002aacad155ee0748b357f"
+SRC_URI[sha256sum] = "e7c2d8c259125d5f35ec09522b88c8fe7ecf625224ab0811213ef0a95d90b908"
+
+DEPENDS += "librsvg-native"
+
+PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
+
+RREPLACES_${PN} = "gnome-icon-theme"
+RCONFLICTS_${PN} = "gnome-icon-theme"
+RPROVIDES_${PN} = "gnome-icon-theme"
+
+FILES_${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
+FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/64x64/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
+FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
+                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png \
+                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic*.svg"
+FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
+                     ${prefix}/share/icons/Adwaita/512x512/"
+FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
+               ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

