Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4719D7FA2E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 15:48:11 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id v23so9264320qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 07:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rVm5CRDl/7/7CW53GCCjZNP0EZVGWWcmg3Hhe5FIVqg=;
	b=TTt8AbFbMSxOB81l1GWvjevDKwEMQ1ELkB5KZtDtkMAUyJ4EiybpnJfBJwsNvzPO5Q
	E0Z9yKuPvUDiwKfXfFRUGxRW31uG/hDmI9mWDDX8Zq5jskXDP+s4SgxG+g9jvqQ/qZMD
	biCXUJkONPYZ20ijOUYIh4Vqo/xsbpFeQ+o2Wl2P6+kfS9DQHZBnN+Cw8zF0NHnCi8VH
	XXZHwx+O74BB4s27PEpDK2NCsJpLVBY/lx2Vyv07f232uw6DUiUv7SJGh/tiLT3rmfoB
	S9ADSub3xSWxIEVxsCq6A+i2kNt6sMzJ8mdDkDPRSyrv8RQxNSNPs3ZlW+5tgT6t46bp
	8sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rVm5CRDl/7/7CW53GCCjZNP0EZVGWWcmg3Hhe5FIVqg=;
	b=GmL4HtcH6zScujyNPf+5kOXcaqgTRmt5bRxEmX8WMLIk3evObRBND7oeIBcP5D0hLd
	+2gu7VsW+Kx9PR6BOhSS9nx69BfpAbOtYO5Uk617P0+Jq2rruTnB2d212IAD/DlmMspa
	yGpmorcPP1mlmgxsuVyenvvU3X5VrUQ6JonKT6E1hhqa1WKpUgwGKtRskpnkgV3v73Rr
	1dEJW78w+gGovWvsRHRxIo8QGLh1zTBbP0ULhU+tc7VB8gMrju1CjZO11YfaI3GN2wqs
	2vRFVgC3W++w0Kj0Ias6QhsYMKcjoJC5jCws9alO5q1HwOxEPZ3+QbYx8afpIGMvnQNN
	1eQA==
X-Gm-Message-State: APjAAAVuGNNIPy0a2WzUhMT1chllGsWL4Sv/r2l2Hy0rKnJnc/5vjUDe
	WPfX82jSdga7/VLf0C4xxJnMr393r0VWK/ze9Hs=
X-Google-Smtp-Source: APXvYqxv2grAcsyrgiybSlRTlZ1XbMj6FymLIusODztO+dCd9yChC6H6WNEunI5U9hQd9QgPcm+qd7zIdRifpwNk+TM=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr19672706qkf.337.1575733691311; 
	Sat, 07 Dec 2019 07:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-6-alex.kanavin@gmail.com>
In-Reply-To: <20191205154357.121346-6-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Dec 2019 07:47:44 -0800
Message-ID: <CAMKF1sqx35CX9Mzup2WJeaEsK_9qsk=6tHRwjL5+p_xAnAafZw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/24] python3: update to 3.8.0
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
X-List-Received-Date: Sat, 07 Dec 2019 15:48:11 -0000
Content-Type: text/plain; charset="UTF-8"

besides gettext this is another reason I suppose causing a few more failures see


http://errors.yoctoproject.org/Errors/Build/94077/

all do_prepare_recipe_sysroot seems to be failing in python snippets.
and do_configure aree also related to native python missing modules
do_compile are mostly related to gettext.

On Thu, Dec 5, 2019 at 7:45 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Drop backports, rebase other patches.
>
> One patch I wasn't able to rebase as upstream code changed too much:
> 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> Please determine if it is still needed, produce a new version,
> and work with upstream to get it merged.
>
> 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> is removed as the use case (allowing python 2 and 3 to coexist
> in SDKs) is no longer relevant with Python 2.x reaching end of line
> and upstream has refactored the code making a rebase difficult.
> If needed, please re-add the patch to py2, rather than py3.
>
> Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the recipes
> and classes accordingly.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/python3-dir.bbclass              |   4 +-
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |  14 +-
>  ...lib-as-location-for-site-packages-an.patch | 156 ++++++++------
>  ...-detection-of-mips-architecture-for-.patch |  16 +-
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
>  ...ON3HOME-is-set-use-instead-of-PYTHON.patch |  47 -----
>  ...asename-to-replace-CC-for-checking-c.patch |  37 ++--
>  ...runtime-test-to-get-float-byte-order.patch | 199 ------------------
>  ...ssing-libraries-to-Extension-for-mul.patch |  80 -------
>  ...report-missing-dependencies-for-disa.patch |  11 +-
>  ...tutils-prefix-is-inside-staging-area.patch |   2 +-
>  .../python3/avoid_warning_about_tkinter.patch |  33 ++-
>  .../python/python3/python-config.patch        |  24 ++-
>  .../python/python3/python3-manifest.json      |   4 +-
>  .../{python3_3.7.5.bb => python3_3.8.0.bb}    |  28 ++-
>  15 files changed, 175 insertions(+), 482 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
>  rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.8.0.bb} (91%)
>
> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
> index 7dd130bad99..036d7140d99 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,5 +1,5 @@
> -PYTHON_BASEVERSION = "3.7"
> -PYTHON_ABI = "m"
> +PYTHON_BASEVERSION = "3.8"
> +PYTHON_ABI = ""
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_PN = "python3"
>  PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> index 09f279ba1d7..59592821d7f 100644
> --- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> @@ -1,4 +1,4 @@
> -From 23294c6ba6896115828293fdb7e67b47b38ba675 Mon Sep 17 00:00:00 2001
> +From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 25 Jan 2019 19:04:13 +0100
>  Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
> @@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index b4357e3..fbec00d 100644
> +index 20d7f35..ab18ff0 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -856,7 +856,6 @@ class PyBuildExt(build_ext):
> +@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):
>                                                        'termcap'):
>                   readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> --                                   library_dirs=['/usr/lib/termcap'],
> -                                    extra_link_args=readline_extra_link_args,
> -                                    libraries=readline_libs) )
> +             self.add(Extension('readline', ['readline.c'],
> +-                               library_dirs=['/usr/lib/termcap'],
> +                                extra_link_args=readline_extra_link_args,
> +                                libraries=readline_libs))
>           else:
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> index ea75262c4f6..112c979441f 100644
> --- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> @@ -1,4 +1,4 @@
> -From 0fbdad1eaf541a8e92be81f39514cd249b3b0801 Mon Sep 17 00:00:00 2001
> +From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 5 Feb 2019 15:52:02 +0100
>  Subject: [PATCH] Do not hardcode "lib" as location for modules, site-packages
> @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   Include/pythonrun.h  |  2 ++
>   Lib/site.py          |  4 ++--
>   Makefile.pre.in      |  5 +++--
> - Modules/getpath.c    | 18 ++++++++++++------
> + Modules/getpath.c    | 22 ++++++++++++++--------
>   Python/getplatform.c | 10 ++++++++++
>   Python/sysmodule.c   |  2 ++
> - 6 files changed, 31 insertions(+), 10 deletions(-)
> + 6 files changed, 33 insertions(+), 12 deletions(-)
>
>  diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> -index 6f0c6fc..0a17edd 100644
> +index 46091e0..61b2e15 100644
>  --- a/Include/pythonrun.h
>  +++ b/Include/pythonrun.h
>  @@ -7,6 +7,8 @@
> @@ -28,12 +28,12 @@ index 6f0c6fc..0a17edd 100644
>  +
>   #ifndef Py_LIMITED_API
>   PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
> - PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
> + PyAPI_FUNC(int) PyRun_AnyFileExFlags(
>  diff --git a/Lib/site.py b/Lib/site.py
> -index ffd132b..b55f6d8 100644
> +index a065ab0..1d720ef 100644
>  --- a/Lib/site.py
>  +++ b/Lib/site.py
> -@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
> +@@ -335,12 +335,12 @@ def getsitepackages(prefixes=None):
>           seen.add(prefix)
>
>           if os.sep == '/':
> @@ -49,10 +49,10 @@ index ffd132b..b55f6d8 100644
>
>   def addsitepackages(known_paths, prefixes=None):
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 6e81b2f..671a20e 100644
> +index 65665df..be49140 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -142,7 +142,7 @@ LIBDIR=            @libdir@
> +@@ -143,7 +143,7 @@ LIBDIR=            @libdir@
>   MANDIR=               @mandir@
>   INCLUDEDIR=   @includedir@
>   CONFINCLUDEDIR=       $(exec_prefix)/include
> @@ -61,7 +61,7 @@ index 6e81b2f..671a20e 100644
>   ABIFLAGS=     @ABIFLAGS@
>
>   # Detailed destination directories
> -@@ -768,6 +768,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
> +@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
>                 -DEXEC_PREFIX='"$(exec_prefix)"' \
>                 -DVERSION='"$(VERSION)"' \
>                 -DVPATH='"$(VPATH)"' \
> @@ -69,7 +69,7 @@ index 6e81b2f..671a20e 100644
>                 -o $@ $(srcdir)/Modules/getpath.c
>
>   Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -856,7 +857,7 @@ regen-opcode:
> +@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h
>   Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
>
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
> @@ -79,72 +79,90 @@ index 6e81b2f..671a20e 100644
>   Python/importdl.o: $(srcdir)/Python/importdl.c
>                 $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
>  diff --git a/Modules/getpath.c b/Modules/getpath.c
> -index e6a3e8e..0c62af6 100644
> +index b727f66..c003e46 100644
>  --- a/Modules/getpath.c
>  +++ b/Modules/getpath.c
> -@@ -123,6 +123,7 @@ typedef struct {
> -     wchar_t *exec_prefix;              /* EXEC_PREFIX define */
> +@@ -128,6 +128,7 @@ typedef struct {
> +     wchar_t *exec_prefix;              /* EXEC_PREFIX macro */
>
>       wchar_t *lib_python;               /* "lib/pythonX.Y" */
>  +    wchar_t *multilib_python;               /* "lib[suffix]/pythonX.Y" */
> -     wchar_t argv0_path[MAXPATHLEN+1];
> -     wchar_t zip_path[MAXPATHLEN+1];    /* ".../lib/pythonXY.zip" */
>
> -@@ -314,7 +315,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> +     int prefix_found;         /* found platform independent libraries? */
> +     int exec_prefix_found;    /* found the platform dependent libraries? */
> +@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
>           if (delim) {
>               *delim = L'\0';
>           }
> --        joinpath(prefix, calculate->lib_python);
> -+        joinpath(prefix, calculate->multilib_python);
> -         joinpath(prefix, LANDMARK);
> -         return 1;
> -     }
> -@@ -343,7 +344,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> -     copy_absolute(prefix, calculate->argv0_path, MAXPATHLEN+1);
> +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> ++        status = joinpath(prefix, calculate->multilib_python, prefix_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             return status;
> +         }
> +@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
>       do {
> -         n = wcslen(prefix);
> --        joinpath(prefix, calculate->lib_python);
> -+        joinpath(prefix, calculate->multilib_python);
> -         joinpath(prefix, LANDMARK);
> -         if (ismodule(prefix)) {
> -             return 1;
> -@@ -355,7 +356,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> -     /* Look at configure's PREFIX */
> -     wcsncpy(prefix, calculate->prefix, MAXPATHLEN);
> -     prefix[MAXPATHLEN] = L'\0';
> --    joinpath(prefix, calculate->lib_python);
> -+    joinpath(prefix, calculate->multilib_python);
> -     joinpath(prefix, LANDMARK);
> -     if (ismodule(prefix)) {
> -         return 1;
> -@@ -427,7 +428,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> -             wcsncpy(exec_prefix, core_config->home, MAXPATHLEN);
> +         /* Path: <argv0_path or substring> / <lib_python> / LANDMARK */
> +         size_t n = wcslen(prefix);
> +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> ++        status = joinpath(prefix, calculate->multilib_python, prefix_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             return status;
>           }
> -         exec_prefix[MAXPATHLEN] = L'\0';
> --        joinpath(exec_prefix, calculate->lib_python);
> -+        joinpath(exec_prefix, calculate->multilib_python);
> -         joinpath(exec_prefix, L"lib-dynload");
> -         return 1;
> +@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
> +     if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> +         return PATHLEN_ERR();
> +     }
> +-    status = joinpath(prefix, calculate->lib_python, prefix_len);
> ++    status = joinpath(prefix, calculate->multilib_python, prefix_len);
> +     if (_PyStatus_EXCEPTION(status)) {
> +         return status;
>       }
> -@@ -464,7 +465,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> -     copy_absolute(exec_prefix, calculate->argv0_path, MAXPATHLEN+1);
> +@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
> +         if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> +             return PATHLEN_ERR();
> +         }
> +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> ++        status = joinpath(prefix, calculate->multilib_python, prefix_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             return status;
> +         }
> +@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
> +                 return PATHLEN_ERR();
> +             }
> +         }
> +-        status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
> ++        status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             return status;
> +         }
> +@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
>       do {
> -         n = wcslen(exec_prefix);
> --        joinpath(exec_prefix, calculate->lib_python);
> -+        joinpath(exec_prefix, calculate->multilib_python);
> -         joinpath(exec_prefix, L"lib-dynload");
> -         if (isdir(exec_prefix)) {
> -             return 1;
> -@@ -476,7 +477,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> -     /* Look at configure's EXEC_PREFIX */
> -     wcsncpy(exec_prefix, calculate->exec_prefix, MAXPATHLEN);
> -     exec_prefix[MAXPATHLEN] = L'\0';
> --    joinpath(exec_prefix, calculate->lib_python);
> -+    joinpath(exec_prefix, calculate->multilib_python);
> -     joinpath(exec_prefix, L"lib-dynload");
> -     if (isdir(exec_prefix)) {
> -         return 1;
> -@@ -871,6 +872,10 @@ calculate_init(PyCalculatePath *calculate,
> +         /* Path: <argv0_path or substring> / <lib_python> / "lib-dynload" */
> +         size_t n = wcslen(exec_prefix);
> +-        status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
> ++        status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             return status;
> +         }
> +@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate, _PyPathConfig *pathconfig,
> +     if (safe_wcscpy(exec_prefix, calculate->exec_prefix, exec_prefix_len) < 0) {
> +         return PATHLEN_ERR();
> +     }
> +-    status = joinpath(exec_prefix, calculate->lib_python, exec_prefix_len);
> ++    status = joinpath(exec_prefix, calculate->multilib_python, exec_prefix_len);
> +     if (_PyStatus_EXCEPTION(status)) {
> +         return status;
> +     }
> +@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate, const wchar_t *program_full_pat
> +             return PATHLEN_ERR();
> +         }
> +         reduce(argv0_path);
> +-        status = joinpath(argv0_path, calculate->lib_python, argv0_path_len);
> ++        status = joinpath(argv0_path, calculate->multilib_python, argv0_path_len);
> +         if (_PyStatus_EXCEPTION(status)) {
> +             PyMem_RawFree(wbuf);
> +             return status;
> +@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, const PyConfig *config)
>       if (!calculate->lib_python) {
>           return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
>       }
> @@ -152,10 +170,10 @@ index e6a3e8e..0c62af6 100644
>  +    if (!calculate->multilib_python) {
>  +        return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
>  +    }
> -     return _Py_INIT_OK();
> - }
>
> -@@ -882,6 +887,7 @@ calculate_free(PyCalculatePath *calculate)
> +     calculate->warnings = config->pathconfig_warnings;
> +     calculate->pythonpath_env = config->pythonpath_env;
> +@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)
>       PyMem_RawFree(calculate->prefix);
>       PyMem_RawFree(calculate->exec_prefix);
>       PyMem_RawFree(calculate->lib_python);
> @@ -182,10 +200,10 @@ index 81a0f7a..d55396b 100644
>  +      return LIB;
>  +}
>  diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> -index efe5b29..de77b17 100644
> +index 5b0fb81..0dce754 100644
>  --- a/Python/sysmodule.c
>  +++ b/Python/sysmodule.c
> -@@ -2319,6 +2319,8 @@ _PySys_BeginInit(PyObject **sysmod)
> +@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime, PyInterpreterState *interp,
>                           PyUnicode_FromString(Py_GetCopyright()));
>       SET_SYS_FROM_STRING("platform",
>                           PyUnicode_FromString(Py_GetPlatform()));
> diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> index e7af88654da..fe0aa8aabed 100644
> --- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -1,4 +1,4 @@
> -From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
> +From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
>  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>  Date: Fri, 31 May 2019 15:34:34 +0200
>  Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> @@ -12,15 +12,16 @@ to do this in a more autoconf/autotools manner.
>
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
>  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> +
>  ---
> - configure.ac | 169 ++++++---------------------------------------------
> - 1 file changed, 17 insertions(+), 152 deletions(-)
> + configure.ac | 171 +++++----------------------------------------------
> + 1 file changed, 17 insertions(+), 154 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index a7de901e08..a73e2de51b 100644
> +index 0f85486..0ca7e24 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -727,158 +727,23 @@ fi
> +@@ -704,160 +704,23 @@ fi
>   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
>   AC_SUBST(MULTIARCH)
>
> @@ -163,6 +164,8 @@ index a7de901e08..a73e2de51b 100644
>  -        i386-gnu
>  -#elif defined(__APPLE__)
>  -        darwin
> +-#elif defined(__VXWORKS__)
> +-        vxworks
>  -#else
>  -# error unknown platform triplet
>  -#endif
> @@ -196,6 +199,3 @@ index a7de901e08..a73e2de51b 100644
>
>   if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
>     if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> ---
> -2.21.0
> -
> diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> index 1709011be8a..ee37f6bd52d 100644
> --- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> +++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -1,4 +1,4 @@
> -From eff903c600f4c40f5753e95ab1557126fc6e0c9c Mon Sep 17 00:00:00 2001
> +From cf676775109c0a7fb38058bb60b453ff8f1a166b Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 31 Jan 2019 16:46:30 +0100
>  Subject: [PATCH] distutils/sysconfig: append
> diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> deleted file mode 100644
> index a146c747f83..00000000000
> --- a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 5ce3ac59531828ff682646fbba59b2126b28a8aa Mon Sep 17 00:00:00 2001
> -From: Jaewon Lee <jaewon.lee@xilinx.com>
> -Date: Thu, 25 Apr 2019 15:34:26 -0700
> -Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHONHOME
> -
> -There is one variable PYTHONHOME to determine where libraries are coming
> -from for both python2 and python3. This becomes an issue if only one has
> -libraries in the specified PYTHONHOME path, but they are using the same
> -PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
> -to set a different path for python3
> -
> -Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> -
> -Upstream-Status: Inappropriate [OE specific configuration]
> -
> ----
> - Modules/main.c | 17 +++++++++++++----
> - 1 file changed, 13 insertions(+), 4 deletions(-)
> -
> -diff --git a/Modules/main.c b/Modules/main.c
> -index acc59c6..407085a 100644
> ---- a/Modules/main.c
> -+++ b/Modules/main.c
> -@@ -1834,10 +1834,19 @@ config_init_home(_PyCoreConfig *config)
> -         }
> -         return _Py_INIT_OK();
> -     }
> --
> --    int res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
> --    if (res < 0) {
> --        return DECODE_LOCALE_ERR("PYTHONHOME", res);
> -+    int res;
> -+    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
> -+    if (oepython3home) {
> -+        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
> -+        if (res < 0) {
> -+            return DECODE_LOCALE_ERR("OEPYTHON3HOME", res);
> -+        }
> -+    }
> -+    else {
> -+        res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
> -+        if (res < 0) {
> -+            return DECODE_LOCALE_ERR("PYTHONHOME", res);
> -+        }
> -     }
> -     config->home = home;
> -     return _Py_INIT_OK();
> diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index a0ea897f4e8..fb10ca94b31 100644
> --- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -1,4 +1,4 @@
> -From 2645317fef09afe31b01bb2c1d4fe5b9afdbb11a Mon Sep 17 00:00:00 2001
> +From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 22 Oct 2018 15:19:51 +0800
>  Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
> @@ -21,12 +21,13 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
>  patch originally from Li Zhou, I just rework it to new version
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   configure.ac | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index a7de901..4a3681f 100644
> +index a189d42..0f85486 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
> @@ -37,7 +38,7 @@ index a7de901..4a3681f 100644
>
>   # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
>   rm -f pybuilddir.txt
> -@@ -695,7 +696,7 @@ AC_MSG_RESULT($with_cxx_main)
> +@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)
>   preset_cxx="$CXX"
>   if test -z "$CXX"
>   then
> @@ -46,7 +47,7 @@ index a7de901..4a3681f 100644
>           gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
>           cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
>           clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
> -@@ -979,7 +980,7 @@ rmdir CaseSensitiveTestDir
> +@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir
>
>   case $ac_sys_system in
>   hp*|HP*)
> @@ -55,7 +56,7 @@ index a7de901..4a3681f 100644
>       cc|*/cc) CC="$CC -Ae";;
>       esac;;
>   esac
> -@@ -1336,7 +1337,7 @@ else
> +@@ -1335,7 +1336,7 @@ else
>   fi],
>   [AC_MSG_RESULT(no)])
>   if test "$Py_LTO" = 'true' ; then
> @@ -64,7 +65,7 @@ index a7de901..4a3681f 100644
>       *clang*)
>         AC_SUBST(LLVM_AR)
>         AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> -@@ -1426,7 +1427,7 @@ then
> +@@ -1425,7 +1426,7 @@ then
>     fi
>   fi
>   LLVM_PROF_ERR=no
> @@ -73,16 +74,16 @@ index a7de901..4a3681f 100644
>     *clang*)
>       # Any changes made here should be reflected in the GCC+Darwin case below
>       PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
> -@@ -1500,7 +1501,7 @@ then
> -            WRAP="-fwrapv"
> -         fi
> +@@ -1486,7 +1487,7 @@ esac
> + # compiler and platform.  BASECFLAGS tweaks need to be made even if the
> + # user set OPT.
>
> --        case $CC in
> -+        case $cc_basename in
> -             *clang*)
> -                 cc_is_clang=1
> -                 ;;
> -@@ -1623,7 +1624,7 @@ yes)
> +-case $CC in
> ++case $cc_basename in
> +     *clang*)
> +         cc_is_clang=1
> +         ;;
> +@@ -1622,7 +1623,7 @@ yes)
>
>       # ICC doesn't recognize the option, but only emits a warning
>       ## XXX does it emit an unused result warning and can it be disabled?
> @@ -91,7 +92,7 @@ index a7de901..4a3681f 100644
>       *icc*)
>       ac_cv_disable_unused_result_warning=no
>       ;;
> -@@ -1965,7 +1966,7 @@ yes)
> +@@ -1943,7 +1944,7 @@ yes)
>   esac
>
>   # ICC needs -fp-model strict or floats behave badly
> @@ -100,7 +101,7 @@ index a7de901..4a3681f 100644
>   *icc*)
>       CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
>       ;;
> -@@ -2727,7 +2728,7 @@ then
> +@@ -2711,7 +2712,7 @@ then
>                 then
>                         LINKFORSHARED="-Wl,--export-dynamic"
>                 fi;;
> @@ -109,7 +110,7 @@ index a7de901..4a3681f 100644
>                   *gcc*)
>                     if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
>                     then
> -@@ -5429,7 +5430,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> +@@ -5362,7 +5363,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
>       # Some versions of gcc miscompile inline asm:
>       # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
>       # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
> diff --git a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch b/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> deleted file mode 100644
> index 58ab709028e..00000000000
> --- a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> +++ /dev/null
> @@ -1,199 +0,0 @@
> -From fa96a7fd19e17b9c6b4dd01c3c3774fb382dddc6 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 5 Sep 2018 11:45:52 +0100
> -Subject: [PATCH] Don't do runtime test to get float byte order
> -
> -Python uses AC_RUN_IFELSE to determine the byte order for floats and doubles,
> -and falls back onto "I don't know" if it can't run code.  This results in
> -crippled floating point numbers in Python, and the regression tests fail.
> -
> -Instead of running code, take a macro from autoconf-archive which compiles C
> -with a special double in which has an ASCII representation, and then greps the
> -binary to identify the format.
> -
> -Upstream-Status: Backport [2a9c3805ddedf282881ef7811a561c70b74f80b1]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - configure.ac                     | 72 +++------------------------
> - m4/ax_c_float_words_bigendian.m4 | 83 ++++++++++++++++++++++++++++++++
> - 2 files changed, 90 insertions(+), 65 deletions(-)
> - create mode 100644 m4/ax_c_float_words_bigendian.m4
> -
> -diff --git a/configure.ac b/configure.ac
> -index 4a3681f..4ab19a6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4328,77 +4328,19 @@ fi
> - # * Check for various properties of floating point *
> - # **************************************************
> -
> --AC_MSG_CHECKING(whether C doubles are little-endian IEEE 754 binary64)
> --AC_CACHE_VAL(ac_cv_little_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x = 9006104071832581.0;
> --    if (memcmp(&x, "\x05\x04\x03\x02\x01\xff\x3f\x43", 8) == 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_little_endian_double=yes],
> --[ac_cv_little_endian_double=no],
> --[ac_cv_little_endian_double=no])])
> --AC_MSG_RESULT($ac_cv_little_endian_double)
> --if test "$ac_cv_little_endian_double" = yes
> --then
> --  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> --  [Define if C doubles are 64-bit IEEE 754 binary format, stored
> --   with the least significant byte first])
> --fi
> --
> --AC_MSG_CHECKING(whether C doubles are big-endian IEEE 754 binary64)
> --AC_CACHE_VAL(ac_cv_big_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x = 9006104071832581.0;
> --    if (memcmp(&x, "\x43\x3f\xff\x01\x02\x03\x04\x05", 8) == 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_big_endian_double=yes],
> --[ac_cv_big_endian_double=no],
> --[ac_cv_big_endian_double=no])])
> --AC_MSG_RESULT($ac_cv_big_endian_double)
> --if test "$ac_cv_big_endian_double" = yes
> -+AX_C_FLOAT_WORDS_BIGENDIAN
> -+if test "$ax_cv_c_float_words_bigendian" = "yes"
> - then
> -   AC_DEFINE(DOUBLE_IS_BIG_ENDIAN_IEEE754, 1,
> -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> -    with the most significant byte first])
> --fi
> --
> --# Some ARM platforms use a mixed-endian representation for doubles.
> --# While Python doesn't currently have full support for these platforms
> --# (see e.g., issue 1762561), we can at least make sure that float <-> string
> --# conversions work.
> --AC_MSG_CHECKING(whether C doubles are ARM mixed-endian IEEE 754 binary64)
> --AC_CACHE_VAL(ac_cv_mixed_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x = 9006104071832581.0;
> --    if (memcmp(&x, "\x01\xff\x3f\x43\x05\x04\x03\x02", 8) == 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_mixed_endian_double=yes],
> --[ac_cv_mixed_endian_double=no],
> --[ac_cv_mixed_endian_double=no])])
> --AC_MSG_RESULT($ac_cv_mixed_endian_double)
> --if test "$ac_cv_mixed_endian_double" = yes
> -+elif test "$ax_cv_c_float_words_bigendian" = "no"
> - then
> --  AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,
> -+  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> --   in ARM mixed-endian order (byte order 45670123)])
> -+   with the least significant byte first])
> -+else
> -+  AC_MSG_ERROR([Cannot identify floating point byte order])
> - fi
> -
> - # The short float repr introduced in Python 3.1 requires the
> -diff --git a/m4/ax_c_float_words_bigendian.m4 b/m4/ax_c_float_words_bigendian.m4
> -new file mode 100644
> -index 0000000..216b90d
> ---- /dev/null
> -+++ b/m4/ax_c_float_words_bigendian.m4
> -@@ -0,0 +1,83 @@
> -+# ===============================================================================
> -+#  https://www.gnu.org/software/autoconf-archive/ax_c_float_words_bigendian.html
> -+# ===============================================================================
> -+#
> -+# SYNOPSIS
> -+#
> -+#   AX_C_FLOAT_WORDS_BIGENDIAN([ACTION-IF-TRUE], [ACTION-IF-FALSE], [ACTION-IF-UNKNOWN])
> -+#
> -+# DESCRIPTION
> -+#
> -+#   Checks the ordering of words within a multi-word float. This check is
> -+#   necessary because on some systems (e.g. certain ARM systems), the float
> -+#   word ordering can be different from the byte ordering. In a multi-word
> -+#   float context, "big-endian" implies that the word containing the sign
> -+#   bit is found in the memory location with the lowest address. This
> -+#   implementation was inspired by the AC_C_BIGENDIAN macro in autoconf.
> -+#
> -+#   The endianness is detected by first compiling C code that contains a
> -+#   special double float value, then grepping the resulting object file for
> -+#   certain strings of ASCII values. The double is specially crafted to have
> -+#   a binary representation that corresponds with a simple string. In this
> -+#   implementation, the string "noonsees" was selected because the
> -+#   individual word values ("noon" and "sees") are palindromes, thus making
> -+#   this test byte-order agnostic. If grep finds the string "noonsees" in
> -+#   the object file, the target platform stores float words in big-endian
> -+#   order. If grep finds "seesnoon", float words are in little-endian order.
> -+#   If neither value is found, the user is instructed to specify the
> -+#   ordering.
> -+#
> -+# LICENSE
> -+#
> -+#   Copyright (c) 2008 Daniel Amelang <dan@amelang.net>
> -+#
> -+#   Copying and distribution of this file, with or without modification, are
> -+#   permitted in any medium without royalty provided the copyright notice
> -+#   and this notice are preserved. This file is offered as-is, without any
> -+#   warranty.
> -+
> -+#serial 11
> -+
> -+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
> -+  [AC_CACHE_CHECK(whether float word ordering is bigendian,
> -+                  ax_cv_c_float_words_bigendian, [
> -+
> -+ax_cv_c_float_words_bigendian=unknown
> -+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> -+
> -+double d = 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
> -+
> -+]])], [
> -+
> -+if grep noonsees conftest.$ac_objext >/dev/null ; then
> -+  ax_cv_c_float_words_bigendian=yes
> -+fi
> -+if grep seesnoon conftest.$ac_objext >/dev/null ; then
> -+  if test "$ax_cv_c_float_words_bigendian" = unknown; then
> -+    ax_cv_c_float_words_bigendian=no
> -+  else
> -+    ax_cv_c_float_words_bigendian=unknown
> -+  fi
> -+fi
> -+
> -+])])
> -+
> -+case $ax_cv_c_float_words_bigendian in
> -+  yes)
> -+    m4_default([$1],
> -+      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
> -+                 [Define to 1 if your system stores words within floats
> -+                  with the most significant word first])]) ;;
> -+  no)
> -+    $2 ;;
> -+  *)
> -+    m4_default([$3],
> -+      [AC_MSG_ERROR([
> -+
> -+Unknown float word ordering. You need to manually preset
> -+ax_cv_c_float_words_bigendian=no (or yes) according to your system.
> -+
> -+    ])]) ;;
> -+esac
> -+
> -+])# AX_C_FLOAT_WORDS_BIGENDIAN
> diff --git a/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> deleted file mode 100644
> index b9d5bc9c516..00000000000
> --- a/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -From b881a79adcd4ae5ac8fe4f49d0fc77c47f777919 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 4 Aug 2017 11:16:14 +0800
> -Subject: [PATCH] setup.py: pass missing libraries to Extension for
> - multiprocessing module
> -
> -In the following commit:
> -...
> -commit e711cafab13efc9c1fe6c5cd75826401445eb585
> -Author: Benjamin Peterson <benjamin@python.org>
> -Date:   Wed Jun 11 16:44:04 2008 +0000
> -
> -    Merged revisions 64104,64117 via svnmerge from
> -    svn+ssh://pythondev@svn.python.org/python/trunk
> -...
> -(see diff in setup.py)
> -It assigned libraries for multiprocessing module according
> -the host_platform, but not pass it to Extension.
> -
> -In glibc, the following commit caused two definition of
> -sem_getvalue are different.
> -https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
> -(see diff in nptl/sem_getvalue.c for detail)
> -`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
> -and `__old_sem_getvalue' is to compat the old version
> -sem_getvalue@GLIBC_2.0.
> -
> -To build python for embedded Linux systems:
> -http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
> -If not explicitly link to library pthread (-lpthread), it will
> -load glibc's sem_getvalue randomly at runtime.
> -
> -Such as build python on linux x86_64 host and run the python
> -on linux x86_32 target. If not link library pthread, it caused
> -multiprocessing bounded semaphore could not work correctly.
> -...
> ->>> import multiprocessing
> ->>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
> ->>> pool_sema.acquire()
> -True
> ->>> pool_sema.release()
> -Traceback (most recent call last):
> -  File "<stdin>", line 1, in <module>
> -ValueError: semaphore or lock released too many times
> -...
> -
> -And the semaphore issue also caused multiprocessing.Queue().put() hung.
> -
> -Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - setup.py | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index b7a36a6..658ead3 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -1584,8 +1584,10 @@ class PyBuildExt(build_ext):
> -         elif host_platform.startswith('netbsd'):
> -             macros = dict()
> -             libraries = []
> --
> --        else:                                   # Linux and other unices
> -+        elif host_platform.startswith(('linux')):
> -+            macros = dict()
> -+            libraries = ['pthread']
> -+        else:                                   # Other unices
> -             macros = dict()
> -             libraries = ['rt']
> -
> -@@ -1603,6 +1605,7 @@ class PyBuildExt(build_ext):
> -
> -         exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
> -                                 define_macros=list(macros.items()),
> -+                                libraries=libraries,
> -                                 include_dirs=["Modules/_multiprocessing"]))
> -         # End multiprocessing
> -
> diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> index c15295c034c..4bd98f62fd6 100644
> --- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> +++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> @@ -1,4 +1,4 @@
> -From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 2001
> +From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 7 Oct 2019 13:22:14 +0200
>  Subject: [PATCH] setup.py: do not report missing dependencies for disabled
> @@ -10,22 +10,23 @@ build completeness checker which relies on the report.
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   setup.py | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/setup.py b/setup.py
> -index 4b53668..0097643 100644
> +index 7691258..ec3f2a4 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):
> +@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
>                   print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
>                                                 longest, g))
>
>  +        # There is no need to report missing module dependencies,
>  +        # if the modules have been disabled in the first place.
> -+        missing = list(set(missing) - set(sysconf_dis))
> ++        self.missing = list(set(self.missing) - set(sysconf_dis))
>  +
> -         if missing:
> +         if self.missing:
>               print()
>               print("Python build finished successfully!")
> diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> index d49604ba4d9..219b3551b8b 100644
> --- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> +++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -1,4 +1,4 @@
> -From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 2001
> +From 93b2c26467b0ea9a18c178e4e1371d52e917a68b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH] python3: Add target and native recipes
> diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index 24e67b4ca14..184540e794c 100644
> --- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -1,4 +1,4 @@
> -From fead48c8b501a8d7c3db21df2e599f90f38f11d3 Mon Sep 17 00:00:00 2001
> +From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001
>  From: Andrei Gherzan <andrei@gherzan.ro>
>  Date: Mon, 28 Jan 2019 15:57:54 +0000
>  Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is not yet
> @@ -11,26 +11,21 @@ Also simply disable the tk module since its not in DEPENDS.
>  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>
>  ---
> - setup.py | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index fbec00d..b7a36a6 100644
> +index ab18ff0..7691258 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1623,10 +1623,12 @@ class PyBuildExt(build_ext):
> -         self.extensions.extend(exts)
> +@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):
> +         self.detect_decimal()
> +         self.detect_ctypes()
> +         self.detect_multiprocessing()
> +-        if not self.detect_tkinter():
> +-            self.missing.append('_tkinter')
> ++#        if not self.detect_tkinter():
> ++#            self.missing.append('_tkinter')
> +         self.detect_uuid()
>
> -         # Call the method for detecting whether _tkinter can be compiled
> --        self.detect_tkinter(inc_dirs, lib_dirs)
> -+        # self.detect_tkinter(inc_dirs, lib_dirs)
> -
> --        if '_tkinter' not in [e.name for e in self.extensions]:
> --            missing.append('_tkinter')
> -+        # tkinter module will not be avalaible as yocto
> -+        # doesn't have tk integrated (yet)
> -+        #if '_tkinter' not in [e.name for e in self.extensions]:
> -+        #    missing.append('_tkinter')
> -
> -         # Build the _uuid module if possible
> -         uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> + ##         # Uncomment these lines if you want to play with xxmodule.c
> diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
> index f23b8b7df06..c8a8f3d4aa3 100644
> --- a/meta/recipes-devtools/python/python3/python-config.patch
> +++ b/meta/recipes-devtools/python/python3/python-config.patch
> @@ -1,4 +1,7 @@
> -python-config: Revert to using distutils.sysconfig
> +From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001
> +From: Tyler Hall <tylerwhall@gmail.com>
> +Date: Sun, 4 May 2014 20:06:43 -0400
> +Subject: [PATCH] python-config: Revert to using distutils.sysconfig
>
>  The newer sysconfig module shares some code with distutils.sysconfig, but the same modifications as in
>
> @@ -12,11 +15,16 @@ Upstream-Status: Inappropriate [Embedded Specific]
>
>  Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
>  :
> -Index: Python-3.3.3/Misc/python-config.in
> -===================================================================
> ---- Python-3.3.3.orig/Misc/python-config.in
> -+++ Python-3.3.3/Misc/python-config.in
> -@@ -4,7 +4,7 @@
> +
> +---
> + Misc/python-config.in | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Misc/python-config.in b/Misc/python-config.in
> +index 727c4a8..c702829 100644
> +--- a/Misc/python-config.in
> ++++ b/Misc/python-config.in
> +@@ -6,7 +6,7 @@
>   import getopt
>   import os
>   import sys
> @@ -24,8 +32,8 @@ Index: Python-3.3.3/Misc/python-config.in
>  +from distutils import sysconfig
>
>   valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
> -               'ldflags', 'extension-suffix', 'help', 'abiflags', 'configdir']
> -@@ -32,14 +32,14 @@ if '--help' in opt_flags:
> +               'ldflags', 'extension-suffix', 'help', 'abiflags', 'configdir',
> +@@ -35,14 +35,14 @@ if '--help' in opt_flags:
>
>   for opt in opt_flags:
>       if opt == '--prefix':
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index dba92b0e396..ebfc10b4045 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -213,8 +213,8 @@
>              "${bindir}/python3",
>              "${bindir}/python${PYTHON_MAJMIN}",
>              "${bindir}/python${PYTHON_MAJMIN}.real",
> -            "${bindir}/python${PYTHON_BINABI}",
> -            "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
> +            "${bindir}/python${PYTHON_MAJMIN}",
> +            "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>              "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]",
>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>              "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
> diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.8.0.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3_3.7.5.bb
> rename to meta/recipes-devtools/python/python3_3.8.0.bb
> index 57eaaea5e7c..1feaebea8ee 100644
> --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.0.bb
> @@ -19,8 +19,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
>             file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
>             file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
> -           file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
> -           file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
>             file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
>             file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
>             file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
> @@ -35,20 +33,16 @@ SRC_URI_append_class-native = " \
>             file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             "
> -SRC_URI_append_class-nativesdk = " \
> -           file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
> -           "
>
> -SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
> -SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
> +SRC_URI[md5sum] = "dbac8df9d8b9edc678d0f4cacdb7dbb0"
> +SRC_URI[sha256sum] = "b356244e13fb5491da890b35b13b2118c3122977c2cd825e3eb6e7d462030d84"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>
>  CVE_PRODUCT = "python"
>
> -PYTHON_MAJMIN = "3.7"
> -PYTHON_BINABI = "${PYTHON_MAJMIN}m"
> +PYTHON_MAJMIN = "3.8"
>
>  S = "${WORKDIR}/Python-${PV}"
>
> @@ -59,8 +53,8 @@ inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
>  MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
>
>  ALTERNATIVE_${PN}-dev = "python3-config"
> -ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_BINABI}-config"
> -ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> +ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
> +ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
>
>
>  DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
> @@ -131,7 +125,7 @@ do_install_prepend() {
>  }
>
>  do_install_append_class-target() {
> -        oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
>  }
>
>  do_install_append_class-native() {
> @@ -161,7 +155,7 @@ do_install_append() {
>  }
>
>  do_install_append_class-nativesdk () {
> -    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} OEPYTHON3HOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
> +    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
>  }
>
>  SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> @@ -177,7 +171,7 @@ py_package_preprocess () {
>                  -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
>                  ${PKGD}/${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
>                  ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
> -                ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> +                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
>
>          # Reformat _sysconfigdata after modifying it so that it remains
>          # reproducible
> @@ -196,7 +190,7 @@ py_package_preprocess () {
>               -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
>          cd -
>
> -        mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> +        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
>
>          #Remove the unneeded copy of target sysconfig data
>          rm -rf ${PKGD}/${libdir}/python-sysconfigdata
> @@ -322,7 +316,7 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
>  # package libpython3
>  PACKAGES =+ "libpython3 libpython3-staticdev"
>  FILES_libpython3 = "${libdir}/libpython*.so.*"
> -FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> +FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
>  INSANE_SKIP_${PN}-dev += "dev-elf"
>
>  # catch all the rest (unsorted)
> @@ -341,3 +335,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
>  RDEPENDS_${PN}-dev = ""
>
> +RDEPENDS_${PN}-tests_append_class-target = " bash"
> +RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

