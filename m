Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.2884.1593155949778600748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qybdvwk4;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id l12so8327859ejn.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4e1HLjpNnsrlb9Vfpz6XG+4JhAaHDvpndEp8AueZiJE=;
        b=Qybdvwk43zjcZkRKkoulspDzb/ETE1uMs9KWGbIv3wp7Yn+KIXameBKOF5WxUKbJbg
         hXPimgdhGogSOHSqrAF0skqRRuSIMTgUFLuQS+IR3dcyIzARyt4XR+Pd3pHJK3IG1bVr
         O4l8yOzQ7FkIdC6pK46+PO4bRxOT1UdY54+3675VC6q7qYEN9raCunouKZyjWhNu3lfs
         MJNJIwDX53NsVWmpHhcnW0OjLVUtMYwonlc/BPgxHyKtf0ylTuVffsLy9DFUKf3LEvMh
         imvK3rObc1DHYLfc3VCa5F+AmQKOcbfJuA7EHBNc/Hzd0kXMnZiLKQchY489Zyf1T9sJ
         jrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4e1HLjpNnsrlb9Vfpz6XG+4JhAaHDvpndEp8AueZiJE=;
        b=ImXr/Ms8Hittf0FHTS7UA34uzZQh2yXVI0YHveVna+WYpcyy6uXWmg03t/xzIhD6OG
         v/mZIf8CllV3N4W/FGJvA5q4Da0ryB1VXvT7yXSSUSFEqDd+wgpz+A6oKsxsTYyugfkO
         mO34yd8HQS9vU3EypRqFI8UwcQEisY8/1l8Xh0ecPftHugVbNnl6ZVj25hKybdXqPpIz
         6yBalxcI46pZVkyuqsUbMKdEvrQPjlpq1EIdLZQxRi7Nk0TNgRTEzV+pSN/R5gE3L00s
         u/vxcbYg33l53NWq3tLDreDNYYDRQoRoSm4vX2aoq31CrqiT+J2fcKND32QfYfGZCvRz
         Bz/Q==
X-Gm-Message-State: AOAM532juWZVEYo1JtL3pKCxym1U+JgnIXeDywSnGAah1agz9QQ54zX4
	fwGV5X5G0LuXFStz0Cv3n2a82y8ydLg=
X-Google-Smtp-Source: ABdhPJyLnRy70+S9RyNyUqxXh0SqTfEqrYA+07cjGyIBU46gxXfgjeBeQIlRcLK+udU5xAfWCN09EA==
X-Received: by 2002:a17:906:648f:: with SMTP id e15mr1324262ejm.99.1593155947629;
        Fri, 26 Jun 2020 00:19:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/30] libgpg-error: update 1.37 -> 1.38
Date: Fri, 26 Jun 2020 09:18:22 +0200
Message-Id: <20200626071844.29134-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the do_compile_prepend logic as upstream now
handles it correctly.

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-compiling-into-a-separate-build-dir.patch |  43 ++++++
 .../0005-src-gen-lock-obj.sh-add-a-file.patch | 134 ++++++++++++++++++
 .../libgpg-error/libgpg-error_1.37.bb         |  72 ----------
 .../libgpg-error/libgpg-error_1.38.bb         |  42 ++++++
 4 files changed, 219 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error_1.38.bb

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch b/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
new file mode 100644
index 0000000000..20610bee5d
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
@@ -0,0 +1,43 @@
+From 6efe006e99a7e739afbf7fe8937445c82630fc8f Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Mon, 1 Jun 2020 10:24:53 -0400
+Subject: [PATCH] build: Fix cross-compiling into a separate build dir.
+
+* configure.ac: Create the src directory before writing into it.
+* src/Makefile.am (EXTRA_DIST): Add gen-lock-obj.sh.
+
+--
+
+Upstream-Status: Backport
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac    | 1 +
+ src/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index def8bba..8c0d845 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -598,6 +598,7 @@ if test x$cross_compiling = xyes; then
+   case $host in
+     *-*-linux*)
+     lock_obj_h_generated=yes
++    mkdir src
+     LOCK_ABI_VERSION=1 host=$host host_alias=$host_alias \
+         CC=$CC OBJDUMP=$host_alias-objdump \
+         ac_ext=$ac_ext ac_objext=$ac_objext \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 2fb83c0..d773877 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -102,7 +102,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
+ 	gpg-error.vers gpg-error.def.in \
+         versioninfo.rc.in gpg-error.w32-manifest.in \
+ 	gpg-error-config-test.sh gpg-error.pc.in \
+-	$(lock_obj_pub)
++	gen-lock-obj.sh $(lock_obj_pub)
+ 
+ BUILT_SOURCES = $(srcdir)/err-sources.h $(srcdir)/err-codes.h \
+ 	code-to-errno.h code-from-errno.h \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch b/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
new file mode 100644
index 0000000000..e6f6c09bac
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
@@ -0,0 +1,134 @@
+From fcb414abb62223e66dba413d0ca86eab3ea5bbc3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 21 Jun 2020 13:54:47 +0000
+Subject: [PATCH] src-gen-lock-obj.sh: add a file
+
+This is erroneously missing from the tarball; it will show
+up in the next release tarball, as upstream has fixed the
+packaging in master.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/gen-lock-obj.sh | 112 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 112 insertions(+)
+ create mode 100755 src/gen-lock-obj.sh
+
+diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
+new file mode 100755
+index 0000000..13858cf
+--- /dev/null
++++ b/src/gen-lock-obj.sh
+@@ -0,0 +1,112 @@
++#! /bin/sh
++#
++# gen-lock-obj.sh - Build tool to construct the lock object.
++#
++# Copyright (C) 2020 g10 Code GmbH
++#
++# This file is part of libgpg-error.
++#
++# libgpg-error is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public License
++# as published by the Free Software Foundation; either version 2.1 of
++# the License, or (at your option) any later version.
++#
++# libgpg-error is distributed in the hope that it will be useful, but
++# WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with this program; if not, see <https://www.gnu.org/licenses/>.
++#
++
++#
++# Following variables should be defined to invoke this script
++#
++#   CC
++#   OBJDUMP
++#   AWK
++#   ac_ext
++#   ac_object
++#   host
++#   LOCK_ABI_VERSION
++#
++# An example:
++#
++# LOCK_ABI_VERSION=1 host=x86_64-pc-linux-gnu host_alias=x86_64-linux-gnu \
++#     CC=$host_alias-gcc OBJDUMP=$host_alias-objdump ac_ext=c ac_objext=o \
++#     AWK=gawk ./gen-lock-obj.sh
++#
++
++AWK_VERSION_OUTPUT=$($AWK 'BEGIN { print PROCINFO["version"] }')
++if test -n "$AWK_VERSION_OUTPUT"; then
++    # It's GNU awk, which supports PROCINFO.
++    AWK_OPTION=--non-decimal-data
++fi
++
++cat <<'EOF' >conftest.$ac_ext
++#include <pthread.h>
++pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
++EOF
++
++if $CC -c conftest.$ac_ext; then :
++  ac_mtx_size=$($OBJDUMP -j .bss -t conftest.$ac_objext \
++         | $AWK $AWK_OPTION '
++/mtx$/ { mtx_size = int("0x" $5) }
++END { print mtx_size }')
++else
++    echo "Can't determine mutex size"
++    exit 1
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++cat <<EOF
++## lock-obj-pub.$host.h
++## File created by gen-lock-obj.sh - DO NOT EDIT
++## To be included by mkheader into gpg-error.h
++
++typedef struct
++{
++  long _vers;
++  union {
++    volatile char _priv[$ac_mtx_size];
++    long _x_align;
++    long *_xp_align;
++  } u;
++} gpgrt_lock_t;
++
++EOF
++
++# FIXME: Support different alignment conditions of:
++#
++#     USE_16BYTE_ALIGNMENT
++#     USE_DOUBLE_FOR_ALIGNMENT
++#     USE_LONG_DOUBLE_FOR_ALIGNMENT
++#
++
++echo -n "#define GPGRT_LOCK_INITIALIZER {$LOCK_ABI_VERSION,{{"
++
++i=0
++while test "$i" -lt $ac_mtx_size; do
++    if test "$i" -ne 0 -a "$(( $i % 8 ))" -eq 0; then
++        echo ' \'
++        echo -n "                                    "
++    fi
++    echo -n '0'
++    if test "$i" -lt $(($ac_mtx_size - 1)); then
++        echo -n ','
++    fi
++    i=$(( i + 1 ))
++done
++
++cat <<'EOF'
++}}}
++##
++## Local Variables:
++## mode: c
++## buffer-read-only: t
++## End:
++##
++EOF
++
++exit 0
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
deleted file mode 100644
index b9a2b01c20..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY = "Small library that defines common error values for all GnuPG components"
-HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=cd91e3ad1265a0c268efad541a39345e \
-                    file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7"
-
-
-SECTION = "libs"
-
-UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-           file://pkgconfig.patch \
-           file://0001-Do-not-fail-when-testing-config-scripts.patch \
-           "
-
-SRC_URI[md5sum] = "729f22d917494fdc4b54fce5aa6547c7"
-SRC_URI[sha256sum] = "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
-
-BINCONFIG = "${bindir}/gpg-error-config"
-
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
-
-MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
-
-CPPFLAGS += "-P"
-do_compile_prepend() {
-	TARGET_FILE=linux-gnu
-	if [ ${TARGET_OS} = "mingw32" ]; then
-		# There are no arch specific syscfg files for mingw32
-		TARGET_FILE=
-	elif [ ${TARGET_ARCH} = "arc" ]; then
-		# ARC syscfg file is automatically aliased to i686-pc-linux-gnu
-		TARGET_FILE=
-	elif [ ${TARGET_OS} != "linux" ]; then
-		TARGET_FILE=${TARGET_OS}
-	fi
-
-	case ${TARGET_ARCH} in
-	  aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
-	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
-	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
-	  i586|i686)  TUPLE=i686-unknown-linux-gnu;;
-	  mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
-	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
-	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
-	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
-	  ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
-	  ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
-	  ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
-	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
-	esac
-
-	if [ -n "$TARGET_FILE" ]; then
-		cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
-			${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
-	fi
-}
-
-do_install_append() {
-	# we don't have common lisp in OE
-	rm -rf "${D}${datadir}/common-lisp/"
-	oe_multilib_header gpg-error.h gpgrt.h
-}
-
-FILES_${PN}-dev += "${bindir}/gpg-error"
-FILES_${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.38.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.38.bb
new file mode 100644
index 0000000000..9a3ec9b5bd
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.38.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Small library that defines common error values for all GnuPG components"
+HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
+BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=d82591bc81561f617da71e00ff4a9d79 \
+                    file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
+                    "
+
+
+SECTION = "libs"
+
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
+           file://pkgconfig.patch \
+           file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch \
+           file://0005-src-gen-lock-obj.sh-add-a-file.patch \
+           "
+
+SRC_URI[sha256sum] = "d8988275aa69d7149f931c10442e9e34c0242674249e171592b430ff7b3afd02"
+
+BINCONFIG = "${bindir}/gpg-error-config"
+
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
+
+CPPFLAGS += "-P"
+
+do_install_append() {
+	# we don't have common lisp in OE
+	rm -rf "${D}${datadir}/common-lisp/"
+	oe_multilib_header gpg-error.h gpgrt.h
+}
+
+FILES_${PN}-dev += "${bindir}/gpg-error"
+FILES_${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

