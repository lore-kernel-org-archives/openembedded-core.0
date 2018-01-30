Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 23ACD605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 17:23:14 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id s39so18203658qth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 09:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SGScQlH94YtHhRWsQkahdMwbtSlLd3hXswQTZA1pxcE=;
	b=klaG80oWMbc7jm2fLjx6qprJErvP+0WEqr0bX09skoQ44eebtFKgQn6AFJ2reEnazZ
	XI3UEhGplGmCrlwKLhzVWRXQKCWZJJaFgYiDnVTaFR4/RjW2ddyyZpsHZSoSiOXTcjWK
	yY1Z/0aVY8NcydsleK45fqTH6is1L7qVXaTuaoM4o1FTUdhVKkwiu1ArhJhgGXV8bIpi
	+S1yKMvOcVHfABJnBHxSABhLaCpgqOHwLpLirpP3w4VEiVKHv8SUTtmwGAeM5/pQc2oS
	J7cRJ1S/Sp1tWpU6nH6a0r3X7wc3JXlB1xyXE6jSFoW6L6pYqNWk6/NumOJlA5Mdr8//
	wyUQ==
X-Gm-Message-State: AKwxyteByFPMCrs18bFAVvhdvKxKyAMXwCCoXh6wBC/dMUdPxfSnQOMF
	WqFB3q+3GjhUB4uN2liwri64jAlX
X-Google-Smtp-Source: AH8x226AFMfA745FCFj2g1gxxJHjEYqArxtcVWIJYkxWPXov/SS/LuJKVESLK+3JQO5Z8mgxlLFf2g==
X-Received: by 10.200.58.129 with SMTP id x1mr43919896qte.146.1517332995364;
	Tue, 30 Jan 2018 09:23:15 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n85sm33080qkl.78.2018.01.30.09.23.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 09:23:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 12:22:49 -0500
Message-Id: <1517332969-20159-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3: update target and native recipes to 3.5.4
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
X-List-Received-Date: Tue, 30 Jan 2018 17:23:15 -0000

Use the latest 3.5 version until the 3.6 migration is complete

Removed the following upstreamed patches:
  - python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
  - python3/upstream-random-fixes.patch

Rebased the following pathes:
  - python3/0001-cross-compile-support.patch

Regenerated the manifest based on the latest release version

Updated the license checksum for the latest version that updated the
copyright dates

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on3-native_3.5.3.bb => python3-native_3.5.4.bb} |  12 +-
 .../python3/0001-cross-compile-support.patch       |  69 +-
 ...eakref-spewing-exceptions-during-interp-f.patch |  56 --
 .../python/python3/python3-manifest.json           |   8 +-
 .../python/python3/upstream-random-fixes.patch     | 703 ---------------------
 .../python/{python3_3.5.3.bb => python3_3.5.4.bb}  |   8 +-
 6 files changed, 52 insertions(+), 804 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.3.bb => python3-native_3.5.4.bb} (90%)
 delete mode 100644 meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
 delete mode 100644 meta/recipes-devtools/python/python3/upstream-random-fixes.patch
 rename meta/recipes-devtools/python/{python3_3.5.3.bb => python3_3.5.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-native_3.5.3.bb
rename to meta/recipes-devtools/python/python3-native_3.5.4.bb
index 12f9f24..c825253 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.4.bb
@@ -27,10 +27,10 @@ file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 "
 
-SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
-SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
+SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
+SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b680ed99aa60d350c65a65914494207e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -61,6 +61,12 @@ do_configure_append() {
 	sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' ${B}/pyconfig.h
 }
 
+# Regenerate all of the generated files
+# This ensures that pgen and friends get created during the compile phase
+do_compile_prepend() {
+    oe_runmake regen-all
+}
+
 do_install() {
 	install -d ${D}${libdir}/pkgconfig
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
index 118d75d..7cd7e3b 100644
--- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
+++ b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
@@ -1,4 +1,4 @@
-From 624c029abcc73c724020ccea9a2b4b5b5c00f2a6 Mon Sep 17 00:00:00 2001
+From ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 31 Mar 2017 15:42:46 +0300
 Subject: [PATCH] cross-compile support
@@ -8,60 +8,63 @@ python instead of in-tree tools
 
 -Khem
 
+Rebased on 3.5.4
+
 Upstream-Status: Inappropriate[Configuration Specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Derek Straka <derek@asterius.io>
 ---
  Makefile.pre.in | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a88b7d5..7cb8bb3 100644
+index 144c1f8629..f252ac2417 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -221,6 +221,7 @@ LIBOBJS=	@LIBOBJS@
- 
+@@ -223,6 +223,7 @@ LIBOBJS=	@LIBOBJS@
+
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
 +HOSTPYTHON=    $(BUILDPYTHON)
- 
- PYTHON_FOR_GEN=@PYTHON_FOR_GEN@
+
+ PYTHON_FOR_REGEN=@PYTHON_FOR_REGEN@
  PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
-@@ -280,6 +281,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
 +HOSTPGEN=	$(PGEN)$(EXE)
- 
+
  PSRCS=		\
  		Parser/acceler.c \
-@@ -510,7 +512,7 @@ build_all_generate_profile:
- 
+@@ -478,7 +480,7 @@ build_all_generate_profile:
+
  run_profile_task:
  	: # FIXME: can't run for a cross build
 -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
 +	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
- 
+
  build_all_merge_profile:
  	$(LLVM_PROF_MERGER)
-@@ -787,7 +789,7 @@ $(IO_OBJS): $(IO_H)
- 
- $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
+@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
+ 	# Regenerate Include/graminit.h and Python/graminit.c
+ 	# from Grammar/Grammar using pgen
  	@$(MKDIR_P) Include
--	$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+	$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
- 	touch $(GRAMMAR_C)
- 
-@@ -976,7 +978,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
+-	$(PGEN) $(srcdir)/Grammar/Grammar \
++	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
+ 		$(srcdir)/Include/graminit.h \
+ 		$(srcdir)/Python/graminit.c
+
+@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
  ######################################################################
- 
+
  TESTOPTS=	$(EXTRATESTOPTS)
 -TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
 +TESTPYTHON=	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
  TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
  TESTTIMEOUT=	3600
- 
-@@ -1468,7 +1470,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+
+@@ -1470,7 +1472,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
  		fi; \
  	done
  	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
@@ -70,24 +73,24 @@ index a88b7d5..7cb8bb3 100644
  	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
  	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1534,7 +1536,7 @@ config.status:	$(srcdir)/configure
- 
+@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
+
  # Run reindent on the library
  reindent:
 -	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
 +	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
- 
+
  # Rerun configure with the same options as it was run last time,
  # provided the config.status script exists
-@@ -1674,7 +1676,7 @@ funny:
- 
+@@ -1678,7 +1680,7 @@ funny:
+
  # Perform some verification checks on any modified files.
- patchcheck: all
+ patchcheck: @DEF_MAKE_RULE@
 -	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
-+	$(RUNSHARED) ./$(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
- 
++	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
+
  # Dependencies
- 
--- 
+
+--
 2.11.0
 
diff --git a/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch b/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
deleted file mode 100644
index 7217c6e..0000000
--- a/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 62dcf34987b680e95873eb947b3f4d802199c667 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C5=81ukasz=20Langa?= <lukasz@langa.pl>
-Date: Fri, 10 Feb 2017 00:14:55 -0800
-Subject: [PATCH] Fix #29519: weakref spewing exceptions during interp
- finalization
-
-commit 9cd7e17640a49635d1c1f8c2989578a8fc2c1de6
-from https://github.com/python/cpython
-
-Upstream-Status: Backport
-
-Signed-off-by: Lukasz Langa <lukasz@langa.pl>
----
- Lib/weakref.py | 4 ++--
- Misc/NEWS      | 3 +++
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/weakref.py b/Lib/weakref.py
-index aaebd0c..787e33a 100644
---- a/Lib/weakref.py
-+++ b/Lib/weakref.py
-@@ -106,7 +106,7 @@ class WeakValueDictionary(collections.MutableMapping):
-         self, *args = args
-         if len(args) > 1:
-             raise TypeError('expected at most 1 arguments, got %d' % len(args))
--        def remove(wr, selfref=ref(self)):
-+        def remove(wr, selfref=ref(self), _atomic_removal=_remove_dead_weakref):
-             self = selfref()
-             if self is not None:
-                 if self._iterating:
-@@ -114,7 +114,7 @@ class WeakValueDictionary(collections.MutableMapping):
-                 else:
-                     # Atomic removal is necessary since this function
-                     # can be called asynchronously by the GC
--                    _remove_dead_weakref(d, wr.key)
-+                    _atomic_removal(d, wr.key)
-         self._remove = remove
-         # A list of keys to be removed
-         self._pending_removals = []
-diff --git a/Misc/NEWS b/Misc/NEWS
-index 41cfdba..6d89f52 100644
---- a/Misc/NEWS
-+++ b/Misc/NEWS
-@@ -5719,6 +5719,9 @@ Core and Builtins
- Library
- -------
- 
-+- Issue #29519: Fix weakref spewing exceptions during interpreter shutdown
-+  when used with a rare combination of multiprocessing and custom codecs.
-+
- - Issue #20154: Deadlock in asyncio.StreamReader.readexactly().
- 
- - Issue #16113: Remove sha3 module again.
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 5b7b70b..b117569 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -797,17 +797,17 @@
     },
     "numbers": {
         "cached": [
+            "${libdir}/python3.5/__pycache__/_pydecimal.*.pyc",
             "${libdir}/python3.5/__pycache__/decimal.*.pyc",
             "${libdir}/python3.5/__pycache__/fractions.*.pyc",
-            "${libdir}/python3.5/__pycache__/numbers.*.pyc",
-            "${libdir}/python3.5/__pycache__/_pydecimal.*.pyc"
+            "${libdir}/python3.5/__pycache__/numbers.*.pyc"
         ],
         "files": [
+            "${libdir}/python3.5/_pydecimal.py",
             "${libdir}/python3.5/decimal.py",
             "${libdir}/python3.5/fractions.py",
             "${libdir}/python3.5/lib-dynload/_decimal.*.so",
-            "${libdir}/python3.5/numbers.py",
-            "${libdir}/python3.5/_pydecimal.py"
+            "${libdir}/python3.5/numbers.py"
         ],
         "rdepends": [
             "core"
diff --git a/meta/recipes-devtools/python/python3/upstream-random-fixes.patch b/meta/recipes-devtools/python/python3/upstream-random-fixes.patch
deleted file mode 100644
index 9b40e8a..0000000
--- a/meta/recipes-devtools/python/python3/upstream-random-fixes.patch
+++ /dev/null
@@ -1,703 +0,0 @@
-From 035ba5da3e53e45c712b39fe1f6fb743e697c032 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <victor.stinner@gmail.com>
-Date: Mon, 9 Jan 2017 11:18:53 +0100
-Subject: [PATCH] Issue #29157: Prefer getrandom() over getentropy()
-
-Copy and then adapt Python/random.c from default branch. Difference between 3.5
-and default branches:
-
-* Python 3.5 only uses getrandom() in non-blocking mode: flags=GRND_NONBLOCK
-* If getrandom() fails with EAGAIN: py_getrandom() immediately fails and
-  remembers that getrandom() doesn't work.
-* Python 3.5 has no _PyOS_URandomNonblock() function: _PyOS_URandom()
-  works in non-blocking mode on Python 3.5
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/035ba5da3e53e45c712b39fe1f6fb743e697c032]
-Signed-off-by: Alexander Kanavin <alexander.kanavin@intel.com>
-
----
- Python/random.c | 494 +++++++++++++++++++++++++++++++++-----------------------
- 1 file changed, 294 insertions(+), 200 deletions(-)
-
-diff --git a/Python/random.c b/Python/random.c
-index d203939..31f61d0 100644
---- a/Python/random.c
-+++ b/Python/random.c
-@@ -1,6 +1,9 @@
- #include "Python.h"
- #ifdef MS_WINDOWS
- #  include <windows.h>
-+/* All sample MSDN wincrypt programs include the header below. It is at least
-+ * required with Min GW. */
-+#  include <wincrypt.h>
- #else
- #  include <fcntl.h>
- #  ifdef HAVE_SYS_STAT_H
-@@ -37,10 +40,9 @@ win32_urandom_init(int raise)
-     return 0;
- 
- error:
--    if (raise)
-+    if (raise) {
-         PyErr_SetFromWindowsErr(0);
--    else
--        Py_FatalError("Failed to initialize Windows random API (CryptoGen)");
-+    }
-     return -1;
- }
- 
-@@ -53,8 +55,9 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
- 
-     if (hCryptProv == 0)
-     {
--        if (win32_urandom_init(raise) == -1)
-+        if (win32_urandom_init(raise) == -1) {
-             return -1;
-+        }
-     }
- 
-     while (size > 0)
-@@ -63,11 +66,9 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
-         if (!CryptGenRandom(hCryptProv, (DWORD)chunk, buffer))
-         {
-             /* CryptGenRandom() failed */
--            if (raise)
-+            if (raise) {
-                 PyErr_SetFromWindowsErr(0);
--            else
--                Py_FatalError("Failed to initialized the randomized hash "
--                        "secret using CryptoGen)");
-+            }
-             return -1;
-         }
-         buffer += chunk;
-@@ -76,58 +77,23 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
-     return 0;
- }
- 
--/* Issue #25003: Don't use getentropy() on Solaris (available since
-- * Solaris 11.3), it is blocking whereas os.urandom() should not block. */
--#elif defined(HAVE_GETENTROPY) && !defined(sun)
--#define PY_GETENTROPY 1
--
--/* Fill buffer with size pseudo-random bytes generated by getentropy().
--   Return 0 on success, or raise an exception and return -1 on error.
--
--   If fatal is nonzero, call Py_FatalError() instead of raising an exception
--   on error. */
--static int
--py_getentropy(unsigned char *buffer, Py_ssize_t size, int fatal)
--{
--    while (size > 0) {
--        Py_ssize_t len = Py_MIN(size, 256);
--        int res;
--
--        if (!fatal) {
--            Py_BEGIN_ALLOW_THREADS
--            res = getentropy(buffer, len);
--            Py_END_ALLOW_THREADS
--
--            if (res < 0) {
--                PyErr_SetFromErrno(PyExc_OSError);
--                return -1;
--            }
--        }
--        else {
--            res = getentropy(buffer, len);
--            if (res < 0)
--                Py_FatalError("getentropy() failed");
--        }
--
--        buffer += len;
--        size -= len;
--    }
--    return 0;
--}
--
--#else
-+#else /* !MS_WINDOWS */
- 
- #if defined(HAVE_GETRANDOM) || defined(HAVE_GETRANDOM_SYSCALL)
- #define PY_GETRANDOM 1
- 
--/* Call getrandom()
-+/* Call getrandom() to get random bytes:
-+
-    - Return 1 on success
--   - Return 0 if getrandom() syscall is not available (failed with ENOSYS or
--     EPERM) or if getrandom(GRND_NONBLOCK) failed with EAGAIN (system urandom
--     not initialized yet) and raise=0.
-+   - Return 0 if getrandom() is not available (failed with ENOSYS or EPERM),
-+     or if getrandom(GRND_NONBLOCK) failed with EAGAIN (system urandom not
-+     initialized yet).
-    - Raise an exception (if raise is non-zero) and return -1 on error:
--     getrandom() failed with EINTR and the Python signal handler raised an
--     exception, or getrandom() failed with a different error. */
-+     if getrandom() failed with EINTR, raise is non-zero and the Python signal
-+     handler raised an exception, or if getrandom() failed with a different
-+     error.
-+
-+   getrandom() is retried if it failed with EINTR: interrupted by a signal. */
- static int
- py_getrandom(void *buffer, Py_ssize_t size, int raise)
- {
-@@ -142,16 +108,19 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
-      * see https://bugs.python.org/issue26839. To avoid this, use the
-      * GRND_NONBLOCK flag. */
-     const int flags = GRND_NONBLOCK;
-+    char *dest;
-     long n;
- 
-     if (!getrandom_works) {
-         return 0;
-     }
- 
-+    dest = buffer;
-     while (0 < size) {
- #ifdef sun
-         /* Issue #26735: On Solaris, getrandom() is limited to returning up
--           to 1024 bytes */
-+           to 1024 bytes. Call it multiple times if more bytes are
-+           requested. */
-         n = Py_MIN(size, 1024);
- #else
-         n = Py_MIN(size, LONG_MAX);
-@@ -161,34 +130,35 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
- #ifdef HAVE_GETRANDOM
-         if (raise) {
-             Py_BEGIN_ALLOW_THREADS
--            n = getrandom(buffer, n, flags);
-+            n = getrandom(dest, n, flags);
-             Py_END_ALLOW_THREADS
-         }
-         else {
--            n = getrandom(buffer, n, flags);
-+            n = getrandom(dest, n, flags);
-         }
- #else
-         /* On Linux, use the syscall() function because the GNU libc doesn't
--         * expose the Linux getrandom() syscall yet. See:
--         * https://sourceware.org/bugzilla/show_bug.cgi?id=17252 */
-+           expose the Linux getrandom() syscall yet. See:
-+           https://sourceware.org/bugzilla/show_bug.cgi?id=17252 */
-         if (raise) {
-             Py_BEGIN_ALLOW_THREADS
--            n = syscall(SYS_getrandom, buffer, n, flags);
-+            n = syscall(SYS_getrandom, dest, n, flags);
-             Py_END_ALLOW_THREADS
-         }
-         else {
--            n = syscall(SYS_getrandom, buffer, n, flags);
-+            n = syscall(SYS_getrandom, dest, n, flags);
-         }
- #endif
- 
-         if (n < 0) {
--            /* ENOSYS: getrandom() syscall not supported by the kernel (but
--             * maybe supported by the host which built Python). EPERM:
--             * getrandom() syscall blocked by SECCOMP or something else. */
-+            /* ENOSYS: the syscall is not supported by the kernel.
-+               EPERM: the syscall is blocked by a security policy (ex: SECCOMP)
-+               or something else. */
-             if (errno == ENOSYS || errno == EPERM) {
-                 getrandom_works = 0;
-                 return 0;
-             }
-+
-             if (errno == EAGAIN) {
-                 /* getrandom(GRND_NONBLOCK) fails with EAGAIN if the system
-                    urandom is not initialiazed yet. In this case, fall back on
-@@ -202,169 +172,225 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
-             }
- 
-             if (errno == EINTR) {
--                if (PyErr_CheckSignals()) {
--                    if (!raise) {
--                        Py_FatalError("getrandom() interrupted by a signal");
-+                if (raise) {
-+                    if (PyErr_CheckSignals()) {
-+                        return -1;
-                     }
--                    return -1;
-                 }
- 
--                /* retry getrandom() */
-+                /* retry getrandom() if it was interrupted by a signal */
-                 continue;
-             }
- 
-             if (raise) {
-                 PyErr_SetFromErrno(PyExc_OSError);
-             }
--            else {
--                Py_FatalError("getrandom() failed");
--            }
-             return -1;
-         }
- 
--        buffer += n;
-+        dest += n;
-         size -= n;
-     }
-     return 1;
- }
--#endif
- 
--static struct {
--    int fd;
--    dev_t st_dev;
--    ino_t st_ino;
--} urandom_cache = { -1 };
-+#elif defined(HAVE_GETENTROPY)
-+#define PY_GETENTROPY 1
- 
-+/* Fill buffer with size pseudo-random bytes generated by getentropy():
- 
--/* Read 'size' random bytes from py_getrandom(). Fall back on reading from
--   /dev/urandom if getrandom() is not available.
-+   - Return 1 on success
-+   - Return 0 if getentropy() syscall is not available (failed with ENOSYS or
-+     EPERM).
-+   - Raise an exception (if raise is non-zero) and return -1 on error:
-+     if getentropy() failed with EINTR, raise is non-zero and the Python signal
-+     handler raised an exception, or if getentropy() failed with a different
-+     error.
- 
--   Call Py_FatalError() on error. */
--static void
--dev_urandom_noraise(unsigned char *buffer, Py_ssize_t size)
-+   getentropy() is retried if it failed with EINTR: interrupted by a signal. */
-+static int
-+py_getentropy(char *buffer, Py_ssize_t size, int raise)
- {
--    int fd;
--    Py_ssize_t n;
-+    /* Is getentropy() supported by the running kernel? Set to 0 if
-+       getentropy() failed with ENOSYS or EPERM. */
-+    static int getentropy_works = 1;
- 
--    assert (0 < size);
--
--#ifdef PY_GETRANDOM
--    if (py_getrandom(buffer, size, 0) == 1) {
--        return;
-+    if (!getentropy_works) {
-+        return 0;
-     }
--    /* getrandom() failed with ENOSYS or EPERM,
--       fall back on reading /dev/urandom */
--#endif
- 
--    fd = _Py_open_noraise("/dev/urandom", O_RDONLY);
--    if (fd < 0) {
--        Py_FatalError("Failed to open /dev/urandom");
--    }
-+    while (size > 0) {
-+        /* getentropy() is limited to returning up to 256 bytes. Call it
-+           multiple times if more bytes are requested. */
-+        Py_ssize_t len = Py_MIN(size, 256);
-+        int res;
- 
--    while (0 < size)
--    {
--        do {
--            n = read(fd, buffer, (size_t)size);
--        } while (n < 0 && errno == EINTR);
-+        if (raise) {
-+            Py_BEGIN_ALLOW_THREADS
-+            res = getentropy(buffer, len);
-+            Py_END_ALLOW_THREADS
-+        }
-+        else {
-+            res = getentropy(buffer, len);
-+        }
- 
--        if (n <= 0) {
--            /* read() failed or returned 0 bytes */
--            Py_FatalError("Failed to read bytes from /dev/urandom");
--            break;
-+        if (res < 0) {
-+            /* ENOSYS: the syscall is not supported by the running kernel.
-+               EPERM: the syscall is blocked by a security policy (ex: SECCOMP)
-+               or something else. */
-+            if (errno == ENOSYS || errno == EPERM) {
-+                getentropy_works = 0;
-+                return 0;
-+            }
-+
-+            if (errno == EINTR) {
-+                if (raise) {
-+                    if (PyErr_CheckSignals()) {
-+                        return -1;
-+                    }
-+                }
-+
-+                /* retry getentropy() if it was interrupted by a signal */
-+                continue;
-+            }
-+
-+            if (raise) {
-+                PyErr_SetFromErrno(PyExc_OSError);
-+            }
-+            return -1;
-         }
--        buffer += n;
--        size -= n;
-+
-+        buffer += len;
-+        size -= len;
-     }
--    close(fd);
-+    return 1;
- }
-+#endif /* defined(HAVE_GETENTROPY) && !defined(sun) */
- 
--/* Read 'size' random bytes from py_getrandom(). Fall back on reading from
--   /dev/urandom if getrandom() is not available.
- 
--   Return 0 on success. Raise an exception and return -1 on error. */
-+static struct {
-+    int fd;
-+    dev_t st_dev;
-+    ino_t st_ino;
-+} urandom_cache = { -1 };
-+
-+/* Read random bytes from the /dev/urandom device:
-+
-+   - Return 0 on success
-+   - Raise an exception (if raise is non-zero) and return -1 on error
-+
-+   Possible causes of errors:
-+
-+   - open() failed with ENOENT, ENXIO, ENODEV, EACCES: the /dev/urandom device
-+     was not found. For example, it was removed manually or not exposed in a
-+     chroot or container.
-+   - open() failed with a different error
-+   - fstat() failed
-+   - read() failed or returned 0
-+
-+   read() is retried if it failed with EINTR: interrupted by a signal.
-+
-+   The file descriptor of the device is kept open between calls to avoid using
-+   many file descriptors when run in parallel from multiple threads:
-+   see the issue #18756.
-+
-+   st_dev and st_ino fields of the file descriptor (from fstat()) are cached to
-+   check if the file descriptor was replaced by a different file (which is
-+   likely a bug in the application): see the issue #21207.
-+
-+   If the file descriptor was closed or replaced, open a new file descriptor
-+   but don't close the old file descriptor: it probably points to something
-+   important for some third-party code. */
- static int
--dev_urandom_python(char *buffer, Py_ssize_t size)
-+dev_urandom(char *buffer, Py_ssize_t size, int raise)
- {
-     int fd;
-     Py_ssize_t n;
--    struct _Py_stat_struct st;
--#ifdef PY_GETRANDOM
--    int res;
--#endif
--
--    if (size <= 0)
--        return 0;
- 
--#ifdef PY_GETRANDOM
--    res = py_getrandom(buffer, size, 1);
--    if (res < 0) {
--        return -1;
--    }
--    if (res == 1) {
--        return 0;
--    }
--    /* getrandom() failed with ENOSYS or EPERM,
--       fall back on reading /dev/urandom */
--#endif
-+    if (raise) {
-+        struct _Py_stat_struct st;
- 
--    if (urandom_cache.fd >= 0) {
--        /* Does the fd point to the same thing as before? (issue #21207) */
--        if (_Py_fstat_noraise(urandom_cache.fd, &st)
--            || st.st_dev != urandom_cache.st_dev
--            || st.st_ino != urandom_cache.st_ino) {
--            /* Something changed: forget the cached fd (but don't close it,
--               since it probably points to something important for some
--               third-party code). */
--            urandom_cache.fd = -1;
--        }
--    }
--    if (urandom_cache.fd >= 0)
--        fd = urandom_cache.fd;
--    else {
--        fd = _Py_open("/dev/urandom", O_RDONLY);
--        if (fd < 0) {
--            if (errno == ENOENT || errno == ENXIO ||
--                errno == ENODEV || errno == EACCES)
--                PyErr_SetString(PyExc_NotImplementedError,
--                                "/dev/urandom (or equivalent) not found");
--            /* otherwise, keep the OSError exception raised by _Py_open() */
--            return -1;
--        }
-         if (urandom_cache.fd >= 0) {
--            /* urandom_fd was initialized by another thread while we were
--               not holding the GIL, keep it. */
--            close(fd);
--            fd = urandom_cache.fd;
-+            /* Does the fd point to the same thing as before? (issue #21207) */
-+            if (_Py_fstat_noraise(urandom_cache.fd, &st)
-+                || st.st_dev != urandom_cache.st_dev
-+                || st.st_ino != urandom_cache.st_ino) {
-+                /* Something changed: forget the cached fd (but don't close it,
-+                   since it probably points to something important for some
-+                   third-party code). */
-+                urandom_cache.fd = -1;
-+            }
-         }
-+        if (urandom_cache.fd >= 0)
-+            fd = urandom_cache.fd;
-         else {
--            if (_Py_fstat(fd, &st)) {
--                close(fd);
-+            fd = _Py_open("/dev/urandom", O_RDONLY);
-+            if (fd < 0) {
-+                if (errno == ENOENT || errno == ENXIO ||
-+                    errno == ENODEV || errno == EACCES) {
-+                    PyErr_SetString(PyExc_NotImplementedError,
-+                                    "/dev/urandom (or equivalent) not found");
-+                }
-+                /* otherwise, keep the OSError exception raised by _Py_open() */
-                 return -1;
-             }
-+            if (urandom_cache.fd >= 0) {
-+                /* urandom_fd was initialized by another thread while we were
-+                   not holding the GIL, keep it. */
-+                close(fd);
-+                fd = urandom_cache.fd;
-+            }
-             else {
--                urandom_cache.fd = fd;
--                urandom_cache.st_dev = st.st_dev;
--                urandom_cache.st_ino = st.st_ino;
-+                if (_Py_fstat(fd, &st)) {
-+                    close(fd);
-+                    return -1;
-+                }
-+                else {
-+                    urandom_cache.fd = fd;
-+                    urandom_cache.st_dev = st.st_dev;
-+                    urandom_cache.st_ino = st.st_ino;
-+                }
-             }
-         }
--    }
- 
--    do {
--        n = _Py_read(fd, buffer, (size_t)size);
--        if (n == -1) {
--            return -1;
--        }
--        if (n == 0) {
--            PyErr_Format(PyExc_RuntimeError,
--                    "Failed to read %zi bytes from /dev/urandom",
--                    size);
-+        do {
-+            n = _Py_read(fd, buffer, (size_t)size);
-+            if (n == -1)
-+                return -1;
-+            if (n == 0) {
-+                PyErr_Format(PyExc_RuntimeError,
-+                        "Failed to read %zi bytes from /dev/urandom",
-+                        size);
-+                return -1;
-+            }
-+
-+            buffer += n;
-+            size -= n;
-+        } while (0 < size);
-+    }
-+    else {
-+        fd = _Py_open_noraise("/dev/urandom", O_RDONLY);
-+        if (fd < 0) {
-             return -1;
-         }
- 
--        buffer += n;
--        size -= n;
--    } while (0 < size);
-+        while (0 < size)
-+        {
-+            do {
-+                n = read(fd, buffer, (size_t)size);
-+            } while (n < 0 && errno == EINTR);
- 
-+            if (n <= 0) {
-+                /* stop on error or if read(size) returned 0 */
-+                close(fd);
-+                return -1;
-+            }
-+
-+            buffer += n;
-+            size -= n;
-+        }
-+        close(fd);
-+    }
-     return 0;
- }
- 
-@@ -376,8 +402,8 @@ dev_urandom_close(void)
-         urandom_cache.fd = -1;
-     }
- }
-+#endif /* !MS_WINDOWS */
- 
--#endif
- 
- /* Fill buffer with pseudo-random bytes generated by a linear congruent
-    generator (LCG):
-@@ -400,31 +426,100 @@ lcg_urandom(unsigned int x0, unsigned char *buffer, size_t size)
-     }
- }
- 
--/* Fill buffer with size pseudo-random bytes from the operating system random
--   number generator (RNG). It is suitable for most cryptographic purposes
--   except long living private keys for asymmetric encryption.
-+/* Read random bytes:
- 
--   Return 0 on success, raise an exception and return -1 on error. */
--int
--_PyOS_URandom(void *buffer, Py_ssize_t size)
-+   - Return 0 on success
-+   - Raise an exception (if raise is non-zero) and return -1 on error
-+
-+   Used sources of entropy ordered by preference, preferred source first:
-+
-+   - CryptGenRandom() on Windows
-+   - getrandom() function (ex: Linux and Solaris): call py_getrandom()
-+   - getentropy() function (ex: OpenBSD): call py_getentropy()
-+   - /dev/urandom device
-+
-+   Read from the /dev/urandom device if getrandom() or getentropy() function
-+   is not available or does not work.
-+
-+   Prefer getrandom() over getentropy() because getrandom() supports blocking
-+   and non-blocking mode and Python requires non-blocking RNG at startup to
-+   initialize its hash secret: see the PEP 524.
-+
-+   Prefer getrandom() and getentropy() over reading directly /dev/urandom
-+   because these functions don't need file descriptors and so avoid ENFILE or
-+   EMFILE errors (too many open files): see the issue #18756.
-+
-+   Only use RNG running in the kernel. They are more secure because it is
-+   harder to get the internal state of a RNG running in the kernel land than a
-+   RNG running in the user land. The kernel has a direct access to the hardware
-+   and has access to hardware RNG, they are used as entropy sources.
-+
-+   Note: the OpenSSL RAND_pseudo_bytes() function does not automatically reseed
-+   its RNG on fork(), two child processes (with the same pid) generate the same
-+   random numbers: see issue #18747. Kernel RNGs don't have this issue,
-+   they have access to good quality entropy sources.
-+
-+   If raise is zero:
-+
-+   - Don't raise an exception on error
-+   - Don't call the Python signal handler (don't call PyErr_CheckSignals()) if
-+     a function fails with EINTR: retry directly the interrupted function
-+   - Don't release the GIL to call functions.
-+*/
-+static int
-+pyurandom(void *buffer, Py_ssize_t size, int raise)
- {
-+#if defined(PY_GETRANDOM) || defined(PY_GETENTROPY)
-+    int res;
-+#endif
-+
-     if (size < 0) {
--        PyErr_Format(PyExc_ValueError,
--                     "negative argument not allowed");
-+        if (raise) {
-+            PyErr_Format(PyExc_ValueError,
-+                         "negative argument not allowed");
-+        }
-         return -1;
-     }
--    if (size == 0)
-+
-+    if (size == 0) {
-         return 0;
-+    }
- 
- #ifdef MS_WINDOWS
--    return win32_urandom((unsigned char *)buffer, size, 1);
--#elif defined(PY_GETENTROPY)
--    return py_getentropy(buffer, size, 0);
-+    return win32_urandom((unsigned char *)buffer, size, raise);
-+#else
-+
-+#if defined(PY_GETRANDOM) || defined(PY_GETENTROPY)
-+#ifdef PY_GETRANDOM
-+    res = py_getrandom(buffer, size, raise);
- #else
--    return dev_urandom_python((char*)buffer, size);
-+    res = py_getentropy(buffer, size, raise);
-+#endif
-+    if (res < 0) {
-+        return -1;
-+    }
-+    if (res == 1) {
-+        return 0;
-+    }
-+    /* getrandom() or getentropy() function is not available: failed with
-+       ENOSYS, EPERM or EAGAIN. Fall back on reading from /dev/urandom. */
-+#endif
-+
-+    return dev_urandom(buffer, size, raise);
- #endif
- }
- 
-+/* Fill buffer with size pseudo-random bytes from the operating system random
-+   number generator (RNG). It is suitable for most cryptographic purposes
-+   except long living private keys for asymmetric encryption.
-+
-+   Return 0 on success. Raise an exception and return -1 on error. */
-+int
-+_PyOS_URandom(void *buffer, Py_ssize_t size)
-+{
-+    return pyurandom(buffer, size, 1);
-+}
-+
- void
- _PyRandom_Init(void)
- {
-@@ -463,13 +558,14 @@ _PyRandom_Init(void)
-         }
-     }
-     else {
--#ifdef MS_WINDOWS
--        (void)win32_urandom(secret, secret_size, 0);
--#elif defined(PY_GETENTROPY)
--        (void)py_getentropy(secret, secret_size, 1);
--#else
--        dev_urandom_noraise(secret, secret_size);
--#endif
-+        int res;
-+
-+        /* _PyRandom_Init() is called very early in the Python initialization
-+           and so exceptions cannot be used (use raise=0). */
-+        res = pyurandom(secret, secret_size, 0);
-+        if (res < 0) {
-+            Py_FatalError("failed to get random numbers to initialize Python");
-+        }
-     }
- }
- 
-@@ -481,8 +577,6 @@ _PyRandom_Fini(void)
-         CryptReleaseContext(hCryptProv, 0);
-         hCryptProv = 0;
-     }
--#elif defined(PY_GETENTROPY)
--    /* nothing to clean */
- #else
-     dev_urandom_close();
- #endif
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.5.3.bb
rename to meta/recipes-devtools/python/python3_3.5.4.bb
index 3ae0db2..4c7a225 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.4.bb
@@ -35,15 +35,13 @@ SRC_URI += "\
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://configure.ac-fix-LIBPL.patch \
-            file://upstream-random-fixes.patch \
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
-            file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
            "
-SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
-SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
+SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
+SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b680ed99aa60d350c65a65914494207e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


