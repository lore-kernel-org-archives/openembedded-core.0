Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 21DE5601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 20:08:05 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l188so6521545lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cxTsFtzVVGnuR6vUoAvMYg/YlGWP4CgbGFqyJP7VxME=;
	b=AXdk49qNC/XTPLQTggLqjYe8Dn158s0jAeM33oQxesHX/6LfkEsgsOXEk4aPe+oYZg
	FLDwE8q637KRdmagIeBhynSBPZRJvI469g/V8hdzj3dRI0nmhk0R9nb+y/6Tag/nXk1W
	Ar2kDRpzW/io4pSk19XlccZBQhpGdsu8gV/L1OTSiPu62P4SK/Elf87aCNaCxAIbsJXi
	6ywoBQzzw2z9yvtKH/nM+WgLNXjjind4sEcsyObWDZdVG25gkBnnwqTl5UlqLu1CD+uo
	OVC6CX4mUDRQ3MsQNRD1qf9DEqJ/5jYFMv/y6UDwheUf+uKswf7DqXvfkceym+BhgzDp
	/35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cxTsFtzVVGnuR6vUoAvMYg/YlGWP4CgbGFqyJP7VxME=;
	b=Uq6eS6OLZaeXH0brdZsE9ZyZkxj/pPSa3m6B0ncpN02GN+yegfrZ+Y1jEIGnSMxQBz
	+iB2hn9FqUrk7tJpT/vWah0w8xZnMs5TVM8B3b6AKxIPC/gExygnGgFcreAqiStorvlR
	1VKWLn0XADZRbhx9+BpPrZGXEVBsLTl+uSj5nhlXV/cr4+hHUhP56Sd0IO+JsiVbNCCv
	8t2v0wAbdGZQXhWnGYgPlQBOG3hbHe9/xxY2YAuqPUywltnr9gcelWJj/jLsZnrrVht+
	gzKNE1EGx1bO3ufUeFERQSpqU6FX1rejAyj6ZWVJxAI1qYRNWUnYQqYnXJOb1REqrB0O
	rIFg==
X-Gm-Message-State: ALyK8tJnbecyjSuHC2ZIs4CmZE82DY6P2h0PR+sRopymVwbLRlYWWqrSKiEdneK8Ktka6TDIe8qU2SRSZ6ABHA==
X-Received: by 10.25.153.148 with SMTP id b142mr5075912lfe.61.1466453284833;
	Mon, 20 Jun 2016 13:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.208.199 with HTTP; Mon, 20 Jun 2016 13:08:04 -0700 (PDT)
In-Reply-To: <81de01080e7d3180df7badba586f16c87160c893.1465288175.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
	<7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
	<81de01080e7d3180df7badba586f16c87160c893.1465288175.git.jussi.kukkonen@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Jun 2016 22:08:04 +0200
Message-ID: <CA+chaQcUOqPCx76Y3rvv-GMsDgMeb7rAnKQM3Ackz+k1As-o7Q@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 29/37] sysprof: Upgrade to git version slightly past 3.20
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
X-List-Received-Date: Mon, 20 Jun 2016 20:08:08 -0000
Content-Type: multipart/alternative; boundary=001a1140176c1f50800535bb4362

--001a1140176c1f50800535bb4362
Content-Type: text/plain; charset=UTF-8

This upgrade seems to cause following issues:

sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/directories were
installed but not shipped in any package:
  /lib
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system-services
  /usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf
  /usr/share/dbus-1/system-services/org.gnome.Sysprof2.service
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/sysprof2.service
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
sysprof: 9 installed and not shipped files. [installed-vs-shipped]
sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it
isn't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG?
[build-deps]

On Tue, Jun 7, 2016 at 10:47 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> New version uses Gtk+3.
>
> 3.20 release requires a bunch of fixes to build without polkit,
> this git revision inclues those fixes.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../sysprof/files/0001-Avoid-building-docs.patch   | 42
> ++++++++++++++++++++++
>  .../0001-Disable-check-for-polkit-for-UI.patch     | 32 +++++++++++++++++
>  .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |  4 +--
>  .../sysprof/files/gui-argument.patch               | 35 ------------------
>  meta/recipes-kernel/sysprof/files/rmb-arm.patch    | 21 -----------
>  meta/recipes-kernel/sysprof/files/rmb-mips.patch   | 22 ------------
>  meta/recipes-kernel/sysprof/sysprof_git.bb         | 32 +++++++++--------
>  7 files changed, 93 insertions(+), 95 deletions(-)
>  create mode 100644
> meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
>  create mode 100644
> meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
>  delete mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
>  delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-arm.patch
>  delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-mips.patch
>
> diff --git
> a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> new file mode 100644
> index 0000000..202f354
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> @@ -0,0 +1,42 @@
> +From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 4 May 2016 14:58:24 +0300
> +Subject: [PATCH] Avoid building docs
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + Makefile.am | 2 +-
> + m4/yelp.m4  | 6 ------
> + 2 files changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index b919a3f..3a3851d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,4 +1,4 @@
> +-SUBDIRS = daemon data help lib po src tools tests
> ++SUBDIRS = daemon data lib po src tools tests
> +
> + EXTRA_DIST = AUTHORS tap-test COPYING.gpl-2
> +
> +diff --git a/m4/yelp.m4 b/m4/yelp.m4
> +index 5db847f..1b6ede4 100644
> +--- a/m4/yelp.m4
> ++++ b/m4/yelp.m4
> +@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
> + HELP_DIR="$with_help_dir"
> + AC_SUBST(HELP_DIR)
> +
> +-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
> +-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
> +-if test x"$ITSTOOL" = x; then
> +-  AC_MSG_ERROR([itstool not found])
> +-fi
> +-
> + AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
> + AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
> + if test x"$XMLLINT" = x; then
> +--
> +2.1.4
> +
> diff --git
> a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
> b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
> new file mode 100644
> index 0000000..6085232
> --- /dev/null
> +++
> b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
> @@ -0,0 +1,32 @@
> +From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 4 May 2016 10:59:36 +0300
> +Subject: [PATCH] Disable check for polkit for UI
> +
> +The check is not technically required: sysprof just needs
> +to be able to access system perf counters at runtime.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8559597..ecf93ad 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -131,8 +131,8 @@ AS_IF([test "$enable_gtk" = auto],[
> +       AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" =
> "yes"],[enable_gtk=yes],[enable_gtk=no])
> + ])
> + AS_IF([test "$enable_gtk" = "yes"],[
> +-      AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" =
> "yes"],[],[
> +-              AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >=
> gtk_required_version and polkit-gobject-1])
> ++      AS_IF([test "$have_gtk" = "yes"],[],[
> ++              AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >=
> gtk_required_version])
> +       ])
> + ])
> + AM_CONDITIONAL(ENABLE_GTK, test "$enable_gtk" = "yes")
> +--
> +2.8.1
> +
> diff --git
> a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> index dcc2cbe..f75ddad 100644
> --- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> +++ b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> @@ -7,8 +7,8 @@ Upstream-Status: Pending
>
>  Index: git/elfparser.h
>  ===================================================================
> ---- git.orig/elfparser.h       2011-07-16 18:57:41.000000000 -0700
> -+++ git/elfparser.h    2011-07-16 20:28:54.733829895 -0700
> +--- git.orig/lib/util/elfparser.h      2011-07-16 18:57:41.000000000 -0700
> ++++ git/lib/util/elfparser.h   2011-07-16 20:28:54.733829895 -0700
>  @@ -17,6 +17,10 @@
>    */
>   #include <glib.h>
> diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch
> b/meta/recipes-kernel/sysprof/files/gui-argument.patch
> deleted file mode 100644
> index d2c053e..0000000
> --- a/meta/recipes-kernel/sysprof/files/gui-argument.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Add the ability to explicitly enable/disable GUI support
> -
> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-Status: Pending
> -
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> -@@ -62,12 +62,24 @@ KMICRO=`uname -r | cut -d"." -f 3 | cut
> - # Pkgconfig dependencies
> -
> - core_dep="glib-2.0 >= 2.6.0"
> --gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
> -
> - PKG_CHECK_MODULES(CORE_DEP, $core_dep, [], AC_MSG_ERROR([sysprof
> dependencies not satisfied]))
> -
> --build_gui=yes
> --PKG_CHECK_MODULES(GUI_DEP, $gui_dep, [], build_gui=no)
> -+gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
> -+
> -+AC_ARG_ENABLE([gui],
> -+  [AS_HELP_STRING([--disable-gui],
> -+    [Disable GUI functionality (requires gtk+, gdk-pixbuf, pangoft2,
> libglade) @<:@default=auto@:>@])],
> -+  [],
> -+  [enable_gui=auto])
> -+
> -+build_gui=no
> -+AS_IF([test "x$enable_gui" != xno],
> -+  [PKG_CHECK_MODULES(GUI_DEP, $gui_dep, build_gui=yes,
> -+    [if test "x$enable_gui" != xauto; then
> -+       AC_MSG_FAILURE(
> -+         [--enable-gui was given, but gui dependencies were not
> satisfied])
> -+     fi])])
> -
> - AM_CONDITIONAL([BUILD_GUI], [test "$build_gui" = yes])
> -
> diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
> b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
> deleted file mode 100644
> index c53ac64..0000000
> --- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -
> -Upstream-Status: Pending
> -
> -Index: git/util.h
> -===================================================================
> ---- git.orig/util.h    2010-12-07 22:41:57.156243001 -0600
> -+++ git/util.h 2010-12-07 22:43:47.616243002 -0600
> -@@ -37,4 +37,13 @@
> - #define cpu_relax()     asm volatile("" ::: "memory");
> - #endif
> -
> -+#ifdef __arm__
> -+/*
> -+ * Use the __kuser_memory_barrier helper in the CPU helper page. See
> -+ * arch/arm/kernel/entry-armv.S in the kernel source for details.
> -+ */
> -+#define rmb()         ((void(*)(void))0xffff0fa0)()
> -+#define cpu_relax()   asm volatile("":::"memory")
> -+#endif
> -+
> - #endif
> diff --git a/meta/recipes-kernel/sysprof/files/rmb-mips.patch
> b/meta/recipes-kernel/sysprof/files/rmb-mips.patch
> deleted file mode 100644
> index e055b8a..0000000
> --- a/meta/recipes-kernel/sysprof/files/rmb-mips.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: git/util.h
> -===================================================================
> ---- git.orig/util.h    2010-12-08 01:22:44.486243001 -0600
> -+++ git/util.h 2010-12-08 01:23:27.836243001 -0600
> -@@ -37,4 +37,15 @@
> - #define cpu_relax()     asm volatile("" ::: "memory");
> - #endif
> -
> -+#ifdef __mips__
> -+#define rmb()         asm volatile(                                   \
> -+                              ".set   mips2\n\t"                      \
> -+                              "sync\n\t"                              \
> -+                              ".set   mips0"                          \
> -+                              : /* no output */                       \
> -+                              : /* no input */                        \
> -+                              : "memory")
> -+#define cpu_relax()   asm volatile("" ::: "memory")
> -+#endif
> -+
> - #endif
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb
> b/meta/recipes-kernel/sysprof/sysprof_git.bb
> index 84c6aad..3b06e6f 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -1,29 +1,31 @@
>  SUMMARY = "System-wide Performance Profiler for Linux"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +
> file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
> +
> +inherit gnomebase gettext
>
>  DEPENDS = "glib-2.0"
>
> -SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
> -PV = "1.2.0+git${SRCPV}"
> +S = "${WORKDIR}/git"
> +SRCREV = "9c6cec9b49766bf77c1713bc5a7c6d651e628068"
> +PV = "3.20.0+git${SRCPV}"
>
>  SRC_URI = "git://git.gnome.org/sysprof \
>             file://define-NT_GNU_BUILD_ID.patch \
> -           file://gui-argument.patch \
> +           file://0001-Disable-check-for-polkit-for-UI.patch \
> +           file://0001-Avoid-building-docs.patch \
>            "
> +SRC_URI[archive.md5sum] = "d56e8492033b60e247634731e7f760b9"
> +SRC_URI[archive.sha256sum] =
> "4a338ad41bfffae87ef281f6e75c9660b3e0c6671bf5233be0c3f55a5e5b1ce5"
>
> -SRC_URI_append_arm  = " file://rmb-arm.patch"
> -SRC_URI_append_armeb  = " file://rmb-arm.patch"
> -SRC_URI_append_mips = " file://rmb-mips.patch"
> -SRC_URI_append_mips64 = " file://rmb-mips.patch"
> -SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
> -
> -S = "${WORKDIR}/git"
> +AUTOTOOLS_AUXDIR = "${S}/build-aux"
>
> -inherit autotools pkgconfig
> +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES',
> '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> +PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
>
> -PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES',
> '${GTK2DISTROFEATURES}', 'gui', '', d)}"
> -PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango
> libglade"
> +FILES_${PN} += "${datadir}/icons/ ${libdir}"
> +FILES_${PN}-dev = "${prefix}/include"
>
>  # We do not yet work for aarch64.
>  #
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140176c1f50800535bb4362
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This upgrade seems to cause following issues:</div><d=
iv><br></div><div>sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/dire=
ctories were installed but not shipped in any package:</div><div>=C2=A0 /li=
b</div><div>=C2=A0 /usr/share/dbus-1</div><div>=C2=A0 /usr/share/dbus-1/sys=
tem.d</div><div>=C2=A0 /usr/share/dbus-1/system-services</div><div>=C2=A0 /=
usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf</div><div>=C2=A0 /usr/sha=
re/dbus-1/system-services/org.gnome.Sysprof2.service</div><div>=C2=A0 /lib/=
systemd</div><div>=C2=A0 /lib/systemd/system</div><div>=C2=A0 /lib/systemd/=
system/sysprof2.service</div><div>Please set FILES such that these items ar=
e packaged. Alternatively if they are unneeded, avoid installing them or de=
lete them within do_install.</div><div>sysprof: 9 installed and not shipped=
 files. [installed-vs-shipped]</div><div>sysprof-3.20.0+gitAUTOINC+9c6cec9b=
49: sysprof rdepends on polkit, but it isn&#39;t a build dependency, missin=
g polkit in DEPENDS or PACKAGECONFIG? [build-deps]</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 7, 2016 at 10:47 A=
M, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">New version uses Gtk+3.<br>
<br>
3.20 release requires a bunch of fixes to build without polkit,<br>
this git revision inclues those fixes.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../sysprof/files/0001-Avoid-building-docs.patch=C2=A0 =C2=A0| 42 +++=
+++++++++++++++++++<br>
=C2=A0.../0001-Disable-check-for-polkit-for-UI.patch=C2=A0 =C2=A0 =C2=A0| 3=
2 +++++++++++++++++<br>
=C2=A0.../sysprof/files/define-NT_GNU_BUILD_ID.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +--<br>
=C2=A0.../sysprof/files/gui-argument.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 35 ------------------<br>
=C2=A0meta/recipes-kernel/sysprof/files/rmb-arm.patch=C2=A0 =C2=A0 | 21 ---=
--------<br>
=C2=A0meta/recipes-kernel/sysprof/files/rmb-mips.patch=C2=A0 =C2=A0| 22 ---=
---------<br>
=C2=A0meta/recipes-kernel/sysprof/<a href=3D"http://sysprof_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sysprof_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 32 +++++++++--------<br>
=C2=A07 files changed, 93 insertions(+), 95 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-build=
ing-docs.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-che=
ck-for-polkit-for-UI.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-arm.patch<br=
>
=C2=A0delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-mips.patch<b=
r>
<br>
diff --git a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.pat=
ch b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch<br>
new file mode 100644<br>
index 0000000..202f354<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch<br>
@@ -0,0 +1,42 @@<br>
+From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Wed, 4 May 2016 14:58:24 +0300<br>
+Subject: [PATCH] Avoid building docs<br>
+<br>
+Upstream-Status: Inappropriate<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ Makefile.am | 2 +-<br>
+ m4/yelp.m4=C2=A0 | 6 ------<br>
+ 2 files changed, 1 insertion(+), 7 deletions(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index b919a3f..3a3851d 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -1,4 +1,4 @@<br>
+-SUBDIRS =3D daemon data help lib po src tools tests<br>
++SUBDIRS =3D daemon data lib po src tools tests<br>
+<br>
+ EXTRA_DIST =3D AUTHORS tap-test COPYING.gpl-2<br>
+<br>
+diff --git a/m4/yelp.m4 b/m4/yelp.m4<br>
+index 5db847f..1b6ede4 100644<br>
+--- a/m4/yelp.m4<br>
++++ b/m4/yelp.m4<br>
+@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],<br>
+ HELP_DIR=3D&quot;$with_help_dir&quot;<br>
+ AC_SUBST(HELP_DIR)<br>
+<br>
+-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])<br>
+-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])<br>
+-if test x&quot;$ITSTOOL&quot; =3D x; then<br>
+-=C2=A0 AC_MSG_ERROR([itstool not found])<br>
+-fi<br>
+-<br>
+ AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])<br>
+ AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])<br>
+ if test x&quot;$XMLLINT&quot; =3D x; then<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polki=
t-for-UI.patch b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-p=
olkit-for-UI.patch<br>
new file mode 100644<br>
index 0000000..6085232<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-U=
I.patch<br>
@@ -0,0 +1,32 @@<br>
+From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Wed, 4 May 2016 10:59:36 +0300<br>
+Subject: [PATCH] Disable check for polkit for UI<br>
+<br>
+The check is not technically required: sysprof just needs<br>
+to be able to access system perf counters at runtime.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 8559597..ecf93ad 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -131,8 +131,8 @@ AS_IF([test &quot;$enable_gtk&quot; =3D auto],[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AS_IF([test &quot;$have_gtk&quot; =3D &quot;yes=
&quot; &amp;&amp; test &quot;$have_polkit&quot; =3D &quot;yes&quot;],[enabl=
e_gtk=3Dyes],[enable_gtk=3Dno])<br>
+ ])<br>
+ AS_IF([test &quot;$enable_gtk&quot; =3D &quot;yes&quot;],[<br>
+-=C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;$have_gtk&quot; =3D &quot;yes&quot=
; &amp;&amp; test &quot;$have_polkit&quot; =3D &quot;yes&quot;],[],[<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([--enable-g=
tk requires gtk+-3.0 &gt;=3D gtk_required_version and polkit-gobject-1])<br=
>
++=C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;$have_gtk&quot; =3D &quot;yes&quot=
;],[],[<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([--enable-g=
tk requires gtk+-3.0 &gt;=3D gtk_required_version])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
+ ])<br>
+ AM_CONDITIONAL(ENABLE_GTK, test &quot;$enable_gtk&quot; =3D &quot;yes&quo=
t;)<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch=
 b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch<br>
index dcc2cbe..f75ddad 100644<br>
--- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch<br>
+++ b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch<br>
@@ -7,8 +7,8 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Index: git/elfparser.h<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/elfparser.h=C2=A0 =C2=A0 =C2=A0 =C2=A02011-07-16 18:57:41.000=
000000 -0700<br>
-+++ git/elfparser.h=C2=A0 =C2=A0 2011-07-16 20:28:54.733829895 -0700<br>
+--- git.orig/lib/util/elfparser.h=C2=A0 =C2=A0 =C2=A0 2011-07-16 18:57:41.=
000000000 -0700<br>
++++ git/lib/util/elfparser.h=C2=A0 =C2=A02011-07-16 20:28:54.733829895 -07=
00<br>
=C2=A0@@ -17,6 +17,10 @@<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 #include &lt;glib.h&gt;<br>
diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch b/meta/re=
cipes-kernel/sysprof/files/gui-argument.patch<br>
deleted file mode 100644<br>
index d2c053e..0000000<br>
--- a/meta/recipes-kernel/sysprof/files/gui-argument.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-Add the ability to explicitly enable/disable GUI support<br>
-<br>
-Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
-Upstream-Status: Pending<br>
-<br>
---- git.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a><br>
-+++ git/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blan=
k">configure.ac</a><br>
-@@ -62,12 +62,24 @@ KMICRO=3D`uname -r | cut -d&quot;.&quot; -f 3 | cut<br=
>
- # Pkgconfig dependencies<br>
-<br>
- core_dep=3D&quot;glib-2.0 &gt;=3D 2.6.0&quot;<br>
--gui_dep=3D&quot;gtk+-2.0 &gt; 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0&=
quot;<br>
-<br>
- PKG_CHECK_MODULES(CORE_DEP, $core_dep, [], AC_MSG_ERROR([sysprof dependen=
cies not satisfied]))<br>
-<br>
--build_gui=3Dyes<br>
--PKG_CHECK_MODULES(GUI_DEP, $gui_dep, [], build_gui=3Dno)<br>
-+gui_dep=3D&quot;gtk+-2.0 &gt; 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0&=
quot;<br>
-+<br>
-+AC_ARG_ENABLE([gui],<br>
-+=C2=A0 [AS_HELP_STRING([--disable-gui],<br>
-+=C2=A0 =C2=A0 [Disable GUI functionality (requires gtk+, gdk-pixbuf, pang=
oft2, libglade) @&lt;:@default=3Dauto@:&gt;@])],<br>
-+=C2=A0 [],<br>
-+=C2=A0 [enable_gui=3Dauto])<br>
-+<br>
-+build_gui=3Dno<br>
-+AS_IF([test &quot;x$enable_gui&quot; !=3D xno],<br>
-+=C2=A0 [PKG_CHECK_MODULES(GUI_DEP, $gui_dep, build_gui=3Dyes,<br>
-+=C2=A0 =C2=A0 [if test &quot;x$enable_gui&quot; !=3D xauto; then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_FAILURE(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[--enable-gui was given, but gui depend=
encies were not satisfied])<br>
-+=C2=A0 =C2=A0 =C2=A0fi])])<br>
-<br>
- AM_CONDITIONAL([BUILD_GUI], [test &quot;$build_gui&quot; =3D yes])<br>
-<br>
diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch b/meta/recipes=
-kernel/sysprof/files/rmb-arm.patch<br>
deleted file mode 100644<br>
index c53ac64..0000000<br>
--- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch<br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Index: git/util.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/util.h=C2=A0 =C2=A0 2010-12-07 22:41:57.156243001 -0600<br>
-+++ git/util.h 2010-12-07 22:43:47.616243002 -0600<br>
-@@ -37,4 +37,13 @@<br>
- #define cpu_relax()=C2=A0 =C2=A0 =C2=A0asm volatile(&quot;&quot; ::: &quo=
t;memory&quot;);<br>
- #endif<br>
-<br>
-+#ifdef __arm__<br>
-+/*<br>
-+ * Use the __kuser_memory_barrier helper in the CPU helper page. See<br>
-+ * arch/arm/kernel/entry-armv.S in the kernel source for details.<br>
-+ */<br>
-+#define rmb()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((void(*)(void))0xffff0fa0=
)()<br>
-+#define cpu_relax()=C2=A0 =C2=A0asm volatile(&quot;&quot;:::&quot;memory&=
quot;)<br>
-+#endif<br>
-+<br>
- #endif<br>
diff --git a/meta/recipes-kernel/sysprof/files/rmb-mips.patch b/meta/recipe=
s-kernel/sysprof/files/rmb-mips.patch<br>
deleted file mode 100644<br>
index e055b8a..0000000<br>
--- a/meta/recipes-kernel/sysprof/files/rmb-mips.patch<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Index: git/util.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/util.h=C2=A0 =C2=A0 2010-12-08 01:22:44.486243001 -0600<br>
-+++ git/util.h 2010-12-08 01:23:27.836243001 -0600<br>
-@@ -37,4 +37,15 @@<br>
- #define cpu_relax()=C2=A0 =C2=A0 =C2=A0asm volatile(&quot;&quot; ::: &quo=
t;memory&quot;);<br>
- #endif<br>
-<br>
-+#ifdef __mips__<br>
-+#define rmb()=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile(=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.set=C2=A0 =C2=A0mips2\n\t&quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sync\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.set=C2=A0 =C2=A0mips0&quot;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : /* no output */=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : /* no input */=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;memory&quot;)<br>
-+#define cpu_relax()=C2=A0 =C2=A0asm volatile(&quot;&quot; ::: &quot;memor=
y&quot;)<br>
-+#endif<br>
-+<br>
- #endif<br>
diff --git a/meta/recipes-kernel/sysprof/<a href=3D"http://sysprof_git.bb" =
rel=3D"noreferrer" target=3D"_blank">sysprof_git.bb</a> b/meta/recipes-kern=
el/sysprof/<a href=3D"http://sysprof_git.bb" rel=3D"noreferrer" target=3D"_=
blank">sysprof_git.bb</a><br>
index 84c6aad..3b06e6f 100644<br>
--- a/meta/recipes-kernel/sysprof/<a href=3D"http://sysprof_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sysprof_git.bb</a><br>
+++ b/meta/recipes-kernel/sysprof/<a href=3D"http://sysprof_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sysprof_git.bb</a><br>
@@ -1,29 +1,31 @@<br>
=C2=A0SUMMARY =3D &quot;System-wide Performance Profiler for Linux&quot;<br=
>
-LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f&quot;<br>
+LICENSE =3D &quot;GPLv3+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/sp-application.c;endline=3D17;md5=3D40e55577ef122c88fe20052acda64875=
&quot;<br>
+<br>
+inherit gnomebase gettext<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
<br>
-SRCREV =3D &quot;cd44ee6644c3641507fb53b8a2a69137f2971219&quot;<br>
-PV =3D &quot;1.2.0+git${SRCPV}&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;9c6cec9b49766bf77c1713bc5a7c6d651e628068&quot;<br>
+PV =3D &quot;3.20.0+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.gnome.org/sysprof" rel=
=3D"noreferrer" target=3D"_blank">git.gnome.org/sysprof</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://define-NT_GNU_BUILD_ID.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gui-argument.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-check-for-pol=
kit-for-UI.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-building-docs.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;d56e8492033b60e247634731e7f760b9&quot;<b=
r>
+SRC_URI[archive.sha256sum] =3D &quot;4a338ad41bfffae87ef281f6e75c9660b3e0c=
6671bf5233be0c3f55a5e5b1ce5&quot;<br>
<br>
-SRC_URI_append_arm=C2=A0 =3D &quot; file://rmb-arm.patch&quot;<br>
-SRC_URI_append_armeb=C2=A0 =3D &quot; file://rmb-arm.patch&quot;<br>
-SRC_URI_append_mips =3D &quot; file://rmb-mips.patch&quot;<br>
-SRC_URI_append_mips64 =3D &quot; file://rmb-mips.patch&quot;<br>
-SRC_URI_append_mips64n32 =3D &quot; file://rmb-mips.patch&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+AUTOTOOLS_AUXDIR =3D &quot;${S}/build-aux&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+PACKAGECONFIG ?=3D &quot;${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39=
;, &#39;${GTK3DISTROFEATURES}&#39;, &#39;gtk&#39;, &#39;&#39;, d)}&quot;<br=
>
+PACKAGECONFIG[gtk] =3D &quot;--enable-gtk,--disable-gtk,gtk+3&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39=
;, &#39;${GTK2DISTROFEATURES}&#39;, &#39;gui&#39;, &#39;&#39;, d)}&quot;<br=
>
-PACKAGECONFIG[gui] =3D &quot;--enable-gui,--disable-gui,gtk+ gdk-pixbuf pa=
ngo libglade&quot;<br>
+FILES_${PN} +=3D &quot;${datadir}/icons/ ${libdir}&quot;<br>
+FILES_${PN}-dev =3D &quot;${prefix}/include&quot;<br>
<br>
=C2=A0# We do not yet work for aarch64.<br>
=C2=A0#<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
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
</font></span></blockquote></div><br></div>

--001a1140176c1f50800535bb4362--
