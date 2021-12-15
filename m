Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32150C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2679.1639608051958978009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iM+ZQwPW;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id c4so40716768wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQbDKI4oOcFIIhEzKrJhm7ZmW9Bc5LLgC/kddw2zDS4=;
        b=iM+ZQwPWBcL6sDagHAdpsyvFYUvb4GGtS5vXWQEpV8v5jxC/2qXY1u6IPbRuK/pMeJ
         ZcsRiotHRUFS802l0Jq7aIjenJYDNSydeJWCySM2vUvQeNPTFt8ce8CWTimP1WK/yHoQ
         qJyXe2cVqNj+6zAR7ngpLD2U+g8ijc5V53L1F+9LkmqBrZ378RWkTr88z0y103sepTQJ
         K1GK3KdzbS55ETKceHAFngWNynh7TNCV63pHra3dkuoUikl2jSF2aasC0mIrKc0vpJPO
         fd2BY4cPndVV6lYqXkYJbaVHWgCk+DcSg9xO1eBqoyQOtFvD/Vywxhy6kwIZ2e2ciVNb
         TVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQbDKI4oOcFIIhEzKrJhm7ZmW9Bc5LLgC/kddw2zDS4=;
        b=YsyvBLUMvKLGy0VJPZ69Vh1vtrFhhgB6hSlaPYWXqmURgOASvCfffjIrKOZeaQxJcr
         aOz4S0VW6FEcKQp6sUI5cbiIKJnpbLM3UQ6THryJ3eRMJ4IIpYwK+pPRNPFAzEcmQyMf
         3Kb5yqeLXjIAD1hZCgOSTpLUSv5aBQCbeNtgsgzZpxmVUpHViDt9XjMkdpvUHGrW5mMz
         moKVUXG60FLIASkPgMWKVt4iSRWaKLs3J7IS8928VVWZSwljy6zCjLO/VhG9Xp/dbzl4
         8hrCilRY6IVsHcxef5lbldQiaBBs+wAIoY564CWiVoq0BlNtoJaxqnCB2iYfcCrPxTW8
         rnrg==
X-Gm-Message-State: AOAM532wuGVxOIuyksPnMjEA13mosgjtfPbgBzj1tPOw2LOKsoChvvZP
	gwcsIj8PPYOMf/pomv7MND2uW3hIDbpMFQ==
X-Google-Smtp-Source: 
 ABdhPJwshHpSkE7JsyMxo0EovgPFNypjwhPLP8oqaCJo36yp7izeQEUtjIcbp+vAcTjSVwSI4fprmg==
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr6419341wri.195.1639608050497;
        Wed, 15 Dec 2021 14:40:50 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Michael Nosthoff <buildroot@heine.tech>
Subject: [PATCH 18/26] boost: update 1.77.0 -> 1.78.0
Date: Wed, 15 Dec 2021 23:40:26 +0100
Message-Id: <20211215224034.1814148-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159760

Drop backports.

Drop 0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch as
it is difficult to rebase and needs to land upstream first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{boost-1.77.0.inc => boost-1.78.0.inc}    |   2 +-
 ....cmake-allow-searching-for-python310.patch |  50 ------
 ...h-instruction-set-flags-we-do-that-o.patch |  15 +-
 ...efine-SYS_futex-if-it-does-not-exist.patch |  54 -------
 ...th_no_atomic_int-on-the-command-line.patch |  53 ------
 ...oft-failure-in-bernoulli_details_hpp.patch | 151 ------------------
 ...7e01635306085488290ea83de541ec393f8b.patch |  30 ++++
 meta/recipes-support/boost/boost_1.77.0.bb    |  12 --
 meta/recipes-support/boost/boost_1.78.0.bb    |   9 ++
 9 files changed, 50 insertions(+), 326 deletions(-)
 rename meta/recipes-support/boost/{boost-1.77.0.inc => boost-1.78.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
 delete mode 100644 meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
 delete mode 100644 meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
 delete mode 100644 meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
 create mode 100644 meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
 delete mode 100644 meta/recipes-support/boost/boost_1.77.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.78.0.bb

diff --git a/meta/recipes-support/boost/boost-1.77.0.inc b/meta/recipes-support/boost/boost-1.78.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.77.0.inc
rename to meta/recipes-support/boost/boost-1.78.0.inc
index 6df06e76c7..729a47b54f 100644
--- a/meta/recipes-support/boost/boost-1.77.0.inc
+++ b/meta/recipes-support/boost/boost-1.78.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854"
+SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
deleted file mode 100644
index 0a9ee2cc95..0000000000
--- a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 19 Oct 2021 12:24:31 +0000
-Subject: [PATCH] BoostConfig.cmake: allow searching for python310
-
-* accept double digits in Python3_VERSION_MINOR
-
-* if someone is using e.g.:
-  find_package(Python3 REQUIRED)
-  find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})
-
-  with python-3.10 then it currently fails with:
-
-  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version "3.10.0")
-  -- Found Python3: -native/usr/bin/python3-native/python3 (found version "3.10.0") found components: Interpreter
-  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141 (find_package):
-    Could not find a package configuration file provided by "boost_python310"
-    (requested version 1.77.0) with any of the following names:
-
-      boost_python310Config.cmake
-      boost_python310-config.cmake
-
-    Add the installation prefix of "boost_python310" to CMAKE_PREFIX_PATH or
-    set "boost_python310_DIR" to a directory containing one of the above files.
-    If "boost_python310" provides a separate development package or SDK, be
-    sure it has been installed.
-  Call Stack (most recent call first):
-    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boost_find_component)
-    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
-    CMakeLists.txt:18 (find_package)
-
-Upstream-Status: Submitted [https://github.com/boostorg/boost_install/pull/53]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/boost_install/BoostConfig.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_install/BoostConfig.cmake
-index fd17821..5dffa58 100644
---- a/tools/boost_install/BoostConfig.cmake
-+++ b/tools/boost_install/BoostConfig.cmake
-@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
-     set(_BOOST_REQUIRED REQUIRED)
-   endif()
- 
--  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
-+  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$")
- 
-     # handle pythonXY and numpyXY versioned components for compatibility
- 
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 91ab53efd9..67d5dff125 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 8e1d30454afde37eaa3c593ec19d108cd5ed10d0 Mon Sep 17 00:00:00 2001
+From 4d2a8fc8117e56bc283349e5f7f889ebbfc55c71 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -10,14 +10,14 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tools/build/src/tools/gcc.jam | 139 ----------------------------------
- 1 file changed, 139 deletions(-)
+ tools/build/src/tools/gcc.jam | 144 ----------------------------------
+ 1 file changed, 144 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index ff3209f7b..70cbc39a5 100644
+index 47a113223..d77525724 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1217,142 +1217,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1122,147 +1122,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -158,5 +158,10 @@ index ff3209f7b..70cbc39a5 100644
 -cpu-flags gcc OPTIONS : s390x : z13 : -march=z13 ;
 -cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
 -cpu-flags gcc OPTIONS : s390x : z15 : -march=z15 ;
+-# ARM
+-cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard ;
+-cpu-flags gcc OPTIONS : arm : cortex-a53 : -mcpu=cortex-a53 ;
+-cpu-flags gcc OPTIONS : arm : cortex-r5 : -mcpu=cortex-r5 ;
+-cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=cortex-r5 -mfpu=vfpv3-d16 -mfloat-abi=hard ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
diff --git a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch b/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
deleted file mode 100644
index 523568e9bc..0000000000
--- a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d6f7b6064dc91d1d5fa18554b40b14822ab7a32b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Oct 2020 11:13:22 -0700
-Subject: [PATCH] fiber,libs: Define SYS_futex if it does not exist
-
-__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
-they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
-__NR_futex, since this is used in applications, such applications start
-to fail to build for these newer architectures. This patch defines a
-fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
-working
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- boost/fiber/detail/futex.hpp | 5 +++++
- libs/log/src/event.cpp       | 4 ++++
- 2 files changed, 9 insertions(+)
-
-diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
-index e64bd5990..16bee64f1 100644
---- a/boost/fiber/detail/futex.hpp
-+++ b/boost/fiber/detail/futex.hpp
-@@ -17,6 +17,11 @@ extern "C" {
- #include <linux/futex.h>
- #include <sys/syscall.h>
- }
-+
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- #elif BOOST_OS_WINDOWS
- #include <windows.h>
- #endif
-diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
-index 5485154d7..2c7c0381f 100644
---- a/libs/log/src/event.cpp
-+++ b/libs/log/src/event.cpp
-@@ -31,6 +31,10 @@
- #include <linux/futex.h>
- #include <boost/memory_order.hpp>
- 
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- // Some Android NDKs (Google NDK and older Crystax.NET NDK versions) don't define SYS_futex
- #if defined(SYS_futex)
- #define BOOST_LOG_SYS_FUTEX SYS_futex
--- 
-2.28.0
-
diff --git a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch b/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
deleted file mode 100644
index b05b795084..0000000000
--- a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
-From: jzmaddock <john@johnmaddock.co.uk>
-Date: Wed, 1 Sep 2021 18:54:54 +0100
-Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
- line. Allows us to test/emulate platforms with no atomic integers.
-
-[buildroot@heine.tech:
-  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
-  - alter path to match boost release
-]
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
----
-Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/commits/32bd6197353f6ea8e5bef01f09e25c944141acfc]
- boost/math/tools/atomic.hpp | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hpp
-index cc76ed269f..e3cbf5db89 100644
---- a/boost/math/tools/atomic.hpp
-+++ b/boost/math/tools/atomic.hpp
-@@ -16,27 +16,27 @@
- namespace boost {
-    namespace math {
-       namespace detail {
--#if ATOMIC_INT_LOCK_FREE == 2
-+#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
-          typedef std::atomic<int> atomic_counter_type;
-          typedef std::atomic<unsigned> atomic_unsigned_type;
-          typedef int atomic_integer_type;
-          typedef unsigned atomic_unsigned_integer_type;
--#elif ATOMIC_SHORT_LOCK_FREE == 2
-+#elif (ATOMIC_SHORT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
-          typedef std::atomic<short> atomic_counter_type;
-          typedef std::atomic<unsigned short> atomic_unsigned_type;
-          typedef short atomic_integer_type;
-          typedef unsigned short atomic_unsigned_type;
--#elif ATOMIC_LONG_LOCK_FREE == 2
-+#elif (ATOMIC_LONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
-          typedef std::atomic<long> atomic_unsigned_integer_type;
-          typedef std::atomic<unsigned long> atomic_unsigned_type;
-          typedef unsigned long atomic_unsigned_type;
-          typedef long atomic_integer_type;
--#elif ATOMIC_LLONG_LOCK_FREE == 2
-+#elif (ATOMIC_LLONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
-          typedef std::atomic<long long> atomic_unsigned_integer_type;
-          typedef std::atomic<unsigned long long> atomic_unsigned_type;
-          typedef long long atomic_integer_type;
-          typedef unsigned long long atomic_unsigned_integer_type;
--#else
-+#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
- #  define BOOST_MATH_NO_ATOMIC_INT
- #endif
-       } // Namespace detail
diff --git a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
deleted file mode 100644
index f69e4f21f3..0000000000
--- a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
-From: jzmaddock <john@johnmaddock.co.uk>
-Date: Wed, 1 Sep 2021 20:31:53 +0100
-Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
- Include an "escape macro" so thread safety can be disabled if certain
- bernoulli features are to be used in a no-atomics environment. Fixes
- https://github.com/boostorg/math/issues/673.
-
-[buildroot@heine.tech:
-  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
-  - alter path to match boost release
-]
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
----
-Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/commits/7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b]
- .../detail/bernoulli_details.hpp                 | 10 +++++++---
- libs/math/test/Jamfile.v2                        |  3 +++
- test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
- test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
- test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
- 5 files changed, 55 insertions(+), 3 deletions(-)
- create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
- create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
- create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
-
-diff --git a/boost/math/special_functions/detail/bernoulli_details.hpp b/boost/math/special_functions/detail/bernoulli_details.hpp
-index cf35545264..8519b7c89c 100644
---- a/boost/math/special_functions/detail/bernoulli_details.hpp
-+++ b/boost/math/special_functions/detail/bernoulli_details.hpp
-@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
-          return out;
-       }
- 
--      #ifndef BOOST_HAS_THREADS
-+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
-       //
-       // Single threaded code, very simple:
-       //
-@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
-          *out = (i >= m_overflow_limit) ? policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) : bn[i];
-          ++out;
-       }
-+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
-+      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
-       #else
-       //
-       // Double-checked locking pattern, lets us access cached already cached values
-@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
-          return out;
-       }
- 
--      #ifndef BOOST_HAS_THREADS
-+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
-       //
-       // Single threaded code, very simple:
-       //
-@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
-          }
-          ++out;
-       }
-+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
-+      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
-       #else
-       //
-       // Double-checked locking pattern, lets us access cached already cached values
-@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
-    // The value at which we know overflow has already occurred for the Bn:
-    std::size_t m_overflow_limit;
- 
--   #ifdef BOOST_HAS_THREADS
-+   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
-    std::mutex m_mutex;
-    atomic_counter_type m_counter, m_current_precision;
-    #else
-diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
-index 52fb87f5e5..3ac63f9279 100644
---- a/libs/math/test/Jamfile.v2
-+++ b/libs/math/test/Jamfile.v2
-@@ -1137,6 +1137,9 @@ test-suite misc :
- 
- #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
-    [ compile test_no_long_double_policy.cpp ]
-+   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
-+   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
-+   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
- ;
- 
- test-suite interpolators :
-diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
-new file mode 100644
-index 0000000000..61926f7e1f
---- /dev/null
-+++ b/test/compile_test/bernoulli_no_atomic_d.cpp
-@@ -0,0 +1,14 @@
-+//  (C) Copyright John Maddock 2021.
-+//  Use, modification and distribution are subject to the
-+//  Boost Software License, Version 1.0. (See accompanying file
-+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
-+
-+#define BOOST_MATH_NO_ATOMIC_INT
-+
-+#include <boost/math/special_functions/bernoulli.hpp>
-+#include "test_compile_result.hpp"
-+
-+void compile_and_link_test()
-+{
-+   check_result<double>(boost::math::bernoulli_b2n<double>(4));
-+}
-diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
-new file mode 100644
-index 0000000000..bbd7152412
---- /dev/null
-+++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
-@@ -0,0 +1,15 @@
-+//  (C) Copyright John Maddock 2021.
-+//  Use, modification and distribution are subject to the
-+//  Boost Software License, Version 1.0. (See accompanying file
-+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
-+
-+#define BOOST_MATH_NO_ATOMIC_INT
-+
-+#include <boost/math/special_functions/bernoulli.hpp>
-+#include <boost/multiprecision/cpp_bin_float.hpp>
-+#include "test_compile_result.hpp"
-+
-+void compile_and_link_test()
-+{
-+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
-+}
-diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
-new file mode 100644
-index 0000000000..8d5a6e78e6
---- /dev/null
-+++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
-@@ -0,0 +1,16 @@
-+//  (C) Copyright John Maddock 2021.
-+//  Use, modification and distribution are subject to the
-+//  Boost Software License, Version 1.0. (See accompanying file
-+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
-+
-+#define BOOST_MATH_NO_ATOMIC_INT
-+#define BOOST_MATH_BERNOULLI_UNTHREADED
-+
-+#include <boost/math/special_functions/bernoulli.hpp>
-+#include <boost/multiprecision/cpp_bin_float.hpp>
-+#include "test_compile_result.hpp"
-+
-+void compile_and_link_test()
-+{
-+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
-+}
diff --git a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
new file mode 100644
index 0000000000..867ec03ba6
--- /dev/null
+++ b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
@@ -0,0 +1,30 @@
+From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
+From: Leonardo Neumann <leonardo@neumann.dev.br>
+Date: Mon, 13 Dec 2021 01:07:20 -0300
+Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
+
+Boost 1.78.0 fails to build on musl-based systems because musl does
+not include sys/stat.h by default.
+
+Fixes #161 ("Boost compiler error")
+Upstream-Status: Submitted [https://github.com/boostorg/interprocess/pull/162]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ include/boost/interprocess/permissions.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
+index ab55411e..0b21a685 100644
+--- a/boost/interprocess/permissions.hpp
++++ b/boost/interprocess/permissions.hpp
+@@ -29,6 +29,10 @@
+ 
+ #include <boost/interprocess/detail/win32_api.hpp>
+ 
++#else
++
++#include <sys/stat.h>
++
+ #endif
+ 
+ #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes-support/boost/boost_1.77.0.bb
deleted file mode 100644
index bde6b14a79..0000000000
--- a/meta/recipes-support/boost/boost_1.77.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require boost-${PV}.inc
-require boost.inc
-
-SRC_URI += "file://boost-CVE-2012-2677.patch \
-           file://boost-math-disable-pch-for-gcc.patch \
-           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-           file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
-           file://0001-BoostConfig.cmake-allow-searching-for-python310.patch \
-           file://0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch \
-           file://0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch \
-           "
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.78.0.bb
new file mode 100644
index 0000000000..f4b6ed8576
--- /dev/null
+++ b/meta/recipes-support/boost/boost_1.78.0.bb
@@ -0,0 +1,9 @@
+require boost-${PV}.inc
+require boost.inc
+
+SRC_URI += "file://boost-CVE-2012-2677.patch \
+           file://boost-math-disable-pch-for-gcc.patch \
+           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://de657e01635306085488290ea83de541ec393f8b.patch \
+           "
-- 
2.20.1


