Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11712.1588449249800830461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 12:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cQaqTB05;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id u127so4116740wmg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0q8sjOka/8JVE0d1+i6D+fsXpYiyssGnLrz+7WuW9P8=;
        b=cQaqTB05CZDrcJ9sozpjWwv5MBpw8MA3aIBnd2QiUNuDSY2qjND3JtNb85buZiZ4Zf
         tE4m1HEmb/xDiewvhnpenuOu4QGqP6z7Au1vTNlMZ+2jVcvgwG9f7239aqVYA3TsQOU9
         OY9rCcCnM/vpLu8gKDQiRHo841AbcRzBHt3+rNMKGyywKz8O3Wpia4TwVnIXwDeB6GGo
         T8dPEpXIpy+x7/VKRqMzJuf9pPlAzEcq1SXArBIhebIjOAjHvpV/gjY94ht2t5nH6z4y
         naGCAZovUuPOUFvwZj9gvff61cIQGwrt7/2R4Xsi8zWZcf+WnY+XBlp05bPiPA6Jw09T
         uFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0q8sjOka/8JVE0d1+i6D+fsXpYiyssGnLrz+7WuW9P8=;
        b=e8KZQJmxojekSPIBo1S5vmBtqOOGTSNR0Xa68GUTdKqb/r7M5hDIVypPNcAxPpj2wO
         nrkX7GTHOH2lkI0wGeGUMIeZ7D4+UHUFBcm6fl7xjlBy9k8Jl0E5D8FbJK3JS/Hmqzsp
         RUatm1rjbSneJt5aBqSOp/BhI9VJUYhtR/Tp5fa/pSABjbRDWdmU+vvmyxj9vdUjer4H
         /rpYGRDpj+Sr7JGD/rz8SJfMU7WssS+vM7CN2S8P4Z0TXaj7UFhkV4epAJHCjyHv/11Z
         njHPt0WkAsXwvzti4X6fdCEZeT+9+XqW/kL3hOIK/chzUj8ZgfrwOXLeq+1xKbU8euCw
         yQng==
X-Gm-Message-State: AGi0PuY9vfJz6HEMfqoOAFEosQ9qaAmgjd64Q8U8P1IEZn6X/+yt2FQY
	XCvhrTcRK4TsP4EYvYXGhl8ztEgK
X-Google-Smtp-Source: APiQypLkRtbFXm8xMcNYd3MkDJ33B35GtbPpd4ORbFiQcFqiBEulImEAPuo9GFyAT4HKAlW6WN0SJA==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr5840254wmi.52.1588449247764;
        Sat, 02 May 2020 12:54:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h6sm5276149wmf.31.2020.05.02.12.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:54:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] mc: update to 4.8.24
Date: Sat,  2 May 2020 21:53:51 +0200
Message-Id: <20200502195352.17279-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200502195352.17279-1-alex.kanavin@gmail.com>
References: <20200502195352.17279-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...Add-option-to-control-configure-args.patch |  99 ----------------
 ...29-configure.ac-drop-bundled-gettext.patch | 110 ------------------
 ...-Makefile.am-install-mc.lib-only-onc.patch |  59 ++++++++++
 .../mc/{mc_4.8.23.bb => mc_4.8.24.bb}         |   7 +-
 4 files changed, 62 insertions(+), 213 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
 delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
 rename meta/recipes-extended/mc/{mc_4.8.23.bb => mc_4.8.24.bb} (88%)

diff --git a/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch b/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
deleted file mode 100644
index e76aac8161..0000000000
--- a/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From a54501d3c9541bc8600225aa2d42531f93c6def7 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Sat, 9 Nov 2019 20:01:48 -0600
-Subject: [PATCH] Add option to control configure args
-
-Embedding the configure time options into the executable can lead to
-non-reproducible builds, since configure options often have embedded
-paths. Add a configure time option to control if the configure args are
-embedded so this can be disabled.
-
-Upstream-Status: Submitted [https://midnight-commander.org/ticket/4031]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- configure.ac   | 6 ++++++
- src/args.c     | 6 ++++++
- src/textconf.c | 2 ++
- 3 files changed, 14 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 19d1a76be..a1948f6b9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -544,6 +544,12 @@ dnl Clarify do we really need GModule
- AM_CONDITIONAL([HAVE_GMODULE], [test -n "$g_module_supported" && \
-                                 test x"$textmode_x11_support" = x"yes" -o x"$enable_aspell" = x"yes"])
- 
-+AC_ARG_ENABLE([configure-args],
-+    AS_HELP_STRING([--enable-configure-args], [Handle all compiler warnings as errors]))
-+if test "x$enable_configure_args" != xno; then
-+    AC_DEFINE([ENABLE_CONFIGURE_ARGS], 1, [Define to enable showing configure arguments in help])
-+fi
-+
- AC_DEFINE_UNQUOTED([MC_CONFIGURE_ARGS], ["$ac_configure_args"], [MC configure arguments])
- 
- AC_CONFIG_FILES(
-diff --git a/src/args.c b/src/args.c
-index baef1a1c8..f8dc24020 100644
---- a/src/args.c
-+++ b/src/args.c
-@@ -95,7 +95,9 @@ static gboolean mc_args__nouse_subshell = FALSE;
- #endif /* ENABLE_SUBSHELL */
- static gboolean mc_args__show_datadirs = FALSE;
- static gboolean mc_args__show_datadirs_extended = FALSE;
-+#ifdef ENABLE_CONFIGURE_ARGS
- static gboolean mc_args__show_configure_opts = FALSE;
-+#endif
- 
- static GOptionGroup *main_group;
- 
-@@ -125,6 +127,7 @@ static const GOptionEntry argument_main_table[] = {
-      NULL
-     },
- 
-+#ifdef ENABLE_CONFIGURE_ARGS
-     /* show configure options */
-     {
-      "configure-options", '\0', G_OPTION_FLAG_IN_MAIN, G_OPTION_ARG_NONE,
-@@ -132,6 +135,7 @@ static const GOptionEntry argument_main_table[] = {
-      N_("Print configure options"),
-      NULL
-     },
-+#endif
- 
-     {
-      "printwd", 'P', G_OPTION_FLAG_IN_MAIN, G_OPTION_ARG_STRING,
-@@ -758,11 +762,13 @@ mc_args_show_info (void)
-         return FALSE;
-     }
- 
-+#ifdef ENABLE_CONFIGURE_ARGS
-     if (mc_args__show_configure_opts)
-     {
-         show_configure_options ();
-         return FALSE;
-     }
-+#endif
- 
-     return TRUE;
- }
-diff --git a/src/textconf.c b/src/textconf.c
-index 1e0613e58..f39b9e028 100644
---- a/src/textconf.c
-+++ b/src/textconf.c
-@@ -232,10 +232,12 @@ show_datadirs_extended (void)
- 
- /* --------------------------------------------------------------------------------------------- */
- 
-+#ifdef ENABLE_CONFIGURE_ARGS
- void
- show_configure_options (void)
- {
-     (void) printf ("%s\n", MC_CONFIGURE_ARGS);
- }
-+#endif
- 
- /* --------------------------------------------------------------------------------------------- */
--- 
-2.23.0
-
diff --git a/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch b/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
deleted file mode 100644
index 8f357378d0..0000000000
--- a/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 0d677a014a87b968d79eea2353ac4e342b0fd4ca Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Wed, 11 Sep 2019 22:58:18 +0100
-Subject: [PATCH] Ticket #3629: configure.ac: drop bundled gettext
-
-Bundled libintl did not support linking to internal static
-libraries (libmc in our case): directly specified static
-libraries are not pulled by libtool and are not usable for
-dynamic libraries as PIC-related flags are not passed for
-compilation.
-
-This renders bundled libintl library unusable.
-
-The change drops libintl bundling support and always relies
-on external libintl (or falls back to disabled NLS).
-
-On a related note gettext-0.20 drops support for bundling
-or libintl and this change will ease migration to newer version.
-
-The change is tested on x86_64-gentoo-linux-musl: mc builds
-and links all tests successfully. A few tests fail for lack
-of NLS support.
-
-Upstream-Status: Backport [https://github.com/MidnightCommander/mc/commit/f30e6ff283f4bc86177e4360de94dad794678395]
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am           | 2 +-
- configure.ac          | 5 +++--
- doc/doxygen.cfg       | 2 +-
- lib/Makefile.am       | 2 +-
- m4.include/mc-i18n.m4 | 5 -----
- 5 files changed, 6 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ac05a83..f86f6ed 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- ## Process this file with automake to create Makefile.in.
- AUTOMAKE_OPTIONS = 1.5
- 
--SUBDIRS = intl po lib src doc contrib misc
-+SUBDIRS = po lib src doc contrib misc
- 
- if HAVE_TESTS
-     SUBDIRS += tests
-diff --git a/configure.ac b/configure.ac
-index a1948f6..bbc9e71 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -272,7 +272,9 @@ dnl ############################################################################
- dnl Internationalization
- dnl ############################################################################
- 
--AM_GNU_GETTEXT([no-libtool], [need-ngettext])
-+AC_CHECK_FUNCS([setlocale])
-+
-+AM_GNU_GETTEXT([external], [need-ngettext])
- AM_GNU_GETTEXT_VERSION([0.18.1])
- 
- mc_I18N
-@@ -680,7 +682,6 @@ doc/hlp/pl/Makefile
- doc/hlp/ru/Makefile
- doc/hlp/sr/Makefile
- 
--intl/Makefile
- po/Makefile.in
- ])
- 
-diff --git a/doc/doxygen.cfg b/doc/doxygen.cfg
-index 07bc973..1118062 100644
---- a/doc/doxygen.cfg
-+++ b/doc/doxygen.cfg
-@@ -91,7 +91,7 @@ FILE_PATTERNS          = *.c \
- RECURSIVE              = YES
- EXCLUDE                =
- EXCLUDE_SYMLINKS       = NO
--EXCLUDE_PATTERNS       = */intl/* */tests/* */.git/*
-+EXCLUDE_PATTERNS       = */tests/* */.git/*
- EXCLUDE_SYMBOLS        =
- EXAMPLE_PATH           = $(SRCDIR)
- EXAMPLE_PATTERNS       =
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index c448e2d..455f9dd 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -74,4 +74,4 @@ else
-     libmc_la_LIBADD += $(GLIB_LIBS)
- endif
- 
--libmc_la_LIBADD += $(PCRE_LIBS) $(LIBICONV) $(LIBINTL)
-+libmc_la_LIBADD += $(PCRE_LIBS)
-diff --git a/m4.include/mc-i18n.m4 b/m4.include/mc-i18n.m4
-index dd10d00..ec08324 100644
---- a/m4.include/mc-i18n.m4
-+++ b/m4.include/mc-i18n.m4
-@@ -8,11 +8,6 @@ dnl @license GPL
- dnl @copyright Free Software Foundation, Inc.
- 
- AC_DEFUN([mc_I18N],[
--
--    if test "x$USE_INCLUDED_LIBINTL" = xyes; then
--        CPPFLAGS="$CPPFLAGS -I\$(top_builddir)/intl -I\$(top_srcdir)/intl"
--    fi
--
-     dnl User visible support for charset conversion.
-     AC_ARG_ENABLE([charset],
-         AS_HELP_STRING([--enable-charset], [Support for charset selection and conversion @<:@yes@:>@]))
diff --git a/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch b/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
new file mode 100644
index 0000000000..824c12f8d2
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
@@ -0,0 +1,59 @@
+From 58dd59637ac5c6340ddfe96ad8b76883e4da20ef Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Tue, 3 Mar 2020 09:26:12 +0000
+Subject: [PATCH] Ticket #4070: misc/Makefile.am: install mc.lib only once.
+
+Before the change mc.lib was installed twice due to being
+in two _DATA variables:
+
+dist_pkgdata_DATA = \
+        mc.lib
+
+pkgdata_DATA = \
+        $(dist_pkgdata_DATA) \
+        $(PKGDATA_OUT)
+
+This causes occasional install failures when two parallel
+`/usr/bin/install` calls race in installing the file:
+
+$ make -j20 DESTDIR=/var/tmp/portage/app-misc/mc-4.8.24/image install
+...
+ /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
+    -c -m 644 mc.lib '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
+ /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
+    -c -m 644 mc.lib mc.charsets '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
+...
+ /usr/bin/install: cannot create regular file
+   '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc/mc.lib': File exists
+
+After the change mc.lib is present only in dist_pkgdata_DATA.
+
+Upstream-Status: Backport [https://github.com/MidnightCommander/mc/commit/afb09f7cd7024484845ade25e15b8b93d6cf2d2c]
+
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ misc/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/misc/Makefile.am b/misc/Makefile.am
+index 8ed1826..24f4a0e 100644
+--- a/misc/Makefile.am
++++ b/misc/Makefile.am
+@@ -17,7 +17,6 @@ dist_pkgdata_DATA = \
+ 	mc.lib
+ 
+ pkgdata_DATA = \
+-	$(dist_pkgdata_DATA) \
+ 	$(PKGDATA_OUT)
+ 
+ SCRIPTS_IN = \
+@@ -54,7 +53,6 @@ EXTRA_DIST = \
+ 	$(LIBFILES_SCRIPT) \
+ 	$(SCRIPTS_IN) \
+ 	$(noinst_DATA) \
+-	$(dist_pkgdata_DATA) \
+ 	$(PKGDATA_IN)
+ 
+ install-data-hook:
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.24.bb
similarity index 88%
rename from meta/recipes-extended/mc/mc_4.8.23.bb
rename to meta/recipes-extended/mc/mc_4.8.24.bb
index ead348b92e..034df2a422 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.24.bb
@@ -9,12 +9,11 @@ RRECOMMENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
-           file://0001-Add-option-to-control-configure-args.patch \
-           file://0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch \
            file://nomandate.patch \
+           file://0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch \
            "
-SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
-SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
+SRC_URI[md5sum] = "2621de1fa9058a9c41a4248becc969f9"
+SRC_URI[sha256sum] = "cfcc4d0546d0c3a88645a8bf71612ed36647ea3264d973b1f28183a0c84bae34"
 
 inherit autotools gettext pkgconfig
 
-- 
2.26.1

