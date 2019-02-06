Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 00E72605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 18:03:07 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id z18so4805556qkj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 10:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KpbXsrkJwpX7nBrFMDrZzFRGgYY/CczWyYU4Phr85p4=;
	b=XnqyR6TwAYNifylknsi30vjbR0FJ6pSEwVA0kerqg7It4EM6UDhS91qhIoB40eQhxV
	kRI78P1y+MNO1L1S6EGNjO3CfU9v2+q4FqFL2shI/Uk0NUQR0ttPpcx9ri8OHMf7zRnR
	tPe1pzKir31uW9COu+BbBxHxF1qfA4++6gY1c6Yk99vsr3kpurT3HSgrL3wcDr6PpER3
	Kx5QWMjz1bc7Rn7tOkST0Jr3o1ERqpQlZ+vSdxVaZ303zu5YkqFVsH2TQRnKEdfwe7Ko
	eQvzgzecLR4En5eyQzj8MitSYsdy4rzgaKS2VrypuhcpEk7rC7rfP+TTysYiIud5dKho
	s7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KpbXsrkJwpX7nBrFMDrZzFRGgYY/CczWyYU4Phr85p4=;
	b=p0LXkmo1jRTMPh0FmzdhDiTdR8r2Nl2sl9pbf+UDyuCTChKg+4ACZi5MWAR8VjJu+q
	5E7J8QBjyz/Wsdza++grUpKygsUxZLMa+8zUZU+/D9UulZSm1KFVNP9paRKc+vTh3PMh
	zn8MypjSfjzr4XwnlSo/ex6HzWBUKYzdXUjFB3Xw4fsOQx/sdzhHu2Vt6Zx3E34Tm2KZ
	zcBdL1lSQjtnsiocuaJTxaMZrFH/SCaBqZTN4kLCOPAokNQQhSYzlKEz4gTX8Eu5zjwT
	nzjB0ovsWxPp5zr9oI7idmvpPGlX8lpNU3mT31qO/rU7M2z9355pqJmSUvCP0iHHmkSP
	ijRA==
X-Gm-Message-State: AHQUAuaghj7TRdc/moNHZeiO1VyYJq7V5L1a+tK6cv6+TLeROMmZvxTe
	cnKxT8pnOfkJZ6WJJ+dCcdzXeeZ8fcKQAyt2w3g=
X-Google-Smtp-Source: AHgI3IbPbx7hv06pU/MmrGWQSwW4xl00sA4op9aO1Wgv6st5EtLGHxDdgEl8nS1vJqfq2YYse/3zjosV+PY94UW4LXA=
X-Received: by 2002:a37:9585:: with SMTP id x127mr7492013qkd.315.1549476187184;
	Wed, 06 Feb 2019 10:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20190206162636.72755-1-alex.kanavin@gmail.com>
In-Reply-To: <20190206162636.72755-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Feb 2019 10:02:40 -0800
Message-ID: <CAMKF1soPLCT8gZOYJf-1LQ-rWv_+68QzmTqRruRnmbeLi0WDjg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] python3: upgrade to 3.7.2
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
X-List-Received-Date: Wed, 06 Feb 2019 18:03:08 -0000
Content-Type: text/plain; charset="UTF-8"

Alex

Here are couple of failures I see

https://errors.yoctoproject.org/Errors/Details/221405/
https://errors.yoctoproject.org/Errors/Details/221458/

On Wed, Feb 6, 2019 at 8:26 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> I took the same approach as the recent perl upgrade: write recipe from scratch,
> taking the pieces from the old recipe only when they were proven to be necessary.
>
> The pgo, manifest and ptest features are all preserved.
>
> New features:
>
> - native and target recipes are now unified into one recipe
>
> - check_build_completeness.py runs right after do_compile() and verifies that
> all optional modules have been built (a notorious source of regressions)
>
> - a new approach to sysconfig.py and distutils/sysconfig.py returning values
> appropriate for native or target builds: we copy the configuration file to a
> separate folder, add that folder to sys.path (through environment variable
> that differs between native and target builds), and point python to the file
> through another environment variable.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/python3-dir.bbclass              |    2 +-
>  meta/classes/python3native.bbclass            |    2 +
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |   25 +
>  ...lib-as-location-for-site-packages-an.patch |  196 +++
>  ...hell-version-of-python-config-that-w.patch |   35 +
>  ...-qemu-wrapper-when-gathering-profile.patch |   25 +
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |   42 +
>  ...tutils-prefix-is-inside-staging-area.patch |   54 +
>  .../python3/avoid_warning_about_tkinter.patch |   36 +
>  .../python-sanity/python3/cgi_py.patch        |   32 +
>  .../python3/check_build_completeness.py       |   17 +
>  .../python-sanity/python3/create_manifest3.py |  433 ++++++
>  .../python-sanity/python3/get_module_deps3.py |  146 ++
>  .../python-sanity/python3/python-config.patch |   46 +
>  .../python3/python3-manifest.json             | 1228 +++++++++++++++++
>  .../python-sanity/python3/run-ptest           |    3 +
>  .../python-sanity/python3_3.7.2.bb            |  284 ++++
>  17 files changed, 2605 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/avoid_warning_about_tkinter.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/cgi_py.patch
>  create mode 100755 meta/recipes-devtools/python-sanity/python3/check_build_completeness.py
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/create_manifest3.py
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/get_module_deps3.py
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/python-config.patch
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/python3-manifest.json
>  create mode 100644 meta/recipes-devtools/python-sanity/python3/run-ptest
>  create mode 100644 meta/recipes-devtools/python-sanity/python3_3.7.2.bb
>
> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
> index 06bb046d9c2..7dd130bad99 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,4 +1,4 @@
> -PYTHON_BASEVERSION = "3.5"
> +PYTHON_BASEVERSION = "3.7"
>  PYTHON_ABI = "m"
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_PN = "python3"
> diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
> index da12a714703..a3acaf61bbd 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -9,6 +9,8 @@ DEPENDS_append = " python3-native "
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +
>  # suppress host user's site-packages dirs.
>  export PYTHONNOUSERSITE = "1"
>
> diff --git a/meta/recipes-devtools/python-sanity/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> new file mode 100644
> index 00000000000..09f279ba1d7
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> @@ -0,0 +1,25 @@
> +From 23294c6ba6896115828293fdb7e67b47b38ba675 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 25 Jan 2019 19:04:13 +0100
> +Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
> + contamination
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index b4357e3..fbec00d 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -856,7 +856,6 @@ class PyBuildExt(build_ext):
> +                                                      'termcap'):
> +                 readline_libs.append('termcap')
> +             exts.append( Extension('readline', ['readline.c'],
> +-                                   library_dirs=['/usr/lib/termcap'],
> +                                    extra_link_args=readline_extra_link_args,
> +                                    libraries=readline_libs) )
> +         else:
> diff --git a/meta/recipes-devtools/python-sanity/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> new file mode 100644
> index 00000000000..661f52d01ff
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> @@ -0,0 +1,196 @@
> +From 0fbdad1eaf541a8e92be81f39514cd249b3b0801 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 5 Feb 2019 15:52:02 +0100
> +Subject: [PATCH] Do not hardcode "lib" as location for modules, site-packages
> + and lib-dynload
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + Include/pythonrun.h  |  2 ++
> + Lib/site.py          |  4 ++--
> + Makefile.pre.in      |  5 +++--
> + Modules/getpath.c    | 18 ++++++++++++------
> + Python/getplatform.c | 10 ++++++++++
> + Python/sysmodule.c   |  2 ++
> + 6 files changed, 31 insertions(+), 10 deletions(-)
> +
> +diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> +index 6f0c6fc..0a17edd 100644
> +--- a/Include/pythonrun.h
> ++++ b/Include/pythonrun.h
> +@@ -7,6 +7,8 @@
> + extern "C" {
> + #endif
> +
> ++PyAPI_FUNC(const char *) Py_GetLib(void);
> ++
> + #ifndef Py_LIMITED_API
> + PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
> + PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
> +diff --git a/Lib/site.py b/Lib/site.py
> +index ffd132b..b55f6d8 100644
> +--- a/Lib/site.py
> ++++ b/Lib/site.py
> +@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
> +         seen.add(prefix)
> +
> +         if os.sep == '/':
> +-            sitepackages.append(os.path.join(prefix, "lib",
> ++            sitepackages.append(os.path.join(prefix, sys.lib,
> +                                         "python%d.%d" % sys.version_info[:2],
> +                                         "site-packages"))
> +         else:
> +             sitepackages.append(prefix)
> +-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
> ++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
> +     return sitepackages
> +
> + def addsitepackages(known_paths, prefixes=None):
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 6e81b2f..671a20e 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -142,7 +142,7 @@ LIBDIR=            @libdir@
> + MANDIR=               @mandir@
> + INCLUDEDIR=   @includedir@
> + CONFINCLUDEDIR=       $(exec_prefix)/include
> +-SCRIPTDIR=    $(prefix)/lib
> ++SCRIPTDIR=    @libdir@
> + ABIFLAGS=     @ABIFLAGS@
> +
> + # Detailed destination directories
> +@@ -768,6 +768,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
> +               -DEXEC_PREFIX='"$(exec_prefix)"' \
> +               -DVERSION='"$(VERSION)"' \
> +               -DVPATH='"$(VPATH)"' \
> ++              -DLIB='"$(LIB)"' \
> +               -o $@ $(srcdir)/Modules/getpath.c
> +
> + Programs/python.o: $(srcdir)/Programs/python.c
> +@@ -856,7 +857,7 @@ regen-opcode:
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> +
> + Python/getplatform.o: $(srcdir)/Python/getplatform.c
> +-              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
> ++              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
> +
> + Python/importdl.o: $(srcdir)/Python/importdl.c
> +               $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
> +diff --git a/Modules/getpath.c b/Modules/getpath.c
> +index e6a3e8e..0c62af6 100644
> +--- a/Modules/getpath.c
> ++++ b/Modules/getpath.c
> +@@ -123,6 +123,7 @@ typedef struct {
> +     wchar_t *exec_prefix;              /* EXEC_PREFIX define */
> +
> +     wchar_t *lib_python;               /* "lib/pythonX.Y" */
> ++    wchar_t *multilib_python;               /* "lib[suffix]/pythonX.Y" */
> +     wchar_t argv0_path[MAXPATHLEN+1];
> +     wchar_t zip_path[MAXPATHLEN+1];    /* ".../lib/pythonXY.zip" */
> +
> +@@ -314,7 +315,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> +         if (delim) {
> +             *delim = L'\0';
> +         }
> +-        joinpath(prefix, calculate->lib_python);
> ++        joinpath(prefix, calculate->multilib_python);
> +         joinpath(prefix, LANDMARK);
> +         return 1;
> +     }
> +@@ -343,7 +344,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> +     copy_absolute(prefix, calculate->argv0_path, MAXPATHLEN+1);
> +     do {
> +         n = wcslen(prefix);
> +-        joinpath(prefix, calculate->lib_python);
> ++        joinpath(prefix, calculate->multilib_python);
> +         joinpath(prefix, LANDMARK);
> +         if (ismodule(prefix)) {
> +             return 1;
> +@@ -355,7 +356,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> +     /* Look at configure's PREFIX */
> +     wcsncpy(prefix, calculate->prefix, MAXPATHLEN);
> +     prefix[MAXPATHLEN] = L'\0';
> +-    joinpath(prefix, calculate->lib_python);
> ++    joinpath(prefix, calculate->multilib_python);
> +     joinpath(prefix, LANDMARK);
> +     if (ismodule(prefix)) {
> +         return 1;
> +@@ -427,7 +428,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> +             wcsncpy(exec_prefix, core_config->home, MAXPATHLEN);
> +         }
> +         exec_prefix[MAXPATHLEN] = L'\0';
> +-        joinpath(exec_prefix, calculate->lib_python);
> ++        joinpath(exec_prefix, calculate->multilib_python);
> +         joinpath(exec_prefix, L"lib-dynload");
> +         return 1;
> +     }
> +@@ -464,7 +465,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> +     copy_absolute(exec_prefix, calculate->argv0_path, MAXPATHLEN+1);
> +     do {
> +         n = wcslen(exec_prefix);
> +-        joinpath(exec_prefix, calculate->lib_python);
> ++        joinpath(exec_prefix, calculate->multilib_python);
> +         joinpath(exec_prefix, L"lib-dynload");
> +         if (isdir(exec_prefix)) {
> +             return 1;
> +@@ -476,7 +477,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_config,
> +     /* Look at configure's EXEC_PREFIX */
> +     wcsncpy(exec_prefix, calculate->exec_prefix, MAXPATHLEN);
> +     exec_prefix[MAXPATHLEN] = L'\0';
> +-    joinpath(exec_prefix, calculate->lib_python);
> ++    joinpath(exec_prefix, calculate->multilib_python);
> +     joinpath(exec_prefix, L"lib-dynload");
> +     if (isdir(exec_prefix)) {
> +         return 1;
> +@@ -871,6 +872,10 @@ calculate_init(PyCalculatePath *calculate,
> +     if (!calculate->lib_python) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> ++    calculate->multilib_python = Py_DecodeLocale(LIB "/python" VERSION, &len);
> ++    if (!calculate->multilib_python) {
> ++        return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> ++    }
> +     return _Py_INIT_OK();
> + }
> +
> +@@ -882,6 +887,7 @@ calculate_free(PyCalculatePath *calculate)
> +     PyMem_RawFree(calculate->prefix);
> +     PyMem_RawFree(calculate->exec_prefix);
> +     PyMem_RawFree(calculate->lib_python);
> ++    PyMem_RawFree(calculate->multilib_python);
> +     PyMem_RawFree(calculate->path_env);
> + }
> +
> +diff --git a/Python/getplatform.c b/Python/getplatform.c
> +index 81a0f7a..d55396b 100644
> +--- a/Python/getplatform.c
> ++++ b/Python/getplatform.c
> +@@ -10,3 +10,13 @@ Py_GetPlatform(void)
> + {
> +     return PLATFORM;
> + }
> ++
> ++#ifndef LIB
> ++#define LIB "lib"
> ++#endif
> ++
> ++const char *
> ++Py_GetLib(void)
> ++{
> ++      return LIB;
> ++}
> +diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> +index efe5b29..de77b17 100644
> +--- a/Python/sysmodule.c
> ++++ b/Python/sysmodule.c
> +@@ -2319,6 +2319,8 @@ _PySys_BeginInit(PyObject **sysmod)
> +                         PyUnicode_FromString(Py_GetCopyright()));
> +     SET_SYS_FROM_STRING("platform",
> +                         PyUnicode_FromString(Py_GetPlatform()));
> ++    SET_SYS_FROM_STRING("lib",
> ++                        PyUnicode_FromString(Py_GetLib()));
> +     SET_SYS_FROM_STRING("maxsize",
> +                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
> +     SET_SYS_FROM_STRING("float_info",
> diff --git a/meta/recipes-devtools/python-sanity/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> new file mode 100644
> index 00000000000..83fd52d87f4
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -0,0 +1,35 @@
> +From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 29 Jan 2019 15:03:01 +0100
> +Subject: [PATCH] Do not use the shell version of python-config that was
> + introduced in 3.4
> +
> +Revert instead to the original python version: it has our tweaks and
> +outputs directories correctly.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.pre.in | 9 +++------
> + 1 file changed, 3 insertions(+), 6 deletions(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 2d2e11f..cc19942 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
> +       @ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
> +       LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
> +-      @ # On Darwin, always use the python version of the script, the shell
> +-      @ # version doesn't use the compiler customizations that are provided
> +-      @ # in python (_osx_support.py).
> +-      @if test `uname -s` = Darwin; then \
> +-              cp python-config.py python-config; \
> +-      fi
> ++      @  # In OpenEmbedded, always use the python version of the script, the shell
> ++      @  # version is broken in multiple ways, and doesn't return correct directories
> ++      cp python-config.py python-config
> +
> +
> + # Install the include files
> diff --git a/meta/recipes-devtools/python-sanity/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python-sanity/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> new file mode 100644
> index 00000000000..fa7735ff93e
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> @@ -0,0 +1,25 @@
> +From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 30 Jan 2019 12:41:04 +0100
> +Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.pre.in | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index a3a02a7..d5503dd 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -507,8 +507,7 @@ build_all_generate_profile:
> +       $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LDFLAGS_NODIST="$(LDFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
> +
> + run_profile_task:
> +-      @ # FIXME: can't run for a cross build
> +-      $(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
> ++      ./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support || true
> +
> + build_all_merge_profile:
> +       $(LLVM_PROF_MERGER)
> diff --git a/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> new file mode 100644
> index 00000000000..56f7f713112
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -0,0 +1,42 @@
> +From 5b2885fd3eaf05b4397385195872d4ec8240a47c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 31 Jan 2019 16:46:30 +0100
> +Subject: [PATCH] distutils/sysconfig: append
> + STAGING_LIBDIR/python-sysconfigdata to sys.path
> +
> +So that target configuration can be used when running native python
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + Lib/distutils/sysconfig.py | 2 ++
> + Lib/sysconfig.py           | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> +index e07a6c8..6b8c129 100644
> +--- a/Lib/distutils/sysconfig.py
> ++++ b/Lib/distutils/sysconfig.py
> +@@ -421,6 +421,8 @@ def _init_posix():
> +         platform=sys.platform,
> +         multiarch=getattr(sys.implementation, '_multiarch', ''),
> +     ))
> ++    if 'STAGING_LIBDIR' in os.environ:
> ++        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
> +     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> +     build_time_vars = _temp.build_time_vars
> +     global _config_vars
> +diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> +index 9ee4d31..e586abd 100644
> +--- a/Lib/sysconfig.py
> ++++ b/Lib/sysconfig.py
> +@@ -412,6 +412,8 @@ def _init_posix(vars):
> +     """Initialize the module as appropriate for POSIX systems."""
> +     # _sysconfigdata is generated at build time, see _generate_posix_vars()
> +     name = _get_sysconfigdata_name()
> ++    if 'STAGING_LIBDIR' in os.environ:
> ++        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
> +     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> +     build_time_vars = _temp.build_time_vars
> +     vars.update(build_time_vars)
> diff --git a/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
> new file mode 100644
> index 00000000000..28c9cc93c03
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -0,0 +1,54 @@
> +From 58ad4e8033f5b1c1b6e4a5ab0d262b29451d49e8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 14 May 2013 15:00:26 -0700
> +Subject: [PATCH] python3: Add target and native recipes
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +02/2015 Rebased for Python 3.4.2
> +
> +# The proper prefix is inside our staging area.
> +# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> +# Signed-off-by: Phil Blundell <philb@gnu.org>
> +# Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +# Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> +
> +---
> + Lib/distutils/sysconfig.py | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> +index 6b8c129..3ca7f79 100644
> +--- a/Lib/distutils/sysconfig.py
> ++++ b/Lib/distutils/sysconfig.py
> +@@ -84,7 +84,9 @@ def get_python_inc(plat_specific=0, prefix=None):
> +     If 'prefix' is supplied, use it instead of sys.base_prefix or
> +     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
> +     """
> +-    if prefix is None:
> ++    if prefix is None and os.environ['STAGING_INCDIR'] != "":
> ++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
> ++    elif prefix is None:
> +         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
> +     if os.name == "posix":
> +         if python_build:
> +@@ -122,6 +124,10 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
> +     If 'prefix' is supplied, use it instead of sys.base_prefix or
> +     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
> +     """
> ++    lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
> ++    if prefix is None and os.environ['STAGING_LIBDIR'] != "":
> ++        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
> ++
> +     if prefix is None:
> +         if standard_lib:
> +             prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
> +@@ -130,7 +136,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
> +
> +     if os.name == "posix":
> +         libpython = os.path.join(prefix,
> +-                                 "lib", "python" + get_python_version())
> ++                                 lib_basename, "python" + get_python_version())
> +         if standard_lib:
> +             return libpython
> +         else:
> diff --git a/meta/recipes-devtools/python-sanity/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python-sanity/python3/avoid_warning_about_tkinter.patch
> new file mode 100644
> index 00000000000..24e67b4ca14
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/avoid_warning_about_tkinter.patch
> @@ -0,0 +1,36 @@
> +From fead48c8b501a8d7c3db21df2e599f90f38f11d3 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei@gherzan.ro>
> +Date: Mon, 28 Jan 2019 15:57:54 +0000
> +Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is not yet
> + integrated in yocto so we skip the check for this module. Avoid a warning by
> + not adding this module to missing variable.
> +
> +Upstream-Status: Inappropriate [distribution]
> +
> +Also simply disable the tk module since its not in DEPENDS.
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +
> +---
> + setup.py | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index fbec00d..b7a36a6 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1623,10 +1623,12 @@ class PyBuildExt(build_ext):
> +         self.extensions.extend(exts)
> +
> +         # Call the method for detecting whether _tkinter can be compiled
> +-        self.detect_tkinter(inc_dirs, lib_dirs)
> ++        # self.detect_tkinter(inc_dirs, lib_dirs)
> +
> +-        if '_tkinter' not in [e.name for e in self.extensions]:
> +-            missing.append('_tkinter')
> ++        # tkinter module will not be avalaible as yocto
> ++        # doesn't have tk integrated (yet)
> ++        #if '_tkinter' not in [e.name for e in self.extensions]:
> ++        #    missing.append('_tkinter')
> +
> +         # Build the _uuid module if possible
> +         uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> diff --git a/meta/recipes-devtools/python-sanity/python3/cgi_py.patch b/meta/recipes-devtools/python-sanity/python3/cgi_py.patch
> new file mode 100644
> index 00000000000..6c4ba54320b
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/cgi_py.patch
> @@ -0,0 +1,32 @@
> +From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001
> +From: Mark Hatle <mark.hatle@windriver.com>
> +Date: Wed, 21 Sep 2011 20:55:33 -0500
> +Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
> +
> +Upstream-Status: Inappropriate [distribution]
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +---
> + Lib/cgi.py | 11 +----------
> + 1 file changed, 1 insertion(+), 10 deletions(-)
> +
> +diff --git a/Lib/cgi.py b/Lib/cgi.py
> +index 8cf6687..094c7b4 100755
> +--- a/Lib/cgi.py
> ++++ b/Lib/cgi.py
> +@@ -1,13 +1,4 @@
> +-#! /usr/local/bin/python
> +-
> +-# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
> +-# intentionally NOT "/usr/bin/env python".  On many systems
> +-# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
> +-# scripts, and /usr/local/bin is the default directory where Python is
> +-# installed, so /usr/bin/env would be unable to find python.  Granted,
> +-# binary installations by Linux vendors often install Python in
> +-# /usr/bin.  So let those vendors patch cgi.py to match their choice
> +-# of installation.
> ++#! /usr/bin/env python
> +
> + """Support module for CGI (Common Gateway Interface) scripts.
> +
> diff --git a/meta/recipes-devtools/python-sanity/python3/check_build_completeness.py b/meta/recipes-devtools/python-sanity/python3/check_build_completeness.py
> new file mode 100755
> index 00000000000..a1eace3f571
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/check_build_completeness.py
> @@ -0,0 +1,17 @@
> +#!/usr/bin/env python3
> +import sys
> +logfile = open(sys.argv[1]).read()
> +
> +necessary_bits = logfile.find("The necessary bits to build these optional modules were not found")
> +to_find_bits = logfile.find("To find the necessary bits, look in setup.py in detect_modules() for the module's name.")
> +if necessary_bits != -1:
> +    print("%s" %(logfile[necessary_bits:to_find_bits]))
> +
> +failed_to_build = logfile.find("Failed to build these modules:")
> +if failed_to_build != -1:
> +    failed_to_build_end = logfile.find("\n\n", failed_to_build)
> +    print("%s" %(logfile[failed_to_build:failed_to_build_end]))
> +
> +if necessary_bits != -1 or failed_to_build != -1:
> +    sys.exit(1)
> +
> diff --git a/meta/recipes-devtools/python-sanity/python3/create_manifest3.py b/meta/recipes-devtools/python-sanity/python3/create_manifest3.py
> new file mode 100644
> index 00000000000..4da02a2991a
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/create_manifest3.py
> @@ -0,0 +1,433 @@
> +# This script is used as a bitbake task to create a new python manifest
> +# $ bitbake python -c create_manifest
> +#
> +# Our goal is to keep python-core as small as posible and add other python
> +# packages only when the user needs them, hence why we split upstream python
> +# into several packages.
> +#
> +# In a very simplistic way what this does is:
> +# Launch python and see specifically what is required for it to run at a minimum
> +#
> +# Go through the python-manifest file and launch a separate task for every single
> +# one of the files on each package, this task will check what was required for that
> +# specific module to run, these modules will be called dependencies.
> +# The output of such task will be a list of the modules or dependencies that were
> +# found for that file.
> +#
> +# Such output will be parsed by this script, we will look for each dependency on the
> +# manifest and if we find that another package already includes it, then we will add
> +# that package as an RDEPENDS to the package we are currently checking; in case we dont
> +# find the current dependency on any other package we will add it to the current package
> +# as part of FILES.
> +#
> +#
> +# This way we will create a new manifest from the data structure that was built during
> +# this process, on this new manifest each package will contain specifically only
> +# what it needs to run.
> +#
> +# There are some caveats which we try to deal with, such as repeated files on different
> +# packages, packages that include folders, wildcards, and special packages.
> +# Its also important to note that this method only works for python files, and shared
> +# libraries. Static libraries, header files and binaries need to be dealt with manually.
> +#
> +# This script differs from its python2 version mostly on how shared libraries are handled
> +# The manifest file for python3 has an extra field which contains the cached files for
> +# each package.
> +# Tha method to handle cached files does not work when a module includes a folder which
> +# itself contains the pycache folder, gladly this is almost never the case.
> +#
> +# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmail dot com>
> +
> +
> +import sys
> +import subprocess
> +import json
> +import os
> +import collections
> +
> +# Get python version from ${PYTHON_MAJMIN}
> +pyversion = str(sys.argv[1])
> +
> +# Hack to get native python search path (for folders), not fond of it but it works for now
> +pivot = 'recipe-sysroot-native'
> +for p in sys.path:
> +    if pivot in p:
> +        nativelibfolder = p[:p.find(pivot)+len(pivot)]
> +
> +# Empty dict to hold the whole manifest
> +new_manifest = collections.OrderedDict()
> +
> +# Check for repeated files, folders and wildcards
> +allfiles = []
> +repeated = []
> +wildcards = []
> +
> +hasfolders = []
> +allfolders = []
> +
> +def isFolder(value):
> +    value = value.replace('${PYTHON_MAJMIN}',pyversion)
> +    if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
> +        return True
> +    else:
> +        return False
> +
> +def isCached(item):
> +    if '__pycache__' in item:
> +        return True
> +    else:
> +        return False
> +
> +def prepend_comments(comments, json_manifest):
> +    with open(json_manifest, 'r+') as manifest:
> +        json_contents = manifest.read()
> +        manifest.seek(0, 0)
> +        manifest.write(comments + json_contents)
> +
> +# Read existing JSON manifest
> +with open('python3-manifest.json') as manifest:
> +    # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
> +    manifest_str =  manifest.read()
> +    json_start = manifest_str.find('# EOC') + 6 # EOC + \n
> +    manifest.seek(0)
> +    comments = manifest.read(json_start)
> +    manifest_str = manifest.read()
> +    old_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
> +
> +#
> +# First pass to get core-package functionality, because we base everything on the fact that core is actually working
> +# Not exactly the same so it should not be a function
> +#
> +
> +print ('Getting dependencies for package: core')
> +
> +
> +# This special call gets the core dependencies and
> +# appends to the old manifest so it doesnt hurt what it
> +# currently holds.
> +# This way when other packages check for dependencies
> +# on the new core package, they will still find them
> +# even when checking the old_manifest
> +
> +output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
> +for coredep in output.split():
> +    coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
> +    if isCached(coredep):
> +        if coredep not in old_manifest['core']['cached']:
> +            old_manifest['core']['cached'].append(coredep)
> +    else:
> +        if coredep not in old_manifest['core']['files']:
> +            old_manifest['core']['files'].append(coredep)
> +
> +
> +# The second step is to loop through the existing files contained in the core package
> +# according to the old manifest, identify if they are  modules, or some other type
> +# of file that we cant import (directories, binaries, configs) in which case we
> +# can only assume they were added correctly (manually) so we ignore those and
> +# pass them to the manifest directly.
> +
> +for filedep in old_manifest['core']['files']:
> +    if isFolder(filedep):
> +        if isCached(filedep):
> +            if filedep not in old_manifest['core']['cached']:
> +                old_manifest['core']['cached'].append(filedep)
> +        else:
> +            if filedep not in old_manifest['core']['files']:
> +                old_manifest['core']['files'].append(filedep)
> +        continue
> +    if '${bindir}' in filedep:
> +        if filedep not in old_manifest['core']['files']:
> +            old_manifest['core']['files'].append(filedep)
> +        continue
> +    if filedep == '':
> +        continue
> +    if '${includedir}' in filedep:
> +        if filedep not in old_manifest['core']['files']:
> +            old_manifest['core']['files'].append(filedep)
> +        continue
> +
> +    # Get actual module name , shouldnt be affected by libdir/bindir, etc.
> +    pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
> +
> +
> +    # We now know that were dealing with a python module, so we can import it
> +    # and check what its dependencies are.
> +    # We launch a separate task for each module for deterministic behavior.
> +    # Each module will only import what is necessary for it to work in specific.
> +    # The output of each task will contain each module's dependencies
> +
> +    print ('Getting dependencies for module: %s' % pymodule)
> +    output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
> +    print ('The following dependencies were found for module %s:\n' % pymodule)
> +    print (output)
> +
> +
> +    for pymodule_dep in output.split():
> +        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
> +
> +        if isCached(pymodule_dep):
> +            if pymodule_dep not in old_manifest['core']['cached']:
> +                old_manifest['core']['cached'].append(pymodule_dep)
> +        else:
> +            if pymodule_dep not in old_manifest['core']['files']:
> +                old_manifest['core']['files'].append(pymodule_dep)
> +
> +
> +# At this point we are done with the core package.
> +# The old_manifest dictionary is updated only for the core package because
> +# all others will use this a base.
> +
> +
> +# To improve the script speed, we check which packages contain directories
> +# since we will be looping through (only) those later.
> +for pypkg in old_manifest:
> +    for filedep in old_manifest[pypkg]['files']:
> +        if isFolder(filedep):
> +            print ('%s is a folder' % filedep)
> +            if pypkg not in hasfolders:
> +                hasfolders.append(pypkg)
> +            if filedep not in allfolders:
> +                allfolders.append(filedep)
> +
> +
> +
> +# This is the main loop that will handle each package.
> +# It works in a similar fashion than the step before, but
> +# we will now be updating a new dictionary that will eventually
> +# become the new manifest.
> +#
> +# The following loops though all packages in the manifest,
> +# through all files on each of them, and checks whether or not
> +# they are modules and can be imported.
> +# If they can be imported, then it checks for dependencies for
> +# each of them by launching a separate task.
> +# The output of that task is then parsed and the manifest is updated
> +# accordingly, wether it should add the module on FILES for the current package
> +# or if that module already belongs to another package then the current one
> +# will RDEPEND on it
> +
> +for pypkg in old_manifest:
> +    # Use an empty dict as data structure to hold data for each package and fill it up
> +    new_manifest[pypkg] = collections.OrderedDict()
> +    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
> +    new_manifest[pypkg]['rdepends'] = []
> +    new_manifest[pypkg]['files'] = []
> +    new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
> +
> +    # All packages should depend on core
> +    if pypkg != 'core':
> +        new_manifest[pypkg]['rdepends'].append('core')
> +        new_manifest[pypkg]['cached'] = []
> +
> +    print('\n')
> +    print('--------------------------')
> +    print ('Handling package %s' % pypkg)
> +    print('--------------------------')
> +
> +    # Handle special cases, we assume that when they were manually added
> +    # to the manifest we knew what we were doing.
> +    special_packages = ['misc', 'modules', 'dev', 'tests']
> +    if pypkg in special_packages or 'staticdev' in pypkg:
> +        print('Passing %s package directly' % pypkg)
> +        new_manifest[pypkg] = old_manifest[pypkg]
> +        continue
> +
> +    for filedep in old_manifest[pypkg]['files']:
> +        # We already handled core on the first pass, we can ignore it now
> +        if pypkg == 'core':
> +            if filedep not in new_manifest[pypkg]['files']:
> +                new_manifest[pypkg]['files'].append(filedep)
> +            continue
> +
> +        # Handle/ignore what we cant import
> +        if isFolder(filedep):
> +            new_manifest[pypkg]['files'].append(filedep)
> +            # Asyncio (and others) are both the package and the folder name, we should not skip those...
> +            path,mod = os.path.split(filedep)
> +            if mod != pypkg:
> +                continue
> +        if '${bindir}' in filedep:
> +            if filedep not in new_manifest[pypkg]['files']:
> +                new_manifest[pypkg]['files'].append(filedep)
> +            continue
> +        if filedep == '':
> +            continue
> +        if '${includedir}' in filedep:
> +            if filedep not in new_manifest[pypkg]['files']:
> +                new_manifest[pypkg]['files'].append(filedep)
> +            continue
> +
> +        # Get actual module name , shouldnt be affected by libdir/bindir, etc.
> +        # We need to check if the imported module comes from another (e.g. sqlite3.dump)
> +        path,pymodule = os.path.split(filedep)
> +        path = os.path.basename(path)
> +        pymodule = os.path.splitext(os.path.basename(pymodule))[0]
> +
> +        # If this condition is met, it means we need to import it from another module
> +        # or its the folder itself (e.g. unittest)
> +        if path == pypkg:
> +            if pymodule:
> +                pymodule = path + '.' + pymodule
> +            else:
> +                pymodule = path
> +
> +
> +
> +        # We now know that were dealing with a python module, so we can import it
> +        # and check what its dependencies are.
> +        # We launch a separate task for each module for deterministic behavior.
> +        # Each module will only import what is necessary for it to work in specific.
> +        # The output of each task will contain each module's dependencies
> +
> +        print ('\nGetting dependencies for module: %s' % pymodule)
> +        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
> +        print ('The following dependencies were found for module %s:\n' % pymodule)
> +        print (output)
> +
> +        reportFILES = []
> +        reportRDEPS = []
> +
> +        for pymodule_dep in output.split():
> +
> +            # Warning: This first part is ugly
> +            # One of the dependencies that was found, could be inside of one of the folders included by another package
> +            # We need to check if this happens so we can add the package containing the folder as an rdependency
> +            # e.g. Folder encodings contained in codecs
> +            # This would be solved if no packages included any folders
> +
> +            # This can be done in two ways:
> +            # 1 - We assume that if we take out the filename from the path we would get
> +            #   the folder string, then we would check if folder string is in the list of folders
> +            #   This would not work if a package contains a folder which contains another folder
> +            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
> +            #   folder_string would not match any value contained in the list of folders
> +            #
> +            # 2 - We do it the other way around, checking if the folder is contained in the path
> +            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
> +            #   is folder_string inside path/folder1/folder2/filename?,
> +            #   Yes, it works, but we waste a couple of milliseconds.
> +
> +            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
> +            inFolders = False
> +            for folder in allfolders:
> +                # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
> +                # we'll end up with ${libdir}, and we want ${libdir}/xml
> +                if isFolder(pymodule_dep):
> +                    check_path = pymodule_dep
> +                else:
> +                    check_path = os.path.dirname(pymodule_dep)
> +                if folder in check_path :
> +                    inFolders = True # Did we find a folder?
> +                    folderFound = False # Second flag to break inner for
> +                    # Loop only through packages which contain folders
> +                    for pypkg_with_folder in hasfolders:
> +                        if (folderFound == False):
> +                            # print('Checking folder %s on package %s' % (pymodule_dep,pypkg_with_folder))
> +                            for folder_dep in old_manifest[pypkg_with_folder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']:
> +                                if folder_dep == folder:
> +                                    print ('%s folder found in %s' % (folder, pypkg_with_folder))
> +                                    folderFound = True
> +                                    if pypkg_with_folder not in new_manifest[pypkg]['rdepends'] and pypkg_with_folder != pypkg:
> +                                        new_manifest[pypkg]['rdepends'].append(pypkg_with_folder)
> +                        else:
> +                            break
> +
> +            # A folder was found so we're done with this item, we can go on
> +            if inFolders:
> +                continue
> +
> +
> +
> +            # No directories beyond this point
> +            # We might already have this module on the dictionary since it could depend on a (previously checked) module
> +            if pymodule_dep not in new_manifest[pypkg]['files'] and pymodule_dep not in new_manifest[pypkg]['cached']:
> +                # Handle core as a special package, we already did it so we pass it to NEW data structure directly
> +                if pypkg == 'core':
> +                    print('Adding %s to %s FILES' % (pymodule_dep, pypkg))
> +                    if pymodule_dep.endswith('*'):
> +                        wildcards.append(pymodule_dep)
> +                    if isCached(pymodule_dep):
> +                        new_manifest[pypkg]['cached'].append(pymodule_dep)
> +                    else:
> +                        new_manifest[pypkg]['files'].append(pymodule_dep)
> +
> +                    # Check for repeated files
> +                    if pymodule_dep not in allfiles:
> +                        allfiles.append(pymodule_dep)
> +                    else:
> +                        if pymodule_dep not in repeated:
> +                            repeated.append(pymodule_dep)
> +                else:
> +
> +
> +                    # Last step: Figure out if we this belongs to FILES or RDEPENDS
> +                    # We check if this module is already contained on another package, so we add that one
> +                    # as an RDEPENDS, or if its not, it means it should be contained on the current
> +                    # package, and we should add it to FILES
> +                    for possible_rdep in old_manifest:
> +                        # Debug
> +                        # print('Checking %s ' % pymodule_dep + ' in %s' % possible_rdep)
> +                        if pymodule_dep in old_manifest[possible_rdep]['files'] or pymodule_dep in old_manifest[possible_rdep]['cached']:
> +                            # Since were nesting, we need to check its not the same pypkg
> +                            if(possible_rdep != pypkg):
> +                                if possible_rdep not in new_manifest[pypkg]['rdepends']:
> +                                    # Add it to the new manifest data struct as RDEPENDS since it contains something this module needs
> +                                    reportRDEPS.append('Adding %s to %s RDEPENDS, because it contains %s\n' % (possible_rdep, pypkg, pymodule_dep))
> +                                    new_manifest[pypkg]['rdepends'].append(possible_rdep)
> +                                break
> +                    else:
> +
> +                      # Since this module wasnt found on another package, it is not an RDEP,
> +                      # so we add it to FILES for this package.
> +                      # A module shouldn't contain itself (${libdir}/python3/sqlite3 shouldnt be on sqlite3 files)
> +                      if os.path.basename(pymodule_dep) != pypkg:
> +                        reportFILES.append(('Adding %s to %s FILES\n' % (pymodule_dep, pypkg)))
> +                        if isCached(pymodule_dep):
> +                            new_manifest[pypkg]['cached'].append(pymodule_dep)
> +                        else:
> +                            new_manifest[pypkg]['files'].append(pymodule_dep)
> +                        if pymodule_dep.endswith('*'):
> +                            wildcards.append(pymodule_dep)
> +                        if pymodule_dep not in allfiles:
> +                            allfiles.append(pymodule_dep)
> +                        else:
> +                            if pymodule_dep not in repeated:
> +                                repeated.append(pymodule_dep)
> +
> +        print('\n')
> +        print('#################################')
> +        print('Summary for module %s' % pymodule)
> +        print('FILES found for module %s:' % pymodule)
> +        print(''.join(reportFILES))
> +        print('RDEPENDS found for module %s:' % pymodule)
> +        print(''.join(reportRDEPS))
> +        print('#################################')
> +
> +print('The following FILES contain wildcards, please check if they are necessary')
> +print(wildcards)
> +print('The following FILES contain folders, please check if they are necessary')
> +print(hasfolders)
> +
> +
> +# Sort it just so it looks nicer
> +for pypkg in new_manifest:
> +    new_manifest[pypkg]['files'].sort()
> +    new_manifest[pypkg]['cached'].sort()
> +    new_manifest[pypkg]['rdepends'].sort()
> +
> +# Create the manifest from the data structure that was built
> +with open('python3-manifest.json.new','w') as outfile:
> +    json.dump(new_manifest,outfile, indent=4)
> +    outfile.write('\n')
> +
> +prepend_comments(comments,'python3-manifest.json.new')
> +
> +if (repeated):
> +    error_msg = '\n\nERROR:\n'
> +    error_msg += 'The following files are repeated (contained in more than one package),\n'
> +    error_msg += 'this is likely to happen when new files are introduced after an upgrade,\n'
> +    error_msg += 'please check which package should get it,\n modify the manifest accordingly and re-run the create_manifest task:\n'
> +    error_msg += '\n'.join(repeated)
> +    error_msg += '\n'
> +    sys.exit(error_msg)
> +
> diff --git a/meta/recipes-devtools/python-sanity/python3/get_module_deps3.py b/meta/recipes-devtools/python-sanity/python3/get_module_deps3.py
> new file mode 100644
> index 00000000000..fd12baad84e
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/get_module_deps3.py
> @@ -0,0 +1,146 @@
> +# This script is launched on separate task for each python module
> +# It checks for dependencies for that specific module and prints
> +# them out, the output of this execution will have all dependencies
> +# for a specific module, which will be parsed an dealt on create_manifest.py
> +#
> +# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.com>
> +
> +# We can get a log per module, for all the dependencies that were found, but its messy.
> +debug=False
> +
> +import sys
> +
> +# We can get a list of the modules which are currently required to run python
> +# so we run python-core and get its modules, we then import what we need
> +# and check what modules are currently running, if we substract them from the
> +# modules we had initially, we get the dependencies for the module we imported.
> +
> +# We use importlib to achieve this, so we also need to know what modules importlib needs
> +import importlib
> +
> +core_deps=set(sys.modules)
> +
> +def fix_path(dep_path):
> +    import os
> +    # We DONT want the path on our HOST system
> +    pivot='recipe-sysroot-native'
> +    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
> +
> +    if '/usr/bin' in dep_path:
> +        dep_path = dep_path.replace('/usr/bin''${bindir}')
> +
> +    # Handle multilib, is there a better way?
> +    if '/usr/lib32' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib32','${libdir}')
> +    if '/usr/lib64' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib64','${libdir}')
> +    if '/usr/lib' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib','${libdir}')
> +    if '/usr/include' in dep_path:
> +        dep_path = dep_path.replace('/usr/include','${includedir}')
> +    if '__init__.' in dep_path:
> +        dep_path =  os.path.split(dep_path)[0]
> +    return dep_path
> +
> +
> +# Module to import was passed as an argument
> +current_module =  str(sys.argv[1]).rstrip()
> +if(debug==True):
> +    log = open('log_%s' % current_module,'w')
> +    log.write('Module %s generated the following dependencies:\n' % current_module)
> +try:
> +    importlib.import_module('%s' % current_module)
> +except ImportError as e:
> +    if (debug==True):
> +        log.write('Module was not found')
> +    pass
> +
> +
> +# Get current module dependencies, dif will contain a list of specific deps for this module
> +module_deps=set(sys.modules)
> +
> +# We handle the core package (1st pass on create_manifest.py) as a special case
> +if current_module == 'python-core-package':
> +    dif = core_deps
> +else:
> +    # We know this is not the core package, so there must be a difference.
> +    dif = module_deps-core_deps
> +
> +
> +# Check where each dependency came from
> +for item in dif:
> +    dep_path=''
> +    try:
> +        if (debug==True):
> +            log.write('Calling: sys.modules[' + '%s' % item + '].__file__\n')
> +        dep_path = sys.modules['%s' % item].__file__
> +    except AttributeError as e:
> +        # Deals with thread (builtin module) not having __file__ attribute
> +        if debug==True:
> +            log.write(item + ' ')
> +            log.write(str(e))
> +            log.write('\n')
> +        pass
> +    except NameError as e:
> +        # Deals with NameError: name 'dep_path' is not defined
> +        # because module is not found (wasn't compiled?), e.g. bddsm
> +        if (debug==True):
> +            log.write(item+' ')
> +            log.write(str(e))
> +        pass
> +
> +    # Site-customize is a special case since we (OpenEmbedded) put it there manually
> +    if 'sitecustomize' in dep_path:
> +        dep_path = '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
> +        # Prints out result, which is what will be used by create_manifest
> +        print (dep_path)
> +        continue
> +
> +    dep_path = fix_path(dep_path)
> +
> +    import sysconfig
> +    soabi=sysconfig.get_config_var('SOABI')
> +    # Check if its a shared library and deconstruct it
> +    if soabi in dep_path:
> +        if (debug==True):
> +            log.write('Shared library found in %s' % dep_path)
> +        dep_path = dep_path.replace(soabi,'*')
> +        print (dep_path)
> +        continue
> +
> +    if (debug==True):
> +        log.write(dep_path+'\n')
> +    # Prints out result, which is what will be used by create_manifest
> +    print (dep_path)
> +
> +
> +    import imp
> +    cpython_tag = imp.get_tag()
> +    cached=''
> +    # Theres no naive way to find *.pyc files on python3
> +    try:
> +        if (debug==True):
> +            log.write('Calling: sys.modules[' + '%s' % item + '].__cached__\n')
> +        cached = sys.modules['%s' % item].__cached__
> +    except AttributeError as e:
> +        # Deals with thread (builtin module) not having __cached__ attribute
> +        if debug==True:
> +            log.write(item + ' ')
> +            log.write(str(e))
> +            log.write('\n')
> +        pass
> +    except NameError as e:
> +        # Deals with NameError: name 'cached' is not defined
> +        if (debug==True):
> +            log.write(item+' ')
> +            log.write(str(e))
> +        pass
> +    if cached is not None:
> +        if (debug==True):
> +            log.write(cached)
> +        cached = fix_path(cached)
> +        cached = cached.replace(cpython_tag,'*')
> +        print (cached)
> +
> +if debug==True:
> +    log.close()
> diff --git a/meta/recipes-devtools/python-sanity/python3/python-config.patch b/meta/recipes-devtools/python-sanity/python3/python-config.patch
> new file mode 100644
> index 00000000000..f23b8b7df06
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/python-config.patch
> @@ -0,0 +1,46 @@
> +python-config: Revert to using distutils.sysconfig
> +
> +The newer sysconfig module shares some code with distutils.sysconfig, but the same modifications as in
> +
> +12-distutils-prefix-is-inside-staging-area.patch makes distutils.sysconfig
> +
> +affect the native runtime as well as cross building. Use the old, patched
> +implementation which returns paths in the staging directory and for the target,
> +as appropriate.
> +
> +Upstream-Status: Inappropriate [Embedded Specific]
> +
> +Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> +:
> +Index: Python-3.3.3/Misc/python-config.in
> +===================================================================
> +--- Python-3.3.3.orig/Misc/python-config.in
> ++++ Python-3.3.3/Misc/python-config.in
> +@@ -4,7 +4,7 @@
> + import getopt
> + import os
> + import sys
> +-import sysconfig
> ++from distutils import sysconfig
> +
> + valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
> +               'ldflags', 'extension-suffix', 'help', 'abiflags', 'configdir']
> +@@ -32,14 +32,14 @@ if '--help' in opt_flags:
> +
> + for opt in opt_flags:
> +     if opt == '--prefix':
> +-        print(sysconfig.get_config_var('prefix'))
> ++        print(sysconfig.PREFIX)
> +
> +     elif opt == '--exec-prefix':
> +-        print(sysconfig.get_config_var('exec_prefix'))
> ++        print(sysconfig.EXEC_PREFIX)
> +
> +     elif opt in ('--includes', '--cflags'):
> +-        flags = ['-I' + sysconfig.get_path('include'),
> +-                 '-I' + sysconfig.get_path('platinclude')]
> ++        flags = ['-I' + sysconfig.get_python_inc(),
> ++                 '-I' + sysconfig.get_python_inc(plat_specific=True)]
> +         if opt == '--cflags':
> +             flags.extend(getvar('CFLAGS').split())
> +         print(' '.join(flags))
> diff --git a/meta/recipes-devtools/python-sanity/python3/python3-manifest.json b/meta/recipes-devtools/python-sanity/python3/python3-manifest.json
> new file mode 100644
> index 00000000000..24f9805fbd2
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/python3-manifest.json
> @@ -0,0 +1,1228 @@
> +# DO NOT (entirely) modify this file manually, please read.
> +#
> +# IMPORTANT NOTE:
> +# Please keep in mind that the create_manifest task relies on the fact the the
> +# target and native Python packages are the same, and it also needs to be executed
> +# with a fully working native package (with all the PACKAGECONFIGs enabled and all
> +# and all the modules should be working, check log.do_compile), otherwise the script
> +# will fail to find dependencies correctly, this note is valid either if you are
> +# upgrading to a new Python version or adding a new package.
> +#
> +#
> +# If you are adding a new package please follow the next steps:
> +#     How to add a new package:
> +#     - If a user wants to add a new package all that has to be done is:
> +#     Modify the python3-manifest.json file, and add the required file(s) to the FILES list,
> +#     fill up the SUMMARY section as well, the script should handle all the rest.
> +#
> +#     Real example:
> +#     We want to add a web browser package, including the file webbrowser.py
> +#     which at the moment is on python3-misc.
> +#     "webbrowser": {
> +#         "files": ["${libdir}/python${PYTHON_MAJMIN}/lib-dynload/webbrowser.py"],
> +#         "rdepends": [],
> +#         "summary": "Python Web Browser support"}
> +#
> +#     * Note that the rdepends field was left empty
> +#
> +#     We run $ bitbake python3 -c create_manifest and the resulting manifest
> +#     should be completed after a few seconds, showing something like:
> +#     "webbrowser": {
> +#         "files": ["${libdir}/python${PYTHON_MAJMIN}/webbrowser.py"],
> +#         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
> +#         "summary": "Python Web Browser support"}
> +#
> +#
> +# If you are upgrading Python to a new version please follow the next steps:
> +#     After each Python upgrade, the create_manifest task should be executed, because we
> +#     don't control what changes on upstream Python, so, some module dependency
> +#     might have changed without us realizing it, a certain module can either have
> +#     more or less dependencies, or could be depending on a new file that was just
> +#     created on the new release and for obvious reasons we wouldn't have it on our
> +#     old manifest, all of these issues would cause runtime errors on our system.
> +#
> +#     - Upgrade both the native and target Python packages to a new version
> +#     - Run the create_manifest task for the target Python package as its shown below:
> +#
> +#     $ bitbake python3 -c create_manifest
> +#
> +#     This will automatically replace your manifest file located under the Python directory
> +#     with an new one, which contains the new dependencies (if any).
> +#
> +#     Several things could have gone wrong here, I will try to explain a few:
> +#
> +#     a) A new file was introduced on this release, e.g. sha3*.so:
> +#        The task will check what its needed to import every module, more than one module would
> +#        would probably depend on sha3*.so, although only one module should contain it.
> +#
> +#        After running the task, the new manifest will have the sha3*.so file on more than one
> +#        module, you need to manually decide which one of them should get it and delete it from
> +#        the others, for example sha3*.so should likely be on ${PN}-crypt.
> +#        Once you have deleted from the others you need to run the create_manifest task again,
> +#        this will populate the other module's rdepends fields, with ${PN}-crypt and you should be
> +#        good to go.
> +#
> +#     b) The native package wasn't built correctly and its missing a certain module:
> +#        As mentioned before, you need to make sure the native package was built with all the modules
> +#        because it is used as base to build the manifest file, you need to manually check log.do_compile
> +#        since it won't error out the compile function if its only missing a couple of modules.
> +#
> +#        e.g. missing the _uuid module, log.do_compile would show the following:
> +#        Python build finished successfully!
> +#        The necessary bits to build these optional modules were not found:
> +#        _uuid
> +#
> +#        What will happen here is that the new manifest would not be aware that the _uuid module exists, so
> +#        not only we won't know of any dependencies to it, but also, the _uuid* files will be packaged on
> +#        the misc package (which is where any file that doesn't belong anywhere else ends up).
> +#
> +#        This will eventually cause runtime errors on our system if we don't include the misc package on
> +#        on our image, because the _uuid files will be missing.
> +#        If we build the _uuid module correctly and run the create_manifest task the _uuid files will be
> +#        detected correctly along with its dependencies, and we will get a working manifest.
> +#
> +#        This is the reason why it is important to make sure we have a fully working native build,
> +#        so we can avoid these errors.
> +#
> +#
> +#
> +# DO NOT MODIFY THE NEXT LINE!, IT IS USED AS A MARKER FOR THE ACTUAL JSON MANIFEST
> +# EOC
> +{
> +    "tests": {
> +        "summary": "Python test suite",
> +        "rdepends": [
> +            "core",
> +            "modules"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/*/test",
> +            "${libdir}/python${PYTHON_MAJMIN}/*/tests",
> +            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
> +            "${libdir}/python${PYTHON_MAJMIN}/test"
> +        ],
> +        "cached": []
> +    },
> +    "2to3": {
> +        "summary": "Python automated Python 2 to 3 code translator",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${bindir}/2to3*",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
> +        ],
> +        "cached": []
> +    },
> +    "asyncio": {
> +        "summary": "Python Asynchronous I/",
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "logging",
> +            "netclient",
> +            "numbers",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> +            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
> +            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "audio": {
> +        "summary": "Python Audio Handling",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/audioop.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/ossaudiodev.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/sndhdr.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/wave.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
> +        ]
> +    },
> +    "codecs": {
> +        "summary": "Python codec",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
> +        ]
> +    },
> +    "compile": {
> +        "summary": "Python bytecode compilation support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
> +        ]
> +    },
> +    "compression": {
> +        "summary": "Python high-level compression support",
> +        "rdepends": [
> +            "core",
> +            "shell",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
> +        ]
> +    },
> +    "core": {
> +        "summary": "Python interpreter and core modules",
> +        "rdepends": [],
> +        "files": [
> +            "${bindir}/python*[!-config]",
> +            "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
> +            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/abc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/ast.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/code.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/copy.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/csv.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/dis.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/latin_1.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/utf_8.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/enum.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/functools.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/imp.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap_external.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/abc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/machinery.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/util.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/inspect.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/io.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_struct.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/binascii.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/locale.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/new.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/operator.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/os.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/platform.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/re.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/signal.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/site.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/stat.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/struct.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/threading.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/token.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/types.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/weakref.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
> +        ]
> +    },
> +    "crypt": {
> +        "summary": "Python basic cryptographic and hashing support",
> +        "rdepends": [
> +            "core",
> +            "math",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
> +        ]
> +    },
> +    "ctypes": {
> +        "summary": "Python C types support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/ctypes",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "curses": {
> +        "summary": "Python curses support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/curses",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "datetime": {
> +        "summary": "Python calendar and time support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
> +        ]
> +    },
> +    "db": {
> +        "summary": "Python file-based database support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/dbm",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "debugger": {
> +        "summary": "Python debugger",
> +        "rdepends": [
> +            "core",
> +            "pprint",
> +            "shell",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
> +        ]
> +    },
> +    "dev": {
> +        "cached": [],
> +        "files": [
> +            "${base_libdir}/*.a",
> +            "${base_libdir}/*.o",
> +            "${bindir}/python*-config",
> +            "${datadir}/aclocal",
> +            "${datadir}/pkgconfig",
> +            "${includedir}",
> +            "${libdir}/*.a",
> +            "${libdir}/*.la",
> +            "${libdir}/*.o",
> +            "${libdir}/lib*${SOLIBSDEV}",
> +            "${libdir}/pkgconfig",
> +            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python development package"
> +    },
> +    "difflib": {
> +        "summary": "Python helpers for computing deltas between objects",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
> +        ]
> +    },
> +    "distutils-staticdev": {
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/config/__pycache__/lib*.a"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/config/lib*.a"
> +        ],
> +        "rdepends": [
> +            "distutils"
> +        ],
> +        "summary": "Python distribution utilities (static libraries)"
> +    },
> +    "distutils": {
> +        "summary": "Python Distribution Utilities",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/distutils"
> +        ],
> +        "cached": []
> +    },
> +    "doctest": {
> +        "summary": "Python framework for running examples in docstrings",
> +        "rdepends": [
> +            "core",
> +            "debugger",
> +            "difflib",
> +            "logging",
> +            "pprint",
> +            "shell",
> +            "stringold",
> +            "unittest"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
> +        ]
> +    },
> +    "email": {
> +        "summary": "Python email support",
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "io",
> +            "math",
> +            "netclient"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/email",
> +            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
> +        ]
> +    },
> +    "fcntl": {
> +        "summary": "Python's fcntl interface",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "gdbm": {
> +        "summary": "Python GNU database support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "html": {
> +        "summary": "Python HTML processing support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/html"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
> +        ]
> +    },
> +    "idle": {
> +        "summary": "Python Integrated Development Environment",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${bindir}/idle*",
> +            "${libdir}/python${PYTHON_MAJMIN}/idlelib"
> +        ],
> +        "cached": []
> +    },
> +    "image": {
> +        "summary": "Python graphical image handling",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
> +        ]
> +    },
> +    "io": {
> +        "summary": "Python low-level I/O",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "crypt",
> +            "math",
> +            "netclient",
> +            "shell",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/pipes.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
> +        ]
> +    },
> +    "json": {
> +        "summary": "Python JSON support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/json",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "logging": {
> +        "summary": "Python logging support",
> +        "rdepends": [
> +            "core",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/logging"
> +        ],
> +        "cached": []
> +    },
> +    "mailbox": {
> +        "summary": "Python mailbox format support",
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "email",
> +            "fcntl",
> +            "io",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
> +        ]
> +    },
> +    "math": {
> +        "summary": "Python math support",
> +        "rdepends": [
> +            "core",
> +            "crypt"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/random.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
> +        ]
> +    },
> +    "mime": {
> +        "summary": "Python MIME handling APIs",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/uu.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
> +        ]
> +    },
> +    "mmap": {
> +        "summary": "Python memory-mapped file support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "modules": {
> +        "cached": [],
> +        "files": [],
> +        "rdepends": [
> +            "2to3",
> +            "asyncio",
> +            "audio",
> +            "codecs",
> +            "compile",
> +            "compression",
> +            "core",
> +            "crypt",
> +            "ctypes",
> +            "curses",
> +            "datetime",
> +            "db",
> +            "debugger",
> +            "difflib",
> +            "distutils",
> +            "doctest",
> +            "email",
> +            "fcntl",
> +            "html",
> +            "idle",
> +            "image",
> +            "io",
> +            "json",
> +            "logging",
> +            "mailbox",
> +            "math",
> +            "mime",
> +            "mmap",
> +            "multiprocessing",
> +            "netclient",
> +            "netserver",
> +            "numbers",
> +            "pickle",
> +            "pkgutil",
> +            "plistlib",
> +            "pprint",
> +            "profile",
> +            "pydoc",
> +            "resource",
> +            "runpy",
> +            "shell",
> +            "smtpd",
> +            "sqlite3",
> +            "stringold",
> +            "syslog",
> +            "terminal",
> +            "threading",
> +            "tkinter",
> +            "typing",
> +            "unittest",
> +            "unixadmin",
> +            "venv",
> +            "xml",
> +            "xmlrpc"
> +        ],
> +        "summary": "All Python modules"
> +    },
> +    "multiprocessing": {
> +        "summary": "Python multiprocessing support",
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "pickle"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
> +        ],
> +        "cached": []
> +    },
> +    "netclient": {
> +        "summary": "Python Internet Protocol clients",
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "email",
> +            "io",
> +            "math",
> +            "mime",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/http",
> +            "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
> +        ]
> +    },
> +    "netserver": {
> +        "summary": "Python Internet Protocol servers",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "email",
> +            "html",
> +            "io",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
> +        ]
> +    },
> +    "numbers": {
> +        "summary": "Python number APIs",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
> +        ]
> +    },
> +    "pickle": {
> +        "summary": "Python serialisation/persistence support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_pickle.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/pickle.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
> +        ]
> +    },
> +    "pkgutil": {
> +        "summary": "Python package extension utility support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
> +        ]
> +    },
> +    "plistlib": {
> +        "summary": "Generate and parse Mac OS X .plist files",
> +        "rdepends": [
> +            "core",
> +            "datetime",
> +            "xml"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
> +        ]
> +    },
> +    "pprint": {
> +        "summary": "Python pretty-print support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
> +        ]
> +    },
> +    "profile": {
> +        "summary": "Python basic performance profiling support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/profile.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
> +        ]
> +    },
> +    "pydoc": {
> +        "summary": "Python interactive help support",
> +        "rdepends": [
> +            "core",
> +            "netclient",
> +            "pkgutil"
> +        ],
> +        "files": [
> +            "${bindir}/pydoc*",
> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
> +        ]
> +    },
> +    "resource": {
> +        "summary": "Python resource control interface",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "runpy": {
> +        "summary": "Python helper for locating/executing scripts in module namespace",
> +        "rdepends": [
> +            "core",
> +            "pkgutil"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
> +        ]
> +    },
> +    "shell": {
> +        "summary": "Python shell-like functionality",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/shlex.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/shutil.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
> +        ]
> +    },
> +    "smtpd": {
> +        "summary": "Python Simple Mail Transport Daemon",
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "email",
> +            "io",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${bindir}/smtpd.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
> +        ]
> +    },
> +    "sqlite3": {
> +        "summary": "Python Sqlite3 database support",
> +        "rdepends": [
> +            "core",
> +            "datetime"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3"
> +        ],
> +        "cached": []
> +    },
> +    "stringold": {
> +        "summary": "Python string APIs [deprecated]",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/string.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
> +        ]
> +    },
> +    "syslog": {
> +        "summary": "Python syslog interface",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
> +        ],
> +        "cached": []
> +    },
> +    "terminal": {
> +        "summary": "Python terminal controlling support",
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/pty.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/tty.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
> +        ]
> +    },
> +    "threading": {
> +        "summary": "Python threading & synchronization support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/queue.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
> +        ]
> +    },
> +    "tkinter": {
> +        "summary": "Python Tcl/Tk bindings",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> +        ],
> +        "cached": []
> +    },
> +    "typing": {
> +        "summary": "Python typing support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> +        ]
> +    },
> +    "unittest": {
> +        "summary": "Python unit testing framework",
> +        "rdepends": [
> +            "core",
> +            "difflib",
> +            "logging",
> +            "pprint",
> +            "shell",
> +            "stringold"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest",
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
> +        ],
> +        "cached": []
> +    },
> +    "unixadmin": {
> +        "summary": "Python Unix administration support",
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
> +        ]
> +    },
> +    "venv": {
> +        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories.",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "logging",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${bindir}/pyvenv*",
> +            "${libdir}/python${PYTHON_MAJMIN}/venv"
> +        ],
> +        "cached": []
> +    },
> +    "xml": {
> +        "summary": "Python basic XML support",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/xml"
> +        ],
> +        "cached": []
> +    },
> +    "xmlrpc": {
> +        "summary": "Python XML-RPC support",
> +        "rdepends": [
> +            "core",
> +            "xml"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
> +            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
> +        ],
> +        "cached": []
> +    }
> +}
> diff --git a/meta/recipes-devtools/python-sanity/python3/run-ptest b/meta/recipes-devtools/python-sanity/python3/run-ptest
> new file mode 100644
> index 00000000000..3863c6d314f
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +python3 -m test -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> diff --git a/meta/recipes-devtools/python-sanity/python3_3.7.2.bb b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
> new file mode 100644
> index 00000000000..31da9944e77
> --- /dev/null
> +++ b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
> @@ -0,0 +1,284 @@
> +SUMMARY = "The Python Programming Language"
> +HOMEPAGE = "http://www.python.org"
> +LICENSE = "PSFv2"
> +SECTION = "devel/python"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
> +
> +SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> +           file://run-ptest \
> +           file://create_manifest3.py \
> +           file://get_module_deps3.py \
> +           file://python3-manifest.json \
> +           file://check_build_completeness.py \
> +           file://cgi_py.patch \
> +           file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
> +           file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> +           file://python-config.patch \
> +           file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
> +           file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
> +           "
> +
> +SRC_URI_append_class-native = " \
> +           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
> +           file://12-distutils-prefix-is-inside-staging-area.patch \
> +           "
> +
> +SRC_URI[md5sum] = "df6ec36011808205beda239c72f947cb"
> +SRC_URI[sha256sum] = "d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb"
> +
> +# exclude pre-releases for both python 2.x and 3.x
> +UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> +
> +CVE_PRODUCT = "python"
> +
> +PYTHON_MAJMIN = "3.7"
> +PYTHON_BINABI = "${PYTHON_MAJMIN}m"
> +
> +S = "${WORKDIR}/Python-${PV}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-dev = "python-config"
> +ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
> +ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> +
> +
> +DEPENDS = "bzip2-replacement-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
> +DEPENDS_append_class-target = " python3-native"
> +DEPENDS_append_class-nativesdk = " python3-native"
> +
> +EXTRA_OECONF = " --without-ensurepip --enable-shared"
> +EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
> +
> +
> +EXTRANATIVEPATH += "python3-native"
> +
> +CACHED_CONFIGUREVARS = " \
> +                ac_cv_file__dev_ptmx=yes \
> +                ac_cv_file__dev_ptc=no \
> +"
> +
> +PACKAGECONFIG_class-target ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
> +PACKAGECONFIG_class-native ??= "readline"
> +PACKAGECONFIG_class-nativesdk ??= "readline"
> +PACKAGECONFIG[readline] = ",,readline"
> +# Use profile guided optimisation by running PyBench inside qemu-user
> +PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-helper-native"
> +PACKAGECONFIG[tk] = ",,tk"
> +
> +CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
> +
> +EXTRA_OEMAKE = '\
> +  STAGING_LIBDIR=${STAGING_LIBDIR} \
> +  STAGING_INCDIR=${STAGING_INCDIR} \
> +  LIB=${baselib} \
> +'
> +
> +do_compile_prepend_class-target() {
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
> +                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> +                cat >pgo-wrapper <<EOF
> +#!/bin/sh
> +cd ${B}
> +$qemu_binary "\$@"
> +EOF
> +                chmod +x pgo-wrapper
> +        fi
> +}
> +
> +do_install_prepend() {
> +        ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
> +}
> +
> +do_install_append_class-target() {
> +        oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +}
> +
> +do_install_append_class-native() {
> +        # Make sure we use /usr/bin/env python
> +        for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
> +                sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +        done
> +        # Add a symlink to the native Python so that scripts can just invoke
> +        # "nativepython" and get the right one without needing absolute paths
> +        # (these often end up too long for the #! parser in the kernel as the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +}
> +
> +do_install_append() {
> +        mkdir -p ${D}${libdir}/python-sysconfigdata
> +        sysconfigfile=`find ${D} -name _sysconfig*.py`
> +        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
> +
> +        sed -i  \
> +                -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
> +                -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
> +                -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
> +                ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
> +}
> +
> +SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> +PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> +
> +py_package_preprocess () {
> +        # Remove references to buildmachine paths in target Makefile and _sysconfigdata
> +        sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +                -e 's|${DEBUG_PREFIX_MAP}||g' \
> +                -e 's:${HOSTTOOLS_DIR}/::g' \
> +                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +                -e 's:${RECIPE_SYSROOT}::g' \
> +                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +                ${PKGD}/${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
> +                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
> +                ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> +
> +        # Recompile _sysconfigdata after modifying it
> +        cd ${PKGD}
> +        sysconfigfile=`find . -name _sysconfigdata_*.py`
> +        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +             -c "from py_compile import compile; compile('$sysconfigfile')"
> +        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +             -c "from py_compile import compile; compile('$sysconfigfile', optimize=1)"
> +        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +             -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
> +        cd -
> +
> +        mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> +
> +        #Remove the unneeded copy of target sysconfig data
> +        rm -rf ${PKGD}/${libdir}/python-sysconfigdata
> +}
> +
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +INCLUDE_PYCS ?= "1"
> +
> +python(){
> +    import collections, json
> +
> +    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
> +    # This python changes the datastore based on the contents of a file, so mark
> +    # that dependency.
> +    bb.parse.mark_dependency(d, filename)
> +
> +    with open(filename) as manifest_file:
> +        manifest_str =  manifest_file.read()
> +        json_start = manifest_str.find('# EOC') + 6
> +        manifest_file.seek(json_start)
> +        manifest_str = manifest_file.read()
> +        python_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
> +
> +    # First set RPROVIDES for -native case
> +    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
> +    pn = 'python3'
> +    rprovides = d.getVar('RPROVIDES').split()
> +
> +    for key in python_manifest:
> +        pypackage = pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES_class-native', ' '.join(rprovides))
> +
> +    # Then work on the target
> +    include_pycs = d.getVar('INCLUDE_PYCS')
> +
> +    packages = d.getVar('PACKAGES').split()
> +    pn = d.getVar('PN')
> +
> +    newpackages=[]
> +    for key in python_manifest:
> +        pypackage= pn + '-' + key
> +
> +        if pypackage not in packages:
> +            # We need to prepend, otherwise python-misc gets everything
> +            # so we use a new variable
> +            newpackages.append(pypackage)
> +
> +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> +        d.setVar('FILES_' + pypackage, '')
> +        for value in python_manifest[key]['files']:
> +            d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +        # Add cached files
> +        if include_pycs == '1':
> +            for value in python_manifest[key]['cached']:
> +                    d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +        for value in python_manifest[key]['rdepends']:
> +            # Make it work with or without $PN
> +            if '${PN}' in value:
> +                value=value.split('-')[1]
> +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> +        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> +
> +    # Prepending so to avoid python-misc getting everything
> +    packages = newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> +}
> +
> +# Files needed to create a new manifest
> +
> +do_create_manifest() {
> +    # This task should be run with every new release of Python.
> +    # We must ensure that PACKAGECONFIG enables everything when creating
> +    # a new manifest, this is to base our new manifest on a complete
> +    # native python build, containing all dependencies, otherwise the task
> +    # wont be able to find the required files.
> +    # e.g. BerkeleyDB is an optional build dependency so it may or may not
> +    # be present, we must ensure it is.
> +
> +    cd ${WORKDIR}
> +    # This needs to be executed by python-native and NOT by HOST's python
> +    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> +    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
> +}
> +
> +# bitbake python -c create_manifest
> +addtask do_create_manifest
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] += "${PN}:do_patch"
> +
> +# manual dependency additions
> +RPROVIDES_${PN}-modules = "${PN}"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
> +RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
> +RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
> +
> +FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> +FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> +
> +# provide python-pyvenv from python3-venv
> +RPROVIDES_${PN}-venv += "python3-pyvenv"
> +
> +# package libpython3
> +PACKAGES =+ "libpython3 libpython3-staticdev"
> +FILES_libpython3 = "${libdir}/libpython*.so.*"
> +FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> +INSANE_SKIP_${PN}-dev += "dev-elf"
> +
> +# catch all the rest (unsorted)
> +PACKAGES += "${PN}-misc"
> +RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs"
> +RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
> +RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
> +FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
> +
> +# catch manpage
> +PACKAGES += "${PN}-man"
> +FILES_${PN}-man = "${datadir}/man"
> +
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
> +RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
> +RDEPENDS_${PN}-dev = ""
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

