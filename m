Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ACC4865DD6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283387"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:10 -0700
Message-Id: <8c59c2e36cb9c0641a17e2bf7d6ac1ec41610b4c.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] glew: Upgrade to 1.11.0
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:53 -0000

Rebase patch and move patches from too generic files to glew

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glew/{files => glew}/autotools.patch           |  0
 .../glew/{files => glew}/fix-glew.pc-install.patch | 22 +++++++++++-----------
 .../glew_fix_for_automake-1.12.patch               |  0
 .../glew/{glew_1.10.0.bb => glew_1.11.0.bb}        |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/glew/{files => glew}/autotools.patch (100%)
 rename meta/recipes-graphics/glew/{files => glew}/fix-glew.pc-install.patch (74%)
 rename meta/recipes-graphics/glew/{files => glew}/glew_fix_for_automake-1.12.patch (100%)
 rename meta/recipes-graphics/glew/{glew_1.10.0.bb => glew_1.11.0.bb} (83%)

diff --git a/meta/recipes-graphics/glew/files/autotools.patch b/meta/recipes-graphics/glew/glew/autotools.patch
similarity index 100%
rename from meta/recipes-graphics/glew/files/autotools.patch
rename to meta/recipes-graphics/glew/glew/autotools.patch
diff --git a/meta/recipes-graphics/glew/files/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
similarity index 74%
rename from meta/recipes-graphics/glew/files/fix-glew.pc-install.patch
rename to meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
index 9cbc0a9..a20fbfc 100644
--- a/meta/recipes-graphics/glew/files/fix-glew.pc-install.patch
+++ b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
@@ -6,20 +6,20 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: glew-1.10.0/Makefile.am
+Index: glew-1.11.0/Makefile.am
 ===================================================================
---- glew-1.10.0.orig/Makefile.am
-+++ glew-1.10.0/Makefile.am
+--- glew-1.11.0.orig/Makefile.am
++++ glew-1.11.0/Makefile.am
 @@ -3,3 +3,5 @@ ACLOCAL_AMFLAGS = -I m4 --install
  
  SUBDIRS = include src
  
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = glew.pc
-Index: glew-1.10.0/configure.ac
+Index: glew-1.11.0/configure.ac
 ===================================================================
---- glew-1.10.0.orig/configure.ac
-+++ glew-1.10.0/configure.ac
+--- glew-1.11.0.orig/configure.ac
++++ glew-1.11.0/configure.ac
 @@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
  
  AC_CONFIG_FILES([Makefile
@@ -28,11 +28,11 @@ Index: glew-1.10.0/configure.ac
 +                 src/Makefile
 +                 glew.pc])
  AC_OUTPUT
-Index: glew-1.10.0/glew.pc.in
+Index: glew-1.11.0/glew.pc.in
 ===================================================================
---- glew-1.10.0.orig/glew.pc.in
-+++ glew-1.10.0/glew.pc.in
-@@ -5,7 +5,7 @@ includedir=@includedir@
+--- glew-1.11.0.orig/glew.pc.in
++++ glew-1.11.0/glew.pc.in
+@@ -5,7 +5,7 @@ includedir=${prefix}/include/GL
  
  Name: glew
  Description: The OpenGL Extension Wrangler library
@@ -42,4 +42,4 @@ Index: glew-1.10.0/glew.pc.in
 +Version: @VERSION@
 +Cflags: -I${includedir} @CFLAGS@
 +Libs: -L${libdir} -lGLEW
- Requires: glu
+ Requires: @requireslib@
diff --git a/meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch b/meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch
similarity index 100%
rename from meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
rename to meta/recipes-graphics/glew/glew/glew_fix_for_automake-1.12.patch
diff --git a/meta/recipes-graphics/glew/glew_1.10.0.bb b/meta/recipes-graphics/glew/glew_1.11.0.bb
similarity index 83%
rename from meta/recipes-graphics/glew/glew_1.10.0.bb
rename to meta/recipes-graphics/glew/glew_1.11.0.bb
index 94f1bc1..4231320 100644
--- a/meta/recipes-graphics/glew/glew_1.10.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://fix-glew.pc-install.patch \
           "
 
-SRC_URI[md5sum] = "2f09e5e6cb1b9f3611bcac79bc9c2d5d"
-SRC_URI[sha256sum] = "99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307"
+SRC_URI[md5sum] = "f6d72c7426a5f66580ad09e50816450a"
+SRC_URI[sha256sum] = "69bbce306ac281c4fa806a7a7d02c0596281a2d8f9d70690e98126f23ba513d6"
 
 inherit autotools lib_package pkgconfig
-- 
1.8.3.1


