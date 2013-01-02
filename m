Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqTQM-0005f6-C1
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 19:52:22 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so6428737lab.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ONZJDtJHn9MsP8n1tuJ6emhZUUBBEAjZbyycR3Iy9kE=;
	b=s3Vnp4QZ99MYpXRSxb5yWHHCJtS8v2+OOpOIreWkYpfxP1pD58wB1iqBW2Nx9my8QE
	r6jXRkklgmq5W71bBjMrVzrl+FmN+5vVXKLZN1Fgb2IYSnKwYkzt+8QtYHGkjFEpssGx
	THSTwauPRhFWhXgF/gUyDlv6H/I/fFvkqN44sJ0/9ucvWElBHYjW4kO8GeUGWOaXkdQV
	RIrGlQvM+FnBrZEZcTwpsSk5KUc65FU76xUZeAQ3Z3A0gBnTqK8Dcscm/OrRdjvRDJxc
	ThDHgBHakd3xIWSTFQ/8U7TN7aqaMjIDYrseyZmNwv45cmb4mme/O5l1AncLEUfRFGUR
	7+Ow==
X-Received: by 10.112.10.232 with SMTP id l8mr19138396lbb.69.1357151839714;
	Wed, 02 Jan 2013 10:37:19 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fh4sm16305088lbb.7.2013.01.02.10.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 10:37:18 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqTBk-0006CU-IW; Wed, 02 Jan 2013 20:37:16 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 20:37:10 +0200
Message-Id: <1357151830-23755-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357151830-23755-3-git-send-email-cazfi74@gmail.com>
References: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-2-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-3-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gmp: update to upstream version 5.1.0
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
X-List-Received-Date: Wed, 02 Jan 2013 18:52:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New version of configure.patch added for gmp-5.1.0. Old patch
moved to gmp-4.2.1 specific directory.
gmp_fix_for_automake-1.12.patch part of upstŕeam so removed
gmp-5 version, gmp-4.2.1 version remains.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gmp/{gmp => gmp-4.2.1}/configure.patch         |    0
 meta/recipes-support/gmp/gmp-5.1.0/configure.patch |  210 ++++++++++++++++++++
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 -----
 .../gmp/{gmp_5.0.5.bb => gmp_5.1.0.bb}             |    5 +-
 4 files changed, 212 insertions(+), 51 deletions(-)
 rename meta/recipes-support/gmp/{gmp => gmp-4.2.1}/configure.patch (100%)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
 rename meta/recipes-support/gmp/{gmp_5.0.5.bb => gmp_5.1.0.bb} (60%)

diff --git a/meta/recipes-support/gmp/gmp/configure.patch b/meta/recipes-support/gmp/gmp-4.2.1/configure.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/configure.patch
rename to meta/recipes-support/gmp/gmp-4.2.1/configure.patch
diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch b/meta/recipes-support/gmp/gmp-5.1.0/configure.patch
new file mode 100644
index 0000000..fb5435c
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-5.1.0/configure.patch
@@ -0,0 +1,210 @@
+Upstream-Status: Pending
+
+Updated to apply to gmp-5.1.0
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd gmp-5.1.0/acinclude.m4 gmp-5.1.0/acinclude.m4
+--- gmp-5.1.0/acinclude.m4	2012-12-18 21:05:09.000000000 +0200
++++ gmp-5.1.0/acinclude.m4	2013-01-02 05:19:26.977013073 +0200
+@@ -30,29 +30,29 @@
+ dnl    conftest.exe - various DOS compilers
+
+
+-define(IA64_PATTERN,
++define([IA64_PATTERN],
+ [[ia64*-*-* | itanium-*-* | itanium2-*-*]])
+
+ dnl  Need to be careful not to match m6811, m6812, m68hc11 and m68hc12, all
+ dnl  of which config.sub accepts.  (Though none of which are likely to work
+ dnl  with GMP.)
+ dnl
+-define(M68K_PATTERN,
++define([M68K_PATTERN],
+ [[m68k-*-* | m68[0-9][0-9][0-9]-*-*]])
+
+-define(POWERPC64_PATTERN,
++define([POWERPC64_PATTERN],
+ [[powerpc64-*-* | powerpc64le-*-* | powerpc620-*-* | powerpc630-*-* | powerpc970-*-* | power[3-9]-*-*]])
+
+-define(S390_PATTERN,
++define([S390_PATTERN],
+ [[s390-*-* | z900esa-*-* | z990esa-*-* | z9esa-*-* | z10esa-*-* | z196esa-*-*]])
+
+-define(S390X_PATTERN,
++define([S390X_PATTERN],
+ [[s390x-*-* | z900-*-* | z990-*-* | z9-*-* | z10-*-* | z196-*-*]])
+
+-define(X86_PATTERN,
++define([X86_PATTERN],
+ [[i?86*-*-* | k[5-8]*-*-* | pentium*-*-* | athlon-*-* | viac3*-*-* | geode*-*-* | atom-*-*]])
+
+-define(X86_64_PATTERN,
++define([X86_64_PATTERN],
+ [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | bulldozer-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
+
+ dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
+@@ -70,7 +70,7 @@
+ dnl      x86/k6      ->  k6
+ dnl      x86/k6/mmx  ->  k6_mmx
+
+-define(GMP_FAT_SUFFIX,
++define([GMP_FAT_SUFFIX],
+ [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
+
+
+@@ -79,7 +79,7 @@
+ dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
+ dnl  shell expression like $foo if desired.
+
+-define(GMP_REMOVE_FROM_LIST,
++define([GMP_REMOVE_FROM_LIST],
+ [remove_from_list_tmp=
+ for remove_from_list_i in $[][$1]; do
+   if test $remove_from_list_i = [$2]; then :;
+@@ -95,12 +95,12 @@
+ dnl  ----------------------
+ dnl  Strip entries */subdir from $path and $fat_path.
+
+-define(GMP_STRIP_PATH,
++define([GMP_STRIP_PATH],
+ [GMP_STRIP_PATH_VAR(path, [$1])
+ GMP_STRIP_PATH_VAR(fat_path, [$1])
+ ])
+
+-define(GMP_STRIP_PATH_VAR,
++define([GMP_STRIP_PATH_VAR],
+ [tmp_path=
+ for i in $[][$1]; do
+   case $i in
+@@ -121,7 +121,7 @@
+ dnl  Dummy value for GMP_LIMB_BITS is enough
+ dnl  for all current configure-time uses of gmp.h.
+
+-define(GMP_INCLUDE_GMP_H,
++define([GMP_INCLUDE_GMP_H],
+ [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
+ #define GMP_NAIL_BITS $GMP_NAIL_BITS
+ #define GMP_LIMB_BITS 123
+@@ -136,7 +136,7 @@
+ dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
+ dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
+
+-define(GMP_HEADER_GETVAL,
++define([GMP_HEADER_GETVAL],
+ [patsubst(patsubst(
+ esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
+ [^.*$1[ 	]+],[]),
+@@ -150,7 +150,7 @@
+ dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
+ dnl  like 3.0.1 if patchlevel > 0.
+
+-define(GMP_VERSION,
++define([GMP_VERSION],
+ [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
+ .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
+ .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
+@@ -1512,7 +1512,9 @@
+ echo ["define(<CONFIG_TOP_SRCDIR>,<\`$tmp'>)"] >>$gmp_tmpconfigm4
+
+ # All CPUs use asm-defs.m4
+-echo ["include][(CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4')"] >>$gmp_tmpconfigm4i
++echo -n ["include("] >>$gmp_tmpconfigm4i
++echo -n ["CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4'"] >>$gmp_tmpconfigm4i
++echo [")"] >>$gmp_tmpconfigm4i
+ ])
+
+
+diff -Nurd gmp-5.1.0/configure.in gmp-5.1.0/configure.in
+--- gmp-5.1.0/configure.in	2012-12-18 21:05:09.000000000 +0200
++++ gmp-5.1.0/configure.in	2013-01-02 05:19:26.977013073 +0200
+@@ -29,13 +29,6 @@
+ AC_PREREQ(2.59)
+ AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see http://gmplib.org/manual/Reporting-Bugs.html], gmp)
+ AC_CONFIG_SRCDIR(gmp-impl.h)
+-m4_pattern_forbid([^[ \t]*GMP_])
+-m4_pattern_allow(GMP_LDFLAGS)
+-m4_pattern_allow(GMP_LIMB_BITS)
+-m4_pattern_allow(GMP_MPARAM_H_SUGGEST)
+-m4_pattern_allow(GMP_NAIL_BITS)
+-m4_pattern_allow(GMP_NUMB_BITS)
+-m4_pattern_allow(GMP_NONSTD_ABI)
+
+ # If --target is not used then $target_alias is empty, but if say
+ # "./configure athlon-pc-freebsd3.5" is used, then all three of
+@@ -314,7 +307,7 @@
+ # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
+ # called.  User selections of CC etc are respected.
+ #
+-# Care is taken not to use macros like AC_TRY_COMPILE during the GMP
++# Care is taken not to use macros like AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],[],[]) during the GMP
+ # pre-testing, since they of course depend on AC_PROG_CC, and also some of
+ # them cache their results, which is not wanted.
+ #
+@@ -406,7 +399,7 @@
+ # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
+ # c89 over cc here.  But note that on HP-UX c89 provides a castrated
+ # environment, and would want to be excluded somehow.  Maybe
+-# AC_PROG_CC_STDC already does enough to stick cc into ANSI mode and
++#  already does enough to stick cc into ANSI mode and
+ # we don't need to worry.
+ #
+ cclist="gcc cc"
+@@ -1727,7 +1720,7 @@
+ CFLAGS_or_unset=${CFLAGS-'(unset)'}
+ CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
+
+-cat >&AC_FD_CC <<EOF
++cat >&AS_MESSAGE_LOG_FD() <<EOF
+ User:
+ ABI=$ABI
+ CC=$CC
+@@ -2147,7 +2140,6 @@
+
+ # The C compiler and preprocessor, put into ANSI mode if possible.
+ AC_PROG_CC
+-AC_PROG_CC_STDC
+ AC_PROG_CPP
+
+
+@@ -2169,11 +2161,11 @@
+
+ # The C++ compiler, if desired.
+ want_cxx=no
++AC_PROG_CXX
+ if test $enable_cxx != no; then
+   test_CXXFLAGS=${CXXFLAGS+set}
+-  AC_PROG_CXX
+
+-  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AC_FD_CC
++  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
+   cxxflags_ac_prog_cxx=$CXXFLAGS
+   cxxflags_list=ac_prog_cxx
+
+@@ -2289,7 +2281,7 @@
+ fi
+
+
+-cat >&AC_FD_CC <<EOF
++cat >&AS_MESSAGE_LOG_FD() <<EOF
+ Decided:
+ ABI=$ABI
+ CC=$CC
+@@ -3638,7 +3630,7 @@
+ # FIXME: Upcoming version of autoconf/automake may not like broken lines.
+ #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
+
+-AC_OUTPUT(Makefile							\
++AC_CONFIG_FILES([Makefile							\
+   mpf/Makefile mpn/Makefile mpq/Makefile				\
+   mpz/Makefile printf/Makefile scanf/Makefile rand/Makefile cxx/Makefile \
+   tests/Makefile tests/devel/Makefile					\
+@@ -3647,7 +3639,8 @@
+   tests/cxx/Makefile							\
+   doc/Makefile tune/Makefile						\
+   demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
+-  gmp.h:gmp-h.in)
++  gmp.h:gmp-h.in])
++AC_OUTPUT
+
+ AC_MSG_NOTICE([summary of build options:
diff --git a/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
deleted file mode 100644
index 8ff1bcf..0000000
--- a/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has depricated automatic de-ANSI-fication support
-
-this patch avoids these kinds of errors:
-
-| configure.in:2240: error: automatic de-ANSI-fication support has been removed
-| Makefile.am:28: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: gmp-5.0.4/configure.in
-===================================================================
---- gmp-5.0.4.orig/configure.in
-+++ gmp-5.0.4/configure.in
-@@ -59,7 +59,7 @@ dnl
- dnl  Note that there's a copy of these options in the top-level Makefile.am,
- dnl  so update there too if changing anything.
- dnl
--AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
-+AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
- AM_CONFIG_HEADER(config.h:config.in)
- AM_MAINTAINER_MODE
- 
-@@ -2236,9 +2236,6 @@ fi
- echo "      MPN_PATH=\"$path\""
- 
- 
--# Automake ansi2knr support.
--AM_C_PROTOTYPES
--
- CL_AS_NOEXECSTACK
- 
- GMP_PROG_AR
-Index: gmp-5.0.4/Makefile.am
-===================================================================
---- gmp-5.0.4.orig/Makefile.am
-+++ gmp-5.0.4/Makefile.am
-@@ -25,7 +25,7 @@
- # Makefiles in subdirectories, but here we must omit it so automake gives
- # the actual ansi2knr build rule, not "cd $(top_builddir) && make ansi2knr".
- #
--AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies ansi2knr
-+AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies
- 
- 
- # Libtool -version-info for libgmp.la and libmp.la.  See "Versioning" in the
diff --git a/meta/recipes-support/gmp/gmp_5.0.5.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
similarity index 60%
rename from meta/recipes-support/gmp/gmp_5.0.5.bb
rename to meta/recipes-support/gmp/gmp_5.1.0.bb
index d91340c..9cb80fe 100644
--- a/meta/recipes-support/gmp/gmp_5.0.5.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
-                   file://gmp_fix_for_automake-1.12.patch \
                    "
 
-SRC_URI[md5sum] = "041487d25e9c230b0c42b106361055fe"
-SRC_URI[sha256sum] = "1f588aaccc41bb9aed946f9fe38521c26d8b290d003c5df807f65690f2aadec9"
+SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
+SRC_URI[sha256sum] = "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"
-- 
1.7.10.4



