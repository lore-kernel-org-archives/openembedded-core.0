Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2932AEB8FAD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 06:56:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2955.1693983377873006837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 23:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132300221"
X-IronPort-AV: E=Sophos;i="6.02,231,1688396400"; 
   d="scan'208";a="132300221"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:56:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DCBECC3F82
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Sep 2023 15:56:12 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 17898CF7CD
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Sep 2023 15:56:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28C958567A;
	Wed,  6 Sep 2023 15:56:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.15.2 -> 1.16.0
Date: Wed,  6 Sep 2023 14:56:03 +0800
Message-Id: <1693983363-16998-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.005
X-TMASE-Result: 10--1.904400-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrkdS3kPlaZyVkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ9o7nBvaGi9B4jcxYN7NUiX+xRIVoKNMvCLLJGCSgZKkMWmlhq9IKaUbJA
	HWhH3kCkaHzAP4nvTfGSHh26BdyavXDhE4WitGxsarbFSPCqyamJAMgmwOylcXYnaoL/fgOyGOn
	vl4tWofF9I3HgybRyEyh2C7EeKtCx8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFP5VcuLgviPbE5fI
	3vJdozZ/FMtxCG3SEoGJeoX0Fn0GgxRG7cIgx4wQgDtUweCOgZRM45+NMrT7yS8QzIlhgmmx3Yy
	BPMCwlOx9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 06:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187278

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Implement OpenPGP using librpm API

0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
removed since it's included in 1.16.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...les-with-pkg-config-not-with-cmake-m.patch | 27 -------------------
 .../{librepo_1.15.2.bb => librepo_1.16.0.bb}  |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
 rename meta/recipes-devtools/librepo/{librepo_1.15.2.bb => librepo_1.16.0.bb} (86%)

diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
deleted file mode 100644
index d61d8fbf85..0000000000
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 25113b34bc1aae377d7bf447e69528783e2c177e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:23:27 +0200
-Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
- (which doesn't work properly)
-
-Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config support and is not interested in it]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a45d5c4..40249e6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -32,7 +32,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
- PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
- PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
- FIND_PACKAGE(CURL 7.52.0 REQUIRED)
--FIND_PACKAGE(Gpgme REQUIRED)
-+PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
-+set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
- 
- 
- IF (WITH_ZCHUNK)
diff --git a/meta/recipes-devtools/librepo/librepo_1.15.2.bb b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
similarity index 86%
rename from meta/recipes-devtools/librepo/librepo_1.15.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.16.0.bb
index 995301d601..ef29ecdd4f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.15.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
-           file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "1a0a5fd2b040d00872118b32d09d1f79730897a2"
+SRCREV = "7c9af219abd49f8961542b7622fc82cfdaa572e3"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


