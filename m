Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30078.1793868242495557784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Nx1HPfqe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9499955e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868241; x=1794473041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eynollC/3ZH9l9OdSSy8XUZhx+nxkdPkQ5liuF14r8E=;
        b=Nx1HPfqePSXjeNf78+fZhK/lW0A5MRK0x2NGrXUdxTBHz+Av7BWttg0FL7yXA34XGh
         Z1zyiCtOINGHUuN2owwvY0IQtEq/n5hZzeU7dYtqXdj8OoPMV+ArSLCqFFdVSjOhpNUB
         M3zCAKJFiJMdSXjnW47wuqEcmKy4B8wbGaRxGCP3BpyspLZ3V/jT6mS4vf4UdpsuS1gJ
         iryPydCV3ks9TG9UCaiMAIdIybbHez2rqK4Fma2egbH3dii4I2X80f1kT8urmIuxK5qu
         7UXjn9i6FBxJj/1Zlc3DRov0QtnGE5NqJYCVS3dc486RhPCUmLYs2NRNpdwh4WTjmoj0
         GUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868241; x=1794473041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eynollC/3ZH9l9OdSSy8XUZhx+nxkdPkQ5liuF14r8E=;
        b=MyKsNnEdyOuvjqeZ7aBft+WeAS1utx182dYYJ7aAxwfAaYRr5XalBEfWteHNUXw1FV
         k9fdwlCTQmjpz8hZJwgswgSfIJpsjL2lnJdYBqHPYDv6dLu492JG/vZUkM61oZeiAdxi
         4Sj8JgH8XJnUOqWl2LTO55ZsQ3P54d/nFf1jr4I/oGDZ9vrA+ohviRwkKaKyOXbOKivs
         e007XBpq+yhegH7lHwfcKl0BkryWvC1yUnFlyz76r+Q+bUfrh+9YwvGaw4vdGJVMplaw
         emjurzr95A5OfiNAD4U+HzNcR4r7Dv9TRgyOtHkPLaQVMcl1FC+T+XBx6nK35tgmV/QQ
         QuGw==
X-Gm-Message-State: APuU4Z+rSC4Db+PISEZo2Yp8x3J452Db685vgvPD7TjpeIB890y+izTs
	yOTg1c+HGY5AXis8XoXIvTnfEXkFG5/ZYKZcpsoJq0if32srMXQ9z2wxHqQhTGz46LW/rQl2kJW
	/Ldd8CcU=
X-Gm-Gg: AYBFou0gHKkntZhuh1/qME0veml9gA18iOBpEKHarB5EnylxSjFP3LSwaAsinjE8q54
	9GguPuFEJ31+nWYTQpA2aiwrWwlb8agrP1lZzb+EhBQHPouq/Jm9QHyzjstyncnNvFFbDGNZUJd
	M0hD+4ni/g0cpIlHHiydF+3JRa4Q762DZjF8PU19/6LEP4/OZX34iczYV8ImboFiI58glzsE89s
	42nbTZksbJh2qHE+J0BIcVtiU7deVJO0fEjqcW2UoIhnNegKT4PaWv5xtK9dhBYwcwWvtpLU068
	SZFMZyGcTYJ/NAqyoNEk34/Dwe0fFYBMCAUcrR22ac9tD8yRED1t3gV9gNprzol1yHzHiUqYZ7e
	xHmrUHMQwFCtw3O/3MIdSrkWT12IoLdQ5z0YxFz30zSrFoQ5S+v8+XgXpCnTXKfjSloFqi5M1fD
	joQmGfht4cIXKApfkwxZDUPcHKn5Dj6zSaEE28TUUA4VxetelVvWeGTRgSwuWOHbOqXS7rIYetT
	nfGVEK0ntKa5nNcI2i58nWxBKpfuAEvN3UkWSuNUFN8t76jpK6sWstqmgHhHpcMYOt7GyY/i0YI
	JLMBZmRuLupB0fh1rbLe/aQ/aab6+GNMW1Jnmr1ryoow0euf+OFk6C+qNN7MiCQ9Gy3DMttRbvx
	SRZZsmC1kSe3lR2PHzBIBcxi4tdxREw==
X-Received: by 2002:a05:6000:4a05:b0:491:8462:20c6 with SMTP id ffacd0b85a97d-4918462226dmr1675885f8f.18.1793868240553;
        Thu, 05 Nov 2026 00:44:00 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 41/60] libfyaml: Detect the need for libatomic at configure time
Date: Thu,  5 Nov 2026 09:43:00 +0100
Message-ID: <75c322d6d04099a4a0d6cf8e52880a5ba4c37b90.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249500
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Backport the upstream autoconf check which links a program using 8-byte
atomics, first without and then with -latomic, and adds -latomic to the
library link and libfyaml.pc when needed.

This replaces the TUNE_FEATURES match added in bea66b4bce, which had to
enumerate the 32-bit tunes and could not tell whether the compiler can
do the 8-byte operations inline. Clang does not link libatomic
implicitly, so on mips, powerpc, riscv32 and i486 builds failed with:

  error: undefined reference: __atomic_load_8
  error: undefined reference: __atomic_compare_exchange_8

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42cc96e3ff41793446444c3a34ce9402066cab3a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...e-platforms-need-latomic-for-atomics.patch | 95 +++++++++++++++++++
 .../libfyaml/libfyaml_0.9.6.bb                |  3 +-
 2 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch

diff --git a/meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch b/meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch
new file mode 100644
index 00000000000..545ec6bad6c
--- /dev/null
+++ b/meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch
@@ -0,0 +1,95 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pantelis Antoniou <panto@debian-ppc.home.arpa>
+Date: Wed, 6 May 2026 10:51:13 +0300
+Subject: [PATCH] autoconf: Some platforms need -latomic for atomics
+
+Some (admittedly old) platforms require -latomic to support
+8 byte atomics. So probe for it and then wire it all through
+the build.
+
+Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
+
+Upstream-Status: Backport [https://github.com/pantoniou/libfyaml/commit/fdfe2c054235ddbf83a2b235d08aba6316ae1ad1]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac    | 34 +++++++++++++++++++++++++++++++++-
+ libfyaml.pc.in  |  2 +-
+ src/Makefile.am |  2 +-
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f5c854f..eb62f9c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,7 +30,7 @@ m4_pattern_allow([^(AM_EXTRA_RECURSIVE_TARGETS|AM_PROG_AR)$])dnl
+ # include them
+ m4_ifdef([AM_EXTRA_RECURSIVE_TARGETS],
+ 	 [AM_EXTRA_RECURSIVE_TARGETS([doc-help doc-html doc-latexpdf doc-man doc-clean doc-markdown])],
+-	 [AC_MSG_WARN([Old automake version without AM_EXTRA_RECURSIVE_TARGETS, doc-* rules won't be available at top level])])
++	 [AC_MSG_WARN([Old automake version without AM_EXTRA_RECURSIVE_TARGETS, doc-* rules will not be available at top level])])
+ 
+ m4_define(fyaml_major, `echo $VERSION | cut -d. -f1 | cut -d- -f1`)
+ m4_define(fyaml_minor, `echo $VERSION | cut -d. -f2 | cut -d- -f1`)
+@@ -656,6 +656,38 @@ AC_SUBST(HAVE_HEAP_TRAMPOLINES)
+ AC_DEFINE_UNQUOTED([HAVE_HEAP_TRAMPOLINES], [$HAVE_HEAP_TRAMPOLINES], [Define to 1 if GCC heap trampolines are enabled])
+ AM_CONDITIONAL([HAVE_HEAP_TRAMPOLINES], [ test x$HAVE_HEAP_TRAMPOLINES = x1 ])
+ 
++dnl check if -latomic is needed
++AC_CACHE_CHECK([whether 8-byte atomics need -latomic],
++  [ac_cv_libatomic_needed],
++  [
++    save_LIBS="$LIBS"
++
++    AC_LINK_IFELSE(
++      [AC_LANG_PROGRAM([[]], [[
++        volatile unsigned long long v = 1;
++        return (int)__atomic_fetch_sub(&v, 1, __ATOMIC_SEQ_CST);
++      ]])],
++      [ac_cv_libatomic_needed=no],
++      [
++        LIBS="$save_LIBS -latomic"
++        AC_LINK_IFELSE(
++          [AC_LANG_PROGRAM([[]], [[
++            volatile unsigned long long v = 1;
++            return (int)__atomic_fetch_sub(&v, 1, __ATOMIC_SEQ_CST);
++          ]])],
++          [ac_cv_libatomic_needed=yes],
++          [ac_cv_libatomic_needed=unknown])
++      ])
++
++    LIBS="$save_LIBS"
++  ])
++
++AS_IF([test "x$ac_cv_libatomic_needed" = "xyes"], [LIBS="$LIBS -latomic" ],
++      [test "x$ac_cv_libatomic_needed" = "xunknown"],
++	[ AC_MSG_ERROR([compiler supports __atomic builtins but linking 8-byte atomics failed, even with -latomic]) ])
++AS_IF([test "x$ac_cv_libatomic_needed" = "xyes"], [ATOMIC_LIBS="-latomic"], [ ATOMIC_LIBS="" ])
++AC_SUBST([ATOMIC_LIBS])
++
+ dnl trim cflags, cppflags, ldflags
+ CFLAGS=`echo $CFLAGS | sed -e 's/^[ ]*//'`
+ CPPFLAGS=`echo $CPPFLAGS | sed -e 's/^[ ]*//'`
+diff --git a/libfyaml.pc.in b/libfyaml.pc.in
+index 17278cc..9fce459 100644
+--- a/libfyaml.pc.in
++++ b/libfyaml.pc.in
+@@ -6,5 +6,5 @@ includedir=@includedir@
+ Name: libfyaml
+ Description: Fancy YAML 1.3 parser library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} @ASAN_LIBS@ @PTHREAD_LIBS@ @LIBCLANG_LDFLAGS@ @LIBCLANG_LIBS@ @LIBM@ -lfyaml
++Libs: -L${libdir} @ASAN_LIBS@ @PTHREAD_LIBS@ @LIBCLANG_LDFLAGS@ @LIBCLANG_LIBS@ @LIBM@ @ATOMIC_LIBS@ -lfyaml
+ Cflags: -I${includedir} @ASAN_CFLAGS@ @PTHREAD_CFLAGS@
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7d0aab5..1aa24b5 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -74,7 +74,7 @@ libfyaml_la_CPPFLAGS = $(AM_CPPFLAGS) $(INTERNAL_INCLUDES)
+ libfyaml_la_CFLAGS = $(AM_CFLAGS)
+ libfyaml_la_LDFLAGS = -no-undefined $(AM_LDFLAGS) $(AM_LIBLDFLAGS) \
+ 		      -version $(LIBTOOL_VERSION)
+-libfyaml_la_LIBADD = $(LIBM)
++libfyaml_la_LIBADD = $(LIBM) $(ATOMIC_LIBS)
+ 
+ # blake3 section
+ libfyaml_la_CPPFLAGS += -I$(top_srcdir)/src/blake3
diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 012ff7052d9..d8050f44d95 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -9,11 +9,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libfyaml-${PV}.tar.gz \
            file://0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch \
            file://0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch \
            file://0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch \
+           file://0003-autoconf-Some-platforms-need-latomic-for-atomics.patch \
            "
 SRC_URI[sha256sum] = "a59cc3331e2eb903ec36933ad52a45888041cac31e44f553a00511131242c483"
 
 inherit autotools pkgconfig github-releases
-# Specify linking with -latomic on architectures missing 64bit atomics.
-LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', '32 armv5 o32 m32', '-latomic', '', d)}"
 
 BBCLASSEXTEND = "native"
