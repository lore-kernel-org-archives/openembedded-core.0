Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EC1EA7F388
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 03:08:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,353,1559491200"; d="scan'208";a="73113680"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 11:08:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 48F294CDFCE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 11:08:54 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 11:08:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 11:08:12 +0800
Message-ID: <20190807030812.24605-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 48F294CDFCE8.AAA88
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gpgme:upgrade 1.13.0 -> 1.13.1
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
X-List-Received-Date: Wed, 07 Aug 2019 03:08:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Refresh the following patch:
0007-python-Add-variables-to-tests.patch

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../gpgme/0007-python-Add-variables-to-tests.patch | 27 +++++++++++-----------
 .../gpgme/{gpgme_1.13.0.bb => gpgme_1.13.1.bb}     |  4 ++--
 2 files changed, 16 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.13.0.bb => gpgme_1.13.1.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch b/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
index af9ddbf..3c9b5c1 100644
--- a/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
+++ b/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
@@ -1,6 +1,6 @@
-From 317cdf60165d760572a26db317e3d6edb159b04e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Oct 2018 23:41:09 +0800
+From 044b8f442e64801cebb9fd821a46021c89bd4eed Mon Sep 17 00:00:00 2001
+From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+Date: Sun, 4 Aug 2019 21:39:03 +0900
 Subject: [PATCH 7/7] python: Add variables to tests
 
 * configure.ac, lang/python/Makefile.am:
@@ -9,16 +9,18 @@ Subject: [PATCH 7/7] python: Add variables to tests
 Upstream-Status: Submitted [gnupg-devel@gnupg.org]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 ---
  configure.ac            | 5 +++++
- lang/python/Makefile.am | 3 +++
- 2 files changed, 8 insertions(+)
+ lang/python/Makefile.am | 2 ++
+ 2 files changed, 7 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 865bd10..035555a 100644
+index bd85886..b5ae42e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -535,6 +535,11 @@ AC_ARG_ENABLE(g13-test,
+@@ -533,6 +533,11 @@ AC_ARG_ENABLE(g13-test,
           run_g13_test=$enableval)
  AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
  
@@ -31,17 +33,16 @@ index 865bd10..035555a 100644
  # Checks for header files.
  AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index ce9a108..0c8cfdc 100644
+index 551deee..60734d0 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -25,7 +25,10 @@ EXTRA_DIST = \
- 	doc \
- 	src
+@@ -23,7 +23,9 @@ EXTRA_DIST = \
+ 	gpgme.i \
+ 	helpers.c helpers.h private.h
  
 +if RUN_LANG_PYTHON_TESTS
- SUBDIRS = . tests
+ SUBDIRS = . tests examples doc src
 +endif
-+
  
  .PHONY: prepare
  prepare: copystamp
diff --git a/meta/recipes-support/gpgme/gpgme_1.13.0.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_1.13.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.13.1.bb
index cbd37da..9fc1ae2 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[md5sum] = "e511a0d95c507ab87e713140c82fc7d0"
-SRC_URI[sha256sum] = "d4b23e47a9e784a63e029338cce0464a82ce0ae4af852886afda410f9e39c630"
+SRC_URI[md5sum] = "198f0a908ec3cd8f0ce9a4f3a4489645"
+SRC_URI[sha256sum] = "c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.7.4




