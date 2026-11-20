Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1767.1795161821269706812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hwbItF/6;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-382f4710a17so974300eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 00:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161820; x=1795766620; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THxcVMvA8ZRj47YW3HU/UlKPtwMtnc59SqH5U4BWcD8=;
        b=hwbItF/6TwB48f1ShjMzndhmbKWumcIiGVBTV6QNdgwciNi/D/ej+nXTNK0Dvfyw7G
         qGMKofALrAuapIle8zAmH3nRYtF1QnbExMY1OIZROruHupMKHkRJTITTONNHD453ASHO
         f5LxRG/SCr2LD1owhM/FwYpg17lF4q2ydTvZWstNCzZCq2NY4c2x4cF2D4p0nA2c3eIX
         UPRFFNMmMAycrElK0/LaAtX+MOa2xpKAVHL+Z0+XDC8qafDi9a/VwBFx9pCmscVIyp3O
         xKRCJZaHYFRmPW6hMoDTrMNe5VJNAXdElF5sL8lpw/ZE1ODvmJfhDhLOOAwTmmQnrC6f
         3unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161820; x=1795766620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THxcVMvA8ZRj47YW3HU/UlKPtwMtnc59SqH5U4BWcD8=;
        b=RAjZiSUSl/mSMWsrZP55lpzS0zy4k18rrdP1QhgOVdjx4jZ1NmaRc3mWZXuPFdIFsd
         ImZ//f1T9Z26PXBJBiJD/cR+mqYXDYiM0gFFCg1LR91JRVS8ainJwu7nS00XVvnOvwsr
         3pELwJnSvhsl9wQ27NgH1OrsPB7gDA3tgcLFyfyoTToIq11F9zGKJC5fr5x7maM7zIGT
         FCHKR7SX7OsHlz5cKTUuQzlw/h9CKqmuZoBpO4DvKK5Y8hd6qEI0rS/zrxU1+2wVFmfu
         gpsbUTogLIGeV/aFHdObbAv8LCeO/SuEsMR+82+2RCTZS2J5lwixDFHI9lwEUkRS0mhC
         qBBQ==
X-Gm-Message-State: APuU4Z9pL+QtRjE/YSUzFCjU9zjDe9NeFxnvqcp6x/DusZdfGle2ZkcL
	Sdo9qI8dZ9/ZkeSQMLVbRLYEah1U5q7JxHuaPQKeIS6Zap2EKRpuDog48VAyVD+Z
X-Gm-Gg: AZFdTZfAstfkrbMlcV2gU6VRfYvNJj74dYZ0wWH2LU34ODc9km8rqi8OaB7NeSSsAyZ
	s624vyXPIQ7vRlNsTjibVYOpg1IPbkcDTDFULYbxSiRo90IqERABZAexBf3pazvk4tC7plmGcql
	PL5adXqTwN1XrSKIZ9YJOsF1dJOaBWasks9Leyyd5M0l2198zXJ1DZSfJmhQryzD09vPbp2Fu9x
	oKgIxADAtOGjotJfYuNt3tCjW9qh8uATFwiN0XxaZyMDgdF8XesKZn46XHVEsdp1tG026lx6PO6
	1CnGQGQi92OhZw794J36mgcjPQNKtWCdUQ2eZfO6qLp7/+DmgFEcLRHJaiNF/PqS9dHHgNpmTgp
	LYlpoqMagzMVstQaluSbYIx1AH4cTiFe+sGd3rRQ10HBjmHGKm/o5WYzO+npU6uEaqDrTdEP+Ck
	l2Wkk2q4wc/2sljMAdE5JX4i3Xe8nIseu37X9JHqkr42EXBSpK9csysKrTgEQv/EFiXY9eMQ8fP
	3vHhYxHKniP+IKEjoBwVTowcA7OLYJAmgR1YHPH4gS2Pat0UwTgCJhtktxNEZ2FtlLhBZiZ/B+H
	GWSjDn0IbdldU+0eU+v2XVUvrjLxdobIhjR0PhgK3xJC1FHbtSm19LWXig5qinqXaRDrKEPi8ZV
	cMbhjRRb77b2eh4DoXmqgquNfPVvaSfPuSRsND/QNk1Wuuy5VzZ46V/CC0H+oZP4YJEhdh6wMhc
	Ogihz22N0luExjPgO2sfeasy/WvxEEnWF1wKnkTL6yxBpGTJZTi1h1I3dynoFAvgVFTU3WS7uhu
	HxssbFhtXrVmB6eLqnFBLL8LT6YtyQToF5p8ez2QTNBaplBHemvY/jcxqauU59V5uRMQXJJLlri
	e/sl
X-Received: by 2002:a05:7300:3c92:b0:385:b3fd:dc10 with SMTP id 5a478bee46e88-385b3fde0f0mr1257605eec.30.1795161820257;
        Fri, 20 Nov 2026 00:03:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm5754765eec.22.2026.11.20.00.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:03:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3: Fix -Wundef errors in public headers
Date: Fri, 20 Nov 2026 00:03:32 -0800
Message-ID: <20261120080335.895150-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250747
Content-Type: text/plain; charset="utf-8"

Python 3.15.2 headers test _Py_STDC_VERSION without checking that it is
defined, and pymacro.h even checks !defined() before comparing it. The
macro is not defined when compiling C++, so C++ code including Python.h
with -Werror=undef fails, e.g. libpeas:

  pyport.h:494:9: error: '_Py_STDC_VERSION' is not defined, evaluates
  to 0 [-Werror,-Wundef]

The inverted pymacro.h check also drops the C11-C17 static_assert
fallback. Backport both fixes from the 3.15 branch.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ly-use-_Py_STDC_VERSION-when-defined.patch | 81 +++++++++++++++++++
 ...store-C11-C17-static_assert-fallback.patch | 50 ++++++++++++
 .../recipes-devtools/python/python3_3.15.2.bb |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-3.15-gh-160704-Restore-C11-C17-static_assert-fallback.patch

diff --git a/meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch b/meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch
new file mode 100644
index 0000000000..038300b081
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch
@@ -0,0 +1,81 @@
+From beff3c022fe787f6879c7e38a6b8a64243184ab3 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Thu, 12 Nov 2026 07:39:16 -0800
+Subject: [PATCH] [3.15] gh-154643: Only use _Py_STDC_VERSION when defined
+ (GH-154650) (GH-161874)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: Miro Hrončok <miro@hroncok.cz>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/beff3c022fe787f6879c7e38a6b8a64243184ab3]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Include/cpython/pyatomic.h                                  | 2 +-
+ Include/pyport.h                                            | 2 +-
+ Lib/test/test_cext/setup.py                                 | 6 ++++++
+ .../C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst    | 2 ++
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst
+
+diff --git a/Include/cpython/pyatomic.h b/Include/cpython/pyatomic.h
+index 71a76bdc82ce475..0a11f7781f07e00 100644
+--- a/Include/cpython/pyatomic.h
++++ b/Include/cpython/pyatomic.h
+@@ -585,7 +585,7 @@ static inline void _Py_atomic_fence_release(void);
+ #  define Py_ATOMIC_GCC_H
+ #  include "pyatomic_gcc.h"
+ #  undef Py_ATOMIC_GCC_H
+-#elif _Py_STDC_VERSION >= 201112L && !defined(__STDC_NO_ATOMICS__)
++#elif defined(_Py_STDC_VERSION) && _Py_STDC_VERSION >= 201112L && !defined(__STDC_NO_ATOMICS__)
+ #  define Py_ATOMIC_STD_H
+ #  include "pyatomic_std.h"
+ #  undef Py_ATOMIC_STD_H
+diff --git a/Include/pyport.h b/Include/pyport.h
+index 6bf011e87709cc0..44d76511fbffbe2 100644
+--- a/Include/pyport.h
++++ b/Include/pyport.h
+@@ -491,7 +491,7 @@ extern "C" {
+ #ifdef WITH_THREAD
+ #  ifdef thread_local
+ #    define _Py_thread_local thread_local
+-#  elif _Py_STDC_VERSION >= 201112L && !defined(__STDC_NO_THREADS__)
++#  elif defined(_Py_STDC_VERSION) && _Py_STDC_VERSION >= 201112L && !defined(__STDC_NO_THREADS__)
+ #    define _Py_thread_local _Thread_local
+ #  elif defined(_MSC_VER)  /* AKA NT_THREADS */
+ #    define _Py_thread_local __declspec(thread)
+diff --git a/Lib/test/test_cext/setup.py b/Lib/test/test_cext/setup.py
+index 10a3887931932ac..3b613ee729f52c4 100644
+--- a/Lib/test/test_cext/setup.py
++++ b/Lib/test/test_cext/setup.py
+@@ -42,6 +42,9 @@
+ 
+         # Ask for strict(er) compliance with the standard
+         '-pedantic-errors',
++
++        # gh-154643: Headers should not use undefined macros in #if
++        '-Werror=undef',
+     ]
+     if not support.Py_GIL_DISABLED:
+         PUBLIC_CFLAGS.append(
+@@ -94,6 +97,9 @@
+ 
+         # We also use `long long`, a C++11 feature we can enable individually.
+         '-Wno-long-long',
++
++        # gh-154643: Headers should not use undefined macros in #if
++        '-Werror=undef',
+     ]
+     INTERNAL_CXXFLAGS = [
+         # Do not complain about unused parameteres in the internal C API
+diff --git a/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst b/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst
+new file mode 100644
+index 000000000000000..17c2a58555e7ae9
+--- /dev/null
++++ b/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst
+@@ -0,0 +1,2 @@
++In ``pyport.h`` and ``pyatomic.h`` don't use ``_Py_STDC_VERSION`` when it is
++not defined, fixing build errors for C or C++ code built with ``-Werror=undef``.
diff --git a/meta/recipes-devtools/python/python3/0001-3.15-gh-160704-Restore-C11-C17-static_assert-fallback.patch b/meta/recipes-devtools/python/python3/0001-3.15-gh-160704-Restore-C11-C17-static_assert-fallback.patch
new file mode 100644
index 0000000000..ac8a5bcd75
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-3.15-gh-160704-Restore-C11-C17-static_assert-fallback.patch
@@ -0,0 +1,50 @@
+From 9b6a1a1abf3febbe7ce24dd6fc46c846e544a480 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 07:56:04 -0700
+Subject: [PATCH] [3.15] gh-160704: Restore C11-C17 `static_assert` fallback
+ (GH-160705) (GH-160825)
+
+gh-160704: Restore C11-C17 `static_assert` fallback (GH-160705)
+
+`_Py_STDC_VERSION` needs to be defined before its value can be checked.
+In 8335bcbf26b (gh-160208: Add a private wrapper around __STDC_VERSION__
+(GH-160376), 2026-10-23), the condition `defined(_Py_STDC_VERSION)` is
+incorrectly negated, which prevents the fallback definition of
+`static_assert` in C11-C17 builds and causes a build error when building
+with an old C library that does not define `static_assert`.
+(cherry picked from commit a7ac7a8175ff64c2848f54644f5449ad44466a62)
+
+Signed-off-by: Ruoyu Zhong <zhongruoyu@outlook.com>
+Co-authored-by: Ruoyu Zhong <zhongruoyu@outlook.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/9b6a1a1abf3febbe7ce24dd6fc46c846e544a480]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Include/pymacro.h                                               | 2 +-
+ .../next/Build/2026-10-26-21-00-00.gh-issue-160704.ZRYLKF.rst   | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2026-10-26-21-00-00.gh-issue-160704.ZRYLKF.rst
+
+diff --git a/Include/pymacro.h b/Include/pymacro.h
+index 29d20953235651b..5f1ee98dd3ff46c 100644
+--- a/Include/pymacro.h
++++ b/Include/pymacro.h
+@@ -25,7 +25,7 @@
+ // behaviour. So only define if building as C, not C++ (if __cplusplus is
+ // not defined), and only for C11-17.
+ #if !defined(static_assert) && (defined(__GNUC__) || defined(__clang__)) \
+-     && !defined(_Py_STDC_VERSION) \
++     && defined(_Py_STDC_VERSION) \
+      && _Py_STDC_VERSION >= 201112L && _Py_STDC_VERSION <= 201710L
+ #  define static_assert _Static_assert
+ #endif
+diff --git a/Misc/NEWS.d/next/Build/2026-10-26-21-00-00.gh-issue-160704.ZRYLKF.rst b/Misc/NEWS.d/next/Build/2026-10-26-21-00-00.gh-issue-160704.ZRYLKF.rst
+new file mode 100644
+index 000000000000000..330415c155cd89a
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2026-10-26-21-00-00.gh-issue-160704.ZRYLKF.rst
+@@ -0,0 +1,2 @@
++Fix C11-C17 builds with old C library headers that do not define
++``static_assert``, including glibc versions older than 2.16.
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipes-devtools/python/python3_3.15.2.bb
index bfc783c922..775165bbe6 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-3.15-gh-158097-Make-test_staggered_race_with_eager_t.patch \
            file://0001-3.15-gh-160924-Don-t-run-the-build-Python-with-RUNSH.patch \
            file://0001-gh-160881-Fix-test_is_python_process_non_python_subp.patch \
+           file://0001-3.15-gh-160704-Restore-C11-C17-static_assert-fallback.patch \
+           file://0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
