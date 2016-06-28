Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6795731BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745545"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:19 +0300
Message-Id: <1467101180-23116-9-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/10] nss: update to 3.24
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:39 -0000

Drop merged 0001-Fix-build-failure-on-opensuse-13.1.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-build-failure-on-opensuse-13.1.patch  | 27 ----------------------
 .../nss/{nss_3.23.bb => nss_3.24.bb}               |  7 +++---
 2 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
 rename meta/recipes-support/nss/{nss_3.23.bb => nss_3.24.bb} (96%)

diff --git a/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch b/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
deleted file mode 100644
index cb3ad00..0000000
--- a/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8758c6a4508a5ca01505a8d69a269c912ce10bee Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 18 Jan 2016 18:26:16 +0000
-Subject: [PATCH] Fix build failure on opensuse 13.1
-
-Upstream-Status: Inappropriate [gcc 4.8 specific issue]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- nss/cmd/modutil/install-ds.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/cmd/modutil/install-ds.h b/nss/cmd/modutil/install-ds.h
-index 3a3afb3..433efe0 100644
---- a/nss/cmd/modutil/install-ds.h
-+++ b/nss/cmd/modutil/install-ds.h
-@@ -243,7 +243,7 @@ struct Pk11Install_Info_str {
- Pk11Install_Info*
- Pk11Install_Info_new();
- void
--Pk11Install_Info_init();
-+Pk11Install_Info_init(Pk11Install_Info* _this);
- void
- Pk11Install_Info_delete(Pk11Install_Info* _this);
- /*// Returns NULL for success, error message if parse error.*/
--- 
-1.8.4.5
-
diff --git a/meta/recipes-support/nss/nss_3.23.bb b/meta/recipes-support/nss/nss_3.24.bb
similarity index 96%
rename from meta/recipes-support/nss/nss_3.23.bb
rename to meta/recipes-support/nss/nss_3.24.bb
index 2663ff7..95a33f2 100644
--- a/meta/recipes-support/nss/nss_3.23.bb
+++ b/meta/recipes-support/nss/nss_3.24.bb
@@ -15,17 +15,16 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_23_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_24_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
-    file://0001-Fix-build-failure-on-opensuse-13.1.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
-SRC_URI[md5sum] = "21c3fed84441b2ab4c50ac626f6517e7"
-SRC_URI[sha256sum] = "94b383e31c9671e9dfcca81084a8a813817e8f05a57f54533509b318d26e11cf"
+SRC_URI[md5sum] = "35854c549cb02100d0f90a6ef328e2e8"
+SRC_URI[sha256sum] = "2f0841492f91cca473b73dec6cab9cf765a485e032d48d2e8ae7261e54c419ed"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.8.1


