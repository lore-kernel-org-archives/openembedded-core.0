Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4101.1588240717753389869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rzw3cXQ3;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id v4so7032649wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=liCsZRCUbYgco9f6jjCv4tUyfC1KQq5ScwUUH61nAnU=;
        b=Rzw3cXQ31rat+wMdoOUopCUlHP/pDYroXVr6ekAghvG1MmBnb6i4gn4Nc7uVaJ44Ad
         XhHmw+/+reEFdwXKbLsvDvRFtJ/e+1eONORH+Dx8uRXrWK5rjP7ny7lTjd2iVLf/Dz6l
         wJakPNxp7M5950m6yqBTbGe6CtgDoSuAxPFq8l3GoPYfq5IHVuOIzIgVsmFxCwvSxGc7
         qBHSRigXqlzLeAbm2Zmjqol5ayvhcbIWwJBh6ENalj1ir/vrqFAifAuoE/H37tUGWvuy
         rXg4acqt2SilPZBxaC4/w4UwBx3IPObt9Jfy8tO6RSNQc6WT+dCh6WQeU14n9am56+pU
         01/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=liCsZRCUbYgco9f6jjCv4tUyfC1KQq5ScwUUH61nAnU=;
        b=PytQf2KXq4zuCIDfsjVBqxtj5uYkSOQBA2lM9yWGfNZ3U9b6P65WDp6pekJvwNYl5X
         aaIclGXKb0v++gzBfBn4U2MY3Z1u0m/k/flsD+noqEQkQJzVfQGWLjC9xP06geWRoeCl
         wJj3SKDyrzrkzWTHj8tdKOI27MlooQHzK7oNeJjugoB0Ob0mfM2bJH+Bs7/JtRrz0Iq0
         c5YZGOji9+04EN2wybYXyp+lxINrzr+uA9jkwFzD3NBbbz/fj0YnQusHncGsbbI4AtAD
         sYQF4ulJHzAIkU9xeiEqkfKRYol4cbFXjTy7hpbpJtP/hOF8mPYh9B6Qf/1OrTBX8hEX
         bFMw==
X-Gm-Message-State: AGi0PuYlrt89GAwypELSn85KIl61+Eajk2e5oY8fa97VVhWPDDm/bpZC
	3Di9k5akwdeDzPptCBzVJtzmSTGv
X-Google-Smtp-Source: APiQypKHDBGAWQ8ZEUIZScHCut4rD81NUKggwXXgMa+1U3jkQo/kwzVuYaoq3SALydu27fHpCkMaNA==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr2188097wmf.31.1588240715837;
        Thu, 30 Apr 2020 02:58:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/17] mc: update to 4.8.24
Date: Thu, 30 Apr 2020 11:58:06 +0200
Message-Id: <20200430095815.2824-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...Add-option-to-control-configure-args.patch |  99 ----------------
 ...29-configure.ac-drop-bundled-gettext.patch | 110 ------------------
 .../mc/{mc_4.8.23.bb => mc_4.8.24.bb}         |   6 +-
 3 files changed, 2 insertions(+), 213 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
 delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
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
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.24.bb
similarity index 88%
rename from meta/recipes-extended/mc/mc_4.8.23.bb
rename to meta/recipes-extended/mc/mc_4.8.24.bb
index ead348b92e..7a68270dd2 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.24.bb
@@ -9,12 +9,10 @@ RRECOMMENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
-           file://0001-Add-option-to-control-configure-args.patch \
-           file://0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch \
            file://nomandate.patch \
            "
-SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
-SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
+SRC_URI[md5sum] = "2621de1fa9058a9c41a4248becc969f9"
+SRC_URI[sha256sum] = "cfcc4d0546d0c3a88645a8bf71612ed36647ea3264d973b1f28183a0c84bae34"
 
 inherit autotools gettext pkgconfig
 
-- 
2.26.1

