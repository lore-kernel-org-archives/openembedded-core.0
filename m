Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web12.19041.1604255058734999408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 10:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qqjpGs2C;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id b3so6271859vsc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 10:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yW3RA3+CXXS72ZV4cEFixuVg5uxhqEBSpMaotFe/pJA=;
        b=qqjpGs2CTslnzdEJeEoDikWihnzWwu3bkkjiYKVGf6QI6uqYccQL6RhmfiKQICyweh
         5KMqfnl70r9Vq54OsjnXg+tjI1pnkyPfD2yFBHwVMirwEdajC5FlKknajbk+JBW40VAZ
         WdmOLXpAcEyfR8mIfw/7cPTpoMF/L5EGOBaMpnx7I9QiWEkPqJUL1YKDZ/HeGh+meAWr
         mSo703VDiiu2GdvJF0vrifWNY50s6SWq1mPG/bsCX6CpvvxDvoT0wCL0wqOMq6zZtAZA
         icUL7ozUUdLZcknh26uJrPma6FVSPqxntVhIAUPGFRLd4BlSRJV00dScDKnIlo16BVTg
         4VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yW3RA3+CXXS72ZV4cEFixuVg5uxhqEBSpMaotFe/pJA=;
        b=ftpCVUjJkeFuqv5uI6bM801Yqg9WdPWlzp0hL7D1hQvA0TKqepsMVpRfuGfQ+2bVGS
         fe8NPp3wSlLvx9iHriW87GM4ScpOBbSxiDZ0Z1KvaX4tfgehu7llfwKrTHhVZooKVEpz
         MBBpU+FPhkqwBSl5kgjVyU0HMDZrotd3TMqv0JL4N5iitOCAokv68iv7WnCx5tO0L29Z
         fnoQopX4jMGhD21HkB/7y48pfs/f6x+j4KzFgPGNaMWXcZDp+6qSlQZKn69IPJrwKIUK
         2z1vUUXOeu7A37ZRWDmhb4+nXG/Ky5L9AvnKqCH5kU/YepwbfiJsYLMby4hMaTtAzisw
         8kVQ==
X-Gm-Message-State: AOAM531ECM9BzHaT63V36q10R+JDOJhzX290XMPBv7RtzUPITDHqcrP9
	eSVZOTxqDoofp5zpRatROaM5KvASn/J5yf1nJV0=
X-Google-Smtp-Source: ABdhPJy/ELEg9iX/MiK/eh4hkk3f2fKu93XTiNzRfyzqwpsTg2OkB3NrtSurHlawXLIw6k7kTQbUbGxG/bDt1flAW70=
X-Received: by 2002:a67:403:: with SMTP id 3mr11617544vse.54.1604255057798;
 Sun, 01 Nov 2020 10:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20201101152324.20786-1-alex.kanavin@gmail.com> <6b079721-8e01-e629-1a80-b3cc0cc58395@gmail.com>
In-Reply-To: <6b079721-8e01-e629-1a80-b3cc0cc58395@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 1 Nov 2020 19:24:06 +0100
Message-ID: <CANNYZj-pLDxGk6g7h_1KU9x3LsE5ADRJu7a9WQO9X8VzTobYeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mklibs: remove recipes and class
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d969a305b30fbc87"

--000000000000d969a305b30fbc87
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2020 at 19:09, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 11/1/20 7:23 AM, Alexander Kanavin wrote:
> > This is not enabled or tested by default, and has never been
> > ported to python 3 upstream[1], which means it doesn't work at all
> > with plain poky. If you need it, please put it in a separate layer
> > and/or modernize to work with py3.
> >
> > https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
> >
>
> There are users of it and they havent yet caught up with py3 only distros.
> I think it will be good to keep it going. Can you try this patch and see
> if it work with py3 tests that you do?
>
> https://uclibc.org/~kraj/0001-mklib-Port-to-use-python3.patch
>

Sorry Khem, but you need to step up and maintain it properly, if you want
to keep it, particularly set up real AB testing. The reason I looked at it
at all, is that I am doing a big round of version updates, and mklibs one
looked fishy - and indeed it is.

Alex


> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/classes/image-mklibs.bbclass             |  56 ----------
> >   meta/conf/distro/include/maintainers.inc      |   1 -
> >   .../mklibs/files/ac_init_fix.patch            |  19 ----
> >   ...re-on-symbol-provided-by-application.patch | 103 ------------------
> >   .../mklibs/files/fix_STT_GNU_IFUNC.patch      |  26 -----
> >   .../mklibs/files/fix_cross_compile.patch      |  81 --------------
> >   ...U-unique-symbols-as-provided-symbols.patch |  34 ------
> >   .../mklibs/files/sysrooted-ldso.patch         |  18 ---
> >   .../mklibs/mklibs-native_0.1.44.bb            |  22 ----
> >   9 files changed, 360 deletions(-)
> >   delete mode 100644 meta/classes/image-mklibs.bbclass
> >   delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> >   delete mode 100644
> meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> >   delete mode 100644
> meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> >   delete mode 100644
> meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> >   delete mode 100644
> meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> >   delete mode 100644
> meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> >   delete mode 100644 meta/recipes-devtools/mklibs/
> mklibs-native_0.1.44.bb
> >
> > diff --git a/meta/classes/image-mklibs.bbclass
> b/meta/classes/image-mklibs.bbclass
> > deleted file mode 100644
> > index 68e11d4365..0000000000
> > --- a/meta/classes/image-mklibs.bbclass
> > +++ /dev/null
> > @@ -1,56 +0,0 @@
> > -do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
> > -
> > -IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
> > -
> > -inherit linuxloader
> > -
> > -mklibs_optimize_image_doit() {
> > -     rm -rf ${WORKDIR}/mklibs
> > -     mkdir -p ${WORKDIR}/mklibs/dest
> > -     cd ${IMAGE_ROOTFS}
> > -     du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
> > -
> > -     # Build a list of dynamically linked executable ELF files.
> > -     # Omit libc/libpthread as a special case because it has an
> interpreter
> > -     # but is primarily what we intend to strip down.
> > -     for i in `find . -type f -executable ! -name 'libc-*' ! -name
> 'libpthread-*'`; do
> > -             file $i | grep -q ELF || continue
> > -             ${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
> > -             echo $i
> > -     done > ${WORKDIR}/mklibs/executables.list
> > -
> > -     dynamic_loader=${@get_linuxloader(d)}
> > -
> > -     mklibs -v \
> > -             --ldlib ${dynamic_loader} \
> > -             --libdir ${baselib} \
> > -             --sysroot ${PKG_CONFIG_SYSROOT_DIR} \
> > -             --gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
> > -             --root ${IMAGE_ROOTFS} \
> > -             --target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
> > -             -d ${WORKDIR}/mklibs/dest \
> > -             `cat ${WORKDIR}/mklibs/executables.list`
> > -
> > -     cd ${WORKDIR}/mklibs/dest
> > -     for i in *
> > -     do
> > -             cp $i `find ${IMAGE_ROOTFS} -name $i`
> > -     done
> > -
> > -     cd ${IMAGE_ROOTFS}
> > -     du -bs > ${WORKDIR}/mklibs/du.after.mklibs.txt
> > -
> > -     echo rootfs size before mklibs optimization: `cat
> ${WORKDIR}/mklibs/du.before.mklibs.txt`
> > -     echo rootfs size after mklibs optimization: `cat
> ${WORKDIR}/mklibs/du.after.mklibs.txt`
> > -}
> > -
> > -mklibs_optimize_image() {
> > -     for img in ${MKLIBS_OPTIMIZED_IMAGES}
> > -     do
> > -             if [ "${img}" = "${PN}" ] || [ "${img}" = "all" ]
> > -             then
> > -                     mklibs_optimize_image_doit
> > -                     break
> > -             fi
> > -     done
> > -}
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 3df5a0434a..f42ecb34f8 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -500,7 +500,6 @@ RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <
> yi.zhao@windriver.com>"
> >   RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <
> akuster808@gmail.com>"
> >   RECIPE_MAINTAINER_pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
> >   RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com
> >"
> > -RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <
> liezhi.yang@windriver.com>"
> >   RECIPE_MAINTAINER_pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
> >   RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander
> Kanavin <alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <
> yi.zhao@windriver.com>"
> > diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> > deleted file mode 100644
> > index 422af10420..0000000000
> > --- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -Get the version of mklibs by simpler means. The MKLIBS_VERSION string
> in the
> > -configure.ac file is replaced with real version string by the
> > -do_configure_prepend() function from the recipe .bb file.
> > -
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -Nitin A Kamble <nitin.a.kamble@intel.com>
> > -Date: 2011/01/24
> > -
> > -Index: mklibs/configure.ac
> > -===================================================================
> > ---- mklibs.orig/configure.ac 2010-02-21 17:34:56.000000000 -0800
> > -+++ mklibs/configure.ac      2011-01-24 18:52:19.943242079 -0800
> > -@@ -1,4 +1,4 @@
> > --AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne 'print $1
> if m/^Version: (.*)$/;'))
> > -+AC_INIT([mklibs], MKLIBS_VERSION)
> > - AM_INIT_AUTOMAKE([foreign no-define])
> > - AC_CONFIG_HEADERS([config.h])
> > - AM_MAINTAINER_MODE
> > diff --git
> a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> > deleted file mode 100644
> > index 17d9af4de4..0000000000
> > ---
> a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> > +++ /dev/null
> > @@ -1,103 +0,0 @@
> > -From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
> > -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> > -Date: Fri, 17 Apr 2015 14:48:20 +0800
> > -Subject: [PATCH 4/6] avoid failure on symbol provided by application
> > -
> > -Upstream-Status: Pending
> > -
> > -Undefined symbols in a library can be provided by the application
> > -that links to the library, such as `logsink' in libmultipath.so.0.
> > -This fix checks the type of object in which the symbol is needed
> > -and the existence of the symbol in application, when a symbol
> > -cannot be provided by libraries. It prevents false alarm on absence
> > -of symbols.
> > -
> > -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> > -
> > ----
> > - src/mklibs | 28 ++++++++++++++++++++++++----
> > - 1 file changed, 24 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/src/mklibs b/src/mklibs
> > -index a3533c0..66b7a09 100755
> > ---- a/src/mklibs
> > -+++ b/src/mklibs
> > -@@ -133,9 +133,9 @@ class Symbol(object):
> > -         return '@'.join(ret)
> > -
> > - class UndefinedSymbol(Symbol):
> > --    def __init__(self, name, weak, version, library):
> > -+    def __init__(self, name, weak, version, library, object):
> > -         super(UndefinedSymbol, self).__init__(name, version, library)
> > --        self.weak, self.library = weak, library
> > -+        self.weak, self.library, self.object = weak, library, object
> > -
> > - def symbol_is_blacklisted(name):
> > -     # The ARM Embedded ABI spec states symbols under this namespace as
> > -@@ -152,6 +152,11 @@ def undefined_symbols(obj):
> > -
> > -     output = command("mklibs-readelf", "--print-symbols-undefined",
> obj)
> > -
> > -+    if len(obj) > len(dest_path) and obj[:len(dest_path)] == dest_path:
> > -+        object = obj[len(dest_path) + 1:-len('-so-stripped')]
> > -+    else:
> > -+        object = obj
> > -+
> > -     result = []
> > -     for line in output:
> > -         name, weak_string, version_string, library_string =
> line.split()[:4]
> > -@@ -171,7 +176,7 @@ def undefined_symbols(obj):
> > -         if library_string.lower() != 'none':
> > -             library = library_string
> > -
> > --        result.append(UndefinedSymbol(name, weak, version, library))
> > -+        result.append(UndefinedSymbol(name, weak, version, library,
> object))
> > -
> > -     return result
> > -
> > -@@ -498,12 +503,13 @@ while 1:
> > -                      and re.search("^ps_", str(symbol)))
> > -                 and not (re.search("ld-linux.so.3$", str(symbol)))
> > -                 and not (re.search("^__gnu_local_gp", str(symbol)))):
> > --                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s"
> % (symbol, symbol.weak))
> > -+                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s,
> for %s" % (symbol, symbol.weak, obj))
> > -                 needed_symbols[str(symbol)] = symbol
> > -         libraries.update(library_depends(obj))
> > -
> > -     # calculate what symbols are present in small_libs and
> available_libs
> > -     present_symbols = {}
> > -+    present_symbol_progs = {}
> > -     checked_libs = small_libs
> > -     checked_libs.extend(available_libs)
> > -     checked_libs.append(sysroot + ldlib)
> > -@@ -513,6 +519,12 @@ while 1:
> > -             names = symbol.base_names()
> > -             for name in names:
> > -                 present_symbols[name] = symbol
> > -+            if not so_pattern.match(lib):
> > -+                debug(DEBUG_SPAM, "present_symbol_progs adding %s,
> from executable %s" % (' '.join(names), lib))
> > -+                for name in names:
> > -+                    progs = present_symbol_progs.get(name, set())
> > -+                    progs.add(lib)
> > -+                    present_symbol_progs[name] = progs
> > -
> > -     # are we finished?
> > -     num_unresolved = 0
> > -@@ -568,6 +580,14 @@ while 1:
> > -     for name in needed_symbols:
> > -         if not name in symbol_provider:
> > -             if not needed_symbols[name].weak:
> > -+                # WORKAROUND: Undefined symbols in a library can be
> provided by the application
> > -+                # that links to the library. So if the object which
> requires the symbol is a library
> > -+                # and some application can provide the symbol, the
> undefined symbol is skipped.
> > -+                symbol = needed_symbols[name]
> > -+                if so_pattern.match(symbol.object) and
> present_symbol_progs.get(name, None):
> > -+                    debug(DEBUG_SPAM, "symbol %s in library %s is
> provided by executable %s" \
> > -+                          % (name, symbol.object, '
> '.join(present_symbol_progs[name])))
> > -+                    continue
> > -                 raise Exception("No library provides non-weak %s" %
> name)
> > -         else:
> > -             lib = symbol_provider[name]
> > ---
> > -2.16.1
> > -
> > diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> > deleted file mode 100644
> > index d27a48916d..0000000000
> > --- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
> > -define STT_GNU_IFUNC, so we have to define it ourselves.
> > -
> > -Upstream-Status: Inappropriate [other] - old release specific, maybe
> removable
> > -
> > --- Dexuan Cui (dexuan.cui@intel.com) Feb 16, 2011.
> > -
> > -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> > -index 2444c39..56d93f8 100644
> > ---- a/src/mklibs-readelf/main.cpp
> > -+++ b/src/mklibs-readelf/main.cpp
> > -@@ -6,6 +6,14 @@
> > - #include <vector>
> > -
> > - #include <elf.h>
> > -+/*
> > -+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04)
> doesn't
> > -+ * define the macro. We need to define it here.
> > -+ */
> > -+#ifndef STT_GNU_IFUNC
> > -+#define STT_GNU_IFUNC   10              /* Symbol is indirect code
> object */
> > -+#endif
> > -+
> > - #include <getopt.h>
> > -
> > - #include "elf.hpp"
> > diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> > deleted file mode 100644
> > index 13e4606b80..0000000000
> > --- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> > +++ /dev/null
> > @@ -1,81 +0,0 @@
> > -Remove dependency on dpkg
> > -
> > -Upstream-Status: Submitted
> > -
> > -Asking the host OS whether it supports multiarch is not useful
> > -in a cross-compilation environment, or if the user has specified
> > -a libdir explicitly. So this patch, based on the work of Mentor
> > -Graphics, removes mklibs's dependency on dpkg package.
> > -
> > -Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> > - src/mklibs | 30 +++++++++++++++++++-----------
> > - 1 file changed, 19 insertions(+), 11 deletions(-)
> > -
> > -diff --git a/src/mklibs b/src/mklibs
> > -index d9b784b..c5614ea 100755
> > ---- a/src/mklibs
> > -+++ b/src/mklibs
> > -@@ -261,6 +261,11 @@ def extract_soname(so_file):
> > -     return ""
> > -
> > - def multiarch(paths):
> > -+    # Asking the host OS whether it supports multiarch is not useful
> > -+    # in a cross-compilation environment, or if the user has specified
> > -+    # a libdir explicitly.
> > -+    if sysroot != "" or libdir != "":
> > -+        return paths
> > -     devnull = open('/dev/null', 'w')
> > -     dpkg_architecture = subprocess.Popen(
> > -         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
> > -@@ -340,7 +345,7 @@ lib_path = []
> > - dest_path = "DEST"
> > - ldlib = "LDLIB"
> > - include_default_lib_path = "yes"
> > --default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
> > -+default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
> > - libc_extras_dir = "/usr/lib/libc_pic"
> > - libc_extras_dir_default = True
> > - libdir = "lib"
> > -@@ -386,7 +391,7 @@ for opt, arg in optlist:
> > -     elif opt == "--libdir":
> > -         libdir = arg
> > -     elif opt in ("--help", "-h"):
> > --    usage(0)
> > -+        usage(0)
> > -         sys.exit(0)
> > -     elif opt in ("--version", "-V"):
> > -         version(vers)
> > -@@ -395,6 +400,7 @@ for opt, arg in optlist:
> > -         print "WARNING: unknown option: " + opt + "\targ: " + arg
> > -
> > - if include_default_lib_path == "yes":
> > -+    default_lib_path = multiarch(default_lib_path)
> > -     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in
> default_lib_path])
> > -
> > - if libc_extras_dir_default:
> > -@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
> > - ld_full_path = "../" + ldlib
> > - ld_file = find_lib(ld_file_name)
> > -
> > --if ld_path_name != "/lib":
> > --    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> > --        os.remove(dest_path + "/" + ld_file_name)
> > -+#if ld_path_name != "/lib":
> > -+#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> > -+#        os.remove(dest_path + "/" + ld_file_name)
> > -
> > --if not os.path.exists(dest_path + "/../" + ld_path_name):
> > --    os.mkdir(dest_path + "/../" + ld_path_name)
> > -+#if not os.path.exists(dest_path + "/../" + ld_path_name):
> > -+#    os.mkdir(dest_path + "/../" + ld_path_name)
> > -
> > --if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
> > --    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to "
> + ld_full_path)
> > -+if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
> > -+    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to "
> + ld_file_name)
> > -     command(target + "objcopy", "--strip-unneeded -R .note -R
> .comment",
> > --            ld_file, dest_path + "/" + ld_full_path)
> > -+            ld_file, dest_path + "/" + ld_file_name)
> > -
> > --os.chmod(dest_path + "/" + ld_full_path, 0755)
> > -+os.chmod(dest_path + "/" + ld_file_name, 0755)
> > diff --git
> a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> > deleted file mode 100644
> > index bc56593e6a..0000000000
> > ---
> a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
> > -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> > -Date: Wed, 15 Apr 2015 14:00:06 +0800
> > -Subject: [PATCH] Show GNU unique symbols as provided symbols
> > -
> > -Upstream-Status: Submitted
> > -
> > -GNU Unique symbol is a GNU extension employed by new version of GCC
> > -by default. Even Standard C++ library in GCC 4.9 provides some symbols,
> > -such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
> > -of ELF standard weak binding.
> > -This patch adds support of this new binding type to mklibs-readelf.
> > -
> > -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> > ----
> > - src/mklibs-readelf/main.cpp | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> > -index 56d93f8..0134530 100644
> > ---- a/src/mklibs-readelf/main.cpp
> > -+++ b/src/mklibs-readelf/main.cpp
> > -@@ -88,7 +88,7 @@ static void process_symbols_provided (const
> Elf::section_type<Elf::section_type_
> > -     uint8_t type = symbol->get_type ();
> > -     const std::string &name = symbol->get_name_string ();
> > -
> > --    if (bind != STB_GLOBAL && bind != STB_WEAK)
> > -+    if (bind != STB_GLOBAL && bind != STB_WEAK && bind !=
> STB_GNU_UNIQUE)
> > -       continue;
> > -     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
> > -       continue;
> > ---
> > -1.8.5.2.233.g932f7e4
> > -
> > diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> > deleted file mode 100644
> > index 75500a029a..0000000000
> > --- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -In cross builds we will have to respect sysroot
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Upstream-Status: Pending
> > -
> > -Index: mklibs-0.1.39/src/mklibs
> > -===================================================================
> > ---- mklibs-0.1.39.orig/src/mklibs    2014-03-01 18:25:36.000000000 +0000
> > -+++ mklibs-0.1.39/src/mklibs 2014-10-19 00:51:46.813534596 +0000
> > -@@ -495,7 +495,7 @@
> > -     present_symbols = {}
> > -     checked_libs = small_libs
> > -     checked_libs.extend(available_libs)
> > --    checked_libs.append(ldlib)
> > -+    checked_libs.append(sysroot + ldlib)
> > -     for lib in checked_libs:
> > -         for symbol in provided_symbols(lib):
> > -             debug(DEBUG_SPAM, "present_symbols adding %s" % symbol)
> > diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> > deleted file mode 100644
> > index 1784af1f4c..0000000000
> > --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -SUMMARY = "Shared library optimisation tool"
> > -DESCRIPTION = "mklibs produces cut-down shared libraries that contain
> only the routines required by a particular set of executables."
> > -HOMEPAGE = "https://launchpad.net/mklibs"
> > -SECTION = "devel"
> > -LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
> > -
> > -SRC_URI = "
> http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz
> \
> > -     file://ac_init_fix.patch\
> > -     file://fix_STT_GNU_IFUNC.patch\
> > -     file://sysrooted-ldso.patch \
> > -     file://avoid-failure-on-symbol-provided-by-application.patch \
> > -     file://show-GNU-unique-symbols-as-provided-symbols.patch \
> > -     file://fix_cross_compile.patch \
> > -"
> > -
> > -SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
> > -SRC_URI[sha256sum] =
> "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
> > -
> > -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
> > -
> > -inherit autotools gettext native
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000d969a305b30fbc87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 1 Nov 2020 at 19:09, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 11/1/20 7:23 AM, Alexander Kanavin wrote:<br>
&gt; This is not enabled or tested by default, and has never been<br>
&gt; ported to python 3 upstream[1], which means it doesn&#39;t work at al=
l<br>
&gt; with plain poky. If you need it, please put it in a separate layer<br=
>
&gt; and/or modernize to work with py3.<br>
&gt; <br>
&gt; <a href=3D"https://salsa.debian.org/installer-team/mklibs/-/blob/mast=
er/src/mklibs" rel=3D"noreferrer" target=3D"_blank">https://salsa.debian.or=
g/installer-team/mklibs/-/blob/master/src/mklibs</a><br>
&gt; <br>
<br>
There are users of it and they havent yet caught up with py3 only distros.=
<br>
I think it will be good to keep it going. Can you try this patch and see <=
br>
if it work with py3 tests that you do?<br>
<br>
<a href=3D"https://uclibc.org/~kraj/0001-mklib-Port-to-use-python3.patch" =
rel=3D"noreferrer" target=3D"_blank">https://uclibc.org/~kraj/0001-mklib-Po=
rt-to-use-python3.patch</a><br></blockquote><div><br></div><div>Sorry Khem,=
 but you need to step up and maintain it properly, if you want to keep it, =
particularly set up real AB testing. The reason I looked at it at all, is t=
hat I am doing a big round of version updates, and mklibs one looked fishy =
- and indeed it is.</div><div><br></div><div>Alex<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/image-mklibs.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 56 ----------<br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0.../mklibs/files/ac_init_fix.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ----<br>
&gt;=C2=A0 =C2=A0...re-on-symbol-provided-by-application.patch | 103 -----=
-------------<br>
&gt;=C2=A0 =C2=A0.../mklibs/files/fix_STT_GNU_IFUNC.patch=C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 26 -----<br>
&gt;=C2=A0 =C2=A0.../mklibs/files/fix_cross_compile.patch=C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 81 --------------<br>
&gt;=C2=A0 =C2=A0...U-unique-symbols-as-provided-symbols.patch |=C2=A0 34 =
------<br>
&gt;=C2=A0 =C2=A0.../mklibs/files/sysrooted-ldso.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 18 ---<br>
&gt;=C2=A0 =C2=A0.../mklibs/<a href=3D"http://mklibs-native_0.1.44.bb" rel=
=
=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 ----<br>
&gt;=C2=A0 =C2=A09 files changed, 360 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/classes/image-mklibs.bbclass<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/ac_=
init_fix.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/avo=
id-failure-on-symbol-provided-by-application.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/fix=
_STT_GNU_IFUNC.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/fix=
_cross_compile.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/sho=
w-GNU-unique-symbols-as-provided-symbols.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/sys=
rooted-ldso.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/mklibs/<a href=
=3D"http://mklibs-native_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">m=
klibs-native_0.1.44.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-m=
klibs.bbclass<br>
&gt; deleted file mode 100644<br>
&gt; index 68e11d4365..0000000000<br>
&gt; --- a/meta/classes/image-mklibs.bbclass<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,56 +0,0 @@<br>
&gt; -do_rootfs[depends] +=3D &quot;mklibs-native:do_populate_sysroot&quot=
;<br>
&gt; -<br>
&gt; -IMAGE_PREPROCESS_COMMAND +=3D &quot;mklibs_optimize_image; &quot;<br=
>
&gt; -<br>
&gt; -inherit linuxloader<br>
&gt; -<br>
&gt; -mklibs_optimize_image_doit() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf ${WORKDIR}/mklibs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/mklibs/dest<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd ${IMAGE_ROOTFS}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0du -bs &gt; ${WORKDIR}/mklibs/du.before.mklibs.t=
xt<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Build a list of dynamically linked executable =
ELF files.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Omit libc/libpthread as a special case because=
 it has an interpreter<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# but is primarily what we intend to strip down.=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `find . -type f -executable ! -name &#3=
9;libc-*&#39; ! -name &#39;libpthread-*&#39;`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file $i | grep -q EL=
F || continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${HOST_PREFIX}readel=
f -l $i | grep -q INTERP || continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done &gt; ${WORKDIR}/mklibs/executables.list<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dynamic_loader=3D${@get_linuxloader(d)}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mklibs -v \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--ldlib ${dynamic_lo=
ader} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir ${baselib} =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysroot ${PKG_CONF=
IG_SYSROOT_DIR} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--gcc-options &quot;=
--sysroot=3D${PKG_CONFIG_SYSROOT_DIR}&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root ${IMAGE_ROOTF=
S} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--target `echo ${TAR=
GET_PREFIX} | sed &#39;s/-$//&#39; ` \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-d ${WORKDIR}/mklibs=
/dest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`cat ${WORKDIR}/mkli=
bs/executables.list`<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/mklibs/dest<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $i `find ${IMAGE_=
ROOTFS} -name $i`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd ${IMAGE_ROOTFS}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0du -bs &gt; ${WORKDIR}/mklibs/du.after.mklibs.tx=
t<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo rootfs size before mklibs optimization: `ca=
t ${WORKDIR}/mklibs/du.before.mklibs.txt`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo rootfs size after mklibs optimization: `cat=
 ${WORKDIR}/mklibs/du.after.mklibs.txt`<br>
&gt; -}<br>
&gt; -<br>
&gt; -mklibs_optimize_image() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for img in ${MKLIBS_OPTIMIZED_IMAGES}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${img}&qu=
ot; =3D &quot;${PN}&quot; ] || [ &quot;${img}&quot; =3D &quot;all&quot; ]<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mklibs_optimize_image_doit<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -}<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dis=
tro/include/maintainers.inc<br>
&gt; index 3df5a0434a..f42ecb34f8 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -500,7 +500,6 @@ RECIPE_MAINTAINER_pn-mingetty =3D &quot;Yi Zhao &=
lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windr=
iver.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-mini-x-session =3D &quot;Armin Kuste=
r &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@=
gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-minicom =3D &quot;Anuj Mittal &lt;<a=
 href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-mkfontscale =3D &quot;Armin Kuster &=
lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gma=
il.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-mklibs-native =3D &quot;Robert Yang &lt;<a href=
=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windri=
ver.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-mmc-utils =3D &quot;Anuj Mittal &lt;=
<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@inte=
l.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-mobile-broadband-provider-info =3D &=
quot;Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER_pn-modutils-initscripts =3D &quot;Yi Zh=
ao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@w=
indriver.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/m=
eta/recipes-devtools/mklibs/files/ac_init_fix.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 422af10420..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,19 +0,0 @@<br>
&gt; -Get the version of mklibs by simpler means. The MKLIBS_VERSION strin=
g in the<br>
&gt; -<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> file is replaced with real version string by the<br>
&gt; -do_configure_prepend() function from the recipe .bb file.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [configuration]<br>
&gt; -<br>
&gt; -Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.com" targe=
t=3D"_blank">nitin.a.kamble@intel.com</a>&gt;<br>
&gt; -Date: 2011/01/24<br>
&gt; -<br>
&gt; -Index: mklibs/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- mklibs.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a> 2010-02-21 17:34:56.000000000 -0800<br>
&gt; -+++ mklibs/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 2011-01-24 18:52:19.94324=
2079 -0800<br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne &#39;pri=
nt $1 if m/^Version: (.*)$/;&#39;))<br>
&gt; -+AC_INIT([mklibs], MKLIBS_VERSION)<br>
&gt; - AM_INIT_AUTOMAKE([foreign no-define])<br>
&gt; - AC_CONFIG_HEADERS([config.h])<br>
&gt; - AM_MAINTAINER_MODE<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symb=
ol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid=
-failure-on-symbol-provided-by-application.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 17d9af4de4..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-prov=
ided-by-application.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,103 +0,0 @@<br>
&gt; -From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.co=
m" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
&gt; -Date: Fri, 17 Apr 2015 14:48:20 +0800<br>
&gt; -Subject: [PATCH 4/6] avoid failure on symbol provided by application=
<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Undefined symbols in a library can be provided by the application<br=
>
&gt; -that links to the library, such as `logsink&#39; in libmultipath.so.=
0.<br>
&gt; -This fix checks the type of object in which the symbol is needed<br>
&gt; -and the existence of the symbol in application, when a symbol<br>
&gt; -cannot be provided by libraries. It prevents false alarm on absence<=
br>
&gt; -of symbols.<br>
&gt; -<br>
&gt; -Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@win=
driver.com" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/mklibs | 28 ++++++++++++++++++++++++----<br>
&gt; - 1 file changed, 24 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/mklibs b/src/mklibs<br>
&gt; -index a3533c0..66b7a09 100755<br>
&gt; ---- a/src/mklibs<br>
&gt; -+++ b/src/mklibs<br>
&gt; -@@ -133,9 +133,9 @@ class Symbol(object):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;@&#39;.join(ret)<br>
&gt; -<br>
&gt; - class UndefinedSymbol(Symbol):<br>
&gt; --=C2=A0 =C2=A0 def __init__(self, name, weak, version, library):<br>
&gt; -+=C2=A0 =C2=A0 def __init__(self, name, weak, version, library, obje=
ct):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(UndefinedSymbol, self).__ini=
t__(name, version, library)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.weak, self.library =3D weak, libra=
ry<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.weak, self.library, self.object =
=3D weak, library, object<br>
&gt; -<br>
&gt; - def symbol_is_blacklisted(name):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# The ARM Embedded ABI spec states symbols under=
 this namespace as<br>
&gt; -@@ -152,6 +152,11 @@ def undefined_symbols(obj):<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0output =3D command(&quot;mklibs-readelf&quot;, &=
quot;--print-symbols-undefined&quot;, obj)<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 if len(obj) &gt; len(dest_path) and obj[:len(dest_pat=
h)] =3D=3D dest_path:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object =3D obj[len(dest_path) + 1:-len(=
&#39;-so-stripped&#39;)]<br>
&gt; -+=C2=A0 =C2=A0 else:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object =3D obj<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0result =3D []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for line in output:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, weak_string, version_string,=
 library_string =3D line.split()[:4]<br>
&gt; -@@ -171,7 +176,7 @@ def undefined_symbols(obj):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if library_string.lower() !=3D &#3=
9;none&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library =3D library_=
string<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 result.append(UndefinedSymbol(name, wea=
k, version, library))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result.append(UndefinedSymbol(name, wea=
k, version, library, object))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return result<br>
&gt; -<br>
&gt; -@@ -498,12 +503,13 @@ while 1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 and re.search(&quot;^ps_&quot;, str(symbol)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and no=
t (re.search(&quot;ld-linux.so.3$&quot;, str(symbol)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and no=
t (re.search(&quot;^__gnu_local_gp&quot;, str(symbol)))):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG=
_SPAM, &quot;needed_symbols adding %s, weak: %s&quot; % (symbol, symbol.wea=
k))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG=
_SPAM, &quot;needed_symbols adding %s, weak: %s, for %s&quot; % (symbol, sy=
mbol.weak, obj))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed=
_symbols[str(symbol)] =3D symbol<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries.update(library_depends(o=
bj))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# calculate what symbols are present in small_li=
bs and available_libs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0present_symbols =3D {}<br>
&gt; -+=C2=A0 =C2=A0 present_symbol_progs =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0checked_libs =3D small_libs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0checked_libs.extend(available_libs)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0checked_libs.append(sysroot + ldlib)<br>
&gt; -@@ -513,6 +519,12 @@ while 1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0names =3D symbol.bas=
e_names()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in names:<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0presen=
t_symbols[name] =3D symbol<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not so_pattern.match(l=
ib):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG=
_SPAM, &quot;present_symbol_progs adding %s, from executable %s&quot; % (&#=
39; &#39;.join(names), lib))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in=
 names:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 progs =3D present_symbol_progs.get(name, set())<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 progs.add(lib)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 present_symbol_progs[name] =3D progs<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# are we finished?<br>
&gt; -=C2=A0 =C2=A0 =C2=A0num_unresolved =3D 0<br>
&gt; -@@ -568,6 +580,14 @@ while 1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for name in needed_symbols:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not name in symbol_provider:<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not needed_symbol=
s[name].weak:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # WORKAROUN=
D: Undefined symbols in a library can be provided by the application<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # that link=
s to the library. So if the object which requires the symbol is a library<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and some =
application can provide the symbol, the undefined symbol is skipped.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symbol =3D =
needed_symbols[name]<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if so_patte=
rn.match(symbol.object) and present_symbol_progs.get(name, None):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 debug(DEBUG_SPAM, &quot;symbol %s in library %s is provided by executa=
ble %s&quot; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 % (name, symbol.object, &#39; &#39;.join(present_=
symbol_progs[name])))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise =
Exception(&quot;No library provides non-weak %s&quot; % name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lib =3D symbol_provi=
der[name]<br>
&gt; ---<br>
&gt; -2.16.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.pat=
ch b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch<br>
&gt; deleted file mode 100644<br>
&gt; index d27a48916d..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,26 +0,0 @@<br>
&gt; -The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn&#39;t<br=
>
&gt; -define STT_GNU_IFUNC, so we have to define it ourselves.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [other] - old release specific, maybe=
 removable<br>
&gt; -<br>
&gt; --- Dexuan Cui (<a href=3D"mailto:dexuan.cui@intel.com" target=3D"_bl=
ank">dexuan.cui@intel.com</a>) Feb 16, 2011.<br>
&gt; -<br>
&gt; -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.c=
pp<br>
&gt; -index 2444c39..56d93f8 100644<br>
&gt; ---- a/src/mklibs-readelf/main.cpp<br>
&gt; -+++ b/src/mklibs-readelf/main.cpp<br>
&gt; -@@ -6,6 +6,14 @@<br>
&gt; - #include &lt;vector&gt;<br>
&gt; -<br>
&gt; - #include &lt;elf.h&gt;<br>
&gt; -+/*<br>
&gt; -+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) d=
oesn&#39;t<br>
&gt; -+ * define the macro. We need to define it here.<br>
&gt; -+ */<br>
&gt; -+#ifndef STT_GNU_IFUNC<br>
&gt; -+#define STT_GNU_IFUNC=C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 /* Symbol is indirect code object */<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - #include &lt;getopt.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;elf.hpp&quot;<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.pat=
ch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 13e4606b80..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,81 +0,0 @@<br>
&gt; -Remove dependency on dpkg<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted<br>
&gt; -<br>
&gt; -Asking the host OS whether it supports multiarch is not useful<br>
&gt; -in a cross-compilation environment, or if the user has specified<br>
&gt; -a libdir explicitly. So this patch, based on the work of Mentor<br>
&gt; -Graphics, removes mklibs&#39;s dependency on dpkg package.<br>
&gt; -<br>
&gt; -Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:Yuanjie.Huang@win=
driver.com" target=3D"_blank">Yuanjie.Huang@windriver.com</a>&gt;<br>
&gt; - src/mklibs | 30 +++++++++++++++++++-----------<br>
&gt; - 1 file changed, 19 insertions(+), 11 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/mklibs b/src/mklibs<br>
&gt; -index d9b784b..c5614ea 100755<br>
&gt; ---- a/src/mklibs<br>
&gt; -+++ b/src/mklibs<br>
&gt; -@@ -261,6 +261,11 @@ def extract_soname(so_file):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
&gt; -<br>
&gt; - def multiarch(paths):<br>
&gt; -+=C2=A0 =C2=A0 # Asking the host OS whether it supports multiarch is=
 not useful<br>
&gt; -+=C2=A0 =C2=A0 # in a cross-compilation environment, or if the user =
has specified<br>
&gt; -+=C2=A0 =C2=A0 # a libdir explicitly.<br>
&gt; -+=C2=A0 =C2=A0 if sysroot !=3D &quot;&quot; or libdir !=3D &quot;&qu=
ot;:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return paths<br>
&gt; -=C2=A0 =C2=A0 =C2=A0devnull =3D open(&#39;/dev/null&#39;, &#39;w&#39=
;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dpkg_architecture =3D subprocess.Popen(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;dpkg-architecture&#39;, &#39=
;-qDEB_HOST_MULTIARCH&#39;],<br>
&gt; -@@ -340,7 +345,7 @@ lib_path =3D []<br>
&gt; - dest_path =3D &quot;DEST&quot;<br>
&gt; - ldlib =3D &quot;LDLIB&quot;<br>
&gt; - include_default_lib_path =3D &quot;yes&quot;<br>
&gt; --default_lib_path =3D multiarch([&quot;/lib/&quot;, &quot;/usr/lib/&=
quot;, &quot;/usr/X11R6/lib/&quot;])<br>
&gt; -+default_lib_path =3D [&quot;/lib/&quot;, &quot;/usr/lib/&quot;, &qu=
ot;/usr/X11R6/lib/&quot;]<br>
&gt; - libc_extras_dir =3D &quot;/usr/lib/libc_pic&quot;<br>
&gt; - libc_extras_dir_default =3D True<br>
&gt; - libdir =3D &quot;lib&quot;<br>
&gt; -@@ -386,7 +391,7 @@ for opt, arg in optlist:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0elif opt =3D=3D &quot;--libdir&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdir =3D arg<br>
&gt; -=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--help&quot;, &quot;-h&quot;)=
:<br>
&gt; --=C2=A0 =C2=A0 usage(0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--version&quot;, &quot;-V&quo=
t;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version(vers)<br>
&gt; -@@ -395,6 +400,7 @@ for opt, arg in optlist:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;WARNING: unknown optio=
n: &quot; + opt + &quot;\targ: &quot; + arg<br>
&gt; -<br>
&gt; - if include_default_lib_path =3D=3D &quot;yes&quot;:<br>
&gt; -+=C2=A0 =C2=A0 default_lib_path =3D multiarch(default_lib_path)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0lib_path.extend([a.replace(&quot;/lib/&quot;, &q=
uot;/&quot; + libdir + &quot;/&quot;) for a in default_lib_path])<br>
&gt; -<br>
&gt; - if libc_extras_dir_default:<br>
&gt; -@@ -661,16 +669,16 @@ ld_path_name =3D os.path.dirname(ldlib)<br>
&gt; - ld_full_path =3D &quot;../&quot; + ldlib<br>
&gt; - ld_file =3D find_lib(ld_file_name)<br>
&gt; -<br>
&gt; --if ld_path_name !=3D &quot;/lib&quot;:<br>
&gt; --=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_name=
, os.F_OK):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + l=
d_file_name)<br>
&gt; -+#if ld_path_name !=3D &quot;/lib&quot;:<br>
&gt; -+#=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_nam=
e, os.F_OK):<br>
&gt; -+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + =
ld_file_name)<br>
&gt; -<br>
&gt; --if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):=
<br>
&gt; --=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)=
<br>
&gt; -+#if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name)=
:<br>
&gt; -+#=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name=
)<br>
&gt; -<br>
&gt; --if not os.access(dest_path + &quot;/&quot; + ld_full_path, os.F_OK)=
:<br>
&gt; --=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dy=
namic linker to &quot; + ld_full_path)<br>
&gt; -+if not os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK)=
:<br>
&gt; -+=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dy=
namic linker to &quot; + ld_file_name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0command(target + &quot;objcopy&quot;, &quot;--st=
rip-unneeded -R .note -R .comment&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quo=
t;/&quot; + ld_full_path)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quo=
t;/&quot; + ld_file_name)<br>
&gt; -<br>
&gt; --os.chmod(dest_path + &quot;/&quot; + ld_full_path, 0755)<br>
&gt; -+os.chmod(dest_path + &quot;/&quot; + ld_file_name, 0755)<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbo=
ls-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-=
unique-symbols-as-provided-symbols.patch<br>
&gt; deleted file mode 100644<br>
&gt; index bc56593e6a..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-p=
rovided-symbols.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,34 +0,0 @@<br>
&gt; -From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.co=
m" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 15 Apr 2015 14:00:06 +0800<br>
&gt; -Subject: [PATCH] Show GNU unique symbols as provided symbols<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted<br>
&gt; -<br>
&gt; -GNU Unique symbol is a GNU extension employed by new version of GCC<=
br>
&gt; -by default. Even Standard C++ library in GCC 4.9 provides some symbo=
ls,<br>
&gt; -such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type inste=
ad<br>
&gt; -of ELF standard weak binding.<br>
&gt; -This patch adds support of this new binding type to mklibs-readelf.<=
br>
&gt; -<br>
&gt; -Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@win=
driver.com" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/mklibs-readelf/main.cpp | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.c=
pp<br>
&gt; -index 56d93f8..0134530 100644<br>
&gt; ---- a/src/mklibs-readelf/main.cpp<br>
&gt; -+++ b/src/mklibs-readelf/main.cpp<br>
&gt; -@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::s=
ection_type&lt;Elf::section_type_<br>
&gt; -=C2=A0 =C2=A0 =C2=A0uint8_t type =3D symbol-&gt;get_type ();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0const std::string &amp;name =3D symbol-&gt;get_n=
ame_string ();<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEA=
K)<br>
&gt; -+=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEA=
K &amp;&amp; bind !=3D STB_GNU_UNIQUE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (shndx =3D=3D SHN_UNDEF || shndx =3D=3D SHN_A=
BS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; ---<br>
&gt; -1.8.5.2.233.g932f7e4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch =
b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 75500a029a..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,18 +0,0 @@<br>
&gt; -In cross builds we will have to respect sysroot<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Index: mklibs-0.1.39/src/mklibs<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- mklibs-0.1.39.orig/src/mklibs=C2=A0 =C2=A0 2014-03-01 18:25:36.0=
00000000 +0000<br>
&gt; -+++ mklibs-0.1.39/src/mklibs 2014-10-19 00:51:46.813534596 +0000<br>
&gt; -@@ -495,7 +495,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0present_symbols =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0checked_libs =3D small_libs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0checked_libs.extend(available_libs)<br>
&gt; --=C2=A0 =C2=A0 checked_libs.append(ldlib)<br>
&gt; -+=C2=A0 =C2=A0 checked_libs.append(sysroot + ldlib)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for lib in checked_libs:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for symbol in provided_symbols(lib=
):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(DEBUG_SPAM, &q=
uot;present_symbols adding %s&quot; % symbol)<br>
&gt; diff --git a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-na=
tive_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.b=
b</a> b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.44=
.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 1784af1f4c..0000000000<br>
&gt; --- a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.=
1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a><b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,22 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Shared library optimisation tool&quot;<br>
&gt; -DESCRIPTION =3D &quot;mklibs produces cut-down shared libraries that=
 contain only the routines required by a particular set of executables.&quo=
t;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://launchpad.net/mklibs" rel=3D"n=
oreferrer" target=3D"_blank">https://launchpad.net/mklibs</a>&quot;<br>
&gt; -SECTION =3D &quot;devel&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D98d31037b13=
d896e33890738ef01af64&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debi=
an/20180828T214102Z/pool/main/m/mklibs/mklibs_$%7BPV%7D.tar.xz" rel=3D"nore=
ferrer" target=3D"_blank">http://snapshot.debian.org/archive/debian/2018082=
8T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://ac_init_fix.patch\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://fix_STT_GNU_IFUNC.patch\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://sysrooted-ldso.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://avoid-failure-on-symbol-provided-by-appli=
cation.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://show-GNU-unique-symbols-as-provided-symbo=
ls.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://fix_cross_compile.patch \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;6b6eeb9b4016c6a7317acc28c89e32cc&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20=
dd2b238ccb9b49d84722066c2&quot;<br>
&gt; -<br>
&gt; -UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/m/mklibs/&quot;<b=
r>
&gt; -<br>
&gt; -inherit autotools gettext native<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000d969a305b30fbc87--
