Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by mail.openembedded.org (Postfix) with ESMTP id 977A67FC98
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:40:35 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id d8so120492uak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WmcSgFW+jPoa46ZQlzF8O2IWHSkQ+suXH+zn5qFESVY=;
	b=lxDiUgH8ur+Lqzr+u1VpZdHqxerahcey7FzxyaX05vxu8mQX6+gakGVtPtk2265wPY
	4gSA/L2CVbb4wQtiOocRnx/7LrfOBNTKf0I1BcrOnv8MmhQQOs+OAu+YwoXoWnWfP24Q
	igU0iVdIX3wCKLndVQH3BfiDVtqbSKpZ6IkILCsc4RTweDO0RbNNgvYMPvd7ZdTjk1Ap
	v1vvFw8VimOiAM6zw3aEHN0VSeY5fwnGWAb4f3Vu6E9XUqTwcJw2dsuBU8LJvgZCvtJU
	V0sqbLvLmAU/nYZYNKIzkVMgffv2LgBzuwrewppWDBdbwBciN3zOicUJdmb233QPFXtq
	sRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WmcSgFW+jPoa46ZQlzF8O2IWHSkQ+suXH+zn5qFESVY=;
	b=bQDDEauEnN+kRZwY9PhV7+usQK9kPVduhqCeUshXH50Gex8RtKdacAeawvqGMmlr7X
	szqsVVR4Mu/I6fKlrVaiWmB/l4WGIkjDwF1HTYD7lxSCwst465fYl5xmOB8veOGrP7eL
	qUC+XO+mRUgoiR8WrQGhO9EE0bOV73eOW404rffYE4hZqs9u11j6K+RXswG//CHEMhVg
	tvvuJy2KxF1LwFlE9KPUtj4tSVld9Xx0U2zo9pPLmcCra03sKBnqqubhgE1BCsNIkr18
	Q6jy5ABu0YeyCQFnjtMHP1Yk0wKzxHZHswJQe4JOifHweln/ZUhspBHi9af5rpLWi7yx
	2Nmg==
X-Gm-Message-State: APjAAAWlo4/LXP99dX+L78RUKv1mvTGqMbg5LthYKkh2Qu0r/YBB8o8I
	WogCKYkX0XrDWxbvJnN1jm5V+xnynKti+92Ktkc=
X-Google-Smtp-Source: APXvYqys0/bZodJOkQAgocCtm+sVHFVMRFa8mtMYCzSIr83HjF8CPi6BwBINDs/KHlg9NgNxZrHVG/UqCMqvBHt29pM=
X-Received: by 2002:a9f:3fcc:: with SMTP id m12mr23914989uaj.89.1575891636053; 
	Mon, 09 Dec 2019 03:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-6-alex.kanavin@gmail.com>
	<CAMKF1sqx35CX9Mzup2WJeaEsK_9qsk=6tHRwjL5+p_xAnAafZw@mail.gmail.com>
In-Reply-To: <CAMKF1sqx35CX9Mzup2WJeaEsK_9qsk=6tHRwjL5+p_xAnAafZw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2019 12:40:24 +0100
Message-ID: <CANNYZj8H5nd66Z6hv0mrEF=Fd84Zy9LmC63TYFWoNyG+hCS5uw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 09 Dec 2019 11:40:36 -0000
Content-Type: multipart/alternative; boundary="0000000000002bec4d059943ddd2"

--0000000000002bec4d059943ddd2
Content-Type: text/plain; charset="UTF-8"

As RP said, the problematic pieces will be tested and fixed one by one, I
guess I was too optimistic about this patchset's maturity.

Alex

On Sat, 7 Dec 2019 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:

> besides gettext this is another reason I suppose causing a few more
> failures see
>
>
> http://errors.yoctoproject.org/Errors/Build/94077/
>
> all do_prepare_recipe_sysroot seems to be failing in python snippets.
> and do_configure aree also related to native python missing modules
> do_compile are mostly related to gettext.
>
> On Thu, Dec 5, 2019 at 7:45 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Drop backports, rebase other patches.
> >
> > One patch I wasn't able to rebase as upstream code changed too much:
> > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > Please determine if it is still needed, produce a new version,
> > and work with upstream to get it merged.
> >
> > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > is removed as the use case (allowing python 2 and 3 to coexist
> > in SDKs) is no longer relevant with Python 2.x reaching end of line
> > and upstream has refactored the code making a rebase difficult.
> > If needed, please re-add the patch to py2, rather than py3.
> >
> > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the recipes
> > and classes accordingly.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/classes/python3-dir.bbclass              |   4 +-
> >  ...ib-termcap-to-linker-flags-to-avoid-.patch |  14 +-
> >  ...lib-as-location-for-site-packages-an.patch | 156 ++++++++------
> >  ...-detection-of-mips-architecture-for-.patch |  16 +-
> >  ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
> >  ...ON3HOME-is-set-use-instead-of-PYTHON.patch |  47 -----
> >  ...asename-to-replace-CC-for-checking-c.patch |  37 ++--
> >  ...runtime-test-to-get-float-byte-order.patch | 199 ------------------
> >  ...ssing-libraries-to-Extension-for-mul.patch |  80 -------
> >  ...report-missing-dependencies-for-disa.patch |  11 +-
> >  ...tutils-prefix-is-inside-staging-area.patch |   2 +-
> >  .../python3/avoid_warning_about_tkinter.patch |  33 ++-
> >  .../python/python3/python-config.patch        |  24 ++-
> >  .../python/python3/python3-manifest.json      |   4 +-
> >  .../{python3_3.7.5.bb => python3_3.8.0.bb}    |  28 ++-
> >  15 files changed, 175 insertions(+), 482 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> >  delete mode 100644
> meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> >  delete mode 100644
> meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> >  rename meta/recipes-devtools/python/{python3_3.7.5.bb =>
> python3_3.8.0.bb} (91%)
> >
> > diff --git a/meta/classes/python3-dir.bbclass
> b/meta/classes/python3-dir.bbclass
> > index 7dd130bad99..036d7140d99 100644
> > --- a/meta/classes/python3-dir.bbclass
> > +++ b/meta/classes/python3-dir.bbclass
> > @@ -1,5 +1,5 @@
> > -PYTHON_BASEVERSION = "3.7"
> > -PYTHON_ABI = "m"
> > +PYTHON_BASEVERSION = "3.8"
> > +PYTHON_ABI = ""
> >  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
> >  PYTHON_PN = "python3"
> >  PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> > index 09f279ba1d7..59592821d7f 100644
> > ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> > +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> > @@ -1,4 +1,4 @@
> > -From 23294c6ba6896115828293fdb7e67b47b38ba675 Mon Sep 17 00:00:00 2001
> > +From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Fri, 25 Jan 2019 19:04:13 +0100
> >  Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid
> host
> > @@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 1 deletion(-)
> >
> >  diff --git a/setup.py b/setup.py
> > -index b4357e3..fbec00d 100644
> > +index 20d7f35..ab18ff0 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -856,7 +856,6 @@ class PyBuildExt(build_ext):
> > +@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):
> >                                                        'termcap'):
> >                   readline_libs.append('termcap')
> > -             exts.append( Extension('readline', ['readline.c'],
> > --                                   library_dirs=['/usr/lib/termcap'],
> > -
> extra_link_args=readline_extra_link_args,
> > -                                    libraries=readline_libs) )
> > +             self.add(Extension('readline', ['readline.c'],
> > +-                               library_dirs=['/usr/lib/termcap'],
> > +
> extra_link_args=readline_extra_link_args,
> > +                                libraries=readline_libs))
> >           else:
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> > index ea75262c4f6..112c979441f 100644
> > ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> > +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> > @@ -1,4 +1,4 @@
> > -From 0fbdad1eaf541a8e92be81f39514cd249b3b0801 Mon Sep 17 00:00:00 2001
> > +From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Tue, 5 Feb 2019 15:52:02 +0100
> >  Subject: [PATCH] Do not hardcode "lib" as location for modules,
> site-packages
> > @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   Include/pythonrun.h  |  2 ++
> >   Lib/site.py          |  4 ++--
> >   Makefile.pre.in      |  5 +++--
> > - Modules/getpath.c    | 18 ++++++++++++------
> > + Modules/getpath.c    | 22 ++++++++++++++--------
> >   Python/getplatform.c | 10 ++++++++++
> >   Python/sysmodule.c   |  2 ++
> > - 6 files changed, 31 insertions(+), 10 deletions(-)
> > + 6 files changed, 33 insertions(+), 12 deletions(-)
> >
> >  diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> > -index 6f0c6fc..0a17edd 100644
> > +index 46091e0..61b2e15 100644
> >  --- a/Include/pythonrun.h
> >  +++ b/Include/pythonrun.h
> >  @@ -7,6 +7,8 @@
> > @@ -28,12 +28,12 @@ index 6f0c6fc..0a17edd 100644
> >  +
> >   #ifndef Py_LIMITED_API
> >   PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags
> *);
> > - PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *,
> PyCompilerFlags *);
> > + PyAPI_FUNC(int) PyRun_AnyFileExFlags(
> >  diff --git a/Lib/site.py b/Lib/site.py
> > -index ffd132b..b55f6d8 100644
> > +index a065ab0..1d720ef 100644
> >  --- a/Lib/site.py
> >  +++ b/Lib/site.py
> > -@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
> > +@@ -335,12 +335,12 @@ def getsitepackages(prefixes=None):
> >           seen.add(prefix)
> >
> >           if os.sep == '/':
> > @@ -49,10 +49,10 @@ index ffd132b..b55f6d8 100644
> >
> >   def addsitepackages(known_paths, prefixes=None):
> >  diff --git a/Makefile.pre.in b/Makefile.pre.in
> > -index 6e81b2f..671a20e 100644
> > +index 65665df..be49140 100644
> >  --- a/Makefile.pre.in
> >  +++ b/Makefile.pre.in
> > -@@ -142,7 +142,7 @@ LIBDIR=            @libdir@
> > +@@ -143,7 +143,7 @@ LIBDIR=            @libdir@
> >   MANDIR=               @mandir@
> >   INCLUDEDIR=   @includedir@
> >   CONFINCLUDEDIR=       $(exec_prefix)/include
> > @@ -61,7 +61,7 @@ index 6e81b2f..671a20e 100644
> >   ABIFLAGS=     @ABIFLAGS@
> >
> >   # Detailed destination directories
> > -@@ -768,6 +768,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c
> Makefile
> > +@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c
> Makefile
> >                 -DEXEC_PREFIX='"$(exec_prefix)"' \
> >                 -DVERSION='"$(VERSION)"' \
> >                 -DVPATH='"$(VPATH)"' \
> > @@ -69,7 +69,7 @@ index 6e81b2f..671a20e 100644
> >                 -o $@ $(srcdir)/Modules/getpath.c
> >
> >   Programs/python.o: $(srcdir)/Programs/python.c
> > -@@ -856,7 +857,7 @@ regen-opcode:
> > +@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h
> >   Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o
> Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h
> $(srcdir)/Include/Python-ast.h
> >
> >   Python/getplatform.o: $(srcdir)/Python/getplatform.c
> > @@ -79,72 +79,90 @@ index 6e81b2f..671a20e 100644
> >   Python/importdl.o: $(srcdir)/Python/importdl.c
> >                 $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@
> $(srcdir)/Python/importdl.c
> >  diff --git a/Modules/getpath.c b/Modules/getpath.c
> > -index e6a3e8e..0c62af6 100644
> > +index b727f66..c003e46 100644
> >  --- a/Modules/getpath.c
> >  +++ b/Modules/getpath.c
> > -@@ -123,6 +123,7 @@ typedef struct {
> > -     wchar_t *exec_prefix;              /* EXEC_PREFIX define */
> > +@@ -128,6 +128,7 @@ typedef struct {
> > +     wchar_t *exec_prefix;              /* EXEC_PREFIX macro */
> >
> >       wchar_t *lib_python;               /* "lib/pythonX.Y" */
> >  +    wchar_t *multilib_python;               /* "lib[suffix]/pythonX.Y"
> */
> > -     wchar_t argv0_path[MAXPATHLEN+1];
> > -     wchar_t zip_path[MAXPATHLEN+1];    /* ".../lib/pythonXY.zip" */
> >
> > -@@ -314,7 +315,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> > +     int prefix_found;         /* found platform independent libraries?
> */
> > +     int exec_prefix_found;    /* found the platform dependent
> libraries? */
> > +@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> >           if (delim) {
> >               *delim = L'\0';
> >           }
> > --        joinpath(prefix, calculate->lib_python);
> > -+        joinpath(prefix, calculate->multilib_python);
> > -         joinpath(prefix, LANDMARK);
> > -         return 1;
> > -     }
> > -@@ -343,7 +344,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> > -     copy_absolute(prefix, calculate->argv0_path, MAXPATHLEN+1);
> > +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> > ++        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             return status;
> > +         }
> > +@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> >       do {
> > -         n = wcslen(prefix);
> > --        joinpath(prefix, calculate->lib_python);
> > -+        joinpath(prefix, calculate->multilib_python);
> > -         joinpath(prefix, LANDMARK);
> > -         if (ismodule(prefix)) {
> > -             return 1;
> > -@@ -355,7 +356,7 @@ search_for_prefix(const _PyCoreConfig *core_config,
> > -     /* Look at configure's PREFIX */
> > -     wcsncpy(prefix, calculate->prefix, MAXPATHLEN);
> > -     prefix[MAXPATHLEN] = L'\0';
> > --    joinpath(prefix, calculate->lib_python);
> > -+    joinpath(prefix, calculate->multilib_python);
> > -     joinpath(prefix, LANDMARK);
> > -     if (ismodule(prefix)) {
> > -         return 1;
> > -@@ -427,7 +428,7 @@ search_for_exec_prefix(const _PyCoreConfig
> *core_config,
> > -             wcsncpy(exec_prefix, core_config->home, MAXPATHLEN);
> > +         /* Path: <argv0_path or substring> / <lib_python> / LANDMARK */
> > +         size_t n = wcslen(prefix);
> > +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> > ++        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             return status;
> >           }
> > -         exec_prefix[MAXPATHLEN] = L'\0';
> > --        joinpath(exec_prefix, calculate->lib_python);
> > -+        joinpath(exec_prefix, calculate->multilib_python);
> > -         joinpath(exec_prefix, L"lib-dynload");
> > -         return 1;
> > +@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> > +     if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> > +         return PATHLEN_ERR();
> > +     }
> > +-    status = joinpath(prefix, calculate->lib_python, prefix_len);
> > ++    status = joinpath(prefix, calculate->multilib_python, prefix_len);
> > +     if (_PyStatus_EXCEPTION(status)) {
> > +         return status;
> >       }
> > -@@ -464,7 +465,7 @@ search_for_exec_prefix(const _PyCoreConfig
> *core_config,
> > -     copy_absolute(exec_prefix, calculate->argv0_path, MAXPATHLEN+1);
> > +@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> > +         if (safe_wcscpy(prefix, calculate->prefix, prefix_len) < 0) {
> > +             return PATHLEN_ERR();
> > +         }
> > +-        status = joinpath(prefix, calculate->lib_python, prefix_len);
> > ++        status = joinpath(prefix, calculate->multilib_python,
> prefix_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             return status;
> > +         }
> > +@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> > +                 return PATHLEN_ERR();
> > +             }
> > +         }
> > +-        status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> > ++        status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             return status;
> > +         }
> > +@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> >       do {
> > -         n = wcslen(exec_prefix);
> > --        joinpath(exec_prefix, calculate->lib_python);
> > -+        joinpath(exec_prefix, calculate->multilib_python);
> > -         joinpath(exec_prefix, L"lib-dynload");
> > -         if (isdir(exec_prefix)) {
> > -             return 1;
> > -@@ -476,7 +477,7 @@ search_for_exec_prefix(const _PyCoreConfig
> *core_config,
> > -     /* Look at configure's EXEC_PREFIX */
> > -     wcsncpy(exec_prefix, calculate->exec_prefix, MAXPATHLEN);
> > -     exec_prefix[MAXPATHLEN] = L'\0';
> > --    joinpath(exec_prefix, calculate->lib_python);
> > -+    joinpath(exec_prefix, calculate->multilib_python);
> > -     joinpath(exec_prefix, L"lib-dynload");
> > -     if (isdir(exec_prefix)) {
> > -         return 1;
> > -@@ -871,6 +872,10 @@ calculate_init(PyCalculatePath *calculate,
> > +         /* Path: <argv0_path or substring> / <lib_python> /
> "lib-dynload" */
> > +         size_t n = wcslen(exec_prefix);
> > +-        status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> > ++        status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             return status;
> > +         }
> > +@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate,
> _PyPathConfig *pathconfig,
> > +     if (safe_wcscpy(exec_prefix, calculate->exec_prefix,
> exec_prefix_len) < 0) {
> > +         return PATHLEN_ERR();
> > +     }
> > +-    status = joinpath(exec_prefix, calculate->lib_python,
> exec_prefix_len);
> > ++    status = joinpath(exec_prefix, calculate->multilib_python,
> exec_prefix_len);
> > +     if (_PyStatus_EXCEPTION(status)) {
> > +         return status;
> > +     }
> > +@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate,
> const wchar_t *program_full_pat
> > +             return PATHLEN_ERR();
> > +         }
> > +         reduce(argv0_path);
> > +-        status = joinpath(argv0_path, calculate->lib_python,
> argv0_path_len);
> > ++        status = joinpath(argv0_path, calculate->multilib_python,
> argv0_path_len);
> > +         if (_PyStatus_EXCEPTION(status)) {
> > +             PyMem_RawFree(wbuf);
> > +             return status;
> > +@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, const
> PyConfig *config)
> >       if (!calculate->lib_python) {
> >           return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> >       }
> > @@ -152,10 +170,10 @@ index e6a3e8e..0c62af6 100644
> >  +    if (!calculate->multilib_python) {
> >  +        return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> >  +    }
> > -     return _Py_INIT_OK();
> > - }
> >
> > -@@ -882,6 +887,7 @@ calculate_free(PyCalculatePath *calculate)
> > +     calculate->warnings = config->pathconfig_warnings;
> > +     calculate->pythonpath_env = config->pythonpath_env;
> > +@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)
> >       PyMem_RawFree(calculate->prefix);
> >       PyMem_RawFree(calculate->exec_prefix);
> >       PyMem_RawFree(calculate->lib_python);
> > @@ -182,10 +200,10 @@ index 81a0f7a..d55396b 100644
> >  +      return LIB;
> >  +}
> >  diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> > -index efe5b29..de77b17 100644
> > +index 5b0fb81..0dce754 100644
> >  --- a/Python/sysmodule.c
> >  +++ b/Python/sysmodule.c
> > -@@ -2319,6 +2319,8 @@ _PySys_BeginInit(PyObject **sysmod)
> > +@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime,
> PyInterpreterState *interp,
> >                           PyUnicode_FromString(Py_GetCopyright()));
> >       SET_SYS_FROM_STRING("platform",
> >                           PyUnicode_FromString(Py_GetPlatform()));
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> > index e7af88654da..fe0aa8aabed 100644
> > ---
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> > +++
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> > @@ -1,4 +1,4 @@
> > -From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
> > +From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
> >  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> >  Date: Fri, 31 May 2019 15:34:34 +0200
> >  Subject: [PATCH] bpo-36852: proper detection of mips architecture for
> soft
> > @@ -12,15 +12,16 @@ to do this in a more autoconf/autotools manner.
> >
> >  Upstream-Status: Submitted [
> https://github.com/python/cpython/pull/13196]
> >  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> > +
> >  ---
> > - configure.ac | 169 ++++++---------------------------------------------
> > - 1 file changed, 17 insertions(+), 152 deletions(-)
> > + configure.ac | 171 +++++----------------------------------------------
> > + 1 file changed, 17 insertions(+), 154 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index a7de901e08..a73e2de51b 100644
> > +index 0f85486..0ca7e24 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -727,158 +727,23 @@ fi
> > +@@ -704,160 +704,23 @@ fi
> >   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
> >   AC_SUBST(MULTIARCH)
> >
> > @@ -163,6 +164,8 @@ index a7de901e08..a73e2de51b 100644
> >  -        i386-gnu
> >  -#elif defined(__APPLE__)
> >  -        darwin
> > +-#elif defined(__VXWORKS__)
> > +-        vxworks
> >  -#else
> >  -# error unknown platform triplet
> >  -#endif
> > @@ -196,6 +199,3 @@ index a7de901e08..a73e2de51b 100644
> >
> >   if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
> >     if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> > ---
> > -2.21.0
> > -
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> > index 1709011be8a..ee37f6bd52d 100644
> > ---
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> > +++
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> > @@ -1,4 +1,4 @@
> > -From eff903c600f4c40f5753e95ab1557126fc6e0c9c Mon Sep 17 00:00:00 2001
> > +From cf676775109c0a7fb38058bb60b453ff8f1a166b Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Thu, 31 Jan 2019 16:46:30 +0100
> >  Subject: [PATCH] distutils/sysconfig: append
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > deleted file mode 100644
> > index a146c747f83..00000000000
> > ---
> a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -From 5ce3ac59531828ff682646fbba59b2126b28a8aa Mon Sep 17 00:00:00 2001
> > -From: Jaewon Lee <jaewon.lee@xilinx.com>
> > -Date: Thu, 25 Apr 2019 15:34:26 -0700
> > -Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of
> PYTHONHOME
> > -
> > -There is one variable PYTHONHOME to determine where libraries are coming
> > -from for both python2 and python3. This becomes an issue if only one has
> > -libraries in the specified PYTHONHOME path, but they are using the same
> > -PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
> > -to set a different path for python3
> > -
> > -Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> > -
> > -Upstream-Status: Inappropriate [OE specific configuration]
> > -
> > ----
> > - Modules/main.c | 17 +++++++++++++----
> > - 1 file changed, 13 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/Modules/main.c b/Modules/main.c
> > -index acc59c6..407085a 100644
> > ---- a/Modules/main.c
> > -+++ b/Modules/main.c
> > -@@ -1834,10 +1834,19 @@ config_init_home(_PyCoreConfig *config)
> > -         }
> > -         return _Py_INIT_OK();
> > -     }
> > --
> > --    int res = config_get_env_var_dup(&home, L"PYTHONHOME",
> "PYTHONHOME");
> > --    if (res < 0) {
> > --        return DECODE_LOCALE_ERR("PYTHONHOME", res);
> > -+    int res;
> > -+    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
> > -+    if (oepython3home) {
> > -+        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME",
> "OEPYTHON3HOME");
> > -+        if (res < 0) {
> > -+            return DECODE_LOCALE_ERR("OEPYTHON3HOME", res);
> > -+        }
> > -+    }
> > -+    else {
> > -+        res = config_get_env_var_dup(&home, L"PYTHONHOME",
> "PYTHONHOME");
> > -+        if (res < 0) {
> > -+            return DECODE_LOCALE_ERR("PYTHONHOME", res);
> > -+        }
> > -     }
> > -     config->home = home;
> > -     return _Py_INIT_OK();
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> > index a0ea897f4e8..fb10ca94b31 100644
> > ---
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> > +++
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> > @@ -1,4 +1,4 @@
> > -From 2645317fef09afe31b01bb2c1d4fe5b9afdbb11a Mon Sep 17 00:00:00 2001
> > +From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 2001
> >  From: Changqing Li <changqing.li@windriver.com>
> >  Date: Mon, 22 Oct 2018 15:19:51 +0800
> >  Subject: [PATCH] python3: use cc_basename to replace CC for checking
> compiler
> > @@ -21,12 +21,13 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >  patch originally from Li Zhou, I just rework it to new version
> >
> >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +
> >  ---
> >   configure.ac | 19 ++++++++++---------
> >   1 file changed, 10 insertions(+), 9 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index a7de901..4a3681f 100644
> > +index a189d42..0f85486 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> >  @@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
> > @@ -37,7 +38,7 @@ index a7de901..4a3681f 100644
> >
> >   # pybuilddir.txt will be created by --generate-posix-vars in the
> Makefile
> >   rm -f pybuilddir.txt
> > -@@ -695,7 +696,7 @@ AC_MSG_RESULT($with_cxx_main)
> > +@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)
> >   preset_cxx="$CXX"
> >   if test -z "$CXX"
> >   then
> > @@ -46,7 +47,7 @@ index a7de901..4a3681f 100644
> >           gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
> >           cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
> >           clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++],
> [notfound]) ;;
> > -@@ -979,7 +980,7 @@ rmdir CaseSensitiveTestDir
> > +@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir
> >
> >   case $ac_sys_system in
> >   hp*|HP*)
> > @@ -55,7 +56,7 @@ index a7de901..4a3681f 100644
> >       cc|*/cc) CC="$CC -Ae";;
> >       esac;;
> >   esac
> > -@@ -1336,7 +1337,7 @@ else
> > +@@ -1335,7 +1336,7 @@ else
> >   fi],
> >   [AC_MSG_RESULT(no)])
> >   if test "$Py_LTO" = 'true' ; then
> > @@ -64,7 +65,7 @@ index a7de901..4a3681f 100644
> >       *clang*)
> >         AC_SUBST(LLVM_AR)
> >         AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> > -@@ -1426,7 +1427,7 @@ then
> > +@@ -1425,7 +1426,7 @@ then
> >     fi
> >   fi
> >   LLVM_PROF_ERR=no
> > @@ -73,16 +74,16 @@ index a7de901..4a3681f 100644
> >     *clang*)
> >       # Any changes made here should be reflected in the GCC+Darwin case
> below
> >       PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
> > -@@ -1500,7 +1501,7 @@ then
> > -            WRAP="-fwrapv"
> > -         fi
> > +@@ -1486,7 +1487,7 @@ esac
> > + # compiler and platform.  BASECFLAGS tweaks need to be made even if the
> > + # user set OPT.
> >
> > --        case $CC in
> > -+        case $cc_basename in
> > -             *clang*)
> > -                 cc_is_clang=1
> > -                 ;;
> > -@@ -1623,7 +1624,7 @@ yes)
> > +-case $CC in
> > ++case $cc_basename in
> > +     *clang*)
> > +         cc_is_clang=1
> > +         ;;
> > +@@ -1622,7 +1623,7 @@ yes)
> >
> >       # ICC doesn't recognize the option, but only emits a warning
> >       ## XXX does it emit an unused result warning and can it be
> disabled?
> > @@ -91,7 +92,7 @@ index a7de901..4a3681f 100644
> >       *icc*)
> >       ac_cv_disable_unused_result_warning=no
> >       ;;
> > -@@ -1965,7 +1966,7 @@ yes)
> > +@@ -1943,7 +1944,7 @@ yes)
> >   esac
> >
> >   # ICC needs -fp-model strict or floats behave badly
> > @@ -100,7 +101,7 @@ index a7de901..4a3681f 100644
> >   *icc*)
> >       CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
> >       ;;
> > -@@ -2727,7 +2728,7 @@ then
> > +@@ -2711,7 +2712,7 @@ then
> >                 then
> >                         LINKFORSHARED="-Wl,--export-dynamic"
> >                 fi;;
> > @@ -109,7 +110,7 @@ index a7de901..4a3681f 100644
> >                   *gcc*)
> >                     if $CC -Xlinker --help 2>&1 | grep export-dynamic
> >/dev/null
> >                     then
> > -@@ -5429,7 +5430,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> > +@@ -5362,7 +5363,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> >       # Some versions of gcc miscompile inline asm:
> >       # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
> >       # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
> > diff --git
> a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> b/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> > deleted file mode 100644
> > index 58ab709028e..00000000000
> > ---
> a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
> > +++ /dev/null
> > @@ -1,199 +0,0 @@
> > -From fa96a7fd19e17b9c6b4dd01c3c3774fb382dddc6 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Wed, 5 Sep 2018 11:45:52 +0100
> > -Subject: [PATCH] Don't do runtime test to get float byte order
> > -
> > -Python uses AC_RUN_IFELSE to determine the byte order for floats and
> doubles,
> > -and falls back onto "I don't know" if it can't run code.  This results
> in
> > -crippled floating point numbers in Python, and the regression tests
> fail.
> > -
> > -Instead of running code, take a macro from autoconf-archive which
> compiles C
> > -with a special double in which has an ASCII representation, and then
> greps the
> > -binary to identify the format.
> > -
> > -Upstream-Status: Backport [2a9c3805ddedf282881ef7811a561c70b74f80b1]
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ----
> > - configure.ac                     | 72 +++------------------------
> > - m4/ax_c_float_words_bigendian.m4 | 83 ++++++++++++++++++++++++++++++++
> > - 2 files changed, 90 insertions(+), 65 deletions(-)
> > - create mode 100644 m4/ax_c_float_words_bigendian.m4
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 4a3681f..4ab19a6 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -4328,77 +4328,19 @@ fi
> > - # * Check for various properties of floating point *
> > - # **************************************************
> > -
> > --AC_MSG_CHECKING(whether C doubles are little-endian IEEE 754 binary64)
> > --AC_CACHE_VAL(ac_cv_little_endian_double, [
> > --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > --#include <string.h>
> > --int main() {
> > --    double x = 9006104071832581.0;
> > --    if (memcmp(&x, "\x05\x04\x03\x02\x01\xff\x3f\x43", 8) == 0)
> > --        return 0;
> > --    else
> > --        return 1;
> > --}
> > --]])],
> > --[ac_cv_little_endian_double=yes],
> > --[ac_cv_little_endian_double=no],
> > --[ac_cv_little_endian_double=no])])
> > --AC_MSG_RESULT($ac_cv_little_endian_double)
> > --if test "$ac_cv_little_endian_double" = yes
> > --then
> > --  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> > --  [Define if C doubles are 64-bit IEEE 754 binary format, stored
> > --   with the least significant byte first])
> > --fi
> > --
> > --AC_MSG_CHECKING(whether C doubles are big-endian IEEE 754 binary64)
> > --AC_CACHE_VAL(ac_cv_big_endian_double, [
> > --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > --#include <string.h>
> > --int main() {
> > --    double x = 9006104071832581.0;
> > --    if (memcmp(&x, "\x43\x3f\xff\x01\x02\x03\x04\x05", 8) == 0)
> > --        return 0;
> > --    else
> > --        return 1;
> > --}
> > --]])],
> > --[ac_cv_big_endian_double=yes],
> > --[ac_cv_big_endian_double=no],
> > --[ac_cv_big_endian_double=no])])
> > --AC_MSG_RESULT($ac_cv_big_endian_double)
> > --if test "$ac_cv_big_endian_double" = yes
> > -+AX_C_FLOAT_WORDS_BIGENDIAN
> > -+if test "$ax_cv_c_float_words_bigendian" = "yes"
> > - then
> > -   AC_DEFINE(DOUBLE_IS_BIG_ENDIAN_IEEE754, 1,
> > -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> > -    with the most significant byte first])
> > --fi
> > --
> > --# Some ARM platforms use a mixed-endian representation for doubles.
> > --# While Python doesn't currently have full support for these platforms
> > --# (see e.g., issue 1762561), we can at least make sure that float <->
> string
> > --# conversions work.
> > --AC_MSG_CHECKING(whether C doubles are ARM mixed-endian IEEE 754
> binary64)
> > --AC_CACHE_VAL(ac_cv_mixed_endian_double, [
> > --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> > --#include <string.h>
> > --int main() {
> > --    double x = 9006104071832581.0;
> > --    if (memcmp(&x, "\x01\xff\x3f\x43\x05\x04\x03\x02", 8) == 0)
> > --        return 0;
> > --    else
> > --        return 1;
> > --}
> > --]])],
> > --[ac_cv_mixed_endian_double=yes],
> > --[ac_cv_mixed_endian_double=no],
> > --[ac_cv_mixed_endian_double=no])])
> > --AC_MSG_RESULT($ac_cv_mixed_endian_double)
> > --if test "$ac_cv_mixed_endian_double" = yes
> > -+elif test "$ax_cv_c_float_words_bigendian" = "no"
> > - then
> > --  AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,
> > -+  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> > -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> > --   in ARM mixed-endian order (byte order 45670123)])
> > -+   with the least significant byte first])
> > -+else
> > -+  AC_MSG_ERROR([Cannot identify floating point byte order])
> > - fi
> > -
> > - # The short float repr introduced in Python 3.1 requires the
> > -diff --git a/m4/ax_c_float_words_bigendian.m4
> b/m4/ax_c_float_words_bigendian.m4
> > -new file mode 100644
> > -index 0000000..216b90d
> > ---- /dev/null
> > -+++ b/m4/ax_c_float_words_bigendian.m4
> > -@@ -0,0 +1,83 @@
> > -+#
> ===============================================================================
> > -+#
> https://www.gnu.org/software/autoconf-archive/ax_c_float_words_bigendian.html
> > -+#
> ===============================================================================
> > -+#
> > -+# SYNOPSIS
> > -+#
> > -+#   AX_C_FLOAT_WORDS_BIGENDIAN([ACTION-IF-TRUE], [ACTION-IF-FALSE],
> [ACTION-IF-UNKNOWN])
> > -+#
> > -+# DESCRIPTION
> > -+#
> > -+#   Checks the ordering of words within a multi-word float. This check
> is
> > -+#   necessary because on some systems (e.g. certain ARM systems), the
> float
> > -+#   word ordering can be different from the byte ordering. In a
> multi-word
> > -+#   float context, "big-endian" implies that the word containing the
> sign
> > -+#   bit is found in the memory location with the lowest address. This
> > -+#   implementation was inspired by the AC_C_BIGENDIAN macro in
> autoconf.
> > -+#
> > -+#   The endianness is detected by first compiling C code that contains
> a
> > -+#   special double float value, then grepping the resulting object
> file for
> > -+#   certain strings of ASCII values. The double is specially crafted
> to have
> > -+#   a binary representation that corresponds with a simple string. In
> this
> > -+#   implementation, the string "noonsees" was selected because the
> > -+#   individual word values ("noon" and "sees") are palindromes, thus
> making
> > -+#   this test byte-order agnostic. If grep finds the string "noonsees"
> in
> > -+#   the object file, the target platform stores float words in
> big-endian
> > -+#   order. If grep finds "seesnoon", float words are in little-endian
> order.
> > -+#   If neither value is found, the user is instructed to specify the
> > -+#   ordering.
> > -+#
> > -+# LICENSE
> > -+#
> > -+#   Copyright (c) 2008 Daniel Amelang <dan@amelang.net>
> > -+#
> > -+#   Copying and distribution of this file, with or without
> modification, are
> > -+#   permitted in any medium without royalty provided the copyright
> notice
> > -+#   and this notice are preserved. This file is offered as-is, without
> any
> > -+#   warranty.
> > -+
> > -+#serial 11
> > -+
> > -+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
> > -+  [AC_CACHE_CHECK(whether float word ordering is bigendian,
> > -+                  ax_cv_c_float_words_bigendian, [
> > -+
> > -+ax_cv_c_float_words_bigendian=unknown
> > -+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> > -+
> > -+double d =
> 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
> > -+
> > -+]])], [
> > -+
> > -+if grep noonsees conftest.$ac_objext >/dev/null ; then
> > -+  ax_cv_c_float_words_bigendian=yes
> > -+fi
> > -+if grep seesnoon conftest.$ac_objext >/dev/null ; then
> > -+  if test "$ax_cv_c_float_words_bigendian" = unknown; then
> > -+    ax_cv_c_float_words_bigendian=no
> > -+  else
> > -+    ax_cv_c_float_words_bigendian=unknown
> > -+  fi
> > -+fi
> > -+
> > -+])])
> > -+
> > -+case $ax_cv_c_float_words_bigendian in
> > -+  yes)
> > -+    m4_default([$1],
> > -+      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
> > -+                 [Define to 1 if your system stores words within floats
> > -+                  with the most significant word first])]) ;;
> > -+  no)
> > -+    $2 ;;
> > -+  *)
> > -+    m4_default([$3],
> > -+      [AC_MSG_ERROR([
> > -+
> > -+Unknown float word ordering. You need to manually preset
> > -+ax_cv_c_float_words_bigendian=no (or yes) according to your system.
> > -+
> > -+    ])]) ;;
> > -+esac
> > -+
> > -+])# AX_C_FLOAT_WORDS_BIGENDIAN
> > diff --git
> a/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> b/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > deleted file mode 100644
> > index b9d5bc9c516..00000000000
> > ---
> a/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > +++ /dev/null
> > @@ -1,80 +0,0 @@
> > -From b881a79adcd4ae5ac8fe4f49d0fc77c47f777919 Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Fri, 4 Aug 2017 11:16:14 +0800
> > -Subject: [PATCH] setup.py: pass missing libraries to Extension for
> > - multiprocessing module
> > -
> > -In the following commit:
> > -...
> > -commit e711cafab13efc9c1fe6c5cd75826401445eb585
> > -Author: Benjamin Peterson <benjamin@python.org>
> > -Date:   Wed Jun 11 16:44:04 2008 +0000
> > -
> > -    Merged revisions 64104,64117 via svnmerge from
> > -    svn+ssh://pythondev@svn.python.org/python/trunk
> > -...
> > -(see diff in setup.py)
> > -It assigned libraries for multiprocessing module according
> > -the host_platform, but not pass it to Extension.
> > -
> > -In glibc, the following commit caused two definition of
> > -sem_getvalue are different.
> > -
> https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
> > -(see diff in nptl/sem_getvalue.c for detail)
> > -`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
> > -and `__old_sem_getvalue' is to compat the old version
> > -sem_getvalue@GLIBC_2.0.
> > -
> > -To build python for embedded Linux systems:
> > -
> http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
> > -If not explicitly link to library pthread (-lpthread), it will
> > -load glibc's sem_getvalue randomly at runtime.
> > -
> > -Such as build python on linux x86_64 host and run the python
> > -on linux x86_32 target. If not link library pthread, it caused
> > -multiprocessing bounded semaphore could not work correctly.
> > -...
> > ->>> import multiprocessing
> > ->>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
> > ->>> pool_sema.acquire()
> > -True
> > ->>> pool_sema.release()
> > -Traceback (most recent call last):
> > -  File "<stdin>", line 1, in <module>
> > -ValueError: semaphore or lock released too many times
> > -...
> > -
> > -And the semaphore issue also caused multiprocessing.Queue().put() hung.
> > -
> > -Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999
> ]
> > -
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - setup.py | 7 +++++--
> > - 1 file changed, 5 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/setup.py b/setup.py
> > -index b7a36a6..658ead3 100644
> > ---- a/setup.py
> > -+++ b/setup.py
> > -@@ -1584,8 +1584,10 @@ class PyBuildExt(build_ext):
> > -         elif host_platform.startswith('netbsd'):
> > -             macros = dict()
> > -             libraries = []
> > --
> > --        else:                                   # Linux and other
> unices
> > -+        elif host_platform.startswith(('linux')):
> > -+            macros = dict()
> > -+            libraries = ['pthread']
> > -+        else:                                   # Other unices
> > -             macros = dict()
> > -             libraries = ['rt']
> > -
> > -@@ -1603,6 +1605,7 @@ class PyBuildExt(build_ext):
> > -
> > -         exts.append ( Extension('_multiprocessing',
> multiprocessing_srcs,
> > -                                 define_macros=list(macros.items()),
> > -+                                libraries=libraries,
> > -
>  include_dirs=["Modules/_multiprocessing"]))
> > -         # End multiprocessing
> > -
> > diff --git
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> > index c15295c034c..4bd98f62fd6 100644
> > ---
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> > +++
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> > @@ -1,4 +1,4 @@
> > -From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 2001
> > +From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 7 Oct 2019 13:22:14 +0200
> >  Subject: [PATCH] setup.py: do not report missing dependencies for
> disabled
> > @@ -10,22 +10,23 @@ build completeness checker which relies on the
> report.
> >
> >  Upstream-Status: Inappropriate [oe-core specific]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   setup.py | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> >  diff --git a/setup.py b/setup.py
> > -index 4b53668..0097643 100644
> > +index 7691258..ec3f2a4 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):
> > +@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
> >                   print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
> >                                                 longest, g))
> >
> >  +        # There is no need to report missing module dependencies,
> >  +        # if the modules have been disabled in the first place.
> > -+        missing = list(set(missing) - set(sysconf_dis))
> > ++        self.missing = list(set(self.missing) - set(sysconf_dis))
> >  +
> > -         if missing:
> > +         if self.missing:
> >               print()
> >               print("Python build finished successfully!")
> > diff --git
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> > index d49604ba4d9..219b3551b8b 100644
> > ---
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> > +++
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> > @@ -1,4 +1,4 @@
> > -From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 2001
> > +From 93b2c26467b0ea9a18c178e4e1371d52e917a68b Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 14 May 2013 15:00:26 -0700
> >  Subject: [PATCH] python3: Add target and native recipes
> > diff --git
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> > index 24e67b4ca14..184540e794c 100644
> > ---
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> > +++
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> > @@ -1,4 +1,4 @@
> > -From fead48c8b501a8d7c3db21df2e599f90f38f11d3 Mon Sep 17 00:00:00 2001
> > +From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001
> >  From: Andrei Gherzan <andrei@gherzan.ro>
> >  Date: Mon, 28 Jan 2019 15:57:54 +0000
> >  Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is
> not yet
> > @@ -11,26 +11,21 @@ Also simply disable the tk module since its not in
> DEPENDS.
> >  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >
> >  ---
> > - setup.py | 8 +++++---
> > - 1 file changed, 5 insertions(+), 3 deletions(-)
> > + setup.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/setup.py b/setup.py
> > -index fbec00d..b7a36a6 100644
> > +index ab18ff0..7691258 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -1623,10 +1623,12 @@ class PyBuildExt(build_ext):
> > -         self.extensions.extend(exts)
> > +@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):
> > +         self.detect_decimal()
> > +         self.detect_ctypes()
> > +         self.detect_multiprocessing()
> > +-        if not self.detect_tkinter():
> > +-            self.missing.append('_tkinter')
> > ++#        if not self.detect_tkinter():
> > ++#            self.missing.append('_tkinter')
> > +         self.detect_uuid()
> >
> > -         # Call the method for detecting whether _tkinter can be
> compiled
> > --        self.detect_tkinter(inc_dirs, lib_dirs)
> > -+        # self.detect_tkinter(inc_dirs, lib_dirs)
> > -
> > --        if '_tkinter' not in [e.name for e in self.extensions]:
> > --            missing.append('_tkinter')
> > -+        # tkinter module will not be avalaible as yocto
> > -+        # doesn't have tk integrated (yet)
> > -+        #if '_tkinter' not in [e.name for e in self.extensions]:
> > -+        #    missing.append('_tkinter')
> > -
> > -         # Build the _uuid module if possible
> > -         uuid_incs = find_file("uuid.h", inc_dirs,
> ["/usr/include/uuid"])
> > + ##         # Uncomment these lines if you want to play with xxmodule.c
> > diff --git a/meta/recipes-devtools/python/python3/python-config.patch
> b/meta/recipes-devtools/python/python3/python-config.patch
> > index f23b8b7df06..c8a8f3d4aa3 100644
> > --- a/meta/recipes-devtools/python/python3/python-config.patch
> > +++ b/meta/recipes-devtools/python/python3/python-config.patch
> > @@ -1,4 +1,7 @@
> > -python-config: Revert to using distutils.sysconfig
> > +From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 2001
> > +From: Tyler Hall <tylerwhall@gmail.com>
> > +Date: Sun, 4 May 2014 20:06:43 -0400
> > +Subject: [PATCH] python-config: Revert to using distutils.sysconfig
> >
> >  The newer sysconfig module shares some code with distutils.sysconfig,
> but the same modifications as in
> >
> > @@ -12,11 +15,16 @@ Upstream-Status: Inappropriate [Embedded Specific]
> >
> >  Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> >  :
> > -Index: Python-3.3.3/Misc/python-config.in
> > -===================================================================
> > ---- Python-3.3.3.orig/Misc/python-config.in
> > -+++ Python-3.3.3/Misc/python-config.in
> > -@@ -4,7 +4,7 @@
> > +
> > +---
> > + Misc/python-config.in | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/Misc/python-config.in b/Misc/python-config.in
> > +index 727c4a8..c702829 100644
> > +--- a/Misc/python-config.in
> > ++++ b/Misc/python-config.in
> > +@@ -6,7 +6,7 @@
> >   import getopt
> >   import os
> >   import sys
> > @@ -24,8 +32,8 @@ Index: Python-3.3.3/Misc/python-config.in
> >  +from distutils import sysconfig
> >
> >   valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
> > -               'ldflags', 'extension-suffix', 'help', 'abiflags',
> 'configdir']
> > -@@ -32,14 +32,14 @@ if '--help' in opt_flags:
> > +               'ldflags', 'extension-suffix', 'help', 'abiflags',
> 'configdir',
> > +@@ -35,14 +35,14 @@ if '--help' in opt_flags:
> >
> >   for opt in opt_flags:
> >       if opt == '--prefix':
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index dba92b0e396..ebfc10b4045 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -213,8 +213,8 @@
> >              "${bindir}/python3",
> >              "${bindir}/python${PYTHON_MAJMIN}",
> >              "${bindir}/python${PYTHON_MAJMIN}.real",
> > -            "${bindir}/python${PYTHON_BINABI}",
> > -            "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
> > +            "${bindir}/python${PYTHON_MAJMIN}",
> > +            "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
> >              "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]",
> >              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
> > diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb
> b/meta/recipes-devtools/python/python3_3.8.0.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/python/python3_3.7.5.bb
> > rename to meta/recipes-devtools/python/python3_3.8.0.bb
> > index 57eaaea5e7c..1feaebea8ee 100644
> > --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> > +++ b/meta/recipes-devtools/python/python3_3.8.0.bb
> > @@ -19,8 +19,6 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >
>  file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
> >
>  file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
> >
>  file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
> > -
>  file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
> > -
>  file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
> >
>  file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
> >
>  file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
> >
>  file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
> > @@ -35,20 +33,16 @@ SRC_URI_append_class-native = " \
> >
>  file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
> >             file://12-distutils-prefix-is-inside-staging-area.patch \
> >             "
> > -SRC_URI_append_class-nativesdk = " \
> > -
>  file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
> > -           "
> >
> > -SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
> > -SRC_URI[sha256sum] =
> "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
> > +SRC_URI[md5sum] = "dbac8df9d8b9edc678d0f4cacdb7dbb0"
> > +SRC_URI[sha256sum] =
> "b356244e13fb5491da890b35b13b2118c3122977c2cd825e3eb6e7d462030d84"
> >
> >  # exclude pre-releases for both python 2.x and 3.x
> >  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> >
> >  CVE_PRODUCT = "python"
> >
> > -PYTHON_MAJMIN = "3.7"
> > -PYTHON_BINABI = "${PYTHON_MAJMIN}m"
> > +PYTHON_MAJMIN = "3.8"
> >
> >  S = "${WORKDIR}/Python-${PV}"
> >
> > @@ -59,8 +53,8 @@ inherit autotools pkgconfig qemu ptest multilib_header
> update-alternatives
> >  MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> >
> >  ALTERNATIVE_${PN}-dev = "python3-config"
> > -ALTERNATIVE_LINK_NAME[python3-config] =
> "${bindir}/python${PYTHON_BINABI}-config"
> > -ALTERNATIVE_TARGET[python3-config] =
> "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> > +ALTERNATIVE_LINK_NAME[python3-config] =
> "${bindir}/python${PYTHON_MAJMIN}-config"
> > +ALTERNATIVE_TARGET[python3-config] =
> "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
> >
> >
> >  DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib
> virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
> > @@ -131,7 +125,7 @@ do_install_prepend() {
> >  }
> >
> >  do_install_append_class-target() {
> > -        oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> > +        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> >  }
> >
> >  do_install_append_class-native() {
> > @@ -161,7 +155,7 @@ do_install_append() {
> >  }
> >
> >  do_install_append_class-nativesdk () {
> > -    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> OEPYTHON3HOME='${prefix}'
> TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE='1'
> > +    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE='1'
> >  }
> >
> >  SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> > @@ -177,7 +171,7 @@ py_package_preprocess () {
> >                  -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> >
> ${PKGD}/${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
> \
> >
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
> > -                ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> > +                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
> >
> >          # Reformat _sysconfigdata after modifying it so that it remains
> >          # reproducible
> > @@ -196,7 +190,7 @@ py_package_preprocess () {
> >               -c "from py_compile import compile;
> compile('$sysconfigfile', optimize=2)"
> >          cd -
> >
> > -        mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> > +        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
> ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
> >
> >          #Remove the unneeded copy of target sysconfig data
> >          rm -rf ${PKGD}/${libdir}/python-sysconfigdata
> > @@ -322,7 +316,7 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
> >  # package libpython3
> >  PACKAGES =+ "libpython3 libpython3-staticdev"
> >  FILES_libpython3 = "${libdir}/libpython*.so.*"
> > -FILES_libpython3-staticdev +=
> "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> > +FILES_libpython3-staticdev +=
> "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
> >  INSANE_SKIP_${PN}-dev += "dev-elf"
> >
> >  # catch all the rest (unsorted)
> > @@ -341,3 +335,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "
> locale-base-tr-tr.iso-8859-9"
> >  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk',
> 'tk tk-lib', '', d)}"
> >  RDEPENDS_${PN}-dev = ""
> >
> > +RDEPENDS_${PN}-tests_append_class-target = " bash"
> > +RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002bec4d059943ddd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As RP said, the problematic pieces will be tested and=
 fixed one by one, I guess I was too optimistic about this patchset&#39;s m=
aturity.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 7 Dec 2019 at 16:48=
, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">besi=
des gettext this is another reason I suppose causing a few more failures se=
e<br>
<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Build/94077/" rel=3D"noref=
errer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Build/94077/=
</a><br>
<br>
all do_prepare_recipe_sysroot seems to be failing in python snippets.<br>
and do_configure aree also related to native python missing modules<br>
do_compile are mostly related to gettext.<br>
<br>
On Thu, Dec 5, 2019 at 7:45 AM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Drop backports, rebase other patches.<br>
&gt;<br>
&gt; One patch I wasn&#39;t able to rebase as upstream code changed too muc=
h:<br>
&gt; 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch<br>
&gt; Please determine if it is still needed, produce a new version,<br>
&gt; and work with upstream to get it merged.<br>
&gt;<br>
&gt; 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch<br>
&gt; is removed as the use case (allowing python 2 and 3 to coexist<br>
&gt; in SDKs) is no longer relevant with Python 2.x reaching end of line<br=
>
&gt; and upstream has refactored the code making a rebase difficult.<br>
&gt; If needed, please re-add the patch to py2, rather than py3.<br>
&gt;<br>
&gt; Python 3.8 no longer adds &quot;m&quot; to &quot;3.8&quot; in paths, s=
o adjust the recipes<br>
&gt; and classes accordingly.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 ...ib-termcap-to-linker-flags-to-avoid-.patch |=C2=A0 14 +-<br>
&gt;=C2=A0 ...lib-as-location-for-site-packages-an.patch | 156 ++++++++----=
--<br>
&gt;=C2=A0 ...-detection-of-mips-architecture-for-.patch |=C2=A0 16 +-<br>
&gt;=C2=A0 ...fig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...ON3HOME-is-set-use-instead-of-PYTHON.patch |=C2=A0 47 -----<b=
r>
&gt;=C2=A0 ...asename-to-replace-CC-for-checking-c.patch |=C2=A0 37 ++--<br=
>
&gt;=C2=A0 ...runtime-test-to-get-float-byte-order.patch | 199 ------------=
------<br>
&gt;=C2=A0 ...ssing-libraries-to-Extension-for-mul.patch |=C2=A0 80 -------=
<br>
&gt;=C2=A0 ...report-missing-dependencies-for-disa.patch |=C2=A0 11 +-<br>
&gt;=C2=A0 ...tutils-prefix-is-inside-staging-area.patch |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 .../python3/avoid_warning_about_tkinter.patch |=C2=A0 33 ++-<br>
&gt;=C2=A0 .../python/python3/python-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 24 ++-<br>
&gt;=C2=A0 .../python/python3/python3-manifest.json=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://python3_3.7.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3_3.7.5.bb</a> =3D&gt; <a href=3D"http://python3_3.8.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.0.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 28 ++-<br>
&gt;=C2=A0 15 files changed, 175 insertions(+), 482 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3/0001-mai=
n.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3/0002-Don=
-t-do-runtime-test-to-get-float-byte-order.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3/0003-set=
up.py-pass-missing-libraries-to-Extension-for-mul.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3_3=
.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a> =3D&gt; =
<a href=3D"http://python3_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3_3.8.0.bb</a>} (91%)<br>
&gt;<br>
&gt; diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-d=
ir.bbclass<br>
&gt; index 7dd130bad99..036d7140d99 100644<br>
&gt; --- a/meta/classes/python3-dir.bbclass<br>
&gt; +++ b/meta/classes/python3-dir.bbclass<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -PYTHON_BASEVERSION =3D &quot;3.7&quot;<br>
&gt; -PYTHON_ABI =3D &quot;m&quot;<br>
&gt; +PYTHON_BASEVERSION =3D &quot;3.8&quot;<br>
&gt; +PYTHON_ABI =3D &quot;&quot;<br>
&gt;=C2=A0 PYTHON_DIR =3D &quot;python${PYTHON_BASEVERSION}&quot;<br>
&gt;=C2=A0 PYTHON_PN =3D &quot;python3&quot;<br>
&gt;=C2=A0 PYTHON_SITEPACKAGES_DIR =3D &quot;${libdir}/${PYTHON_DIR}/site-p=
ackages&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-=
lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/=
python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch<br>
&gt; index 09f279ba1d7..59592821d7f 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-ter=
mcap-to-linker-flags-to-avoid-.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-ter=
mcap-to-linker-flags-to-avoid-.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 23294c6ba6896115828293fdb7e67b47b38ba675 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 25 Jan 2019 19:04:13 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to =
avoid host<br>
&gt; @@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/setup.py b/setup.py<br>
&gt; -index b4357e3..fbec00d 100644<br>
&gt; +index 20d7f35..ab18ff0 100644<br>
&gt;=C2=A0 --- a/setup.py<br>
&gt;=C2=A0 +++ b/setup.py<br>
&gt; -@@ -856,7 +856,6 @@ class PyBuildExt(build_ext):<br>
&gt; +@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;termcap&#39;):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
adline_libs.append(&#39;termcap&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exts.append( Extensio=
n(&#39;readline&#39;, [&#39;readline.c&#39;],<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library_dirs=3D[=
&#39;/usr/lib/termcap&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_link_args=3D=
readline_extra_link_args,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dreadli=
ne_libs) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.add(Extension(&#=
39;readline&#39;, [&#39;readline.c&#39;],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library_dirs=3D[&#39;/usr/lib/=
termcap&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_link_args=3Dreadline_extra=
_link_args,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dreadline_libs))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode=
-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/=
python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch<br>
&gt; index ea75262c4f6..112c979441f 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as=
-location-for-site-packages-an.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as=
-location-for-site-packages-an.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0fbdad1eaf541a8e92be81f39514cd249b3b0801 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a078b6ff1492e848ad1055764fb9a414abaf3e12 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 5 Feb 2019 15:52:02 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Do not hardcode &quot;lib&quot; as location for=
 modules, site-packages<br>
&gt; @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0Include/pythonrun.h=C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0Lib/site.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++=
--<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" targ=
et=3D"_blank">Makefile.pre.in</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
&gt; - Modules/getpath.c=C2=A0 =C2=A0 | 18 ++++++++++++------<br>
&gt; + Modules/getpath.c=C2=A0 =C2=A0 | 22 ++++++++++++++--------<br>
&gt;=C2=A0 =C2=A0Python/getplatform.c | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0Python/sysmodule.c=C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt; - 6 files changed, 31 insertions(+), 10 deletions(-)<br>
&gt; + 6 files changed, 33 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/Include/pythonrun.h b/Include/pythonrun.h<br>
&gt; -index 6f0c6fc..0a17edd 100644<br>
&gt; +index 46091e0..61b2e15 100644<br>
&gt;=C2=A0 --- a/Include/pythonrun.h<br>
&gt;=C2=A0 +++ b/Include/pythonrun.h<br>
&gt;=C2=A0 @@ -7,6 +7,8 @@<br>
&gt; @@ -28,12 +28,12 @@ index 6f0c6fc..0a17edd 100644<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0#ifndef Py_LIMITED_API<br>
&gt;=C2=A0 =C2=A0PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCo=
mpilerFlags *);<br>
&gt; - PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerF=
lags *);<br>
&gt; + PyAPI_FUNC(int) PyRun_AnyFileExFlags(<br>
&gt;=C2=A0 diff --git a/Lib/site.py b/Lib/site.py<br>
&gt; -index ffd132b..b55f6d8 100644<br>
&gt; +index a065ab0..1d720ef 100644<br>
&gt;=C2=A0 --- a/Lib/site.py<br>
&gt;=C2=A0 +++ b/Lib/site.py<br>
&gt; -@@ -334,12 +334,12 @@ def getsitepackages(prefixes=3DNone):<br>
&gt; +@@ -335,12 +335,12 @@ def getsitepackages(prefixes=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen.add(prefix)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.sep =3D=3D &#39;/&#39;:<=
br>
&gt; @@ -49,10 +49,10 @@ index ffd132b..b55f6d8 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0def addsitepackages(known_paths, prefixes=3DNone):<br>
&gt;=C2=A0 diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferre=
r" target=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.i=
n" rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
&gt; -index 6e81b2f..671a20e 100644<br>
&gt; +index 65665df..be49140 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" targ=
et=3D"_blank">Makefile.pre.in</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" targ=
et=3D"_blank">Makefile.pre.in</a><br>
&gt; -@@ -142,7 +142,7 @@ LIBDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @libdir@<br>
&gt; +@@ -143,7 +143,7 @@ LIBDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @libdir@<br>
&gt;=C2=A0 =C2=A0MANDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0@mandir@<br>
&gt;=C2=A0 =C2=A0INCLUDEDIR=3D=C2=A0 =C2=A0@includedir@<br>
&gt;=C2=A0 =C2=A0CONFINCLUDEDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0$(exec_prefix)=
/include<br>
&gt; @@ -61,7 +61,7 @@ index 6e81b2f..671a20e 100644<br>
&gt;=C2=A0 =C2=A0ABIFLAGS=3D=C2=A0 =C2=A0 =C2=A0@ABIFLAGS@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Detailed destination directories<br>
&gt; -@@ -768,6 +768,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Ma=
kefile<br>
&gt; +@@ -753,6 +753,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Ma=
kefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DEXEC_PR=
EFIX=3D&#39;&quot;$(exec_prefix)&quot;&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DVERSION=
=3D&#39;&quot;$(VERSION)&quot;&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DVPATH=
=3D&#39;&quot;$(VPATH)&quot;&#39; \<br>
&gt; @@ -69,7 +69,7 @@ index 6e81b2f..671a20e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o $@ $(s=
rcdir)/Modules/getpath.c<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Programs/python.o: $(srcdir)/Programs/python.c<br>
&gt; -@@ -856,7 +857,7 @@ regen-opcode:<br>
&gt; +@@ -868,7 +869,7 @@ regen-symbol: $(srcdir)/Include/graminit.h<br>
&gt;=C2=A0 =C2=A0Python/compile.o Python/symtable.o Python/ast_unparse.o Py=
thon/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h =
$(srcdir)/Include/Python-ast.h<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Python/getplatform.o: $(srcdir)/Python/getplatform.c<br>
&gt; @@ -79,72 +79,90 @@ index 6e81b2f..671a20e 100644<br>
&gt;=C2=A0 =C2=A0Python/importdl.o: $(srcdir)/Python/importdl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -c =
$(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c<br>
&gt;=C2=A0 diff --git a/Modules/getpath.c b/Modules/getpath.c<br>
&gt; -index e6a3e8e..0c62af6 100644<br>
&gt; +index b727f66..c003e46 100644<br>
&gt;=C2=A0 --- a/Modules/getpath.c<br>
&gt;=C2=A0 +++ b/Modules/getpath.c<br>
&gt; -@@ -123,6 +123,7 @@ typedef struct {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0wchar_t *exec_prefix;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* EXEC_PREFIX define */<br>
&gt; +@@ -128,6 +128,7 @@ typedef struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wchar_t *exec_prefix;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* EXEC_PREFIX macro */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wchar_t *lib_python;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* &quot;lib/pythonX.Y&quot; */<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 wchar_t *multilib_python;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* &quot;lib[suffix]/pythonX.Y&quot; */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0wchar_t argv0_path[MAXPATHLEN+1];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0wchar_t zip_path[MAXPATHLEN+1];=C2=A0 =C2=A0 /* &=
quot;.../lib/pythonXY.zip&quot; */<br>
&gt;<br>
&gt; -@@ -314,7 +315,7 @@ search_for_prefix(const _PyCoreConfig *core_confi=
g,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int prefix_found;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* found platform independent libraries? */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int exec_prefix_found;=C2=A0 =C2=A0 /* found the =
platform dependent libraries? */<br>
&gt; +@@ -386,7 +387,7 @@ search_for_prefix(PyCalculatePath *calculate, _Py=
PathConfig *pathconfig,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (delim) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*delim =3D L&#39=
;\0&#39;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;lib_pytho=
n);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;multilib_=
python);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0joinpath(prefix, LANDMARK);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -343,7 +344,7 @@ search_for_prefix(const _PyCoreConfig *core_confi=
g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0copy_absolute(prefix, calculate-&gt;argv0_path, M=
AXPATHLEN+1);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;lib_python, prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;multilib_python, prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -444,7 +445,7 @@ search_for_prefix(PyCalculatePath *calculate, _Py=
PathConfig *pathconfig,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D wcslen(prefix);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;lib_pytho=
n);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;multilib_=
python);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0joinpath(prefix, LANDMARK);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ismodule(prefix)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -@@ -355,7 +356,7 @@ search_for_prefix(const _PyCoreConfig *core_confi=
g,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Look at configure&#39;s PREFIX */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0wcsncpy(prefix, calculate-&gt;prefix, MAXPATHLEN)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0prefix[MAXPATHLEN] =3D L&#39;\0&#39;;<br>
&gt; --=C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;lib_python);<br>
&gt; -+=C2=A0 =C2=A0 joinpath(prefix, calculate-&gt;multilib_python);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0joinpath(prefix, LANDMARK);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ismodule(prefix)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -@@ -427,7 +428,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_=
config,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wcsncpy(exec_prefix, =
core_config-&gt;home, MAXPATHLEN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Path: &lt;argv0_path or substrin=
g&gt; / &lt;lib_python&gt; / LANDMARK */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n =3D wcslen(prefix);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;lib_python, prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;multilib_python, prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_prefix[MAXPATHLEN] =3D L&#39;\=
0&#39;;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;lib_=
python);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;mult=
ilib_python);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0joinpath(exec_prefix, L&quot;lib-dy=
nload&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; +@@ -467,7 +468,7 @@ search_for_prefix(PyCalculatePath *calculate, _Py=
PathConfig *pathconfig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(prefix, calculate-&gt;prefix, pre=
fix_len) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;lib_python, =
prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&gt;multilib_pyt=
hon, prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -464,7 +465,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_=
config,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0copy_absolute(exec_prefix, calculate-&gt;argv0_pa=
th, MAXPATHLEN+1);<br>
&gt; +@@ -510,7 +511,7 @@ calculate_prefix(PyCalculatePath *calculate, _PyP=
athConfig *pathconfig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(prefix, calculate-&=
gt;prefix, prefix_len) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;lib_python, prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(prefix, calculate-&g=
t;multilib_python, prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -635,7 +636,7 @@ search_for_exec_prefix(PyCalculatePath *calculate=
, _PyPathConfig *pathconfig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
PATHLEN_ERR();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calcula=
te-&gt;lib_python, exec_prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calcula=
te-&gt;multilib_python, exec_prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -667,7 +668,7 @@ search_for_exec_prefix(PyCalculatePath *calculate=
, _PyPathConfig *pathconfig,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D wcslen(exec_prefix);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;lib_=
python);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;mult=
ilib_python);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0joinpath(exec_prefix, L&quot;lib-dy=
nload&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (isdir(exec_prefix)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -@@ -476,7 +477,7 @@ search_for_exec_prefix(const _PyCoreConfig *core_=
config,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Look at configure&#39;s EXEC_PREFIX */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0wcsncpy(exec_prefix, calculate-&gt;exec_prefix, M=
AXPATHLEN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0exec_prefix[MAXPATHLEN] =3D L&#39;\0&#39;;<br>
&gt; --=C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;lib_python);<br>
&gt; -+=C2=A0 =C2=A0 joinpath(exec_prefix, calculate-&gt;multilib_python);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0joinpath(exec_prefix, L&quot;lib-dynload&quot;);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (isdir(exec_prefix)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -@@ -871,6 +872,10 @@ calculate_init(PyCalculatePath *calculate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Path: &lt;argv0_path or substrin=
g&gt; / &lt;lib_python&gt; / &quot;lib-dynload&quot; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n =3D wcslen(exec_prefix);<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calcula=
te-&gt;lib_python, exec_prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calcula=
te-&gt;multilib_python, exec_prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -689,7 +690,7 @@ search_for_exec_prefix(PyCalculatePath *calculate=
, _PyPathConfig *pathconfig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (safe_wcscpy(exec_prefix, calculate-&gt;exec_p=
refix, exec_prefix_len) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&gt;lib_pyt=
hon, exec_prefix_len);<br>
&gt; ++=C2=A0 =C2=A0 status =3D joinpath(exec_prefix, calculate-&gt;multili=
b_python, exec_prefix_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -928,7 +929,7 @@ calculate_argv0_path(PyCalculatePath *calculate, =
const wchar_t *program_full_pat<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PATHLEN_ERR();=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reduce(argv0_path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(argv0_path, calculat=
e-&gt;lib_python, argv0_path_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D joinpath(argv0_path, calculat=
e-&gt;multilib_python, argv0_path_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_PyStatus_EXCEPTION(status)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PyMem_RawFree(wbuf);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +@@ -1201,6 +1202,10 @@ calculate_init(PyCalculatePath *calculate, con=
st PyConfig *config)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!calculate-&gt;lib_python) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DECODE_LOCALE_ERR(&quot=
;EXEC_PREFIX define&quot;, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -152,10 +170,10 @@ index e6a3e8e..0c62af6 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if (!calculate-&gt;multilib_python) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DECODE_LOCALE_ERR(&quot;EXEC=
_PREFIX define&quot;, len);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return _Py_INIT_OK();<br>
&gt; - }<br>
&gt;<br>
&gt; -@@ -882,6 +887,7 @@ calculate_free(PyCalculatePath *calculate)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0calculate-&gt;warnings =3D config-&gt;pathconfig_=
warnings;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0calculate-&gt;pythonpath_env =3D config-&gt;pytho=
npath_env;<br>
&gt; +@@ -1216,6 +1221,7 @@ calculate_free(PyCalculatePath *calculate)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;prefix);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;exec_prefix);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PyMem_RawFree(calculate-&gt;lib_python);<br>
&gt; @@ -182,10 +200,10 @@ index 81a0f7a..d55396b 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 return LIB;<br>
&gt;=C2=A0 +}<br>
&gt;=C2=A0 diff --git a/Python/sysmodule.c b/Python/sysmodule.c<br>
&gt; -index efe5b29..de77b17 100644<br>
&gt; +index 5b0fb81..0dce754 100644<br>
&gt;=C2=A0 --- a/Python/sysmodule.c<br>
&gt;=C2=A0 +++ b/Python/sysmodule.c<br>
&gt; -@@ -2319,6 +2319,8 @@ _PySys_BeginInit(PyObject **sysmod)<br>
&gt; +@@ -2668,6 +2668,8 @@ _PySys_InitCore(_PyRuntimeState *runtime, PyInt=
erpreterState *interp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PyUnicode_FromString(Py_GetCopyright()));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;platform&quot;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PyUnicode_FromString(Py_GetPlatform()));<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-prope=
r-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/=
python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch<br>
&gt; index e7af88654da..fe0aa8aabed 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detec=
tion-of-mips-architecture-for-.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detec=
tion-of-mips-architecture-for-.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfe=
r@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 31 May 2019 15:34:34 +0200<br>
&gt;=C2=A0 Subject: [PATCH] bpo-36852: proper detection of mips architectur=
e for soft<br>
&gt; @@ -12,15 +12,16 @@ to do this in a more autoconf/autotools manner.<br=
>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https://github.com/python=
/cpython/pull/13196" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/pull/13196</a>]<br>
&gt;=C2=A0 Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias=
.schoepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt=
;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 169 ++++++---------------------------------------------=
<br>
&gt; - 1 file changed, 17 insertions(+), 152 deletions(-)<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 171 +++++----------------------------------------------=
<br>
&gt; + 1 file changed, 17 insertions(+), 154 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index a7de901e08..a73e2de51b 100644<br>
&gt; +index 0f85486..0ca7e24 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; -@@ -727,158 +727,23 @@ fi<br>
&gt; +@@ -704,160 +704,23 @@ fi<br>
&gt;=C2=A0 =C2=A0MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(MULTIARCH)<br>
&gt;<br>
&gt; @@ -163,6 +164,8 @@ index a7de901e08..a73e2de51b 100644<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 i386-gnu<br>
&gt;=C2=A0 -#elif defined(__APPLE__)<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin<br>
&gt; +-#elif defined(__VXWORKS__)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vxworks<br>
&gt;=C2=A0 -#else<br>
&gt;=C2=A0 -# error unknown platform triplet<br>
&gt;=C2=A0 -#endif<br>
&gt; @@ -196,6 +199,3 @@ index a7de901e08..a73e2de51b 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0if test x$PLATFORM_TRIPLET !=3D x &amp;&amp; test x$MULTIA=
RCH !=3D x; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then<b=
r>
&gt; ---<br>
&gt; -2.21.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysco=
nfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/=
python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch<br>
&gt; index 1709011be8a..ee37f6bd52d 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-ap=
pend-STAGING_LIBDIR-python-sys.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-ap=
pend-STAGING_LIBDIR-python-sys.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From eff903c600f4c40f5753e95ab1557126fc6e0c9c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From cf676775109c0a7fb38058bb60b453ff8f1a166b Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 31 Jan 2019 16:46:30 +0100<br>
&gt;=C2=A0 Subject: [PATCH] distutils/sysconfig: append<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYT=
HON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/=
python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a146c747f83..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOM=
E-is-set-use-instead-of-PYTHON.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,47 +0,0 @@<br>
&gt; -From 5ce3ac59531828ff682646fbba59b2126b28a8aa Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jaewon Lee &lt;<a href=3D"mailto:jaewon.lee@xilinx.com" target=
=3D"_blank">jaewon.lee@xilinx.com</a>&gt;<br>
&gt; -Date: Thu, 25 Apr 2019 15:34:26 -0700<br>
&gt; -Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHO=
NHOME<br>
&gt; -<br>
&gt; -There is one variable PYTHONHOME to determine where libraries are com=
ing<br>
&gt; -from for both python2 and python3. This becomes an issue if only one =
has<br>
&gt; -libraries in the specified PYTHONHOME path, but they are using the sa=
me<br>
&gt; -PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a wa=
y<br>
&gt; -to set a different path for python3<br>
&gt; -<br>
&gt; -Signed-off-by: Jaewon Lee &lt;<a href=3D"mailto:jaewon.lee@xilinx.com=
" target=3D"_blank">jaewon.lee@xilinx.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE specific configuration]<br>
&gt; -<br>
&gt; ----<br>
&gt; - Modules/main.c | 17 +++++++++++++----<br>
&gt; - 1 file changed, 13 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Modules/main.c b/Modules/main.c<br>
&gt; -index acc59c6..407085a 100644<br>
&gt; ---- a/Modules/main.c<br>
&gt; -+++ b/Modules/main.c<br>
&gt; -@@ -1834,10 +1834,19 @@ config_init_home(_PyCoreConfig *config)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _Py_INIT_OK();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 int res =3D config_get_env_var_dup(&amp;home, L&quot;P=
YTHONHOME&quot;, &quot;PYTHONHOME&quot;);<br>
&gt; --=C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DECODE_LOCALE_ERR(&quot;PYTHONHOM=
E&quot;, res);<br>
&gt; -+=C2=A0 =C2=A0 int res;<br>
&gt; -+=C2=A0 =C2=A0 const char *oepython3home =3D config_get_env_var(&quot=
;OEPYTHON3HOME&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (oepython3home) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D config_get_env_var_dup(&amp;home=
, L&quot;OEPYTHON3HOME&quot;, &quot;OEPYTHON3HOME&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return DECODE_LOCALE_ERR(&=
quot;OEPYTHON3HOME&quot;, res);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D config_get_env_var_dup(&amp;home=
, L&quot;PYTHONHOME&quot;, &quot;PYTHONHOME&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res &lt; 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return DECODE_LOCALE_ERR(&=
quot;PYTHONHOME&quot;, res);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0config-&gt;home =3D home;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return _Py_INIT_OK();<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_=
basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/=
python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch<br>
&gt; index a0ea897f4e8..fb10ca94b31 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basenam=
e-to-replace-CC-for-checking-c.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basenam=
e-to-replace-CC-for-checking-c.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2645317fef09afe31b01bb2c1d4fe5b9afdbb11a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 994783da5c21cab81b6589ed2d4275e665a946f9 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 22 Oct 2018 15:19:51 +0800<br>
&gt;=C2=A0 Subject: [PATCH] python3: use cc_basename to replace CC for chec=
king compiler<br>
&gt; @@ -21,12 +21,13 @@ Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zh=
ou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt;=C2=A0 patch originally from Li Zhou, I just rework it to new version<b=
r>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> | 19 ++++++++++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index a7de901..4a3681f 100644<br>
&gt; +index a189d42..0f85486 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)<br>
&gt; @@ -37,7 +38,7 @@ index a7de901..4a3681f 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# pybuilddir.txt will be created by --generate-posix-vars =
in the Makefile<br>
&gt;=C2=A0 =C2=A0rm -f pybuilddir.txt<br>
&gt; -@@ -695,7 +696,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
&gt; +@@ -671,7 +672,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
&gt;=C2=A0 =C2=A0preset_cxx=3D&quot;$CXX&quot;<br>
&gt;=C2=A0 =C2=A0if test -z &quot;$CXX&quot;<br>
&gt;=C2=A0 =C2=A0then<br>
&gt; @@ -46,7 +47,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc)=C2=A0 =C2=A0 AC_PATH_TOOL=
(CXX, [g++], [g++], [notfound]) ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc)=C2=A0 =C2=A0 =C2=A0AC_PATH=
_TOOL(CXX, [c++], [c++], [notfound]) ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang|*/clang)=C2=A0 =C2=A0 =
=C2=A0AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;<br>
&gt; -@@ -979,7 +980,7 @@ rmdir CaseSensitiveTestDir<br>
&gt; +@@ -957,7 +958,7 @@ rmdir CaseSensitiveTestDir<br>
&gt;<br>
&gt;=C2=A0 =C2=A0case $ac_sys_system in<br>
&gt;=C2=A0 =C2=A0hp*|HP*)<br>
&gt; @@ -55,7 +56,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cc|*/cc) CC=3D&quot;$CC -Ae&quot;;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac;;<br>
&gt;=C2=A0 =C2=A0esac<br>
&gt; -@@ -1336,7 +1337,7 @@ else<br>
&gt; +@@ -1335,7 +1336,7 @@ else<br>
&gt;=C2=A0 =C2=A0fi],<br>
&gt;=C2=A0 =C2=A0[AC_MSG_RESULT(no)])<br>
&gt;=C2=A0 =C2=A0if test &quot;$Py_LTO&quot; =3D &#39;true&#39; ; then<br>
&gt; @@ -64,7 +65,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*clang*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(LLVM_AR)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(LLVM_AR, llvm-ar, &#39;&=
#39;, ${llvm_path})<br>
&gt; -@@ -1426,7 +1427,7 @@ then<br>
&gt; +@@ -1425,7 +1426,7 @@ then<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0LLVM_PROF_ERR=3Dno<br>
&gt; @@ -73,16 +74,16 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0*clang*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Any changes made here should be reflected =
in the GCC+Darwin case below<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PGO_PROF_GEN_FLAG=3D&quot;-fprofile-instr-ge=
nerate&quot;<br>
&gt; -@@ -1500,7 +1501,7 @@ then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WRAP=3D&quot;-fwrapv&quot;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +@@ -1486,7 +1487,7 @@ esac<br>
&gt; + # compiler and platform.=C2=A0 BASECFLAGS tweaks need to be made eve=
n if the<br>
&gt; + # user set OPT.<br>
&gt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $CC in<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*clang*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc_is_c=
lang=3D1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -@@ -1623,7 +1624,7 @@ yes)<br>
&gt; +-case $CC in<br>
&gt; ++case $cc_basename in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*clang*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc_is_clang=3D1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +@@ -1622,7 +1623,7 @@ yes)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# ICC doesn&#39;t recognize the option, but =
only emits a warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0## XXX does it emit an unused result warning=
 and can it be disabled?<br>
&gt; @@ -91,7 +92,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*icc*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_disable_unused_result_warning=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -@@ -1965,7 +1966,7 @@ yes)<br>
&gt; +@@ -1943,7 +1944,7 @@ yes)<br>
&gt;=C2=A0 =C2=A0esac<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# ICC needs -fp-model strict or floats behave badly<br>
&gt; @@ -100,7 +101,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0*icc*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS_NODIST=3D&quot;$CFLAGS_NODIST -fp-mod=
el strict&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -@@ -2727,7 +2728,7 @@ then<br>
&gt; +@@ -2711,7 +2712,7 @@ then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0LINKFORSHARED=3D&quot;-Wl,--export-dynamic&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi;;<br>
&gt; @@ -109,7 +110,7 @@ index a7de901..4a3681f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*g=
cc*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if $CC -Xlinker --help 2&gt;&amp;1 | grep export-dynamic &gt;/dev/nul=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0then<br>
&gt; -@@ -5429,7 +5430,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D y=
es; then<br>
&gt; +@@ -5362,7 +5363,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D y=
es; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Some versions of gcc miscompile inline asm=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"http://gcc.gnu.org/bugzilla/sho=
w_bug.cgi?id=3D46491" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.o=
rg/bugzilla/show_bug.cgi?id=3D46491</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"http://gcc.gnu.org/ml/gcc/2010-=
11/msg00366.html" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/m=
l/gcc/2010-11/msg00366.html</a><br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtim=
e-test-to-get-float-byte-order.patch b/meta/recipes-devtools/python/python3=
/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 58ab709028e..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3/0002-Don-t-do-runtime-test-=
to-get-float-byte-order.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,199 +0,0 @@<br>
&gt; -From fa96a7fd19e17b9c6b4dd01c3c3774fb382dddc6 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Wed, 5 Sep 2018 11:45:52 +0100<br>
&gt; -Subject: [PATCH] Don&#39;t do runtime test to get float byte order<br=
>
&gt; -<br>
&gt; -Python uses AC_RUN_IFELSE to determine the byte order for floats and =
doubles,<br>
&gt; -and falls back onto &quot;I don&#39;t know&quot; if it can&#39;t run =
code.=C2=A0 This results in<br>
&gt; -crippled floating point numbers in Python, and the regression tests f=
ail.<br>
&gt; -<br>
&gt; -Instead of running code, take a macro from autoconf-archive which com=
piles C<br>
&gt; -with a special double in which has an ASCII representation, and then =
greps the<br>
&gt; -binary to identify the format.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [2a9c3805ddedf282881ef7811a561c70b74f80b1]<=
br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 72 +++------------------------<br>
&gt; - m4/ax_c_float_words_bigendian.m4 | 83 ++++++++++++++++++++++++++++++=
++<br>
&gt; - 2 files changed, 90 insertions(+), 65 deletions(-)<br>
&gt; - create mode 100644 m4/ax_c_float_words_bigendian.m4<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 4a3681f..4ab19a6 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -4328,77 +4328,19 @@ fi<br>
&gt; - # * Check for various properties of floating point *<br>
&gt; - # **************************************************<br>
&gt; -<br>
&gt; --AC_MSG_CHECKING(whether C doubles are little-endian IEEE 754 binary6=
4)<br>
&gt; --AC_CACHE_VAL(ac_cv_little_endian_double, [<br>
&gt; --AC_RUN_IFELSE([AC_LANG_SOURCE([[<br>
&gt; --#include &lt;string.h&gt;<br>
&gt; --int main() {<br>
&gt; --=C2=A0 =C2=A0 double x =3D 9006104071832581.0;<br>
&gt; --=C2=A0 =C2=A0 if (memcmp(&amp;x, &quot;\x05\x04\x03\x02\x01\xff\x3f\=
x43&quot;, 8) =3D=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; --}<br>
&gt; --]])],<br>
&gt; --[ac_cv_little_endian_double=3Dyes],<br>
&gt; --[ac_cv_little_endian_double=3Dno],<br>
&gt; --[ac_cv_little_endian_double=3Dno])])<br>
&gt; --AC_MSG_RESULT($ac_cv_little_endian_double)<br>
&gt; --if test &quot;$ac_cv_little_endian_double&quot; =3D yes<br>
&gt; --then<br>
&gt; --=C2=A0 AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,<br>
&gt; --=C2=A0 [Define if C doubles are 64-bit IEEE 754 binary format, store=
d<br>
&gt; --=C2=A0 =C2=A0with the least significant byte first])<br>
&gt; --fi<br>
&gt; --<br>
&gt; --AC_MSG_CHECKING(whether C doubles are big-endian IEEE 754 binary64)<=
br>
&gt; --AC_CACHE_VAL(ac_cv_big_endian_double, [<br>
&gt; --AC_RUN_IFELSE([AC_LANG_SOURCE([[<br>
&gt; --#include &lt;string.h&gt;<br>
&gt; --int main() {<br>
&gt; --=C2=A0 =C2=A0 double x =3D 9006104071832581.0;<br>
&gt; --=C2=A0 =C2=A0 if (memcmp(&amp;x, &quot;\x43\x3f\xff\x01\x02\x03\x04\=
x05&quot;, 8) =3D=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; --}<br>
&gt; --]])],<br>
&gt; --[ac_cv_big_endian_double=3Dyes],<br>
&gt; --[ac_cv_big_endian_double=3Dno],<br>
&gt; --[ac_cv_big_endian_double=3Dno])])<br>
&gt; --AC_MSG_RESULT($ac_cv_big_endian_double)<br>
&gt; --if test &quot;$ac_cv_big_endian_double&quot; =3D yes<br>
&gt; -+AX_C_FLOAT_WORDS_BIGENDIAN<br>
&gt; -+if test &quot;$ax_cv_c_float_words_bigendian&quot; =3D &quot;yes&quo=
t;<br>
&gt; - then<br>
&gt; -=C2=A0 =C2=A0AC_DEFINE(DOUBLE_IS_BIG_ENDIAN_IEEE754, 1,<br>
&gt; -=C2=A0 =C2=A0[Define if C doubles are 64-bit IEEE 754 binary format, =
stored<br>
&gt; -=C2=A0 =C2=A0 with the most significant byte first])<br>
&gt; --fi<br>
&gt; --<br>
&gt; --# Some ARM platforms use a mixed-endian representation for doubles.<=
br>
&gt; --# While Python doesn&#39;t currently have full support for these pla=
tforms<br>
&gt; --# (see e.g., issue 1762561), we can at least make sure that float &l=
t;-&gt; string<br>
&gt; --# conversions work.<br>
&gt; --AC_MSG_CHECKING(whether C doubles are ARM mixed-endian IEEE 754 bina=
ry64)<br>
&gt; --AC_CACHE_VAL(ac_cv_mixed_endian_double, [<br>
&gt; --AC_RUN_IFELSE([AC_LANG_SOURCE([[<br>
&gt; --#include &lt;string.h&gt;<br>
&gt; --int main() {<br>
&gt; --=C2=A0 =C2=A0 double x =3D 9006104071832581.0;<br>
&gt; --=C2=A0 =C2=A0 if (memcmp(&amp;x, &quot;\x01\xff\x3f\x43\x05\x04\x03\=
x02&quot;, 8) =3D=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; --=C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; --}<br>
&gt; --]])],<br>
&gt; --[ac_cv_mixed_endian_double=3Dyes],<br>
&gt; --[ac_cv_mixed_endian_double=3Dno],<br>
&gt; --[ac_cv_mixed_endian_double=3Dno])])<br>
&gt; --AC_MSG_RESULT($ac_cv_mixed_endian_double)<br>
&gt; --if test &quot;$ac_cv_mixed_endian_double&quot; =3D yes<br>
&gt; -+elif test &quot;$ax_cv_c_float_words_bigendian&quot; =3D &quot;no&qu=
ot;<br>
&gt; - then<br>
&gt; --=C2=A0 AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,<br>
&gt; -+=C2=A0 AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,<br>
&gt; -=C2=A0 =C2=A0[Define if C doubles are 64-bit IEEE 754 binary format, =
stored<br>
&gt; --=C2=A0 =C2=A0in ARM mixed-endian order (byte order 45670123)])<br>
&gt; -+=C2=A0 =C2=A0with the least significant byte first])<br>
&gt; -+else<br>
&gt; -+=C2=A0 AC_MSG_ERROR([Cannot identify floating point byte order])<br>
&gt; - fi<br>
&gt; -<br>
&gt; - # The short float repr introduced in Python 3.1 requires the<br>
&gt; -diff --git a/m4/ax_c_float_words_bigendian.m4 b/m4/ax_c_float_words_b=
igendian.m4<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000..216b90d<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/m4/ax_c_float_words_bigendian.m4<br>
&gt; -@@ -0,0 +1,83 @@<br>
&gt; -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -+#=C2=A0 <a href=3D"https://www.gnu.org/software/autoconf-archive/ax_=
c_float_words_bigendian.html" rel=3D"noreferrer" target=3D"_blank">https://=
www.gnu.org/software/autoconf-archive/ax_c_float_words_bigendian.html</a><b=
r>
&gt; -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -+#<br>
&gt; -+# SYNOPSIS<br>
&gt; -+#<br>
&gt; -+#=C2=A0 =C2=A0AX_C_FLOAT_WORDS_BIGENDIAN([ACTION-IF-TRUE], [ACTION-I=
F-FALSE], [ACTION-IF-UNKNOWN])<br>
&gt; -+#<br>
&gt; -+# DESCRIPTION<br>
&gt; -+#<br>
&gt; -+#=C2=A0 =C2=A0Checks the ordering of words within a multi-word float=
. This check is<br>
&gt; -+#=C2=A0 =C2=A0necessary because on some systems (e.g. certain ARM sy=
stems), the float<br>
&gt; -+#=C2=A0 =C2=A0word ordering can be different from the byte ordering.=
 In a multi-word<br>
&gt; -+#=C2=A0 =C2=A0float context, &quot;big-endian&quot; implies that the=
 word containing the sign<br>
&gt; -+#=C2=A0 =C2=A0bit is found in the memory location with the lowest ad=
dress. This<br>
&gt; -+#=C2=A0 =C2=A0implementation was inspired by the AC_C_BIGENDIAN macr=
o in autoconf.<br>
&gt; -+#<br>
&gt; -+#=C2=A0 =C2=A0The endianness is detected by first compiling C code t=
hat contains a<br>
&gt; -+#=C2=A0 =C2=A0special double float value, then grepping the resultin=
g object file for<br>
&gt; -+#=C2=A0 =C2=A0certain strings of ASCII values. The double is special=
ly crafted to have<br>
&gt; -+#=C2=A0 =C2=A0a binary representation that corresponds with a simple=
 string. In this<br>
&gt; -+#=C2=A0 =C2=A0implementation, the string &quot;noonsees&quot; was se=
lected because the<br>
&gt; -+#=C2=A0 =C2=A0individual word values (&quot;noon&quot; and &quot;see=
s&quot;) are palindromes, thus making<br>
&gt; -+#=C2=A0 =C2=A0this test byte-order agnostic. If grep finds the strin=
g &quot;noonsees&quot; in<br>
&gt; -+#=C2=A0 =C2=A0the object file, the target platform stores float word=
s in big-endian<br>
&gt; -+#=C2=A0 =C2=A0order. If grep finds &quot;seesnoon&quot;, float words=
 are in little-endian order.<br>
&gt; -+#=C2=A0 =C2=A0If neither value is found, the user is instructed to s=
pecify the<br>
&gt; -+#=C2=A0 =C2=A0ordering.<br>
&gt; -+#<br>
&gt; -+# LICENSE<br>
&gt; -+#<br>
&gt; -+#=C2=A0 =C2=A0Copyright (c) 2008 Daniel Amelang &lt;<a href=3D"mailt=
o:dan@amelang.net" target=3D"_blank">dan@amelang.net</a>&gt;<br>
&gt; -+#<br>
&gt; -+#=C2=A0 =C2=A0Copying and distribution of this file, with or without=
 modification, are<br>
&gt; -+#=C2=A0 =C2=A0permitted in any medium without royalty provided the c=
opyright notice<br>
&gt; -+#=C2=A0 =C2=A0and this notice are preserved. This file is offered as=
-is, without any<br>
&gt; -+#=C2=A0 =C2=A0warranty.<br>
&gt; -+<br>
&gt; -+#serial 11<br>
&gt; -+<br>
&gt; -+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],<br>
&gt; -+=C2=A0 [AC_CACHE_CHECK(whether float word ordering is bigendian,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_cv=
_c_float_words_bigendian, [<br>
&gt; -+<br>
&gt; -+ax_cv_c_float_words_bigendian=3Dunknown<br>
&gt; -+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[<br>
&gt; -+<br>
&gt; -+double d =3D 9090423496703681033747047890550501147621169273561563201=
479712084405348886581669527372346909785805625751702019124748742951693213050=
356065000232756451757077848023672452514052012137173920149654013264010997777=
9420565776568942592.0;<br>
&gt; -+<br>
&gt; -+]])], [<br>
&gt; -+<br>
&gt; -+if grep noonsees conftest.$ac_objext &gt;/dev/null ; then<br>
&gt; -+=C2=A0 ax_cv_c_float_words_bigendian=3Dyes<br>
&gt; -+fi<br>
&gt; -+if grep seesnoon conftest.$ac_objext &gt;/dev/null ; then<br>
&gt; -+=C2=A0 if test &quot;$ax_cv_c_float_words_bigendian&quot; =3D unknow=
n; then<br>
&gt; -+=C2=A0 =C2=A0 ax_cv_c_float_words_bigendian=3Dno<br>
&gt; -+=C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 ax_cv_c_float_words_bigendian=3Dunknown<br>
&gt; -+=C2=A0 fi<br>
&gt; -+fi<br>
&gt; -+<br>
&gt; -+])])<br>
&gt; -+<br>
&gt; -+case $ax_cv_c_float_words_bigendian in<br>
&gt; -+=C2=A0 yes)<br>
&gt; -+=C2=A0 =C2=A0 m4_default([$1],<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Defin=
e to 1 if your system stores words within floats<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with =
the most significant word first])]) ;;<br>
&gt; -+=C2=A0 no)<br>
&gt; -+=C2=A0 =C2=A0 $2 ;;<br>
&gt; -+=C2=A0 *)<br>
&gt; -+=C2=A0 =C2=A0 m4_default([$3],<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [AC_MSG_ERROR([<br>
&gt; -+<br>
&gt; -+Unknown float word ordering. You need to manually preset<br>
&gt; -+ax_cv_c_float_words_bigendian=3Dno (or yes) according to your system=
.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 ])]) ;;<br>
&gt; -+esac<br>
&gt; -+<br>
&gt; -+])# AX_C_FLOAT_WORDS_BIGENDIAN<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0003-setup.py-pass-m=
issing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/=
python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b9d5bc9c516..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3/0003-setup.py-pass-missing-=
libraries-to-Extension-for-mul.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,80 +0,0 @@<br>
&gt; -From b881a79adcd4ae5ac8fe4f49d0fc77c47f777919 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -Date: Fri, 4 Aug 2017 11:16:14 +0800<br>
&gt; -Subject: [PATCH] setup.py: pass missing libraries to Extension for<br=
>
&gt; - multiprocessing module<br>
&gt; -<br>
&gt; -In the following commit:<br>
&gt; -...<br>
&gt; -commit e711cafab13efc9c1fe6c5cd75826401445eb585<br>
&gt; -Author: Benjamin Peterson &lt;<a href=3D"mailto:benjamin@python.org" =
target=3D"_blank">benjamin@python.org</a>&gt;<br>
&gt; -Date:=C2=A0 =C2=A0Wed Jun 11 16:44:04 2008 +0000<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Merged revisions 64104,64117 via svnmerge from<br>
&gt; -=C2=A0 =C2=A0 svn+ssh://<a href=3D"http://pythondev@svn.python.org/py=
thon/trunk" rel=3D"noreferrer" target=3D"_blank">pythondev@svn.python.org/p=
ython/trunk</a><br>
&gt; -...<br>
&gt; -(see diff in setup.py)<br>
&gt; -It assigned libraries for multiprocessing module according<br>
&gt; -the host_platform, but not pass it to Extension.<br>
&gt; -<br>
&gt; -In glibc, the following commit caused two definition of<br>
&gt; -sem_getvalue are different.<br>
&gt; -<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D0=
42e1521c794a945edc43b5bfa7e69ad70420524" rel=3D"noreferrer" target=3D"_blan=
k">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D042e1521c794a94=
5edc43b5bfa7e69ad70420524</a><br>
&gt; -(see diff in nptl/sem_getvalue.c for detail)<br>
&gt; -`__new_sem_getvalue&#39; is the latest sem_getvalue@@GLIBC_2.1<br>
&gt; -and `__old_sem_getvalue&#39; is to compat the old version<br>
&gt; -sem_getvalue@GLIBC_2.0.<br>
&gt; -<br>
&gt; -To build python for embedded Linux systems:<br>
&gt; -<a href=3D"http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yo=
cto-project-qs.html" rel=3D"noreferrer" target=3D"_blank">http://www.yoctop=
roject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html</a><br>
&gt; -If not explicitly link to library pthread (-lpthread), it will<br>
&gt; -load glibc&#39;s sem_getvalue randomly at runtime.<br>
&gt; -<br>
&gt; -Such as build python on linux x86_64 host and run the python<br>
&gt; -on linux x86_32 target. If not link library pthread, it caused<br>
&gt; -multiprocessing bounded semaphore could not work correctly.<br>
&gt; -...<br>
&gt; -&gt;&gt;&gt; import multiprocessing<br>
&gt; -&gt;&gt;&gt; pool_sema =3D multiprocessing.BoundedSemaphore(value=3D1=
)<br>
&gt; -&gt;&gt;&gt; pool_sema.acquire()<br>
&gt; -True<br>
&gt; -&gt;&gt;&gt; pool_sema.release()<br>
&gt; -Traceback (most recent call last):<br>
&gt; -=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
&gt; -ValueError: semaphore or lock released too many times<br>
&gt; -...<br>
&gt; -<br>
&gt; -And the semaphore issue also caused multiprocessing.Queue().put() hun=
g.<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpyt=
hon/pull/2999" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyth=
on/cpython/pull/2999</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - setup.py | 7 +++++--<br>
&gt; - 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/setup.py b/setup.py<br>
&gt; -index b7a36a6..658ead3 100644<br>
&gt; ---- a/setup.py<br>
&gt; -+++ b/setup.py<br>
&gt; -@@ -1584,8 +1584,10 @@ class PyBuildExt(build_ext):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif host_platform.startswith(&#39;=
netbsd&#39;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0macros =3D dict()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries =3D []<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Linux and other unices<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif host_platform.startswith((&#39;linu=
x&#39;)):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macros =3D dict()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries =3D [&#39;pthrea=
d&#39;]<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Other unices<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0macros =3D dict()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries =3D [&#39;r=
t&#39;]<br>
&gt; -<br>
&gt; -@@ -1603,6 +1605,7 @@ class PyBuildExt(build_ext):<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exts.append ( Extension(&#39;_multi=
processing&#39;, multiprocessing_srcs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0define_macros=3Dlist(macro=
s.items()),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dlibraries,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_dirs=3D[&quot;Modu=
les/_multiprocessing&quot;]))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# End multiprocessing<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not=
-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/=
python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch<br>
&gt; index c15295c034c..4bd98f62fd6 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report=
-missing-dependencies-for-disa.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report=
-missing-dependencies-for-disa.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 7 Oct 2019 13:22:14 +0200<br>
&gt;=C2=A0 Subject: [PATCH] setup.py: do not report missing dependencies fo=
r disabled<br>
&gt; @@ -10,22 +10,23 @@ build completeness checker which relies on the rep=
ort.<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0setup.py | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/setup.py b/setup.py<br>
&gt; -index 4b53668..0097643 100644<br>
&gt; +index 7691258..ec3f2a4 100644<br>
&gt;=C2=A0 --- a/setup.py<br>
&gt;=C2=A0 +++ b/setup.py<br>
&gt; -@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):<br>
&gt; +@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
int(&quot;%-*s=C2=A0 =C2=A0%-*s=C2=A0 =C2=A0%-*s&quot; % (longest, e, longe=
st, f,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0longest, g))<br>
&gt;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # There is no need to report missin=
g module dependencies,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the modules have been disabled=
 in the first place.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing =3D list(set(missing) - set(sysc=
onf_dis))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing =3D list(set(self.missing) =
- set(sysconf_dis))<br>
&gt;=C2=A0 +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if missing:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.missing:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;Pyth=
on build finished successfully!&quot;)<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-=
is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-dist=
utils-prefix-is-inside-staging-area.patch<br>
&gt; index d49604ba4d9..219b3551b8b 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-insi=
de-staging-area.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-insi=
de-staging-area.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 93b2c26467b0ea9a18c178e4e1371d52e917a68b Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 14 May 2013 15:00:26 -0700<br>
&gt;=C2=A0 Subject: [PATCH] python3: Add target and native recipes<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_=
tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tk=
inter.patch<br>
&gt; index 24e67b4ca14..184540e794c 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter=
.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter=
.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From fead48c8b501a8d7c3db21df2e599f90f38f11d3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" ta=
rget=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 28 Jan 2019 15:57:54 +0000<br>
&gt;=C2=A0 Subject: [PATCH] _tkinter module needs tk module along with tcl.=
 tk is not yet<br>
&gt; @@ -11,26 +11,21 @@ Also simply disable the tk module since its not in=
 DEPENDS.<br>
&gt;=C2=A0 Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherz=
an.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - setup.py | 8 +++++---<br>
&gt; - 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; + setup.py | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/setup.py b/setup.py<br>
&gt; -index fbec00d..b7a36a6 100644<br>
&gt; +index ab18ff0..7691258 100644<br>
&gt;=C2=A0 --- a/setup.py<br>
&gt;=C2=A0 +++ b/setup.py<br>
&gt; -@@ -1623,10 +1623,12 @@ class PyBuildExt(build_ext):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extensions.extend(exts)<br>
&gt; +@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.detect_decimal()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.detect_ctypes()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.detect_multiprocessing()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.detect_tkinter():<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing.append(&#39;_=
tkinter&#39;)<br>
&gt; ++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.detect_tkinter():<br>
&gt; ++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing.append(&#39;=
_tkinter&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.detect_uuid()<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Call the method for detecting whe=
ther _tkinter can be compiled<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_tkinter(inc_dirs, lib_dirs)<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # self.detect_tkinter(inc_dirs, lib_dirs=
)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;_tkinter&#39; not in [<a href=3D=
"http://e.name" rel=3D"noreferrer" target=3D"_blank">e.name</a> for e in se=
lf.extensions]:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing.append(&#39;_tkint=
er&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # tkinter module will not be avalaible a=
s yocto<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # doesn&#39;t have tk integrated (yet)<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if &#39;_tkinter&#39; not in [<a href=
=3D"http://e.name" rel=3D"noreferrer" target=3D"_blank">e.name</a> for e in=
 self.extensions]:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 missing.append(&#39;_tkin=
ter&#39;)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the _uuid module if possibl=
e<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid_incs =3D find_file(&quot;uuid.=
h&quot;, inc_dirs, [&quot;/usr/include/uuid&quot;])<br>
&gt; + ##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uncomment these lines if you w=
ant to play with xxmodule.c<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/python-config.patch =
b/meta/recipes-devtools/python/python3/python-config.patch<br>
&gt; index f23b8b7df06..c8a8f3d4aa3 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/python-config.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3/python-config.patch<br>
&gt; @@ -1,4 +1,7 @@<br>
&gt; -python-config: Revert to using distutils.sysconfig<br>
&gt; +From 07df0ae0d70cba6d1847fe1c24a71063930bec60 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com" target=
=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 4 May 2014 20:06:43 -0400<br>
&gt; +Subject: [PATCH] python-config: Revert to using distutils.sysconfig<b=
r>
&gt;<br>
&gt;=C2=A0 The newer sysconfig module shares some code with distutils.sysco=
nfig, but the same modifications as in<br>
&gt;<br>
&gt; @@ -12,11 +15,16 @@ Upstream-Status: Inappropriate [Embedded Specific]=
<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail=
.com" target=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
&gt;=C2=A0 :<br>
&gt; -Index: Python-3.3.3/Misc/<a href=3D"http://python-config.in" rel=3D"n=
oreferrer" target=3D"_blank">python-config.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- Python-3.3.3.orig/Misc/<a href=3D"http://python-config.in" rel=3D=
"noreferrer" target=3D"_blank">python-config.in</a><br>
&gt; -+++ Python-3.3.3/Misc/<a href=3D"http://python-config.in" rel=3D"nore=
ferrer" target=3D"_blank">python-config.in</a><br>
&gt; -@@ -4,7 +4,7 @@<br>
&gt; +<br>
&gt; +---<br>
&gt; + Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" target=
=3D"_blank">python-config.in</a> | 10 +++++-----<br>
&gt; + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferr=
er" target=3D"_blank">python-config.in</a> b/Misc/<a href=3D"http://python-=
config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a><br>
&gt; +index 727c4a8..c702829 100644<br>
&gt; +--- a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
&gt; ++++ b/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
&gt; +@@ -6,7 +6,7 @@<br>
&gt;=C2=A0 =C2=A0import getopt<br>
&gt;=C2=A0 =C2=A0import os<br>
&gt;=C2=A0 =C2=A0import sys<br>
&gt; @@ -24,8 +32,8 @@ Index: Python-3.3.3/Misc/<a href=3D"http://python-co=
nfig.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a><br>
&gt;=C2=A0 +from distutils import sysconfig<br>
&gt;<br>
&gt;=C2=A0 =C2=A0valid_opts =3D [&#39;prefix&#39;, &#39;exec-prefix&#39;, &=
#39;includes&#39;, &#39;libs&#39;, &#39;cflags&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ldflags&#=
39;, &#39;extension-suffix&#39;, &#39;help&#39;, &#39;abiflags&#39;, &#39;c=
onfigdir&#39;]<br>
&gt; -@@ -32,14 +32,14 @@ if &#39;--help&#39; in opt_flags:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ldflags&#=
39;, &#39;extension-suffix&#39;, &#39;help&#39;, &#39;abiflags&#39;, &#39;c=
onfigdir&#39;,<br>
&gt; +@@ -35,14 +35,14 @@ if &#39;--help&#39; in opt_flags:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0for opt in opt_flags:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if opt =3D=3D &#39;--prefix&#39;:<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/python3-manifest.jso=
n b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; index dba92b0e396..ebfc10b4045 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; +++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; @@ -213,8 +213,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
3&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}.real&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python${PYT=
HON_BINABI}&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}/python$=
{PYTHON_BINABI}/pyconfig*.h&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python${PYT=
HON_MAJMIN}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}/python$=
{PYTHON_MAJMIN}/pyconfig*.h&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${prefix}/lib/py=
thon${PYTHON_MAJMIN}/config*/*[!.a]&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python=
${PYTHON_MAJMIN}/UserDict.py&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python=
${PYTHON_MAJMIN}/UserList.py&quot;,<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a> b/meta/re=
cipes-devtools/python/<a href=3D"http://python3_3.8.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3_3.8.0.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3_3.7=
.5.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3_3.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.0.bb</a><br>
&gt; index 57eaaea5e7c..1feaebea8ee 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.8.0.bb</a><br>
&gt; @@ -19,8 +19,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/f=
tp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.pr=
e-use-qemu-wrapper-when-gathering-profile.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-hard=
code-lib-as-location-for-site-packages-an.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python3-use=
-cc_basename-to-replace-CC-for-checking-c.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Don-t-do-runtime=
-test-to-get-float-byte-order.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-setup.py-pass-mi=
ssing-libraries-to-Extension-for-mul.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Lib-sysconf=
ig.py-fix-another-place-where-lib-is-hard.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-fi=
x-Issue36464-parallel-build-race-problem.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bpo-36852-p=
roper-detection-of-mips-architecture-for-.patch \<br>
&gt; @@ -35,20 +33,16 @@ SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-distutils-s=
ysconfig-append-STAGING_LIBDIR-python-sys.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://12-distutils-pre=
fix-is-inside-staging-area.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI_append_class-nativesdk =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-main.c-if-OEPYTH=
ON3HOME-is-set-use-instead-of-PYTHON.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;08ed8030b1183107c48f2092e79a87e2&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;e85a76ea9f3d6c485ec1780fca4e500725a4a7bb=
c63c78ebc44170de9b619d94&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;dbac8df9d8b9edc678d0f4cacdb7dbb0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b356244e13fb5491da890b35b13b2118c3122977=
c2cd825e3eb6e7d462030d84&quot;<br>
&gt;<br>
&gt;=C2=A0 # exclude pre-releases for both python 2.x and 3.x<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d=
+)+).tar&quot;<br>
&gt;<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;python&quot;<br>
&gt;<br>
&gt; -PYTHON_MAJMIN =3D &quot;3.7&quot;<br>
&gt; -PYTHON_BINABI =3D &quot;${PYTHON_MAJMIN}m&quot;<br>
&gt; +PYTHON_MAJMIN =3D &quot;3.8&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
&gt;<br>
&gt; @@ -59,8 +53,8 @@ inherit autotools pkgconfig qemu ptest multilib_head=
er update-alternatives<br>
&gt;=C2=A0 MULTILIB_SUFFIX =3D &quot;${@d.getVar(&#39;base_libdir&#39;,1).s=
plit(&#39;/&#39;)[-1]}&quot;<br>
&gt;<br>
&gt;=C2=A0 ALTERNATIVE_${PN}-dev =3D &quot;python3-config&quot;<br>
&gt; -ALTERNATIVE_LINK_NAME[python3-config] =3D &quot;${bindir}/python${PYT=
HON_BINABI}-config&quot;<br>
&gt; -ALTERNATIVE_TARGET[python3-config] =3D &quot;${bindir}/python${PYTHON=
_BINABI}-config-${MULTILIB_SUFFIX}&quot;<br>
&gt; +ALTERNATIVE_LINK_NAME[python3-config] =3D &quot;${bindir}/python${PYT=
HON_MAJMIN}-config&quot;<br>
&gt; +ALTERNATIVE_TARGET[python3-config] =3D &quot;${bindir}/python${PYTHON=
_MAJMIN}-config-${MULTILIB_SUFFIX}&quot;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;bzip2-replacement-native libffi bzip2 openssl =
sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2&q=
uot;<br>
&gt; @@ -131,7 +125,7 @@ do_install_prepend() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_append_class-target() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header python${PYTHON_BINABI}=
/pyconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header python${PYTHON_MAJMIN}=
/pyconfig.h<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_append_class-native() {<br>
&gt; @@ -161,7 +155,7 @@ do_install_append() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_append_class-nativesdk () {<br>
&gt; -=C2=A0 =C2=A0 create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} OEP=
YTHON3HOME=3D&#39;${prefix}&#39; TERMINFO_DIRS=3D&#39;${sysconfdir}/terminf=
o:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo&=
#39; PYTHONNOUSERSITE=3D&#39;1&#39;<br>
&gt; +=C2=A0 =C2=A0 create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TER=
MINFO_DIRS=3D&#39;${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:=
/usr/share/misc/terminfo:/lib/terminfo&#39; PYTHONNOUSERSITE=3D&#39;1&#39;<=
br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 SSTATE_SCAN_FILES +=3D &quot;Makefile _sysconfigdata.py&quot;<br=
>
&gt; @@ -177,7 +171,7 @@ py_package_preprocess () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;=
s:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/=
${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/=
Makefile \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/=
${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/${bin=
dir}/python${PYTHON_BINABI}-config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/${bin=
dir}/python${PYTHON_MAJMIN}-config<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Reformat _sysconfigdata after modi=
fying it so that it remains<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # reproducible<br>
&gt; @@ -196,7 +190,7 @@ py_package_preprocess () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c &quot;from py=
_compile import compile; compile(&#39;$sysconfigfile&#39;, optimize=3D2)&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${PKGD}/${bindir}/python${PYTHON_BINAB=
I}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX=
}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${PKGD}/${bindir}/python${PYTHON_MAJMI=
N}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX=
}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #Remove the unneeded copy of target =
sysconfig data<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${PKGD}/${libdir}/python-sysc=
onfigdata<br>
&gt; @@ -322,7 +316,7 @@ RPROVIDES_${PN}-venv +=3D &quot;python3-pyvenv&quo=
t;<br>
&gt;=C2=A0 # package libpython3<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;libpython3 libpython3-staticdev&quot;<br>
&gt;=C2=A0 FILES_libpython3 =3D &quot;${libdir}/libpython*.so.*&quot;<br>
&gt; -FILES_libpython3-staticdev +=3D &quot;${prefix}/lib/python${PYTHON_MA=
JMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a&quot;<br>
&gt; +FILES_libpython3-staticdev +=3D &quot;${prefix}/lib/python${PYTHON_MA=
JMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a&quot;<br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dev +=3D &quot;dev-elf&quot;<br>
&gt;<br>
&gt;=C2=A0 # catch all the rest (unsorted)<br>
&gt; @@ -341,3 +335,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D &quot; =
locale-base-tr-tr.iso-8859-9&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-tkinter +=3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;tk&#39;, &#39;tk tk-lib&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt;=C2=A0 RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
&gt;<br>
&gt; +RDEPENDS_${PN}-tests_append_class-target =3D &quot; bash&quot;<br>
&gt; +RDEPENDS_${PN}-tests_append_class-nativesdk =3D &quot; bash&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002bec4d059943ddd2--
