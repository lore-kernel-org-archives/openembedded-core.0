Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A07C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:10:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.74107.1705309836492062809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146153134"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146153134"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:10:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CE7FD6188
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:10:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9293BF91E
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 208096895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:10:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D6AA1A0070;
	Mon, 15 Jan 2024 17:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.26.2 -> 1.26.3
Date: Mon, 15 Jan 2024 17:08:40 +0800
Message-Id: <1705309720-24200-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--4.395800-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yac5iScNn9Chzvw8i1YocQ/HwEnu5JwrbXYW
	2eXId8+tdB9aRZ3DyIR0k9rNFRNTRW94Ipa1otxouce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYrVnVnu9zwYNXEG1LCXlWK7J1E/nrJFED9DEMPvvoocvnKRrn2xogKjRpQ
	2DB/HGbqU/7ad5UmbXy/xplKnyOpyzXVR6bXx5eirLqyE6Ur/jGYkyyELuGKTVtKZKT0dQ2g7oY
	cfGGBkPsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXKSqPk8tNF0yLQktRBMPRerMbnK
	MJv/s4O1699KTUn4jTWwqRzstOUuvplQvT0Ztg3A+wX3konem+UbJlFKLsooJ3PPeBkjqYD+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193648

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
refreshed for 1.26.3

Changelog:
 https://github.com/numpy/numpy/releases/tag/v1.26.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...earch-usr-and-so-on-for-libraries-by-default-.patch | 10 ++++------
 ...python3-numpy_1.26.2.bb => python3-numpy_1.26.3.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.2.bb => python3-numpy_1.26.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 9f5f25f9b5..bbe309c556 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 27f6687e49bf555fc494d2f14bae6ecd0fa30f14 Mon Sep 17 00:00:00 2001
+From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,15 +8,16 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 82e864a..135246d 100644
+index feb28f6..a48d6d1 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -323,44 +323,14 @@ if sys.platform == 'win32':
+@@ -327,44 +327,14 @@ def add_system_root(library_root):
          add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
@@ -67,6 +68,3 @@ index 82e864a..135246d 100644
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb b/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.26.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.3.bb
index 253b334367..023d40a9b2 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f65738447676ab5777f11e6bbbdb8ce11b785e105f690bc45966574816b6d3ea"
+SRC_URI[sha256sum] = "697df43e2b6310ecc9d95f05d5ef20eacc09c7c4ecc9da3f235d39e71b7da1e4"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


