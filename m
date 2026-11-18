Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2207.1794960418272630991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iueHdlfW;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so1793544eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 16:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960417; x=1795565217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZ2gP9vZ8otG0kWFghBXpa16zEnTbEoQQ8KOf15EYBY=;
        b=iueHdlfWIDNtceGPbU5SbHk2T0Me9SrCb+L7lMjLvPm7OgFrnSVcQZ5Z0EkC/TB3+P
         wlWE4+7gl8o7hg6YrXkjIcN0p5wxpKJMZMG/7s6s/JLYGscldytBXdfBLGgFaszBajYe
         UJbsW/1HeJb83uE/Wx2f2HnkUvXyGBOveAZOiOHKaYq8jynizCF9EeF2ev4C1AU3FjeS
         foSKMicsOPhCu2lFd4WOBZZOqltary4VcYExyz6RHCVIAbzhiznrI7gIYFqsIyIjlfLo
         ZJ3wviJe/htwX0qWFyP3IRBfLqYSRcSZSg14ZdusXrNUnv4xTwoow2fF9HN3tfAvbzLS
         EF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960417; x=1795565217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZ2gP9vZ8otG0kWFghBXpa16zEnTbEoQQ8KOf15EYBY=;
        b=oN4uwMUxOJ7yXb2z9h1CprHqOk1vJdhlcslaui38IRX0KnXAd2mFeW55HsKmrVkLNy
         msSvH86/DHj+6gmsbN9R4zAthE/XCYMVmIV787EKzvw+sQkLInxtFUZmnh6M5ZC8eQ2c
         pMlJE0TTP2pxRyaB47a5YxPyrD+AM16SMpfieBgH3VK/619QXM6bVhPSFuDuYxYm0oqG
         gqpD9I4c9ANAsyH/HGpdjFPH1zfAZ3P6wt4ijPB1SImTvS71LoOxvhBPS9p0SGxcz28/
         J4mZRuN57+zMgJjSt7ux8XNrLoPCr1UzTFcQ/fEf/VHAV+sVKwJbGhxuAhsJbe1+AyH/
         FhIg==
X-Gm-Message-State: APuU4Z8Ho1Ae2Ip4O1PjPiKgSSYeKXRqwF9C5PQAYDf2JaicfIQiK9Re
	d9SPYc0FrlgAXMCqMrOISmResJPrx3wpWL0a03d2howsevs+aNcfPdscDUQlPV+o
X-Gm-Gg: AYBFou093Eri8b87yTdLjou3GQJOWz91IaEWcnalSlsoFCbFagAUaRYZzugR7LBkyLv
	XLb/mMQkK2hBst73ZhyeXeKIAmHWauZI8mjVfO9NbMuy6SbAEtkdBv5dnMalVzsZO+csBJ5Ma7A
	FZZ/1K8LaPv+JXVfrzxlUiy4GRrNl+aYYU8xq/NsrlG2+4JgfG7fnRnbLkAHPyWwN781pziU/+g
	aFkAoEeBGNnc5ebmIzKx9N9LXNwhsi/L2P1aXLsaZ9jJTkfv6sdI5LBFhYmtGlYqmuU6rtFWEfN
	UImJ5wmttLE4TTUqjjywEOpuGobflPIdXMh7FYonCe5zkXh+chsb2m54yTu3Z/W/2kDwByJCGix
	SQT3zpDWrFa9dUYLmaCiFrofWVPJtQ0Dj7I5pJKKevbWQAtSrlOdSvl4jSwT6SOZHsHxBmVPHiY
	kCC/bOJEsdDdNHb65p342Xi5ie78IiNRaHHx4eKIo7AVQo15B2DsT2kJUUHUjvH5Y+pyU9FvTZT
	vspQrguaHzFm1glL/b5lz+WNjPM8dDO0/0PgxOvMpv9RpL69PuqeJ7PbgsoRnb3EPpUeuwh3hEU
	31ItjZgT8M3jqcdVCfMc8SIOOY1NieQKkdnAV+/xcWezLoXu9Zn4L7NF4lHIbLlh
X-Received: by 2002:a05:7022:ef12:b0:1b3:b322:a42c with SMTP id a92af1059eb24-1b543bd25aemr1057639c88.13.1794960417228;
        Tue, 17 Nov 2026 16:06:57 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544830c99sm2514507c88.15.2026.11.17.16.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:56 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	jaipaul.cheernam@est.tech,
	ross.burton@arm.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v3] libjitterentropy: upgrade 3.6.3 -> 3.7.0
Date: Wed, 18 Nov 2026 09:03:51 +0900
Message-Id: <20261118000351.3409159-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117024644.2849146-1-ragaprasanth@gmail.com>
References: <20261117024644.2849146-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 00:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250502
Content-Type: text/plain; charset="utf-8"

3.7.0 locks the collector memory with mlock(), changes the startup to
meet NTG.1, replaces the SHA3-256 output with XDRBG-256 and adds
jent_status().

Two fixes are needed:

- 3.7.0 uses C11 threads on Linux and makes struct jent_notime_ctx
  private, so rng-tools fails to build. Upstream fixed this on top of
  a larger rework of the thread code; backport only the Linux part
  (see the patch for what is taken and why).
- The Makefile now uses -std=c11, which hides clock_gettime() on arm,
  mips and riscv. Build with -D_DEFAULT_SOURCE.

This picks up Jaipaul Cheernam's earlier upgrade patch [1].

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20261002071557.74249-2-jaipaul.cheernam@est.tech/

License-Update: copyright year changed to 2026
AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
v3:
- Drop a comment I had added above struct jent_notime_ctx; the
  struct is now moved unchanged from src/jitterentropy-timer.c.
- Describe in the backport what is taken from a038d0c and what is
  left out.
- Add License-Update tag.

Tested:
- qemux86-64 and qemuarm: libjitterentropy with rng-tools.

 ...Linux-and-make-struct-jent_notime_ct.patch | 75 +++++++++++++++++++
 ...opy_3.6.3.bb => libjitterentropy_3.7.0.bb} | 13 +++-
 2 files changed, 83 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb => libjitterentropy_3.7.0.bb} (67%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
new file mode 100644
index 0000000000..9a002ccaaf
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthreads-on-Linux-and-make-struct-jent_notime_ct.patch
@@ -0,0 +1,73 @@
+From c8c3df8da9c6beb9855e773b7320051278c2c334 Mon Sep 17 00:00:00 2001
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
+Upstream fixed this in commit a038d0c ("threads: always use pthreads on
+Linux, add a native Win32 backend"), on top of a rework of the thread
+code that 3.7.0 does not have. Only the Linux part is taken here:
+define JENT_PTHREAD on Linux, and move the pthread variant of
+struct jent_notime_ctx unchanged from src/jitterentropy-timer.c to
+jitterentropy.h, where upstream also has it. The Win32 backend and the
+rest of the rework are left out.
+
+Upstream-Status: Backport [https://github.com/smuellerDD/jitterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c]
+Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
+
+---
+ jitterentropy.h           | 10 +++++++++-
+ src/jitterentropy-timer.c |  8 +-------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/jitterentropy.h b/jitterentropy.h
+index f935c09..27ad0ae 100644
+--- a/jitterentropy.h
++++ b/jitterentropy.h
+@@ -154,10 +154,18 @@ extern "C" {
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
++struct jent_notime_ctx {
++	pthread_attr_t notime_pthread_attr;     /* pthreads library */
++	pthread_t notime_thread_id;             /* pthreads thread ID */
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

