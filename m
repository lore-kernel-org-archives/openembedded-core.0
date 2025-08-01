Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDFDCA0EC1
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.80419.1754022171319674453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXCSAL6H;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bdc73f363so306548b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022170; x=1754626970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZT0V2cQuHG12q76YTIh8bG+qFEh7XjKkL1DVz56QP8=;
        b=aXCSAL6HIEZ3N6tFB3uF8q34L4LZQ2On58GKxgN8mCbDr2bE9Yq3QoQc0vOf24ntig
         XtEL2b30UiFkucb9xvtDjoBcRNkWtcr82rPozQEHneDsTned18YuL/fB5Zl7Ngv3zit2
         79D9KxMjv6dFIqW9aQO20eD3MNHhma/DXTQ0yZ1+WQUJJgkPjn8BlcB8bPot035oha8R
         bRTYDAbshpe50pjfGViVZqreUPsMhKaxMOpmnXZtT6y32jwraDvb8yYY5vOH+Nivs0S+
         VwPFaS0RC88Rho3BRygNXH0abr0Iv0XTTv/9bEwNqiAysqy6D3zeO0RcMIwafnZAfRA+
         89dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022170; x=1754626970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZT0V2cQuHG12q76YTIh8bG+qFEh7XjKkL1DVz56QP8=;
        b=jnTIqtN8QUz7cgyjm+5Nm0PXrqP6ezPmXydJ7AuLqGaiKCpRXDB9RluFirTHzVrlPg
         j5N78etcz1IBOR80fUNZXVEqduJ7/xwrKyOx4KEpVaqwNWrBFnR8bn6gSBxtZt7gDm1I
         K6oDZV7xLtOUbvPu3xWSmTqUJJXK08kRjAhtLY5ga8iFOwdQSa5xyq0pGP0uFU2wHalT
         e5U6cVeJ9Y1dj+7H2QbXoipYQeEbCJk7y8YLfuWHI/PkfDFe3/t8wDnAC0NWXWgGB/TA
         tn9/dCd3XhZvLVwdBSlbsENI+wsgtxAPfocnUjM/Zp48Pqq91OdZvOMuyoSnJql4gAKu
         OWqw==
X-Gm-Message-State: AOJu0YxImaoTN+B5vgWjxHyMXJbO7oL757rz7SeCSPm/Iv/axbFUtKsC
	P2xyHySSlrxc4q69V0gSTCFwGIKm4hZko/K8JCJWHnd15UIsbNV3Wy0WDZ4z8mLl/lA=
X-Gm-Gg: ASbGnctvUm8nZYSj87Vi1Snk2DO+h2wNbHM3Zn9cENuH6/e//B3A4lXQ3Yy32NAySKn
	XzKVgOxmZEdfxRyqSYM1kfAMnSDhlkO6gdoHb9smSeYOMk2yQaG6eDwouKMu8DFiKam7Il08+FD
	En3e+s3DarOOzr/FeYR8rah+TtUJn8lN7NRzU3VY4mWj4emCf/4TAuZpEDz9S5VrP8SLKhgfrea
	QP2xfrFLAChJYM94d0p8/cfKxjqorKzraWiMFrtcoi+S4nex3nxjb6O/wH0Mv3tohNHo9WlcD1k
	MLjsQ6dpVYYr3z9/rAe+4Via4VGuAodWC7VxU0XWlc2KnVi4hMiBlg8KrPg6XA8i051mCARME1l
	PSoD0qS8CPiOWNg==
X-Google-Smtp-Source: AGHT+IFX3vIlhCQQWdjP4e54w7cDnU8QrPtOdZH9Y8Ue+FUtzILN0iyIVz+c5wv0lk99Evw2z0X3QQ==
X-Received: by 2002:a05:6a00:7589:b0:76a:d724:d6fe with SMTP id d2e1a72fcca58-76ad724dd1cmr11119508b3a.11.1754022170389;
        Thu, 31 Jul 2025 21:22:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/7] fmt: Fix build with clang-21
Date: Thu, 31 Jul 2025 21:22:41 -0700
Message-ID: <20250801042242.3076232-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221219

Backport a fix from upstream master branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...compilation-on-clang-21-libc-21-4477.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/fmt/fmt_11.2.0.bb       |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
new file mode 100644
index 00000000000..911fa90a40c
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
@@ -0,0 +1,46 @@
+From f4345467fce7edbc6b36c3fa1cf197a67be617e2 Mon Sep 17 00:00:00 2001
+From: Remy Jette <remy@remyjette.com>
+Date: Sat, 21 Jun 2025 07:28:14 -0700
+Subject: [PATCH] Fix compilation on clang-21 / libc++-21 (#4477)
+
+`<cstdlib>` was not being included, so malloc and free were only declared
+via transitive includes. Some includes changed in the latest libc++-21
+build which broke fmt.
+
+Also changed `malloc`/`free` to `std::malloc` and `std::free`, as
+putting those symbols in the global namespace is optional for the
+implementation when including `<cstdlib>`.
+
+Upstream-Status: Backport [https://github.com/fmtlib/fmt/pull/4477]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fmt/format.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+Index: fmt-11.2.0/include/fmt/format.h
+===================================================================
+--- fmt-11.2.0.orig/include/fmt/format.h
++++ fmt-11.2.0/include/fmt/format.h
+@@ -44,6 +44,7 @@
+ #  include <cmath>    // std::signbit
+ #  include <cstddef>  // std::byte
+ #  include <cstdint>  // uint32_t
++#  include <cstdlib>  // std::malloc, std::free
+ #  include <cstring>  // std::memcpy
+ #  include <limits>   // std::numeric_limits
+ #  include <new>      // std::bad_alloc
+@@ -744,12 +745,12 @@ template <typename T> struct allocator {
+ 
+   T* allocate(size_t n) {
+     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
+-    T* p = static_cast<T*>(malloc(n * sizeof(T)));
++    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
+     if (!p) FMT_THROW(std::bad_alloc());
+     return p;
+   }
+ 
+-  void deallocate(T* p, size_t) { free(p); }
++  void deallocate(T* p, size_t) { std::free(p); }
+ };
+ 
+ }  // namespace detail
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
index d0d4cea23e2..fd5dc0c4ab7 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -5,7 +5,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
-           file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
+           file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
+           file://0001-Fix-compilation-on-clang-21-libc-21-4477.patch \
+           "
 SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 
 inherit cmake

