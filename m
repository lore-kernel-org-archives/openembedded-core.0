Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.7311.1628267445348983586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 09:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mP5SRVeU;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id f6so12305588ioc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sKJTRNiLf7vwf5g5M4WpEZRf+m0jMPv3EbHVNyYYeuc=;
        b=mP5SRVeU1VtC8YG0W7NKLQfYGrRYOqSw8jX0XndnP7DO+GAKSY0UyTyrdR+Srk3Gid
         rwO0eCAD0bhBN+t5auO/U9Jv/5zSvFRZ78rQ9AxkTmh2H3s/jqtR2jZ/nNTxR1PSjKsi
         E8fSGFQBx81OQMrAS4AtP9TLpicp5k7HCodOoMk85/H+Tph5nXLQ3he5LSFvWh0scibY
         5yaKqmg5DPOvkE6J+561BThKOjHpCBdtTo4dFL+5P83JmmPfKOzy6DzE/foClDt7nZtj
         JNzYH7RDVIupALGL74ZmH7UaLekFfktoPrZ22GUC+HGrfpmwpdlrAzl3ngWLN16ksk6A
         Iujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sKJTRNiLf7vwf5g5M4WpEZRf+m0jMPv3EbHVNyYYeuc=;
        b=c5J4h1pkxiSeC4KKw2MJQ4gMv7WSdY8KcVwsXqd4TtSvssSMIbvsxtqRwTiZZYPPGL
         bJvm/7wj3/wO8eMYsP+cacrupRR99QSz5rZZw0ilMJD8kFZ3PfZTLry+vmK1VwPz5AVC
         0DJonVFJN1J9XHx93Ov4/a5ybAK4o0lMPYNp04SVTpFdCLyNAajC5URkg4nH5+67mx7g
         QU8Buh+AhjNUhiZhxjh79TAzfqUnvAnlN6lyL7lMJyqCkJ2aU1Hs4vXp8eVGQn46AvjK
         rpd0jxD2wrpkPA2jvqjxzEK3/cVU8hEjzEG+HMx6f8GwOYZipTWnnWLTJd1y5Yf/nhSx
         XeZA==
X-Gm-Message-State: AOAM533BkrlWnAnHgU9mdOmz6CbprQzaztVLGJABXJjYVpKQDqyBGXXZ
	3GINd3WaGxfDW6+DWLlWW4c/oaOBkhKtNGWMEzc=
X-Google-Smtp-Source: ABdhPJyIHXNrXI5CrX8dN0c7rQe/T/J6fBMs9zbLCYfZsd32ZWkdhwkZRgqeKPOS02d5+6mI4zDTO9+hSc9pNfrRajc=
X-Received: by 2002:a05:6e02:f93:: with SMTP id v19mr1659649ilo.170.1628267444638;
 Fri, 06 Aug 2021 09:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <1698C425FF15F787.25671@lists.openembedded.org>
In-Reply-To: <1698C425FF15F787.25671@lists.openembedded.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 6 Aug 2021 09:30:34 -0700
Message-ID: <CANx9H-ATVdSpxy+Wo5PR3kTu8QzJneRR8xpY5pR-RyD=oQ7Ecw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-scons{-native}: upgrade 4.1.0 -> 4.2.0
To: ticotimo@gmail.com
Cc: Tim Orling <timothy.t.orling@intel.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a31b9405c8e68efb"

--000000000000a31b9405c8e68efb
Content-Type: text/plain; charset="UTF-8"

Disregard.
V3 in process

On Fri, Aug 6, 2021 at 9:22 AM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> License-Update: Update Copyright years
>
> NOTE: The 4.2.0 Release of SCons will deprecate Python 3.5 Support.
> Python 3.5 support will be dropped in the next major release.
>
> RELEASE 4.2.0 - Sat, 31 Jul 2021 18:12:46 -0700
>
>   From Byron Platt:
>     - Fix Install() issue when copytree recursion gives bad arguments
>       that can lead to install side-effects including keeping dangling
>       symlinks and silently failing to copy directories (and their
>       subdirectories) when the directory already exists in the target.
>
>   From Joseph Brill:
>     - Internal MSVS update: Remove unnecessary calls to find all
>       installed versions of msvc when constructing the installed visual
>       studios list.
>
>   From William Deegan:
>     - Improve Subst()'s logic to check for proper callable function or
>       class's argument list. It will now allow callables with expected
>       args, and any extra args as long as they have default arguments.
>       Additionally functions with no defaults for extra arguments as
>       long as they are set using functools.partial to create a new
>       callable which set them.
>     - Fix Issue #3035 - mingw with SHLIBVERSION set fails with either
>       not a dll error or "Multiple ways to build the same target were
>       specified for:".  Now mingw will disable creating the symlinks
>       (and adding version string to ) dlls.  It sets
>       SHLIBNOVERSIONSYMLINKS, IMPLIBNOVERSIONSYMLINKS and
>       LDMODULENOVERSIONSYMLINKS to True.
>     - Added --experimental flag, to enable various experimental
>       features/tools.  You can specify 'all', 'none', or any combination
>       of available experimental features.
>     - Fix Issue #3933 - Remove unguarded print of debug information in
>       SharedLibrary logic when SHLIBVERSION is specified.
>     - Fix versioned shared library naming for MacOS platform.
>       (Previously was libxyz.dylib.1.2.3, has been fixed to
>       libxyz.1.2.3.dylib. Additionally the sonamed symlink had the same
>       issue, that is now resolved as well)
>     - Add experimental ninja builder. (Contributed by MongoDB, Daniel
>       Moody and many others).
>     - Fix #3955 - _LIBDIRFLAGS leaving $( and $) in *COMSTR output.
>       Added affect_signature flag to _concat function.  If set to False,
>       it will prepend and append $( and $). That way the various
>       Environment variables can use that rather than
>       "$( _concat(...)$)".
>     - Fix issue with exparimental ninja tool which would fail on windows
>       or when ninja package wasn't installed but --experimental=ninja was
>       specified.
>     - As part of experimental ninja tool, allow SetOption() to set both
>       disable_execute_ninja and disable_ninja.
>
>   From David H:
>     - Fix Issue #3906 - `IMPLICIT_COMMAND_DEPENDENCIES` was not properly
>       disabled when set to any string value (For example ['none','false',
>       'no','off']) Also previously 'All' wouldn't have the desired affect.
>
>   From Ivan Kravets:
>     - Provide a custom argument escape function for `TempFileMunge`
>       using a new `TEMPFILEARGESCFUNC` variable. Useful if you need to
>       apply extra operations on a command argument before writing to a
>       temporary file (fix Windows slashes, normalize paths, etc.)
>
>   From Henrik Maier:
>    - DocbookXslt tool: The XSLT stylesheet file is now initialized to an
>      env.File() Node, such that dependencies work correctly in hierarchical
>      builds (eg when using DocbookXslt in SConscript('subdir/SConscript')
>      context.
>
>   From Daniel Moody:
>     - Update CacheDir to use uuid for tmpfile uniqueness instead of pid.
>       This fixes cases for shared cache where two systems write to the
>       same cache tmpfile at the same time because the happened to get the
>       same pid.
>     - Added support for passing custom CacheDir derived classes to
>       SCons. Moved copy_from_cache attribute from the Environment class to
>       CacheDir class. Code contributed by MongoDB.
>     - Update BuildTask to pass all targets to the progress object fixing
>       an issue where multi-target build nodes only got the first target
>       passed to the progress object.
>     - Fix a potential race condition in shared cache environments where
>       the permissions are not writeable for a moment after the file has
>       been renamed and other builds (users) will copy it out of the cache.
>       Small reorganization of logic to copy files from cachedir. Moved
>       CacheDir writeable permission code for copy to cache behind the
> atomic
>       rename operation.
>     - Added marking of intermediate and and multi target nodes generated
>       from SConf tests so that is_conftest() is more accurate.
>     - Added test for configure check failing to ensure it didn't break
>       generating and running ninja.
>
>   From Mats Wichmann:
>     - Initial support in tests for Python 3.10 - expected bytecode and
>       one changed expected exception message. Change some more regexes
>       to be specified as rawstrings in response to DeprecationWarnings.
>     - Add an example of adding an emitter to User Guide (concept from
>       Jeremy Elson)
>     - Add timing information for sconsign database dump when --debug=time
>       is selected. Also switch to generally using time.perf_counter,
>       which is the Python recommended way for timing short durations.
>     - Drop remaining definitions of dict-like has_key methods, since
>       Python 3 doesn't have a dictionary has_key (maintenance)
>     - Do not treat --site-dir=DIR and --no-site-dir as distinct options.
>       Allows a later instance to override an earlier one.
>     - Ignore empty cmdline arguments when computing targets (issue 2986)
>     - Remove long-deprecated construction variables PDFCOM,
> WIN32_INSERT_DEF,
>       WIN32DEFPREFIX, WIN32DEFSUFFIX, WIN32EXPPREFIX, WIN32EXPSUFFIX.
>       All have been replaced by other names since at least 1.0.
>     - Add a __iadd__ method to the CLVar class so that inplace adds
>       (+=) also work as expected (issue 2399)
>     - Remove local copy of CLVar in EnvironmentTests unittest file -
>       should be testing against the production version, and they
>       didn't really differ.
>     - Don't strip spaces in INSTALLSTR by using raw subst (issue 2018)
>     - Deprecate Python 3.5 as a supported version.
>     - CPPDEFINES now expands construction variable references (issue
>       2363)
>     - Restore behavior that Install()'d files are writable (issue 3927)
>     - Simplified Mkdir(), the internal mkdir_func no longer needs to
>       handle existing directories, it can now pass exist_ok=True to
>       os.makedirs().
>     - Avoid WhereIs exception if user set a tool name to empty (from
>       issue 1742)
>     - Maintenance: remove obsolete __getslice__ definitions (Py3 never
>       calls); add Node.fs.scandir to call new (Py3.5) os.scandir;
>       Node.fs.makedirs now passes the exist_ok flag; Cachedir creation
>       now uses this flag.
>     - Maintenance: remove unneeded imports and reorganize some.  Fix
>       uses of warnings in some tools which instantiated the class but did
>       nothing with them, need to instead call SCons.Warnings.warn with the
>       warn class.
>     - Drop overridden changed_since_last_build method in Value class.
>     - Resync the SetOption implementation and the manpage, making sure
>       new options are available and adding a notes column for misc
>       information. SetOption equivalents to --hash-chunksize,
>       --implicit-deps-unchanged and --implicit-deps-changed are enabled.
>     - Add tests for SetOption failing on disallowed options and value
>       types.
>     - Maintenance: eliminate lots of checker complaints about Util.py.
>     - Maintenance: fix checker-spotted issues in Environment (apply_tools)
>       and EnvironmentTests (asserts comparing with self). For consistency,
>       env.Tool() now returns a tool object the same way Tool() has done.
>     - Change SConscript() missing SConscript behavior - if
> must_exist=False,
>       the warning is suppressed.
>     - Make sure TEMPFILEPREFIX can be set to an empty string (issue 3964)
>
>   From Dillan Mills:
>     - Add support for the
>
> (TARGET,SOURCE,TARGETS,SOURCES,CHANGED_TARGETS,CHANGED_SOURCES}.relpath
>       property. This will provide a path relative to the top of the build
>       tree (where the SConstruct is located) Fixes #396
>
>   From Andrew Morrow:
>     - Fix issue #3790: Generators in CPPDEFINES now have access to
>       populated source and target lists
>
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>  ...4.1.0.bb => python3-scons-native_4.2.0.bb} |  0
>  .../0001-Fix-man-page-installation.patch      | 23 +++----------------
>  ...-scons_4.1.0.bb => python3-scons_4.2.0.bb} |  5 ++--
>  3 files changed, 5 insertions(+), 23 deletions(-)
>  rename meta/recipes-devtools/python/{python3-scons-native_4.1.0.bb =>
> python3-scons-native_4.2.0.bb} (100%)
>  rename meta/recipes-devtools/python/{python3-scons_4.1.0.bb =>
> python3-scons_4.2.0.bb} (67%)
>
> diff --git a/meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
> b/meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
> rename to meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> diff --git
> a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> index ff212b85ee..6dffe64809 100644
> ---
> a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> +++
> b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> @@ -1,4 +1,4 @@
> -From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 2001
> +From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
>  From: Tim Orling <ticotimo@gmail.com>
>  Date: Sat, 22 May 2021 11:20:46 -0700
>  Subject: [PATCH] Fix man page installation
> @@ -9,10 +9,10 @@ Fixes:
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Tim Orling <ticotimo@gmail.com>
> +
>  ---
>   MANIFEST.in | 2 +-
> - setup.cfg   | 6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/MANIFEST.in b/MANIFEST.in
>  index 04ec000..937f6f3 100644
> @@ -27,20 +27,3 @@ index 04ec000..937f6f3 100644
>
>
>
> -diff --git a/setup.cfg b/setup.cfg
> -index 37e5204..677c00a 100644
> ---- a/setup.cfg
> -+++ b/setup.cfg
> -@@ -56,9 +56,9 @@ console_scripts =
> - scons.tool.docbook = *.*
> -
> - [options.data_files]
> --. = build/doc/man/scons.1
> --      build/doc/man/scons-time.1
> --      build/doc/man/sconsign.1
> -+. = scons.1
> -+      scons-time.1
> -+      sconsign.1
> -
> - [sdist]
> - dist-dir = build/dist
> diff --git a/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> similarity index 67%
> rename from meta/recipes-devtools/python/python3-scons_4.1.0.bb
> rename to meta/recipes-devtools/python/python3-scons_4.2.0.bb
> index 5a5b550be0..35e423ebf5 100644
> --- a/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> @@ -1,11 +1,10 @@
> -SUMMARY = "Software Construction tool (make/autotools replacement)"
>  HOMEPAGE = "https://github.com/SCons/scons"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b94c6e2be9670c62b38f7118c12866d2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
>
>  SRC_URI += " file://0001-Fix-man-page-installation.patch"
> -SRC_URI[sha256sum] =
> "accb8035be2c9cfbab06471286eaeff86a10037a8064cf4ef4c3df04ea5a7387"
> +SRC_URI[sha256sum] =
> "691893b63f38ad14295f5104661d55cb738ec6514421c6261323351c25432b0a"
>
>  PYPI_PACKAGE = "SCons"
>
> --
> 2.30.2
>
>
> 
>
>

--000000000000a31b9405c8e68efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Disregard.</div><div dir=3D"auto">V3 in process</div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Aug 6, 2021 at 9:22 AM Tim Orling via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">License-Update: Update Copyright ye=
ars<br>
<br>
NOTE: The 4.2.0 Release of SCons will deprecate Python 3.5 Support.<br>
Python 3.5 support will be dropped in the next major release.<br>
<br>
RELEASE 4.2.0 - Sat, 31 Jul 2021 18:12:46 -0700<br>
<br>
=C2=A0 From Byron Platt:<br>
=C2=A0 =C2=A0 - Fix Install() issue when copytree recursion gives bad argum=
ents<br>
=C2=A0 =C2=A0 =C2=A0 that can lead to install side-effects including keepin=
g dangling<br>
=C2=A0 =C2=A0 =C2=A0 symlinks and silently failing to copy directories (and=
 their<br>
=C2=A0 =C2=A0 =C2=A0 subdirectories) when the directory already exists in t=
he target.<br>
<br>
=C2=A0 From Joseph Brill:<br>
=C2=A0 =C2=A0 - Internal MSVS update: Remove unnecessary calls to find all<=
br>
=C2=A0 =C2=A0 =C2=A0 installed versions of msvc when constructing the insta=
lled visual<br>
=C2=A0 =C2=A0 =C2=A0 studios list.<br>
<br>
=C2=A0 From William Deegan:<br>
=C2=A0 =C2=A0 - Improve Subst()&#39;s logic to check for proper callable fu=
nction or<br>
=C2=A0 =C2=A0 =C2=A0 class&#39;s argument list. It will now allow callables=
 with expected<br>
=C2=A0 =C2=A0 =C2=A0 args, and any extra args as long as they have default =
arguments.<br>
=C2=A0 =C2=A0 =C2=A0 Additionally functions with no defaults for extra argu=
ments as<br>
=C2=A0 =C2=A0 =C2=A0 long as they are set using functools.partial to create=
 a new<br>
=C2=A0 =C2=A0 =C2=A0 callable which set them.<br>
=C2=A0 =C2=A0 - Fix Issue #3035 - mingw with SHLIBVERSION set fails with ei=
ther<br>
=C2=A0 =C2=A0 =C2=A0 not a dll error or &quot;Multiple ways to build the sa=
me target were<br>
=C2=A0 =C2=A0 =C2=A0 specified for:&quot;.=C2=A0 Now mingw will disable cre=
ating the symlinks<br>
=C2=A0 =C2=A0 =C2=A0 (and adding version string to ) dlls.=C2=A0 It sets<br=
>
=C2=A0 =C2=A0 =C2=A0 SHLIBNOVERSIONSYMLINKS, IMPLIBNOVERSIONSYMLINKS and<br=
>
=C2=A0 =C2=A0 =C2=A0 LDMODULENOVERSIONSYMLINKS to True.<br>
=C2=A0 =C2=A0 - Added --experimental flag, to enable various experimental<b=
r>
=C2=A0 =C2=A0 =C2=A0 features/tools.=C2=A0 You can specify &#39;all&#39;, &=
#39;none&#39;, or any combination<br>
=C2=A0 =C2=A0 =C2=A0 of available experimental features.<br>
=C2=A0 =C2=A0 - Fix Issue #3933 - Remove unguarded print of debug informati=
on in<br>
=C2=A0 =C2=A0 =C2=A0 SharedLibrary logic when SHLIBVERSION is specified.<br=
>
=C2=A0 =C2=A0 - Fix versioned shared library naming for MacOS platform.<br>
=C2=A0 =C2=A0 =C2=A0 (Previously was libxyz.dylib.1.2.3, has been fixed to<=
br>
=C2=A0 =C2=A0 =C2=A0 libxyz.1.2.3.dylib. Additionally the sonamed symlink h=
ad the same<br>
=C2=A0 =C2=A0 =C2=A0 issue, that is now resolved as well)<br>
=C2=A0 =C2=A0 - Add experimental ninja builder. (Contributed by MongoDB, Da=
niel<br>
=C2=A0 =C2=A0 =C2=A0 Moody and many others).<br>
=C2=A0 =C2=A0 - Fix #3955 - _LIBDIRFLAGS leaving $( and $) in *COMSTR outpu=
t.<br>
=C2=A0 =C2=A0 =C2=A0 Added affect_signature flag to _concat function.=C2=A0=
 If set to False,<br>
=C2=A0 =C2=A0 =C2=A0 it will prepend and append $( and $). That way the var=
ious<br>
=C2=A0 =C2=A0 =C2=A0 Environment variables can use that rather than<br>
=C2=A0 =C2=A0 =C2=A0 &quot;$( _concat(...)$)&quot;.<br>
=C2=A0 =C2=A0 - Fix issue with exparimental ninja tool which would fail on =
windows<br>
=C2=A0 =C2=A0 =C2=A0 or when ninja package wasn&#39;t installed but --exper=
imental=3Dninja was<br>
=C2=A0 =C2=A0 =C2=A0 specified.<br>
=C2=A0 =C2=A0 - As part of experimental ninja tool, allow SetOption() to se=
t both<br>
=C2=A0 =C2=A0 =C2=A0 disable_execute_ninja and disable_ninja.<br>
<br>
=C2=A0 From David H:<br>
=C2=A0 =C2=A0 - Fix Issue #3906 - `IMPLICIT_COMMAND_DEPENDENCIES` was not p=
roperly<br>
=C2=A0 =C2=A0 =C2=A0 disabled when set to any string value (For example [&#=
39;none&#39;,&#39;false&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 &#39;no&#39;,&#39;off&#39;]) Also previously &#39;All&=
#39; wouldn&#39;t have the desired affect.<br>
<br>
=C2=A0 From Ivan Kravets:<br>
=C2=A0 =C2=A0 - Provide a custom argument escape function for `TempFileMung=
e`<br>
=C2=A0 =C2=A0 =C2=A0 using a new `TEMPFILEARGESCFUNC` variable. Useful if y=
ou need to<br>
=C2=A0 =C2=A0 =C2=A0 apply extra operations on a command argument before wr=
iting to a<br>
=C2=A0 =C2=A0 =C2=A0 temporary file (fix Windows slashes, normalize paths, =
etc.)<br>
<br>
=C2=A0 From Henrik Maier:<br>
=C2=A0 =C2=A0- DocbookXslt tool: The XSLT stylesheet file is now initialize=
d to an<br>
=C2=A0 =C2=A0 =C2=A0env.File() Node, such that dependencies work correctly =
in hierarchical<br>
=C2=A0 =C2=A0 =C2=A0builds (eg when using DocbookXslt in SConscript(&#39;su=
bdir/SConscript&#39;)<br>
=C2=A0 =C2=A0 =C2=A0context.<br>
<br>
=C2=A0 From Daniel Moody:<br>
=C2=A0 =C2=A0 - Update CacheDir to use uuid for tmpfile uniqueness instead =
of pid.<br>
=C2=A0 =C2=A0 =C2=A0 This fixes cases for shared cache where two systems wr=
ite to the<br>
=C2=A0 =C2=A0 =C2=A0 same cache tmpfile at the same time because the happen=
ed to get the<br>
=C2=A0 =C2=A0 =C2=A0 same pid.<br>
=C2=A0 =C2=A0 - Added support for passing custom CacheDir derived classes t=
o<br>
=C2=A0 =C2=A0 =C2=A0 SCons. Moved copy_from_cache attribute from the Enviro=
nment class to<br>
=C2=A0 =C2=A0 =C2=A0 CacheDir class. Code contributed by MongoDB.<br>
=C2=A0 =C2=A0 - Update BuildTask to pass all targets to the progress object=
 fixing<br>
=C2=A0 =C2=A0 =C2=A0 an issue where multi-target build nodes only got the f=
irst target<br>
=C2=A0 =C2=A0 =C2=A0 passed to the progress object.<br>
=C2=A0 =C2=A0 - Fix a potential race condition in shared cache environments=
 where<br>
=C2=A0 =C2=A0 =C2=A0 the permissions are not writeable for a moment after t=
he file has<br>
=C2=A0 =C2=A0 =C2=A0 been renamed and other builds (users) will copy it out=
 of the cache.<br>
=C2=A0 =C2=A0 =C2=A0 Small reorganization of logic to copy files from cache=
dir. Moved<br>
=C2=A0 =C2=A0 =C2=A0 CacheDir writeable permission code for copy to cache b=
ehind the atomic<br>
=C2=A0 =C2=A0 =C2=A0 rename operation.<br>
=C2=A0 =C2=A0 - Added marking of intermediate and and multi target nodes ge=
nerated<br>
=C2=A0 =C2=A0 =C2=A0 from SConf tests so that is_conftest() is more accurat=
e.<br>
=C2=A0 =C2=A0 - Added test for configure check failing to ensure it didn&#3=
9;t break<br>
=C2=A0 =C2=A0 =C2=A0 generating and running ninja.<br>
<br>
=C2=A0 From Mats Wichmann:<br>
=C2=A0 =C2=A0 - Initial support in tests for Python 3.10 - expected bytecod=
e and<br>
=C2=A0 =C2=A0 =C2=A0 one changed expected exception message. Change some mo=
re regexes<br>
=C2=A0 =C2=A0 =C2=A0 to be specified as rawstrings in response to Deprecati=
onWarnings.<br>
=C2=A0 =C2=A0 - Add an example of adding an emitter to User Guide (concept =
from<br>
=C2=A0 =C2=A0 =C2=A0 Jeremy Elson)<br>
=C2=A0 =C2=A0 - Add timing information for sconsign database dump when --de=
bug=3Dtime<br>
=C2=A0 =C2=A0 =C2=A0 is selected. Also switch to generally using time.perf_=
counter,<br>
=C2=A0 =C2=A0 =C2=A0 which is the Python recommended way for timing short d=
urations.<br>
=C2=A0 =C2=A0 - Drop remaining definitions of dict-like has_key methods, si=
nce<br>
=C2=A0 =C2=A0 =C2=A0 Python 3 doesn&#39;t have a dictionary has_key (mainte=
nance)<br>
=C2=A0 =C2=A0 - Do not treat --site-dir=3DDIR and --no-site-dir as distinct=
 options.<br>
=C2=A0 =C2=A0 =C2=A0 Allows a later instance to override an earlier one.<br=
>
=C2=A0 =C2=A0 - Ignore empty cmdline arguments when computing targets (issu=
e 2986)<br>
=C2=A0 =C2=A0 - Remove long-deprecated construction variables PDFCOM, WIN32=
_INSERT_DEF,<br>
=C2=A0 =C2=A0 =C2=A0 WIN32DEFPREFIX, WIN32DEFSUFFIX, WIN32EXPPREFIX, WIN32E=
XPSUFFIX.<br>
=C2=A0 =C2=A0 =C2=A0 All have been replaced by other names since at least 1=
.0.<br>
=C2=A0 =C2=A0 - Add a __iadd__ method to the CLVar class so that inplace ad=
ds<br>
=C2=A0 =C2=A0 =C2=A0 (+=3D) also work as expected (issue 2399)<br>
=C2=A0 =C2=A0 - Remove local copy of CLVar in EnvironmentTests unittest fil=
e -<br>
=C2=A0 =C2=A0 =C2=A0 should be testing against the production version, and =
they<br>
=C2=A0 =C2=A0 =C2=A0 didn&#39;t really differ.<br>
=C2=A0 =C2=A0 - Don&#39;t strip spaces in INSTALLSTR by using raw subst (is=
sue 2018)<br>
=C2=A0 =C2=A0 - Deprecate Python 3.5 as a supported version.<br>
=C2=A0 =C2=A0 - CPPDEFINES now expands construction variable references (is=
sue<br>
=C2=A0 =C2=A0 =C2=A0 2363)<br>
=C2=A0 =C2=A0 - Restore behavior that Install()&#39;d files are writable (i=
ssue 3927)<br>
=C2=A0 =C2=A0 - Simplified Mkdir(), the internal mkdir_func no longer needs=
 to<br>
=C2=A0 =C2=A0 =C2=A0 handle existing directories, it can now pass exist_ok=
=3DTrue to<br>
=C2=A0 =C2=A0 =C2=A0 os.makedirs().<br>
=C2=A0 =C2=A0 - Avoid WhereIs exception if user set a tool name to empty (f=
rom<br>
=C2=A0 =C2=A0 =C2=A0 issue 1742)<br>
=C2=A0 =C2=A0 - Maintenance: remove obsolete __getslice__ definitions (Py3 =
never<br>
=C2=A0 =C2=A0 =C2=A0 calls); add Node.fs.scandir to call new (Py3.5) os.sca=
ndir;<br>
=C2=A0 =C2=A0 =C2=A0 Node.fs.makedirs now passes the exist_ok flag; Cachedi=
r creation<br>
=C2=A0 =C2=A0 =C2=A0 now uses this flag.<br>
=C2=A0 =C2=A0 - Maintenance: remove unneeded imports and reorganize some.=
=C2=A0 Fix<br>
=C2=A0 =C2=A0 =C2=A0 uses of warnings in some tools which instantiated the =
class but did<br>
=C2=A0 =C2=A0 =C2=A0 nothing with them, need to instead call SCons.Warnings=
.warn with the<br>
=C2=A0 =C2=A0 =C2=A0 warn class.<br>
=C2=A0 =C2=A0 - Drop overridden changed_since_last_build method in Value cl=
ass.<br>
=C2=A0 =C2=A0 - Resync the SetOption implementation and the manpage, making=
 sure<br>
=C2=A0 =C2=A0 =C2=A0 new options are available and adding a notes column fo=
r misc<br>
=C2=A0 =C2=A0 =C2=A0 information. SetOption equivalents to --hash-chunksize=
,<br>
=C2=A0 =C2=A0 =C2=A0 --implicit-deps-unchanged and --implicit-deps-changed =
are enabled.<br>
=C2=A0 =C2=A0 - Add tests for SetOption failing on disallowed options and v=
alue<br>
=C2=A0 =C2=A0 =C2=A0 types.<br>
=C2=A0 =C2=A0 - Maintenance: eliminate lots of checker complaints about Uti=
l.py.<br>
=C2=A0 =C2=A0 - Maintenance: fix checker-spotted issues in Environment (app=
ly_tools)<br>
=C2=A0 =C2=A0 =C2=A0 and EnvironmentTests (asserts comparing with self). Fo=
r consistency,<br>
=C2=A0 =C2=A0 =C2=A0 env.Tool() now returns a tool object the same way Tool=
() has done.<br>
=C2=A0 =C2=A0 - Change SConscript() missing SConscript behavior - if must_e=
xist=3DFalse,<br>
=C2=A0 =C2=A0 =C2=A0 the warning is suppressed.<br>
=C2=A0 =C2=A0 - Make sure TEMPFILEPREFIX can be set to an empty string (iss=
ue 3964)<br>
<br>
=C2=A0 From Dillan Mills:<br>
=C2=A0 =C2=A0 - Add support for the<br>
=C2=A0 =C2=A0 =C2=A0 (TARGET,SOURCE,TARGETS,SOURCES,CHANGED_TARGETS,CHANGED=
_SOURCES}.relpath<br>
=C2=A0 =C2=A0 =C2=A0 property. This will provide a path relative to the top=
 of the build<br>
=C2=A0 =C2=A0 =C2=A0 tree (where the SConstruct is located) Fixes #396<br>
<br>
=C2=A0 From Andrew Morrow:<br>
=C2=A0 =C2=A0 - Fix issue #3790: Generators in CPPDEFINES now have access t=
o<br>
=C2=A0 =C2=A0 =C2=A0 populated source and target lists<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel.com"=
 target=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">4=
.1.0.bb</a> =3D&gt; <a href=3D"http://python3-scons-native_4.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-scons-native_4.2.0.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../0001-Fix-man-page-installation.patch=C2=A0 =C2=A0 =C2=A0 | 23 +++=
----------------<br>
=C2=A0...-<a href=3D"http://scons_4.1.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">scons_4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-scons_4.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a>} |=C2=A0 5 =
++--<br>
=C2=A03 files changed, 5 insertions(+), 23 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-scons-=
native_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_=
4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-scons-native_4.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons-native_4.2.0.bb</a>} (100%)=
<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-scons_=
4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a> =
=3D&gt; <a href=3D"http://python3-scons_4.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-scons_4.2.0.bb</a>} (67%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-scons-n=
ative_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4=
.1.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-scons-=
native_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_=
4.2.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-scons-na=
tive_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4.=
1.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-scons-nati=
ve_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4.2.=
0.bb</a><br>
diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-i=
nstallation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man=
-page-installation.patch<br>
index ff212b85ee..6dffe64809 100644<br>
--- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installa=
tion.patch<br>
+++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installa=
tion.patch<br>
@@ -1,4 +1,4 @@<br>
-From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 2001<br>
+From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"=
_blank">ticotimo@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 22 May 2021 11:20:46 -0700<br>
=C2=A0Subject: [PATCH] Fix man page installation<br>
@@ -9,10 +9,10 @@ Fixes:<br>
=C2=A0Upstream-Status: Inappropriate [oe specific]<br>
<br>
=C2=A0Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" t=
arget=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 MANIFEST.in | 2 +-<br>
- setup.cfg=C2=A0 =C2=A0| 6 +++---<br>
- 2 files changed, 4 insertions(+), 4 deletions(-)<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/MANIFEST.in b/MANIFEST.in<br>
=C2=A0index 04ec000..937f6f3 100644<br>
@@ -27,20 +27,3 @@ index 04ec000..937f6f3 100644<br>
<br>
<br>
<br>
-diff --git a/setup.cfg b/setup.cfg<br>
-index 37e5204..677c00a 100644<br>
---- a/setup.cfg<br>
-+++ b/setup.cfg<br>
-@@ -56,9 +56,9 @@ console_scripts =3D<br>
- scons.tool.docbook =3D *.*<br>
- <br>
- [options.data_files]<br>
--. =3D build/doc/man/scons.1<br>
--=C2=A0 =C2=A0 =C2=A0 build/doc/man/scons-time.1<br>
--=C2=A0 =C2=A0 =C2=A0 build/doc/man/sconsign.1<br>
-+. =3D scons.1<br>
-+=C2=A0 =C2=A0 =C2=A0 scons-time.1<br>
-+=C2=A0 =C2=A0 =C2=A0 sconsign.1<br>
- <br>
- [sdist]<br>
- dist-dir =3D build/dist<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a><br>
similarity index 67%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a><br>
index 5a5b550be0..35e423ebf5 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a><br>
@@ -1,11 +1,10 @@<br>
-SUMMARY =3D &quot;Software Construction tool (make/autotools replacement)&=
quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/SCons/scons" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/SCons/scons</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db94c6e2be9670c62b38f7118c1=
2866d2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd903b0b8027f461402bac9b516=
9b36f7&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot; file://0001-Fix-man-page-installation.patch&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;accb8035be2c9cfbab06471286eaeff86a10037a8064c=
f4ef4c3df04ea5a7387&quot;<br>
+SRC_URI[sha256sum] =3D &quot;691893b63f38ad14295f5104661d55cb738ec6514421c=
6261323351c25432b0a&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;SCons&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000a31b9405c8e68efb--
