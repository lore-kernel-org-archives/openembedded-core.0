Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4689.1610424140972199212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 20:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103386225"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 12:02:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A6C1E4CE6031
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 12:02:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 12:02:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] binutils: upgrade 2.35 -> 2.35.1
Date: Tue, 12 Jan 2021 12:01:57 +0800
Message-ID: <1610424117-18134-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A6C1E4CE6031.A0994
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../binutils/{binutils-2.35.inc => binutils-2.35.1.inc}     | 6 +++---
 ...s-canadian_2.35.bb => binutils-cross-canadian_2.35.1.bb} | 0
 ...testsuite_2.35.bb => binutils-cross-testsuite_2.35.1.bb} | 0
 .../{binutils-cross_2.35.bb => binutils-cross_2.35.1.bb}    | 0
 ...inutils-crosssdk_2.35.bb => binutils-crosssdk_2.35.1.bb} | 0
 .../binutils/{binutils_2.35.bb => binutils_2.35.1.bb}       | 0
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.35.inc => binutils-2.35.1.inc} (96%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.35.bb => binutils-cross-canadian_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.35.bb => binutils-cross-testsuite_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.35.bb => binutils-cross_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.35.bb => binutils-crosssdk_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.35.bb => binutils_2.35.1.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils-2.35.inc
rename to meta/recipes-devtools/binutils/binutils-2.35.1.inc
index aa02063b19..c92cb75543 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
@@ -16,15 +16,15 @@ def binutils_branch_version(d):
 
 # When upgrading to 2.35, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.35"
-CVE_VERSION = "2.35"
+PV = "2.35.1"
+CVE_VERSION = "2.35.1"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
 BRANCH ?= "binutils-2_35-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "89a9065674a14a8bd94bb326b27d19a2f3583efb"
+SRCREV ?= "7e46a74aa3713c563940960e361e08defda019c2"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.bb
rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.35.bb b/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.35.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.35.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.35.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.35.bb b/meta/recipes-devtools/binutils/binutils_2.35.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.35.bb
rename to meta/recipes-devtools/binutils/binutils_2.35.1.bb
-- 
2.25.1



