Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 59FC57751C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285536"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:38 -0700
Message-Id: <722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499127835.git.swee.aun.khor@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
Subject: [PATCH 7/7] libffi: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:18 -0000

From: sweeaun <swee.aun.khor@intel.com>

Upstream-Status: Pending.
Added target musl-x32 in configure.ac to support musl-x32 build in libffi.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 .../0001-libffi-Support-musl-x32-build.patch       | 29 ++++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
new file mode 100644
index 0000000..971a543
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
@@ -0,0 +1,29 @@
+From 62ac8214b3e8b368bd9365a6920b081aa0125671 Mon Sep 17 00:00:00 2001
+From: sweeaun <swee.aun.khor@intel.com>
+Date: Mon, 3 Jul 2017 13:23:31 -0700
+Subject: [PATCH] libffi: Support musl x32 build
+
+Support libffi build with target musl-x32.
+
+Signed-off-by: sweeaun <swee.aun.khor@intel.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a7bf5ee..f4e101d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -180,6 +180,9 @@ case "$host" in
+ 	    *-gnux32)
+ 	      TARGET=X86_64
+ 	      ;;
++            *-muslx32)
++              TARGET=X86_64
++              ;;
+ 	    *)
+ 	      TARGET=X86
+ 	      ;;
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


