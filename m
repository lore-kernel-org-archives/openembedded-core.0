Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.6121.1628152157791607066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 01:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mmAOvTv7;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id 91so1863412uas.10
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKlrV9yMirSH/vKBjsEsCjnWrOXdxIccLRwaaSbhM4Q=;
        b=mmAOvTv7k1ek0iBvyz9+Ak0hQTGk97bg/A4LHyQu5gcjO4zoY1nOP1FZrSNhYZ2bdW
         wfkwMlEy7qus3LBR/kntd/L+FgdmvBMD7pLDQMYVlyr+4KMNat7d3C0wM9XfA7iW+2jx
         YuhZTbaWoLyE+h9Ax0mbYOTW7r1Pn6Sit0vGDf24Oqh+NTatrXcD8OTcw5mgyxttNg9z
         5r/6RPTwMjZBt/lJD8pLDjIqYzYE+5kUNfUUY6YtAgM071PJuNoZQ8woExU7YclZCNax
         OGxilMejb0uWZM+qOI2cq8LZX+c3ozBx+Rj7ABRCEvBjWJeYgMKl/LXBHR9gP6YtrIgx
         osBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKlrV9yMirSH/vKBjsEsCjnWrOXdxIccLRwaaSbhM4Q=;
        b=MwmC5v7b7N427RqOKRYQNjlzZ0614B05ojXE4gXED7CtRhiKi9RPaDONPXXWP8iBLH
         hpHBcqCz0xlMBBwGtdXXSR1ojQsJ4mLUbCE96BIYZDghS1jO/ZbleqkpC7BQ792np0TJ
         oB5SrM7O3q57l84TF79h9tzwoYlttVJIuM2DRisrU8OU++SeWtUKBF+0TSIo4aOMnHtQ
         Hw2Tl1nZz9TDUHhuZ8tPvenZyF3u7AJfp0NFYS6Tb7H9POrfiiuHlcUp0k0r8nXTdjOT
         kIHl4KZ5+tw4mfR9xMxqofoy7XZSGhl+3B72xWUsB1cG4FmmVE4SeOxn1rh9qHi6pVhr
         Va0A==
X-Gm-Message-State: AOAM532ndsr+3hi7G/2iB3dqnCcYOEDI8G4GhMxl60WFb+CwjEAaTLMx
	ZxGeB92u+lVZmLfwHjg0FyJn32P7EZOHcbgtd/c=
X-Google-Smtp-Source: ABdhPJxVWx/EqUVIJLm/hD4FgzS+35uqabsTwJS3H9EnlJ2muk6guWOr/eYFCWleSAdxFgCLNCqS+IwLoqY86ofuPXU=
X-Received: by 2002:a9f:3866:: with SMTP id q35mr2614997uad.71.1628152156673;
 Thu, 05 Aug 2021 01:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210804213336.1255184-1-timothy.t.orling@intel.com> <3c8866cb-cbd4-9f34-a633-b3fa2160cde0@gmail.com>
In-Reply-To: <3c8866cb-cbd4-9f34-a633-b3fa2160cde0@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 5 Aug 2021 10:29:05 +0200
Message-ID: <CANNYZj9QK0-2atYxPcuUBkoXKnjOcKGcJ=jO5=rXF1vTFKMD4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-scons{-native}: upgrade 4.1.0 -> 4.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="000000000000f058e305c8cbb6e0"

--000000000000f058e305c8cbb6e0
Content-Type: text/plain; charset="UTF-8"

It will detect the rename, once the license diff is removed.

Alex

On Thu, 5 Aug 2021 at 08:11, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/4/21 2:33 PM, Tim Orling wrote:
> > NOTE: The 4.2.0 Release of SCons will deprecate Python 3.5 Support.
> > Python 3.5 support will be dropped in the next major release.
> >
> > RELEASE 4.2.0 - Sat, 31 Jul 2021 18:12:46 -0700
> >
> >    From Byron Platt:
> >      - Fix Install() issue when copytree recursion gives bad arguments
> >        that can lead to install side-effects including keeping dangling
> >        symlinks and silently failing to copy directories (and their
> >        subdirectories) when the directory already exists in the target.
> >
> >    From Joseph Brill:
> >      - Internal MSVS update: Remove unnecessary calls to find all
> >        installed versions of msvc when constructing the installed visual
> >        studios list.
> >
> >    From William Deegan:
> >      - Improve Subst()'s logic to check for proper callable function or
> >        class's argument list. It will now allow callables with expected
> >        args, and any extra args as long as they have default arguments.
> >        Additionally functions with no defaults for extra arguments as
> >        long as they are set using functools.partial to create a new
> >        callable which set them.
> >      - Fix Issue #3035 - mingw with SHLIBVERSION set fails with either
> >        not a dll error or "Multiple ways to build the same target were
> >        specified for:".  Now mingw will disable creating the symlinks
> >        (and adding version string to ) dlls.  It sets
> >        SHLIBNOVERSIONSYMLINKS, IMPLIBNOVERSIONSYMLINKS and
> >        LDMODULENOVERSIONSYMLINKS to True.
> >      - Added --experimental flag, to enable various experimental
> >        features/tools.  You can specify 'all', 'none', or any combination
> >        of available experimental features.
> >      - Fix Issue #3933 - Remove unguarded print of debug information in
> >        SharedLibrary logic when SHLIBVERSION is specified.
> >      - Fix versioned shared library naming for MacOS platform.
> >        (Previously was libxyz.dylib.1.2.3, has been fixed to
> >        libxyz.1.2.3.dylib. Additionally the sonamed symlink had the same
> >        issue, that is now resolved as well)
> >      - Add experimental ninja builder. (Contributed by MongoDB, Daniel
> >        Moody and many others).
> >      - Fix #3955 - _LIBDIRFLAGS leaving $( and $) in *COMSTR output.
> >        Added affect_signature flag to _concat function.  If set to False,
> >        it will prepend and append $( and $). That way the various
> >        Environment variables can use that rather than
> >        "$( _concat(...)$)".
> >      - Fix issue with exparimental ninja tool which would fail on windows
> >        or when ninja package wasn't installed but --experimental=ninja
> was
> >        specified.
> >      - As part of experimental ninja tool, allow SetOption() to set both
> >        disable_execute_ninja and disable_ninja.
> >
> >    From David H:
> >      - Fix Issue #3906 - `IMPLICIT_COMMAND_DEPENDENCIES` was not properly
> >        disabled when set to any string value (For example
> ['none','false',
> >        'no','off']) Also previously 'All' wouldn't have the desired
> affect.
> >
> >    From Ivan Kravets:
> >      - Provide a custom argument escape function for `TempFileMunge`
> >        using a new `TEMPFILEARGESCFUNC` variable. Useful if you need to
> >        apply extra operations on a command argument before writing to a
> >        temporary file (fix Windows slashes, normalize paths, etc.)
> >
> >    From Henrik Maier:
> >     - DocbookXslt tool: The XSLT stylesheet file is now initialized to an
> >       env.File() Node, such that dependencies work correctly in
> hierarchical
> >       builds (eg when using DocbookXslt in
> SConscript('subdir/SConscript')
> >       context.
> >
> >    From Daniel Moody:
> >      - Update CacheDir to use uuid for tmpfile uniqueness instead of pid.
> >        This fixes cases for shared cache where two systems write to the
> >        same cache tmpfile at the same time because the happened to get
> the
> >        same pid.
> >      - Added support for passing custom CacheDir derived classes to
> >        SCons. Moved copy_from_cache attribute from the Environment class
> to
> >        CacheDir class. Code contributed by MongoDB.
> >      - Update BuildTask to pass all targets to the progress object fixing
> >        an issue where multi-target build nodes only got the first target
> >        passed to the progress object.
> >      - Fix a potential race condition in shared cache environments where
> >        the permissions are not writeable for a moment after the file has
> >        been renamed and other builds (users) will copy it out of the
> cache.
> >        Small reorganization of logic to copy files from cachedir. Moved
> >        CacheDir writeable permission code for copy to cache behind the
> atomic
> >        rename operation.
> >      - Added marking of intermediate and and multi target nodes generated
> >        from SConf tests so that is_conftest() is more accurate.
> >      - Added test for configure check failing to ensure it didn't break
> >        generating and running ninja.
> >
> >    From Mats Wichmann:
> >      - Initial support in tests for Python 3.10 - expected bytecode and
> >        one changed expected exception message. Change some more regexes
> >        to be specified as rawstrings in response to DeprecationWarnings.
> >      - Add an example of adding an emitter to User Guide (concept from
> >        Jeremy Elson)
> >      - Add timing information for sconsign database dump when
> --debug=time
> >        is selected. Also switch to generally using time.perf_counter,
> >        which is the Python recommended way for timing short durations.
> >      - Drop remaining definitions of dict-like has_key methods, since
> >        Python 3 doesn't have a dictionary has_key (maintenance)
> >      - Do not treat --site-dir=DIR and --no-site-dir as distinct options.
> >        Allows a later instance to override an earlier one.
> >      - Ignore empty cmdline arguments when computing targets (issue 2986)
> >      - Remove long-deprecated construction variables PDFCOM,
> WIN32_INSERT_DEF,
> >        WIN32DEFPREFIX, WIN32DEFSUFFIX, WIN32EXPPREFIX, WIN32EXPSUFFIX.
> >        All have been replaced by other names since at least 1.0.
> >      - Add a __iadd__ method to the CLVar class so that inplace adds
> >        (+=) also work as expected (issue 2399)
> >      - Remove local copy of CLVar in EnvironmentTests unittest file -
> >        should be testing against the production version, and they
> >        didn't really differ.
> >      - Don't strip spaces in INSTALLSTR by using raw subst (issue 2018)
> >      - Deprecate Python 3.5 as a supported version.
> >      - CPPDEFINES now expands construction variable references (issue
> >        2363)
> >      - Restore behavior that Install()'d files are writable (issue 3927)
> >      - Simplified Mkdir(), the internal mkdir_func no longer needs to
> >        handle existing directories, it can now pass exist_ok=True to
> >        os.makedirs().
> >      - Avoid WhereIs exception if user set a tool name to empty (from
> >        issue 1742)
> >      - Maintenance: remove obsolete __getslice__ definitions (Py3 never
> >        calls); add Node.fs.scandir to call new (Py3.5) os.scandir;
> >        Node.fs.makedirs now passes the exist_ok flag; Cachedir creation
> >        now uses this flag.
> >      - Maintenance: remove unneeded imports and reorganize some.  Fix
> >        uses of warnings in some tools which instantiated the class but
> did
> >        nothing with them, need to instead call SCons.Warnings.warn with
> the
> >        warn class.
> >      - Drop overridden changed_since_last_build method in Value class.
> >      - Resync the SetOption implementation and the manpage, making sure
> >        new options are available and adding a notes column for misc
> >        information. SetOption equivalents to --hash-chunksize,
> >        --implicit-deps-unchanged and --implicit-deps-changed are enabled.
> >      - Add tests for SetOption failing on disallowed options and value
> >        types.
> >      - Maintenance: eliminate lots of checker complaints about Util.py.
> >      - Maintenance: fix checker-spotted issues in Environment
> (apply_tools)
> >        and EnvironmentTests (asserts comparing with self). For
> consistency,
> >        env.Tool() now returns a tool object the same way Tool() has done.
> >      - Change SConscript() missing SConscript behavior - if
> must_exist=False,
> >        the warning is suppressed.
> >      - Make sure TEMPFILEPREFIX can be set to an empty string (issue
> 3964)
> >
> >    From Dillan Mills:
> >      - Add support for the
> >
> (TARGET,SOURCE,TARGETS,SOURCES,CHANGED_TARGETS,CHANGED_SOURCES}.relpath
> >        property. This will provide a path relative to the top of the
> build
> >        tree (where the SConstruct is located) Fixes #396
> >
> >    From Andrew Morrow:
> >      - Fix issue #3790: Generators in CPPDEFINES now have access to
> >        populated source and target lists
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> > ---
> >   ...4.1.0.bb => python3-scons-native_4.2.0.bb} |  0
> >   .../0001-Fix-man-page-installation.patch      | 23 ++-------
> >   .../python/python3-scons_4.1.0.bb             | 27 -----------
> >   .../python/python3-scons_4.2.0.bb             | 48 +++++++++++++++++++
> >   4 files changed, 51 insertions(+), 47 deletions(-)
> >   rename meta/recipes-devtools/python/{python3-scons-native_4.1.0.bb =>
> python3-scons-native_4.2.0.bb} (100%)
> >   delete mode 100644 meta/recipes-devtools/python/python3-scons_4.1.0.bb
> >   create mode 100644 meta/recipes-devtools/python/python3-scons_4.2.0.bb
> >
> > diff --git a/meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
> b/meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
> > rename to meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> > diff --git
> a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> > index ff212b85ee..6dffe64809 100644
> > ---
> a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> > +++
> b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> > @@ -1,4 +1,4 @@
> > -From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 2001
> > +From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
> >   From: Tim Orling <ticotimo@gmail.com>
> >   Date: Sat, 22 May 2021 11:20:46 -0700
> >   Subject: [PATCH] Fix man page installation
> > @@ -9,10 +9,10 @@ Fixes:
> >   Upstream-Status: Inappropriate [oe specific]
> >
> >   Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > +
> >   ---
> >    MANIFEST.in | 2 +-
> > - setup.cfg   | 6 +++---
> > - 2 files changed, 4 insertions(+), 4 deletions(-)
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >   diff --git a/MANIFEST.in b/MANIFEST.in
> >   index 04ec000..937f6f3 100644
> > @@ -27,20 +27,3 @@ index 04ec000..937f6f3 100644
> >
> >
> >
> > -diff --git a/setup.cfg b/setup.cfg
> > -index 37e5204..677c00a 100644
> > ---- a/setup.cfg
> > -+++ b/setup.cfg
> > -@@ -56,9 +56,9 @@ console_scripts =
> > - scons.tool.docbook = *.*
> > -
> > - [options.data_files]
> > --. = build/doc/man/scons.1
> > --    build/doc/man/scons-time.1
> > --    build/doc/man/sconsign.1
> > -+. = scons.1
> > -+    scons-time.1
> > -+    sconsign.1
> > -
> > - [sdist]
> > - dist-dir = build/dist
> > diff --git a/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> b/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> > deleted file mode 100644
> > index 5a5b550be0..0000000000
> > --- a/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -SUMMARY = "Software Construction tool (make/autotools replacement)"
> > -HOMEPAGE = "https://github.com/SCons/scons"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=b94c6e2be9670c62b38f7118c12866d2"
> > -
> > -SRC_URI += " file://0001-Fix-man-page-installation.patch"
> > -SRC_URI[sha256sum] =
> "accb8035be2c9cfbab06471286eaeff86a10037a8064cf4ef4c3df04ea5a7387"
> > -
> > -PYPI_PACKAGE = "SCons"
> > -
> > -inherit pypi setuptools3
> > -
> > -RDEPENDS:${PN}:class-target = "\
> > -  python3-core \
> > -  python3-compression \
> > -  python3-fcntl \
> > -  python3-importlib-metadata \
> > -  python3-io \
> > -  python3-json \
> > -  python3-shell \
> > -  python3-pickle \
> > -  python3-pkg-resources \
> > -  python3-pprint \
> > -  "
> > -
> > -FILES:${PN}-doc += "${datadir}/scons*.1"
> > diff --git a/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> > new file mode 100644
> > index 0000000000..78e10b537a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> > @@ -0,0 +1,48 @@
> > +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool
> upgrade'.
> > +# The following is the difference between the old and the new license
> text.
> > +# Please update the LICENSE value if needed, and summarize the changes
> in
> > +# the commit message via 'License-Update:' tag.
> > +# (example: 'License-Update: copyright years updated.')
>
> above cruft should be deleted. Secondly it would have been better if git
> detected it as rename instead of add/delete so we will looking at diff
> w.r.t. 4.1.0
>
> > +#
> > +# The changes:
> > +#
> > +# --- LICENSE
> > +# +++ LICENSE
> > +# @@ -1,6 +1,6 @@
> > +#  MIT License
> > +#
> > +# -Copyright (c) 2001 - 2020 The SCons Foundation
> > +# +Copyright (c) 2001 - 2021 The SCons Foundation
> > +#
> > +#  Permission is hereby granted, free of charge, to any person obtaining
> > +#  a copy of this software and associated documentation files (the
> > +#
> > +#
> > +
> > +SUMMARY = "Software Construction tool (make/autotools replacement)"
> > +HOMEPAGE = "https://github.com/SCons/scons"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
> > +
> > +SRC_URI += " file://0001-Fix-man-page-installation.patch"
> > +SRC_URI[sha256sum] =
> "691893b63f38ad14295f5104661d55cb738ec6514421c6261323351c25432b0a"
> > +
> > +PYPI_PACKAGE = "SCons"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS:${PN}:class-target = "\
> > +  python3-core \
> > +  python3-compression \
> > +  python3-fcntl \
> > +  python3-importlib-metadata \
> > +  python3-io \
> > +  python3-json \
> > +  python3-shell \
> > +  python3-pickle \
> > +  python3-pkg-resources \
> > +  python3-pprint \
> > +  "
> > +
> > +FILES:${PN}-doc += "${datadir}/scons*.1"
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000f058e305c8cbb6e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It will detect the rename, once the license diff is r=
emoved.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 5 Aug 2021 at 08:11,=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/4/21 2:33 PM, Tim Orling wrote:<br>
&gt; NOTE: The 4.2.0 Release of SCons will deprecate Python 3.5 Support.<b=
r>
&gt; Python 3.5 support will be dropped in the next major release.<br>
&gt; <br>
&gt; RELEASE 4.2.0 - Sat, 31 Jul 2021 18:12:46 -0700<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Byron Platt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix Install() issue when copytree recursion giv=
es bad arguments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 that can lead to install side-effects incl=
uding keeping dangling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 symlinks and silently failing to copy dire=
ctories (and their<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 subdirectories) when the directory already=
 exists in the target.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Joseph Brill:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Internal MSVS update: Remove unnecessary calls =
to find all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 installed versions of msvc when constructi=
ng the installed visual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 studios list.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From William Deegan:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Improve Subst()&#39;s logic to check for proper=
 callable function or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 class&#39;s argument list. It will now all=
ow callables with expected<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 args, and any extra args as long as they h=
ave default arguments.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Additionally functions with no defaults fo=
r extra arguments as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 long as they are set using functools.parti=
al to create a new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 callable which set them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix Issue #3035 - mingw with SHLIBVERSION set f=
ails with either<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 not a dll error or &quot;Multiple ways to =
build the same target were<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified for:&quot;.=C2=A0 Now mingw will=
 disable creating the symlinks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and adding version string to ) dlls.=C2=
=A0 It sets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIBNOVERSIONSYMLINKS, IMPLIBNOVERSIONSYM=
LINKS and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 LDMODULENOVERSIONSYMLINKS to True.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Added --experimental flag, to enable various ex=
perimental<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 features/tools.=C2=A0 You can specify &#39=
;all&#39;, &#39;none&#39;, or any combination<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 of available experimental features.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix Issue #3933 - Remove unguarded print of deb=
ug information in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 SharedLibrary logic when SHLIBVERSION is s=
pecified.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix versioned shared library naming for MacOS p=
latform.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 (Previously was libxyz.dylib.1.2.3, has be=
en fixed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxyz.1.2.3.dylib. Additionally the sonam=
ed symlink had the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue, that is now resolved as well)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add experimental ninja builder. (Contributed by=
 MongoDB, Daniel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Moody and many others).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix #3955 - _LIBDIRFLAGS leaving $( and $) in *=
COMSTR output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added affect_signature flag to _concat fun=
ction.=C2=A0 If set to False,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 it will prepend and append $( and $). That=
 way the various<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Environment variables can use that rather =
than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$( _concat(...)$)&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix issue with exparimental ninja tool which wo=
uld fail on windows<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 or when ninja package wasn&#39;t installed=
 but --experimental=3Dninja was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - As part of experimental ninja tool, allow SetOp=
tion() to set both<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 disable_execute_ninja and disable_ninja.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 From David H:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix Issue #3906 - `IMPLICIT_COMMAND_DEPENDENCIE=
S` was not properly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 disabled when set to any string value (For=
 example [&#39;none&#39;,&#39;false&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;no&#39;,&#39;off&#39;]) Also previous=
ly &#39;All&#39; wouldn&#39;t have the desired affect.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Ivan Kravets:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Provide a custom argument escape function for `=
TempFileMunge`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 using a new `TEMPFILEARGESCFUNC` variable.=
 Useful if you need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 apply extra operations on a command argume=
nt before writing to a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 temporary file (fix Windows slashes, norma=
lize paths, etc.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Henrik Maier:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- DocbookXslt tool: The XSLT stylesheet file is no=
w initialized to an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env.File() Node, such that dependencies wor=
k correctly in hierarchical<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0builds (eg when using DocbookXslt in SConsc=
ript(&#39;subdir/SConscript&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0context.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Daniel Moody:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Update CacheDir to use uuid for tmpfile uniquen=
ess instead of pid.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 This fixes cases for shared cache where tw=
o systems write to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 same cache tmpfile at the same time becaus=
e the happened to get the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 same pid.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Added support for passing custom CacheDir deriv=
ed classes to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 SCons. Moved copy_from_cache attribute fro=
m the Environment class to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 CacheDir class. Code contributed by MongoD=
B.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Update BuildTask to pass all targets to the pro=
gress object fixing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 an issue where multi-target build nodes on=
ly got the first target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 passed to the progress object.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix a potential race condition in shared cache =
environments where<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the permissions are not writeable for a mo=
ment after the file has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 been renamed and other builds (users) will=
 copy it out of the cache.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Small reorganization of logic to copy file=
s from cachedir. Moved<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 CacheDir writeable permission code for cop=
y to cache behind the atomic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 rename operation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Added marking of intermediate and and multi tar=
get nodes generated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 from SConf tests so that is_conftest() is =
more accurate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Added test for configure check failing to ensur=
e it didn&#39;t break<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 generating and running ninja.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Mats Wichmann:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Initial support in tests for Python 3.10 - expe=
cted bytecode and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 one changed expected exception message. Ch=
ange some more regexes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 to be specified as rawstrings in response =
to DeprecationWarnings.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add an example of adding an emitter to User Gui=
de (concept from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Jeremy Elson)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add timing information for sconsign database du=
mp when --debug=3Dtime<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 is selected. Also switch to generally usin=
g time.perf_counter,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 which is the Python recommended way for ti=
ming short durations.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Drop remaining definitions of dict-like has_key=
 methods, since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Python 3 doesn&#39;t have a dictionary has=
_key (maintenance)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Do not treat --site-dir=3DDIR and --no-site-dir=
 as distinct options.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Allows a later instance to override an ear=
lier one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Ignore empty cmdline arguments when computing t=
argets (issue 2986)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Remove long-deprecated construction variables P=
DFCOM, WIN32_INSERT_DEF,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 WIN32DEFPREFIX, WIN32DEFSUFFIX, WIN32EXPPR=
EFIX, WIN32EXPSUFFIX.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 All have been replaced by other names sinc=
e at least 1.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add a __iadd__ method to the CLVar class so tha=
t inplace adds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 (+=3D) also work as expected (issue 2399)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Remove local copy of CLVar in EnvironmentTests =
unittest file -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 should be testing against the production v=
ersion, and they<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 didn&#39;t really differ.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Don&#39;t strip spaces in INSTALLSTR by using r=
aw subst (issue 2018)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Deprecate Python 3.5 as a supported version.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 - CPPDEFINES now expands construction variable re=
ferences (issue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 2363)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Restore behavior that Install()&#39;d files are=
 writable (issue 3927)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Simplified Mkdir(), the internal mkdir_func no =
longer needs to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 handle existing directories, it can now pa=
ss exist_ok=3DTrue to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs().<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Avoid WhereIs exception if user set a tool name=
 to empty (from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue 1742)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Maintenance: remove obsolete __getslice__ defin=
itions (Py3 never<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 calls); add Node.fs.scandir to call new (P=
y3.5) os.scandir;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Node.fs.makedirs now passes the exist_ok f=
lag; Cachedir creation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 now uses this flag.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Maintenance: remove unneeded imports and reorga=
nize some.=C2=A0 Fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 uses of warnings in some tools which insta=
ntiated the class but did<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 nothing with them, need to instead call SC=
ons.Warnings.warn with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn class.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Drop overridden changed_since_last_build method=
 in Value class.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Resync the SetOption implementation and the man=
page, making sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 new options are available and adding a not=
es column for misc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 information. SetOption equivalents to --ha=
sh-chunksize,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 --implicit-deps-unchanged and --implicit-d=
eps-changed are enabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add tests for SetOption failing on disallowed o=
ptions and value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 types.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Maintenance: eliminate lots of checker complain=
ts about Util.py.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Maintenance: fix checker-spotted issues in Envi=
ronment (apply_tools)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 and EnvironmentTests (asserts comparing wi=
th self). For consistency,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 env.Tool() now returns a tool object the s=
ame way Tool() has done.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Change SConscript() missing SConscript behavior=
 - if must_exist=3DFalse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the warning is suppressed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Make sure TEMPFILEPREFIX can be set to an empty=
 string (issue 3964)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Dillan Mills:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Add support for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 (TARGET,SOURCE,TARGETS,SOURCES,CHANGED_TAR=
GETS,CHANGED_SOURCES}.relpath<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 property. This will provide a path relativ=
e to the top of the build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree (where the SConstruct is located) Fix=
es #396<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 From Andrew Morrow:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix issue #3790: Generators in CPPDEFINES now h=
ave access to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 populated source and target lists<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@inte=
l.com" target=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://4.1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-scons-native_4.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4.2.0.bb<=
/a>} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0.../0001-Fix-man-page-installation.patch=C2=A0 =C2=A0 =C2=
=
=A0 | 23 ++-------<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-scons_4.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 -----------<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-scons_4.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 48 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 51 insertions(+), 47 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://py=
thon3-scons-native_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-s=
cons-native_4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-scons-native_4.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4.2.0.bb</=
a>} (100%)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-scons_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scons_4.1.0.bb</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-scons_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scons_4.2.0.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-s=
cons-native_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-na=
tive_4.1.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-=
scons-native_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-n=
ative_4.2.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-sc=
ons-native_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-nat=
ive_4.1.0.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-scon=
s-native_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-nativ=
e_4.2.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-=
page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-F=
ix-man-page-installation.patch<br>
&gt; index ff212b85ee..6dffe64809 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-in=
stallation.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-in=
stallation.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 =C2=A0From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com=
" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Sat, 22 May 2021 11:20:46 -0700<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Fix man page installation<br>
&gt; @@ -9,10 +9,10 @@ Fixes:<br>
&gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate [oe specific]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@=
gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 MANIFEST.in | 2 +-<br>
&gt; - setup.cfg=C2=A0 =C2=A0| 6 +++---<br>
&gt; - 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/MANIFEST.in b/MANIFEST.in<br>
&gt;=C2=A0 =C2=A0index 04ec000..937f6f3 100644<br>
&gt; @@ -27,20 +27,3 @@ index 04ec000..937f6f3 100644<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -diff --git a/setup.cfg b/setup.cfg<br>
&gt; -index 37e5204..677c00a 100644<br>
&gt; ---- a/setup.cfg<br>
&gt; -+++ b/setup.cfg<br>
&gt; -@@ -56,9 +56,9 @@ console_scripts =3D<br>
&gt; - scons.tool.docbook =3D *.*<br>
&gt; -<br>
&gt; - [options.data_files]<br>
&gt; --. =3D build/doc/man/scons.1<br>
&gt; --=C2=A0 =C2=A0 build/doc/man/scons-time.1<br>
&gt; --=C2=A0 =C2=A0 build/doc/man/sconsign.1<br>
&gt; -+. =3D scons.1<br>
&gt; -+=C2=A0 =C2=A0 scons-time.1<br>
&gt; -+=C2=A0 =C2=A0 sconsign.1<br>
&gt; -<br>
&gt; - [sdist]<br>
&gt; - dist-dir =3D build/dist<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-s=
cons_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 5a5b550be0..0000000000<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.1.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Software Construction tool (make/autotools replace=
ment)&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/SCons/scons" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/SCons/scons</a>&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db94c6e2be9670c62b38f=
7118c12866d2&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot; file://0001-Fix-man-page-installation.patch&quot=
;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;accb8035be2c9cfbab06471286eaeff86a10037=
a8064cf4ef4c3df04ea5a7387&quot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;SCons&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:class-target =3D &quot;\<br>
&gt; -=C2=A0 python3-core \<br>
&gt; -=C2=A0 python3-compression \<br>
&gt; -=C2=A0 python3-fcntl \<br>
&gt; -=C2=A0 python3-importlib-metadata \<br>
&gt; -=C2=A0 python3-io \<br>
&gt; -=C2=A0 python3-json \<br>
&gt; -=C2=A0 python3-shell \<br>
&gt; -=C2=A0 python3-pickle \<br>
&gt; -=C2=A0 python3-pkg-resources \<br>
&gt; -=C2=A0 python3-pprint \<br>
&gt; -=C2=A0 &quot;<br>
&gt; -<br>
&gt; -FILES:${PN}-doc +=3D &quot;${datadir}/scons*.1&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-s=
cons_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..78e10b537a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_4.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.2.0.bb</a><br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +# FIXME: the LIC_FILES_CHKSUM values have been updated by &#39;devto=
ol upgrade&#39;.<br>
&gt; +# The following is the difference between the old and the new licens=
e text.<br>
&gt; +# Please update the LICENSE value if needed, and summarize the chang=
es in<br>
&gt; +# the commit message via &#39;License-Update:&#39; tag.<br>
&gt; +# (example: &#39;License-Update: copyright years updated.&#39;)<br>
<br>
above cruft should be deleted. Secondly it would have been better if git <=
br>
detected it as rename instead of add/delete so we will looking at diff <br=
>
w.r.t. 4.1.0<br>
<br>
&gt; +#<br>
&gt; +# The changes:<br>
&gt; +#<br>
&gt; +# --- LICENSE<br>
&gt; +# +++ LICENSE<br>
&gt; +# @@ -1,6 +1,6 @@<br>
&gt; +#=C2=A0 MIT License<br>
&gt; +#<br>
&gt; +# -Copyright (c) 2001 - 2020 The SCons Foundation<br>
&gt; +# +Copyright (c) 2001 - 2021 The SCons Foundation<br>
&gt; +#<br>
&gt; +#=C2=A0 Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; +#=C2=A0 a copy of this software and associated documentation files (=
the<br>
&gt; +#<br>
&gt; +#<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;Software Construction tool (make/autotools replace=
ment)&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/SCons/scons" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/SCons/scons</a>&quot;<br>
&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd903b0b8027f461402ba=
c9b5169b36f7&quot;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot; file://0001-Fix-man-page-installation.patch&quot=
;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;691893b63f38ad14295f5104661d55cb738ec65=
14421c6261323351c25432b0a&quot;<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;SCons&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}:class-target =3D &quot;\<br>
&gt; +=C2=A0 python3-core \<br>
&gt; +=C2=A0 python3-compression \<br>
&gt; +=C2=A0 python3-fcntl \<br>
&gt; +=C2=A0 python3-importlib-metadata \<br>
&gt; +=C2=A0 python3-io \<br>
&gt; +=C2=A0 python3-json \<br>
&gt; +=C2=A0 python3-shell \<br>
&gt; +=C2=A0 python3-pickle \<br>
&gt; +=C2=A0 python3-pkg-resources \<br>
&gt; +=C2=A0 python3-pprint \<br>
&gt; +=C2=A0 &quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-doc +=3D &quot;${datadir}/scons*.1&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f058e305c8cbb6e0--
