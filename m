Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdm-0003Yc-Vv
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773902"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:42 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:11 +0200
Message-Id: <dc4c6f0d9e10e43ddf600970d29ae7fb1bc1c81e.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 12/17] systemtap: Upgrade to v2.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:37 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../systemtap/obsolete_automake_macros.patch       |   22 +++++---------------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 ++--
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch b/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
index c2d6d43..988cda4 100644
--- a/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
@@ -1,11 +1,11 @@
 Upstream-Status: Pending
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff --git a/configure.ac b/configure.ac
-index 2a30ea1..713800d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,6 @@ AC_PROG_LN_S
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -19,7 +19,6 @@ AC_PROG_LN_S
  AC_PROG_CC
  AC_PROG_CXX
  AC_PROG_CPP
@@ -13,15 +13,3 @@ index 2a30ea1..713800d 100644
  AM_PROG_CC_C_O
  AC_PROG_RANLIB
  AC_OBJEXT
-diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac
-index 48f48db..68152db 100644
---- a/runtime/staprun/configure.ac
-+++ b/runtime/staprun/configure.ac
-@@ -13,7 +13,6 @@ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
-
- AC_PROG_CC
- AC_PROG_CXX
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
- AC_PROG_INSTALL
- AC_SYS_LARGEFILE
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 6c67d34..edaab97 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,8 +1,8 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "48fa6b5e1d3e636c34cbd5650370e6f634efc294"
-PV = "1.8+git${SRCPV}"
+SRCREV = "addec813fed4c712d6ea752f6e4f23e602b87fad"
+PV = "2.1+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
-- 
1.7.9.5



