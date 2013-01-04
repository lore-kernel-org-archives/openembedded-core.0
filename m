Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tr1Ly-0005sX-S5
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 08:06:14 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so9278655lab.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 22:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=YFD5GCDYcvVy++7n1F4vpa3GAwDR+D347w63bvzW5lg=;
	b=To41qV+3tEDUzwexLogbk6ZfxPBmBIS0fGdx1Sn7+RIDcpo6ejVpdrgUh/SQvLNmO7
	x+s/jAPSbYSkj4ShExQvGYts/wMWQgp9s5FOXwan8yCBtL6l4UqezH6VUH/QcLIduVVH
	/0btnEAAqanoNj0QsYUpgwfsqbD3eNz2pzMnWHByhPo26ojJQD6/MDzQS7s+jYlzGOWn
	dPP14NeIE2qnUeFRElKqGsJdVDPZeYK/9r9l5UK7EJFVwFKmIcWA9TrpAbTT8julazPm
	TTNJ0qt8idLt4/i7MAu7uujV3ohgdb59twStiK5SZ7taVJ0fcKEIej6se+XpNbq4mqXf
	akFg==
X-Received: by 10.112.36.137 with SMTP id q9mr21227540lbj.42.1357282258193;
	Thu, 03 Jan 2013 22:50:58 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fh4sm17635314lbb.7.2013.01.03.22.50.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 22:50:56 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tr17F-0006kw-OP; Fri, 04 Jan 2013 08:50:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 08:50:52 +0200
Message-Id: <1357282252-25903-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gettext-minimal: update files from gettext 0.18.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 07:06:30 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gettext/gettext-minimal-0.18.1.1/aclocal.tgz   |  Bin 36374 -> 0 bytes
 .../COPYING                                        |    0
 .../Makefile.in.in                                 |   19 +++-
 .../Makevars.template                              |   12 +++
 .../gettext/gettext-minimal-0.18.2/aclocal.tgz     |  Bin 0 -> 37504 bytes
 .../config.rpath                                   |  106 ++++++++++++--------
 .../remove-potcdate.sin                            |    0
 ....18.1.1.bb => gettext-minimal-native_0.18.2.bb} |    2 +-
 8 files changed, 89 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/Makefile.in.in (95%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/Makevars.template (76%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/config.rpath (92%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.1.1.bb => gettext-minimal-native_0.18.2.bb} (98%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/aclocal.tgz
deleted file mode 100644
index 6dab00d165aa5dcc6c98fba8315fa4bb35a15303..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 36374
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

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.18.2/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.1.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.18.2/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.18.2/Makefile.in.in
similarity index 95%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.18.2/Makefile.in.in
index 83d8838..fce63a6 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.2/Makefile.in.in
@@ -8,7 +8,7 @@
 # Please note that the actual code of GNU gettext is covered by the GNU
 # General Public License and is *not* in the public domain.
 #
-# Origin: gettext-0.18
+# Origin: gettext-0.18.2
 GETTEXT_MACRO_VERSION = 0.18
 
 PACKAGE = @PACKAGE@
@@ -96,14 +96,14 @@ CATALOGS = @CATALOGS@
 	mv t-$@ $@
 
 
-all: check-macro-version all-@USE_NLS@
+all: all-@USE_NLS@
 
 all-yes: stamp-po
 all-no:
 
 # Ensure that the gettext macros and this Makefile.in.in are in sync.
-check-macro-version:
-	@test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@" \
+CHECK_MACRO_VERSION = \
+	test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@" \
 	  || { echo "*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version $(GETTEXT_MACRO_VERSION) but the autoconf macros are from gettext version @GETTEXT_MACRO_VERSION@" 1>&2; \
 	       exit 1; \
 	     }
@@ -123,6 +123,7 @@ check-macro-version:
 # $(POFILES) has been designed to not touch files that don't need to be
 # changed.
 stamp-po: $(srcdir)/$(DOMAIN).pot
+	@$(CHECK_MACRO_VERSION)
 	test ! -f $(srcdir)/$(DOMAIN).pot || \
 	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
 	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
@@ -137,8 +138,16 @@ stamp-po: $(srcdir)/$(DOMAIN).pot
 
 # This target rebuilds $(DOMAIN).pot; it is an expensive operation.
 # Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
+# The determination of whether the package xyz is a GNU one is based on the
+# heuristic whether some file in the top level directory mentions "GNU xyz".
+# If GNU 'find' is available, we avoid grepping through monster files.
 $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
-	if LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null | grep -v 'libtool:' >/dev/null; then \
+	if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+	       LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
+	     else \
+	       LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	     fi; \
+	   } | grep -v 'libtool:' >/dev/null; then \
 	  package_gnu='GNU '; \
 	else \
 	  package_gnu=''; \
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template b/meta/recipes-core/gettext/gettext-minimal-0.18.2/Makevars.template
similarity index 76%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template
rename to meta/recipes-core/gettext/gettext-minimal-0.18.2/Makevars.template
index 32692ab..4a9ff7d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/Makevars.template
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.2/Makevars.template
@@ -39,3 +39,15 @@ MSGID_BUGS_ADDRESS =
 # This is the list of locale categories, beyond LC_MESSAGES, for which the
 # message catalogs shall be used.  It is usually empty.
 EXTRA_LOCALE_CATEGORIES =
+
+# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
+# context.  Possible values are "yes" and "no".  Set this to yes if the
+# package uses functions taking also a message context, like pgettext(), or
+# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
+USE_MSGCTXT = no
+
+# These options get passed to msgmerge.
+# Useful options are in particular:
+#   --previous            to keep previous msgids of translated messages,
+#   --quiet               to reduce the verbosity.
+MSGMERGE_OPTIONS =
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz
new file mode 100644
index 0000000000000000000000000000000000000000..a97953049db2d2c6497a5814ed74cae1a4b74a69
GIT binary patch
literal 37504
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

literal 0
HcmV?d00001

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.18.2/config.rpath
similarity index 92%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.18.2/config.rpath
index 17298f2..1a07018 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.2/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2010 Free Software Foundation, Inc.
+#   Copyright 1996-2012 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
@@ -25,7 +25,7 @@
 #   known workaround is to choose shorter directory names for the build
 #   directory and/or the installation directory.
 
-# All known linkers require a `.a' archive for static linking (except MSVC,
+# All known linkers require a '.a' archive for static linking (except MSVC,
 # which needs '.lib').
 libext=a
 shrext=.so
@@ -57,13 +57,6 @@ else
     aix*)
       wl='-Wl,'
       ;;
-    darwin*)
-      case $cc_basename in
-        xlc*)
-          wl='-Wl,'
-          ;;
-      esac
-      ;;
     mingw* | cygwin* | pw32* | os2* | cegcc*)
       ;;
     hpux9* | hpux10* | hpux11*)
@@ -72,9 +65,7 @@ else
     irix5* | irix6* | nonstopux*)
       wl='-Wl,'
       ;;
-    newsos6)
-      ;;
-    linux* | k*bsd*-gnu)
+    linux* | k*bsd*-gnu | kopensolaris*-gnu)
       case $cc_basename in
         ecc*)
           wl='-Wl,'
@@ -85,17 +76,26 @@ else
         lf95*)
           wl='-Wl,'
           ;;
-        pgcc | pgf77 | pgf90)
+        nagfor*)
+          wl='-Wl,-Wl,,'
+          ;;
+        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
           wl='-Wl,'
           ;;
         ccc*)
           wl='-Wl,'
           ;;
+        xl* | bgxl* | bgf* | mpixl*)
+          wl='-Wl,'
+          ;;
         como)
           wl='-lopt='
           ;;
         *)
           case `$CC -V 2>&1 | sed 5q` in
+            *Sun\ F* | *Sun*Fortran*)
+              wl=
+              ;;
             *Sun\ C*)
               wl='-Wl,'
               ;;
@@ -103,13 +103,24 @@ else
           ;;
       esac
       ;;
+    newsos6)
+      ;;
+    *nto* | *qnx*)
+      ;;
     osf3* | osf4* | osf5*)
       wl='-Wl,'
       ;;
     rdos*)
       ;;
     solaris*)
-      wl='-Wl,'
+      case $cc_basename in
+        f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
+          wl='-Qoption ld '
+          ;;
+        *)
+          wl='-Wl,'
+          ;;
+      esac
       ;;
     sunos4*)
       wl='-Qoption ld '
@@ -171,15 +182,14 @@ if test "$with_gnu_ld" = yes; then
       fi
       ;;
     amigaos*)
-      hardcode_libdir_flag_spec='-L$libdir'
-      hardcode_minus_L=yes
-      # Samuel A. Falvo II <kc5tja@dolphin.openprojects.net> reports
-      # that the semantics of dynamic libraries on AmigaOS, at least up
-      # to version 4, is to share data among multiple programs linked
-      # with the same dynamic library.  Since this doesn't match the
-      # behavior of shared libraries on other platforms, we cannot use
-      # them.
-      ld_shlibs=no
+      case "$host_cpu" in
+        powerpc)
+          ;;
+        m68k)
+          hardcode_libdir_flag_spec='-L$libdir'
+          hardcode_minus_L=yes
+          ;;
+      esac
       ;;
     beos*)
       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
@@ -198,11 +208,13 @@ if test "$with_gnu_ld" = yes; then
         ld_shlibs=no
       fi
       ;;
+    haiku*)
+      ;;
     interix[3-9]*)
       hardcode_direct=no
       hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
       ;;
-    gnu* | linux* | k*bsd*-gnu)
+    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu)
       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
         :
       else
@@ -325,10 +337,14 @@ else
       fi
       ;;
     amigaos*)
-      hardcode_libdir_flag_spec='-L$libdir'
-      hardcode_minus_L=yes
-      # see comment about different semantics on the GNU ld section
-      ld_shlibs=no
+      case "$host_cpu" in
+        powerpc)
+          ;;
+        m68k)
+          hardcode_libdir_flag_spec='-L$libdir'
+          hardcode_minus_L=yes
+          ;;
+      esac
       ;;
     bsdi[45]*)
       ;;
@@ -342,24 +358,15 @@ else
       ;;
     darwin* | rhapsody*)
       hardcode_direct=no
-      if test "$GCC" = yes ; then
+      if { case $cc_basename in ifort*) true;; *) test "$GCC" = yes;; esac; }; then
         :
       else
-        case $cc_basename in
-          xlc*)
-            ;;
-          *)
-            ld_shlibs=no
-            ;;
-        esac
+        ld_shlibs=no
       fi
       ;;
     dgux*)
       hardcode_libdir_flag_spec='-L$libdir'
       ;;
-    freebsd1*)
-      ld_shlibs=no
-      ;;
     freebsd2.2*)
       hardcode_libdir_flag_spec='-R$libdir'
       hardcode_direct=yes
@@ -420,6 +427,8 @@ else
       hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
       hardcode_libdir_separator=:
       ;;
+    *nto* | *qnx*)
+      ;;
     openbsd*)
       if test -f /usr/libexec/ld.so; then
         hardcode_direct=yes
@@ -515,7 +524,12 @@ case "$host_os" in
     library_names_spec='$libname$shrext'
     ;;
   amigaos*)
-    library_names_spec='$libname.a'
+    case "$host_cpu" in
+      powerpc*)
+        library_names_spec='$libname$shrext' ;;
+      m68k)
+        library_names_spec='$libname.a' ;;
+    esac
     ;;
   beos*)
     library_names_spec='$libname$shrext'
@@ -534,8 +548,6 @@ case "$host_os" in
   dgux*)
     library_names_spec='$libname$shrext'
     ;;
-  freebsd1*)
-    ;;
   freebsd* | dragonfly*)
     case "$host_os" in
       freebsd[123]*)
@@ -547,6 +559,9 @@ case "$host_os" in
   gnu*)
     library_names_spec='$libname$shrext'
     ;;
+  haiku*)
+    library_names_spec='$libname$shrext'
+    ;;
   hpux9* | hpux10* | hpux11*)
     case $host_cpu in
       ia64*)
@@ -582,7 +597,7 @@ case "$host_os" in
     ;;
   linux*oldld* | linux*aout* | linux*coff*)
     ;;
-  linux* | k*bsd*-gnu)
+  linux* | k*bsd*-gnu | kopensolaris*-gnu)
     library_names_spec='$libname$shrext'
     ;;
   knetbsd*-gnu)
@@ -594,7 +609,7 @@ case "$host_os" in
   newsos6)
     library_names_spec='$libname$shrext'
     ;;
-  nto-qnx*)
+  *nto* | *qnx*)
     library_names_spec='$libname$shrext'
     ;;
   openbsd*)
@@ -625,6 +640,9 @@ case "$host_os" in
   sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
     library_names_spec='$libname$shrext'
     ;;
+  tpf*)
+    library_names_spec='$libname$shrext'
+    ;;
   uts4*)
     library_names_spec='$libname$shrext'
     ;;
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.18.2/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.18.2/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
index f008a79..da6d3bc 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
 
 inherit native
 
-PR = "r5"
+PR = "r0"
 
 S = "${WORKDIR}"
 
-- 
1.7.10.4



