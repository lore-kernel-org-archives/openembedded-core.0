Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8184176294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:14:11 +0000 (UTC)
Received: by wmww144 with SMTP id w144so117093763wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w1j7rinQuGG44luSBOoYuhoCuN5EDeLSnYIUft8XAFQ=;
	b=mjVCL2IleomI8RWVmuu6yYT70mRxyk5XMZGkRiEm6Iy9tOSmiA7PEVfeFxpA9+cPnG
	DDpcK2x8gpOx8f0XeTHLyYSB/GF878N4tBwMkZh/+wD3h90W2acI/d3D4WUmEWY9dQKP
	k84FF/JS5NIULXaW1F5FKS/oP4qxUo3cJdcd0aWD+jCtOpVevqkAx0RbkTXXpb+BMM9+
	ncXaN+lL2tHHDhzUuMboyPBLAPLkwcqlLN4K6CgvFwG914Ha8LwUJRvBA1O/kR0c34R9
	7kmyLe8H8nk7wrYRF3IftRxxCd9a0vjJx/eOS4hgbuj86/6T82/AhDfycsVuIGF77YLK
	8Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=w1j7rinQuGG44luSBOoYuhoCuN5EDeLSnYIUft8XAFQ=;
	b=Qm0i6EHFcfZfQLbIuLAULQjBbaaCrZNPjWgomStZc6qvsfhN7xWTBjSojWVcB1G40u
	vZyqBWN+sd1kU+vbQfqIUYw2/j2MVzI+AFDVKTXoXcjfgCV4rje+ZqVH732JNtytBlLj
	4kb3B2truvnIfh33Cqo0ML22RCJIw1iSqL8KzAprWyucTQCU5BVOsyu9FrfGOsu4fLSO
	mstX8OKFRs4Zs90ky1qRM8gZbrp/lLJDVHxhbE68jBsQrNohHc0o3ZJoBmqzBnKCyIn4
	rOgLiUF2iie2m0DeCxP5E4U03ICxaYPrD+W3L/rRvG3jh7+Dd9hUMgNwgKh/b85CqKAe
	uSfQ==
X-Gm-Message-State: ALoCoQlY47feHnZ4bOkew5ZYQMfMChAygpwCo9GtRSS6hXKjCX7syo9seH6v+xpZfKY3d1eQFw7I
X-Received: by 10.28.174.144 with SMTP id x138mr33417940wme.28.1447161250957; 
	Tue, 10 Nov 2015 05:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Tue, 10 Nov 2015 05:13:41 -0800 (PST)
In-Reply-To: <74d946dc65eb898819b81599cc6ae3a43297056d.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<74d946dc65eb898819b81599cc6ae3a43297056d.1447080392.git.alexander.kanavin@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 10 Nov 2015 15:13:41 +0200
Message-ID: <CAHiDW_GnidM1ee=8WwAgcSU5fKS9Mei5LfKzbEx_3u+9ji+3xA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/29] python-pygtk: remove the recipe
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
X-List-Received-Date: Tue, 10 Nov 2015 13:14:13 -0000
Content-Type: multipart/alternative; boundary=001a1143b40c4be1b805242f7cb9

--001a1143b40c4be1b805242f7cb9
Content-Type: text/plain; charset=UTF-8

Are the pygtk changes directly related to the introspection changes? If not
then maybe they should happen in another patch set.

Jussi

On 9 November 2015 at 16:50, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> python-pygtk hasn't been updated in several years, is incompatible
> with the current version of pygobject, and is generally obsolete as
> all modern python gtk apps use introspection directly.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc          |  1 -
>  .../packagegroups/packagegroup-self-hosted.bb      |  1 -
>  .../python/python-pygtk/acinclude.m4               | 90
> ----------------------
>  .../add-gtk-types.defs-into-gdk.c-dependence.patch | 32 --------
>  .../python/python-pygtk/fix-gtkunixprint.patch     | 20 -----
>  .../python/python-pygtk/fix-pygtk-2.0.pc.patch     | 13 ----
>  .../python/python-pygtk/nodocs.patch               | 15 ----
>  .../prevent_to_get_display_during_import.patch     | 16 ----
>  .../python/python-pygtk/python-pygtk2/acinclude.m4 | 90
> ----------------------
>  .../update-dependences-of-defs.c.patch             | 38 ---------
>  .../recipes-devtools/python/python-pygtk_2.24.0.bb | 55 -------------
>  11 files changed, 371 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/acinclude.m4
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk/nodocs.patch
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
>  delete mode 100644
> meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
>  delete mode 100644 meta/recipes-devtools/python/python-pygtk_2.24.0.bb
>
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index ca333c8..6368d6d 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -402,7 +402,6 @@ DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako
> Opensuse=python-Mako"
>  DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo
> Ubuntu=pycairo Debian=pycairo"
>  DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl
> Ubuntu=python-pycurl"
>  DISTRO_PN_ALIAS_pn-python-pygobject = "Meego=pygobject2 Fedora=pygobject2
> Ubuntu=pygobject Debian=pygobject"
> -DISTRO_PN_ALIAS_pn-python-pygtk = "Debian=python-gtk2 Fedora=pygtk2
> OpenSuSE=python-gtk"
>  DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex
> Ubuntu=python-pyrex"
>  DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons
> Ubuntu=scons Mandriva=scons Debian=scons"
>  DISTRO_PN_ALIAS_pn-python-setuptools = "Mandriva=python-setup
> OpenSuSE=python-setup-git"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index d38be26..b8573fb 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -190,7 +190,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
>      libsdl \
>      libsdl-dev \
>      libx11-dev \
> -    python-pygtk \
>      gtk-theme-clearlooks \
>      xdg-utils \
>      epiphany \
> diff --git a/meta/recipes-devtools/python/python-pygtk/acinclude.m4
> b/meta/recipes-devtools/python/python-pygtk/acinclude.m4
> deleted file mode 100644
> index 53518fb..0000000
> --- a/meta/recipes-devtools/python/python-pygtk/acinclude.m4
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -## this one is commonly used with AM_PATH_PYTHONDIR ...
> -dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND
> [,ACTION-IF-NOT-FOUND]]])
> -dnl Check if a module containing a given symbol is visible to python.
> -AC_DEFUN(AM_CHECK_PYMOD,
> -[AC_REQUIRE([AM_PATH_PYTHON])
> -py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
> -AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
> -AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
> -ifelse([$2],[], [prog="
> -import sys
> -try:
> -        import $1
> -except ImportError:
> -        sys.exit(1)
> -except:
> -        sys.exit(0)
> -sys.exit(0)"], [prog="
> -import $1
> -$1.$2"])
> -if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
> -  then
> -    eval "py_cv_mod_$py_mod_var=yes"
> -  else
> -    eval "py_cv_mod_$py_mod_var=no"
> -  fi
> -])
> -py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
> -if test "x$py_val" != xno; then
> -  AC_MSG_RESULT(yes)
> -  ifelse([$3], [],, [$3
> -])dnl
> -else
> -  AC_MSG_RESULT(no)
> -  ifelse([$4], [],, [$4
> -])dnl
> -fi
> -])
> -
> -dnl a macro to check for ability to create python extensions
> -dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE],
> [ACTION-IF-NOT-POSSIBLE])
> -dnl function also defines PYTHON_INCLUDES
> -AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
> -[AC_REQUIRE([AM_PATH_PYTHON])
> -AC_MSG_CHECKING(for headers required to compile python extensions)
> -dnl deduce PYTHON_INCLUDES
> -AC_ARG_WITH(python-includes,
> -       [  --with-python-includes=DIR  path to Python includes],
> py_exec_prefix=$withval)
> -if test x$py_exec_prefix != x; then
> -PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> -else
> -py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
> -py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
> -PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
> -if test "$py_prefix" != "$py_exec_prefix"; then
> -  PYTHON_INCLUDES="$PYTHON_INCLUDES
> -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> -fi
> -fi
> -AC_SUBST(PYTHON_INCLUDES)
> -dnl check if the headers exist:
> -save_CPPFLAGS="$CPPFLAGS"
> -CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
> -AC_TRY_CPP([#include <Python.h>],dnl
> -[AC_MSG_RESULT(found)
> -$1],dnl
> -[AC_MSG_RESULT(not found)
> -$2])
> -CPPFLAGS="$save_CPPFLAGS"
> -])
> -
> -dnl
> -dnl JH_ADD_CFLAG(FLAG)
> -dnl checks whether the C compiler supports the given flag, and if so, adds
> -dnl it to $CFLAGS.  If the flag is already present in the list, then the
> -dnl check is not performed.
> -AC_DEFUN([JH_ADD_CFLAG],
> -[
> -case " $CFLAGS " in
> -*@<:@\ \ @:>@$1@<:@\   \ @:>@*)
> -  ;;
> -*)
> -  save_CFLAGS="$CFLAGS"
> -  CFLAGS="$CFLAGS $1"
> -  AC_MSG_CHECKING([whether [$]CC understands $1])
> -  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
> -  AC_MSG_RESULT($jh_has_option)
> -  if test $jh_has_option = no; then
> -    CFLAGS="$save_CFLAGS"
> -  fi
> -  ;;
> -esac])
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
> b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
> deleted file mode 100644
> index df0f9cd..0000000
> ---
> a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Submitted
> -
> -add gtk-types.defs into gdk.c dependence
> -
> -gdk.c depends on gtk-types.defs but
> -gdk/Makefile.am miss this. This will cause
> -build error sometimes when built
> -with multi-jobbing, so add gtk-types.defs into
> -gdk.c dependence.
> -
> -Signed-off-by: Song.Li <Song.Li@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - gtk/Makefile.am |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/gtk/Makefile.am b/gtk/Makefile.am
> -index 7bb5d0c..4a88351 100644
> ---- a/gtk/Makefile.am
> -+++ b/gtk/Makefile.am
> -@@ -214,7 +214,7 @@ gtkunixprint.defs: $(GTKUNIXPRINT_DEFS) Makefile
> - gtkunixprint-types.defs: $(GTKUNIXPRINT_TYPES_DEFS) Makefile
> -       $(CREATEDEFS) $@ $(GTKUNIXPRINT_TYPES_DEFS)
> -
> --gdk.c: gdk-types.defs gdk.defs $(GDK_OVERRIDES)
> -+gdk.c: gdk-types.defs gtk-types.defs gdk.defs $(GDK_OVERRIDES)
> - gtk.c: gdk-types.defs gtk-types.defs gtk.defs gdk-types.defs
> $(GTK_OVERRIDES)
> - _gtk_la_CFLAGS = $(PYCAIRO_CFLAGS) $(GTK_CFLAGS)
> - _gtk_la_LDFLAGS = $(common_ldflags) -export-symbols-regex init_gtk
> ---
> -1.7.4
> -
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
> b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
> deleted file mode 100644
> index 16c0e8e..0000000
> --- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: pygtk-2.24.0/gtk/gtkunixprint.override
> -===================================================================
> ---- pygtk-2.24.0.orig/gtk/gtkunixprint.override
> -+++ pygtk-2.24.0/gtk/gtkunixprint.override
> -@@ -102,11 +102,6 @@ _wrap_gtk_print_job_get_surface(PyGObjec
> -     if (pyg_error_check(&error))
> -         return NULL;
> -
> --#if PYCAIRO_VERSION_HEX >= 0x1010600
> --    return PycairoSurface_FromSurface(cairo_surface_reference(surface),
> NULL);
> --#else
> --    return PycairoSurface_FromSurface(cairo_surface_reference(surface),
> NULL, NULL);
> --#endif
> - }
> - %%
> - override gtk_print_job_send kwargs
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
> b/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
> deleted file mode 100644
> index b6156540..0000000
> --- a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pygtk-2.24.0/pygtk-2.0.pc.in
> -===================================================================
> ---- pygtk-2.24.0.orig/pygtk-2.0.pc.in
> -+++ pygtk-2.24.0/pygtk-2.0.pc.in
> -@@ -1,5 +1,6 @@
> - prefix=@prefix@
> - exec_prefix=@exec_prefix@
> -+libdir=@libdir@
> - includedir=@includedir@
> - datarootdir=@datarootdir@
> - datadir=@datadir@
> diff --git a/meta/recipes-devtools/python/python-pygtk/nodocs.patch
> b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
> deleted file mode 100644
> index f07309a..0000000
> --- a/meta/recipes-devtools/python/python-pygtk/nodocs.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pygtk-2.17.0/Makefile.am
> -===================================================================
> ---- pygtk-2.17.0.orig/Makefile.am
> -+++ pygtk-2.17.0/Makefile.am
> -@@ -4,7 +4,7 @@ if BUILD_GTK
> -   GTK_SUBDIR = gtk
> - endif
> -
> --SUBDIRS = . $(GTK_SUBDIR) examples tests docs
> -+SUBDIRS = . $(GTK_SUBDIR) examples tests
> -
> - PLATFORM_VERSION = 2.0
> -
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
> b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
> deleted file mode 100644
> index 833038e..0000000
> ---
> a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: pygtk-2.10.4/gtk/__init__.py
> -===================================================================
> ---- pygtk-2.10.4.orig/gtk/__init__.py  2007-11-27 19:27:05.000000000 -0300
> -+++ pygtk-2.10.4/gtk/__init__.py       2007-11-27 19:28:22.000000000 -0300
> -@@ -78,7 +78,8 @@
> -
> - keysyms = LazyModule('keysyms', locals())
> -
> --_init()
> -+if not hasattr(sys.modules['__main__'], 'python_launcher_enabled'):
> -+    _init()
> -
> - # CAPI
> - _PyGtk_API = _gtk._PyGtk_API
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
> b/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
> deleted file mode 100644
> index 53518fb..0000000
> --- a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -## this one is commonly used with AM_PATH_PYTHONDIR ...
> -dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND
> [,ACTION-IF-NOT-FOUND]]])
> -dnl Check if a module containing a given symbol is visible to python.
> -AC_DEFUN(AM_CHECK_PYMOD,
> -[AC_REQUIRE([AM_PATH_PYTHON])
> -py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
> -AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
> -AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
> -ifelse([$2],[], [prog="
> -import sys
> -try:
> -        import $1
> -except ImportError:
> -        sys.exit(1)
> -except:
> -        sys.exit(0)
> -sys.exit(0)"], [prog="
> -import $1
> -$1.$2"])
> -if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
> -  then
> -    eval "py_cv_mod_$py_mod_var=yes"
> -  else
> -    eval "py_cv_mod_$py_mod_var=no"
> -  fi
> -])
> -py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
> -if test "x$py_val" != xno; then
> -  AC_MSG_RESULT(yes)
> -  ifelse([$3], [],, [$3
> -])dnl
> -else
> -  AC_MSG_RESULT(no)
> -  ifelse([$4], [],, [$4
> -])dnl
> -fi
> -])
> -
> -dnl a macro to check for ability to create python extensions
> -dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE],
> [ACTION-IF-NOT-POSSIBLE])
> -dnl function also defines PYTHON_INCLUDES
> -AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
> -[AC_REQUIRE([AM_PATH_PYTHON])
> -AC_MSG_CHECKING(for headers required to compile python extensions)
> -dnl deduce PYTHON_INCLUDES
> -AC_ARG_WITH(python-includes,
> -       [  --with-python-includes=DIR  path to Python includes],
> py_exec_prefix=$withval)
> -if test x$py_exec_prefix != x; then
> -PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> -else
> -py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
> -py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
> -PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
> -if test "$py_prefix" != "$py_exec_prefix"; then
> -  PYTHON_INCLUDES="$PYTHON_INCLUDES
> -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> -fi
> -fi
> -AC_SUBST(PYTHON_INCLUDES)
> -dnl check if the headers exist:
> -save_CPPFLAGS="$CPPFLAGS"
> -CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
> -AC_TRY_CPP([#include <Python.h>],dnl
> -[AC_MSG_RESULT(found)
> -$1],dnl
> -[AC_MSG_RESULT(not found)
> -$2])
> -CPPFLAGS="$save_CPPFLAGS"
> -])
> -
> -dnl
> -dnl JH_ADD_CFLAG(FLAG)
> -dnl checks whether the C compiler supports the given flag, and if so, adds
> -dnl it to $CFLAGS.  If the flag is already present in the list, then the
> -dnl check is not performed.
> -AC_DEFUN([JH_ADD_CFLAG],
> -[
> -case " $CFLAGS " in
> -*@<:@\ \ @:>@$1@<:@\   \ @:>@*)
> -  ;;
> -*)
> -  save_CFLAGS="$CFLAGS"
> -  CFLAGS="$CFLAGS $1"
> -  AC_MSG_CHECKING([whether [$]CC understands $1])
> -  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
> -  AC_MSG_RESULT($jh_has_option)
> -  if test $jh_has_option = no; then
> -    CFLAGS="$save_CFLAGS"
> -  fi
> -  ;;
> -esac])
> diff --git
> a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
> b/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
> deleted file mode 100644
> index 3ed954e..0000000
> ---
> a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From dc024e9079bbffbb44436ba3e70a758ebad5520f Mon Sep 17 00:00:00 2001
> -From: "Song.Li" <Song.Li@windriver.com>
> -Date: Sat, 5 Jan 2013 14:55:59 +0800
> -Subject: [PATCH] update dependences of defs.c in Makefile.am
> -
> -In gtk/Makefile.am, defs.c should dependes on gdk-types.defs and
> -gtk-types.defs, otherwise it fails occasionally when parallel compile.
> -The error message:
> -"IOError: [Errno 2] No such file or directory: 'gtk-types.defs'"
> -
> -Add them to dependences of defs.c to fix this issue.
> -
> -Upstream-Status: Submitted
> -https://bugzilla.gnome.org/show_bug.cgi?id=702706
> -
> -Signed-off-by: Song.Li <Song.Li@windriver.com>
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> ----
> - gtk/Makefile.am |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gtk/Makefile.am b/gtk/Makefile.am
> -index 7bb5d0c..91826cb 100644
> ---- a/gtk/Makefile.am
> -+++ b/gtk/Makefile.am
> -@@ -289,7 +289,7 @@ if HAVE_GIO_TYPES_DEFS
> - extra_codegen_args += --register $(PYGOBJECT_DEFSDIR)/gio-types.defs
> - endif
> -
> --.defs.c:
> -+.defs.c: gdk-types.defs gtk-types.defs
> -       ($(PYTHON) $(CODEGENDIR)/codegen.py \
> -          $(PYGTK_CODEGEN_DEFINES) \
> -           -I $(srcdir) \
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> deleted file mode 100644
> index 79b3110..0000000
> --- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -SUMMARY = "Python bindings for the GTK+ UI toolkit"
> -SECTION = "devel/python"
> -# needs gtk+ 2.17.x
> -DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
> -RDEPENDS_${PN} = "python-shell python-pycairo python-pygobject"
> -PROVIDES = "python-pygtk2"
> -SRCNAME = "pygtk"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
> -
> -PR = "r1"
> -
> -SRC_URI = "
> ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2
> \
> -           file://add-gtk-types.defs-into-gdk.c-dependence.patch \
> -           file://fix-gtkunixprint.patch \
> -           file://prevent_to_get_display_during_import.patch \
> -           file://nodocs.patch \
> -          file://fix-pygtk-2.0.pc.patch \
> -           file://acinclude.m4 \
> -           file://update-dependences-of-defs.c.patch"
> -
> -SRC_URI[md5sum] = "a1051d5794fd7696d3c1af6422d17a49"
> -SRC_URI[sha256sum] =
> "cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e0f82c896e649f206912"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -EXTRA_OECONF = "--disable-docs
> --with-python-includes=${STAGING_INCDIR}/../"
> -
> -inherit autotools pkgconfig distutils-base distro_features_check
> -
> -ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> -
> -do_configure_prepend() {
> -       install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
> -       sed -i \
> -               -e s:'`$PKG_CONFIG --variable defsdir
> pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/2.0/defs\":g \
> -               -e s:'`$PKG_CONFIG --variable=pygtkincludedir
> pygobject-2.0`':\"${STAGING_INCDIR}/pygtk-2.0\":g \
> -               -e s:'`$PKG_CONFIG --variable=datadir
> pygobject-2.0`':\"${STAGING_DATADIR}\":g \
> -               -e s:'`$PKG_CONFIG --variable codegendir
> pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/2.0/codegen\":g \
> -               -e s:'`$PKG_CONFIG --variable=fixxref
> pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/xsl/fixxref.py\":g \
> -               ${S}/configure.ac
> -}
> -
> -# dirty fix #2: fix build system paths leaking in
> -do_install_append() {
> -       sed -i -e '1s|^#!.*python|#!/usr/bin/env python|'
> ${D}${bindir}/pygtk-demo
> -}
> -
> -PACKAGES =+ "${PN}-demo"
> -FILES_${PN}-demo = " ${bindir}/pygtk-demo ${libdir}/pygtk "
> -RDEPENDS_${PN}-demo = "python-pygtk python-stringold python-lang"
> -
> -# todo: revamp packaging, package demo seperatly
> -FILES_${PN}-dev += " ${libdir}/pygtk/2.0 ${bindir}/pygtk-*
> ${datadir}/pygtk/2.0"
> -
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143b40c4be1b805242f7cb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are the pygtk changes directly related to the introsp=
ection changes? If not then maybe they should happen in another patch set.=
=C2=A0<br></div><div><br></div><div>Jussi</div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 9 November 2015 at 16:50, Alexander Kanavi=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com=
" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">python-pygtk hasn&#39;t been updated in several years,=
 is incompatible<br>
with the current version of pygobject, and is generally obsolete as<br>
all modern python gtk apps use introspection directly.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/distro_alias.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-self-hosted.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0.../python/python-pygtk/acinclude.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 90 ----------------------<br>
=C2=A0.../add-gtk-types.defs-into-gdk.c-dependence.patch | 32 --------<br>
=C2=A0.../python/python-pygtk/fix-gtkunixprint.patch=C2=A0 =C2=A0 =C2=A0| 2=
0 -----<br>
=C2=A0.../python/python-pygtk/fix-pygtk-2.0.pc.patch=C2=A0 =C2=A0 =C2=A0| 1=
3 ----<br>
=C2=A0.../python/python-pygtk/nodocs.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 ----<br>
=C2=A0.../prevent_to_get_display_during_import.patch=C2=A0 =C2=A0 =C2=A0| 1=
6 ----<br>
=C2=A0.../python/python-pygtk/python-pygtk2/acinclude.m4 | 90 -------------=
---------<br>
=C2=A0.../update-dependences-of-defs.c.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 38 ---------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-pygtk_2.24.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-pygtk_2.24.0.bb</a> | 55 -----=
--------<br>
=C2=A011 files changed, 371 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/acinclud=
e.m4<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-=
types.defs-into-gdk.c-dependence.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-gtku=
nixprint.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-pygt=
k-2.0.pc.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/nodocs.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/prevent_=
to_get_display_during_import.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/python-p=
ygtk2/acinclude.m4<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-pygtk/update-d=
ependences-of-defs.c.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon-pygtk_2.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pygtk_2.24=
.0.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/i=
nclude/distro_alias.inc<br>
index ca333c8..6368d6d 100644<br>
--- a/meta/conf/distro/include/distro_alias.inc<br>
+++ b/meta/conf/distro/include/distro_alias.inc<br>
@@ -402,7 +402,6 @@ DISTRO_PN_ALIAS_pn-python-mako =3D &quot;Fedora=3Dpytho=
n-mako Opensuse=3Dpython-Mako&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-pycairo =3D &quot;Meego=3Dpycairo Fedora=3D=
pycairo Ubuntu=3Dpycairo Debian=3Dpycairo&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-pycurl =3D &quot;Debian=3Dpython-pycurl Ubu=
ntu=3Dpython-pycurl&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-pygobject =3D &quot;Meego=3Dpygobject2 Fedo=
ra=3Dpygobject2 Ubuntu=3Dpygobject Debian=3Dpygobject&quot;<br>
-DISTRO_PN_ALIAS_pn-python-pygtk =3D &quot;Debian=3Dpython-gtk2 Fedora=3Dpy=
gtk2 OpenSuSE=3Dpython-gtk&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-pyrex =3D &quot;Mandriva=3Dpython-pyrex Ubu=
ntu=3Dpython-pyrex&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-scons =3D &quot;Fedora=3Dscons OpenSuSE=3Ds=
cons Ubuntu=3Dscons Mandriva=3Dscons Debian=3Dscons&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-python-setuptools =3D &quot;Mandriva=3Dpython-setu=
p OpenSuSE=3Dpython-setup-git&quot;<br>
diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hos=
ted.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hos=
ted.bb</a><br>
index d38be26..b8573fb 100644<br>
--- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-self-h=
osted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb<=
/a><br>
+++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-self-h=
osted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb<=
/a><br>
@@ -190,7 +190,6 @@ RDEPENDS_packagegroup-self-hosted-graphics =3D &quot;\<=
br>
=C2=A0 =C2=A0 =C2=A0libsdl \<br>
=C2=A0 =C2=A0 =C2=A0libsdl-dev \<br>
=C2=A0 =C2=A0 =C2=A0libx11-dev \<br>
-=C2=A0 =C2=A0 python-pygtk \<br>
=C2=A0 =C2=A0 =C2=A0gtk-theme-clearlooks \<br>
=C2=A0 =C2=A0 =C2=A0xdg-utils \<br>
=C2=A0 =C2=A0 =C2=A0epiphany \<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/acinclude.m4 b/meta/=
recipes-devtools/python/python-pygtk/acinclude.m4<br>
deleted file mode 100644<br>
index 53518fb..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/acinclude.m4<br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-## this one is commonly used with AM_PATH_PYTHONDIR ...<br>
-dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUN=
D]]])<br>
-dnl Check if a module containing a given symbol is visible to python.<br>
-AC_DEFUN(AM_CHECK_PYMOD,<br>
-[AC_REQUIRE([AM_PATH_PYTHON])<br>
-py_mod_var=3D`echo $1[&#39;_&#39;]$2 | sed &#39;y%./+-%__p_%&#39;`<br>
-AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)<br>
-AC_CACHE_VAL(py_cv_mod_$py_mod_var, [<br>
-ifelse([$2],[], [prog=3D&quot;<br>
-import sys<br>
-try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import $1<br>
-except ImportError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
-except:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(0)<br>
-sys.exit(0)&quot;], [prog=3D&quot;<br>
-import $1<br>
-$1.$2&quot;])<br>
-if $PYTHON -c &quot;$prog&quot; 1&gt;&amp;AC_FD_CC 2&gt;&amp;AC_FD_CC<br>
-=C2=A0 then<br>
-=C2=A0 =C2=A0 eval &quot;py_cv_mod_$py_mod_var=3Dyes&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 eval &quot;py_cv_mod_$py_mod_var=3Dno&quot;<br>
-=C2=A0 fi<br>
-])<br>
-py_val=3D`eval &quot;echo \`echo &#39;$py_cv_mod_&#39;$py_mod_var\`&quot;`=
<br>
-if test &quot;x$py_val&quot; !=3D xno; then<br>
-=C2=A0 AC_MSG_RESULT(yes)<br>
-=C2=A0 ifelse([$3], [],, [$3<br>
-])dnl<br>
-else<br>
-=C2=A0 AC_MSG_RESULT(no)<br>
-=C2=A0 ifelse([$4], [],, [$4<br>
-])dnl<br>
-fi<br>
-])<br>
-<br>
-dnl a macro to check for ability to create python extensions<br>
-dnl=C2=A0 AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POS=
SIBLE])<br>
-dnl function also defines PYTHON_INCLUDES<br>
-AC_DEFUN([AM_CHECK_PYTHON_HEADERS],<br>
-[AC_REQUIRE([AM_PATH_PYTHON])<br>
-AC_MSG_CHECKING(for headers required to compile python extensions)<br>
-dnl deduce PYTHON_INCLUDES<br>
-AC_ARG_WITH(python-includes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[=C2=A0 --with-python-includes=3DDIR=C2=A0 path=
 to Python includes], py_exec_prefix=3D$withval)<br>
-if test x$py_exec_prefix !=3D x; then<br>
-PYTHON_INCLUDES=3D&quot;-I${py_exec_prefix}/include/python${PYTHON_VERSION=
}&quot;<br>
-else<br>
-py_prefix=3D`$PYTHON -c &quot;import sys; print sys.prefix&quot;`<br>
-py_exec_prefix=3D`$PYTHON -c &quot;import sys; print sys.exec_prefix&quot;=
`<br>
-PYTHON_INCLUDES=3D&quot;-I${py_prefix}/include/python${PYTHON_VERSION}&quo=
t;<br>
-if test &quot;$py_prefix&quot; !=3D &quot;$py_exec_prefix&quot;; then<br>
-=C2=A0 PYTHON_INCLUDES=3D&quot;$PYTHON_INCLUDES -I${py_exec_prefix}/includ=
e/python${PYTHON_VERSION}&quot;<br>
-fi<br>
-fi<br>
-AC_SUBST(PYTHON_INCLUDES)<br>
-dnl check if the headers exist:<br>
-save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
-CPPFLAGS=3D&quot;$CPPFLAGS $PYTHON_INCLUDES&quot;<br>
-AC_TRY_CPP([#include &lt;Python.h&gt;],dnl<br>
-[AC_MSG_RESULT(found)<br>
-$1],dnl<br>
-[AC_MSG_RESULT(not found)<br>
-$2])<br>
-CPPFLAGS=3D&quot;$save_CPPFLAGS&quot;<br>
-])<br>
-<br>
-dnl<br>
-dnl JH_ADD_CFLAG(FLAG)<br>
-dnl checks whether the C compiler supports the given flag, and if so, adds=
<br>
-dnl it to $CFLAGS.=C2=A0 If the flag is already present in the list, then =
the<br>
-dnl check is not performed.<br>
-AC_DEFUN([JH_ADD_CFLAG],<br>
-[<br>
-case &quot; $CFLAGS &quot; in<br>
-*@&lt;:@\ \ @:&gt;@$1@&lt;:@\=C2=A0 =C2=A0\ @:&gt;@*)<br>
-=C2=A0 ;;<br>
-*)<br>
-=C2=A0 save_CFLAGS=3D&quot;$CFLAGS&quot;<br>
-=C2=A0 CFLAGS=3D&quot;$CFLAGS $1&quot;<br>
-=C2=A0 AC_MSG_CHECKING([whether [$]CC understands $1])<br>
-=C2=A0 AC_TRY_COMPILE([], [], [jh_has_option=3Dyes], [jh_has_option=3Dno])=
<br>
-=C2=A0 AC_MSG_RESULT($jh_has_option)<br>
-=C2=A0 if test $jh_has_option =3D no; then<br>
-=C2=A0 =C2=A0 CFLAGS=3D&quot;$save_CFLAGS&quot;<br>
-=C2=A0 fi<br>
-=C2=A0 ;;<br>
-esac])<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-i=
nto-gdk.c-dependence.patch b/meta/recipes-devtools/python/python-pygtk/add-=
gtk-types.defs-into-gdk.c-dependence.patch<br>
deleted file mode 100644<br>
index df0f9cd..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk=
.c-dependence.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-Upstream-Status: Submitted<br>
-<br>
-add gtk-types.defs into gdk.c dependence<br>
-<br>
-gdk.c depends on gtk-types.defs but<br>
-gdk/Makefile.am miss this. This will cause<br>
-build error sometimes when built<br>
-with multi-jobbing, so add gtk-types.defs into<br>
-gdk.c dependence.<br>
-<br>
-Signed-off-by: Song.Li &lt;<a href=3D"mailto:Song.Li@windriver.com">Song.L=
i@windriver.com</a>&gt;<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- gtk/Makefile.am |=C2=A0 =C2=A0 2 +-<br>
- 1 files changed, 1 insertions(+), 1 deletions(-)<br>
-<br>
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am<br>
-index 7bb5d0c..4a88351 100644<br>
---- a/gtk/Makefile.am<br>
-+++ b/gtk/Makefile.am<br>
-@@ -214,7 +214,7 @@ gtkunixprint.defs: $(GTKUNIXPRINT_DEFS) Makefile<br>
- gtkunixprint-types.defs: $(GTKUNIXPRINT_TYPES_DEFS) Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CREATEDEFS) $@ $(GTKUNIXPRINT_TYPES_DEFS)<br>
-<br>
--gdk.c: gdk-types.defs gdk.defs $(GDK_OVERRIDES)<br>
-+gdk.c: gdk-types.defs gtk-types.defs gdk.defs $(GDK_OVERRIDES)<br>
- gtk.c: gdk-types.defs gtk-types.defs gtk.defs gdk-types.defs $(GTK_OVERRI=
DES)<br>
- _gtk_la_CFLAGS =3D $(PYCAIRO_CFLAGS) $(GTK_CFLAGS)<br>
- _gtk_la_LDFLAGS =3D $(common_ldflags) -export-symbols-regex init_gtk<br>
---<br>
-1.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.pat=
ch b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch<br>
deleted file mode 100644<br>
index 16c0e8e..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@li=
nux.intel.com</a>&gt;<br>
-<br>
-Index: pygtk-2.24.0/gtk/gtkunixprint.override<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- pygtk-2.24.0.orig/gtk/gtkunixprint.override<br>
-+++ pygtk-2.24.0/gtk/gtkunixprint.override<br>
-@@ -102,11 +102,6 @@ _wrap_gtk_print_job_get_surface(PyGObjec<br>
-=C2=A0 =C2=A0 =C2=A0if (pyg_error_check(&amp;error))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
--#if PYCAIRO_VERSION_HEX &gt;=3D 0x1010600<br>
--=C2=A0 =C2=A0 return PycairoSurface_FromSurface(cairo_surface_reference(s=
urface), NULL);<br>
--#else<br>
--=C2=A0 =C2=A0 return PycairoSurface_FromSurface(cairo_surface_reference(s=
urface), NULL, NULL);<br>
--#endif<br>
- }<br>
- %%<br>
- override gtk_print_job_send kwargs<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.pat=
ch b/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch<br>
deleted file mode 100644<br>
index b6156540..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: pygtk-2.24.0/<a href=3D"http://pygtk-2.0.pc.in" rel=3D"noreferrer" =
target=3D"_blank">pygtk-2.0.pc.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- pygtk-2.24.0.orig/<a href=3D"http://pygtk-2.0.pc.in" rel=3D"noreferrer=
" target=3D"_blank">pygtk-2.0.pc.in</a><br>
-+++ pygtk-2.24.0/<a href=3D"http://pygtk-2.0.pc.in" rel=3D"noreferrer" tar=
get=3D"_blank">pygtk-2.0.pc.in</a><br>
-@@ -1,5 +1,6 @@<br>
- prefix=3D@prefix@<br>
- exec_prefix=3D@exec_prefix@<br>
-+libdir=3D@libdir@<br>
- includedir=3D@includedir@<br>
- datarootdir=3D@datarootdir@<br>
- datadir=3D@datadir@<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/nodocs.patch b/meta/=
recipes-devtools/python/python-pygtk/nodocs.patch<br>
deleted file mode 100644<br>
index f07309a..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/nodocs.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: pygtk-2.17.0/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- pygtk-2.17.0.orig/Makefile.am<br>
-+++ pygtk-2.17.0/Makefile.am<br>
-@@ -4,7 +4,7 @@ if BUILD_GTK<br>
-=C2=A0 =C2=A0GTK_SUBDIR =3D gtk<br>
- endif<br>
-<br>
--SUBDIRS =3D . $(GTK_SUBDIR) examples tests docs<br>
-+SUBDIRS =3D . $(GTK_SUBDIR) examples tests<br>
-<br>
- PLATFORM_VERSION =3D 2.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_displ=
ay_during_import.patch b/meta/recipes-devtools/python/python-pygtk/prevent_=
to_get_display_during_import.patch<br>
deleted file mode 100644<br>
index 833038e..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_duri=
ng_import.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Index: pygtk-2.10.4/gtk/__init__.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- pygtk-2.10.4.orig/gtk/__init__.py=C2=A0 2007-11-27 19:27:05.000000000 =
-0300<br>
-+++ pygtk-2.10.4/gtk/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A02007-11-27 19:2=
8:22.000000000 -0300<br>
-@@ -78,7 +78,8 @@<br>
-<br>
- keysyms =3D LazyModule(&#39;keysyms&#39;, locals())<br>
-<br>
--_init()<br>
-+if not hasattr(sys.modules[&#39;__main__&#39;], &#39;python_launcher_enab=
led&#39;):<br>
-+=C2=A0 =C2=A0 _init()<br>
-<br>
- # CAPI<br>
- _PyGtk_API =3D _gtk._PyGtk_API<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acincl=
ude.m4 b/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.=
m4<br>
deleted file mode 100644<br>
index 53518fb..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4<=
br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-## this one is commonly used with AM_PATH_PYTHONDIR ...<br>
-dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUN=
D]]])<br>
-dnl Check if a module containing a given symbol is visible to python.<br>
-AC_DEFUN(AM_CHECK_PYMOD,<br>
-[AC_REQUIRE([AM_PATH_PYTHON])<br>
-py_mod_var=3D`echo $1[&#39;_&#39;]$2 | sed &#39;y%./+-%__p_%&#39;`<br>
-AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)<br>
-AC_CACHE_VAL(py_cv_mod_$py_mod_var, [<br>
-ifelse([$2],[], [prog=3D&quot;<br>
-import sys<br>
-try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import $1<br>
-except ImportError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
-except:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(0)<br>
-sys.exit(0)&quot;], [prog=3D&quot;<br>
-import $1<br>
-$1.$2&quot;])<br>
-if $PYTHON -c &quot;$prog&quot; 1&gt;&amp;AC_FD_CC 2&gt;&amp;AC_FD_CC<br>
-=C2=A0 then<br>
-=C2=A0 =C2=A0 eval &quot;py_cv_mod_$py_mod_var=3Dyes&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 eval &quot;py_cv_mod_$py_mod_var=3Dno&quot;<br>
-=C2=A0 fi<br>
-])<br>
-py_val=3D`eval &quot;echo \`echo &#39;$py_cv_mod_&#39;$py_mod_var\`&quot;`=
<br>
-if test &quot;x$py_val&quot; !=3D xno; then<br>
-=C2=A0 AC_MSG_RESULT(yes)<br>
-=C2=A0 ifelse([$3], [],, [$3<br>
-])dnl<br>
-else<br>
-=C2=A0 AC_MSG_RESULT(no)<br>
-=C2=A0 ifelse([$4], [],, [$4<br>
-])dnl<br>
-fi<br>
-])<br>
-<br>
-dnl a macro to check for ability to create python extensions<br>
-dnl=C2=A0 AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POS=
SIBLE])<br>
-dnl function also defines PYTHON_INCLUDES<br>
-AC_DEFUN([AM_CHECK_PYTHON_HEADERS],<br>
-[AC_REQUIRE([AM_PATH_PYTHON])<br>
-AC_MSG_CHECKING(for headers required to compile python extensions)<br>
-dnl deduce PYTHON_INCLUDES<br>
-AC_ARG_WITH(python-includes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[=C2=A0 --with-python-includes=3DDIR=C2=A0 path=
 to Python includes], py_exec_prefix=3D$withval)<br>
-if test x$py_exec_prefix !=3D x; then<br>
-PYTHON_INCLUDES=3D&quot;-I${py_exec_prefix}/include/python${PYTHON_VERSION=
}&quot;<br>
-else<br>
-py_prefix=3D`$PYTHON -c &quot;import sys; print sys.prefix&quot;`<br>
-py_exec_prefix=3D`$PYTHON -c &quot;import sys; print sys.exec_prefix&quot;=
`<br>
-PYTHON_INCLUDES=3D&quot;-I${py_prefix}/include/python${PYTHON_VERSION}&quo=
t;<br>
-if test &quot;$py_prefix&quot; !=3D &quot;$py_exec_prefix&quot;; then<br>
-=C2=A0 PYTHON_INCLUDES=3D&quot;$PYTHON_INCLUDES -I${py_exec_prefix}/includ=
e/python${PYTHON_VERSION}&quot;<br>
-fi<br>
-fi<br>
-AC_SUBST(PYTHON_INCLUDES)<br>
-dnl check if the headers exist:<br>
-save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
-CPPFLAGS=3D&quot;$CPPFLAGS $PYTHON_INCLUDES&quot;<br>
-AC_TRY_CPP([#include &lt;Python.h&gt;],dnl<br>
-[AC_MSG_RESULT(found)<br>
-$1],dnl<br>
-[AC_MSG_RESULT(not found)<br>
-$2])<br>
-CPPFLAGS=3D&quot;$save_CPPFLAGS&quot;<br>
-])<br>
-<br>
-dnl<br>
-dnl JH_ADD_CFLAG(FLAG)<br>
-dnl checks whether the C compiler supports the given flag, and if so, adds=
<br>
-dnl it to $CFLAGS.=C2=A0 If the flag is already present in the list, then =
the<br>
-dnl check is not performed.<br>
-AC_DEFUN([JH_ADD_CFLAG],<br>
-[<br>
-case &quot; $CFLAGS &quot; in<br>
-*@&lt;:@\ \ @:&gt;@$1@&lt;:@\=C2=A0 =C2=A0\ @:&gt;@*)<br>
-=C2=A0 ;;<br>
-*)<br>
-=C2=A0 save_CFLAGS=3D&quot;$CFLAGS&quot;<br>
-=C2=A0 CFLAGS=3D&quot;$CFLAGS $1&quot;<br>
-=C2=A0 AC_MSG_CHECKING([whether [$]CC understands $1])<br>
-=C2=A0 AC_TRY_COMPILE([], [], [jh_has_option=3Dyes], [jh_has_option=3Dno])=
<br>
-=C2=A0 AC_MSG_RESULT($jh_has_option)<br>
-=C2=A0 if test $jh_has_option =3D no; then<br>
-=C2=A0 =C2=A0 CFLAGS=3D&quot;$save_CFLAGS&quot;<br>
-=C2=A0 fi<br>
-=C2=A0 ;;<br>
-esac])<br>
diff --git a/meta/recipes-devtools/python/python-pygtk/update-dependences-o=
f-defs.c.patch b/meta/recipes-devtools/python/python-pygtk/update-dependenc=
es-of-defs.c.patch<br>
deleted file mode 100644<br>
index 3ed954e..0000000<br>
--- a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.=
c.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From dc024e9079bbffbb44436ba3e70a758ebad5520f Mon Sep 17 00:00:00 2001<br>
-From: &quot;Song.Li&quot; &lt;<a href=3D"mailto:Song.Li@windriver.com">Son=
g.Li@windriver.com</a>&gt;<br>
-Date: Sat, 5 Jan 2013 14:55:59 +0800<br>
-Subject: [PATCH] update dependences of defs.c in Makefile.am<br>
-<br>
-In gtk/Makefile.am, defs.c should dependes on gdk-types.defs and<br>
-gtk-types.defs, otherwise it fails occasionally when parallel compile.<br>
-The error message:<br>
-&quot;IOError: [Errno 2] No such file or directory: &#39;gtk-types.defs&#3=
9;&quot;<br>
-<br>
-Add them to dependences of defs.c to fix this issue.<br>
-<br>
-Upstream-Status: Submitted<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D702706" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D702=
706</a><br>
-<br>
-Signed-off-by: Song.Li &lt;<a href=3D"mailto:Song.Li@windriver.com">Song.L=
i@windriver.com</a>&gt;<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
-<br>
----<br>
- gtk/Makefile.am |=C2=A0 =C2=A0 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am<br>
-index 7bb5d0c..91826cb 100644<br>
---- a/gtk/Makefile.am<br>
-+++ b/gtk/Makefile.am<br>
-@@ -289,7 +289,7 @@ if HAVE_GIO_TYPES_DEFS<br>
- extra_codegen_args +=3D --register $(PYGOBJECT_DEFSDIR)/gio-types.defs<br=
>
- endif<br>
-<br>
--.defs.c:<br>
-+.defs.c: gdk-types.defs gtk-types.defs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0($(PYTHON) $(CODEGENDIR)/codegen.py \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYGTK_CODEGEN_DEFINES) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I $(srcdir) \<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-pygtk_2.=
24.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pygtk_2.24.0.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python-pygtk_2.24.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python-pygtk_2.24.0.bb</a><br>
deleted file mode 100644<br>
index 79b3110..0000000<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python-pygtk_2.24.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python-pygtk_2.24.0.bb</a><br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-SUMMARY =3D &quot;Python bindings for the GTK+ UI toolkit&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-# needs gtk+ 2.17.x<br>
-DEPENDS =3D &quot;gtk+ libglade python-pycairo python-pygobject&quot;<br>
-RDEPENDS_${PN} =3D &quot;python-shell python-pycairo python-pygobject&quot=
;<br>
-PROVIDES =3D &quot;python-pygtk2&quot;<br>
-SRCNAME =3D &quot;pygtk&quot;<br>
-LICENSE =3D &quot;LGPLv2.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da916467b91076e631dd8edb742=
4769c7&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2=
.24/${SRCNAME}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ftp://ft=
p.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-gtk-types.defs-into-gd=
k.c-dependence.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-gtkunixprint.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://prevent_to_get_display_dur=
ing_import.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nodocs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-pygtk-2.0.pc.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://acinclude.m4 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://update-dependences-of-defs=
.c.patch&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;a1051d5794fd7696d3c1af6422d17a49&quot;<br>
-SRC_URI[sha256sum] =3D &quot;cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e=
0f82c896e649f206912&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-docs --with-python-includes=3D${STAGING_I=
NCDIR}/../&quot;<br>
-<br>
-inherit autotools pkgconfig distutils-base distro_features_check<br>
-<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
-<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:&#39;`$PKG_CON=
FIG --variable defsdir pygobject-2.0`&#39;:\&quot;${STAGING_DATADIR}/pygobj=
ect/2.0/defs\&quot;:g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:&#39;`$PKG_CON=
FIG --variable=3Dpygtkincludedir pygobject-2.0`&#39;:\&quot;${STAGING_INCDI=
R}/pygtk-2.0\&quot;:g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:&#39;`$PKG_CON=
FIG --variable=3Ddatadir pygobject-2.0`&#39;:\&quot;${STAGING_DATADIR}\&quo=
t;:g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:&#39;`$PKG_CON=
FIG --variable codegendir pygobject-2.0`&#39;:\&quot;${STAGING_DATADIR}/pyg=
object/2.0/codegen\&quot;:g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:&#39;`$PKG_CON=
FIG --variable=3Dfixxref pygobject-2.0`&#39;:\&quot;${STAGING_DATADIR}/pygo=
bject/xsl/fixxref.py\&quot;:g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/<a href=3D"htt=
p://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
-}<br>
-<br>
-# dirty fix #2: fix build system paths leaking in<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s|^#!.*python|#!/usr/bin/env py=
thon|&#39; ${D}${bindir}/pygtk-demo<br>
-}<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-demo&quot;<br>
-FILES_${PN}-demo =3D &quot; ${bindir}/pygtk-demo ${libdir}/pygtk &quot;<br=
>
-RDEPENDS_${PN}-demo =3D &quot;python-pygtk python-stringold python-lang&qu=
ot;<br>
-<br>
-# todo: revamp packaging, package demo seperatly<br>
-FILES_${PN}-dev +=3D &quot; ${libdir}/pygtk/2.0 ${bindir}/pygtk-* ${datadi=
r}/pygtk/2.0&quot;<br>
-<br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1143b40c4be1b805242f7cb9--
