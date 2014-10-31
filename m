Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 382B371F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 21:54:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 14:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="629256859"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.109])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 14:54:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 14:54:46 -0700
Message-Id: <1414792488-4932-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
References: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3] pseudo*.bb: update to pseudo 1.6.2
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
X-List-Received-Date: Fri, 31 Oct 2014 21:54:49 -0000

From: Peter Seebach <peter.seebach@windriver.com>

pseudo 1.6.2 fixes problems with 64-bit inodes and some underlying issues
involving file renames that could occasionally cause very strange behaviors
files being deleted, linked, or renamed, mostly observed as strange
recovery if an inode got reused.

(From OE-Core rev: b2c6a032d6e5deb07e76ed75fcd0931fad6a748c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
	meta/recipes-devtools/pseudo/pseudo_git.bb
---
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb | 15 ---------------
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb | 10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 3 files changed, 12 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
deleted file mode 100644
index 215cdb8..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require pseudo.inc
-
-PR = "r4"
-
-SRC_URI = " \
-    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
-    file://0001-pseudo_has_unload-add-function.patch \
-    file://shutdownping.patch \
-    file://pseudo-1.5.1-install-directory-mode.patch \
-"
-
-SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
-SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
-
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
new file mode 100644
index 0000000..ece50bf
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -0,0 +1,10 @@
+require pseudo.inc
+
+SRC_URI = " \
+    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
+SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
+
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 66fc85f..8c6f06a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "b9eb2b5633b5a23efe72c950494728d93c2b5823"
-PV = "1.5.1+git${SRCPV}"
+SRCREV = "0dc29e7c67f25d0978a7da5cd8965514912c5b36"
+PV = "1.6.2+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.8.3.1


