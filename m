Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30071.1793868238194857942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gaNhy8vt;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so14464385e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868236; x=1794473036; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g01/FSTSQU2XTmFf4g7Q08PgeneOG2riiSOYiE9J1Ls=;
        b=gaNhy8vtfpBeG4dOb6rSpBfGcxPVvFMxSpwvhLkH/DyS2PFRVO2hOeanOudWUaq5/+
         ZYbhM3HKIl+7Gn2wmEcdpmYkccn4bDzgU3PIDoyo1/UN2Fsdudrsdl1s/+YjBSKCEres
         NOWMNafJG40BqlZZe16AT5hE2loWZd0YjSAvjWmgebxlJMI+4/ym88lg7RMuETV4zrq3
         aISLjHnYev+AoZu3sB/H0xosTKZgv0OxJbGHzRx09SGLzVy0pMK0CnYUIoQmlg3NOYyN
         33KUsQWMFvFqk8203T3wQWmAkLEOEzXyYEoFFTLieorootY/C8arVvKq4TMfeu0ys58I
         /ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868236; x=1794473036;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g01/FSTSQU2XTmFf4g7Q08PgeneOG2riiSOYiE9J1Ls=;
        b=quWDaSeA1RvH0MtgDIGC12A7/1FibtxUJftG4OgygdncJ2LrFDJDctTBDBZJQRnQFF
         JN8S31fmd3Hut1I0VaK1gh79ml+wxMCQiAwVg8Qv+zGJZNgAS1h6aeRsPRZQvBdgrt77
         WFDKmKBmo39csvWglu9XoPbt1bNOPXERzSSIf3xXaJ+p1J6Z/RbszTjfJSHt4p7zmS4o
         muUTKv86J4sY4X+xLNtpQAaXjX6qIQWtJeaF3zPMMrFVjVzCT0lenPl1goMYyF2D8o98
         IW0BdsCNpx8Ax59F5qVLyFhgvBE5SB/PiHbbw/PML5hssIJ/ouChhV7wZXpOXCBUS9id
         2T1Q==
X-Gm-Message-State: APuU4Z991vbuznpY6cyiY/QKkKvbAGSsJv8x+nZQgoTRvMEQf6CDiRql
	uPnZbFKVfggCKzGDLXip+VEt+awKBeMH/Nd9BgYmADawv0sd0b2tKTzozRasrBSrFRH3H0PHcNv
	70sGNMEY=
X-Gm-Gg: AYBFou3hP5LBx6au2TEgv10Dyt+hrbYzT13SK0+pRspLOYWy3tR6SXhAmp/SG+RY/oo
	QydZiwT6Lzh5YwxuNQHoAKJ2pTWCBSOmoj+D3JBrrZJbzWGnwhx5V2ng66E5lzn9an7JxCBKuz8
	O7Og+K+VX9PAWunmmvGc7IVT9rDVFCCwuueSakPpko3/z4NCPNIDss9TnN02SKYz3T6nADks4Yb
	Xb8GTqwT79vgTs9vO9A+n2mHoExNGzhOe4jmy5JDW3WNRu5wxpl98IkP1J6GCS0LfEDn8Aok4hw
	tdatrJmpwhkdWrBoo9/7YIvxyKx8VPRadrXLLhxOkSNF6GMqxN2HBWXRrpT+GVs0TZ0X/ODCArF
	QIGxJ1luOQoArRp89YbUxg/oyI5kM2wBmDOlSrbZiBfLBvUss7iP5xcMy2wOB7VGRHSrAST02HO
	ozulnyWBm08MJvCdDDIaaUDQyHuQxLpjHhxypJpcVn74xABrukN+8QkidaYDBezwRGb/pRhydSB
	SoIjUhBfwgChnDsh9Ixr7z6QDEG2a1JNJcBGkPexFzJzsj/AqNT4pDg4AV3LV+IXG9UMyBWiSV9
	KGEBA9TSTZGHO7oRI7I0UqFduj5X/6eec5FKXmYObq06m5rGuXToSa4AhLvcauHVOwL6tkX6PC7
	MHH9Ep+0LdPZApfXGa7UKBijOfqkz
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr388052405e9.33.1793868236351;
        Thu, 05 Nov 2026 00:43:56 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 33/60] lttng-tools: skip kernel cases when kernel tests are disabled
Date: Thu,  5 Nov 2026 09:42:52 +0100
Message-ID: <1f18c5a923cc69ca3fff4281356e4f270760ca25.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249492
Content-Type: text/plain; charset="utf-8"

From: Owen O'Hehir <oo.hehir@gmail.com>

run-ptest sets LTTNG_TOOLS_DISABLE_KERNEL_TESTS when lttng-modules is not
installed, as on riscv64, but kernel/test_event_disable.py &
tools/save-load/test_save_load.py check only for root & fail with "Kernel
tracer not available". Carry the fix sent upstream.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81c564aa99d9d194e82fe230cc04a2df6b2fae3e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++++++++++++
 .../lttng/lttng-tools_2.16.0.bb               |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch
new file mode 100644
index 00000000000..ca041e8da87
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch
@@ -0,0 +1,108 @@
+From f56f36ecd7481d96c99876e8a6f4a609197e7132 Mon Sep 17 00:00:00 2001
+From: OOHehir <oo.hehir@gmail.com>
+Date: Tue, 13 Oct 2026 09:41:51 +0100
+Subject: [PATCH] Fix: tests: honour LTTNG_TOOLS_DISABLE_KERNEL_TESTS in two
+ Python tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+OBSERVED ISSUE
+━━━━━━━━━━━━━━
+On a target without lttng-modules, kernel/test_event_disable.py & the
+kernel cases of tools/save-load/test_save_load.py fail with "Kernel tracer
+not available", although the test run sets LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1.
+Observed with the Yocto Project ptest on riscv64, which ships no lttng-modules.
+
+CAUSE
+━━━━━
+Both scripts only check that they run as root before running kernel cases,
+while the other Python tests use lttngtest._Environment.run_kernel_tests(),
+which also honours LTTNG_TOOLS_DISABLE_KERNEL_TESTS.
+
+SOLUTION
+━━━━━━━━
+Use run_kernel_tests() in both scripts. It checks for root as before, & also
+honours LTTNG_TOOLS_DISABLE_KERNEL_TESTS.
+
+Under review on Gerrit: https://review.lttng.org/c/lttng-tools/+/18903
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2026-October/031100.html]
+Signed-off-by: OOHehir <oo.hehir@gmail.com>
+---
+ tests/regression/kernel/test_event_disable.py      | 7 ++-----
+ tests/regression/tools/save-load/test_save_load.py | 9 ++++-----
+ 2 files changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/tests/regression/kernel/test_event_disable.py b/tests/regression/kernel/test_event_disable.py
+index da9f146..a373544 100755
+--- a/tests/regression/kernel/test_event_disable.py
++++ b/tests/regression/kernel/test_event_disable.py
+@@ -15,7 +15,6 @@ Validates that disabling events works correctly:
+ - Disabling by name disables all matching rules regardless of filters
+ """
+ 
+-import os
+ import pathlib
+ import sys
+ import traceback
+@@ -307,11 +306,9 @@ if __name__ == "__main__":
+         ),
+     ]
+ 
+-    is_root = os.getuid() == 0
+-
+-    if not is_root:
++    if not lttngtest._Environment.run_kernel_tests():
+         tap = lttngtest.TapGenerator(len(kernel_tests))
+-        tap.skip_all_remaining("Kernel tests require root privileges")
++        tap.skip_all_remaining("Kernel tests not enabled")
+         sys.exit(0)
+ 
+     tap = lttngtest.TapGenerator(len(kernel_tests))
+diff --git a/tests/regression/tools/save-load/test_save_load.py b/tests/regression/tools/save-load/test_save_load.py
+index 9dd8042..1983263 100755
+--- a/tests/regression/tools/save-load/test_save_load.py
++++ b/tests/regression/tools/save-load/test_save_load.py
+@@ -13,7 +13,6 @@ through save/load cycles, including:
+ - Kernel syscalls and tracepoints
+ """
+ 
+-import os
+ import pathlib
+ import sys
+ import traceback
+@@ -953,11 +952,11 @@ if __name__ == "__main__":
+         ),
+     ]
+ 
+-    is_root = os.getuid() == 0
++    run_kernel_tests = lttngtest._Environment.run_kernel_tests()
+     allows_destructive = lttngtest._Environment.allows_destructive()
+ 
+     total_tests = len(user_tests) + len(agent_tests)
+-    if is_root:
++    if run_kernel_tests:
+         total_tests += len(kernel_tests)
+         if allows_destructive:
+             total_tests += len(destructive_kernel_tests)
+@@ -971,7 +970,7 @@ if __name__ == "__main__":
+         for test_name, test_func, kwargs in agent_tests:
+             run_test(tap, test_env, test_func, test_name, **kwargs)
+ 
+-    if is_root:
++    if run_kernel_tests:
+         with lttngtest.test_environment(
+             with_sessiond=True, log=tap.diagnostic, enable_kernel_domain=True
+         ) as test_env:
+@@ -986,6 +985,6 @@ if __name__ == "__main__":
+                     "Skipping destructive kernel tests (LTTNG_ENABLE_DESTRUCTIVE_TESTS not set)"
+                 )
+     else:
+-        tap.diagnostic("Skipping kernel tests (not running as root)")
++        tap.diagnostic("Skipping kernel tests (not enabled)")
+ 
+     sys.exit(0 if tap.is_successful else 1)
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
index cfc16ed6c77..347bdcc2731 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
@@ -72,6 +72,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests2.patch \
            file://0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch \
            file://muslfix.patch \
+           file://0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch \
            "
 
 SRC_URI[sha256sum] = "b8b3244894e49e773d4942b8899f768057974edf75c18dbb48b65bb123c7b2c7"
