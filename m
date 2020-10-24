Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.17994.1603575318829066608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 14:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVhX29Z2;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id v27so171904uau.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2020 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RsXYFEE5btwGXDbpMnx56TcK3zlWMgh3FXjfXzsVfIY=;
        b=VVhX29Z2mwc0uOJZoOF2Fl0dGYE6VuJnI4Yd8FX33wUAowJiZb7gSn/Nuz9hKs7uNj
         KuTE9J4s8/AGZ25W4z0ncclz9fclH/5XrfetD2rHjfg93ZCzH91DNwl3kDjfHeXMmPU9
         PTPiubWbVh8Yc7xsscXxw2/cP46mrLNb6bJkvZZQLWkVrS381p9Z/AzwPyY27yB8tnvM
         lPFS712NtwxtIZtoc41hv5hZQPPJkZy0JH1/17Hv1+qO1RJKBskHTzjdC6Mnn/mXA/MQ
         V/a3GCOv57UfY7rMNPRI6UcsU4ya5ZGIwuFWEXWS+928ktjLaYQ3Rrl/+B+9JfUU5EHD
         Tczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RsXYFEE5btwGXDbpMnx56TcK3zlWMgh3FXjfXzsVfIY=;
        b=KeW4odOcYKYVXRo1L9DtGlhj1zW3V8Hg4+W/4gxO6TBIUXp0oJY94brJhZTh12I63q
         MJrDWxx7taNA/GVR6UjpkyNqltfy2DP1T8OwNRntcDxBR1gKKQUMmhI7ZaTnnhh67H2D
         icFHLUdo9ZMgfjryLqRAf67ZB5UmvQKIldwcZMsDQjvXH/agsbL+wBSpIqghr2cmuxmk
         E6YJjeJqQ6WT744tEpwrMPJlaYf3Q5M80SKfmvd+uonHpZXt/jTKuNNDAn+VD/JnsyRZ
         Wzz4F2h/aiq6YaimSZJpiMBIXkMJHXEOjbHfYKZmuiu1ssKS496x+AzBNh/yaGbzos/n
         U4pw==
X-Gm-Message-State: AOAM532VjGbghYZO7kF7dJAVk+wjNfUpqhWq6jizHLDrg9GKVF7lbZ5p
	lN0yXmysv7LrLPumq5oFw5RvOZRCP5lq1opGMfg=
X-Google-Smtp-Source: ABdhPJyKbcel33G7LdoCcFK9S7HP2X9a1U5nLhqpBQvoVX0Iq2UrgtpBCNHYuDLLuxC4CixKE1L2YSdmGQ/AJebcuXM=
X-Received: by 2002:a9f:2212:: with SMTP id 18mr8794198uad.89.1603575317500;
 Sat, 24 Oct 2020 14:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201024212025.1107408-1-alejandro.hernandez@linux.microsoft.com> <20201024212025.1107408-2-alejandro.hernandez@linux.microsoft.com>
In-Reply-To: <20201024212025.1107408-2-alejandro.hernandez@linux.microsoft.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 24 Oct 2020 23:35:05 +0200
Message-ID: <CANNYZj8g9g_gOkjgW+xD6=FixRL1kpZLgKGwY32LAthJkzOwCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3: upgrade to python 3.9.0
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
Content-Type: multipart/alternative; boundary="0000000000002b997405b27179fd"

--0000000000002b997405b27179fd
Content-Type: text/plain; charset="UTF-8"

Haha, you beat me to it by a few minutes :)
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=98049b60602b4bd3854e870e46705716e469277c

I have some additional fixes included though, coming from autobuilder runs.

Alex




On Sat, 24 Oct 2020 at 23:22, Alejandro Hernandez Samaniego <
alejandro@enedino.org> wrote:

> AFAIC the upstream fix to use --with-platlibdir can now replace the
> functinoality we put in place for multilib builds, this patch uses
> such config as well as removes some of the patches for that.
>
> - Fixes fuzz on patches
> - Rebased the rest to work on 3.9.0
> - License changedm, it now includes BSD Clause 0
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro.hernandez@linux.microsoft.com>
> ---
>  meta/classes/python3-dir.bbclass              |   2 +-
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |   6 +-
>  ...lib-as-location-for-site-packages-an.patch | 214 ------------------
>  ...hell-version-of-python-config-that-w.patch |   7 +-
>  ...-search-system-for-headers-libraries.patch |   6 +-
>  ...-fix-another-place-where-lib-is-hard.patch |  18 +-
>  ...file-do-not-compile-.pyc-in-parallel.patch |   7 +-
>  ...sue36464-parallel-build-race-problem.patch |  10 +-
>  ...-qemu-wrapper-when-gathering-profile.patch |   7 +-
>  ...FLAG_REF-always-for-interned-strings.patch |  12 +-
>  ...-detection-of-mips-architecture-for-.patch |  11 +-
>  .../python3/0001-configure.ac-fix-LIBPL.patch |  35 ---
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |  10 +-
>  ...n3-Do-not-hardcode-lib-for-distutils.patch |  43 ----
>  ...asename-to-replace-CC-for-checking-c.patch |  26 +--
>  ...ssing-libraries-to-Extension-for-mul.patch |   7 +-
>  ...le.py-correct-the-test-output-format.patch |  10 +-
>  ...report-missing-dependencies-for-disa.patch |  14 +-
>  ...up.py-do-not-add-a-curses-include-pa.patch |  11 +-
>  ...tutils-prefix-is-inside-staging-area.patch |  25 +-
>  .../python3/avoid_warning_about_tkinter.patch |   6 +-
>  .../python/python3/cgi_py.patch               |   4 +-
>  .../python/python3/crosspythonpath.patch      |  13 +-
>  .../python/python3/python-config.patch        |   8 +-
>  .../{python3_3.8.5.bb => python3_3.9.0.bb}    |  17 +-
>  25 files changed, 123 insertions(+), 406 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
>  rename meta/recipes-devtools/python/{python3_3.8.5.bb => python3_3.9.0.bb}
> (95%)
>
> diff --git a/meta/classes/python3-dir.bbclass
> b/meta/classes/python3-dir.bbclass
> index 036d7140d9..f51f971fc5 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,4 +1,4 @@
> -PYTHON_BASEVERSION = "3.8"
> +PYTHON_BASEVERSION = "3.9"
>  PYTHON_ABI = ""
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_PN = "python3"
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> index 59592821d7..44354f44d4 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> @@ -1,4 +1,4 @@
> -From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001
> +From 2b122b1e664a91b14a8d8074d342439c1892700a Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 25 Jan 2019 19:04:13 +0100
>  Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 20d7f35..ab18ff0 100644
> +index 770866b..d3ccc6c 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):
> +@@ -1058,7 +1058,6 @@ class PyBuildExt(build_ext):
>                                                        'termcap'):
>                   readline_libs.append('termcap')
>               self.add(Extension('readline', ['readline.c'],
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> deleted file mode 100644
> index 112c979441..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> +++ /dev/null
> @@ -1,214 +0,0 @@
> -From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 5 Feb 2019 15:52:02 +0100
> -Subject: [PATCH] Do not hardcode "lib" as location for modules,
> site-packages
> - and lib-dynload
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - Include/pythonrun.h  |  2 ++
> - Lib/site.py          |  4 ++--
> - Makefile.pre.in      |  5 +++--
> - Modules/getpath.c    | 22 ++++++++++++++--------
> - Python/getplatform.c | 10 ++++++++++
> - Python/sysmodule.c   |  2 ++
> - 6 files changed, 33 insertions(+), 12 deletions(-)
> -
> -diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> -index 46091e0..61b2e15 100644
> ---- a/Include/pythonrun.h
> -+++ b/Include/pythonrun.h
> -@@ -7,6 +7,8 @@
> - extern "C" {
> - #endif
> -
> -+PyAPI_FUNC(const char *) Py_GetLib(void);
> -+
> - #ifndef Py_LIMITED_API
> - PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
> - PyAPI_FUNC(int) PyRun_AnyFileExFlags(
> -diff --git a/Lib/site.py b/Lib/site.py
> -index a065ab0..1d720ef 100644
> ---- a/Lib/site.py
> -+++ b/Lib/site.py
> -@@ -335,12 +335,12 @@ def getsitepackages(prefixes=None):
> -         seen.add(prefix)
> -
> -         if os.sep == '/':
> --            sitepackages.append(os.path.join(prefix, "lib",
> -+            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python%d.%d" %
> sys.version_info[:2],
> -                                         "site-packages"))
> -         else:
> -             sitepackages.append(prefix)
> --            sitepackages.append(os.path.join(prefix, "lib",
> "site-packages"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib,
> "site-packages"))
> -     return sitepackages
> -
> - def addsitepackages(known_paths, prefixes=None):
> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 65665df..be49140 100644
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -143,7 +143,7 @@ LIBDIR=            @libdir@
> - MANDIR=               @mandir@
> - INCLUDEDIR=   @includedir@
> - CONFINCLUDEDIR=       $(exec_prefix)/include
> --SCRIPTDIR=    $(prefix)/lib
> -+SCRIPTDIR=    @libdir@
> - ABIFLAGS=     @ABIFLAGS@
> -
> - # Detailed destination directories
> -@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c
> Makefile
> -               -DEXEC_PREFIX='"$(exec_prefix)"' \
> -               -DVERSION='"$(VERSION)"' \
> -               -DVPATH='"$(VPATH)"' \
> -+              -DLIB='"$(LIB)"' \
> -               -o $@ $(srcdir)/Modules/getpath.c
> -
> - Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h
> - Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o
> Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h
> $(srcdir)/Include/Python-ast.h
> -
> - Python/getplatform.o: $(srcdir)/Python/getplatform.c
> --              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@
> $(srcdir)/Python/getplatform.c
> -+              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"'
> -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
> -
> - Python/importdl.o: $(srcdir)/Python/importdl.c
> -               $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@
> $(srcdir)/Python/importdl.c
> -diff --git a/Modules/getpath.c b/Modules/getpath.c
> -index b727f66..c003e46 100644
> ---- a/Modules/getpath.c
> -+++ b/Modules/getpath.c
> -@@ -128,6 +128,7 @@ typedef struct {
> -     wchar_t *exec_prefix;              /* EXEC_PREFIX macro */
> -
> -     wchar_t *lib_python;               /* "lib/pythonX.Y" */
> -+    wchar_t *multilib_python;               /* "lib[suffix]/pythonX.Y" */
> -
> -     int prefix_found;         /* found platform independent libraries? */
> -     int exec_prefix_found;    /* found the platform dependent libraries?
> */
> -@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -         if (delim) {
> -             *delim = L'\0';
> -         }
> --        status = joinpath(prefix, calculate->lib_python, prefix_len);
> -+        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             return status;
> -         }
> -@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -     do {
> -         /* Path: <argv0_path or substring> / <lib_python> / LANDMARK */
> -         size_t n = wcslen(prefix);
> --        status = joinpath(prefix, calculate->lib_python, prefix_len);
> -+        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             return status;
> -         }
> -@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -     if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> -         return PATHLEN_ERR();
> -     }
> --    status = joinpath(prefix, calculate->lib_python, prefix_len);
> -+    status = joinpath(prefix, calculate->multilib_python, prefix_len);
> -     if (_PyStatus_EXCEPTION(status)) {
> -         return status;
> -     }
> -@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -         if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> -             return PATHLEN_ERR();
> -         }
> --        status = joinpath(prefix, calculate->lib_python, prefix_len);
> -+        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             return status;
> -         }
> -@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -                 return PATHLEN_ERR();
> -             }
> -         }
> --        status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> -+        status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             return status;
> -         }
> -@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -     do {
> -         /* Path: <argv0_path or substring> / <lib_python> /
> "lib-dynload" */
> -         size_t n = wcslen(exec_prefix);
> --        status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> -+        status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             return status;
> -         }
> -@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> -     if (safe_wcscpy(exec_prefix, calculate->exec_prefix,
> exec_prefix_len) < 0) {
> -         return PATHLEN_ERR();
> -     }
> --    status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> -+    status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> -     if (_PyStatus_EXCEPTION(status)) {
> -         return status;
> -     }
> -@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate,
> const wchar_t *program_full_pat
> -             return PATHLEN_ERR();
> -         }
> -         reduce(argv0_path);
> --        status = joinpath(argv0_path, calculate->lib_python,
> argv0_path_len);
> -+        status = joinpath(argv0_path, calculate->multilib_python,
> argv0_path_len);
> -         if (_PyStatus_EXCEPTION(status)) {
> -             PyMem_RawFree(wbuf);
> -             return status;
> -@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, const
> PyConfig *config)
> -     if (!calculate->lib_python) {
> -         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> -     }
> -+    calculate->multilib_python = Py_DecodeLocale(LIB "/python" VERSION,
> &len);
> -+    if (!calculate->multilib_python) {
> -+        return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> -+    }
> -
> -     calculate->warnings = config->pathconfig_warnings;
> -     calculate->pythonpath_env = config->pythonpath_env;
> -@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)
> -     PyMem_RawFree(calculate->prefix);
> -     PyMem_RawFree(calculate->exec_prefix);
> -     PyMem_RawFree(calculate->lib_python);
> -+    PyMem_RawFree(calculate->multilib_python);
> -     PyMem_RawFree(calculate->path_env);
> - }
> -
> -diff --git a/Python/getplatform.c b/Python/getplatform.c
> -index 81a0f7a..d55396b 100644
> ---- a/Python/getplatform.c
> -+++ b/Python/getplatform.c
> -@@ -10,3 +10,13 @@ Py_GetPlatform(void)
> - {
> -     return PLATFORM;
> - }
> -+
> -+#ifndef LIB
> -+#define LIB "lib"
> -+#endif
> -+
> -+const char *
> -+Py_GetLib(void)
> -+{
> -+      return LIB;
> -+}
> -diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> -index 5b0fb81..0dce754 100644
> ---- a/Python/sysmodule.c
> -+++ b/Python/sysmodule.c
> -@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime,
> PyInterpreterState *interp,
> -                         PyUnicode_FromString(Py_GetCopyright()));
> -     SET_SYS_FROM_STRING("platform",
> -                         PyUnicode_FromString(Py_GetPlatform()));
> -+    SET_SYS_FROM_STRING("lib",
> -+                        PyUnicode_FromString(Py_GetLib()));
> -     SET_SYS_FROM_STRING("maxsize",
> -                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
> -     SET_SYS_FROM_STRING("float_info",
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> index 83fd52d87f..7113ce2138 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -1,4 +1,4 @@
> -From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001
> +From 980fcf1a36bcb3ab26d4e82a304e205f02cb376f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 29 Jan 2019 15:03:01 +0100
>  Subject: [PATCH] Do not use the shell version of python-config that was
> @@ -9,15 +9,16 @@ outputs directories correctly.
>
>  Upstream-Status: Inappropriate [oe-specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 2d2e11f..cc19942 100644
> +index 77f91e7..5259754 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
> +@@ -1568,12 +1568,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
>         sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," <
> $(srcdir)/Misc/python-config.in >python-config.py
>         @ # Replace makefile compat. variable references with shell script
> compat. ones; $(VAR) -> ${VAR}
>         LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' <
> Misc/python-config.sh >python-config
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> index 3e471b9a49..95b4969c09 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> @@ -1,4 +1,4 @@
> -From b880e78bf4a1852e260188e6df3ec6034403d2fc Mon Sep 17 00:00:00 2001
> +From 9325b9705046d5ad4ade0482f0020a0ae5c56eaf Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Wed, 4 Mar 2020 00:06:42 +0000
>  Subject: [PATCH] Don't search system for headers/libraries
> @@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index 7208cd0..c0bd0ad 100644
> +index a456e53..af194ee 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
> +@@ -770,8 +770,8 @@ class PyBuildExt(build_ext):
>               add_dir_to_list(self.compiler.include_dirs,
>                               sysconfig.get_config_var("INCLUDEDIR"))
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
> index b97583682a..7aaa346c5d 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
> @@ -6,22 +6,26 @@ Subject: [PATCH] Lib/sysconfig.py: fix another place
> where 'lib' is hardcoded
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +Rebased for 3.9 [10/2020]
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro.hernandez@linux.microsoft.com>
> +
>  ---
>   Lib/sysconfig.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index d15cec8..87fa5e6 100644
> ---- a/Lib/sysconfig.py
> -+++ b/Lib/sysconfig.py
> +Index: Python-3.9.0/Lib/sysconfig.py
> +===================================================================
> +--- Python-3.9.0.orig/Lib/sysconfig.py
> ++++ Python-3.9.0/Lib/sysconfig.py
>  @@ -20,10 +20,10 @@ __all__ = [
>
>   _INSTALL_SCHEMES = {
>       'posix_prefix': {
> --        'stdlib': '{installed_base}/lib/python{py_version_short}',
> --        'platstdlib': '{platbase}/lib/python{py_version_short}',
> +-        'stdlib':
> '{installed_base}/{platlibdir}/python{py_version_short}',
> +-        'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
>  -        'purelib': '{base}/lib/python{py_version_short}/site-packages',
> --        'platlib':
> '{platbase}/lib/python{py_version_short}/site-packages',
> +-        'platlib':
> '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
>  +        'stdlib': '{LIBDEST}',
>  +        'platstdlib': '{LIBDEST}',
>  +        'purelib': '{LIBDEST}/site-packages',
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> index b1bceac512..fee0f45219 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> @@ -1,4 +1,4 @@
> -From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001
> +From 04b5cbff2126339417763f908c89eba076e60c4e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 16 Jan 2020 12:34:20 +0100
>  Subject: [PATCH] Makefile: do not compile .pyc in parallel
> @@ -11,15 +11,16 @@
> https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a4150
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 1241112..5dfdf44 100644
> +index 09763f5..59b95be 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1457,30 +1457,30 @@ libinstall:    build_all
> $(srcdir)/Modules/xxmodule.c
> +@@ -1529,30 +1529,30 @@ libinstall:    build_all
> $(srcdir)/Modules/xxmodule.c
>         fi
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>                 $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py
> \
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
> index 237645bc60..bdce71f1c4 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
> @@ -1,4 +1,4 @@
> -From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
> +From 8da4539c32ba0eb36aae65a5cbd0a71082764ca9 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 8 May 2019 16:10:29 +0800
>  Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
> @@ -12,15 +12,16 @@ exists in the libainstall target.
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186]
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   Makefile.pre.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 15f3687..7e9f173 100644
> +index a87fe82..09763f5 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1456,7 +1456,7 @@ LIBPL=           @LIBPL@
> +@@ -1618,7 +1618,7 @@ LIBPL=           @LIBPL@
>   LIBPC=                $(LIBDIR)/pkgconfig
>
>   libainstall:  @DEF_MAKE_RULE@ python-config
> @@ -29,6 +30,3 @@ index 15f3687..7e9f173 100644
>         do \
>                 if test ! -d $(DESTDIR)$$i; then \
>                         echo "Creating directory $$i"; \
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> index fa7735ff93..5eb356ac6c 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> @@ -1,19 +1,20 @@
> -From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001
> +From f1f29d96b3d270656feb85bcc00ca29c27d8b77f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 30 Jan 2019 12:41:04 +0100
>  Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile
> data
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index a3a02a7..d5503dd 100644
> +index 5259754..a87fe82 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -507,8 +507,7 @@ build_all_generate_profile:
> +@@ -519,8 +519,7 @@ build_all_generate_profile:
>         $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS_NODIST)
> $(PGO_PROF_GEN_FLAG)" LDFLAGS_NODIST="$(LDFLAGS_NODIST)
> $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
>
>   run_profile_task:
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> index 957839bf3e..5a49fff696 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> @@ -1,19 +1,20 @@
> -From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001
> +From 12d895a9a0c03dd872727434921118016176f561 Mon Sep 17 00:00:00 2001
>  From: Inada Naoki <songofacandy@gmail.com>
>  Date: Sat, 14 Jul 2018 00:46:11 +0900
>  Subject: [PATCH] Use FLAG_REF always for interned strings
>
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/8226]
>  Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +
>  ---
>   Python/marshal.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
>  diff --git a/Python/marshal.c b/Python/marshal.c
> -index 6d06266c6a..51db2e3b2e 100644
> +index c4538bd..2437160 100644
>  --- a/Python/marshal.c
>  +++ b/Python/marshal.c
> -@@ -275,9 +275,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
> +@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
>       if (p->version < 3 || p->hashtable == NULL)
>           return 0; /* not writing object references */
>
> @@ -28,8 +29,5 @@ index 6d06266c6a..51db2e3b2e 100644
>           return 0;
>  +    }
>
> -     entry = _Py_HASHTABLE_GET_ENTRY(p->hashtable, v);
> +     entry = _Py_hashtable_get_entry(p->hashtable, v);
>       if (entry != NULL) {
> ---
> -2.21.0
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> index c4fae09a5b..e8dc18277a 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -1,4 +1,4 @@
> -From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
> +From 405703bc48271d7280c0281897d0e6a9752bbccc Mon Sep 17 00:00:00 2001
>  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>  Date: Fri, 31 May 2019 15:34:34 +0200
>  Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> @@ -13,16 +13,16 @@ to do this in a more autoconf/autotools manner.
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
>  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>
> -%% original patch:
> 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +
>  ---
>   configure.ac | 175 +++++++--------------------------------------------
>   1 file changed, 21 insertions(+), 154 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index ede710e..bc81b0b 100644
> +index e491e24..784850b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -710,160 +710,27 @@ fi
> +@@ -722,160 +722,27 @@ fi
>   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
>   AC_SUBST(MULTIARCH)
>
> @@ -204,6 +204,3 @@ index ede710e..bc81b0b 100644
>
>   if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
>     if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> ---
> -2.24.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
> b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
> deleted file mode 100644
> index 123ce3a2dc..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From acce3d441e7eadadd2d3ce38654155dc43f1f607 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 7 Feb 2020 09:36:25 +0800
> -Subject: [PATCH] configure.ac: fix LIBPL
> -
> -Use LIBDIR rather than prefix/lib, so that it would work when lib64.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -Signed-off-by: Li Zhou <li.zhou@windriver.c>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index ce04258..915f475 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4532,9 +4532,9 @@ fi
> - dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
> - AC_SUBST(PY_ENABLE_SHARED)
> - if test x$PLATFORM_TRIPLET = x; then
> --  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> -+  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> - else
> --
> LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> -+
> LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> - fi
> - AC_SUBST(LIBPL)
> -
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> index 2b68c0acc2..d8a296236f 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -1,4 +1,4 @@
> -From bc59d49efff41051034d7fbf5d0c8505e4c3134b Mon Sep 17 00:00:00 2001
> +From 5e3b6807b59ad9dbae0727b75a0e603f474d6451 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 31 Jan 2019 16:46:30 +0100
>  Subject: [PATCH] distutils/sysconfig: append
> @@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   2 files changed, 4 insertions(+)
>
>  diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index b51629e..2df348c 100644
> +index 37feae5..4774e12 100644
>  --- a/Lib/distutils/sysconfig.py
>  +++ b/Lib/distutils/sysconfig.py
> -@@ -438,6 +438,8 @@ def _init_posix():
> +@@ -444,6 +444,8 @@ def _init_posix():
>           platform=sys.platform,
>           multiarch=getattr(sys.implementation, '_multiarch', ''),
>       ))
> @@ -28,10 +28,10 @@ index b51629e..2df348c 100644
>       build_time_vars = _temp.build_time_vars
>       global _config_vars
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index b2d790b..405273c 100644
> +index bf04ac5..010f9ef 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
> -@@ -419,6 +419,8 @@ def _init_posix(vars):
> +@@ -417,6 +417,8 @@ def _init_posix(vars):
>       """Initialize the module as appropriate for POSIX systems."""
>       # _sysconfigdata is generated at build time, see
> _generate_posix_vars()
>       name = _get_sysconfigdata_name()
> diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
> b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
> deleted file mode 100644
> index fe031b9983..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From bb711b53f10d32a90a27ccf4b0dc51e4a701d862 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 7 Feb 2020 09:42:09 +0800
> -Subject: [PATCH] python3: Do not hardcode "lib" for distutils
> -
> -Get the sys.lib from python3 itself and do not use
> -hardcoded value of 'lib' for distutils.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - Lib/distutils/command/install.py | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/Lib/distutils/command/install.py
> b/Lib/distutils/command/install.py
> -index c625c95..8e32f54 100644
> ---- a/Lib/distutils/command/install.py
> -+++ b/Lib/distutils/command/install.py
> -@@ -19,6 +19,8 @@ from site import USER_BASE
> - from site import USER_SITE
> - HAS_USER_SITE = True
> -
> -+libname = sys.lib
> -+
> - WINDOWS_SCHEME = {
> -     'purelib': '$base/Lib/site-packages',
> -     'platlib': '$base/Lib/site-packages',
> -@@ -29,8 +31,8 @@ WINDOWS_SCHEME = {
> -
> - INSTALL_SCHEMES = {
> -     'unix_prefix': {
> --        'purelib': '$base/lib/python$py_version_short/site-packages',
> --        'platlib': '$platbase/lib/python$py_version_short/site-packages',
> -+        'purelib': '$base/' + libname +
> '/python$py_version_short/site-packages',
> -+        'platlib': '$platbase/' + libname +
> '/python$py_version_short/site-packages',
> -         'headers':
> '$base/include/python$py_version_short$abiflags/$dist_name',
> -         'scripts': '$base/bin',
> -         'data'   : '$base',
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index fb10ca94b3..4c182d2f9e 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -1,4 +1,4 @@
> -From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001
> +From a1a529f61464a222ed0391e422a5824601178fc5 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 22 Oct 2018 15:19:51 +0800
>  Subject: [PATCH] python3: use cc_basename to replace CC for checking
> compiler
> @@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index a189d42..0f85486 100644
> +index d60f052..e491e24 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
> @@ -38,7 +38,7 @@ index a189d42..0f85486 100644
>
>   # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
>   rm -f pybuilddir.txt
> -@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)
> +@@ -689,7 +690,7 @@ AC_MSG_RESULT($with_cxx_main)
>   preset_cxx="$CXX"
>   if test -z "$CXX"
>   then
> @@ -47,7 +47,7 @@ index a189d42..0f85486 100644
>           gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
>           cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
>           clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++],
> [notfound]) ;;
> -@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir
> +@@ -975,7 +976,7 @@ rmdir CaseSensitiveTestDir
>
>   case $ac_sys_system in
>   hp*|HP*)
> @@ -56,7 +56,7 @@ index a189d42..0f85486 100644
>       cc|*/cc) CC="$CC -Ae";;
>       esac;;
>   esac
> -@@ -1335,7 +1336,7 @@ else
> +@@ -1366,7 +1367,7 @@ else
>   fi],
>   [AC_MSG_RESULT(no)])
>   if test "$Py_LTO" = 'true' ; then
> @@ -65,7 +65,7 @@ index a189d42..0f85486 100644
>       *clang*)
>         AC_SUBST(LLVM_AR)
>         AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> -@@ -1425,7 +1426,7 @@ then
> +@@ -1456,7 +1457,7 @@ then
>     fi
>   fi
>   LLVM_PROF_ERR=no
> @@ -74,7 +74,7 @@ index a189d42..0f85486 100644
>     *clang*)
>       # Any changes made here should be reflected in the GCC+Darwin case
> below
>       PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
> -@@ -1486,7 +1487,7 @@ esac
> +@@ -1517,7 +1518,7 @@ esac
>   # compiler and platform.  BASECFLAGS tweaks need to be made even if the
>   # user set OPT.
>
> @@ -83,7 +83,7 @@ index a189d42..0f85486 100644
>       *clang*)
>           cc_is_clang=1
>           ;;
> -@@ -1622,7 +1623,7 @@ yes)
> +@@ -1653,7 +1654,7 @@ yes)
>
>       # ICC doesn't recognize the option, but only emits a warning
>       ## XXX does it emit an unused result warning and can it be disabled?
> @@ -92,16 +92,16 @@ index a189d42..0f85486 100644
>       *icc*)
>       ac_cv_disable_unused_result_warning=no
>       ;;
> -@@ -1943,7 +1944,7 @@ yes)
> +@@ -1993,7 +1994,7 @@ yes)
> +     ;;
>   esac
>
> - # ICC needs -fp-model strict or floats behave badly
>  -case "$CC" in
>  +case "$cc_basename" in
>   *icc*)
> +     # ICC needs -fp-model strict or floats behave badly
>       CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
> -     ;;
> -@@ -2711,7 +2712,7 @@ then
> +@@ -2765,7 +2766,7 @@ then
>                 then
>                         LINKFORSHARED="-Wl,--export-dynamic"
>                 fi;;
> @@ -110,7 +110,7 @@ index a189d42..0f85486 100644
>                   *gcc*)
>                     if $CC -Xlinker --help 2>&1 | grep export-dynamic
> >/dev/null
>                     then
> -@@ -5362,7 +5363,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> +@@ -5507,7 +5508,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
>       # Some versions of gcc miscompile inline asm:
>       # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
>       # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
> diff --git
> a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> index ea0af02e72..7ca6753172 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> @@ -1,4 +1,4 @@
> -From 7019ba184b828ed7253750cf409fc5760ef90a54 Mon Sep 17 00:00:00 2001
> +From 1bf39bd881a73fd0b9564b46c9e5a126f8483b3d Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 9 Jan 2020 17:44:05 +0100
>  Subject: [PATCH] setup.py: pass missing libraries to Extension for
> @@ -50,15 +50,16 @@ Upstream-Status: Pending
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   setup.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index ec3f2a4..b0f1541 100644
> +index 8cf058c..9c1c33b 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):
> +@@ -1777,7 +1777,7 @@ class PyBuildExt(build_ext):
>                                      libraries=libs,
>
>  include_dirs=["Modules/_multiprocessing"]))
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> index 35b7e0c480..bd5f406708 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> @@ -1,4 +1,4 @@
> -From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
> +From b2d5ab7c71741bbf27ec4690243244a4de72cfc0 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Mon, 5 Aug 2019 15:57:39 +0800
>  Subject: [PATCH] test_locale.py: correct the test output format
> @@ -24,15 +24,16 @@ Before this patch:
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
>  ---
>   Lib/test/test_locale.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
> -index e2c2178..558d63c 100644
> +index 2863d20..2ed141c 100644
>  --- a/Lib/test/test_locale.py
>  +++ b/Lib/test/test_locale.py
> -@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
> +@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCase):
>               self.skipTest('test needs Turkish locale')
>           loc = locale.getlocale(locale.LC_CTYPE)
>           if verbose:
> @@ -41,6 +42,3 @@ index e2c2178..558d63c 100644
>           locale.setlocale(locale.LC_CTYPE, loc)
>           self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
>
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> index 4bd98f62fd..d0ff3219a6 100644
> ---
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> +++
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> @@ -1,4 +1,4 @@
> -From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
> +From 5d85a94fd0965aa26adf593b5f84948e9c502121 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 7 Oct 2019 13:22:14 +0200
>  Subject: [PATCH] setup.py: do not report missing dependencies for disabled
> @@ -11,20 +11,24 @@ build completeness checker which relies on the report.
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> +Rebased for 3.9 [10/2020]
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro.hernandez@linux.microsoft.com>
> +
>  ---
> - setup.py | 4 ++++
> - 1 file changed, 4 insertions(+)
> + setup.py | 5 +++++
> + 1 file changed, 5 insertions(+)
>
>  diff --git a/setup.py b/setup.py
> -index 7691258..ec3f2a4 100644
> +index ab9fb8e..8cf058c 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
> +@@ -495,6 +495,11 @@ class PyBuildExt(build_ext):
>                   print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
>                                                 longest, g))
>
>  +        # There is no need to report missing module dependencies,
>  +        # if the modules have been disabled in the first place.
> ++        sysconf_dis =
> sysconfig.get_config_var('MODDISABLED_NAMES').split()
>  +        self.missing = list(set(self.missing) - set(sysconf_dis))
>  +
>           if self.missing:
> diff --git
> a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> index e04a91605c..daa133e1e0 100644
> ---
> a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> +++
> b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> @@ -1,4 +1,4 @@
> -From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001
> +From 5e75ab6ff0e5714684d71a3e75d389cdc1c2e783 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Sun, 16 Feb 2020 17:50:25 +0100
>  Subject: [PATCH] configure.ac, setup.py: do not add a curses include
> path from
> @@ -11,16 +11,17 @@ as dnf failures).
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   configure.ac | 6 ------
>   setup.py     | 2 --
>   2 files changed, 8 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 915f475..c911011 100644
> +index 01ea772..7ee38f6 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -4828,12 +4828,6 @@ then
> +@@ -4977,12 +4977,6 @@ then
>     [Define if you have struct stat.st_mtimensec])
>   fi
>
> @@ -34,10 +35,10 @@ index 915f475..c911011 100644
>
>   # On Solaris, term.h requires curses.h
>  diff --git a/setup.py b/setup.py
> -index b0f1541..7208cd0 100644
> +index 9c1c33b..a456e53 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):
> +@@ -1075,8 +1075,6 @@ class PyBuildExt(build_ext):
>           panel_library = 'panel'
>           if curses_library == 'ncursesw':
>               curses_defines.append(('HAVE_NCURSESW', '1'))
> diff --git
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> index 820fb98ed8..bacdfba5ef 100644
> ---
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> +++
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -1,4 +1,4 @@
> -From 064187668fcbefdd39a8cde372bf651124c3e578 Mon Sep 17 00:00:00 2001
> +From a05f77261dbabea29d05c249bfc2d8632e550b6a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH] python3: Add target and native recipes
> @@ -6,6 +6,7 @@ Subject: [PATCH] python3: Add target and native recipes
>  Upstream-Status: Inappropriate [embedded specific]
>
>  02/2015 Rebased for Python 3.4.2
> +10/2020 Rebased for Python 3.9.0
>
>  # The proper prefix is inside our staging area.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> @@ -18,10 +19,10 @@ Upstream-Status: Inappropriate [embedded specific]
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
>  diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index 2df348c..4f8db84 100644
> +index 4774e12..5468239 100644
>  --- a/Lib/distutils/sysconfig.py
>  +++ b/Lib/distutils/sysconfig.py
> -@@ -96,7 +96,9 @@ def get_python_inc(plat_specific=0, prefix=None):
> +@@ -95,7 +95,9 @@ def get_python_inc(plat_specific=0, prefix=None):
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -32,7 +33,7 @@ index 2df348c..4f8db84 100644
>           prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
>       if os.name == "posix":
>           if python_build:
> -@@ -139,7 +141,13 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
> +@@ -138,7 +140,13 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -47,12 +48,12 @@ index 2df348c..4f8db84 100644
>           if standard_lib:
>               prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
>           else:
> -@@ -147,7 +155,7 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
> -
> -     if os.name == "posix":
> -         libpython = os.path.join(prefix,
> --                                 "lib", "python" + get_python_version())
> -+                                 lib_basename, "python" +
> get_python_version())
> -         if standard_lib:
> -             return libpython
> +@@ -151,7 +159,7 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
> +             libdir = sys.platlibdir
>           else:
> +             # Pure Python
> +-            libdir = "lib"
> ++            libdir = "lib_basename"
> +         libpython = os.path.join(prefix, libdir,
> +                                  "python" + get_python_version())
> +         if standard_lib:
> diff --git
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index 184540e794..4dfa639669 100644
> ---
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -1,4 +1,4 @@
> -From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001
> +From f0653707a6a310bd059fe4dc3146052bb38b5d83 Mon Sep 17 00:00:00 2001
>  From: Andrei Gherzan <andrei@gherzan.ro>
>  Date: Mon, 28 Jan 2019 15:57:54 +0000
>  Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is
> not yet
> @@ -15,10 +15,10 @@ Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index ab18ff0..7691258 100644
> +index d3ccc6c..ab9fb8e 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):
> +@@ -1811,8 +1811,8 @@ class PyBuildExt(build_ext):
>           self.detect_decimal()
>           self.detect_ctypes()
>           self.detect_multiprocessing()
> diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch
> b/meta/recipes-devtools/python/python3/cgi_py.patch
> index 6c4ba54320..493fdf0ab8 100644
> --- a/meta/recipes-devtools/python/python3/cgi_py.patch
> +++ b/meta/recipes-devtools/python/python3/cgi_py.patch
> @@ -1,4 +1,4 @@
> -From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001
> +From 5da956e20d53cfdb687b8b8c3c15cfe926961ada Mon Sep 17 00:00:00 2001
>  From: Mark Hatle <mark.hatle@windriver.com>
>  Date: Wed, 21 Sep 2011 20:55:33 -0500
>  Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
> @@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   1 file changed, 1 insertion(+), 10 deletions(-)
>
>  diff --git a/Lib/cgi.py b/Lib/cgi.py
> -index 8cf6687..094c7b4 100755
> +index 77ab703..3edaf60 100755
>  --- a/Lib/cgi.py
>  +++ b/Lib/cgi.py
>  @@ -1,13 +1,4 @@
> diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> index d789ab57d4..f4c3b93782 100644
> --- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> +++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> @@ -1,4 +1,8 @@
> -configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
> +From 9dabb16c327211b8fb9327d06d66c7ef6baea4b2 Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda <ricardo@ribalda.com>
> +Date: Tue, 18 Nov 2014 03:35:33 -0500
> +Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
> + PYTHON_FOR_BUILD
>
>  When building x86->x86 the system will try to execute .so and related
> items
>  from the default PYTHONPATH.  This will fail if the target CPU contains
> @@ -10,8 +14,13 @@ Upstream-Status: Inappropriate [OE-Core integration
> specific]
>  Credits-to: Mark Hatle <mark.hatle@windriver.com>
>  Credits-to: Jackie Huang <jackie.huang@windriver.com>
>  Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> +
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
>  diff --git a/configure.ac b/configure.ac
> -index 4ab19a6..7036a53 100644
> +index 784850b..01ea772 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -76,7 +76,7 @@ if test "$cross_compiling" = yes; then
> diff --git a/meta/recipes-devtools/python/python3/python-config.patch
> b/meta/recipes-devtools/python/python3/python-config.patch
> index c8a8f3d4aa..98b28bcbde 100644
> --- a/meta/recipes-devtools/python/python3/python-config.patch
> +++ b/meta/recipes-devtools/python/python3/python-config.patch
> @@ -1,4 +1,4 @@
> -From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001
> +From bf238a78ec90671789c6498bede99928cb7244e5 Mon Sep 17 00:00:00 2001
>  From: Tyler Hall <tylerwhall@gmail.com>
>  Date: Sun, 4 May 2014 20:06:43 -0400
>  Subject: [PATCH] python-config: Revert to using distutils.sysconfig
> @@ -21,7 +21,7 @@ Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/Misc/python-config.in b/Misc/python-config.in
> -index 727c4a8..c702829 100644
> +index ebd99da..13e57ae 100644
>  --- a/Misc/python-config.in
>  +++ b/Misc/python-config.in
>  @@ -6,7 +6,7 @@
> @@ -37,11 +37,11 @@ index 727c4a8..c702829 100644
>
>   for opt in opt_flags:
>       if opt == '--prefix':
> --        print(sysconfig.get_config_var('prefix'))
> +-        print(getvar('prefix'))
>  +        print(sysconfig.PREFIX)
>
>       elif opt == '--exec-prefix':
> --        print(sysconfig.get_config_var('exec_prefix'))
> +-        print(getvar('exec_prefix'))
>  +        print(sysconfig.EXEC_PREFIX)
>
>       elif opt in ('--includes', '--cflags'):
> diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb
> b/meta/recipes-devtools/python/python3_3.9.0.bb
> similarity index 95%
> rename from meta/recipes-devtools/python/python3_3.8.5.bb
> rename to meta/recipes-devtools/python/python3_3.9.0.bb
> index 2a3c52a116..bd1d40edce 100644
> --- a/meta/recipes-devtools/python/python3_3.8.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "The Python Programming Language"
>  HOMEPAGE = "http://www.python.org"
> -LICENSE = "PSFv2"
> +LICENSE = "PSFv2 & BSD-0-Clause"
>  SECTION = "devel/python"
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
>
>  SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://run-ptest \
> @@ -17,7 +17,6 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>
> file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
>             file://python-config.patch \
>
> file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
> -
>  file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
>
> file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
>
> file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
>
> file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
> @@ -29,19 +28,17 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>
> file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
>
> file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
>             file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
> -           file://0001-configure.ac-fix-LIBPL.patch \
> -           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
>
> file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
>             "
>
> +
>  SRC_URI_append_class-native = " \
>
> file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
>             "
>
> -SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
> -SRC_URI[sha256sum] =
> "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
> +SRC_URI[sha256sum] =
> "9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> @@ -52,7 +49,7 @@ CVE_PRODUCT = "python"
>  # This is not exploitable when glibc has CVE-2016-10739 fixed.
>  CVE_CHECK_WHITELIST += "CVE-2019-18348"
>
> -PYTHON_MAJMIN = "3.8"
> +PYTHON_MAJMIN = "3.9"
>
>  S = "${WORKDIR}/Python-${PV}"
>
> @@ -71,7 +68,7 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl
> sqlite3 zlib virtual/li
>  DEPENDS_append_class-target = " python3-native"
>  DEPENDS_append_class-nativesdk = " python3-native"
>
> -EXTRA_OECONF = " --without-ensurepip --enable-shared"
> +EXTRA_OECONF = " --without-ensurepip --enable-shared
> --with-platlibdir=${baselib}"
>  EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
>
>  export
> CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
> @@ -115,7 +112,6 @@ CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw
> -I${STAGING_INCDIR}/uuid"
>  EXTRA_OEMAKE = '\
>    STAGING_LIBDIR=${STAGING_LIBDIR} \
>    STAGING_INCDIR=${STAGING_INCDIR} \
> -  LIB=${baselib} \
>  '
>
>  do_compile_prepend_class-target() {
> @@ -179,7 +175,6 @@ py_package_preprocess () {
>                  -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>                  -e 's:${RECIPE_SYSROOT}::g' \
>                  -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
> \
>
>  ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
>                  ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000002b997405b27179fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Haha, you beat me to it by a few minutes :)</div><div=
><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?=
h=3Dakanavin/package-version-updates&amp;id=3D98049b60602b4bd3854e870e46705=
716e469277c">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/=
?h=3Dakanavin/package-version-updates&amp;id=3D98049b60602b4bd3854e870e4670=
5716e469277c</a></div><div><br></div><div>I have some additional fixes incl=
uded though, coming from autobuilder runs.</div><div><br></div><div>Alex<br=
></div><div><br></div><div><br></div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 24 Oct 2020 at =
23:22, Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alejandro@enedin=
o.org" target=3D"_blank">alejandro@enedino.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">AFAIC the upstream fix to use=
 --with-platlibdir can now replace the<br>
functinoality we put in place for multilib builds, this patch uses<br>
such config as well as removes some of the patches for that.<br>
<br>
- Fixes fuzz on patches<br>
- Rebased the rest to work on 3.9.0<br>
- License changedm, it now includes BSD Clause 0<br>
<br>
Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto=
:alejandro.hernandez@linux.microsoft.com" target=3D"_blank">alejandro.herna=
ndez@linux.microsoft.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...ib-termcap-to-linker-flags-to-avoid-.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...lib-as-location-for-site-packages-an.patch | 214 ----------------=
--<br>
=C2=A0...hell-version-of-python-config-that-w.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0...-search-system-for-headers-libraries.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...-fix-another-place-where-lib-is-hard.patch |=C2=A0 18 +-<br>
=C2=A0...file-do-not-compile-.pyc-in-parallel.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0...sue36464-parallel-build-race-problem.patch |=C2=A0 10 +-<br>
=C2=A0...-qemu-wrapper-when-gathering-profile.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0...FLAG_REF-always-for-interned-strings.patch |=C2=A0 12 +-<br>
=C2=A0...-detection-of-mips-architecture-for-.patch |=C2=A0 11 +-<br>
=C2=A0.../python3/0001-configure.ac-fix-LIBPL.patch |=C2=A0 35 ---<br>
=C2=A0...fig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 10 +-<br>
=C2=A0...n3-Do-not-hardcode-lib-for-distutils.patch |=C2=A0 43 ----<br>
=C2=A0...asename-to-replace-CC-for-checking-c.patch |=C2=A0 26 +--<br>
=C2=A0...ssing-libraries-to-Extension-for-mul.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0...le.py-correct-the-test-output-format.patch |=C2=A0 10 +-<br>
=C2=A0...report-missing-dependencies-for-disa.patch |=C2=A0 14 +-<br>
=C2=A0...up.py-do-not-add-a-curses-include-pa.patch |=C2=A0 11 +-<br>
=C2=A0...tutils-prefix-is-inside-staging-area.patch |=C2=A0 25 +-<br>
=C2=A0.../python3/avoid_warning_about_tkinter.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0.../python/python3/cgi_py.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../python/python3/crosspythonpath.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 13 +-<br>
=C2=A0.../python/python3/python-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A08 +-<br>
=C2=A0.../{<a href=3D"http://python3_3.8.5.bb" rel=3D"noreferrer" target=
=3D"_blank">python3_3.8.5.bb</a> =3D&gt; <a href=3D"http://python3_3.9.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.9.0.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 17 +-<br>
=C2=A025 files changed, 123 insertions(+), 406 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-=
hardcode-lib-as-location-for-site-packages-an.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-configu=
re.ac-fix-LIBPL.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-python3=
-Do-not-hardcode-lib-for-distutils.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.8.5=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.5.bb</a> =3D&gt; <a h=
ref=3D"http://python3_3.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3_3.9.0.bb</a>} (95%)<br>
<br>
diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.b=
bclass<br>
index 036d7140d9..f51f971fc5 100644<br>
--- a/meta/classes/python3-dir.bbclass<br>
+++ b/meta/classes/python3-dir.bbclass<br>
@@ -1,4 +1,4 @@<br>
-PYTHON_BASEVERSION =3D &quot;3.8&quot;<br>
+PYTHON_BASEVERSION =3D &quot;3.9&quot;<br>
=C2=A0PYTHON_ABI =3D &quot;&quot;<br>
=C2=A0PYTHON_DIR =3D &quot;python${PYTHON_BASEVERSION}&quot;<br>
=C2=A0PYTHON_PN =3D &quot;python3&quot;<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-=
termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch<br>
index 59592821d7..44354f44d4 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap=
-to-linker-flags-to-avoid-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap=
-to-linker-flags-to-avoid-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001<br=
>
+From 2b122b1e664a91b14a8d8074d342439c1892700a Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 25 Jan 2019 19:04:13 +0100<br>
=C2=A0Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoi=
d host<br>
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 20d7f35..ab18ff0 100644<br>
+index 770866b..d3ccc6c 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):<br>
+@@ -1058,7 +1058,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;termcap&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 readline_li=
bs.append(&#39;termcap&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(Extension(&#39;r=
eadline&#39;, [&#39;readline.c&#39;],<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib=
-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch<br>
deleted file mode 100644<br>
index 112c979441..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-loc=
ation-for-site-packages-an.patch<br>
+++ /dev/null<br>
@@ -1,214 +0,0 @@<br>
-From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 2001<br=
>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Tue, 5 Feb 2019 15:52:02 +0100<br>
-Subject: [PATCH] Do not hardcode &quot;lib&quot; as location for modules,=
 site-packages<br>
- and lib-dynload<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-<br>
----<br>
- Include/pythonrun.h=C2=A0 |=C2=A0 2 ++<br>
- Lib/site.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
- <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_blank">=
Makefile.pre.in</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
- Modules/getpath.c=C2=A0 =C2=A0 | 22 ++++++++++++++--------<br>
- Python/getplatform.c | 10 ++++++++++<br>
- Python/sysmodule.c=C2=A0 =C2=A0|=C2=A0 2 ++<br>
- 6 files changed, 33 insertions(+), 12 deletions(-)<br>
-<br>
-diff --git a/Include/pythonrun.h b/Include/pythonrun.h<br>
-index 46091e0..61b2e15 100644<br>
---- a/Include/pythonrun.h<br>
-+++ b/Include/pythonrun.h<br>
-@@ -7,6 +7,8 @@<br>
- extern &quot;C&quot; {<br>
- #endif<br>
- <br>
-+PyAPI_FUNC(const char *) Py_GetLib(void);<br>
-+<br>
- #ifndef Py_LIMITED_API<br>
- PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *)=
;<br>
- PyAPI_FUNC(int) PyRun_AnyFileExFlags(<br>
-diff --git a/Lib/site.py b/Lib/site.py<br>
-index a065ab0..1d720ef 100644<br>
---- a/Lib/site.py<br>
-+++ b/Lib/site.py<br>
-@@ -335,12 +335,12 @@ def getsitepackages(prefixes=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen.add(prefix)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.sep =3D=3D &#39;/&#39;:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.path.jo=
in(prefix, &quot;lib&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.path.jo=
in(prefix, sys.lib,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;python%d.%d&quot; % sys.version_info[:2],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;site-packages&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sitepackages.append(prefi=
x)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.path.jo=
in(prefix, &quot;lib&quot;, &quot;site-packages&quot;))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.path.jo=
in(prefix, sys.lib, &quot;site-packages&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0return sitepackages<br>
- <br>
- def addsitepackages(known_paths, prefixes=3DNone):<br>
-diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=
=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" rel=
=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 65665df..be49140 100644<br>
---- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a><br>
-+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a><br>
-@@ -143,7 +143,7 @@ LIBDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @l=
ibdir@<br>
- MANDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@mandir@=
<br>
- INCLUDEDIR=3D=C2=A0 =C2=A0@includedir@<br>
- CONFINCLUDEDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0$(exec_prefix)/include<br>
--SCRIPTDIR=3D=C2=A0 =C2=A0 $(prefix)/lib<br>
-+SCRIPTDIR=3D=C2=A0 =C2=A0 @libdir@<br>
- ABIFLAGS=3D=C2=A0 =C2=A0 =C2=A0@ABIFLAGS@<br>
- <br>
- # Detailed destination directories<br>
-@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefi=
le<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DEXEC_PREFIX=3D&#=
39;&quot;$(exec_prefix)&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DVERSION=3D&#39;&=
quot;$(VERSION)&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DVPATH=3D&#39;&qu=
ot;$(VPATH)&quot;&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLIB=3D&#39;&quot;$(LI=
B)&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o $@ $(srcdir)/Mo=
dules/getpath.c<br>
- <br>
- Programs/python.o: $(srcdir)/Programs/python.c<br>
-@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h<br>
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Pyt=
hon/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Incl=
ude/Python-ast.h<br>
- <br>
- Python/getplatform.o: $(srcdir)/Python/getplatform.c<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $(PY_CORE_CFLA=
GS) -DPLATFORM=3D&#39;&quot;$(MACHDEP)&quot;&#39; -o $@ $(srcdir)/Python/ge=
tplatform.c<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $(PY_CORE_CFLA=
GS) -DPLATFORM=3D&#39;&quot;$(MACHDEP)&quot;&#39; -DLIB=3D&#39;&quot;$(LIB)=
&quot;&#39; -o $@ $(srcdir)/Python/getplatform.c<br>
- <br>
- Python/importdl.o: $(srcdir)/Python/importdl.c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -c $(PY_CORE=
_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c<br>
-diff --git a/Modules/getpath.c b/Modules/getpath.c<br>
-index b727f66..c003e46 100644<br>
---- a/Modules/getpath.c<br>
-+++ b/Modules/getpath.c<br>
-@@ -128,6 +128,7 @@ typedef struct {<br>
-=C2=A0 =C2=A0 =C2=A0wchar_t *exec_prefix;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* EXEC_PREFIX macro */<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0wchar_t *lib_python;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* &quot;lib/pythonX.Y&quot; */<br>
-+=C2=A0 =C2=A0 wchar_t *multilib_python;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* &quot;lib[suffix]/pythonX.Y&quot; */<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0int prefix_found;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 found platform independent libraries? */<br>
-=C2=A0 =C2=A0 =C2=A0int exec_prefix_found;=C2=A0 =C2=A0 /* found the plat=
form dependent libraries? */<br>
-@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPath=
Config *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (delim) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*delim =3D L&#39;\0&#39;;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;li=
b_python, prefix_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;mu=
ltilib_python, prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPath=
Config *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Path: &lt;argv0_path or substring&gt=
; / &lt;lib_python&gt; / LANDMARK */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n =3D wcslen(prefix);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;li=
b_python, prefix_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;mu=
ltilib_python, prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPath=
Config *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(prefix, calculate-&gt;prefix, prefix_=
len) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;lib_python, pref=
ix_len);<br>
-+=C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;multilib_python,=
 prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate, _PyPathC=
onfig *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(prefix, calculate-&gt;p=
refix, prefix_len) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;li=
b_python, prefix_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;mu=
ltilib_python, prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _P=
yPathConfig *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATH=
LEN_ERR();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&=
gt;lib_python, exec_prefix_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&=
gt;multilib_python, exec_prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _P=
yPathConfig *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Path: &lt;argv0_path or substring&gt=
; / &lt;lib_python&gt; / &quot;lib-dynload&quot; */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n =3D wcslen(exec_prefix);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&=
gt;lib_python, exec_prefix_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&=
gt;multilib_python, exec_prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _P=
yPathConfig *pathconfig,<br>
-=C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(exec_prefix, calculate-&gt;exec_prefi=
x, exec_prefix_len) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&gt;lib_python,=
 exec_prefix_len);<br>
-+=C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&gt;multilib_py=
thon, exec_prefix_len);<br>
-=C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate, cons=
t wchar_t *program_full_pat<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reduce(argv0_path);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(argv0_path, calculate-&g=
t;lib_python, argv0_path_len);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(argv0_path, calculate-&g=
t;multilib_python, argv0_path_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PyMem_RawFree(wbuf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, const P=
yConfig *config)<br>
-=C2=A0 =C2=A0 =C2=A0if (!calculate-&gt;lib_python) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DECODE_LOCALE_ERR(&quot;EXEC_PRE=
FIX define&quot;, len);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 calculate-&gt;multilib_python =3D Py_DecodeLocale(LIB &quo=
t;/python&quot; VERSION, &amp;len);<br>
-+=C2=A0 =C2=A0 if (!calculate-&gt;multilib_python) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DECODE_LOCALE_ERR(&quot;EXEC_PREFIX d=
efine&quot;, len);<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0calculate-&gt;warnings =3D config-&gt;pathconfig_warn=
ings;<br>
-=C2=A0 =C2=A0 =C2=A0calculate-&gt;pythonpath_env =3D config-&gt;pythonpat=
h_env;<br>
-@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)<br>
-=C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;prefix);<br>
-=C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;exec_prefix);<br>
-=C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;lib_python);<br>
-+=C2=A0 =C2=A0 PyMem_RawFree(calculate-&gt;multilib_python);<br>
-=C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;path_env);<br>
- }<br>
- <br>
-diff --git a/Python/getplatform.c b/Python/getplatform.c<br>
-index 81a0f7a..d55396b 100644<br>
---- a/Python/getplatform.c<br>
-+++ b/Python/getplatform.c<br>
-@@ -10,3 +10,13 @@ Py_GetPlatform(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0return PLATFORM;<br>
- }<br>
-+<br>
-+#ifndef LIB<br>
-+#define LIB &quot;lib&quot;<br>
-+#endif<br>
-+<br>
-+const char *<br>
-+Py_GetLib(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 return LIB;<br>
-+}<br>
-diff --git a/Python/sysmodule.c b/Python/sysmodule.c<br>
-index 5b0fb81..0dce754 100644<br>
---- a/Python/sysmodule.c<br>
-+++ b/Python/sysmodule.c<br>
-@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime, PyInterpr=
eterState *interp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0PyUnicode_FromString(Py_GetCopyright()));<br>
-=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;platform&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0PyUnicode_FromString(Py_GetPlatform()));<br>
-+=C2=A0 =C2=A0 SET_SYS_FROM_STRING(&quot;lib&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 PyUnicode_FromString(Py_GetLib()));<br>
-=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;maxsize&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0PyLong_FromSsize_t(PY_SSIZE_T_MAX));<br>
-=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;float_info&quot;,<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shel=
l-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch<br>
index 83fd52d87f..7113ce2138 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versi=
on-of-python-config-that-w.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versi=
on-of-python-config-that-w.patch<br>
@@ -1,4 +1,4 @@<br>
-From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001<br=
>
+From 980fcf1a36bcb3ab26d4e82a304e205f02cb376f Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 29 Jan 2019 15:03:01 +0100<br>
=C2=A0Subject: [PATCH] Do not use the shell version of python-config that =
was<br>
@@ -9,15 +9,16 @@ outputs directories correctly.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a> | 9 +++------<br>
=C2=A0 1 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" t=
arget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" r=
el=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 2d2e11f..cc19942 100644<br>
+index 77f91e7..5259754 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
-@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://py=
thon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> M=
isc/python-config.sh<br>
+@@ -1568,12 +1568,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://py=
thon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> M=
isc/python-config.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s,@EXENAME@,$(BINDIR)/python$(LDV=
ERSION)$(EXE),&quot; &lt; $(srcdir)/Misc/<a href=3D"http://python-config.in=
" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> &gt;python-conf=
ig.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @ # Replace makefile compat. variable referenc=
es with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC sed -e &#39;s,\$$(\([A-Za-z0-9_]*\)=
),\$$\{\1\},g&#39; &lt; Misc/python-config.sh &gt;python-config<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system=
-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Do=
n-t-search-system-for-headers-libraries.patch<br>
index 3e471b9a49..95b4969c09 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-he=
aders-libraries.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-he=
aders-libraries.patch<br>
@@ -1,4 +1,4 @@<br>
-From b880e78bf4a1852e260188e6df3ec6034403d2fc Mon Sep 17 00:00:00 2001<br=
>
+From 9325b9705046d5ad4ade0482f0020a0ae5c56eaf Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com" targ=
et=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0Date: Wed, 4 Mar 2020 00:06:42 +0000<br>
=C2=A0Subject: [PATCH] Don&#39;t search system for headers/libraries<br>
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jp=
uhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 7208cd0..c0bd0ad 100644<br>
+index a456e53..af194ee 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):<br>
+@@ -770,8 +770,8 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dir_to_list(self.comp=
iler.include_dirs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconfig.get_config_var(&quot;INCLUDEDIR&=
quot;))<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fi=
x-another-place-where-lib-is-hard.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch<br>
index b97583682a..7aaa346c5d 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-anoth=
er-place-where-lib-is-hard.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-anoth=
er-place-where-lib-is-hard.patch<br>
@@ -6,22 +6,26 @@ Subject: [PATCH] Lib/sysconfig.py: fix another place whe=
re &#39;lib&#39; is hardcoded<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
+Rebased for 3.9 [10/2020]<br>
+Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailt=
o:alejandro.hernandez@linux.microsoft.com" target=3D"_blank">alejandro.hern=
andez@linux.microsoft.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/sysconfig.py | 8 ++++----<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index d15cec8..87fa5e6 100644<br>
---- a/Lib/sysconfig.py<br>
-+++ b/Lib/sysconfig.py<br>
+Index: Python-3.9.0/Lib/sysconfig.py<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- Python-3.9.0.orig/Lib/sysconfig.py<br>
++++ Python-3.9.0/Lib/sysconfig.py<br>
=C2=A0@@ -20,10 +20,10 @@ __all__ =3D [<br>
<br>
=C2=A0 _INSTALL_SCHEMES =3D {<br>
=C2=A0 =C2=A0 =C2=A0 &#39;posix_prefix&#39;: {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;stdlib&#39;: &#39;{installed_base}/lib/=
python{py_version_short}&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platstdlib&#39;: &#39;{platbase}/lib/py=
thon{py_version_short}&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;stdlib&#39;: &#39;{installed_base}/{pla=
tlibdir}/python{py_version_short}&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platstdlib&#39;: &#39;{platbase}/{platl=
ibdir}/python{py_version_short}&#39;,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;purelib&#39;: &#39;{base}/lib/pyth=
on{py_version_short}/site-packages&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platlib&#39;: &#39;{platbase}/lib/pytho=
n{py_version_short}/site-packages&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platlib&#39;: &#39;{platbase}/{platlibd=
ir}/python{py_version_short}/site-packages&#39;,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;stdlib&#39;: &#39;{LIBDEST}&#39;,<=
br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platstdlib&#39;: &#39;{LIBDEST}&#3=
9;,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;purelib&#39;: &#39;{LIBDEST}/site-=
packages&#39;,<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-com=
pile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Mak=
efile-do-not-compile-.pyc-in-parallel.patch<br>
index b1bceac512..fee0f45219 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.p=
yc-in-parallel.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.p=
yc-in-parallel.patch<br>
@@ -1,4 +1,4 @@<br>
-From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001<br=
>
+From 04b5cbff2126339417763f908c89eba076e60c4e Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 16 Jan 2020 12:34:20 +0100<br>
=C2=A0Subject: [PATCH] Makefile: do not compile .pyc in parallel<br>
@@ -11,15 +11,16 @@ <a href=3D"https://github.com/python/cpython/commit/1a=
2dd82f56bd813aacc570e172cefe55a8a4150" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a=
8a4150</a><br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a> | 12 ++++++------<br>
=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" t=
arget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" r=
el=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 1241112..5dfdf44 100644<br>
+index 09763f5..59b95be 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
-@@ -1457,30 +1457,30 @@ libinstall:=C2=A0 =C2=A0 build_all $(srcdir)/Modu=
les/xxmodule.c<br>
+@@ -1529,30 +1529,30 @@ libinstall:=C2=A0 =C2=A0 build_all $(srcdir)/Modu=
les/xxmodule.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)=C2=A0 $(RUN=
SHARED) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD=
) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue3=
6464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch<br>
index 237645bc60..bdce71f1c4 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-pa=
rallel-build-race-problem.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-pa=
rallel-build-race-problem.patch<br>
@@ -1,4 +1,4 @@<br>
-From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001<br=
>
+From 8da4539c32ba0eb36aae65a5cbd0a71082764ca9 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 8 May 2019 16:10:29 +0800<br>
=C2=A0Subject: [PATCH] Makefile: fix Issue36464 (parallel build race probl=
em)<br>
@@ -12,15 +12,16 @@ exists in the libainstall target.<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpy=
thon/pull/13186" rel=3D"noreferrer" target=3D"_blank">https://github.com/py=
thon/cpython/pull/13186</a>]<br>
<br>
=C2=A0Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" t=
arget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" r=
el=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 15f3687..7e9f173 100644<br>
+index a87fe82..09763f5 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
-@@ -1456,7 +1456,7 @@ LIBPL=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@L=
IBPL@<br>
+@@ -1618,7 +1618,7 @@ LIBPL=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@L=
IBPL@<br>
=C2=A0 LIBPC=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(L=
IBDIR)/pkgconfig<br>
<br>
=C2=A0 libainstall:=C2=A0 @DEF_MAKE_RULE@ python-config<br>
@@ -29,6 +30,3 @@ index 15f3687..7e9f173 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test ! -d $(DES=
TDIR)$$i; then \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;Creating directory $$i&quot;; \<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qe=
mu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch<br>
index fa7735ff93..5eb356ac6c 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrap=
per-when-gathering-profile.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrap=
per-when-gathering-profile.patch<br>
@@ -1,19 +1,20 @@<br>
-From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001<br=
>
+From f1f29d96b3d270656feb85bcc00ca29c27d8b77f Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 30 Jan 2019 12:41:04 +0100<br>
=C2=A0Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profi=
le data<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a> | 3 +--<br>
=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" t=
arget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" r=
el=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index a3a02a7..d5503dd 100644<br>
+index 5259754..a87fe82 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a><br>
-@@ -507,8 +507,7 @@ build_all_generate_profile:<br>
+@@ -519,8 +519,7 @@ build_all_generate_profile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;=
$(CFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)&quot; LDFLAGS_NODIST=3D&quot;$(LDFLAG=
S_NODIST) $(PGO_PROF_GEN_FLAG)&quot; LIBS=3D&quot;$(LIBS)&quot;<br>
<br>
=C2=A0 run_profile_task:<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always=
-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use=
-FLAG_REF-always-for-interned-strings.patch<br>
index 957839bf3e..5a49fff696 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-in=
terned-strings.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-in=
terned-strings.patch<br>
@@ -1,19 +1,20 @@<br>
-From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001<br=
>
+From 12d895a9a0c03dd872727434921118016176f561 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Inada Naoki &lt;<a href=3D"mailto:songofacandy@gmail.com" targ=
et=3D"_blank">songofacandy@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 14 Jul 2018 00:46:11 +0900<br>
=C2=A0Subject: [PATCH] Use FLAG_REF always for interned strings<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpy=
thon/pull/8226" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyt=
hon/cpython/pull/8226</a>]<br>
=C2=A0Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.co=
m" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Python/marshal.c | 9 +++++++--<br>
=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/Python/marshal.c b/Python/marshal.c<br>
-index 6d06266c6a..51db2e3b2e 100644<br>
+index c4538bd..2437160 100644<br>
=C2=A0--- a/Python/marshal.c<br>
=C2=A0+++ b/Python/marshal.c<br>
-@@ -275,9 +275,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)<br>
+@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)<br>
=C2=A0 =C2=A0 =C2=A0 if (p-&gt;version &lt; 3 || p-&gt;hashtable =3D=3D NU=
LL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* not writing object referen=
ces */<br>
<br>
@@ -28,8 +29,5 @@ index 6d06266c6a..51db2e3b2e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0entry =3D _Py_HASHTABLE_GET_ENTRY(p-&gt;hashtable, v)=
;<br>
+=C2=A0 =C2=A0 =C2=A0entry =3D _Py_hashtable_get_entry(p-&gt;hashtable, v)=
;<br>
=C2=A0 =C2=A0 =C2=A0 if (entry !=3D NULL) {<br>
--- <br>
-2.21.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-de=
tection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/pyth=
on3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch<br>
index c4fae09a5b..e8dc18277a 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection=
-of-mips-architecture-for-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection=
-of-mips-architecture-for-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001<br=
>
+From 405703bc48271d7280c0281897d0e6a9752bbccc Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
=C2=A0Date: Fri, 31 May 2019 15:34:34 +0200<br>
=C2=A0Subject: [PATCH] bpo-36852: proper detection of mips architecture fo=
r soft<br>
@@ -13,16 +13,16 @@ to do this in a more autoconf/autotools manner.<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpy=
thon/pull/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/py=
thon/cpython/pull/13196</a>]<br>
=C2=A0Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.sch=
oepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br=
>
<br>
-%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-f=
or-.patch<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 175 +++++++-------------------------------------------=
-<br>
=C2=A0 1 file changed, 21 insertions(+), 154 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index ede710e..bc81b0b 100644<br>
+index e491e24..784850b 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
-@@ -710,160 +710,27 @@ fi<br>
+@@ -722,160 +722,27 @@ fi<br>
=C2=A0 MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null)<br>
=C2=A0 AC_SUBST(MULTIARCH)<br>
<br>
@@ -204,6 +204,3 @@ index ede710e..bc81b0b 100644<br>
<br>
=C2=A0 if test x$PLATFORM_TRIPLET !=3D x &amp;&amp; test x$MULTIARCH !=3D =
x; then<br>
=C2=A0 =C2=A0 if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then<br>
--- <br>
-2.24.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LI=
BPL.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBP=
L.patch<br>
deleted file mode 100644<br>
index 123ce3a2dc..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.pat=
ch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From acce3d441e7eadadd2d3ce38654155dc43f1f607 Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Fri, 7 Feb 2020 09:36:25 +0800<br>
-Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: fix LIBPL<br>
-<br>
-Use LIBDIR rather than prefix/lib, so that it would work when lib64.<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-<br>
-Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.co=
m" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-Signed-off-by: Li Zhou &lt;li.zhou@windriver.c&gt;<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
-index ce04258..915f475 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
-@@ -4532,9 +4532,9 @@ fi<br>
- dnl define LIBPL after ABIFLAGS and LDVERSION is defined.<br>
- AC_SUBST(PY_ENABLE_SHARED)<br>
- if test x$PLATFORM_TRIPLET =3D x; then<br>
--=C2=A0 LIBPL=3D&#39;$(prefix)&#39;&quot;/lib/python${VERSION}/config-${L=
DVERSION}&quot;<br>
-+=C2=A0 LIBPL=3D&#39;$(LIBDIR)&#39;&quot;/python${VERSION}/config-${LDVER=
SION}&quot;<br>
- else<br>
--=C2=A0 LIBPL=3D&#39;$(prefix)&#39;&quot;/lib/python${VERSION}/config-${L=
DVERSION}-${PLATFORM_TRIPLET}&quot;<br>
-+=C2=A0 LIBPL=3D&#39;$(LIBDIR)&#39;&quot;/python${VERSION}/config-${LDVER=
SION}-${PLATFORM_TRIPLET}&quot;<br>
- fi<br>
- AC_SUBST(LIBPL)<br>
-<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig=
-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/pyth=
on3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch<br>
index 2b68c0acc2..d8a296236f 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append=
-STAGING_LIBDIR-python-sys.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append=
-STAGING_LIBDIR-python-sys.patch<br>
@@ -1,4 +1,4 @@<br>
-From bc59d49efff41051034d7fbf5d0c8505e4c3134b Mon Sep 17 00:00:00 2001<br=
>
+From 5e3b6807b59ad9dbae0727b75a0e603f474d6451 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 31 Jan 2019 16:46:30 +0100<br>
=C2=A0Subject: [PATCH] distutils/sysconfig: append<br>
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
=C2=A0 2 files changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py=
<br>
-index b51629e..2df348c 100644<br>
+index 37feae5..4774e12 100644<br>
=C2=A0--- a/Lib/distutils/sysconfig.py<br>
=C2=A0+++ b/Lib/distutils/sysconfig.py<br>
-@@ -438,6 +438,8 @@ def _init_posix():<br>
+@@ -444,6 +444,8 @@ def _init_posix():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform=3Dsys.platform,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 multiarch=3Dgetattr(sys.implementation,=
 &#39;_multiarch&#39;, &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 ))<br>
@@ -28,10 +28,10 @@ index b51629e..2df348c 100644<br>
=C2=A0 =C2=A0 =C2=A0 build_time_vars =3D _temp.build_time_vars<br>
=C2=A0 =C2=A0 =C2=A0 global _config_vars<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index b2d790b..405273c 100644<br>
+index bf04ac5..010f9ef 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
-@@ -419,6 +419,8 @@ def _init_posix(vars):<br>
+@@ -417,6 +417,8 @@ def _init_posix(vars):<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Initialize the module as appropriat=
e for POSIX systems.&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 # _sysconfigdata is generated at build time, see _gen=
erate_posix_vars()<br>
=C2=A0 =C2=A0 =C2=A0 name =3D _get_sysconfigdata_name()<br>
diff --git a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hard=
code-lib-for-distutils.patch b/meta/recipes-devtools/python/python3/0001-py=
thon3-Do-not-hardcode-lib-for-distutils.patch<br>
deleted file mode 100644<br>
index fe031b9983..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-li=
b-for-distutils.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From bb711b53f10d32a90a27ccf4b0dc51e4a701d862 Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Fri, 7 Feb 2020 09:42:09 +0800<br>
-Subject: [PATCH] python3: Do not hardcode &quot;lib&quot; for distutils<b=
r>
-<br>
-Get the sys.lib from python3 itself and do not use<br>
-hardcoded value of &#39;lib&#39; for distutils.<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-<br>
-Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" targe=
t=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- Lib/distutils/command/install.py | 6 ++++--<br>
- 1 file changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/ins=
tall.py<br>
-index c625c95..8e32f54 100644<br>
---- a/Lib/distutils/command/install.py<br>
-+++ b/Lib/distutils/command/install.py<br>
-@@ -19,6 +19,8 @@ from site import USER_BASE<br>
- from site import USER_SITE<br>
- HAS_USER_SITE =3D True<br>
-<br>
-+libname =3D sys.lib<br>
-+<br>
- WINDOWS_SCHEME =3D {<br>
-=C2=A0 =C2=A0 =C2=A0&#39;purelib&#39;: &#39;$base/Lib/site-packages&#39;,=
<br>
-=C2=A0 =C2=A0 =C2=A0&#39;platlib&#39;: &#39;$base/Lib/site-packages&#39;,=
<br>
-@@ -29,8 +31,8 @@ WINDOWS_SCHEME =3D {<br>
-<br>
- INSTALL_SCHEMES =3D {<br>
-=C2=A0 =C2=A0 =C2=A0&#39;unix_prefix&#39;: {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;purelib&#39;: &#39;$base/lib/python$py_=
version_short/site-packages&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platlib&#39;: &#39;$platbase/lib/python=
$py_version_short/site-packages&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;purelib&#39;: &#39;$base/&#39; + libnam=
e + &#39;/python$py_version_short/site-packages&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platlib&#39;: &#39;$platbase/&#39; + li=
bname + &#39;/python$py_version_short/site-packages&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;headers&#39;: &#39;$base/include/p=
ython$py_version_short$abiflags/$dist_name&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;scripts&#39;: &#39;$base/bin&#39;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;data&#39;=C2=A0 =C2=A0: &#39;$base=
&#39;,<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_base=
name-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/pyth=
on3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch<br>
index fb10ca94b3..4c182d2f9e 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to=
-replace-CC-for-checking-c.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to=
-replace-CC-for-checking-c.patch<br>
@@ -1,4 +1,4 @@<br>
-From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001<br=
>
+From a1a529f61464a222ed0391e422a5824601178fc5 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Oct 2018 15:19:51 +0800<br>
=C2=A0Subject: [PATCH] python3: use cc_basename to replace CC for checking=
 compiler<br>
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changq=
ing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<=
br>
=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index a189d42..0f85486 100644<br>
+index d60f052..e491e24 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0@@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)<br>
@@ -38,7 +38,7 @@ index a189d42..0f85486 100644<br>
<br>
=C2=A0 # pybuilddir.txt will be created by --generate-posix-vars in the Ma=
kefile<br>
=C2=A0 rm -f pybuilddir.txt<br>
-@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
+@@ -689,7 +690,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
=C2=A0 preset_cxx=3D&quot;$CXX&quot;<br>
=C2=A0 if test -z &quot;$CXX&quot;<br>
=C2=A0 then<br>
@@ -47,7 +47,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc)=C2=A0 =C2=A0 AC_PATH_TOOL(CXX, [g+=
+], [g++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc)=C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(CXX=
, [c++], [c++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clang|*/clang)=C2=A0 =C2=A0 =C2=A0AC_PA=
TH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;<br>
-@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir<br>
+@@ -975,7 +976,7 @@ rmdir CaseSensitiveTestDir<br>
<br>
=C2=A0 case $ac_sys_system in<br>
=C2=A0 hp*|HP*)<br>
@@ -56,7 +56,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 cc|*/cc) CC=3D&quot;$CC -Ae&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0 esac;;<br>
=C2=A0 esac<br>
-@@ -1335,7 +1336,7 @@ else<br>
+@@ -1366,7 +1367,7 @@ else<br>
=C2=A0 fi],<br>
=C2=A0 [AC_MSG_RESULT(no)])<br>
=C2=A0 if test &quot;$Py_LTO&quot; =3D &#39;true&#39; ; then<br>
@@ -65,7 +65,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(LLVM_AR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_TOOL(LLVM_AR, llvm-ar, &#39;&#39;, ${l=
lvm_path})<br>
-@@ -1425,7 +1426,7 @@ then<br>
+@@ -1456,7 +1457,7 @@ then<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 fi<br>
=C2=A0 LLVM_PROF_ERR=3Dno<br>
@@ -74,7 +74,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 # Any changes made here should be reflected in the GC=
C+Darwin case below<br>
=C2=A0 =C2=A0 =C2=A0 PGO_PROF_GEN_FLAG=3D&quot;-fprofile-instr-generate&qu=
ot;<br>
-@@ -1486,7 +1487,7 @@ esac<br>
+@@ -1517,7 +1518,7 @@ esac<br>
=C2=A0 # compiler and platform.=C2=A0 BASECFLAGS tweaks need to be made ev=
en if the<br>
=C2=A0 # user set OPT.<br>
<br>
@@ -83,7 +83,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc_is_clang=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-@@ -1622,7 +1623,7 @@ yes)<br>
+@@ -1653,7 +1654,7 @@ yes)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 # ICC doesn&#39;t recognize the option, but only emit=
s a warning<br>
=C2=A0 =C2=A0 =C2=A0 ## XXX does it emit an unused result warning and can =
it be disabled?<br>
@@ -92,16 +92,16 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 *icc*)<br>
=C2=A0 =C2=A0 =C2=A0 ac_cv_disable_unused_result_warning=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
-@@ -1943,7 +1944,7 @@ yes)<br>
+@@ -1993,7 +1994,7 @@ yes)<br>
+=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 esac<br>
<br>
- # ICC needs -fp-model strict or floats behave badly<br>
=C2=A0-case &quot;$CC&quot; in<br>
=C2=A0+case &quot;$cc_basename&quot; in<br>
=C2=A0 *icc*)<br>
+=C2=A0 =C2=A0 =C2=A0# ICC needs -fp-model strict or floats behave badly<b=
r>
=C2=A0 =C2=A0 =C2=A0 CFLAGS_NODIST=3D&quot;$CFLAGS_NODIST -fp-model strict=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0;;<br>
-@@ -2711,7 +2712,7 @@ then<br>
+@@ -2765,7 +2766,7 @@ then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LINKFORSHARED=3D&quot;-Wl,--export-dynamic&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi;;<br>
@@ -110,7 +110,7 @@ index a189d42..0f85486 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *gcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $=
CC -Xlinker --help 2&gt;&amp;1 | grep export-dynamic &gt;/dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then=
<br>
-@@ -5362,7 +5363,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D yes; =
then<br>
+@@ -5507,7 +5508,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D yes; =
then<br>
=C2=A0 =C2=A0 =C2=A0 # Some versions of gcc miscompile inline asm:<br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D46491" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/bugzil=
la/show_bug.cgi?id=3D46491</a><br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/ml/gcc/2010-11/msg003=
66.html" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/ml/gcc/201=
0-11/msg00366.html</a><br>
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missi=
ng-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/pyth=
on3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch<br>
index ea0af02e72..7ca6753172 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libr=
aries-to-Extension-for-mul.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libr=
aries-to-Extension-for-mul.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7019ba184b828ed7253750cf409fc5760ef90a54 Mon Sep 17 00:00:00 2001<br=
>
+From 1bf39bd881a73fd0b9564b46c9e5a126f8483b3d Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 9 Jan 2020 17:44:05 +0100<br>
=C2=A0Subject: [PATCH] setup.py: pass missing libraries to Extension for<b=
r>
@@ -50,15 +50,16 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver=
.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 setup.py | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index ec3f2a4..b0f1541 100644<br>
+index 8cf058c..9c1c33b 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):<br>
+@@ -1777,7 +1777,7 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries=3Dlib=
s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_dirs=3D=
[&quot;Modules/_multiprocessing&quot;]))<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corr=
ect-the-test-output-format.patch b/meta/recipes-devtools/python/python3/000=
1-test_locale.py-correct-the-test-output-format.patch<br>
index 35b7e0c480..bd5f406708 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the=
-test-output-format.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the=
-test-output-format.patch<br>
@@ -1,4 +1,4 @@<br>
-From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001<br=
>
+From b2d5ab7c71741bbf27ec4690243244a4de72cfc0 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" targe=
t=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 5 Aug 2019 15:57:39 +0800<br>
=C2=A0Subject: [PATCH] test_locale.py: correct the test output format<br>
@@ -24,15 +24,16 @@ Before this patch:<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpy=
thon/pull/15132" rel=3D"noreferrer" target=3D"_blank">https://github.com/py=
thon/cpython/pull/15132</a>]<br>
<br>
=C2=A0Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.c=
om" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/test/test_locale.py | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py<br>
-index e2c2178..558d63c 100644<br>
+index 2863d20..2ed141c 100644<br>
=C2=A0--- a/Lib/test/test_locale.py<br>
=C2=A0+++ b/Lib/test/test_locale.py<br>
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):<br>
+@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;test n=
eeds Turkish locale&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loc =3D locale.getlocale(locale.LC_CTYP=
E)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if verbose:<br>
@@ -41,6 +42,3 @@ index e2c2178..558d63c 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale.setlocale(locale.LC_CTYPE, loc)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(loc, locale.getlocale(=
locale.LC_CTYPE))<br>
<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-rep=
ort-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/pyth=
on3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch<br>
index 4bd98f62fd..d0ff3219a6 100644<br>
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-mis=
sing-dependencies-for-disa.patch<br>
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-mis=
sing-dependencies-for-disa.patch<br>
@@ -1,4 +1,4 @@<br>
-From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001<br=
>
+From 5d85a94fd0965aa26adf593b5f84948e9c502121 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 7 Oct 2019 13:22:14 +0200<br>
=C2=A0Subject: [PATCH] setup.py: do not report missing dependencies for di=
sabled<br>
@@ -11,20 +11,24 @@ build completeness checker which relies on the report.=
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
+Rebased for 3.9 [10/2020]<br>
+Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailt=
o:alejandro.hernandez@linux.microsoft.com" target=3D"_blank">alejandro.hern=
andez@linux.microsoft.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- setup.py | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
+ setup.py | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 7691258..ec3f2a4 100644<br>
+index ab9fb8e..8cf058c 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):<br>
+@@ -495,6 +495,11 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot=
;%-*s=C2=A0 =C2=A0%-*s=C2=A0 =C2=A0%-*s&quot; % (longest, e, longest, f,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 longest, g))<br>
<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # There is no need to report missing mo=
dule dependencies,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the modules have been disabled in =
the first place.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconf_dis =3D sysconfig.get_config_var(&#3=
9;MODDISABLED_NAMES&#39;).split()<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing =3D list(set(self.missing)=
 - set(sysconf_dis))<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.missing:<br>
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.=
py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/pyth=
on3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch<br>
index e04a91605c..daa133e1e0 100644<br>
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-n=
ot-add-a-curses-include-pa.patch<br>
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-n=
ot-add-a-curses-include-pa.patch<br>
@@ -1,4 +1,4 @@<br>
-From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001<br=
>
+From 5e75ab6ff0e5714684d71a3e75d389cdc1c2e783 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 16 Feb 2020 17:50:25 +0100<br>
=C2=A0Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a>, setup.py: do not add a curses include p=
ath from<br>
@@ -11,16 +11,17 @@ as dnf failures).<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 6 ------<br>
=C2=A0 setup.py=C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0 2 files changed, 8 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index 915f475..c911011 100644<br>
+index 01ea772..7ee38f6 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
-@@ -4828,12 +4828,6 @@ then<br>
+@@ -4977,12 +4977,6 @@ then<br>
=C2=A0 =C2=A0 [Define if you have struct stat.st_mtimensec])<br>
=C2=A0 fi<br>
<br>
@@ -34,10 +35,10 @@ index 915f475..c911011 100644<br>
<br>
=C2=A0 # On Solaris, term.h requires curses.h<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index b0f1541..7208cd0 100644<br>
+index 9c1c33b..a456e53 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):<br>
+@@ -1075,8 +1075,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_library =3D &#39;panel&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if curses_library =3D=3D &#39;ncursesw&=
#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_defines.append((&#=
39;HAVE_NCURSESW&#39;, &#39;1&#39;))<br>
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-i=
nside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutil=
s-prefix-is-inside-staging-area.patch<br>
index 820fb98ed8..bacdfba5ef 100644<br>
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-s=
taging-area.patch<br>
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-s=
taging-area.patch<br>
@@ -1,4 +1,4 @@<br>
-From 064187668fcbefdd39a8cde372bf651124c3e578 Mon Sep 17 00:00:00 2001<br=
>
+From a05f77261dbabea29d05c249bfc2d8632e550b6a Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 14 May 2013 15:00:26 -0700<br>
=C2=A0Subject: [PATCH] python3: Add target and native recipes<br>
@@ -6,6 +6,7 @@ Subject: [PATCH] python3: Add target and native recipes<br=
>
=C2=A0Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A002/2015 Rebased for Python 3.4.2<br>
+10/2020 Rebased for Python 3.9.0<br>
<br>
=C2=A0# The proper prefix is inside our staging area.<br>
=C2=A0# Signed-Off: Michael &#39;Mickey&#39; Lauer &lt;<a href=3D"mailto:m=
ickey@vanille-media.de" target=3D"_blank">mickey@vanille-media.de</a>&gt;<b=
r>
@@ -18,10 +19,10 @@ Upstream-Status: Inappropriate [embedded specific]<br>
=C2=A0 1 file changed, 11 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py=
<br>
-index 2df348c..4f8db84 100644<br>
+index 4774e12..5468239 100644<br>
=C2=A0--- a/Lib/distutils/sysconfig.py<br>
=C2=A0+++ b/Lib/distutils/sysconfig.py<br>
-@@ -96,7 +96,9 @@ def get_python_inc(plat_specific=3D0, prefix=3DNone):<b=
r>
+@@ -95,7 +95,9 @@ def get_python_inc(plat_specific=3D0, prefix=3DNone):<b=
r>
=C2=A0 =C2=A0 =C2=A0 If &#39;prefix&#39; is supplied, use it instead of sy=
s.base_prefix or<br>
=C2=A0 =C2=A0 =C2=A0 sys.base_exec_prefix -- i.e., ignore &#39;plat_specif=
ic&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
@@ -32,7 +33,7 @@ index 2df348c..4f8db84 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D plat_specific and BASE_EXEC_=
PREFIX or BASE_PREFIX<br>
=C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://os.name" rel=3D"noreferrer" targ=
et=3D"_blank">os.name</a> =3D=3D &quot;posix&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if python_build:<br>
-@@ -139,7 +141,13 @@ def get_python_lib(plat_specific=3D0, standard_lib=
=3D0, prefix=3DNone):<br>
+@@ -138,7 +140,13 @@ def get_python_lib(plat_specific=3D0, standard_lib=
=3D0, prefix=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 If &#39;prefix&#39; is supplied, use it instead of sy=
s.base_prefix or<br>
=C2=A0 =C2=A0 =C2=A0 sys.base_exec_prefix -- i.e., ignore &#39;plat_specif=
ic&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
@@ -47,12 +48,12 @@ index 2df348c..4f8db84 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if standard_lib:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D plat_specific =
and BASE_EXEC_PREFIX or BASE_PREFIX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-@@ -147,7 +155,7 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D=
0, prefix=3DNone):<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if <a href=3D"http://os.name" rel=3D"noreferrer" targ=
et=3D"_blank">os.name</a> =3D=3D &quot;posix&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpython =3D os.path.join(prefix,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;lib&quot;, &quot;pyt=
hon&quot; + get_python_version())<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lib_basename, &quot;python=
&quot; + get_python_version())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if standard_lib:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return libpython<br>
+@@ -151,7 +159,7 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D=
0, prefix=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdir =3D sys.platlibdir=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Pure Python<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir =3D &quot;lib&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir =3D &quot;lib_basename&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpython =3D os.path.join(prefix, libd=
ir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python&quot; + get_pyt=
hon_version())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if standard_lib:<br>
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkin=
ter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinte=
r.patch<br>
index 184540e794..4dfa639669 100644<br>
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.pat=
ch<br>
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.pat=
ch<br>
@@ -1,4 +1,4 @@<br>
-From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001<br=
>
+From f0653707a6a310bd059fe4dc3146052bb38b5d83 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0Date: Mon, 28 Jan 2019 15:57:54 +0000<br>
=C2=A0Subject: [PATCH] _tkinter module needs tk module along with tcl. tk =
is not yet<br>
@@ -15,10 +15,10 @@ Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:an=
drei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index ab18ff0..7691258 100644<br>
+index d3ccc6c..ab9fb8e 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):<br>
+@@ -1811,8 +1811,8 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_decimal()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_ctypes()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_multiprocessing()<br>
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/reci=
pes-devtools/python/python3/cgi_py.patch<br>
index 6c4ba54320..493fdf0ab8 100644<br>
--- a/meta/recipes-devtools/python/python3/cgi_py.patch<br>
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch<br>
@@ -1,4 +1,4 @@<br>
-From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001<br=
>
+From 5da956e20d53cfdb687b8b8c3c15cfe926961ada Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" tar=
get=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 21 Sep 2011 20:55:33 -0500<br>
=C2=A0Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the c=
omment<br>
@@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hat=
le@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 10 deletions(-)<br>
<br>
=C2=A0diff --git a/Lib/cgi.py b/Lib/cgi.py<br>
-index 8cf6687..094c7b4 100755<br>
+index 77ab703..3edaf60 100755<br>
=C2=A0--- a/Lib/cgi.py<br>
=C2=A0+++ b/Lib/cgi.py<br>
=C2=A0@@ -1,13 +1,4 @@<br>
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/=
meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
index d789ab57d4..f4c3b93782 100644<br>
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
@@ -1,4 +1,8 @@<br>
-<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD<br>
+From 9dabb16c327211b8fb9327d06d66c7ef6baea4b2 Mon Sep 17 00:00:00 2001<br=
>
+From: Ricardo Ribalda &lt;<a href=3D"mailto:ricardo@ribalda.com" target=
=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
+Date: Tue, 18 Nov 2014 03:35:33 -0500<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: add CROSSPYTHONPATH into PYTHONPATH for<br>
+ PYTHON_FOR_BUILD<br>
<br>
=C2=A0When building x86-&gt;x86 the system will try to execute .so and rel=
ated items<br>
=C2=A0from the default PYTHONPATH.=C2=A0 This will fail if the target CPU =
contains<br>
@@ -10,8 +14,13 @@ Upstream-Status: Inappropriate [OE-Core integration spe=
cific]<br>
=C2=A0Credits-to: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.co=
m" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0Credits-to: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windrive=
r.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Ricardo Ribalda &lt;<a href=3D"mailto:ricardo@ribalda=
.com" target=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
+<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index 4ab19a6..7036a53 100644<br>
+index 784850b..01ea772 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0@@ -76,7 +76,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then=
<br>
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/me=
ta/recipes-devtools/python/python3/python-config.patch<br>
index c8a8f3d4aa..98b28bcbde 100644<br>
--- a/meta/recipes-devtools/python/python3/python-config.patch<br>
+++ b/meta/recipes-devtools/python/python3/python-config.patch<br>
@@ -1,4 +1,4 @@<br>
-From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001<br=
>
+From bf238a78ec90671789c6498bede99928cb7244e5 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com" target=
=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 4 May 2014 20:06:43 -0400<br>
=C2=A0Subject: [PATCH] python-config: Revert to using distutils.sysconfig<=
br>
@@ -21,7 +21,7 @@ Signed-off-by: Tyler Hall &lt;<a href=3D"mailto:tylerwha=
ll@gmail.com" target=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/Misc/<a href=3D"http://python-config.in" rel=3D"norefer=
rer" target=3D"_blank">python-config.in</a> b/Misc/<a href=3D"http://python=
-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a><br>
-index 727c4a8..c702829 100644<br>
+index ebd99da..13e57ae 100644<br>
=C2=A0--- a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" ta=
rget=3D"_blank">python-config.in</a><br>
=C2=A0+++ b/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" ta=
rget=3D"_blank">python-config.in</a><br>
=C2=A0@@ -6,7 +6,7 @@<br>
@@ -37,11 +37,11 @@ index 727c4a8..c702829 100644<br>
<br>
=C2=A0 for opt in opt_flags:<br>
=C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;--prefix&#39;:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(sysconfig.get_config_var(&#39;prefix&#=
39;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(getvar(&#39;prefix&#39;))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(sysconfig.PREFIX)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 elif opt =3D=3D &#39;--exec-prefix&#39;:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(sysconfig.get_config_var(&#39;exec_pre=
fix&#39;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(getvar(&#39;exec_prefix&#39;))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(sysconfig.EXEC_PREFIX)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 elif opt in (&#39;--includes&#39;, &#39;--cflags&#39;=
):<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.5.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.9.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.9.0.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3_3.8.5.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.8.5.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3_3.9.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.9.0.bb</a><br>
index 2a3c52a116..bd1d40edce 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.5.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.0.bb</a><br>
@@ -1,9 +1,9 @@<br>
=C2=A0SUMMARY =3D &quot;The Python Programming Language&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.python.org" rel=3D"noreferr=
er" target=3D"_blank">http://www.python.org</a>&quot;<br>
-LICENSE =3D &quot;PSFv2&quot;<br>
+LICENSE =3D &quot;PSFv2 &amp; BSD-0-Clause&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D203a6dbc802ee896020a47161=
e759642&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D33223c9ef60c31e3f0e866cb0=
9b65e83&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python/$%7BPV=
%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ww=
w.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
@@ -17,7 +17,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/p=
ython/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-use-the-shell=
-version-of-python-config-that-w.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-config.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-hardcode-lib-=
as-location-for-site-packages-an.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-python3-use-cc_basen=
ame-to-replace-CC-for-checking-c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Lib-sysconfig.py-fix=
-another-place-where-lib-is-hard.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-fix-Issue36=
464-parallel-build-race-problem.patch \<br>
@@ -29,19 +28,17 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp=
/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0017-setup.py-do-not-repo=
rt-missing-dependencies-for-disa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-setup.py-pass-missin=
g-libraries-to-Extension-for-mul.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-do-not-comp=
ile-.pyc-in-parallel.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-fix-LIB=
PL.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python3-Do-not-hardc=
ode-lib-for-distutils.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-configure.ac-setup.p=
y-do-not-add-a-curses-include-pa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-distutils-sysconfig-=
append-STAGING_LIBDIR-python-sys.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://12-distutils-prefix-is-in=
side-staging-area.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-search-system-=
for-headers-libraries.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;35b5a3d0254c1c59be9736373d429db7&quot;<br>
-SRC_URI[sha256sum] =3D &quot;e3003ed57db17e617acb382b0cade29a248c6026b1bd=
8aad1f976e9af66a83b0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8=
c4e50f15576a0bf82854&quot;<br>
<br>
=C2=A0# exclude pre-releases for both python 2.x and 3.x<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+)=
.tar&quot;<br>
@@ -52,7 +49,7 @@ CVE_PRODUCT =3D &quot;python&quot;<br>
=C2=A0# This is not exploitable when glibc has CVE-2016-10739 fixed.<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-18348&quot;<br>
<br>
-PYTHON_MAJMIN =3D &quot;3.8&quot;<br>
+PYTHON_MAJMIN =3D &quot;3.9&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
<br>
@@ -71,7 +68,7 @@ DEPENDS =3D &quot;bzip2-replacement-native libffi bzip2 =
openssl sqlite3 zlib virtual/li<br>
=C2=A0DEPENDS_append_class-target =3D &quot; python3-native&quot;<br>
=C2=A0DEPENDS_append_class-nativesdk =3D &quot; python3-native&quot;<br>
<br>
-EXTRA_OECONF =3D &quot; --without-ensurepip --enable-shared&quot;<br>
+EXTRA_OECONF =3D &quot; --without-ensurepip --enable-shared --with-platli=
bdir=3D${baselib}&quot;<br>
=C2=A0EXTRA_OECONF_append_class-native =3D &quot; --bindir=3D${bindir}/${P=
N}&quot;<br>
<br>
=C2=A0export CROSSPYTHONPATH=3D&quot;${STAGING_LIBDIR_NATIVE}/python${PYTH=
ON_MAJMIN}/lib-dynload/&quot;<br>
@@ -115,7 +112,6 @@ CPPFLAGS_append =3D &quot; -I${STAGING_INCDIR}/ncurses=
w -I${STAGING_INCDIR}/uuid&quot;<br>
=C2=A0EXTRA_OEMAKE =3D &#39;\<br>
=C2=A0 =C2=A0STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
=C2=A0 =C2=A0STAGING_INCDIR=3D${STAGING_INCDIR} \<br>
-=C2=A0 LIB=3D${baselib} \<br>
=C2=A0&#39;<br>
<br>
=C2=A0do_compile_prepend_class-target() {<br>
@@ -179,7 +175,6 @@ py_package_preprocess () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${=
RECIPE_SYSROOT_NATIVE}::g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${=
RECIPE_SYSROOT}::g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${=
BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/${libdir}=
/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${li=
bdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${bi=
ndir}/python${PYTHON_MAJMIN}-config<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002b997405b27179fd--
