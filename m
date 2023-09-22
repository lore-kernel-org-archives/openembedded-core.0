Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1F3CD4F30
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 08:04:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16758.1695369862799753422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 01:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EkxF/Mgh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76293d9d5c=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M5Xj3m010870;
	Fri, 22 Sep 2023 01:04:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=o62sT
	vVSGZO+vLjoYx/KW4UQ4cde2FdtHTr2SWef34M=; b=EkxF/Mghu6HhK+zCjwWTu
	Y68znj+m8QWivcW0QarRPB8lndUGPlam92FOraCXT16fmumbJX2nNzit8LQCw845
	VZMF4t0JFsYlKotGJ+galk1smQKNVl/hTTN0TAASiCalR5u4JxWL+SmhsfD0hLJo
	rLTH+Q2eamsCsAVVHz5n8NblA9LnQFEBMrWgZtYRrmeRWfXx6GiyZc/p7BW4vEcD
	d9M9cj5iEiL+OOvIAzvw+WY4s+wOLAWTSKQKU7jWCjrfWme+UBn9MhLoHEE9sS+3
	ad65mJVtHfFi7LQrL4djW8U/dGt+/iZbPcM7ub6WKAMjfqvNbrD+nARjyAYF6xaa
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rkc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Sep 2023 01:04:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 22 Sep 2023 01:04:17 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 01:04:15 -0700
From: <kai.kang@windriver.com>
To: <alex.kanavin@gmail.com>
CC: <f_l_k@t-online.de>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] adwaita-icon-theme: 43 -> 45.0
Date: Fri, 22 Sep 2023 16:04:12 +0800
Message-ID: <20230922080412.842838-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t8V235WFqy9ISNekIbpqNx-c77xW5VD2
X-Proofpoint-GUID: t8V235WFqy9ISNekIbpqNx-c77xW5VD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_06,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=736
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309220065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188085

From: Kai Kang <kai.kang@windriver.com>

Update adwaita-icon-theme from 43 to 45.0.

* meson is used to replace autotools, then the patch is redundant
* not overwrite PACKAGES, and remove sub-packages ${PN}-hires and
  ${PN}-symbolic-hires which are created to handle big icon files which
  do not exist in adwaita-icon-theme 45.0
* update FILES of ${PN}-symbolic and split license files to ${PN}-doc

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v3:
* fix oe-selftest error
* update FILES
* boot core-image-sato and the icons look fine

 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    | 27 -------------------
 ...theme_43.bb => adwaita-icon-theme_45.0.bb} | 24 +++++------------
 2 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb => adwaita-icon-theme_45.0.bb} (40%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
deleted file mode 100644
index 0a1487f8e3..0000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 30 May 2017 14:55:49 +0300
-Subject: [PATCH] Don't use AC_CANONICAL_HOST
-
-This won't work when building allarch (and is only used to find out if
-target is windows).
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6ddc49b..39752bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
- 
- AC_INIT([adwaita-icon-theme], [43],
-         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
--AC_CANONICAL_HOST
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_SRCDIR([index.theme.in])
- 
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
similarity index 40%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
index 8cb4d147f1..4dbcced5c3 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
@@ -10,31 +10,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
-
-SRC_URI[archive.sha256sum] = "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6"
+SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
 
 DEPENDS += "librsvg-native"
 
-PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
+PACKAGES =+ "${PN}-cursors ${PN}-symbolic"
 
 RREPLACES:${PN} = "gnome-icon-theme"
 RCONFLICTS:${PN} = "gnome-icon-theme"
 RPROVIDES:${PN} = "gnome-icon-theme"
 
-FILES:${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
-FILES:${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/64x64/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
-FILES:${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic*.svg"
-FILES:${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
-                     ${prefix}/share/icons/Adwaita/512x512/"
-FILES:${PN} = "${prefix}/share/icons/Adwaita/ \
-               ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
+FILES:${PN}-cursors = "${datadir}/icons/Adwaita/cursors/"
+FILES:${PN}-symbolic = "${datadir}/icons/Adwaita/symbolic*/"
+FILES:${PN}-doc += "${datadir}/licenses/adwaita-icon-theme"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


