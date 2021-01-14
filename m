Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: v/W/Qg4YF74YX1+H5IXbSRkjF+zaQKIKw93Mq/AEwCAaqzkkMDdpXmOSFEf693lIs3QOVRsg6r
 U/4/roUWbWFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062702"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062702"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:13 -0800
IronPort-SDR: RsZXzGimdpJhDKM/oO1O2XIUhe7fC1pjV9TnlDI9CebR/J4VpEnjm1wlpEgrh8aXzLGcctAfwB
 Br7ADca+FSCQ==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986673"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:11 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/14] binutils: upgrade 2.35 -> 2.35.1
Date: Fri, 15 Jan 2021 00:09:47 +0800
Message-Id: <fbb752ea3b815d9a9475d4cbf7070a12ebea48e8.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cff69ee95a6ab49e6c6c1b1b2435e479e526c2c9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.29.2

