Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 900E777444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440123"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:39 +0300
Message-Id: <47371e8d90ba68053b443cb22c1442ed46acaf93.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/25] rt-tests, hwlatdetect: upgrade to 2.0
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:10 -0000

0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch has been merged upstream

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch | 30 ----------------------
 .../{hwlatdetect_0.96.bb => hwlatdetect_2.0.bb}    |  0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  3 +--
 .../rt-tests/{rt-tests_0.96.bb => rt-tests_2.0.bb} |  2 +-
 4 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.96.bb => hwlatdetect_2.0.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.96.bb => rt-tests_2.0.bb} (93%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
deleted file mode 100644
index 00fcc7d..0000000
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9640dde4241e1314b8e8ea35b0c8dab0b30ae51f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Jan 2016 10:50:56 -0800
-Subject: [PATCH] Makefile: Set CC/AR variable only if it doesn't have a value
-
-This helps it compile with clang or any other compilers besides gcc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1e4b7d1..2c2d396 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,6 +1,6 @@
- VERSION = 0.96
--CC=$(CROSS_COMPILE)gcc
--AR=$(CROSS_COMPILE)ar
-+CC?=$(CROSS_COMPILE)gcc
-+AR?=$(CROSS_COMPILE)ar
- 
- OBJDIR = bld
- 
--- 
-2.6.4
-
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb b/meta/recipes-rt/rt-tests/hwlatdetect_2.0.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_2.0.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 76f9b3a..fd6500b 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,5 @@
 # Version v0.96
-PV = "0.96"
-SRCREV = "24f8c0175e04bab78e7555698e34d7002b01c87f"
+SRCREV = "e1b1537a20b35af75a49bf55dcf70296f8a62467"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
similarity index 93%
rename from meta/recipes-rt/rt-tests/rt-tests_0.96.bb
rename to meta/recipes-rt/rt-tests/rt-tests_2.0.bb
index 2f96fea..21780d1 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 require rt-tests.inc
 inherit ptest
 
-SRC_URI += "file://0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch \
+SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
            "
-- 
2.8.1


