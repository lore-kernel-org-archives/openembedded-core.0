Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3093D71E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:46:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jan 2016 14:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="885072871"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2016 14:46:58 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 22:47:49 +0000
Message-Id: <1e46abc58c8608ce94328fc38ee7b48a08b0f260.1453243618.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453243618.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453243618.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python: Upgrade 2.7.9 > 2.7.11
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
X-List-Received-Date: Tue, 19 Jan 2016 22:46:56 -0000

- no license change, just dates

Rebased:
- check-if-target-is-64b-not-host.patch
- add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc            |  4 ++--
 .../{python-native_2.7.9.bb => python-native_2.7.11.bb}  |  0
 meta/recipes-devtools/python/python.inc                  |  6 +++---
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch       | 13 +++++--------
 .../python/python/check-if-target-is-64b-not-host.patch  | 16 ++++++++--------
 .../python/{python_2.7.9.bb => python_2.7.11.bb}         |  0
 6 files changed, 18 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.9.bb => python-native_2.7.11.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.9.bb => python_2.7.11.bb} (100%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 573063e..a04ea71 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -4,8 +4,8 @@
 
 # Force the python versions in one place
 PYTHON_BASEVERSION ?= "2.7"
-PREFERRED_VERSION_python ?= "2.7.9"
-PREFERRED_VERSION_python-native ?= "2.7.9"
+PREFERRED_VERSION_python ?= "2.7.11"
+PREFERRED_VERSION_python-native ?= "2.7.11"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.9.bb
rename to meta/recipes-devtools/python/python-native_2.7.11.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 878f582..52250d2 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dff3d00f049545862992d2d097831a13"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "38d530f7efc373d64a8fb1637e3baaa7"
-SRC_URI[sha256sum] = "90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916"
+SRC_URI[md5sum] = "1dbcc848b4cd8399a8199d000f9f823c"
+SRC_URI[sha256sum] = "962b4c45af50124ea61f11a30deb4342fc0bc21126790fa1d7f6c79809413f46"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index 5ba5480..a97ff6b 100644
--- a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -13,19 +13,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 87a4f02..f20cc7b 100644
---- a/configure.ac
-+++ b/configure.ac
+Index: Python-2.7.11/configure.ac
+===================================================================
+--- Python-2.7.11.orig/configure.ac
++++ Python-2.7.11/configure.ac
 @@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
      fi
  elif test "$cross_compiling" = maybe; then
      AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
--- 
-2.5.0
-
diff --git a/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
index 2b62db3..e6d6c65 100644
--- a/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
+++ b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
@@ -11,11 +11,11 @@ Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
 Upstream-Status: Pending
 
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.11/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py	2012-03-25 01:10:41.540163187 +0200
-+++ Python-2.7.2/setup.py	2012-03-25 01:26:06.092539990 +0200
-@@ -23,6 +23,21 @@
+--- Python-2.7.11.orig/setup.py
++++ Python-2.7.11/setup.py
+@@ -35,6 +35,21 @@ COMPILED_WITH_PYDEBUG = ('--with-pydebug
  # This global variable is used to hold the list of modules to be disabled.
  disabled_module_list = []
  
@@ -37,16 +37,16 @@ Index: Python-2.7.2/setup.py
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (at the front) if
      1) 'dir' is not already in 'dirlist'
-@@ -628,7 +643,7 @@
+@@ -716,7 +731,7 @@ class PyBuildExt(build_ext):
          exts.append( Extension('audioop', ['audioop.c']) )
  
          # Disabled on 64-bit platforms
--        if sys.maxint != 9223372036854775807L:
+-        if sys.maxsize != 9223372036854775807L:
 +        if not target_is_64bit_platform():
              # Operations on images
              exts.append( Extension('imageop', ['imageop.c']) )
          else:
-@@ -1418,7 +1433,7 @@
+@@ -1545,7 +1560,7 @@ class PyBuildExt(build_ext):
                  missing.append('_codecs_%s' % loc)
  
          # Dynamic loading module
@@ -54,4 +54,4 @@ Index: Python-2.7.2/setup.py
 +        if not target_is_64bit_platform():
              # This requires sizeof(int) == sizeof(long) == sizeof(char*)
              dl_inc = find_file('dlfcn.h', [], inc_dirs)
-             if (dl_inc is not None) and (platform not in ['atheos']):
+             if (dl_inc is not None) and (host_platform not in ['atheos']):
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.11.bb
similarity index 100%
rename from meta/recipes-devtools/python/python_2.7.9.bb
rename to meta/recipes-devtools/python/python_2.7.11.bb
-- 
1.8.4.5


