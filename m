Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKV-0004YL-Dp
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983145"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:30 -0700
Message-Id: <d0d6a776d9af8c93f6a65fb21d268bc56534dd6d.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 05/14] libxml2: Update to 2.8.0
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:36 -0000

removed 2 patches that are now fixed upstream
updated hash.c LIC_FILES_CHKSUM due to updating the date to 2012

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 .../libxml/libxml2/fix_version_info.patch          |   23 --------------------
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 --------------------
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    9 -------
 meta/recipes-core/libxml/libxml2_2.8.0.bb          |    6 +++++
 5 files changed, 7 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.7.8.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.8.0.bb

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 31a32fa..7d8cc16 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
-                    file://hash.c;beginline=6;endline=15;md5=ce702952bfddd7aee22639a2d6b54136 \
+                    file://hash.c;beginline=6;endline=15;md5=96f7296605eae807670fb08947829969 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
deleted file mode 100644
index 77113ef..0000000
--- a/meta/recipes-core/libxml/libxml2/fix_version_info.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Already upstream
-
-From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Thu, 04 Nov 2010 20:53:14 +0000
-Subject: Reactivate the shared library versionning script
-
----
-diff --git a/configure.in b/configure.in
-index 59d0629..a1d2c89 100644
---- a/configure.in
-+++ b/configure.in
-@@ -84,7 +84,7 @@ else
-   esac
- fi
- AC_SUBST(VERSION_SCRIPT_FLAGS)
--AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"])
-+AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"])
- 
- dnl
- dnl We process the AC_ARG_WITH first so that later we can modify
---
-cgit v0.9.0.2
diff --git a/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch b/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
deleted file mode 100644
index 5c25882..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has decpricated automatic de-ANSI-fication support
-
-this patch fixes this build issue:
-
-| configure.in:67: error: automatic de-ANSI-fication support has been removed
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: libxml2-2.7.8/configure.in
-===================================================================
---- libxml2-2.7.8.orig/configure.in
-+++ libxml2-2.7.8/configure.in
-@@ -63,8 +63,6 @@ AC_PATH_PROG(WGET, wget, /usr/bin/wget)
- AC_PATH_PROG(XMLLINT, xmllint, /usr/bin/xmllint)
- AC_PATH_PROG(XSLTPROC, xsltproc, /usr/bin/xsltproc)
- 
--dnl Make sure we have an ANSI compiler
--AM_C_PROTOTYPES
- test "x$U" != "x" && AC_MSG_ERROR(Compiler not ANSI compliant)
- 
- AC_LIBTOOL_WIN32_DLL
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
deleted file mode 100644
index 1e233f0..0000000
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libxml2.inc
-
-PR = "r9"
-
-SRC_URI += "file://fix_version_info.patch \
-            file://libxml2_fix_for_automake_1.12.patch"
-
-SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
-SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
diff --git a/meta/recipes-core/libxml/libxml2_2.8.0.bb b/meta/recipes-core/libxml/libxml2_2.8.0.bb
new file mode 100644
index 0000000..243789c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2_2.8.0.bb
@@ -0,0 +1,6 @@
+require libxml2.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "c62106f02ee00b6437f0fb9d370c1093"
+SRC_URI[sha256sum] = "f2e2d0e322685193d1affec83b21dc05d599e17a7306d7b90de95bb5b9ac622a"
-- 
1.7.7.6



