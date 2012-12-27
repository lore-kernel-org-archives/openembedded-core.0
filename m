Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToLoZ-0001ft-AQ
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 23:20:36 +0100
Received: by mail-bk0-f45.google.com with SMTP id jk13so4437943bkc.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 14:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=S0ITMagrW7Rrlw7yh7HbVkiEx3dXA7YPxazAPgwuixI=;
	b=xPddWAs9aq4WixXsKjU6NObNX/CcEnWpjIZdIA1XHBcxQsYCREYqzZ0heoxzLLxYox
	0m5otjz9kTw50CRlMwRpqqNRj8jRfi9hQwaZGb8ShWv+2k/SlvtNU6/+XdQfZGP5diQ2
	gAx1/E7s+mVgo4LsXbluHKTG7DWzknHhfvmh0VEYp1/XGLPOXiBVPbsNkydX224Ki1vw
	LV5RsjHK8mHk8gUpxz8uajrTDZlusErS4uriznT3QyCPLKtPvkGrZKQ6fr8ufUWSVv8n
	a/US4qCk0TOt4kA5EjptsQThxRQY4bItKklQsmSJhJWBw5xGOTHnezOAXZa/zbSGcOwN
	MbDA==
X-Received: by 10.204.151.21 with SMTP id a21mr15528781bkw.124.1356645940645; 
	Thu, 27 Dec 2012 14:05:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id hm8sm21618203bkc.10.2012.12.27.14.05.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 14:05:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1ToLa5-0006ds-TH; Fri, 28 Dec 2012 00:05:38 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 00:05:34 +0200
Message-Id: <1356645934-25467-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356645934-25467-1-git-send-email-cazfi74@gmail.com>
References: <1356645934-25467-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] automake: update to upstream version 1.12.6
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
X-List-Received-Date: Thu, 27 Dec 2012 22:20:37 -0000

python-libdir.patch and py-compile-only-optimized-byte-code.patch
updated to apply to new codebase.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 ...-compile-compile-only-optimized-byte-code.patch |   28 ++++++-------
 .../automake/automake/python-libdir.patch          |   41 +++++++++++---------
 .../{automake_1.12.5.bb => automake_1.12.6.bb}     |    4 +-
 3 files changed, 38 insertions(+), 35 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.5.bb => automake_1.12.6.bb} (90%)

diff --git a/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch b/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
index f09bfbc..f8334a7 100644
--- a/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
+++ b/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
@@ -5,20 +5,20 @@ Upstream-Status: Inappropriate [embedded specific]
   pyc files by automake.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- lib/py-compile |   17 -----------------
- 1 files changed, 0 insertions(+), 17 deletions(-)
 
-diff --git a/lib/py-compile b/lib/py-compile
-index 3f9d05b..101c814 100755
---- a/lib/py-compile
-+++ b/lib/py-compile
-@@ -101,23 +101,6 @@ else
+Updated for automake-1.12.6
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd automake-1.12.6/lib/py-compile automake-1.12.6/lib/py-compile
+--- automake-1.12.6/lib/py-compile	2012-12-13 21:57:31.000000000 +0200
++++ automake-1.12.6/lib/py-compile	2012-12-27 19:34:01.426015140 +0200
+@@ -115,26 +115,6 @@
      filetrans="filepath = os.path.normpath('$destdir' + os.sep + path)"
  fi
  
 -$PYTHON -c "
--import sys, os, py_compile
+-import sys, os, py_compile, imp
 -
 -files = '''$files'''
 -
@@ -31,12 +31,12 @@ index 3f9d05b..101c814 100755
 -	    continue
 -    sys.stdout.write(file)
 -    sys.stdout.flush()
--    py_compile.compile(filepath, filepath + 'c', path)
+-    if hasattr(imp, 'get_tag'):
+-        py_compile.compile(filepath, imp.cache_from_source(filepath), path)
+-    else:
+-        py_compile.compile(filepath, filepath + 'c', path)
 -sys.stdout.write('\n')" || exit $?
 -
  # this will fail for python < 1.5, but that doesn't matter ...
  $PYTHON -O -c "
- import sys, os, py_compile
--- 
-1.7.0.4
-
+ import sys, os, py_compile, imp
diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
index 0783600..47541bd 100644
--- a/meta/recipes-devtools/automake/automake/python-libdir.patch
+++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
@@ -2,11 +2,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 
-Index: automake-1.11.3/m4/python.m4
-===================================================================
---- automake-1.11.3.orig/m4/python.m4	2012-01-31 11:41:18.000000000 +0000
-+++ automake-1.11.3/m4/python.m4	2012-04-24 10:04:57.726413598 +0000
-@@ -92,12 +92,13 @@
+Updated for automake-1.12.6
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd automake-1.12.6/m4/python.m4 automake-1.12.6/m4/python.m4
+--- automake-1.12.6/m4/python.m4	2012-12-13 22:02:25.000000000 +0200
++++ automake-1.12.6/m4/python.m4	2012-12-27 17:40:26.558164660 +0200
+@@ -91,12 +91,13 @@
      [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
    AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
  
@@ -22,17 +25,17 @@ Index: automake-1.11.3/m4/python.m4
    AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
  
    dnl At times (like when building shared libraries) you may want
-@@ -123,7 +124,8 @@
-      else
-        am_py_prefix=$prefix
-      fi
--     am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null`
-+     am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null ||
+@@ -148,7 +149,8 @@
+ else:
+     from distutils import sysconfig
+     sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
+-sys.stdout.write(sitedir)"`
++sys.stdout.write(sitedir)" ||
 +     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
       case $am_cv_python_pythondir in
       $am_py_prefix*)
         am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
-@@ -133,7 +135,7 @@
+@@ -158,7 +160,7 @@
         case $am_py_prefix in
           /usr|/System*) ;;
           *)
@@ -41,17 +44,17 @@ Index: automake-1.11.3/m4/python.m4
  	  ;;
         esac
         ;;
-@@ -158,7 +160,8 @@
-      else
-        am_py_exec_prefix=$exec_prefix
-      fi
--     am_cv_python_pyexecdir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(1,0,prefix='$am_py_exec_prefix'))" 2>/dev/null`
-+     am_cv_python_pyexecdir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(1,0,prefix='$am_py_exec_prefix'))" 2>/dev/null ||
+@@ -190,7 +192,8 @@
+ else:
+     from distutils import sysconfig
+     sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_prefix')
+-sys.stdout.write(sitedir)"`
++sys.stdout.write(sitedir)" ||
 +     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
       case $am_cv_python_pyexecdir in
       $am_py_exec_prefix*)
         am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
-@@ -168,7 +171,7 @@
+@@ -200,7 +203,7 @@
         case $am_py_exec_prefix in
           /usr|/System*) ;;
           *)
diff --git a/meta/recipes-devtools/automake/automake_1.12.5.bb b/meta/recipes-devtools/automake/automake_1.12.6.bb
similarity index 90%
rename from meta/recipes-devtools/automake/automake_1.12.5.bb
rename to meta/recipes-devtools/automake/automake_1.12.6.bb
index c681674..59bbdd8 100644
--- a/meta/recipes-devtools/automake/automake_1.12.5.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.6.bb
@@ -26,8 +26,8 @@ SRC_URI += "${PATHFIXPATCH} \
             file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch"
 
-SRC_URI[md5sum] = "674f6d28f8723e0f478cb03de30f36f1"
-SRC_URI[sha256sum] = "82089e23b384d3e64efa4f09f133a02dadb91c0593d4f1d4e12c29d806be9925"
+SRC_URI[md5sum] = "199d39ece2e6070d64ac20d45ac86026"
+SRC_URI[sha256sum] = "0cbe570db487908e70af7119da85ba04f7e28656b26f717df0265ae08defd9ef"
 
 PR = "r0"
 
-- 
1.7.10.4



