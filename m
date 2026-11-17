Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9831.1794883613484611784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 18:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qUAobvli;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso4963540eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 18:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883613; x=1795488413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gvg2c/CsEMrWfugiOrlHWA0obz8Qwl89ohRJZ4TUn8=;
        b=qUAobvliFvI7Wpb2c7qkX/PQdBFURtqrsmW/NkehU/VXD68iBn9pbQuRcelehF1Qqe
         eAtrzOcxihetZ7awe8s89wGYuyhZ4mKSI1hKdvHgPvzfNm9L/ICwiNeQw93X8pN+XqbA
         E/eSDKSYbEw7rbDFFymvvV1XL/QbAYs7Ty9t6HbvHwCubwFQcyDRaofBjWOjyeIuSJuX
         U14JfsQWpkcTNn1xPu4N8x2OOT5JWuvOACqAvOrZlTJ5KXMFt4UbJJxyhm1ykh/6+slF
         S74jB1GLbcBVDjLlpYgjbbllx/iwDd6EdHhSShm2dsigtrbp0gGkdCJKkv0KkbiyP+K8
         o6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883613; x=1795488413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gvg2c/CsEMrWfugiOrlHWA0obz8Qwl89ohRJZ4TUn8=;
        b=G1KFXSsxRn6egvmkf/MB29WkAOfMpglSYAqAY2lv/WGjGfIrXb6IIK1dkibaHkEw/C
         Hv4IYvyhO6AiW3wrd830nldo8Zm803cufxksWTdVEHqw9ylx/5ekdyf0hHwnqrZCRTwV
         vZprCBoNlTFXE+ZAJyWkWq4irWR+SkJpAQNvmW/0u47tHs8KRadH3rttFQiQPkSivOQl
         L/raZNCiKMB2ImVsH2B2L8fyueC5IpzwkCq1cjxfUOyHExLDL2g3HZ4aJWDagJeAYyJK
         GtExmF0ZlefLKXNOg2peKbT1QtVpJCECzauBay+AjD7JOLs5JRLg70dPd8sa8UQqWCKs
         XmzA==
X-Gm-Message-State: APuU4Z+ZPMhm2qLHRFbNH3D70Mgm0DBdFs5M9Ume/Vi4LXCK2nqyMK8x
	7ZmMcno5aorDHSNIFZgP9eSuJiUYvfdHkQfsqQw+7po6X6ZgCQvAvsuU0Nch2cp2
X-Gm-Gg: AZFdTZdI3oRbmhHNyYjngg558z/CoCLeZMviEY3Q8hDu0sCmk4vsPn2qo7OHLDSkUWu
	8ueT+FrtQTM5cpViGPOv8FgQGlQucyUjKPGZxoWzwaL/kpuEJQn4WHepFTQNFiOzJmw1exMsuWo
	Hww+bIKQQnXvqGjLYtdRTf2ufHpcBqlZfioPVPOzAbWV4SGLScM3Pa/qQEMGq7Ke4CfGhJ9h3sr
	hj6kAeWhUFwvjG41VCu2lNZjx2rKqjaxKa63YmI67nsqgkS9CF7DGBvCOWfO3ceg0KF92LI4Gj8
	JDV7GQy7xv+jl6hO2GRb0EbS26xLIEBosZOfja/75UclLWKaCSY5Scg3lNKBkzXgwiTE4kN9pYm
	b0BQmraEoCIrk+eScaX4PGccGxD2dNs3cEMbzsuWrTT36OKjmEAdmYcZrRKvm72Gx58w198TEYR
	pdhKi5LAEmzHFJDzy3cNQrk/Ixm72hXrnmIIsSFvywW57iAY8yrmt/KH71NN2gKNOgKMKAiEESw
	KmRbTJ5vyMqbQy4GGw9tZB3m7NDlpZnO8OMQZBiJFxxLjSjFo1LMNe72Q1nvprmIkDU/3OlniwS
	7k4RU4eg6G0/oO9uowC43ITrTIDzf2DmQNk5u7ViUZVQgReLTn8wM1HjcBHeWx5Vqaa0iYQkIpi
	dzzRBM4BXjA==
X-Received: by 2002:a05:7301:a3:b0:380:cc54:9b6b with SMTP id 5a478bee46e88-380cc54a8c7mr1881947eec.40.1794883612530;
        Mon, 16 Nov 2026 18:46:52 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm36229035eec.6.2026.11.16.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:46:52 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jaipaul.cheernam@est.tech,
	ross.burton@arm.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v2] libjitterentropy: upgrade 3.6.3 -> 3.7.0
Date: Tue, 17 Nov 2026 11:46:44 +0900
Message-Id: <20261117024644.2849146-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250398
Content-Type: text/plain; charset="utf-8"

3.7.0 locks the collector memory with mlock(), changes the startup to
meet NTG.1, replaces the SHA3-256 output with XDRBG-256 and adds
jent_status(). LICENSE only changes the copyright year.

Two fixes are needed:

- 3.7.0 uses C11 threads on Linux and makes struct jent_notime_ctx
  private, so rng-tools fails to build. Backport the Linux part of the
  upstream fix.
- The Makefile now uses -std=c11, which hides clock_gettime() on arm,
  mips and riscv. Build with -D_DEFAULT_SOURCE.

This picks up Jaipaul Cheernam's earlier upgrade patch [1].

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20261002071557.74249-2-jaipaul.cheernam@est.tech/

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
v2:
- Picked up Jaipaul's upgrade; backport the rng-tools fix and build
  with -D_DEFAULT_SOURCE for arm, mips and riscv.

Tested:
- qemux86-64 and qemuarm: libjitterentropy with rng-tools.

 ...Linux-and-make-struct-jent_notime_ct.patch | 75 +++++++++++++++++++
 ...opy_3.6.3.bb => libjitterentropy_3.7.0.bb} | 13 +++-
 2 files changed, 85 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb => libjitterentropy_3.7.0.bb} (67%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
new file mode 100644
index 0000000000..6fd654fc37
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
@@ -0,0 +1,75 @@
+From 1bc2ca956d4c64b765c2f19751614949ebe3734d Mon Sep 17 00:00:00 2001
+From: Prasanth R <ragaprasanth@gmail.com>
+Date: Tue, 17 Nov 2026 10:12:23 +0900
+Subject: [PATCH] Use pthreads on Linux and make struct jent_notime_ctx public
+
+3.7.0 switched Linux to C11 <threads.h> and moved struct jent_notime_ctx
+out of jitterentropy.h. This breaks callers that install their own
+thread handler with jent_entropy_switch_notime_impl(), such as
+rng-tools: the start callback no longer takes a pthread start routine,
+and the context is an incomplete type.
+
+Use pthreads on Linux again and define the pthread context in the
+public header, as upstream did in commit a038d0c ("threads: always use
+pthreads on Linux, add a native Win32 backend"). Only the Linux part
+of that commit is taken.
+
+Upstream-Status: Backport [https://github.com/smuellerDD/jitterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c]
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+
+---
+ jitterentropy.h           | 15 ++++++++++++++-
+ src/jitterentropy-timer.c |  8 +-------
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/jitterentropy.h b/jitterentropy.h
+index f935c09..3ab1ba3 100644
+--- a/jitterentropy.h
++++ b/jitterentropy.h
+@@ -154,10 +154,23 @@ extern "C" {
+ #endif
+ #endif
+ 
+-#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__NetBSD__)
++#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__linux__)
+ #define JENT_PTHREAD
+ #endif
+ 
++#ifdef JENT_PTHREAD
++#include <pthread.h>
++/*
++ * Context handed to the jent_notime_thread handlers. It is part of the API:
++ * a caller that installs its own handler with
++ * jent_entropy_switch_notime_impl() has to create and join the thread.
++ */
++struct jent_notime_ctx {
++	pthread_attr_t notime_pthread_attr;	/* pthreads library */
++	pthread_t notime_thread_id;		/* pthreads thread ID */
++};
++#endif
++
+ /* Forward declaration of opaque value */
+ struct rand_data;
+ 
+diff --git a/src/jitterentropy-timer.c b/src/jitterentropy-timer.c
+index 77f732e..2c974f5 100644
+--- a/src/jitterentropy-timer.c
++++ b/src/jitterentropy-timer.c
+@@ -24,13 +24,7 @@
+ /* Timer-less entropy source */
+ #ifdef JENT_CONF_ENABLE_INTERNAL_TIMER
+ 
+-#ifdef JENT_PTHREAD
+-#include <pthread.h>
+-struct jent_notime_ctx {
+-	pthread_attr_t notime_pthread_attr;     /* pthreads library */
+-	pthread_t notime_thread_id;             /* pthreads thread ID */
+-};
+-#else
++#ifndef JENT_PTHREAD
+ #include <threads.h>
+ struct jent_notime_ctx {
+ 	thrd_t notime_thread_id;                /* thread ID */
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
similarity index 67%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index 27c87c1322..2186127b76 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
@@ -5,15 +5,22 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "https://www.chronox.de/jent"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcaa2e2fa77c4ea22e45bf79e9a41093 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV} \
+           file://0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch \
+           "
+SRCREV = "e783cf1c450bce4d72f95c9f9c84546a6094976a"
 
 do_configure[noexec] = "1"
 
+# The Makefile builds with -std=c11, which hides clock_gettime() on
+# targets without a cycle counter in jitterentropy-base-user.h (arm, mips,
+# riscv). Fixed upstream after 3.7.0.
+CFLAGS += "-D_DEFAULT_SOURCE"
+
 LDFLAGS += "-Wl,-O0"
 
 do_install () {
-- 
2.34.1

