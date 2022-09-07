X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/2] icecc.bbclass: fix typos
Date: Wed,  7 Sep 2022 12:57:50 +0200
Message-Id: <20220907105751.1591186-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes/icecc.bbclass | 46 +++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index a11e781f00f7..8f06e9dd7082 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -4,35 +4,35 @@
 # SPDX-License-Identifier: MIT
 #
 
-# IceCream distributed compiling support
+# Icecream distributed compiling support
 #
 # Stages directories with symlinks from gcc/g++ to icecc, for both
 # native and cross compilers. Depending on each configure or compile,
 # the directories are added at the head of the PATH list and ICECC_CXX
-# and ICEC_CC are set.
+# and ICECC_CC are set.
 #
 # For the cross compiler, creates a tar.gz of our toolchain and sets
 # ICECC_VERSION accordingly.
 #
 # The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
 # necessary environment tar.gz file to be used by the remote machines.
-# It also supports meta-toolchain generation
+# It also supports meta-toolchain generation.
 #
 # If ICECC_PATH is not set in local.conf then the class will try to locate it using 'bb.utils.which'
-# but nothing is sure ;)
+# but nothing is sure. ;)
 #
 # If ICECC_ENV_EXEC is set in local.conf, then it should point to the icecc-create-env script provided by the user
-# or the default one provided by icecc-create-env.bb will be used
-# (NOTE that this is a modified version of the script need it and *not the one that comes with icecc*
+# or the default one provided by icecc-create-env_%.bb will be used.
+# (NOTE that this is a modified version of the needed script and *not the one that comes with icecream*).
 #
-# User can specify if specific recipes or recipes belonging to class should not use icecc to distribute
-# compile jobs to remote machines, but handled locally, by defining ICECC_CLASS_DISABLE and ICECC_RECIPE_DISABLE
+# User can specify if specific recipes or recipes inheriting specific classes should not use icecc to distribute
+# compile jobs to remote machines, but handle them locally by defining ICECC_CLASS_DISABLE and ICECC_RECIPE_DISABLE
 # with the appropriate values in local.conf. In addition the user can force to enable icecc for recipes
 # which set an empty PARALLEL_MAKE variable by defining ICECC_RECIPE_ENABLE.
 #
 #########################################################################################
-#Error checking is kept to minimum so double check any parameters you pass to the class
-###########################################################################################
+# Error checking is kept to minimum so double check any parameters you pass to the class
+#########################################################################################
 
 BB_BASEHASH_IGNORE_VARS += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_RECIPE_DISABLE \
     ICECC_CLASS_DISABLE ICECC_RECIPE_ENABLE ICECC_PATH ICECC_ENV_EXEC \
@@ -50,7 +50,7 @@ HOSTTOOLS_NONFATAL += "icecc patchelf"
 # invalidate the version on the compile nodes. Changing it will cause a new
 # environment to be created.
 #
-# A useful thing to do for testing Icecream changes locally is to add a
+# A useful thing to do for testing icecream changes locally is to add a
 # subversion in local.conf:
 #  ICECC_ENV_VERSION:append = "-my-ver-1"
 ICECC_ENV_VERSION = "2"
@@ -72,16 +72,16 @@ CXXFLAGS += "${ICECC_CFLAGS}"
 ICECC_ENV_DEBUG ??= ""
 
 # Disable recipe list contains a list of recipes that can not distribute
-# compile tasks for one reason or the other. When adding new entry, please
+# compile tasks for one reason or the other. When adding a new entry, please
 # document why (how it failed) so that we can re-evaluate it later e.g. when
-# there is new version
+# there is a new version.
 #
 # libgcc-initial - fails with CPP sanity check error if host sysroot contains
-#                  cross gcc built for another target tune/variant
+#                  cross gcc built for another target tune/variant.
 # pixman - prng_state: TLS reference mismatches non-TLS reference, possibly due to
-#          pragma omp threadprivate(prng_state)
+#          pragma omp threadprivate(prng_state).
 # systemtap - _HelperSDT.c undefs macros and uses the identifiers in macros emitting
-#             inline assembly
+#             inline assembly.
 # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
 #                             prefix" error.
 ICECC_RECIPE_DISABLE += "\
@@ -91,10 +91,10 @@ ICECC_RECIPE_DISABLE += "\
     target-sdk-provides-dummy \
     "
 
-# Classes that should not use icecc. When adding new entry, please
-# document why (how it failed) so that we can re-evaluate it later
+# Classes that should not use icecc. When adding a new entry, please
+# document why (how it failed) so that we can re-evaluate it later.
 #
-# image - Image aren't compiling, but the testing framework for images captures
+# image - images aren't compiling, but the testing framework for images captures
 #         PARALLEL_MAKE as part of the test environment. Many tests won't use
 #         icecream, but leaving the high level of parallelism can cause them to
 #         consume an unnecessary amount of resources.
@@ -103,7 +103,7 @@ ICECC_CLASS_DISABLE += "\
     "
 
 def get_icecc_dep(d):
-    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
+    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command. Whether or not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
     if not d.getVar('INHIBIT_DEFAULT_DEPS'):
@@ -259,7 +259,7 @@ def icecc_get_tool_link(tool, d):
 def icecc_get_path_tool(tool, d):
     # This is a little ugly, but we want to make sure we add an actual
     # compiler to the toolchain, not ccache. Some distros (e.g. Fedora)
-    # have ccache enabled by default using symlinks PATH, meaning ccache
+    # have ccache enabled by default using symlinks in PATH, meaning ccache
     # would be found first when looking for the compiler.
     paths = os.getenv("PATH").split(':')
     while True:
@@ -449,11 +449,11 @@ do_install:prepend() {
     set_icecc_env
 }
 
-# IceCream is not (currently) supported in the extensible SDK
+# Icecream is not (currently) supported in the extensible SDK
 ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
 ICECC_SDK_HOST_TASK:task-populate-sdk-ext = ""
 
-# Don't include IceCream in uninative tarball
+# Don't include icecream in uninative tarball
 ICECC_SDK_HOST_TASK:pn-uninative-tarball = ""
 
 # Add the toolchain scripts to the SDK
-- 
2.30.2

