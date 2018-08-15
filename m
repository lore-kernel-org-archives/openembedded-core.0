Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 31BB8744E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:51:58 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id y5-v6so1075451pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h8JFia4ioojj1kaxrlWFzm/5Z71IUe57FjZPwRKZEdM=;
	b=i47nXJr98trSdPhLDwbhVDevnpksjxObAziwzIeRg1S1JXnu7itQq9SrHrw+Vn0AL1
	nVFHnRmlkldzw1PrzL7Dn9buwKE+QH/39aAzbfQaymSDgHqCagvlGPW1tZjaBKSgH3Kt
	eMb7szrWeJ7Js4x33C0NkqqG/r4uTPtVcJHf0cqoTOXxAZ/wSeddnBd4KE9LQxWEetVq
	RMUOK79Vc8RcokegCVSzPpRgbo5Yv9SG08ROZbDJQrlF7g6oOi3kiHCyf7b7CymXuusK
	0kQVc+j2Vy2QVHnCpu1v6KAItEsOaoyzZqvTvsmX5N9Qs6Q/PbVwLs4YGST46Bdf0+zE
	YC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h8JFia4ioojj1kaxrlWFzm/5Z71IUe57FjZPwRKZEdM=;
	b=d6l+Z4G1/WUt5Xic23YhbYBvxH2MeFddbxQSzW0Sp8VrZnLG/32KMy2fxCgTgnJxE5
	hjkg8HigWk1HarPrtoaxq6YiJr62PT9OXx2yEP6vNCbfIgE0nfe4o0N+vFFa3MIFFbOy
	3T5QU7FKDLPaMsEnxI6f3VBvOC0GVvikcui28IIjFq9DNQo+ia+qaW9C+RGaLsMi6R4j
	e4TXSkBxBNkvqjZsPtgLz8vmndQn0Xcgzev4bz8+9nxK6F1I9fslAtM1iHgHsB+D/l8r
	/5AZ4ObC8T1EyeOiIDM9cU8uwRXs9vsarDzN/iPA413s56cOtpbM+dW7pFzomAGUbgnm
	MPAA==
X-Gm-Message-State: AOUpUlGo/9x3NSwrkxtULWfAfBLh7p/z/YtmroOksERKk2qFZsmSIs80
	/hDtkF0n3UXrrqO11GCiUmPG/bHO
X-Google-Smtp-Source: AA+uWPwkyrvLFpxLGbwP3LFLsvjMVCZpgD7ubH5Rlyhyv7AcnSk5kuftbQCZWjBZP18F3TDmwIJvyw==
X-Received: by 2002:a63:947:: with SMTP id
	68-v6mr26819473pgj.131.1534369918833; 
	Wed, 15 Aug 2018 14:51:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	m26-v6sm60076032pfi.102.2018.08.15.14.51.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 14:51:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 14:51:49 -0700
Message-Id: <20180815215150.13271-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180815215150.13271-1-raj.khem@gmail.com>
References: <20180815215150.13271-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] mpfr: Upgrade to 4.0.1
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
X-List-Received-Date: Wed, 15 Aug 2018 21:51:58 -0000

Drop patch present in 4.0.1 already
Depend on autoconf-archive to fix

| configure:14652: error: possibly undefined macro: AX_PTHREAD

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mpfr/mpfr/long-long-thumb.patch           | 39 -------------------
 .../mpfr/{mpfr_3.1.5.bb => mpfr_4.0.1.bb}     | 10 ++---
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/mpfr/mpfr/long-long-thumb.patch
 rename meta/recipes-support/mpfr/{mpfr_3.1.5.bb => mpfr_4.0.1.bb} (60%)

diff --git a/meta/recipes-support/mpfr/mpfr/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr/long-long-thumb.patch
deleted file mode 100644
index ca7100eb29..0000000000
--- a/meta/recipes-support/mpfr/mpfr/long-long-thumb.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 84021b1e236508169be65e802a9c0a25fc9a8827 Mon Sep 17 00:00:00 2001
-From: Phil Blundell <philb@gnu.org>
-Date: Mon, 27 Oct 2008 22:26:35 +0000
-Subject: [PATCH] mpfr: crusade against inline assembler
-
-Without this, build fails for thumb:
-| {standard input}: Assembler messages:
-| {standard input}:199: Error: selected processor does not support Thumb mode `umull sl,r0,r2,r1'
-| {standard input}:214: Error: selected processor does not support Thumb mode `umull sl,r2,r1,fp'
-| {standard input}:219: Error: instruction not supported in Thumb16 mode -- `adds fp,r0,sl'
-| {standard input}:220: Error: unshifted register required -- `adc r2,r2,#0'
-| {standard input}:235: Error: selected processor does not support Thumb mode `umull r0,sl,r1,r3'
-| {standard input}:244: Error: selected processor does not support Thumb mode `umull fp,ip,r1,r3'
-| {standard input}:253: Error: instruction not supported in Thumb16 mode -- `adds r3,sl,fp'
-| {standard input}:254: Error: unshifted register required -- `adc ip,ip,#0'
-| {standard input}:259: Error: instruction not supported in Thumb16 mode -- `adds sl,r1,r0'
-| {standard input}:642: Error: selected processor does not support Thumb mode `umull r0,r2,r3,r1'
-| ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=compile arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp-eglibc/sysroots/spitz -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1 -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1 -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DMPFR_HAVE_FESETROUND=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1 -DHAVE_FLOOR=1 -DHAVE_CEIL=1 -DHAVE_NEARBYINT=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1 -DHAVE___GMPN_ROOTREM=1 -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I.     -O2 -pipe -g -feliminate-unused-debug-types -ffloat-store -c -o pow.lo pow.c
-| {standard input}:1154: Error: selected processor does not support Thumb mode `umull r0,r1,sl,ip'
-| {standard input}:1166: Error: selected processor does not support Thumb mode `umull r3,r2,ip,r0'
-| {standard input}:1171: Error: instruction not supported in Thumb16 mode -- `adds r0,r1,r3'
-| {standard input}:1172: Error: unshifted register required -- `adc r2,r2,#0'
-| make[2]: *** [mul.lo] Error 1
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Pending
-
---- mpfr.old/src/mpfr-longlong.h	2008-01-01 03:29:09.000000000 +0000
-+++ mpfr/src/mpfr-longlong.h	2008-10-27 21:46:44.000000000 +0000
-@@ -406,7 +406,7 @@
- 	     "rIJ" ((USItype) (bl)))
- #endif
- 
--#if defined (__arm__) && W_TYPE_SIZE == 32
-+#if defined (__arm__) && W_TYPE_SIZE == 32 && !defined(__thumb__)
- #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
-   __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
- 	   : "=r" (sh), "=&r" (sl)					\
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.5.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
similarity index 60%
rename from meta/recipes-support/mpfr/mpfr_3.1.5.bb
rename to meta/recipes-support/mpfr/mpfr_4.0.1.bb
index a78c0bd486..f85a846e33 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.5.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
@@ -7,13 +7,11 @@ inherit autotools texinfo
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "gmp"
+DEPENDS = "gmp autoconf-archive"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
-           file://long-long-thumb.patch \
-           "
-SRC_URI[md5sum] = "c4ac246cf9795a4491e7766002cd528f"
-SRC_URI[sha256sum] = "015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49ca062bc"
+SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI[md5sum] = "b8dd19bd9bb1ec8831a6a582a7308073"
+SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.18.0


