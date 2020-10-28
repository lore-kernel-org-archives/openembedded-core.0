Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web08.3871.1603919198744962167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cd9VJZ5W;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v4so1000417edi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7lls199O+SAndpnApvlAHprwCVVZoPCrzAQEj93vlo=;
        b=Cd9VJZ5WUwVMslCeQG3S0f/Gl8AoCF83QLmV/93E1UMLb29XI2YeJ6XR8cJr3oO5WH
         ZuPA7pqWPzBMUsXDmxUh4k+DEsKhyGVsww0beBJ1BDsxs7Umo1tIqZsGdkHwmAYKvNE2
         iDSM4B9Ml/hT/p8oSFXxx1QXyeN1BJrNKiAq32CELbTlWvd+5QYVTahkaInUFBxbuzOA
         xKYpPKEdMyEt5/V0+Pko4L0ieHdab8xA1Gg1kC5/H0vZy0gsoNEEfE2ZGBeKV0gXChUu
         VusTEAe4yrBM9TEiVuXkBAwrTw1at3dUo63VALckO7O8P88hDEC2ZvcMoRyWoF00RxR0
         n3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7lls199O+SAndpnApvlAHprwCVVZoPCrzAQEj93vlo=;
        b=bEodYgdoJUiTJQVT/MLT31uv2Gc/cC7W3ElYmRI/CgfBWTVJJnucbxAXazTXGXe2sz
         TLW0qDGbsVWso2vH5sZM+uTR8puxwXupP3vlTUoYftB5RDEf4gpKhR6kqqVgwfq4rVbS
         4dK0T9ng8/e7QMyqLvW2CPFPw3pLd13oI1DAQvnHuWvOq1GDM/0Vuk2OgFhUCTqceQlS
         /1DQFAD+q+xEyrBZn2ZhWVtI/zBaWBwYFYeLNjYkwVWAGgW+drCFfjxQIPBN2F9IvWsd
         nGQNw5M4PtnAKWbRlKyASZ4IRVMYTnkl73P9bHvs824+g+HCh5llhWLH7j0MsokH7TcU
         4PfA==
X-Gm-Message-State: AOAM533oe5WdZyfnqEkeRY+SNFiklELIACVI6A18Xf6RcgJoJKaf6e8s
	9d0tbZ+x7V7J17EwcWomO07KKt0fTRsEsQ==
X-Google-Smtp-Source: ABdhPJx4WvZKtZZ/r9UjLcV5s860MnxlU9Ydsjx5q/e9G/0BWS6zie02CfzM35tw4zd64g4tKTeDBg==
X-Received: by 2002:aa7:d54f:: with SMTP id u15mr823114edr.239.1603919196719;
        Wed, 28 Oct 2020 14:06:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/33] python: update 3.8.5 -> 3.9.0
Date: Wed, 28 Oct 2020 22:05:58 +0100
Message-Id: <20201028210558.21070-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch,
0001-configure.ac-fix-LIBPL.patch and 0001-python3-Do-not-hardcode-lib-for-distutils.patch
as they are all replaced by the new --platlibdir option to ./configure

Rename 0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch to
0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
and describe the changes better.

License-Update: documentation now dual license under PSF & BSD
(not relevant for the recipe.
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/python3-dir.bbclass              |   2 +-
 ...lib-as-location-for-site-packages-an.patch | 214 ------------------
 ...-search-system-for-headers-libraries.patch |   4 +-
 ...use-libdir-values-from-configuratio.patch} |  22 +-
 ...FLAG_REF-always-for-interned-strings.patch |  12 +-
 .../python3/0001-configure.ac-fix-LIBPL.patch |  35 ---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...n3-Do-not-hardcode-lib-for-distutils.patch |  43 ----
 ...asename-to-replace-CC-for-checking-c.patch |  26 +--
 ...report-missing-dependencies-for-disa.patch |   2 +-
 ...tutils-prefix-is-inside-staging-area.patch |  38 ++--
 .../python/python3/python-config.patch        |   8 +-
 .../{python3_3.8.5.bb => python3_3.9.0.bb}    |  24 +-
 13 files changed, 74 insertions(+), 358 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
 rename meta/recipes-devtools/python/python3/{0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch => 0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch} (57%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
 rename meta/recipes-devtools/python/{python3_3.8.5.bb => python3_3.9.0.bb} (94%)

diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
index 036d7140d9..f51f971fc5 100644
--- a/meta/classes/python3-dir.bbclass
+++ b/meta/classes/python3-dir.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.8"
+PYTHON_BASEVERSION = "3.9"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
deleted file mode 100644
index 112c979441..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
+++ /dev/null
@@ -1,214 +0,0 @@
-From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 5 Feb 2019 15:52:02 +0100
-Subject: [PATCH] Do not hardcode "lib" as location for modules, site-packages
- and lib-dynload
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Include/pythonrun.h  |  2 ++
- Lib/site.py          |  4 ++--
- Makefile.pre.in      |  5 +++--
- Modules/getpath.c    | 22 ++++++++++++++--------
- Python/getplatform.c | 10 ++++++++++
- Python/sysmodule.c   |  2 ++
- 6 files changed, 33 insertions(+), 12 deletions(-)
-
-diff --git a/Include/pythonrun.h b/Include/pythonrun.h
-index 46091e0..61b2e15 100644
---- a/Include/pythonrun.h
-+++ b/Include/pythonrun.h
-@@ -7,6 +7,8 @@
- extern "C" {
- #endif
- 
-+PyAPI_FUNC(const char *) Py_GetLib(void);
-+
- #ifndef Py_LIMITED_API
- PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
- PyAPI_FUNC(int) PyRun_AnyFileExFlags(
-diff --git a/Lib/site.py b/Lib/site.py
-index a065ab0..1d720ef 100644
---- a/Lib/site.py
-+++ b/Lib/site.py
-@@ -335,12 +335,12 @@ def getsitepackages(prefixes=None):
-         seen.add(prefix)
- 
-         if os.sep == '/':
--            sitepackages.append(os.path.join(prefix, "lib",
-+            sitepackages.append(os.path.join(prefix, sys.lib,
-                                         "python%d.%d" % sys.version_info[:2],
-                                         "site-packages"))
-         else:
-             sitepackages.append(prefix)
--            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
-+            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-     return sitepackages
- 
- def addsitepackages(known_paths, prefixes=None):
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 65665df..be49140 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -143,7 +143,7 @@ LIBDIR=		@libdir@
- MANDIR=		@mandir@
- INCLUDEDIR=	@includedir@
- CONFINCLUDEDIR=	$(exec_prefix)/include
--SCRIPTDIR=	$(prefix)/lib
-+SCRIPTDIR=	@libdir@
- ABIFLAGS=	@ABIFLAGS@
- 
- # Detailed destination directories
-@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
- 		-DEXEC_PREFIX='"$(exec_prefix)"' \
- 		-DVERSION='"$(VERSION)"' \
- 		-DVPATH='"$(VPATH)"' \
-+		-DLIB='"$(LIB)"' \
- 		-o $@ $(srcdir)/Modules/getpath.c
- 
- Programs/python.o: $(srcdir)/Programs/python.c
-@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
- 
- Python/getplatform.o: $(srcdir)/Python/getplatform.c
--		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
-+		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
- 
- Python/importdl.o: $(srcdir)/Python/importdl.c
- 		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-diff --git a/Modules/getpath.c b/Modules/getpath.c
-index b727f66..c003e46 100644
---- a/Modules/getpath.c
-+++ b/Modules/getpath.c
-@@ -128,6 +128,7 @@ typedef struct {
-     wchar_t *exec_prefix;              /* EXEC_PREFIX macro */
- 
-     wchar_t *lib_python;               /* "lib/pythonX.Y" */
-+    wchar_t *multilib_python;               /* "lib[suffix]/pythonX.Y" */
- 
-     int prefix_found;         /* found platform independent libraries? */
-     int exec_prefix_found;    /* found the platform dependent libraries? */
-@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-         if (delim) {
-             *delim = L'\0';
-         }
--        status = joinpath(prefix, calculate->lib_python, prefix_len);
-+        status = joinpath(prefix, calculate->multilib_python, prefix_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             return status;
-         }
-@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-     do {
-         /* Path: <argv0_path or substring> / <lib_python> / LANDMARK */
-         size_t n = wcslen(prefix);
--        status = joinpath(prefix, calculate->lib_python, prefix_len);
-+        status = joinpath(prefix, calculate->multilib_python, prefix_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             return status;
-         }
-@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-     if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
-         return PATHLEN_ERR();
-     }
--    status = joinpath(prefix, calculate->lib_python, prefix_len);
-+    status = joinpath(prefix, calculate->multilib_python, prefix_len);
-     if (_PyStatus_EXCEPTION(status)) {
-         return status;
-     }
-@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-         if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
-             return PATHLEN_ERR();
-         }
--        status = joinpath(prefix, calculate->lib_python, prefix_len);
-+        status = joinpath(prefix, calculate->multilib_python, prefix_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             return status;
-         }
-@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-                 return PATHLEN_ERR();
-             }
-         }
--        status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
-+        status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             return status;
-         }
-@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-     do {
-         /* Path: <argv0_path or substring> / <lib_python> / "lib-dynload" */
-         size_t n = wcslen(exec_prefix);
--        status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
-+        status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             return status;
-         }
-@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
-     if (safe_wcscpy(exec_prefix, calculate->exec_prefix, exec_prefix_len) < 0) {
-         return PATHLEN_ERR();
-     }
--    status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
-+    status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
-     if (_PyStatus_EXCEPTION(status)) {
-         return status;
-     }
-@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate, const wchar_t *program_full_pat
-             return PATHLEN_ERR();
-         }
-         reduce(argv0_path);
--        status = joinpath(argv0_path, calculate->lib_python, argv0_path_len);
-+        status = joinpath(argv0_path, calculate->multilib_python, argv0_path_len);
-         if (_PyStatus_EXCEPTION(status)) {
-             PyMem_RawFree(wbuf);
-             return status;
-@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, const PyConfig *config)
-     if (!calculate->lib_python) {
-         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
-     }
-+    calculate->multilib_python = Py_DecodeLocale(LIB "/python" VERSION, &len);
-+    if (!calculate->multilib_python) {
-+        return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
-+    }
- 
-     calculate->warnings = config->pathconfig_warnings;
-     calculate->pythonpath_env = config->pythonpath_env;
-@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)
-     PyMem_RawFree(calculate->prefix);
-     PyMem_RawFree(calculate->exec_prefix);
-     PyMem_RawFree(calculate->lib_python);
-+    PyMem_RawFree(calculate->multilib_python);
-     PyMem_RawFree(calculate->path_env);
- }
- 
-diff --git a/Python/getplatform.c b/Python/getplatform.c
-index 81a0f7a..d55396b 100644
---- a/Python/getplatform.c
-+++ b/Python/getplatform.c
-@@ -10,3 +10,13 @@ Py_GetPlatform(void)
- {
-     return PLATFORM;
- }
-+
-+#ifndef LIB
-+#define LIB "lib"
-+#endif
-+
-+const char *
-+Py_GetLib(void)
-+{
-+	return LIB;
-+}
-diff --git a/Python/sysmodule.c b/Python/sysmodule.c
-index 5b0fb81..0dce754 100644
---- a/Python/sysmodule.c
-+++ b/Python/sysmodule.c
-@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime, PyInterpreterState *interp,
-                         PyUnicode_FromString(Py_GetCopyright()));
-     SET_SYS_FROM_STRING("platform",
-                         PyUnicode_FromString(Py_GetPlatform()));
-+    SET_SYS_FROM_STRING("lib",
-+                        PyUnicode_FromString(Py_GetLib()));
-     SET_SYS_FROM_STRING("maxsize",
-                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
-     SET_SYS_FROM_STRING("float_info",
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 3e471b9a49..a94fa0a5a9 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From b880e78bf4a1852e260188e6df3ec6034403d2fc Mon Sep 17 00:00:00 2001
+From 9da913bf5f39c6fe737219af7419170574d6fbfb Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,7 +11,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 7208cd0..c0bd0ad 100644
+index a0bf9ea..da099bf 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
similarity index 57%
rename from meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
rename to meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
index b97583682a..1490cdbb18 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch
@@ -1,27 +1,28 @@
-From a21f4f8fa5e5c0601898740b4ac08ec84f41e190 Mon Sep 17 00:00:00 2001
+From deeedd1b8799294ab276ab7dbbfdb59c1dacc9a2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 18 Apr 2019 17:11:06 +0200
-Subject: [PATCH] Lib/sysconfig.py: fix another place where 'lib' is hardcoded
- as the library path
+Date: Thu, 22 Oct 2020 13:10:34 +0200
+Subject: [PATCH] Lib/sysconfig.py: use libdir values from configuration file
+
+This allows correctly substituting them for target installs using
+native python.
 
-Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Lib/sysconfig.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index d15cec8..87fa5e6 100644
+index bf04ac5..ed0462b 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
 @@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
      'posix_prefix': {
--        'stdlib': '{installed_base}/lib/python{py_version_short}',
--        'platstdlib': '{platbase}/lib/python{py_version_short}',
+-        'stdlib': '{installed_base}/{platlibdir}/python{py_version_short}',
+-        'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
 -        'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
 +        'stdlib': '{LIBDEST}',
 +        'platstdlib': '{LIBDEST}',
 +        'purelib': '{LIBDEST}/site-packages',
@@ -29,3 +30,6 @@ index d15cec8..87fa5e6 100644
          'include':
              '{installed_base}/include/python{py_version_short}{abiflags}',
          'platinclude':
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
index 957839bf3e..793385de91 100644
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
@@ -1,19 +1,20 @@
-From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001
+From 9f63e83b1cec872917647b11155edaffe399d103 Mon Sep 17 00:00:00 2001
 From: Inada Naoki <songofacandy@gmail.com>
 Date: Sat, 14 Jul 2018 00:46:11 +0900
 Subject: [PATCH] Use FLAG_REF always for interned strings
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/8226]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+
 ---
  Python/marshal.c | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/Python/marshal.c b/Python/marshal.c
-index 6d06266c6a..51db2e3b2e 100644
+index c4538bd..2437160 100644
 --- a/Python/marshal.c
 +++ b/Python/marshal.c
-@@ -275,9 +275,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
+@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
      if (p->version < 3 || p->hashtable == NULL)
          return 0; /* not writing object references */
  
@@ -28,8 +29,5 @@ index 6d06266c6a..51db2e3b2e 100644
          return 0;
 +    }
  
-     entry = _Py_HASHTABLE_GET_ENTRY(p->hashtable, v);
+     entry = _Py_hashtable_get_entry(p->hashtable, v);
      if (entry != NULL) {
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
deleted file mode 100644
index 123ce3a2dc..0000000000
--- a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From acce3d441e7eadadd2d3ce38654155dc43f1f607 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 7 Feb 2020 09:36:25 +0800
-Subject: [PATCH] configure.ac: fix LIBPL
-
-Use LIBDIR rather than prefix/lib, so that it would work when lib64.
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Li Zhou <li.zhou@windriver.c>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ce04258..915f475 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4532,9 +4532,9 @@ fi
- dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
- AC_SUBST(PY_ENABLE_SHARED)
- if test x$PLATFORM_TRIPLET = x; then
--  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
-+  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
- else
--  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
-+  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
- fi
- AC_SUBST(LIBPL)
-
---
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 2b68c0acc2..b982691b36 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From bc59d49efff41051034d7fbf5d0c8505e4c3134b Mon Sep 17 00:00:00 2001
+From e65bfe22c858872b08366aff49119d4145a77f40 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
deleted file mode 100644
index fe031b9983..0000000000
--- a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From bb711b53f10d32a90a27ccf4b0dc51e4a701d862 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 7 Feb 2020 09:42:09 +0800
-Subject: [PATCH] python3: Do not hardcode "lib" for distutils
-
-Get the sys.lib from python3 itself and do not use
-hardcoded value of 'lib' for distutils.
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Lib/distutils/command/install.py | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
-index c625c95..8e32f54 100644
---- a/Lib/distutils/command/install.py
-+++ b/Lib/distutils/command/install.py
-@@ -19,6 +19,8 @@ from site import USER_BASE
- from site import USER_SITE
- HAS_USER_SITE = True
-
-+libname = sys.lib
-+
- WINDOWS_SCHEME = {
-     'purelib': '$base/Lib/site-packages',
-     'platlib': '$base/Lib/site-packages',
-@@ -29,8 +31,8 @@ WINDOWS_SCHEME = {
-
- INSTALL_SCHEMES = {
-     'unix_prefix': {
--        'purelib': '$base/lib/python$py_version_short/site-packages',
--        'platlib': '$platbase/lib/python$py_version_short/site-packages',
-+        'purelib': '$base/' + libname + '/python$py_version_short/site-packages',
-+        'platlib': '$platbase/' + libname + '/python$py_version_short/site-packages',
-         'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
-         'scripts': '$base/bin',
-         'data'   : '$base',
---
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index fb10ca94b3..bfddc1ad52 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001
+From 5f9eea2c4f8716830f6c8855a3e10872119fae32 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a189d42..0f85486 100644
+index d60f052..e491e24 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
@@ -38,7 +38,7 @@ index a189d42..0f85486 100644
  
  # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
  rm -f pybuilddir.txt
-@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)
+@@ -689,7 +690,7 @@ AC_MSG_RESULT($with_cxx_main)
  preset_cxx="$CXX"
  if test -z "$CXX"
  then
@@ -47,7 +47,7 @@ index a189d42..0f85486 100644
          gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
-@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir
+@@ -975,7 +976,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -56,7 +56,7 @@ index a189d42..0f85486 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1335,7 +1336,7 @@ else
+@@ -1366,7 +1367,7 @@ else
  fi],
  [AC_MSG_RESULT(no)])
  if test "$Py_LTO" = 'true' ; then
@@ -65,7 +65,7 @@ index a189d42..0f85486 100644
      *clang*)
        AC_SUBST(LLVM_AR)
        AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
-@@ -1425,7 +1426,7 @@ then
+@@ -1456,7 +1457,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -74,7 +74,7 @@ index a189d42..0f85486 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -1486,7 +1487,7 @@ esac
+@@ -1517,7 +1518,7 @@ esac
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -83,7 +83,7 @@ index a189d42..0f85486 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -1622,7 +1623,7 @@ yes)
+@@ -1653,7 +1654,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -92,16 +92,16 @@ index a189d42..0f85486 100644
      *icc*)
      ac_cv_disable_unused_result_warning=no
      ;;
-@@ -1943,7 +1944,7 @@ yes)
+@@ -1993,7 +1994,7 @@ yes)
+     ;;
  esac
  
- # ICC needs -fp-model strict or floats behave badly
 -case "$CC" in
 +case "$cc_basename" in
  *icc*)
+     # ICC needs -fp-model strict or floats behave badly
      CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
-     ;;
-@@ -2711,7 +2712,7 @@ then
+@@ -2765,7 +2766,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -110,7 +110,7 @@ index a189d42..0f85486 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -5362,7 +5363,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+@@ -5507,7 +5508,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 4bd98f62fd..5c620361da 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -25,7 +25,7 @@ index 7691258..ec3f2a4 100644
  
 +        # There is no need to report missing module dependencies,
 +        # if the modules have been disabled in the first place.
-+        self.missing = list(set(self.missing) - set(sysconf_dis))
++        self.missing = list(set(self.missing) - set(mods_disabled))
 +
          if self.missing:
              print()
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 820fb98ed8..5a39cf8933 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,27 +1,26 @@
-From 064187668fcbefdd39a8cde372bf651124c3e578 Mon Sep 17 00:00:00 2001
+From c52fa7948ef109db1132fdc1aee0b68f8d767b4e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
-Subject: [PATCH] python3: Add target and native recipes
+Subject: [PATCH 1/2] python3: Add target and native recipes
 
 Upstream-Status: Inappropriate [embedded specific]
 
 02/2015 Rebased for Python 3.4.2
 
-# The proper prefix is inside our staging area.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Signed-off-by: Phil Blundell <philb@gnu.org>
-# Signed-off-by: Khem Raj <raj.khem@gmail.com>
-# Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
+The proper prefix is inside our staging area.
+Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Signed-off-by: Phil Blundell <philb@gnu.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 ---
  Lib/distutils/sysconfig.py | 14 +++++++++++---
  1 file changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 2df348c..4f8db84 100644
+index 4774e12..ccf7d58 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -96,7 +96,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -95,7 +95,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -32,7 +31,7 @@ index 2df348c..4f8db84 100644
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -139,7 +141,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -138,7 +140,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -47,12 +46,15 @@ index 2df348c..4f8db84 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -147,7 +155,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
- 
-     if os.name == "posix":
-         libpython = os.path.join(prefix,
--                                 "lib", "python" + get_python_version())
-+                                 lib_basename, "python" + get_python_version())
+@@ -152,7 +160,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+         else:
+             # Pure Python
+             libdir = "lib"
+-        libpython = os.path.join(prefix, libdir,
++        libpython = os.path.join(prefix, lib_basename,
+                                  "python" + get_python_version())
          if standard_lib:
              return libpython
-         else:
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
index c8a8f3d4aa..d0ddbbc7fd 100644
--- a/meta/recipes-devtools/python/python3/python-config.patch
+++ b/meta/recipes-devtools/python/python3/python-config.patch
@@ -1,4 +1,4 @@
-From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001
+From 57d073c12e7bede29919117b0141df14015eb27f Mon Sep 17 00:00:00 2001
 From: Tyler Hall <tylerwhall@gmail.com>
 Date: Sun, 4 May 2014 20:06:43 -0400
 Subject: [PATCH] python-config: Revert to using distutils.sysconfig
@@ -21,7 +21,7 @@ Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Misc/python-config.in b/Misc/python-config.in
-index 727c4a8..c702829 100644
+index ebd99da..13e57ae 100644
 --- a/Misc/python-config.in
 +++ b/Misc/python-config.in
 @@ -6,7 +6,7 @@
@@ -37,11 +37,11 @@ index 727c4a8..c702829 100644
  
  for opt in opt_flags:
      if opt == '--prefix':
--        print(sysconfig.get_config_var('prefix'))
+-        print(getvar('prefix'))
 +        print(sysconfig.PREFIX)
  
      elif opt == '--exec-prefix':
--        print(sysconfig.get_config_var('exec_prefix'))
+-        print(getvar('exec_prefix'))
 +        print(sysconfig.EXEC_PREFIX)
  
      elif opt in ('--includes', '--cflags'):
diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3_3.8.5.bb
rename to meta/recipes-devtools/python/python3_3.9.0.bb
index 2a3c52a116..6402760a1b 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -11,27 +11,24 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://get_module_deps3.py \
            file://python3-manifest.json \
            file://check_build_completeness.py \
+           file://reformat_sysconfig.py \
            file://cgi_py.patch \
            file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
            file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
            file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
-           file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            file://crosspythonpath.patch \
-           file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
-           file://0001-configure.ac-fix-LIBPL.patch \
-           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -40,8 +37,7 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
-SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
+SRC_URI[sha256sum] = "9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -52,7 +48,7 @@ CVE_PRODUCT = "python"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
-PYTHON_MAJMIN = "3.8"
+PYTHON_MAJMIN = "3.9"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -71,7 +67,7 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/li
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-EXTRA_OECONF = " --without-ensurepip --enable-shared"
+EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
 
 export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
@@ -162,6 +158,14 @@ do_install_append() {
                 -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
                 -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
                 ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
+
+        # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
+        # being written without strict ordering, even with PYTHONHASHSEED = 0
+        # Upstream is discussing ways to solve the issue properly, until then let's
+        # just not install the problematic files.
+        # More info: http://benno.id.au/blog/2013/01/15/python-determinism
+        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
+        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 }
 
 do_install_append_class-nativesdk () {
-- 
2.29.0

