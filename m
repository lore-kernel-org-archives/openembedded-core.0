Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B24CD495E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 06:47:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10144.1695278870354190907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 23:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ohxYyMbD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=762864786e=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38L5uDHG020164;
	Thu, 21 Sep 2023 06:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=arAdb
	P6TbPDbL9fL/ZD3ffxcLzR7vOPjBfH8QTFWumM=; b=ohxYyMbDEMpFOaACLbOi7
	avdyly2fvZ1bo5RgRLvQTvYZ/Ci1sVxX1F+2f8qinKesqQZtbrj0zcr47xZfHC07
	9jl6Y8p9tjwQE7NOOjaZDIUKLCBhnQ8LiSbPSeNIBFibmkrgRgXyn1yVEMFEd1vY
	Ba6fcYA8kYEC/KrQ0aPMcjUwDiq/Kp3xAd1UHmgfpGpeRQ6XITNBiGwDGMFY4UWa
	baeSZq8dPrxgjNQ6krgb1/Fzi+xGRdTCi8fwuadnX9w0XQkVhv/O7ksCSmGIg1YZ
	pS1QTkDH2/45tAfiiraZAt2yKSp27rceBAQI3rUev/Q/xjgx9W4MYKi62gVEzMdi
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxcbmv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Sep 2023 06:47:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 23:47:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 23:47:29 -0700
From: <kai.kang@windriver.com>
To: <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] adwaita-icon-theme: 43 -> 45.0
Date: Thu, 21 Sep 2023 14:47:27 +0800
Message-ID: <20230921064727.1260198-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VX2qTyROv5_rYPbOwiRlk4hk7zwTiXVa
X-Proofpoint-ORIG-GUID: VX2qTyROv5_rYPbOwiRlk4hk7zwTiXVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_04,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=800 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309210058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 06:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187974

From: Kai Kang <kai.kang@windriver.com>

Update adwaita-icon-theme from 43 to 45.0.

* meson is used to replace autotools, then the patch is redundant
* not overwrite PACKAGES and split license files to ${PN}-doc

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* not overwrite PACKAGES and split license files to ${PN}-doc

 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    | 27 -------------------
 ...theme_43.bb => adwaita-icon-theme_45.0.bb} | 11 ++++----
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb => adwaita-icon-theme_45.0.bb} (84%)

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
similarity index 84%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
index 8cb4d147f1..076dc63427 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
@@ -10,15 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
+GNOMEBASEBUILDCLASS = "meson"
+inherit allarch gnomebase gtk-icon-cache
 
-SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
-
-SRC_URI[archive.sha256sum] = "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6"
+SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
 
 DEPENDS += "librsvg-native"
 
-PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
+PACKAGES =+ "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires"
 
 RREPLACES:${PN} = "gnome-icon-theme"
 RCONFLICTS:${PN} = "gnome-icon-theme"
@@ -37,4 +36,6 @@ FILES:${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
 FILES:${PN} = "${prefix}/share/icons/Adwaita/ \
                ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
 
+FILES:${PN}-doc = "${prefix}/share/licenses/adwaita-icon-theme"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


