Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AFE6B731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875740009"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:50 +0200
Message-Id: <e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/17] nss: update to 3.21
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} (97%)

diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.21.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.19.2.bb
rename to meta/recipes-support/nss/nss_3.21.bb
index c51b056..86f1672 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -24,8 +24,8 @@ SRC_URI = "\
     file://signlibs.sh \
 "
 
-SRC_URI[md5sum] = "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
-SRC_URI[sha256sum] = "1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
+SRC_URI[md5sum] = "3c8b2ed880dd3a8d86c9e0151afe6eba"
+SRC_URI[sha256sum] = "3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.6.2


