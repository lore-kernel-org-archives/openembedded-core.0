Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iV-0003rX-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440668"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:00 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:19 +0200
Message-Id: <1d67932d2878800a0b033b6d2349e179df566d97.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 07/15] libcroco: upgrade to 0.6.8
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:59 -0000

License checksum modification due to:
    src/cr-rgb.c: code (not license)  change

croco.patch: removed
    - it doesn't apply anymore
    - not needed anymore

libcroco_fix_for_automake-1.12.patch: removed
    - problem not reprodicible anymore

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/libcroco/files/croco.patch    | 15 ---------------
 .../files/libcroco_fix_for_automake-1.12.patch     | 22 ----------------------
 .../{libcroco_0.6.3.bb => libcroco_0.6.8.bb}       | 11 +++++------
 3 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/libcroco/files/croco.patch
 delete mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
 rename meta/recipes-support/libcroco/{libcroco_0.6.3.bb => libcroco_0.6.8.bb} (57%)

diff --git a/meta/recipes-support/libcroco/files/croco.patch b/meta/recipes-support/libcroco/files/croco.patch
deleted file mode 100644
index 88bdb09..0000000
--- a/meta/recipes-support/libcroco/files/croco.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- opie/configure.in.old	2006-05-19 20:57:30.000000000 +0100
-+++ opie/configure.in	2006-05-19 20:57:56.000000000 +0100
-@@ -131,8 +131,8 @@
- dnl Define the CROCO_LIBS and CROCO_CFLAGS variables. These will be used
- dnl by client application to know where to find croco include files and libs.
- dnl
--CROCO_LIBS="-L${libdir} -lcroco-$LIBCROCO_MAJOR_VERSION.$LIBCROCO_MINOR_VERSION"
--CROCO_CFLAGS="-I${includedir}/libcroco-$LIBCROCO_MAJOR_VERSION.$LIBCROCO_MINOR_VERSION"
-+CROCO_LIBS='-L${libdir}'" -lcroco-$LIBCROCO_MAJOR_VERSION.$LIBCROCO_MINOR_VERSION"
-+CROCO_CFLAGS='-I${includedir}'"/libcroco-$LIBCROCO_MAJOR_VERSION.$LIBCROCO_MINOR_VERSION"
- 
- AC_SUBST(LIBXML2_LIBS)
- AC_SUBST(LIBXML2_CFLAGS)
diff --git a/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch b/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
deleted file mode 100644
index 9dcf7b0..0000000
--- a/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes following kind of issues with automake 1.12
-
-| configure.in:51: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: libcroco-0.6.3/configure.in
-===================================================================
---- libcroco-0.6.3.orig/configure.in
-+++ libcroco-0.6.3/configure.in
-@@ -47,8 +47,6 @@ AC_PROG_CC
- AC_PROG_INSTALL
- AC_PROG_CPP
- 
--dnl Make sure we have an ANSI compiler
--AM_C_PROTOTYPES
- test "x$U" != "x" && AC_MSG_ERROR(Compiler not ANSI compliant)
- 
- dnl Checks for libraries.
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.3.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
similarity index 57%
rename from meta/recipes-support/libcroco/libcroco_0.6.3.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.8.bb
index d9ff8de..6f5995f 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.3.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -4,17 +4,16 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://src/cr-rgb.c;endline=25;md5=1df8189094ba7bbed953225785032826 \
+                    file://src/cr-rgb.c;endline=25;md5=cbb4f64cc46ee9fcf602d3b0836cee56 \
                     file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r3"
+PR = "r0"
 
 inherit autotools pkgconfig gnome
 
-SRC_URI_append = " file://croco.patch;apply=yes \
-                  file://libcroco_fix_for_automake-1.12.patch "
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "e1e93eeff4367c896f3959af34ba20eb"
-SRC_URI[archive.sha256sum] = "746192d979263c74094d41e5ff0e19900b3d81eb2bd42c27c1c320dd94008034"
+SRC_URI[archive.md5sum] = "767e73c4174f75b99695d4530fd9bb80"
+SRC_URI[archive.sha256sum] = "ea6e1b858c55219cefd7109756bff5bc1a774ba7a55f7d3ccd734d6b871b8570"
-- 
1.7.11.7



