Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E945E77054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525565"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:26 +0300
Message-Id: <b00f2389c98a0f322a523658f3ae8d13db5cf49b.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/28] gcr, libsecret, webkitgtk: disable gtk-doc on mips64
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:35 -0000

It fails with the same error as gobject-introspection

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.20.0.bb             | 2 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.5.bb | 2 +-
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
index 11bca0f..b32a455 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -37,4 +37,4 @@ EXTRA_OECONF_append_x86-64 = " --disable-introspection --disable-gtk-doc"
 
 # Gcr-3.broken: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECONF_append_mips64 = " --disable-introspection"
+EXTRA_OECONF_append_mips64 = " --disable-introspection --disable-gtk-doc"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
index e4d316b..bcb3046 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
@@ -21,5 +21,5 @@ do_configure_prepend() {
 
 # Secret-1: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECONF_append_mips64 = " --disable-introspection"
+EXTRA_OECONF_append_mips64 = " --disable-introspection --disable-gtk-doc"
 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index 263992b..0b355c3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -110,4 +110,4 @@ EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
 
 # WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF "
+EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
-- 
2.9.3


