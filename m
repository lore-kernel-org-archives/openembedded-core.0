Return-Path: <swee.aun.khor@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C75467827A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:40:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 20:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,382,1496127600"; d="scan'208";a="113344708"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2017 20:40:08 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 13:29:42 -0700
Message-Id: <185642c5b25d1ec86427a126cdb974ba558f00e9.1500495522.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1500495522.git.swee.aun.khor@intel.com>
References: <cover.1500495522.git.swee.aun.khor@intel.com>
Subject: [PATCH 2/2] libffi: Support musl-x32 build
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
X-List-Received-Date: Thu, 20 Jul 2017 03:40:08 -0000

From: sweeaun <swee.aun.khor@intel.com>

Added target musl-x32 in configure.ac to support musl-x32 build in libffi.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 .../0001-libffi-Support-musl-x32-build.patch       | 30 ++++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
new file mode 100644
index 0000000..6b167c8
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
@@ -0,0 +1,30 @@
+From 69c3906c85c791716bf650aa36d9361d22acf3fb Mon Sep 17 00:00:00 2001
+From: sweeaun <swee.aun.khor@intel.com>
+Date: Thu, 6 Jul 2017 16:32:46 -0700
+Subject: [PATCH] libffi: Support musl x32 build
+
+Support libffi build with target musl-x32.
+
+Upstream-Status: Pending
+
+Signed-off-by: sweeaun <swee.aun.khor@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a7bf5ee..8ebe99c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -177,7 +177,7 @@ case "$host" in
+ 	TARGETDIR=x86
+ 	if test $ac_cv_sizeof_size_t = 4; then
+ 	  case "$host" in
+-	    *-gnux32)
++	    *-gnux32 | *-muslx32)
+ 	      TARGET=X86_64
+ 	      ;;
+ 	    *)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 43eee8e..2a3f4b7 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://not-win32.patch \
 	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
            file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
+           file://0001-libffi-Support-musl-x32-build.patch \
 	   "
 
 SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
-- 
2.7.4


