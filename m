Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FECEE14AA
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 02:24:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4987.1694053458720108354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 19:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="110523909"
X-IronPort-AV: E=Sophos;i="6.02,233,1688396400"; 
   d="scan'208";a="110523909"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:24:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B6ACA1ED
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Sep 2023 11:24:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7806D8BCB
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Sep 2023 11:24:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7374DE20C1;
	Thu,  7 Sep 2023 11:24:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] librepo: upgrade 1.15.2 -> 1.16.0
Date: Thu,  7 Sep 2023 10:24:04 +0800
Message-Id: <1694053444-23870-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27860.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27860.004
X-TMASE-Result: 10-1.208800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AEa8g1x8eqFxdHX2eZFfZf2jo
	ixXbhErdcTFAN0zkeIoHtCsudlh1MFzVT4QVLabLdCok3ibXlQU50qcJ5WOMhmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1k+NIq1Dk9D/C4t+x11UWc+HKRD8xO3GshKFkT43NV1W4Ut+pi5oFfigBI
	VkcTlKr5z7wz9k6GwENhUgpt0ndLEneQ4JjHJ7OqgQYbcz5U7JTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 02:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187360

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Implement OpenPGP using librpm API

0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
refreshed for 1.16.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...les-with-pkg-config-not-with-cmake-m.patch | 21 +++++++++++--------
 .../{librepo_1.15.2.bb => librepo_1.16.0.bb}  |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.15.2.bb => librepo_1.16.0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index d61d8fbf85..a0a4d490f1 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -12,16 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a45d5c4..40249e6 100644
+index cd975a8..713cc87 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,7 +32,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
- PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
- PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
+@@ -35,7 +35,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
  FIND_PACKAGE(CURL 7.52.0 REQUIRED)
--FIND_PACKAGE(Gpgme REQUIRED)
-+PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
-+set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
  
- 
- IF (WITH_ZCHUNK)
+ IF (USE_GPGME)
+-    FIND_PACKAGE(Gpgme REQUIRED)
++    PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
++    set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
+ ELSE (USE_GPGME)
+     PKG_CHECK_MODULES(RPM REQUIRED rpm>=4.18.0)
+ ENDIF (USE_GPGME)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/librepo/librepo_1.15.2.bb b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.15.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.16.0.bb
index 995301d601..4710a6b72a 100644
--- a/meta/recipes-devtools/librepo/librepo_1.15.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.16.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "1a0a5fd2b040d00872118b32d09d1f79730897a2"
+SRCREV = "7c9af219abd49f8961542b7622fc82cfdaa572e3"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


