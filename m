Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9D873199
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688754"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:19 +0300
Message-Id: <defb5d02174249800cf5f1e9e6741de38830d41a.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/15] nss: update to 3.25
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nss/{nss_3.24.bb => nss_3.25.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/nss/{nss_3.24.bb => nss_3.25.bb} (97%)

diff --git a/meta/recipes-support/nss/nss_3.24.bb b/meta/recipes-support/nss/nss_3.25.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.24.bb
rename to meta/recipes-support/nss/nss_3.25.bb
index c7c9fab..eff09eb 100644
--- a/meta/recipes-support/nss/nss_3.24.bb
+++ b/meta/recipes-support/nss/nss_3.25.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_24_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_25_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -25,8 +25,8 @@ SRC_URI = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
-SRC_URI[md5sum] = "35854c549cb02100d0f90a6ef328e2e8"
-SRC_URI[sha256sum] = "2f0841492f91cca473b73dec6cab9cf765a485e032d48d2e8ae7261e54c419ed"
+SRC_URI[md5sum] = "23169c406adc8ac3672d34bf9ea2433d"
+SRC_URI[sha256sum] = "5d1ad475da19d0c033a716350dc5f8a747999d3eba5ac07ee0368c5bad6e2359"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.9.3


