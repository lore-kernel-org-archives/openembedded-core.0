Return-Path: <max.tomago@codethink.co.uk>
X-Greylist: delayed 2481 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Oct 2019 17:19:19 UTC
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
	by mail.openembedded.org (Postfix) with ESMTP id 23A777F452
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 17:19:19 +0000 (UTC)
Received: from [167.98.27.226] (helo=glapflap.office.codethink.co.uk)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1iKPpf-0000GW-3j; Tue, 15 Oct 2019 17:37:59 +0100
From: Max Tomago <max.tomago@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 17:37:44 +0100
Message-Id: <20191015163744.9488-1-max.tomago@codethink.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-native: Remove debug.patch
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
X-List-Received-Date: Tue, 15 Oct 2019 17:19:20 -0000

It doesn't look like it should be there.

Signed-off-by: Max Tomago <max.tomago@codethink.co.uk>
---
 .../python/python-native/debug.patch          | 32 -------------------
 .../python/python-native_2.7.16.bb            |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/debug.patch

diff --git a/meta/recipes-devtools/python/python-native/debug.patch b/meta/recipes-devtools/python/python-native/debug.patch
deleted file mode 100644
index 3617882640..0000000000
--- a/meta/recipes-devtools/python/python-native/debug.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-Index: Python-2.7.12/Lib/distutils/unixccompiler.py
-===================================================================
---- Python-2.7.12.orig/Lib/distutils/unixccompiler.py
-+++ Python-2.7.12/Lib/distutils/unixccompiler.py
-@@ -278,6 +278,8 @@ class UnixCCompiler(CCompiler):
- 
- 
- 
-+        print "Looking in %s for %s" % (lib, dirs)
-+
-         for dir in dirs:
-             shared = os.path.join(dir, shared_f)
-             dylib = os.path.join(dir, dylib_f)
-@@ -298,12 +300,16 @@ class UnixCCompiler(CCompiler):
-             # assuming that *all* Unix C compilers do.  And of course I'm
-             # ignoring even GCC's "-static" option.  So sue me.
-             if os.path.exists(dylib):
-+                print "Found %s" % (dylib)
-                 return dylib
-             elif os.path.exists(xcode_stub):
-+                print "Found %s" % (xcode_stub)
-                 return xcode_stub
-             elif os.path.exists(shared):
-+                print "Found %s" % (shared)
-                 return shared
-             elif os.path.exists(static):
-+                print "Found %s" % (static)
-                 return static
- 
-         # Oops, didn't find it in *any* of 'dirs'
diff --git a/meta/recipes-devtools/python/python-native_2.7.16.bb b/meta/recipes-devtools/python/python-native_2.7.16.bb
index b7442800d9..90103af8be 100644
--- a/meta/recipes-devtools/python/python-native_2.7.16.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.16.bb
@@ -7,7 +7,6 @@ SRC_URI += "\
             file://10-distutils-fix-swig-parameter.patch \
             file://11-distutils-never-modify-shebang-line.patch \
             file://0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch \
-            file://debug.patch \
             file://unixccompiler.patch \
             file://nohostlibs.patch \
             file://multilib.patch \
-- 
2.17.1


