Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.6320.1621330924403598809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nKKpQOUz;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id j13so4612763vsf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fOdGE/c1eJLWJr9SajM9sgL4WbjyKWbwmnN28eAEc60=;
        b=nKKpQOUzylyuxM8em9Wbe2aouWgGYzCjaspfUAmnA2dbneGt+4ITeer6UkS5tB9jfx
         GESOy+yTW8LQ9UB1aBzgTmhrek43795SU6KmL1F7jJWM2kC3lOh2QVbb48ivXi2SlgVo
         /RqDjArR4lYufd77LmmjZ+au6MiD1Lp1gQcbdsK+VGcfUGQPAF+XWyfZC3yKPZWYy/LG
         YsefQQpYOyrBmrxXHtjRZ3Djgx655SLUwmjsFPrCJuCUswhwLDMv9zivzuLGnCsAVxu5
         KjK7PiOlloxtUJyaM5CDhhWQFYD956VeSAZmUZT6WEXZlZPh08gfNfD/tB9ORMDsHKHP
         2f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOdGE/c1eJLWJr9SajM9sgL4WbjyKWbwmnN28eAEc60=;
        b=mJJUhsnFP6IMxXBaFk/u2yzFBQnSVXnMxCabr+TdDe2vP5uJqSuuB26aikvVOoridu
         c/JVRTodg68ijbdgWgZQA7elsiI0Gwoq4DBP2chyyNGHwN0GhrnJSf/9UhMgizvchYXe
         vEJ1U2M3XFp4Zx3ETwNHRXZqaCDmQfc4FLqDMfdHdmFP4+lIqyH/SyRBEnUkQYYe872N
         j9+HW7VE4KS0WaF7fIKmy2taez/WG4p9dy6iaK+gQd/fgyaCp3jrFcHOLGPHaP3rs+gn
         Q9DI3f1TrTlyjKd5PKfHvVCMGeCoRc5NMR6GmDvzQLk2YXa+/bYzAgWAjP7Rtj6ZSVdz
         R09A==
X-Gm-Message-State: AOAM5310c5W8ayUF3us78321IvMsk8phzw6k2XYtht+S5mynhx7sOKDL
	fWaQv4vG1Ko75MUgq3sUDdN1kdvKCN/SjSM/8raZt3Qj
X-Google-Smtp-Source: ABdhPJxFMBIYK8sHqJNhtUYKxedYNLJNA+ReQPETxSp9QQ3RJE/8CUUKHob4TWJDtHngvb2yExUBvOMh/LvrkrWqjl0=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr5237186vsm.41.1621330923400;
 Tue, 18 May 2021 02:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518062446.8201-1-jacob.kroon@gmail.com>
In-Reply-To: <20210518062446.8201-1-jacob.kroon@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 18 May 2021 11:41:52 +0200
Message-ID: <CANNYZj8oUYaxPhBW8CsjddYPxEzqvwnCoORgebLjpkStD9pdKw@mail.gmail.com>
Subject: Re: [PATCH v2] mklibs: remove recipes and class
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c0b1d705c2978593"

--000000000000c0b1d705c2978593
Content-Type: text/plain; charset="UTF-8"

The location of local.conf.sample* is somewhat confusing. In poky they are
in meta-poky/, but in oe-core they are in meta/.
What's the correct way to update them?

Alex

On Tue, 18 May 2021 at 08:25, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This is not enabled or tested by default, and has never been
> ported to python 3 upstream[1], which means it doesn't work at all
> with plain poky. If you need it, please put it in a separate layer
> and/or modernize to work with py3.
>
> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>
> Changes in v2:
>   * Removed references to mklibs in
>       meta/conf/local.conf.sample
>       meta/conf/local.conf.sample.extended
>
>  meta/classes/image-mklibs.bbclass             |  56 ----------
>  meta/conf/distro/include/maintainers.inc      |   1 -
>  meta/conf/local.conf.sample                   |   5 +-
>  meta/conf/local.conf.sample.extended          |   9 --
>  .../mklibs/files/ac_init_fix.patch            |  19 ----
>  ...re-on-symbol-provided-by-application.patch | 103 ------------------
>  .../mklibs/files/fix_STT_GNU_IFUNC.patch      |  26 -----
>  .../mklibs/files/fix_cross_compile.patch      |  81 --------------
>  ...U-unique-symbols-as-provided-symbols.patch |  34 ------
>  .../mklibs/files/sysrooted-ldso.patch         |  18 ---
>  .../mklibs/mklibs-native_0.1.44.bb            |  22 ----
>  11 files changed, 1 insertion(+), 373 deletions(-)
>  delete mode 100644 meta/classes/image-mklibs.bbclass
>  delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.patch
>  delete mode 100644
> meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
>  delete mode 100644
> meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
>  delete mode 100644
> meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
>  delete mode 100644
> meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
>  delete mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
>  delete mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
>
> diff --git a/meta/classes/image-mklibs.bbclass
> b/meta/classes/image-mklibs.bbclass
> deleted file mode 100644
> index 68e11d4365..0000000000
> --- a/meta/classes/image-mklibs.bbclass
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
> -
> -IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
> -
> -inherit linuxloader
> -
> -mklibs_optimize_image_doit() {
> -       rm -rf ${WORKDIR}/mklibs
> -       mkdir -p ${WORKDIR}/mklibs/dest
> -       cd ${IMAGE_ROOTFS}
> -       du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
> -
> -       # Build a list of dynamically linked executable ELF files.
> -       # Omit libc/libpthread as a special case because it has an
> interpreter
> -       # but is primarily what we intend to strip down.
> -       for i in `find . -type f -executable ! -name 'libc-*' ! -name
> 'libpthread-*'`; do
> -               file $i | grep -q ELF || continue
> -               ${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
> -               echo $i
> -       done > ${WORKDIR}/mklibs/executables.list
> -
> -       dynamic_loader=${@get_linuxloader(d)}
> -
> -       mklibs -v \
> -               --ldlib ${dynamic_loader} \
> -               --libdir ${baselib} \
> -               --sysroot ${PKG_CONFIG_SYSROOT_DIR} \
> -               --gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
> -               --root ${IMAGE_ROOTFS} \
> -               --target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
> -               -d ${WORKDIR}/mklibs/dest \
> -               `cat ${WORKDIR}/mklibs/executables.list`
> -
> -       cd ${WORKDIR}/mklibs/dest
> -       for i in *
> -       do
> -               cp $i `find ${IMAGE_ROOTFS} -name $i`
> -       done
> -
> -       cd ${IMAGE_ROOTFS}
> -       du -bs > ${WORKDIR}/mklibs/du.after.mklibs.txt
> -
> -       echo rootfs size before mklibs optimization: `cat
> ${WORKDIR}/mklibs/du.before.mklibs.txt`
> -       echo rootfs size after mklibs optimization: `cat
> ${WORKDIR}/mklibs/du.after.mklibs.txt`
> -}
> -
> -mklibs_optimize_image() {
> -       for img in ${MKLIBS_OPTIMIZED_IMAGES}
> -       do
> -               if [ "${img}" = "${PN}" ] || [ "${img}" = "all" ]
> -               then
> -                       mklibs_optimize_image_doit
> -                       break
> -               fi
> -       done
> -}
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index bfebd68acf..1467a10f8a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -508,7 +508,6 @@ RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <
> yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster808@gmail.com
> >"
>  RECIPE_MAINTAINER_pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <
> yi.zhao@windriver.com>"
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 652bd47733..9caac6e152 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -126,11 +126,8 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
>  # enable extra features. Some available options which can be included in
> this variable
>  # are:
>  #   - 'buildstats' collect build statistics
> -#   - 'image-mklibs' to reduce shared library files size for an image
>  #   - 'image-prelink' in order to prelink the filesystem image
> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is before
> prelink
> -# NOTE: mklibs also needs to be explicitly enabled for a given image, see
> local.conf.extended
> -USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> +USER_CLASSES ?= "buildstats image-prelink"
>
>
>  #
> diff --git a/meta/conf/local.conf.sample.extended
> b/meta/conf/local.conf.sample.extended
> index 785a1e59df..6585ae710a 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -120,15 +120,6 @@
>  #
>  # TCMODE ?= "external-sourcery"
>
> -# mklibs library size optimization is more useful to smaller images,
> -# and less useful for bigger images. Also mklibs library optimization
> -# can break the ABI compatibility, so should not be applied to the
> -# images which are to be extended or upgraded later.
> -#This enabled mklibs library size optimization just for the specified
> image.
> -#MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
> -#This enable mklibs library size optimization will be for all the images.
> -#MKLIBS_OPTIMIZED_IMAGES ?= "all"
> -
>  # This value is currently used by pseudo to determine if the recipe should
>  # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build
> system.
>  #
> diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> deleted file mode 100644
> index 422af10420..0000000000
> --- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Get the version of mklibs by simpler means. The MKLIBS_VERSION string in
> the
> -configure.ac file is replaced with real version string by the
> -do_configure_prepend() function from the recipe .bb file.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2011/01/24
> -
> -Index: mklibs/configure.ac
> -===================================================================
> ---- mklibs.orig/configure.ac   2010-02-21 17:34:56.000000000 -0800
> -+++ mklibs/configure.ac        2011-01-24 18:52:19.943242079 -0800
> -@@ -1,4 +1,4 @@
> --AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne 'print $1 if
> m/^Version: (.*)$/;'))
> -+AC_INIT([mklibs], MKLIBS_VERSION)
> - AM_INIT_AUTOMAKE([foreign no-define])
> - AC_CONFIG_HEADERS([config.h])
> - AM_MAINTAINER_MODE
> diff --git
> a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> deleted file mode 100644
> index 17d9af4de4..0000000000
> ---
> a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
> -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> -Date: Fri, 17 Apr 2015 14:48:20 +0800
> -Subject: [PATCH 4/6] avoid failure on symbol provided by application
> -
> -Upstream-Status: Pending
> -
> -Undefined symbols in a library can be provided by the application
> -that links to the library, such as `logsink' in libmultipath.so.0.
> -This fix checks the type of object in which the symbol is needed
> -and the existence of the symbol in application, when a symbol
> -cannot be provided by libraries. It prevents false alarm on absence
> -of symbols.
> -
> -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> -
> ----
> - src/mklibs | 28 ++++++++++++++++++++++++----
> - 1 file changed, 24 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/mklibs b/src/mklibs
> -index a3533c0..66b7a09 100755
> ---- a/src/mklibs
> -+++ b/src/mklibs
> -@@ -133,9 +133,9 @@ class Symbol(object):
> -         return '@'.join(ret)
> -
> - class UndefinedSymbol(Symbol):
> --    def __init__(self, name, weak, version, library):
> -+    def __init__(self, name, weak, version, library, object):
> -         super(UndefinedSymbol, self).__init__(name, version, library)
> --        self.weak, self.library = weak, library
> -+        self.weak, self.library, self.object = weak, library, object
> -
> - def symbol_is_blacklisted(name):
> -     # The ARM Embedded ABI spec states symbols under this namespace as
> -@@ -152,6 +152,11 @@ def undefined_symbols(obj):
> -
> -     output = command("mklibs-readelf", "--print-symbols-undefined", obj)
> -
> -+    if len(obj) > len(dest_path) and obj[:len(dest_path)] == dest_path:
> -+        object = obj[len(dest_path) + 1:-len('-so-stripped')]
> -+    else:
> -+        object = obj
> -+
> -     result = []
> -     for line in output:
> -         name, weak_string, version_string, library_string =
> line.split()[:4]
> -@@ -171,7 +176,7 @@ def undefined_symbols(obj):
> -         if library_string.lower() != 'none':
> -             library = library_string
> -
> --        result.append(UndefinedSymbol(name, weak, version, library))
> -+        result.append(UndefinedSymbol(name, weak, version, library,
> object))
> -
> -     return result
> -
> -@@ -498,12 +503,13 @@ while 1:
> -                      and re.search("^ps_", str(symbol)))
> -                 and not (re.search("ld-linux.so.3$", str(symbol)))
> -                 and not (re.search("^__gnu_local_gp", str(symbol)))):
> --                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s" %
> (symbol, symbol.weak))
> -+                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s,
> for %s" % (symbol, symbol.weak, obj))
> -                 needed_symbols[str(symbol)] = symbol
> -         libraries.update(library_depends(obj))
> -
> -     # calculate what symbols are present in small_libs and available_libs
> -     present_symbols = {}
> -+    present_symbol_progs = {}
> -     checked_libs = small_libs
> -     checked_libs.extend(available_libs)
> -     checked_libs.append(sysroot + ldlib)
> -@@ -513,6 +519,12 @@ while 1:
> -             names = symbol.base_names()
> -             for name in names:
> -                 present_symbols[name] = symbol
> -+            if not so_pattern.match(lib):
> -+                debug(DEBUG_SPAM, "present_symbol_progs adding %s, from
> executable %s" % (' '.join(names), lib))
> -+                for name in names:
> -+                    progs = present_symbol_progs.get(name, set())
> -+                    progs.add(lib)
> -+                    present_symbol_progs[name] = progs
> -
> -     # are we finished?
> -     num_unresolved = 0
> -@@ -568,6 +580,14 @@ while 1:
> -     for name in needed_symbols:
> -         if not name in symbol_provider:
> -             if not needed_symbols[name].weak:
> -+                # WORKAROUND: Undefined symbols in a library can be
> provided by the application
> -+                # that links to the library. So if the object which
> requires the symbol is a library
> -+                # and some application can provide the symbol, the
> undefined symbol is skipped.
> -+                symbol = needed_symbols[name]
> -+                if so_pattern.match(symbol.object) and
> present_symbol_progs.get(name, None):
> -+                    debug(DEBUG_SPAM, "symbol %s in library %s is
> provided by executable %s" \
> -+                          % (name, symbol.object, '
> '.join(present_symbol_progs[name])))
> -+                    continue
> -                 raise Exception("No library provides non-weak %s" % name)
> -         else:
> -             lib = symbol_provider[name]
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> deleted file mode 100644
> index d27a48916d..0000000000
> --- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
> -define STT_GNU_IFUNC, so we have to define it ourselves.
> -
> -Upstream-Status: Inappropriate [other] - old release specific, maybe
> removable
> -
> --- Dexuan Cui (dexuan.cui@intel.com) Feb 16, 2011.
> -
> -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> -index 2444c39..56d93f8 100644
> ---- a/src/mklibs-readelf/main.cpp
> -+++ b/src/mklibs-readelf/main.cpp
> -@@ -6,6 +6,14 @@
> - #include <vector>
> -
> - #include <elf.h>
> -+/*
> -+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) doesn't
> -+ * define the macro. We need to define it here.
> -+ */
> -+#ifndef STT_GNU_IFUNC
> -+#define STT_GNU_IFUNC   10              /* Symbol is indirect code
> object */
> -+#endif
> -+
> - #include <getopt.h>
> -
> - #include "elf.hpp"
> diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> deleted file mode 100644
> index 13e4606b80..0000000000
> --- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -Remove dependency on dpkg
> -
> -Upstream-Status: Submitted
> -
> -Asking the host OS whether it supports multiarch is not useful
> -in a cross-compilation environment, or if the user has specified
> -a libdir explicitly. So this patch, based on the work of Mentor
> -Graphics, removes mklibs's dependency on dpkg package.
> -
> -Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> - src/mklibs | 30 +++++++++++++++++++-----------
> - 1 file changed, 19 insertions(+), 11 deletions(-)
> -
> -diff --git a/src/mklibs b/src/mklibs
> -index d9b784b..c5614ea 100755
> ---- a/src/mklibs
> -+++ b/src/mklibs
> -@@ -261,6 +261,11 @@ def extract_soname(so_file):
> -     return ""
> -
> - def multiarch(paths):
> -+    # Asking the host OS whether it supports multiarch is not useful
> -+    # in a cross-compilation environment, or if the user has specified
> -+    # a libdir explicitly.
> -+    if sysroot != "" or libdir != "":
> -+        return paths
> -     devnull = open('/dev/null', 'w')
> -     dpkg_architecture = subprocess.Popen(
> -         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
> -@@ -340,7 +345,7 @@ lib_path = []
> - dest_path = "DEST"
> - ldlib = "LDLIB"
> - include_default_lib_path = "yes"
> --default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
> -+default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
> - libc_extras_dir = "/usr/lib/libc_pic"
> - libc_extras_dir_default = True
> - libdir = "lib"
> -@@ -386,7 +391,7 @@ for opt, arg in optlist:
> -     elif opt == "--libdir":
> -         libdir = arg
> -     elif opt in ("--help", "-h"):
> --      usage(0)
> -+        usage(0)
> -         sys.exit(0)
> -     elif opt in ("--version", "-V"):
> -         version(vers)
> -@@ -395,6 +400,7 @@ for opt, arg in optlist:
> -         print "WARNING: unknown option: " + opt + "\targ: " + arg
> -
> - if include_default_lib_path == "yes":
> -+    default_lib_path = multiarch(default_lib_path)
> -     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in
> default_lib_path])
> -
> - if libc_extras_dir_default:
> -@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
> - ld_full_path = "../" + ldlib
> - ld_file = find_lib(ld_file_name)
> -
> --if ld_path_name != "/lib":
> --    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> --        os.remove(dest_path + "/" + ld_file_name)
> -+#if ld_path_name != "/lib":
> -+#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> -+#        os.remove(dest_path + "/" + ld_file_name)
> -
> --if not os.path.exists(dest_path + "/../" + ld_path_name):
> --    os.mkdir(dest_path + "/../" + ld_path_name)
> -+#if not os.path.exists(dest_path + "/../" + ld_path_name):
> -+#    os.mkdir(dest_path + "/../" + ld_path_name)
> -
> --if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
> --    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
> ld_full_path)
> -+if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
> -+    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
> ld_file_name)
> -     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
> --            ld_file, dest_path + "/" + ld_full_path)
> -+            ld_file, dest_path + "/" + ld_file_name)
> -
> --os.chmod(dest_path + "/" + ld_full_path, 0755)
> -+os.chmod(dest_path + "/" + ld_file_name, 0755)
> diff --git
> a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> deleted file mode 100644
> index bc56593e6a..0000000000
> ---
> a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
> -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> -Date: Wed, 15 Apr 2015 14:00:06 +0800
> -Subject: [PATCH] Show GNU unique symbols as provided symbols
> -
> -Upstream-Status: Submitted
> -
> -GNU Unique symbol is a GNU extension employed by new version of GCC
> -by default. Even Standard C++ library in GCC 4.9 provides some symbols,
> -such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
> -of ELF standard weak binding.
> -This patch adds support of this new binding type to mklibs-readelf.
> -
> -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ----
> - src/mklibs-readelf/main.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> -index 56d93f8..0134530 100644
> ---- a/src/mklibs-readelf/main.cpp
> -+++ b/src/mklibs-readelf/main.cpp
> -@@ -88,7 +88,7 @@ static void process_symbols_provided (const
> Elf::section_type<Elf::section_type_
> -     uint8_t type = symbol->get_type ();
> -     const std::string &name = symbol->get_name_string ();
> -
> --    if (bind != STB_GLOBAL && bind != STB_WEAK)
> -+    if (bind != STB_GLOBAL && bind != STB_WEAK && bind != STB_GNU_UNIQUE)
> -       continue;
> -     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
> -       continue;
> ---
> -1.8.5.2.233.g932f7e4
> -
> diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> deleted file mode 100644
> index 75500a029a..0000000000
> --- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -In cross builds we will have to respect sysroot
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Index: mklibs-0.1.39/src/mklibs
> -===================================================================
> ---- mklibs-0.1.39.orig/src/mklibs      2014-03-01 18:25:36.000000000 +0000
> -+++ mklibs-0.1.39/src/mklibs   2014-10-19 00:51:46.813534596 +0000
> -@@ -495,7 +495,7 @@
> -     present_symbols = {}
> -     checked_libs = small_libs
> -     checked_libs.extend(available_libs)
> --    checked_libs.append(ldlib)
> -+    checked_libs.append(sysroot + ldlib)
> -     for lib in checked_libs:
> -         for symbol in provided_symbols(lib):
> -             debug(DEBUG_SPAM, "present_symbols adding %s" % symbol)
> diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> deleted file mode 100644
> index 1784af1f4c..0000000000
> --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY = "Shared library optimisation tool"
> -DESCRIPTION = "mklibs produces cut-down shared libraries that contain
> only the routines required by a particular set of executables."
> -HOMEPAGE = "https://launchpad.net/mklibs"
> -SECTION = "devel"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
> -
> -SRC_URI = "
> http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz
> \
> -       file://ac_init_fix.patch\
> -       file://fix_STT_GNU_IFUNC.patch\
> -       file://sysrooted-ldso.patch \
> -       file://avoid-failure-on-symbol-provided-by-application.patch \
> -       file://show-GNU-unique-symbols-as-provided-symbols.patch \
> -       file://fix_cross_compile.patch \
> -"
> -
> -SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
> -SRC_URI[sha256sum] =
> "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
> -
> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
> -
> -inherit autotools gettext native
>

--000000000000c0b1d705c2978593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The location of local.conf.sample* is somewhat confus=
ing. In poky they are in meta-poky/, but in oe-core they are in meta/. <br>=
</div><div>What&#39;s the correct way to update them?</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, 18 May 2021 at 08:25, Jacob Kroon &lt;<a href=3D"=
mailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;<br>
<br>
This is not enabled or tested by default, and has never been<br>
ported to python 3 upstream[1], which means it doesn&#39;t work at all<br>
with plain poky. If you need it, please put it in a separate layer<br>
and/or modernize to work with py3.<br>
<br>
<a href=3D"https://salsa.debian.org/installer-team/mklibs/-/blob/master/src=
/mklibs" rel=3D"noreferrer" target=3D"_blank">https://salsa.debian.org/inst=
aller-team/mklibs/-/blob/master/src/mklibs</a><br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" tar=
get=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
=C2=A0 * Removed references to mklibs in<br>
=C2=A0 =C2=A0 =C2=A0 meta/conf/local.conf.sample<br>
=C2=A0 =C2=A0 =C2=A0 meta/conf/local.conf.sample.extended<br>
<br>
=C2=A0meta/classes/image-mklibs.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 56 ----------<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
=C2=A0meta/conf/local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0meta/conf/local.conf.sample.extended=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A09 --<br>
=C2=A0.../mklibs/files/ac_init_fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 19 ----<br>
=C2=A0...re-on-symbol-provided-by-application.patch | 103 -----------------=
-<br>
=C2=A0.../mklibs/files/fix_STT_GNU_IFUNC.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
26 -----<br>
=C2=A0.../mklibs/files/fix_cross_compile.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
81 --------------<br>
=C2=A0...U-unique-symbols-as-provided-symbols.patch |=C2=A0 34 ------<br>
=C2=A0.../mklibs/files/sysrooted-ldso.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 18 ---<br>
=C2=A0.../mklibs/<a href=3D"http://mklibs-native_0.1.44.bb" rel=3D"noreferr=
er" target=3D"_blank">mklibs-native_0.1.44.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 22 ----<br>
=C2=A011 files changed, 1 insertion(+), 373 deletions(-)<br>
=C2=A0delete mode 100644 meta/classes/image-mklibs.bbclass<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-o=
n-symbol-provided-by-application.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFU=
NC.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compi=
le.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique=
-symbols-as-provided-symbols.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/mklibs/<a href=3D"http://mkl=
ibs-native_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.=
1.44.bb</a><br>
<br>
diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.=
bbclass<br>
deleted file mode 100644<br>
index 68e11d4365..0000000000<br>
--- a/meta/classes/image-mklibs.bbclass<br>
+++ /dev/null<br>
@@ -1,56 +0,0 @@<br>
-do_rootfs[depends] +=3D &quot;mklibs-native:do_populate_sysroot&quot;<br>
-<br>
-IMAGE_PREPROCESS_COMMAND +=3D &quot;mklibs_optimize_image; &quot;<br>
-<br>
-inherit linuxloader<br>
-<br>
-mklibs_optimize_image_doit() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${WORKDIR}/mklibs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/mklibs/dest<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${IMAGE_ROOTFS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0du -bs &gt; ${WORKDIR}/mklibs/du.before.mklibs.=
txt<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Build a list of dynamically linked executable=
 ELF files.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Omit libc/libpthread as a special case becaus=
e it has an interpreter<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# but is primarily what we intend to strip down=
.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `find . -type f -executable ! -name &#=
39;libc-*&#39; ! -name &#39;libpthread-*&#39;`; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file $i | grep -q E=
LF || continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${HOST_PREFIX}reade=
lf -l $i | grep -q INTERP || continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done &gt; ${WORKDIR}/mklibs/executables.list<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dynamic_loader=3D${@get_linuxloader(d)}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mklibs -v \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--ldlib ${dynamic_l=
oader} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir ${baselib}=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysroot ${PKG_CON=
FIG_SYSROOT_DIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--gcc-options &quot=
;--sysroot=3D${PKG_CONFIG_SYSROOT_DIR}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root ${IMAGE_ROOT=
FS} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--target `echo ${TA=
RGET_PREFIX} | sed &#39;s/-$//&#39; ` \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-d ${WORKDIR}/mklib=
s/dest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`cat ${WORKDIR}/mkl=
ibs/executables.list`<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/mklibs/dest<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $i `find ${IMAGE=
_ROOTFS} -name $i`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${IMAGE_ROOTFS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0du -bs &gt; ${WORKDIR}/mklibs/du.after.mklibs.t=
xt<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo rootfs size before mklibs optimization: `c=
at ${WORKDIR}/mklibs/du.before.mklibs.txt`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo rootfs size after mklibs optimization: `ca=
t ${WORKDIR}/mklibs/du.after.mklibs.txt`<br>
-}<br>
-<br>
-mklibs_optimize_image() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for img in ${MKLIBS_OPTIMIZED_IMAGES}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${img}&q=
uot; =3D &quot;${PN}&quot; ] || [ &quot;${img}&quot; =3D &quot;all&quot; ]<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mklibs_optimize_image_doit<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index bfebd68acf..1467a10f8a 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -508,7 +508,6 @@ RECIPE_MAINTAINER_pn-mingetty =3D &quot;Yi Zhao &lt;<a =
href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mini-x-session =3D &quot;Armin Kuster &lt;<a hre=
f=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-minicom =3D &quot;Anuj Mittal &lt;<a href=3D"mai=
lto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&=
quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mkfontscale =3D &quot;Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-mklibs-native =3D &quot;Robert Yang &lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mmc-utils =3D &quot;Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mobile-broadband-provider-info =3D &quot;Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">=
alex.kanavin@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-modutils-initscripts =3D &quot;Yi Zhao &lt;<a hr=
ef=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com=
</a>&gt;&quot;<br>
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample<br>
index 652bd47733..9caac6e152 100644<br>
--- a/meta/conf/local.conf.sample<br>
+++ b/meta/conf/local.conf.sample<br>
@@ -126,11 +126,8 @@ EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<br>
=C2=A0# enable extra features. Some available options which can be included=
 in this variable<br>
=C2=A0# are:<br>
=C2=A0#=C2=A0 =C2=A0- &#39;buildstats&#39; collect build statistics<br>
-#=C2=A0 =C2=A0- &#39;image-mklibs&#39; to reduce shared library files size=
 for an image<br>
=C2=A0#=C2=A0 =C2=A0- &#39;image-prelink&#39; in order to prelink the files=
ystem image<br>
-# NOTE: if listing mklibs &amp; prelink both, then make sure mklibs is bef=
ore prelink<br>
-# NOTE: mklibs also needs to be explicitly enabled for a given image, see =
local.conf.extended<br>
-USER_CLASSES ?=3D &quot;buildstats image-mklibs image-prelink&quot;<br>
+USER_CLASSES ?=3D &quot;buildstats image-prelink&quot;<br>
<br>
<br>
=C2=A0#<br>
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sa=
mple.extended<br>
index 785a1e59df..6585ae710a 100644<br>
--- a/meta/conf/local.conf.sample.extended<br>
+++ b/meta/conf/local.conf.sample.extended<br>
@@ -120,15 +120,6 @@<br>
=C2=A0#<br>
=C2=A0# TCMODE ?=3D &quot;external-sourcery&quot;<br>
<br>
-# mklibs library size optimization is more useful to smaller images,<br>
-# and less useful for bigger images. Also mklibs library optimization<br>
-# can break the ABI compatibility, so should not be applied to the<br>
-# images which are to be extended or upgraded later.<br>
-#This enabled mklibs library size optimization just for the specified imag=
e.<br>
-#MKLIBS_OPTIMIZED_IMAGES ?=3D &quot;core-image-minimal&quot;<br>
-#This enable mklibs library size optimization will be for all the images.<=
br>
-#MKLIBS_OPTIMIZED_IMAGES ?=3D &quot;all&quot;<br>
-<br>
=C2=A0# This value is currently used by pseudo to determine if the recipe s=
hould<br>
=C2=A0# build both the 32-bit and 64-bit wrapper libraries on a 64-bit buil=
d system.<br>
=C2=A0#<br>
diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/meta/re=
cipes-devtools/mklibs/files/ac_init_fix.patch<br>
deleted file mode 100644<br>
index 422af10420..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-Get the version of mklibs by simpler means. The MKLIBS_VERSION string in t=
he <br>
-<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">confi=
gure.ac</a> file is replaced with real version string by the <br>
-do_configure_prepend() function from the recipe .bb file.<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.com" target=3D"_=
blank">nitin.a.kamble@intel.com</a>&gt;<br>
-Date: 2011/01/24<br>
-<br>
-Index: mklibs/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mklibs.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A02010-02-21 17:34:56.000000000 -080=
0<br>
-+++ mklibs/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2011-01-24 18:52:19.94324=
2079 -0800<br>
-@@ -1,4 +1,4 @@<br>
--AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne &#39;print $1 =
if m/^Version: (.*)$/;&#39;))<br>
-+AC_INIT([mklibs], MKLIBS_VERSION)<br>
- AM_INIT_AUTOMAKE([foreign no-define])<br>
- AC_CONFIG_HEADERS([config.h])<br>
- AM_MAINTAINER_MODE<br>
diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-pro=
vided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failu=
re-on-symbol-provided-by-application.patch<br>
deleted file mode 100644<br>
index 17d9af4de4..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-b=
y-application.patch<br>
+++ /dev/null<br>
@@ -1,103 +0,0 @@<br>
-From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001<br>
-From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com" tar=
get=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
-Date: Fri, 17 Apr 2015 14:48:20 +0800<br>
-Subject: [PATCH 4/6] avoid failure on symbol provided by application<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Undefined symbols in a library can be provided by the application<br>
-that links to the library, such as `logsink&#39; in libmultipath.so.0.<br>
-This fix checks the type of object in which the symbol is needed<br>
-and the existence of the symbol in application, when a symbol<br>
-cannot be provided by libraries. It prevents false alarm on absence<br>
-of symbols.<br>
-<br>
-Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver=
.com" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
-<br>
----<br>
- src/mklibs | 28 ++++++++++++++++++++++++----<br>
- 1 file changed, 24 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/mklibs b/src/mklibs<br>
-index a3533c0..66b7a09 100755<br>
---- a/src/mklibs<br>
-+++ b/src/mklibs<br>
-@@ -133,9 +133,9 @@ class Symbol(object):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;@&#39;.join(ret)<br>
- <br>
- class UndefinedSymbol(Symbol):<br>
--=C2=A0 =C2=A0 def __init__(self, name, weak, version, library):<br>
-+=C2=A0 =C2=A0 def __init__(self, name, weak, version, library, object):<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(UndefinedSymbol, self).__init__(na=
me, version, library)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.weak, self.library =3D weak, library<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.weak, self.library, self.object =3D weak=
, library, object<br>
- <br>
- def symbol_is_blacklisted(name):<br>
-=C2=A0 =C2=A0 =C2=A0# The ARM Embedded ABI spec states symbols under this =
namespace as<br>
-@@ -152,6 +152,11 @@ def undefined_symbols(obj):<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0output =3D command(&quot;mklibs-readelf&quot;, &quot;-=
-print-symbols-undefined&quot;, obj)<br>
- <br>
-+=C2=A0 =C2=A0 if len(obj) &gt; len(dest_path) and obj[:len(dest_path)] =
=3D=3D dest_path:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object =3D obj[len(dest_path) + 1:-len(&#39;-=
so-stripped&#39;)]<br>
-+=C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object =3D obj<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0result =3D []<br>
-=C2=A0 =C2=A0 =C2=A0for line in output:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, weak_string, version_string, libra=
ry_string =3D line.split()[:4]<br>
-@@ -171,7 +176,7 @@ def undefined_symbols(obj):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if library_string.lower() !=3D &#39;none=
&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library =3D library_string=
<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 result.append(UndefinedSymbol(name, weak, ver=
sion, library))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result.append(UndefinedSymbol(name, weak, ver=
sion, library, object))<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0return result<br>
- <br>
-@@ -498,12 +503,13 @@ while 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 and re.search(&quot;^ps_&quot;, str(symbol)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and not (re.=
search(&quot;ld-linux.so.3$&quot;, str(symbol)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and not (re.=
search(&quot;^__gnu_local_gp&quot;, str(symbol)))):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG_SPAM,=
 &quot;needed_symbols adding %s, weak: %s&quot; % (symbol, symbol.weak))<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG_SPAM,=
 &quot;needed_symbols adding %s, weak: %s, for %s&quot; % (symbol, symbol.w=
eak, obj))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed_symbo=
ls[str(symbol)] =3D symbol<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries.update(library_depends(obj))<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0# calculate what symbols are present in small_libs and=
 available_libs<br>
-=C2=A0 =C2=A0 =C2=A0present_symbols =3D {}<br>
-+=C2=A0 =C2=A0 present_symbol_progs =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0checked_libs =3D small_libs<br>
-=C2=A0 =C2=A0 =C2=A0checked_libs.extend(available_libs)<br>
-=C2=A0 =C2=A0 =C2=A0checked_libs.append(sysroot + ldlib)<br>
-@@ -513,6 +519,12 @@ while 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0names =3D symbol.base_name=
s()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in names:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0present_symb=
ols[name] =3D symbol<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not so_pattern.match(lib):<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(DEBUG_SPAM,=
 &quot;present_symbol_progs adding %s, from executable %s&quot; % (&#39; &#=
39;.join(names), lib))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in names=
:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pro=
gs =3D present_symbol_progs.get(name, set())<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pro=
gs.add(lib)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=
sent_symbol_progs[name] =3D progs<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# are we finished?<br>
-=C2=A0 =C2=A0 =C2=A0num_unresolved =3D 0<br>
-@@ -568,6 +580,14 @@ while 1:<br>
-=C2=A0 =C2=A0 =C2=A0for name in needed_symbols:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not name in symbol_provider:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not needed_symbols[name=
].weak:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # WORKAROUND: Und=
efined symbols in a library can be provided by the application<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # that links to t=
he library. So if the object which requires the symbol is a library<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and some applic=
ation can provide the symbol, the undefined symbol is skipped.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symbol =3D needed=
_symbols[name]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if so_pattern.mat=
ch(symbol.object) and present_symbol_progs.get(name, None):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deb=
ug(DEBUG_SPAM, &quot;symbol %s in library %s is provided by executable %s&q=
uot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 % (name, symbol.object, &#39; &#39;.join(present_symbol_p=
rogs[name])))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Except=
ion(&quot;No library provides non-weak %s&quot; % name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lib =3D symbol_provider[na=
me]<br>
--- <br>
-2.16.1<br>
-<br>
diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch b/m=
eta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch<br>
deleted file mode 100644<br>
index d27a48916d..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn&#39;t<br>
-define STT_GNU_IFUNC, so we have to define it ourselves.<br>
-<br>
-Upstream-Status: Inappropriate [other] - old release specific, maybe remov=
able<br>
-<br>
--- Dexuan Cui (<a href=3D"mailto:dexuan.cui@intel.com" target=3D"_blank">d=
exuan.cui@intel.com</a>) Feb 16, 2011.<br>
-<br>
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp<br>
-index 2444c39..56d93f8 100644<br>
---- a/src/mklibs-readelf/main.cpp<br>
-+++ b/src/mklibs-readelf/main.cpp<br>
-@@ -6,6 +6,14 @@<br>
- #include &lt;vector&gt;<br>
- <br>
- #include &lt;elf.h&gt;<br>
-+/*<br>
-+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) doesn&#=
39;t<br>
-+ * define the macro. We need to define it here.<br>
-+ */<br>
-+#ifndef STT_GNU_IFUNC<br>
-+#define STT_GNU_IFUNC=C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Symbol is indirect code object */<br>
-+#endif<br>
-+<br>
- #include &lt;getopt.h&gt;<br>
- <br>
- #include &quot;elf.hpp&quot;<br>
diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/m=
eta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
deleted file mode 100644<br>
index 13e4606b80..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
+++ /dev/null<br>
@@ -1,81 +0,0 @@<br>
-Remove dependency on dpkg<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Asking the host OS whether it supports multiarch is not useful<br>
-in a cross-compilation environment, or if the user has specified<br>
-a libdir explicitly. So this patch, based on the work of Mentor<br>
-Graphics, removes mklibs&#39;s dependency on dpkg package.<br>
-<br>
-Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:Yuanjie.Huang@windriver=
.com" target=3D"_blank">Yuanjie.Huang@windriver.com</a>&gt;<br>
- src/mklibs | 30 +++++++++++++++++++-----------<br>
- 1 file changed, 19 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/src/mklibs b/src/mklibs<br>
-index d9b784b..c5614ea 100755<br>
---- a/src/mklibs<br>
-+++ b/src/mklibs<br>
-@@ -261,6 +261,11 @@ def extract_soname(so_file):<br>
-=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
- <br>
- def multiarch(paths):<br>
-+=C2=A0 =C2=A0 # Asking the host OS whether it supports multiarch is not u=
seful<br>
-+=C2=A0 =C2=A0 # in a cross-compilation environment, or if the user has sp=
ecified<br>
-+=C2=A0 =C2=A0 # a libdir explicitly.<br>
-+=C2=A0 =C2=A0 if sysroot !=3D &quot;&quot; or libdir !=3D &quot;&quot;:<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return paths<br>
-=C2=A0 =C2=A0 =C2=A0devnull =3D open(&#39;/dev/null&#39;, &#39;w&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0dpkg_architecture =3D subprocess.Popen(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;dpkg-architecture&#39;, &#39;-qDEB=
_HOST_MULTIARCH&#39;],<br>
-@@ -340,7 +345,7 @@ lib_path =3D []<br>
- dest_path =3D &quot;DEST&quot;<br>
- ldlib =3D &quot;LDLIB&quot;<br>
- include_default_lib_path =3D &quot;yes&quot;<br>
--default_lib_path =3D multiarch([&quot;/lib/&quot;, &quot;/usr/lib/&quot;,=
 &quot;/usr/X11R6/lib/&quot;])<br>
-+default_lib_path =3D [&quot;/lib/&quot;, &quot;/usr/lib/&quot;, &quot;/us=
r/X11R6/lib/&quot;]<br>
- libc_extras_dir =3D &quot;/usr/lib/libc_pic&quot;<br>
- libc_extras_dir_default =3D True<br>
- libdir =3D &quot;lib&quot;<br>
-@@ -386,7 +391,7 @@ for opt, arg in optlist:<br>
-=C2=A0 =C2=A0 =C2=A0elif opt =3D=3D &quot;--libdir&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdir =3D arg<br>
-=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--help&quot;, &quot;-h&quot;):<br>
--=C2=A0 =C2=A0 =C2=A0 usage(0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(0)<br>
-=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--version&quot;, &quot;-V&quot;):<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version(vers)<br>
-@@ -395,6 +400,7 @@ for opt, arg in optlist:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;WARNING: unknown option: &qu=
ot; + opt + &quot;\targ: &quot; + arg<br>
- <br>
- if include_default_lib_path =3D=3D &quot;yes&quot;:<br>
-+=C2=A0 =C2=A0 default_lib_path =3D multiarch(default_lib_path)<br>
-=C2=A0 =C2=A0 =C2=A0lib_path.extend([a.replace(&quot;/lib/&quot;, &quot;/&=
quot; + libdir + &quot;/&quot;) for a in default_lib_path])<br>
- <br>
- if libc_extras_dir_default:<br>
-@@ -661,16 +669,16 @@ ld_path_name =3D os.path.dirname(ldlib)<br>
- ld_full_path =3D &quot;../&quot; + ldlib<br>
- ld_file =3D find_lib(ld_file_name)<br>
- <br>
--if ld_path_name !=3D &quot;/lib&quot;:<br>
--=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_name, os.F=
_OK):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + ld_file=
_name)<br>
-+#if ld_path_name !=3D &quot;/lib&quot;:<br>
-+#=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_name, os.=
F_OK):<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + ld_fil=
e_name)<br>
- <br>
--if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):<br>
--=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)<br>
-+#if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):<br>
-+#=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)<br>
- <br>
--if not os.access(dest_path + &quot;/&quot; + ld_full_path, os.F_OK):<br>
--=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic =
linker to &quot; + ld_full_path)<br>
-+if not os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):<br>
-+=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic =
linker to &quot; + ld_file_name)<br>
-=C2=A0 =C2=A0 =C2=A0command(target + &quot;objcopy&quot;, &quot;--strip-un=
needed -R .note -R .comment&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quot;/&qu=
ot; + ld_full_path)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quot;/&qu=
ot; + ld_file_name)<br>
- <br>
--os.chmod(dest_path + &quot;/&quot; + ld_full_path, 0755)<br>
-+os.chmod(dest_path + &quot;/&quot; + ld_file_name, 0755)<br>
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-=
provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique=
-symbols-as-provided-symbols.patch<br>
deleted file mode 100644<br>
index bc56593e6a..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provide=
d-symbols.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001<br>
-From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com" tar=
get=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
-Date: Wed, 15 Apr 2015 14:00:06 +0800<br>
-Subject: [PATCH] Show GNU unique symbols as provided symbols<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-GNU Unique symbol is a GNU extension employed by new version of GCC<br>
-by default. Even Standard C++ library in GCC 4.9 provides some symbols,<br=
>
-such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead<br>
-of ELF standard weak binding.<br>
-This patch adds support of this new binding type to mklibs-readelf.<br>
-<br>
-Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver=
.com" target=3D"_blank">yuanjie.huang@windriver.com</a>&gt;<br>
----<br>
- src/mklibs-readelf/main.cpp | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp<br>
-index 56d93f8..0134530 100644<br>
---- a/src/mklibs-readelf/main.cpp<br>
-+++ b/src/mklibs-readelf/main.cpp<br>
-@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section=
_type&lt;Elf::section_type_<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t type =3D symbol-&gt;get_type ();<br>
-=C2=A0 =C2=A0 =C2=A0const std::string &amp;name =3D symbol-&gt;get_name_st=
ring ();<br>
- <br>
--=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEAK)<br>
-+=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEAK &amp=
;&amp; bind !=3D STB_GNU_UNIQUE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0if (shndx =3D=3D SHN_UNDEF || shndx =3D=3D SHN_ABS)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
--- <br>
-1.8.5.2.233.g932f7e4<br>
-<br>
diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch b/meta=
/recipes-devtools/mklibs/files/sysrooted-ldso.patch<br>
deleted file mode 100644<br>
index 75500a029a..0000000000<br>
--- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-In cross builds we will have to respect sysroot<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Upstream-Status: Pending<br>
-<br>
-Index: mklibs-0.1.39/src/mklibs<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mklibs-0.1.39.orig/src/mklibs=C2=A0 =C2=A0 =C2=A0 2014-03-01 18:25:36.=
000000000 +0000<br>
-+++ mklibs-0.1.39/src/mklibs=C2=A0 =C2=A02014-10-19 00:51:46.813534596 +00=
00<br>
-@@ -495,7 +495,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0present_symbols =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0checked_libs =3D small_libs<br>
-=C2=A0 =C2=A0 =C2=A0checked_libs.extend(available_libs)<br>
--=C2=A0 =C2=A0 checked_libs.append(ldlib)<br>
-+=C2=A0 =C2=A0 checked_libs.append(sysroot + ldlib)<br>
-=C2=A0 =C2=A0 =C2=A0for lib in checked_libs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for symbol in provided_symbols(lib):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(DEBUG_SPAM, &quot;pr=
esent_symbols adding %s&quot; % symbol)<br>
diff --git a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0=
.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a> =
b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.44.bb" r=
el=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a><br>
deleted file mode 100644<br>
index 1784af1f4c..0000000000<br>
--- a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.44.b=
b" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a><br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-SUMMARY =3D &quot;Shared library optimisation tool&quot;<br>
-DESCRIPTION =3D &quot;mklibs produces cut-down shared libraries that conta=
in only the routines required by a particular set of executables.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://launchpad.net/mklibs" rel=3D"norefer=
rer" target=3D"_blank">https://launchpad.net/mklibs</a>&quot;<br>
-SECTION =3D &quot;devel&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D98d31037b13d896e3=
3890738ef01af64&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian/201=
80828T214102Z/pool/main/m/mklibs/mklibs_$%7BPV%7D.tar.xz" rel=3D"noreferrer=
" target=3D"_blank">http://snapshot.debian.org/archive/debian/20180828T2141=
02Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://ac_init_fix.patch\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_STT_GNU_IFUNC.patch\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://sysrooted-ldso.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://avoid-failure-on-symbol-provided-by-appl=
ication.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://show-GNU-unique-symbols-as-provided-symb=
ols.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_cross_compile.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;6b6eeb9b4016c6a7317acc28c89e32cc&quot;<br>
-SRC_URI[sha256sum] =3D &quot;3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b23=
8ccb9b49d84722066c2&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/m/mklibs/&quot;<br>
-<br>
-inherit autotools gettext native<br>
</blockquote></div>

--000000000000c0b1d705c2978593--
