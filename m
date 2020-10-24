Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.18029.1603574531202948275
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 14:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pwf5pu7B;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id u17so6439617oie.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2020 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w8byTXz+y9ze0L++764mMJ9I0Mk8II8olkSH+EI4No0=;
        b=Pwf5pu7Be5Qda4dLVcKRHt3YSMsRWHGrZ/f0QDNYYI7Ok1jE/pCoYQ2Ef4OCzshUKf
         w41Y8zr0U9IZhcuZVpW9lkzZBYuLzI8EkA5BpXLj/8RieDoHvCr7k4gIjYedYUpMYfMz
         9AKNQZeRqxwpUXN36/96SmktZKgtLtacaZA3WVBQGzqfJqyQSFokgwjLcC+0M0qtjUyC
         qN0yI+0iGm7JyLeQUvdZntbNHdQOyeSOANpeE7AxY0caE57Re2S9v1brH/CKfKCA0MJM
         3TSlGWtzTr14UI/SDpmLARuGOstPT5XzOWD7XAAPzguuDqiyqe/h7uORQxptZ94myKhw
         xpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8byTXz+y9ze0L++764mMJ9I0Mk8II8olkSH+EI4No0=;
        b=BEZtL7l0JnD+3xLYh1L21feUwNm9X1rYC7LdWD+johjtDFxtLc8Gj36v5OI8KSl7PO
         GL2HNGnPnhPcsUCg72Jdx6FIdBRuCd7wizhb/GqXXgUa8jxZOghdfdv3MqcFK5FW8Vvu
         KCeKtHsLNM3JTn452K7EBw6dK6Pa+pKPjDPdz0KJQo4KiIm38j987Khs0OfViFRP1uBg
         YaJqMKnizJlT75u8yp/HfncrMGb2SLDXffxBnQn2yvYfVSMIgj1a+P1SBVtdTCoHqABz
         AkSKzFmYKWraE0BweFtqm4I7CoXsBKK+YJ4Ntr1hq7M1PbsYokxI1rlC6qYVoZ2G17+u
         THcw==
X-Gm-Message-State: AOAM532+LAhFmR1IyKLxch3hTQClOKCC03updukzkMZ2cIpV4bm0M6gM
	GQbGGc3kqym0V0jl/qN5sG7UiybCbUOc3w==
X-Google-Smtp-Source: ABdhPJwC0kKPbaPCnHxkwhPV00BGZJN/HCZv0e2cSKhwxIgP1TsA6tTuUSr4LgAKjjC/6DhgEy4JVQ==
X-Received: by 2002:aca:378a:: with SMTP id e132mr5861438oia.112.1603574529628;
        Sat, 24 Oct 2020 14:22:09 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id d11sm1513090oti.69.2020.10.24.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 14:22:08 -0700 (PDT)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
X-Google-Original-From: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
Subject: [PATCH 2/2] python3: upgrade to python 3.9.0
Date: Sat, 24 Oct 2020 15:20:25 -0600
Message-Id: <20201024212025.1107408-2-alejandro.hernandez@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024212025.1107408-1-alejandro.hernandez@linux.microsoft.com>
References: <20201024212025.1107408-1-alejandro.hernandez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AFAIC the upstream fix to use --with-platlibdir can now replace the
functinoality we put in place for multilib builds, this patch uses
such config as well as removes some of the patches for that.

- Fixes fuzz on patches
- Rebased the rest to work on 3.9.0
- License changedm, it now includes BSD Clause 0

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
---
 meta/classes/python3-dir.bbclass              |   2 +-
 ...ib-termcap-to-linker-flags-to-avoid-.patch |   6 +-
 ...lib-as-location-for-site-packages-an.patch | 214 ------------------
 ...hell-version-of-python-config-that-w.patch |   7 +-
 ...-search-system-for-headers-libraries.patch |   6 +-
 ...-fix-another-place-where-lib-is-hard.patch |  18 +-
 ...file-do-not-compile-.pyc-in-parallel.patch |   7 +-
 ...sue36464-parallel-build-race-problem.patch |  10 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   7 +-
 ...FLAG_REF-always-for-interned-strings.patch |  12 +-
 ...-detection-of-mips-architecture-for-.patch |  11 +-
 .../python3/0001-configure.ac-fix-LIBPL.patch |  35 ---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |  10 +-
 ...n3-Do-not-hardcode-lib-for-distutils.patch |  43 ----
 ...asename-to-replace-CC-for-checking-c.patch |  26 +--
 ...ssing-libraries-to-Extension-for-mul.patch |   7 +-
 ...le.py-correct-the-test-output-format.patch |  10 +-
 ...report-missing-dependencies-for-disa.patch |  14 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  11 +-
 ...tutils-prefix-is-inside-staging-area.patch |  25 +-
 .../python3/avoid_warning_about_tkinter.patch |   6 +-
 .../python/python3/cgi_py.patch               |   4 +-
 .../python/python3/crosspythonpath.patch      |  13 +-
 .../python/python3/python-config.patch        |   8 +-
 .../{python3_3.8.5.bb => python3_3.9.0.bb}    |  17 +-
 25 files changed, 123 insertions(+), 406 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
 rename meta/recipes-devtools/python/{python3_3.8.5.bb => python3_3.9.0.bb} (95%)

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
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
index 59592821d7..44354f44d4 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
@@ -1,4 +1,4 @@
-From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001
+From 2b122b1e664a91b14a8d8074d342439c1892700a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 25 Jan 2019 19:04:13 +0100
 Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 20d7f35..ab18ff0 100644
+index 770866b..d3ccc6c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):
+@@ -1058,7 +1058,6 @@ class PyBuildExt(build_ext):
                                                       'termcap'):
                  readline_libs.append('termcap')
              self.add(Extension('readline', ['readline.c'],
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
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
index 83fd52d87f..7113ce2138 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
@@ -1,4 +1,4 @@
-From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001
+From 980fcf1a36bcb3ab26d4e82a304e205f02cb376f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 29 Jan 2019 15:03:01 +0100
 Subject: [PATCH] Do not use the shell version of python-config that was
@@ -9,15 +9,16 @@ outputs directories correctly.
 
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.pre.in | 9 +++------
  1 file changed, 3 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2d2e11f..cc19942 100644
+index 77f91e7..5259754 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -1568,12 +1568,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
  	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
  	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 3e471b9a49..95b4969c09 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From b880e78bf4a1852e260188e6df3ec6034403d2fc Mon Sep 17 00:00:00 2001
+From 9325b9705046d5ad4ade0482f0020a0ae5c56eaf Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 7208cd0..c0bd0ad 100644
+index a456e53..af194ee 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
+@@ -770,8 +770,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
index b97583682a..7aaa346c5d 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
@@ -6,22 +6,26 @@ Subject: [PATCH] Lib/sysconfig.py: fix another place where 'lib' is hardcoded
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased for 3.9 [10/2020]
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
+
 ---
  Lib/sysconfig.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index d15cec8..87fa5e6 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
+Index: Python-3.9.0/Lib/sysconfig.py
+===================================================================
+--- Python-3.9.0.orig/Lib/sysconfig.py
++++ Python-3.9.0/Lib/sysconfig.py
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
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
index b1bceac512..fee0f45219 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
@@ -1,4 +1,4 @@
-From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001
+From 04b5cbff2126339417763f908c89eba076e60c4e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 16 Jan 2020 12:34:20 +0100
 Subject: [PATCH] Makefile: do not compile .pyc in parallel
@@ -11,15 +11,16 @@ https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a4150
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.pre.in | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 1241112..5dfdf44 100644
+index 09763f5..59b95be 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1457,30 +1457,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1529,30 +1529,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	fi
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
index 237645bc60..bdce71f1c4 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
@@ -1,4 +1,4 @@
-From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
+From 8da4539c32ba0eb36aae65a5cbd0a71082764ca9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 8 May 2019 16:10:29 +0800
 Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
@@ -12,15 +12,16 @@ exists in the libainstall target.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  Makefile.pre.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 15f3687..7e9f173 100644
+index a87fe82..09763f5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1456,7 +1456,7 @@ LIBPL=		@LIBPL@
+@@ -1618,7 +1618,7 @@ LIBPL=		@LIBPL@
  LIBPC=		$(LIBDIR)/pkgconfig
  
  libainstall:	@DEF_MAKE_RULE@ python-config
@@ -29,6 +30,3 @@ index 15f3687..7e9f173 100644
  	do \
  		if test ! -d $(DESTDIR)$$i; then \
  			echo "Creating directory $$i"; \
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index fa7735ff93..5eb356ac6c 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,19 +1,20 @@
-From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001
+From f1f29d96b3d270656feb85bcc00ca29c27d8b77f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.pre.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a3a02a7..d5503dd 100644
+index 5259754..a87fe82 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -507,8 +507,7 @@ build_all_generate_profile:
+@@ -519,8 +519,7 @@ build_all_generate_profile:
  	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LDFLAGS_NODIST="$(LDFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
  
  run_profile_task:
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
index 957839bf3e..5a49fff696 100644
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
@@ -1,19 +1,20 @@
-From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001
+From 12d895a9a0c03dd872727434921118016176f561 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index c4fae09a5b..e8dc18277a 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,4 +1,4 @@
-From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
+From 405703bc48271d7280c0281897d0e6a9752bbccc Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
@@ -13,16 +13,16 @@ to do this in a more autoconf/autotools manner.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
-%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+
 ---
  configure.ac | 175 +++++++--------------------------------------------
  1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ede710e..bc81b0b 100644
+index e491e24..784850b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -710,160 +710,27 @@ fi
+@@ -722,160 +722,27 @@ fi
  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
  AC_SUBST(MULTIARCH)
  
@@ -204,6 +204,3 @@ index ede710e..bc81b0b 100644
  
  if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
    if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
--- 
-2.24.1
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
index 2b68c0acc2..d8a296236f 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From bc59d49efff41051034d7fbf5d0c8505e4c3134b Mon Sep 17 00:00:00 2001
+From 5e3b6807b59ad9dbae0727b75a0e603f474d6451 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 4 insertions(+)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index b51629e..2df348c 100644
+index 37feae5..4774e12 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -438,6 +438,8 @@ def _init_posix():
+@@ -444,6 +444,8 @@ def _init_posix():
          platform=sys.platform,
          multiarch=getattr(sys.implementation, '_multiarch', ''),
      ))
@@ -28,10 +28,10 @@ index b51629e..2df348c 100644
      build_time_vars = _temp.build_time_vars
      global _config_vars
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index b2d790b..405273c 100644
+index bf04ac5..010f9ef 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -419,6 +419,8 @@ def _init_posix(vars):
+@@ -417,6 +417,8 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
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
index fb10ca94b3..4c182d2f9e 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001
+From a1a529f61464a222ed0391e422a5824601178fc5 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
index ea0af02e72..7ca6753172 100644
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
@@ -1,4 +1,4 @@
-From 7019ba184b828ed7253750cf409fc5760ef90a54 Mon Sep 17 00:00:00 2001
+From 1bf39bd881a73fd0b9564b46c9e5a126f8483b3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 17:44:05 +0100
 Subject: [PATCH] setup.py: pass missing libraries to Extension for
@@ -50,15 +50,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index ec3f2a4..b0f1541 100644
+index 8cf058c..9c1c33b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):
+@@ -1777,7 +1777,7 @@ class PyBuildExt(build_ext):
                                     libraries=libs,
                                     include_dirs=["Modules/_multiprocessing"]))
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480..bd5f406708 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
+From b2d5ab7c71741bbf27ec4690243244a4de72cfc0 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -24,15 +24,16 @@ Before this patch:
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index e2c2178..558d63c 100644
+index 2863d20..2ed141c 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
@@ -41,6 +42,3 @@ index e2c2178..558d63c 100644
          locale.setlocale(locale.LC_CTYPE, loc)
          self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
  
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 4bd98f62fd..d0ff3219a6 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -1,4 +1,4 @@
-From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
+From 5d85a94fd0965aa26adf593b5f84948e9c502121 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 7 Oct 2019 13:22:14 +0200
 Subject: [PATCH] setup.py: do not report missing dependencies for disabled
@@ -11,20 +11,24 @@ build completeness checker which relies on the report.
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
+Rebased for 3.9 [10/2020]
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
+
 ---
- setup.py | 4 ++++
- 1 file changed, 4 insertions(+)
+ setup.py | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/setup.py b/setup.py
-index 7691258..ec3f2a4 100644
+index ab9fb8e..8cf058c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
+@@ -495,6 +495,11 @@ class PyBuildExt(build_ext):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
 +        # There is no need to report missing module dependencies,
 +        # if the modules have been disabled in the first place.
++        sysconf_dis = sysconfig.get_config_var('MODDISABLED_NAMES').split()
 +        self.missing = list(set(self.missing) - set(sysconf_dis))
 +
          if self.missing:
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index e04a91605c..daa133e1e0 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,4 +1,4 @@
-From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001
+From 5e75ab6ff0e5714684d71a3e75d389cdc1c2e783 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 16 Feb 2020 17:50:25 +0100
 Subject: [PATCH] configure.ac, setup.py: do not add a curses include path from
@@ -11,16 +11,17 @@ as dnf failures).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  configure.ac | 6 ------
  setup.py     | 2 --
  2 files changed, 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 915f475..c911011 100644
+index 01ea772..7ee38f6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4828,12 +4828,6 @@ then
+@@ -4977,12 +4977,6 @@ then
    [Define if you have struct stat.st_mtimensec])
  fi
  
@@ -34,10 +35,10 @@ index 915f475..c911011 100644
  
  # On Solaris, term.h requires curses.h
 diff --git a/setup.py b/setup.py
-index b0f1541..7208cd0 100644
+index 9c1c33b..a456e53 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):
+@@ -1075,8 +1075,6 @@ class PyBuildExt(build_ext):
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 820fb98ed8..bacdfba5ef 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 064187668fcbefdd39a8cde372bf651124c3e578 Mon Sep 17 00:00:00 2001
+From a05f77261dbabea29d05c249bfc2d8632e550b6a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
@@ -6,6 +6,7 @@ Subject: [PATCH] python3: Add target and native recipes
 Upstream-Status: Inappropriate [embedded specific]
 
 02/2015 Rebased for Python 3.4.2
+10/2020 Rebased for Python 3.9.0
 
 # The proper prefix is inside our staging area.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
@@ -18,10 +19,10 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 2df348c..4f8db84 100644
+index 4774e12..5468239 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -96,7 +96,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -95,7 +95,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -32,7 +33,7 @@ index 2df348c..4f8db84 100644
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -139,7 +141,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -138,7 +140,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -47,12 +48,12 @@ index 2df348c..4f8db84 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -147,7 +155,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
- 
-     if os.name == "posix":
-         libpython = os.path.join(prefix,
--                                 "lib", "python" + get_python_version())
-+                                 lib_basename, "python" + get_python_version())
-         if standard_lib:
-             return libpython
+@@ -151,7 +159,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+             libdir = sys.platlibdir
          else:
+             # Pure Python
+-            libdir = "lib"
++            libdir = "lib_basename"
+         libpython = os.path.join(prefix, libdir,
+                                  "python" + get_python_version())
+         if standard_lib:
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index 184540e794..4dfa639669 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -1,4 +1,4 @@
-From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001
+From f0653707a6a310bd059fe4dc3146052bb38b5d83 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei@gherzan.ro>
 Date: Mon, 28 Jan 2019 15:57:54 +0000
 Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is not yet
@@ -15,10 +15,10 @@ Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index ab18ff0..7691258 100644
+index d3ccc6c..ab9fb8e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):
+@@ -1811,8 +1811,8 @@ class PyBuildExt(build_ext):
          self.detect_decimal()
          self.detect_ctypes()
          self.detect_multiprocessing()
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index 6c4ba54320..493fdf0ab8 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -1,4 +1,4 @@
-From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001
+From 5da956e20d53cfdb687b8b8c3c15cfe926961ada Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Wed, 21 Sep 2011 20:55:33 -0500
 Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
@@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 1 insertion(+), 10 deletions(-)
 
 diff --git a/Lib/cgi.py b/Lib/cgi.py
-index 8cf6687..094c7b4 100755
+index 77ab703..3edaf60 100755
 --- a/Lib/cgi.py
 +++ b/Lib/cgi.py
 @@ -1,13 +1,4 @@
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index d789ab57d4..f4c3b93782 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,8 @@
-configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
+From 9dabb16c327211b8fb9327d06d66c7ef6baea4b2 Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda <ricardo@ribalda.com>
+Date: Tue, 18 Nov 2014 03:35:33 -0500
+Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
+ PYTHON_FOR_BUILD
 
 When building x86->x86 the system will try to execute .so and related items
 from the default PYTHONPATH.  This will fail if the target CPU contains
@@ -10,8 +14,13 @@ Upstream-Status: Inappropriate [OE-Core integration specific]
 Credits-to: Mark Hatle <mark.hatle@windriver.com>
 Credits-to: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/configure.ac b/configure.ac
-index 4ab19a6..7036a53 100644
+index 784850b..01ea772 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -76,7 +76,7 @@ if test "$cross_compiling" = yes; then
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
index c8a8f3d4aa..98b28bcbde 100644
--- a/meta/recipes-devtools/python/python3/python-config.patch
+++ b/meta/recipes-devtools/python/python3/python-config.patch
@@ -1,4 +1,4 @@
-From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001
+From bf238a78ec90671789c6498bede99928cb7244e5 Mon Sep 17 00:00:00 2001
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
similarity index 95%
rename from meta/recipes-devtools/python/python3_3.8.5.bb
rename to meta/recipes-devtools/python/python3_3.9.0.bb
index 2a3c52a116..bd1d40edce 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
-LICENSE = "PSFv2"
+LICENSE = "PSFv2 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -17,7 +17,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
            file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
-           file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
@@ -29,19 +28,17 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
-           file://0001-configure.ac-fix-LIBPL.patch \
-           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            "
 
+
 SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
-SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
+SRC_URI[sha256sum] = "9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -52,7 +49,7 @@ CVE_PRODUCT = "python"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
-PYTHON_MAJMIN = "3.8"
+PYTHON_MAJMIN = "3.9"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -71,7 +68,7 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/li
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-EXTRA_OECONF = " --without-ensurepip --enable-shared"
+EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
 
 export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
@@ -115,7 +112,6 @@ CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 EXTRA_OEMAKE = '\
   STAGING_LIBDIR=${STAGING_LIBDIR} \
   STAGING_INCDIR=${STAGING_INCDIR} \
-  LIB=${baselib} \
 '
 
 do_compile_prepend_class-target() {
@@ -179,7 +175,6 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
 
-- 
2.25.1

