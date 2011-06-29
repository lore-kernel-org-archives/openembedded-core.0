Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QbqFv-00025J-Ng
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 10:36:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 01:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,442,1304319600"; d="scan'208";a="19596521"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 01:32:35 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 16:47:07 +0800
Message-Id: <07a5761b6fa0f48dcea9fffcc86046d569444d9e.1309337151.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309337151.git.dongxiao.xu@intel.com>
References: <cover.1309337151.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1309337151.git.dongxiao.xu@intel.com>
References: <cover.1309337151.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] Upstream-Status: update the status for some patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 08:36:19 -0000

gypsy: fix-unused-but-set-variable-warning.patch
telepathy-python: parallel_make.patch
opkg-utils: mtime-int.patch
opkg: headerfix.patch
flac: flac-gcc43-fixes.patch
libsamplerate0: libsamplerate-0.1.7-macro-quoting.patch

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../fix-unused-but-set-variable-warning.patch      |    2 +-
 .../telepathy-python-0.15.19/parallel_make.patch   |    3 ++-
 .../opkg-utils/opkg-utils/mtime-int.patch          |    1 +
 .../opkg/opkg-0.1.8/headerfix.patch                |    2 +-
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |    2 +-
 .../libsamplerate-0.1.7-macro-quoting.patch        |    2 +-
 6 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch b/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
index 8dbf3ef..94523be 100644
--- a/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
+++ b/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 Index: gypsy-0.8/gypsy/gypsy-time.c
 ===================================================================
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
index f1f3f56..2488246 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
+++ b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
@@ -5,7 +5,8 @@ src/_generated directory that tasks are based on.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
+(However it seems that this project is out of maintanence.)
 
 diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
 --- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.000000000 +0800
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
index fdbce21..483a62a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
@@ -13,6 +13,7 @@ gain by this change.
 Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
 
 Upstream-Status: Pending
+(Contacting the original author, no response yet.)
 
 Index: opkg-utils/opkg-make-index
 ===================================================================
diff --git a/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch b/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
index b3515a0..f68524b 100644
--- a/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
+++ b/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
@@ -2,7 +2,7 @@ Without this, the FILE reference in this header can cause compile issues.
 
 RP - 29/1/10
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: trunk/libopkg/pkg_dest.h
 ===================================================================
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch b/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
index 9c528c2..6b66599 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
@@ -1,6 +1,6 @@
 # Acquired from OpenEmbedded
 # Fix no declaration of memcmp()
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 diff -urN flac-1.2.1-orig/examples/cpp/encode/file/main.cpp flac-1.2.1/examples/cpp/encode/file/main.cpp
 --- flac-1.2.1-orig/examples/cpp/encode/file/main.cpp	2010-06-23 15:06:29.159481339 +0800
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
index 878f969..1518d7e 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 diff -ruN libsamplerate-0.1.7-orig//acinclude.m4 libsamplerate-0.1.7/acinclude.m4
 --- libsamplerate-0.1.7-orig//acinclude.m4	2011-04-20 15:04:25.147664992 +0800
-- 
1.7.1



