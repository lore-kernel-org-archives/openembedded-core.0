Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86539782F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:35:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 94so97269wri.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7/GL6iMOtNjK/zmJdbvPcH5PzJldBCwdy9KtP5ptpmk=;
	b=CtmQZwN+VAEZJfde8H2ZVcbrCE7PSvekQE6mQ48A5Yqnrnogwg26x+Q6AZ3ypN7VzZ
	yjcs1sh5xSRw2+sZsEKW2G74+5vlF8zF4q9sC6L+Kr1sG78N2DPhyCp1bx9XVJ0p1R+k
	u0s9JOIzMxBQrAn2x9rVsnt2AiUfvKaZSaJyKquT9i+uiURwBxcTNqYBigfgQiInO2bp
	73+R/9oGsbzY6foCRpzowjNYbyKqpqpsQ0z672Ev/C6mzfvwdAcG4tcFOEvXDpWkzybd
	0WDiA+Rsv4hu9AXW+rfdREA43QJPvGu+3Jo4IrlHW9jyEThXvO/9/y0Mmi2McEQ8DWL7
	lxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7/GL6iMOtNjK/zmJdbvPcH5PzJldBCwdy9KtP5ptpmk=;
	b=I3UA/0LCdDnBPFyLoDvMmFGJQJy+ARoAtgkCIjUTnw5DNVFNwWEIbHB3LHMx4z/11D
	17uAx2LifMmPh90vnPhPyOuyTFp3rKO8JkiuZAPitzJcjSsCF7QWBCl6ka0DP2B1ihEv
	OkeuwdumswG9ZZx3ZZ+z30zDGuGTolinEp5QEe9+x+0uMPOTFa5VKx6scF/AX9l5Upsr
	80B7cGrxbbomOurjrOXC1j7ne4YvSBGmNfdPlbei5vpWLYtr+/12DVCVkBMVytyuASfK
	Dh7IdQxybYMNfvjME1ulYV0uGGumtfxQXyS1PRELgOW8ztpkCaauFUTT40triF5ILloA
	+qZA==
X-Gm-Message-State: AHYfb5gj82ARdWMzZCMtRYTAm1ce0jQFLMEUqptbA52mP+N0OPc65Tgg
	nqQoBaqPilmlh1U+RZwOuovyBVxa2w==
X-Received: by 10.223.150.201 with SMTP id u67mr2052139wrb.67.1503509745919;
	Wed, 23 Aug 2017 10:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Wed, 23 Aug 2017 10:35:45 -0700 (PDT)
In-Reply-To: <9dd72f7d2ac352d71270250e2078907f3c9e0f94.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
	<9dd72f7d2ac352d71270250e2078907f3c9e0f94.1503507784.git.alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 Aug 2017 10:35:45 -0700
Message-ID: <CAJ86T=WxHev7q26Z+yus_9XCag9Aky2QLTfAA3sxU24PM3bL4w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] sysprof: convert to meson build
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
X-List-Received-Date: Wed, 23 Aug 2017 17:35:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 10:06 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Drop autotools-specific patches.
>
> Rename polkit packageconfig option to sysprofd as 'polkit' does not
> at all match what is happening.
>
> Remove --enable-compiler-warnings, as the equivalent in meson
> could not be found.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../sysprof/files/0001-Avoid-building-docs.patch   | 42 ----------------------
>  .../0001-Disable-check-for-polkit-for-UI.patch     | 32 -----------------
>  ...d-anything-in-help-as-it-requires-itstool.patch | 26 ++++++++++++++
>  ...igure-Add-option-to-enable-disable-polkit.patch | 41 ---------------------
>  ...-not-prepend-the-current-dir-path-to-util.patch | 30 ++++++++++++++++
>  meta/recipes-kernel/sysprof/sysprof_3.24.1.bb      | 22 ++++++------
>  6 files changed, 68 insertions(+), 125 deletions(-)
>  delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
>  delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
>  create mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>  delete mode 100644 meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
>  create mode 100644 meta/recipes-kernel/sysprof/files/0002-Do-not-prepend-the-current-dir-path-to-util.patch
>
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> deleted file mode 100644
> index 202f354d29c..00000000000
> --- a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Wed, 4 May 2016 14:58:24 +0300
> -Subject: [PATCH] Avoid building docs
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - Makefile.am | 2 +-
> - m4/yelp.m4  | 6 ------
> - 2 files changed, 1 insertion(+), 7 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index b919a3f..3a3851d 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,4 +1,4 @@
> --SUBDIRS = daemon data help lib po src tools tests
> -+SUBDIRS = daemon data lib po src tools tests
> -
> - EXTRA_DIST = AUTHORS tap-test COPYING.gpl-2
> -
> -diff --git a/m4/yelp.m4 b/m4/yelp.m4
> -index 5db847f..1b6ede4 100644
> ---- a/m4/yelp.m4
> -+++ b/m4/yelp.m4
> -@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
> - HELP_DIR="$with_help_dir"
> - AC_SUBST(HELP_DIR)
> -
> --AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
> --AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
> --if test x"$ITSTOOL" = x; then
> --  AC_MSG_ERROR([itstool not found])
> --fi
> --
> - AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
> - AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
> - if test x"$XMLLINT" = x; then
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
> deleted file mode 100644
> index 608523272ad..00000000000
> --- a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Wed, 4 May 2016 10:59:36 +0300
> -Subject: [PATCH] Disable check for polkit for UI
> -
> -The check is not technically required: sysprof just needs
> -to be able to access system perf counters at runtime.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 8559597..ecf93ad 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -131,8 +131,8 @@ AS_IF([test "$enable_gtk" = auto],[
> -       AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[enable_gtk=yes],[enable_gtk=no])
> - ])
> - AS_IF([test "$enable_gtk" = "yes"],[
> --      AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[],[
> --              AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version and polkit-gobject-1])
> -+      AS_IF([test "$have_gtk" = "yes"],[],[
> -+              AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version])
> -       ])
> - ])
> - AM_CONDITIONAL(ENABLE_GTK, test "$enable_gtk" = "yes")
> ---
> -2.8.1
> -
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> new file mode 100644
> index 00000000000..e28fdcad948
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> @@ -0,0 +1,26 @@
> +From c2495a4c042e6a675da69bab20cc3669391e8e2a Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 23 Aug 2017 18:38:26 +0300
> +Subject: [PATCH 1/2] Do not build anything in help/ as it requires itstool.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 4ac3934..8c4369a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -116,7 +116,6 @@ subdir('tools')
> + subdir('tests')
> +
> + subdir('data')
> +-subdir('help')
> + subdir('po')
> +
> + meson.add_install_script('build-aux/meson_post_install.sh')
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch b/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
> deleted file mode 100644
> index 158d9975f29..00000000000
> --- a/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 2b4005d72d3393933a7914be102ea65505c536cc Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Thu, 21 Jul 2016 11:53:31 +0300
> -Subject: [PATCH] configure: Add option to enable/disable polkit
> -
> -Changes the configure behaviour from autodetecting the polkit by default
> -to having an option to disable it explicitly
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ----
> - configure.ac | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 2246d5a..3d3fe0f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -104,10 +104,18 @@ PKG_CHECK_MODULES(GTK,
> -                   [gtk+-3.0 >= gtk_required_version],
> -                   [have_gtk=yes],
> -                   [have_gtk=no])
> -+AC_ARG_ENABLE([polkit],
> -+                   AS_HELP_STRING([--disable-polkit], [Do not use Polkit]),
> -+                   [enable_polkit="$enableval"], [enable_polkit="yes"])
> -+
> -+AS_IF([test "x$enable_polkit" = "xyes"], [
> - PKG_CHECK_MODULES(POLKIT,
> -                   [polkit-gobject-1],
> -                   [have_polkit=yes],
> -                   [have_polkit=no])
> -+                                         ])
> -+AM_CONDITIONAL([HAVE_POLKIT], [test "x$enable_polkit" = "xyes"])
> -+
> - PKG_CHECK_MODULES(SYSTEMD,
> -                   [libsystemd >= systemd_required_version],
> -                   [have_systemd=yes],
> ---
> -2.4.0
> -
> diff --git a/meta/recipes-kernel/sysprof/files/0002-Do-not-prepend-the-current-dir-path-to-util.patch b/meta/recipes-kernel/sysprof/files/0002-Do-not-prepend-the-current-dir-path-to-util.patch
> new file mode 100644
> index 00000000000..7243b74d5aa
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0002-Do-not-prepend-the-current-dir-path-to-util.patch
> @@ -0,0 +1,30 @@
> +From 3178f9a41b29d9c5284c205e42a150de638c731b Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 23 Aug 2017 18:39:02 +0300
> +Subject: [PATCH 2/2] Do not prepend the current dir path to util/
> +
> +This is unnecessary and causes failures in openembedded build environment.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + lib/meson.build | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/meson.build b/lib/meson.build
> +index b87b94d..a7e823b 100644
> +--- a/lib/meson.build
> ++++ b/lib/meson.build
> +@@ -23,8 +23,7 @@ libutil_deps = [
> + ]
> +
> + libutil_includes = [
> +-  # https://github.com/mesonbuild/meson/issues/974
> +-  join_paths(meson.current_source_dir(), 'util'),
> ++  'util',
> + ]
> +
> + libutil = static_library('util',
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
> index 168f2fdfba2..7c479b26aa8 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
> @@ -3,31 +3,33 @@ LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
>
> -inherit gnomebase gettext systemd upstream-version-is-even
> +inherit gnomebase-meson gettext systemd upstream-version-is-even
>
>  DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
>
>  SRC_URI += " \
>             file://define-NT_GNU_BUILD_ID.patch \
> -           file://0001-configure-Add-option-to-enable-disable-polkit.patch \
> -           file://0001-Disable-check-for-polkit-for-UI.patch \
> -           file://0001-Avoid-building-docs.patch \
> -          "
> +           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
> +           file://0002-Do-not-prepend-the-current-dir-path-to-util.patch \
> +           "
>  SRC_URI[archive.md5sum] = "2b44ae1d8cd899417294a9c4509d7870"
>  SRC_URI[archive.sha256sum] = "054eebe2afb6fe3c06ac8c46bc045c42f675d4fd64e6f16cbc602d5c7ce27bec"
>
>  AUTOTOOLS_AUXDIR = "${S}/build-aux"

Presumably this can be dropped?

> -EXTRA_OECONF = "--enable-compile-warnings"
> -
>  PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> -PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
> -PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
> +PACKAGECONFIG[gtk] = "-Denable-gtk=true,-Denable-gtk=false,gtk+3"
> +PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
>
>  SOLIBS = ".so"
>  FILES_SOLIBSDEV = ""
>
> -SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
> +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
>
>  # We do not yet work for aarch64.
>  COMPATIBLE_HOST = "^(?!aarch64).*"
> +
> +FILES_${PN} += " \
> +               ${datadir}/dbus-1/system-services \
> +               ${datadir}/dbus-1/system.d \
> +               "
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

