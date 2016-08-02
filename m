Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 413CA6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:51:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u728pXrA000405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2016 01:51:33 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 01:51:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Aug 2016 01:51:29 -0700
Message-ID: <bbc1ee3f066c63310dfd4f74283797df62039f93.1470127858.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1470127858.git.liezhi.yang@windriver.com>
References: <cover.1470127858.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tcl: 8.6.5 -> 8.6.6
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
X-List-Received-Date: Tue, 02 Aug 2016 08:51:32 -0000
Content-Type: text/plain

Updated no_packages.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl/no_packages.patch    | 20 ++++++++++----------
 .../tcltk/{tcl_8.6.5.bb => tcl_8.6.6.bb}             |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.5.bb => tcl_8.6.6.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl/no_packages.patch b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
index ab6cc43..5c622a2 100644
--- a/meta/recipes-devtools/tcltk/tcl/no_packages.patch
+++ b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
@@ -5,26 +5,26 @@ Upstream-Status:Inappropriate [embedded specific]
 
 Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
 
-Index: unix/Makefile.in
-===================================================================
---- unix.orig/Makefile.in	2013-11-10 23:38:12.235425891 -0800
-+++ unix/Makefile.in	2013-11-10 23:38:12.231425891 -0800
-@@ -611,7 +611,7 @@
+diff --git a/Makefile.in b/Makefile.in
+index b729ffd..2c2e824 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -612,7 +612,7 @@ SRCS = $(GENERIC_SRCS) $(TOMMATH_SRCS) $(UNIX_SRCS) $(NOTIFY_SRCS) \
  # Start of rules
  #--------------------------------------------------------------------------
  
 -all: binaries libraries doc packages
 +all: binaries libraries doc
  
- binaries: ${LIB_FILE} $(STUB_LIB_FILE) ${TCL_EXE}
+ binaries: ${LIB_FILE} ${TCL_EXE}
  
-@@ -653,12 +653,12 @@
+@@ -656,12 +656,12 @@ Makefile: $(UNIX_DIR)/Makefile.in $(DLTEST_DIR)/Makefile.in
  #tclConfig.h: $(UNIX_DIR)/tclConfig.h.in
  #	$(SHELL) config.status
  
 -clean: clean-packages
 +clean:
- 	rm -f *.a *.o libtcl* core errs *~ \#* TAGS *.E a.out \
+ 	rm -rf *.a *.o libtcl* core errs *~ \#* TAGS *.E a.out \
  		errors ${TCL_EXE} ${TCLTEST_EXE} lib.exp Tcl @DTRACE_HDR@
  	cd dltest ; $(MAKE) clean
  
@@ -33,7 +33,7 @@ Index: unix/Makefile.in
  	rm -rf Makefile config.status config.cache config.log tclConfig.sh \
  		tclConfig.h *.plist Tcl.framework tcl.pc
  	cd dltest ; $(MAKE) distclean
-@@ -706,7 +706,7 @@
+@@ -709,7 +709,7 @@ tcltest-real:
  # tcltest, ie:
  #	% make test TESTFLAGS="-verbose bps -file fileName.test"
  
@@ -42,7 +42,7 @@ Index: unix/Makefile.in
  
  test-tcl: ${TCLTEST_EXE}
  	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
-@@ -771,7 +771,7 @@
+@@ -774,7 +774,7 @@ INSTALL_PACKAGE_TARGETS = install-packages
  INSTALL_DEV_TARGETS = install-headers
  INSTALL_EXTRA_TARGETS = @EXTRA_INSTALL@
  INSTALL_TARGETS = $(INSTALL_BASE_TARGETS) $(INSTALL_DOC_TARGETS) $(INSTALL_DEV_TARGETS) \
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.5.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.6.bb
index d75232b..2dd0a7a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "0e6426a4ca9401825fbc6ecf3d89a326"
-SRC_URI[sha256sum] = "ce26d5b9c7504fc25d2f10ef0b82b14cf117315445b5afa9e673ed331830fb53"
+SRC_URI[md5sum] = "5193aea8107839a79df8ac709552ecb7"
+SRC_URI[sha256sum] = "a265409781e4b3edcc4ef822533071b34c3dc6790b893963809b9fe221befe07"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.9.0


