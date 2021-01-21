Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.2963.1611204995774842424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 20:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; 
   d="scan'208";a="103685435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 12:56:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 129974CE6033
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 12:56:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 12:56:16 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.15.0 -> 1.15.1
Date: Thu, 21 Jan 2021 12:56:12 +0800
Message-ID: <1611204972-44584-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 129974CE6033.A3E9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh the followning patches:
0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...rt-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 8 ++++----
 .../gpgme/{gpgme_1.15.0.bb => gpgme_1.15.1.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.15.0.bb => gpgme_1.15.1.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 0ed4eb6818..0c15cc7c38 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -11,11 +11,11 @@ Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/gpgme.m4 | 58 ++++++++++------------------------------------------------
+ src/gpgme.m4 | 58 +++++++++-------------------------------------------
  1 file changed, 10 insertions(+), 48 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 2a72f18..6c2be44 100644
+index c749a5d..8579146 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -1,5 +1,5 @@
@@ -29,7 +29,7 @@ index 2a72f18..6c2be44 100644
  # WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
  # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  #
--# Last-changed: 2018-11-12
+-# Last-changed: 2020-11-20
 +# Last-changed: 2014-10-02
  
  
@@ -130,5 +130,5 @@ index 2a72f18..6c2be44 100644
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/gpgme/gpgme_1.15.0.bb b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.15.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.15.1.bb
index 9264af8c5d..dc38aa8e3c 100644
--- a/meta/recipes-support/gpgme/gpgme_1.15.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[sha256sum] = "0b472bc12c7d455906c8a539ec56da0a6480ef1c3a87aa5b74d7125df68d0e5b"
+SRC_URI[sha256sum] = "eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.25.1



