Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 140CC731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546172"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:32 +0000
Message-Id: <19755649c1ca491032cef9f735da4380b6c86b24.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 9/9] python3: Minor upgrade 3.5.0 -> 3.5.1
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:50 -0000

Rebased:
- 000-cross-compile.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...on3-native_3.5.0.bb => python3-native_3.5.1.bb} |  4 +--
 .../python/python3/000-cross-compile.patch         | 30 +++++++++++-----------
 .../python/{python3_3.5.0.bb => python3_3.5.1.bb}  |  4 +--
 3 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.0.bb => python3-native_3.5.1.bb} (94%)
 rename meta/recipes-devtools/python/{python3_3.5.0.bb => python3_3.5.1.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.0.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-native_3.5.0.bb
rename to meta/recipes-devtools/python/python3-native_3.5.1.bb
index 0dd1650..152da1c 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
@@ -26,8 +26,8 @@ ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 "
-SRC_URI[md5sum] = "d149d2812f10cbe04c042232e7964171"
-SRC_URI[sha256sum] = "d6d7aa1634a5eeeca6ed4fca266982a04f84bd8f3945a9179e20b24ad2e2be91" 
+SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
+SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
index a3ffe3b..28fe70a 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -9,11 +9,11 @@ Upstream-Status: Inappropriate[Configuration Specific]
  Makefile.pre.in |   25 +++++++++++++------------
  1 file changed, 13 insertions(+), 12 deletions(-)
 
-Index: Python-3.5.0/Makefile.pre.in
+Index: Python-3.5.1/Makefile.pre.in
 ===================================================================
---- Python-3.5.0.orig/Makefile.pre.in
-+++ Python-3.5.0/Makefile.pre.in
-@@ -215,6 +215,7 @@ LIBOBJS=	@LIBOBJS@
+--- Python-3.5.1.orig/Makefile.pre.in
++++ Python-3.5.1/Makefile.pre.in
+@@ -220,6 +220,7 @@ LIBOBJS=	@LIBOBJS@
  
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
@@ -21,7 +21,7 @@ Index: Python-3.5.0/Makefile.pre.in
  
  PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
  _PYTHON_HOST_PLATFORM=@_PYTHON_HOST_PLATFORM@
-@@ -272,6 +273,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+@@ -276,6 +277,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -29,16 +29,16 @@ Index: Python-3.5.0/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -494,7 +496,7 @@ build_all_generate_profile:
+@@ -506,7 +508,7 @@ build_all_generate_profile:
  
  run_profile_task:
  	: # FIXME: can't run for a cross build
--	$(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
-+	$(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK)
+-	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
++	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
  
- build_all_use_profile:
- 	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) -fprofile-use -fprofile-correction"
-@@ -764,7 +766,7 @@ $(IO_OBJS): $(IO_H)
+ build_all_merge_profile:
+ 	$(LLVM_PROF_MERGER)
+@@ -779,7 +781,7 @@ $(IO_OBJS): $(IO_H)
  
  $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
  		@$(MKDIR_P) Include
@@ -47,7 +47,7 @@ Index: Python-3.5.0/Makefile.pre.in
  $(GRAMMAR_C): $(GRAMMAR_H)
  		touch $(GRAMMAR_C)
  
-@@ -953,7 +955,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
+@@ -968,7 +970,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
  ######################################################################
  
  TESTOPTS=	$(EXTRATESTOPTS)
@@ -56,7 +56,7 @@ Index: Python-3.5.0/Makefile.pre.in
  TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
  TESTTIMEOUT=	3600
  
-@@ -1440,7 +1442,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+@@ -1455,7 +1457,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
  		fi; \
  	done
  	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
@@ -65,7 +65,7 @@ Index: Python-3.5.0/Makefile.pre.in
  	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
  	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1506,7 +1508,7 @@ config.status:	$(srcdir)/configure
+@@ -1521,7 +1523,7 @@ config.status:	$(srcdir)/configure
  
  # Run reindent on the library
  reindent:
@@ -74,7 +74,7 @@ Index: Python-3.5.0/Makefile.pre.in
  
  # Rerun configure with the same options as it was run last time,
  # provided the config.status script exists
-@@ -1639,7 +1641,7 @@ funny:
+@@ -1656,7 +1658,7 @@ funny:
  
  # Perform some verification checks on any modified files.
  patchcheck: all
diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.5.0.bb
rename to meta/recipes-devtools/python/python3_3.5.1.bb
index 6184c79..0d9a4cc 100644
--- a/meta/recipes-devtools/python/python3_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -39,8 +39,8 @@ SRC_URI += "\
             file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
            "
-SRC_URI[md5sum] = "d149d2812f10cbe04c042232e7964171"
-SRC_URI[sha256sum] = "d6d7aa1634a5eeeca6ed4fca266982a04f84bd8f3945a9179e20b24ad2e2be91"
+SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
+SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
1.8.4.5


