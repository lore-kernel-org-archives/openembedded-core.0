Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.5396.1628143881499250501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 23:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xj5vooNf;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so7145837pjd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7KBEIR37jRtv+yGNLxcVOIeoyz34obdGPbLvQ+uRtWI=;
        b=Xj5vooNft5soj9e3ZzOhC1jJq8iMMCY7C8P9q9Am9oZKguE8n2pMDCd1g3p36nKWN9
         nZSCzEGRkYQ9+ZDLWWwFdeqAiQS58wKnOzefu9uJnCRrEhvufUxoWRRzAACmzZwuRTFt
         xDeysvb4PZGqYr7o6P8YVGjiyY8exznFqxrK+bO/cGz+wX3bAt/Im1bmAQeAQkw2eAbu
         ivTY/WARu8aZRiopzZ3dEUsdfFehFlth70ZDLTDFnASR4yNNZVJ8IJvEQ4PVv9Shai/d
         yf135NCOouJWWqtMMqJnYXF0xaUC/U+MVHz0FEcskhgZEw6Cis/JmP8Jni5aQsdlqXSd
         quQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7KBEIR37jRtv+yGNLxcVOIeoyz34obdGPbLvQ+uRtWI=;
        b=OkQwnjGmMJVP8gVvKaSa56fwkxzgQEw99AaPZcC7D+FK9P4FjjOyo21UMlKKEJPSeR
         eAagh0/kIEn6me/FxTPEHirz4FxNmFwf1vyITkZcfB/RHDoDVgQmKGBAtRmQuqQrE+P/
         rG2uEpmrDRTvVYtDsMqFmLMAKxstqGsAbkdJQKTqS7BB/0ZwaJLsutRZOuYz0AYFL/oC
         Oi32SFC7T+esRm2/lBLoGT5ogKB9GuPF6LlWvJhBCvgBCXhH3p3XlT+aOGWE+GAQm6/w
         r8xj6/Bw2+S8wB3/mF6Fw9SCGoqb3whSjMsTJHw3cAif32H7P2UL+dROeof/VnI5AXyY
         +NhQ==
X-Gm-Message-State: AOAM533HxyQFbjTgj58OvUS3gNI93KQHL3TGvHtMp0WpZfYyPvzLWb8R
	1bGiNZUcTrIJ1bdeic8PVUU=
X-Google-Smtp-Source: ABdhPJyc7n09+xDjQo4BU3JD+st89trdHXcNb6ofMWH0/d/pLdBwsXDxvn1v4GqpJUZSIpBhU/6G8g==
X-Received: by 2002:a63:dd46:: with SMTP id g6mr317965pgj.347.1628143880822;
        Wed, 04 Aug 2021 23:11:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7855:55f7:d28b:c03? ([2601:646:9200:a0f0:7855:55f7:d28b:c03])
        by smtp.gmail.com with ESMTPSA id d2sm8248969pjd.24.2021.08.04.23.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 23:11:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] python3-scons{-native}: upgrade 4.1.0 -> 4.2.0
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
References: <20210804213336.1255184-1-timothy.t.orling@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3c8866cb-cbd4-9f34-a633-b3fa2160cde0@gmail.com>
Date: Wed, 4 Aug 2021 23:11:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804213336.1255184-1-timothy.t.orling@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/4/21 2:33 PM, Tim Orling wrote:
> NOTE: The 4.2.0 Release of SCons will deprecate Python 3.5 Support.
> Python 3.5 support will be dropped in the next major release.
> 
> RELEASE 4.2.0 - Sat, 31 Jul 2021 18:12:46 -0700
> 
>    From Byron Platt:
>      - Fix Install() issue when copytree recursion gives bad arguments
>        that can lead to install side-effects including keeping dangling
>        symlinks and silently failing to copy directories (and their
>        subdirectories) when the directory already exists in the target.
> 
>    From Joseph Brill:
>      - Internal MSVS update: Remove unnecessary calls to find all
>        installed versions of msvc when constructing the installed visual
>        studios list.
> 
>    From William Deegan:
>      - Improve Subst()'s logic to check for proper callable function or
>        class's argument list. It will now allow callables with expected
>        args, and any extra args as long as they have default arguments.
>        Additionally functions with no defaults for extra arguments as
>        long as they are set using functools.partial to create a new
>        callable which set them.
>      - Fix Issue #3035 - mingw with SHLIBVERSION set fails with either
>        not a dll error or "Multiple ways to build the same target were
>        specified for:".  Now mingw will disable creating the symlinks
>        (and adding version string to ) dlls.  It sets
>        SHLIBNOVERSIONSYMLINKS, IMPLIBNOVERSIONSYMLINKS and
>        LDMODULENOVERSIONSYMLINKS to True.
>      - Added --experimental flag, to enable various experimental
>        features/tools.  You can specify 'all', 'none', or any combination
>        of available experimental features.
>      - Fix Issue #3933 - Remove unguarded print of debug information in
>        SharedLibrary logic when SHLIBVERSION is specified.
>      - Fix versioned shared library naming for MacOS platform.
>        (Previously was libxyz.dylib.1.2.3, has been fixed to
>        libxyz.1.2.3.dylib. Additionally the sonamed symlink had the same
>        issue, that is now resolved as well)
>      - Add experimental ninja builder. (Contributed by MongoDB, Daniel
>        Moody and many others).
>      - Fix #3955 - _LIBDIRFLAGS leaving $( and $) in *COMSTR output.
>        Added affect_signature flag to _concat function.  If set to False,
>        it will prepend and append $( and $). That way the various
>        Environment variables can use that rather than
>        "$( _concat(...)$)".
>      - Fix issue with exparimental ninja tool which would fail on windows
>        or when ninja package wasn't installed but --experimental=ninja was
>        specified.
>      - As part of experimental ninja tool, allow SetOption() to set both
>        disable_execute_ninja and disable_ninja.
> 
>    From David H:
>      - Fix Issue #3906 - `IMPLICIT_COMMAND_DEPENDENCIES` was not properly
>        disabled when set to any string value (For example ['none','false',
>        'no','off']) Also previously 'All' wouldn't have the desired affect.
> 
>    From Ivan Kravets:
>      - Provide a custom argument escape function for `TempFileMunge`
>        using a new `TEMPFILEARGESCFUNC` variable. Useful if you need to
>        apply extra operations on a command argument before writing to a
>        temporary file (fix Windows slashes, normalize paths, etc.)
> 
>    From Henrik Maier:
>     - DocbookXslt tool: The XSLT stylesheet file is now initialized to an
>       env.File() Node, such that dependencies work correctly in hierarchical
>       builds (eg when using DocbookXslt in SConscript('subdir/SConscript')
>       context.
> 
>    From Daniel Moody:
>      - Update CacheDir to use uuid for tmpfile uniqueness instead of pid.
>        This fixes cases for shared cache where two systems write to the
>        same cache tmpfile at the same time because the happened to get the
>        same pid.
>      - Added support for passing custom CacheDir derived classes to
>        SCons. Moved copy_from_cache attribute from the Environment class to
>        CacheDir class. Code contributed by MongoDB.
>      - Update BuildTask to pass all targets to the progress object fixing
>        an issue where multi-target build nodes only got the first target
>        passed to the progress object.
>      - Fix a potential race condition in shared cache environments where
>        the permissions are not writeable for a moment after the file has
>        been renamed and other builds (users) will copy it out of the cache.
>        Small reorganization of logic to copy files from cachedir. Moved
>        CacheDir writeable permission code for copy to cache behind the atomic
>        rename operation.
>      - Added marking of intermediate and and multi target nodes generated
>        from SConf tests so that is_conftest() is more accurate.
>      - Added test for configure check failing to ensure it didn't break
>        generating and running ninja.
> 
>    From Mats Wichmann:
>      - Initial support in tests for Python 3.10 - expected bytecode and
>        one changed expected exception message. Change some more regexes
>        to be specified as rawstrings in response to DeprecationWarnings.
>      - Add an example of adding an emitter to User Guide (concept from
>        Jeremy Elson)
>      - Add timing information for sconsign database dump when --debug=time
>        is selected. Also switch to generally using time.perf_counter,
>        which is the Python recommended way for timing short durations.
>      - Drop remaining definitions of dict-like has_key methods, since
>        Python 3 doesn't have a dictionary has_key (maintenance)
>      - Do not treat --site-dir=DIR and --no-site-dir as distinct options.
>        Allows a later instance to override an earlier one.
>      - Ignore empty cmdline arguments when computing targets (issue 2986)
>      - Remove long-deprecated construction variables PDFCOM, WIN32_INSERT_DEF,
>        WIN32DEFPREFIX, WIN32DEFSUFFIX, WIN32EXPPREFIX, WIN32EXPSUFFIX.
>        All have been replaced by other names since at least 1.0.
>      - Add a __iadd__ method to the CLVar class so that inplace adds
>        (+=) also work as expected (issue 2399)
>      - Remove local copy of CLVar in EnvironmentTests unittest file -
>        should be testing against the production version, and they
>        didn't really differ.
>      - Don't strip spaces in INSTALLSTR by using raw subst (issue 2018)
>      - Deprecate Python 3.5 as a supported version.
>      - CPPDEFINES now expands construction variable references (issue
>        2363)
>      - Restore behavior that Install()'d files are writable (issue 3927)
>      - Simplified Mkdir(), the internal mkdir_func no longer needs to
>        handle existing directories, it can now pass exist_ok=True to
>        os.makedirs().
>      - Avoid WhereIs exception if user set a tool name to empty (from
>        issue 1742)
>      - Maintenance: remove obsolete __getslice__ definitions (Py3 never
>        calls); add Node.fs.scandir to call new (Py3.5) os.scandir;
>        Node.fs.makedirs now passes the exist_ok flag; Cachedir creation
>        now uses this flag.
>      - Maintenance: remove unneeded imports and reorganize some.  Fix
>        uses of warnings in some tools which instantiated the class but did
>        nothing with them, need to instead call SCons.Warnings.warn with the
>        warn class.
>      - Drop overridden changed_since_last_build method in Value class.
>      - Resync the SetOption implementation and the manpage, making sure
>        new options are available and adding a notes column for misc
>        information. SetOption equivalents to --hash-chunksize,
>        --implicit-deps-unchanged and --implicit-deps-changed are enabled.
>      - Add tests for SetOption failing on disallowed options and value
>        types.
>      - Maintenance: eliminate lots of checker complaints about Util.py.
>      - Maintenance: fix checker-spotted issues in Environment (apply_tools)
>        and EnvironmentTests (asserts comparing with self). For consistency,
>        env.Tool() now returns a tool object the same way Tool() has done.
>      - Change SConscript() missing SConscript behavior - if must_exist=False,
>        the warning is suppressed.
>      - Make sure TEMPFILEPREFIX can be set to an empty string (issue 3964)
> 
>    From Dillan Mills:
>      - Add support for the
>        (TARGET,SOURCE,TARGETS,SOURCES,CHANGED_TARGETS,CHANGED_SOURCES}.relpath
>        property. This will provide a path relative to the top of the build
>        tree (where the SConstruct is located) Fixes #396
> 
>    From Andrew Morrow:
>      - Fix issue #3790: Generators in CPPDEFINES now have access to
>        populated source and target lists
> 
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>   ...4.1.0.bb => python3-scons-native_4.2.0.bb} |  0
>   .../0001-Fix-man-page-installation.patch      | 23 ++-------
>   .../python/python3-scons_4.1.0.bb             | 27 -----------
>   .../python/python3-scons_4.2.0.bb             | 48 +++++++++++++++++++
>   4 files changed, 51 insertions(+), 47 deletions(-)
>   rename meta/recipes-devtools/python/{python3-scons-native_4.1.0.bb => python3-scons-native_4.2.0.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/python/python3-scons_4.1.0.bb
>   create mode 100644 meta/recipes-devtools/python/python3-scons_4.2.0.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-scons-native_4.1.0.bb b/meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
> rename to meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
> diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> index ff212b85ee..6dffe64809 100644
> --- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> +++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
> @@ -1,4 +1,4 @@
> -From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 2001
> +From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
>   From: Tim Orling <ticotimo@gmail.com>
>   Date: Sat, 22 May 2021 11:20:46 -0700
>   Subject: [PATCH] Fix man page installation
> @@ -9,10 +9,10 @@ Fixes:
>   Upstream-Status: Inappropriate [oe specific]
>   
>   Signed-off-by: Tim Orling <ticotimo@gmail.com>
> +
>   ---
>    MANIFEST.in | 2 +-
> - setup.cfg   | 6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/MANIFEST.in b/MANIFEST.in
>   index 04ec000..937f6f3 100644
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
> --	build/doc/man/scons-time.1
> --	build/doc/man/sconsign.1
> -+. = scons.1
> -+	scons-time.1
> -+	sconsign.1
> -
> - [sdist]
> - dist-dir = build/dist
> diff --git a/meta/recipes-devtools/python/python3-scons_4.1.0.bb b/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> deleted file mode 100644
> index 5a5b550be0..0000000000
> --- a/meta/recipes-devtools/python/python3-scons_4.1.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Software Construction tool (make/autotools replacement)"
> -HOMEPAGE = "https://github.com/SCons/scons"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b94c6e2be9670c62b38f7118c12866d2"
> -
> -SRC_URI += " file://0001-Fix-man-page-installation.patch"
> -SRC_URI[sha256sum] = "accb8035be2c9cfbab06471286eaeff86a10037a8064cf4ef4c3df04ea5a7387"
> -
> -PYPI_PACKAGE = "SCons"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN}:class-target = "\
> -  python3-core \
> -  python3-compression \
> -  python3-fcntl \
> -  python3-importlib-metadata \
> -  python3-io \
> -  python3-json \
> -  python3-shell \
> -  python3-pickle \
> -  python3-pkg-resources \
> -  python3-pprint \
> -  "
> -
> -FILES:${PN}-doc += "${datadir}/scons*.1"
> diff --git a/meta/recipes-devtools/python/python3-scons_4.2.0.bb b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> new file mode 100644
> index 0000000000..78e10b537a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-scons_4.2.0.bb
> @@ -0,0 +1,48 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')

above cruft should be deleted. Secondly it would have been better if git 
detected it as rename instead of add/delete so we will looking at diff 
w.r.t. 4.1.0

> +#
> +# The changes:
> +#
> +# --- LICENSE
> +# +++ LICENSE
> +# @@ -1,6 +1,6 @@
> +#  MIT License
> +#
> +# -Copyright (c) 2001 - 2020 The SCons Foundation
> +# +Copyright (c) 2001 - 2021 The SCons Foundation
> +#
> +#  Permission is hereby granted, free of charge, to any person obtaining
> +#  a copy of this software and associated documentation files (the
> +#
> +#
> +
> +SUMMARY = "Software Construction tool (make/autotools replacement)"
> +HOMEPAGE = "https://github.com/SCons/scons"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
> +
> +SRC_URI += " file://0001-Fix-man-page-installation.patch"
> +SRC_URI[sha256sum] = "691893b63f38ad14295f5104661d55cb738ec6514421c6261323351c25432b0a"
> +
> +PYPI_PACKAGE = "SCons"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN}:class-target = "\
> +  python3-core \
> +  python3-compression \
> +  python3-fcntl \
> +  python3-importlib-metadata \
> +  python3-io \
> +  python3-json \
> +  python3-shell \
> +  python3-pickle \
> +  python3-pkg-resources \
> +  python3-pprint \
> +  "
> +
> +FILES:${PN}-doc += "${datadir}/scons*.1"
> 
> 
> 
> 
> 
