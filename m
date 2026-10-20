Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10708.1792462991366130058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 19:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pU9S5x/6;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-185fd3a4ca3so298053c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462991; x=1793067791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqaQGXU+aYEoiOteGEVopsJx1yClPJSnr7DC6UUfHMM=;
        b=pU9S5x/6wNT48Z2YtSbPOk6JpoMLVfZNCDAwTQdfWm13a6fpYwm8yc3mSSNhMTuGKS
         QrFz9z9VUo9t+1IOxAwUC4Zvi6YUwzEe8xj1FM/kBNR8HW6Z2BuoosyoRwHBxk3eoU1q
         CNC/YEkmgfYuV2ydkbjT64yMxxlA0WLJemZvcBTWi47zuEIE4B4ED5lm7W5AVWHVC2ZZ
         5nYtswlm4OQ8l4n+v9dVS22itbaFh/GEMfSwHuIgjLhgcqQS5G2GM6gFSuGwg/ACA35A
         aY8sWQG3n0I90cVXPQ3hQrle9w1VAN66AG2PZ+EPRNH/1k4eaRxjM7B+GWkeRmdeU5KL
         K9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462991; x=1793067791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqaQGXU+aYEoiOteGEVopsJx1yClPJSnr7DC6UUfHMM=;
        b=YiqLdybBpfkefdaBAMjKwa7kcI4G6TgwMf0lA5uzpgD+cVOIZxYo54rr4mcapC55gi
         RShoy+A0b9CAOz+W3pehKZqi6m5iBea3c0ao47VZQb722T073x3R68KRvVQTjBPUrrcW
         lReTtPh9kWWJgsK7J4JjwT+M6fQ7uFTHGR2fJAq7YVOJZMFP3mzv9hFut84hXQ8hZbKN
         cEOAxvxDVKxOyZvLGIrPXANnyq681Ya3aaqojsPm6sP1J6HTEvFAF5MdG55pTLoygnyX
         rC3/4zUj9Tj+7iuRZUnnrE7dvX8U5MmQYC9PheFA5YdLN6ePQtLJY5MEWbxNLeTDTIdz
         +gLg==
X-Gm-Message-State: AFq9FYIabkcg9WDV1FhYCRtrkFdyVzBhS9SjlYAUh62Iv8hdwlyTzHPR
	iC9OPhJh9YXkwYo1ZdKGtEdpIRDUVDNGJXqvffEfh+z+yBc/n0XN8fNkTRZGf37Yv/E=
X-Gm-Gg: AYBFou2O8106ZhLnioLvJYEtSIVwXYO5CdZ+Nnj4D08Sm7yROExVUPAq6xf9MmhQYIu
	LvgQn1jNKbGnjYbJCpuVIVn0wLDHIwAUipC8ovYWnXfx3CQA8u+sk4suSf984tlOClf5tlmnQ8D
	Egwxk+JezCvw4ILYakN+qEO9WieM2n0OQrRMbS0avOq2sopcEtDEvzB23YsHROnkZd5x7gkaQMB
	T9ZUe6jjCL6W7Kom2O6bZ6VJnYV3jSLbZhJh8qo4lu4xuYUixtA0qaOUsO6oETOvLeoHOazYmt9
	AlXuMj6KZETKkuwknCek38B3X1OakOfOJ/U3B1iDWMQw9OjfJnr4w6nuqXhf5qgSZKXBUAnGU2D
	yi26iyIAynZ3z4txm4e4u1Pjbu6a5Y8PP/FjtPYeqn6TgRKU8BL0LGue2idPFm0FMDjhC4RGoaw
	FB4PBPawGuudhAcZw1rY/F4omKDWRHJy1w4Hlp85xPviB77NMJ65FlEfWhHIIKbGsLc248nvs0A
	rmta6nUr+CiV9kRFyNkQUjLZDcnpiisjQYXpHS6onhuIxAtWeJ3Yw+6CpBpYUuP/d9bmi5o8bFS
	9gfS4vSsdUyAK1i2PejDlIrcxhlFuXieh/my5psPXM98mUOdGXRWu15Nuk8VG2P6UqInytHIncK
	IkmCE8MBbVxjdD1c4i3PNbZ77psfIckp2T02vzLCn4oTl9ICj5KVp2je6wt5yXUq7bMvz2YMS9K
	6L0TrfZpx6pjyUUmMTme07eMjoUQ9GFMbjKCANYxv05jiO+Q==
X-Received: by 2002:a05:7022:297:20b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-18512d2ef47mr12911883c88.26.1792462990280;
        Mon, 19 Oct 2026 19:23:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32853719c88.7.2026.10.19.19.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:23:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libfyaml: Detect the need for libatomic at configure time
Date: Mon, 19 Oct 2026 19:23:06 -0700
Message-ID: <20261020022306.962424-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248212
Content-Type: text/plain; charset="utf-8"

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
---
 ...e-platforms-need-latomic-for-atomics.patch | 95 +++++++++++++++++++
 .../libfyaml/libfyaml_0.9.6.bb                |  3 +-
 2 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch

diff --git a/meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch b/meta/recipes-support/libfyaml/libfyaml/0003-autoconf-Some-platforms-need-latomic-for-atomics.patch
new file mode 100644
index 0000000000..545ec6bad6
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
index 012ff7052d..d8050f44d9 100644
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
