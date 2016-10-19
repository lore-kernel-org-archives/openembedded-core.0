Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9874B71A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266979"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:51 +0300
Message-Id: <886a26cd3e2f88f1988b010e832471852148f9e3.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/19] nss: update to 3.27.1
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch     | 8 ++++----
 meta/recipes-support/nss/{nss_3.25.bb => nss_3.27.1.bb} | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/nss/{nss_3.25.bb => nss_3.27.1.bb} (97%)

diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
index 9caaaeb..9942bf19 100644
--- a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
+++ b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -13,11 +13,11 @@ Index: nss-3.24/nss/lib/freebl/pqg.c
 @@ -322,8 +322,8 @@ generate_h_candidate(SECItem *hit, mp_in
  
  static SECStatus
- addToSeed(const SECItem * seed,
--          unsigned long   addend,
--          int             seedlen, /* g in 186-1 */
+ addToSeed(const SECItem *seed,
+-          unsigned long addend,
+-          int seedlen, /* g in 186-1 */
 +          unsigned long long  addend,
 +          int                 seedlen, /* g in 186-1 */
-           SECItem * seedout)
+           SECItem *seedout)
  {
      mp_int s, sum, modulus, tmp;
diff --git a/meta/recipes-support/nss/nss_3.25.bb b/meta/recipes-support/nss/nss_3.27.1.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.25.bb
rename to meta/recipes-support/nss/nss_3.27.1.bb
index eff09eb..0917938 100644
--- a/meta/recipes-support/nss/nss_3.25.bb
+++ b/meta/recipes-support/nss/nss_3.27.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_25_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_1_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -25,8 +25,8 @@ SRC_URI = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
-SRC_URI[md5sum] = "23169c406adc8ac3672d34bf9ea2433d"
-SRC_URI[sha256sum] = "5d1ad475da19d0c033a716350dc5f8a747999d3eba5ac07ee0368c5bad6e2359"
+SRC_URI[md5sum] = "f18e1ebfe07969c84b890e45843edcb7"
+SRC_URI[sha256sum] = "fd3637a1930cd838239a89633a7ed9a18859ae9b599043f3a18f726dc4ec2a6b"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.9.3


