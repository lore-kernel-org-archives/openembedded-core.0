Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29209.1793134686883649038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FfFCgqoz;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so393918c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 13:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134686; x=1793739486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6FUd7xwDwIHK0GX4n9EfCJZFBIRY7Jxzh5zHBS0CiE=;
        b=FfFCgqozPjGpOKeyz+Sgdb1GHEgIw2ogHYzIYphanpLpJtQESns7eY8XJVugBq0rev
         cg4uSYTsp9SrLJh5W3Y25MQTbNgPEw1sXNB7vIt3ML56LuJrMOfCSBso6FYXqGz03EGZ
         jPYKTUYeiioxJGvSI9hOWN+KRrYqV2+ILUY4hMfcq1S5ZD4p0ax+yVZRS/4zkGJeuGoO
         sPrlRSy8SpEjH4xJaJv08ECmY0LfRBv63STWUaVHMHYp/PVtAnUBLw7+5T1Vcm8TWYZN
         Zc3Yc7E5qwclScdSjUwdtw1qPErEOTJjrczxBq3/r6VBtipjUCThAuz/MnJk016rQ3RS
         uFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134686; x=1793739486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6FUd7xwDwIHK0GX4n9EfCJZFBIRY7Jxzh5zHBS0CiE=;
        b=e2eFWUTvvKK7CEGBQmXtheE/GparGMxidv/jt/brhf0oXiokFpM57oklHg/jOm8Ctm
         f6kJSl9t0GtNwq+MMXvud7qIRBkIhmWg3kR1/Rrv0wjwd91rnnRTAugXLCptCrgb80ul
         goC2CkACx9czmEGHpYScTK/uT4FQGjviNRS/bVVwx/FvDGP2y1Mr5Ynz2ArsSAO8205Z
         n+lgELG3lwcbyQkBTc8kw3pqnPQcBm+c5Re8PYkoHBiutAeRC37G8B7ge+/1XY14hzFx
         y3o8mFQnLZ9Xubp7WFKRfuoHBDDlzQAB3Gh+I5W16iis6DX77RxpfC6Ra1qmHQISZOVl
         NoRQ==
X-Gm-Message-State: AFq9FYLxi1cGRjaMxOmhVVt8nuvP2hJj+yUQXq15mSDPInm1YOCjZdLl
	ztiyQF4OvmGX1H1tLYmFXdY8WqMqUehnYY8nkoXbNI/7+PcZeSyoTOrePPpD6T6hw6A=
X-Gm-Gg: AYBFou0k+b0YUXnSXqJbrO+rajaZ9jNPoe2HUwBgWRVSOmJItF9FY93k3Ba1keeJ55W
	AZyipB4FPz5tFiji5xzmJJx6p6qIemDZJTuzmG517az1/gvAupP4FqzWXUIfM4KyQjn0N8ymKQk
	i0vG8b4c1y3SKoEs0Rdi6yJFRCzXmrKClJlajx2dKPlJAsDe4iL4l7BcOr0AQ+e1g4CzWz/pLS5
	YFPBKUMhzMqxbQRsQ/CEOstTNlfPvx9eX2nzC33leYGntWdMQP3f6o/TSqr6I9YZc0fp2sqtKce
	xozsm5wADv1MIdMm3aoy5zgm+i3YE3NPU9ZfyIBkF4RbGFy5kTjvB1ILqakjlCd4KginaSaIFef
	mKUmLwPIg5c3sft/O2ZnPL97ThvSLSbjrGTGMLeYTA8q/jMh6/1TWsUOkSl4r47O+gfJr/2iIeL
	LTs0+ep3NEH40AGSjIZqFRz+ivHRo4nv9KFexIVLOFwbGvNAJWvu3P7lIFcv6oB/71cE6mk/gkG
	Gsbft1OT7gvRPJ5tX/TqkthoygnSt2+VklbkMvt5fpwiIoywl3foJUYnFCg6qOuTVy4cW/jjgZe
	nxuidmM/TfhABynU/7XqFe2oeHthoX9P5uF9BwY4ONuXFrK8+ufNEP5pxu6vIkBG2tch+tkznjN
	IkakJhKW4+zMMT5MGqF+zOg7xcdYcty5sB/DSwkOCeCVXcKpl5O1ePG59C5ptAjaRkTm/dR8a6V
	sHtgPjtIaMNwXkaUu1w0tCm42pAr7LTLbSCQ/1avpW42HoHKT4NGn0yxbyPl6wNqVfdlNcvMOI7
	GNsxpYcaHbLk90sY8mirkgMjsi6yhpg2bwYpMEkn8Qji6KBDyD5
X-Received: by 2002:a05:7022:4396:b0:190:da74:2c89 with SMTP id a92af1059eb24-1a6ce4ea6a5mr594342c88.21.1793134685784;
        Tue, 27 Oct 2026 13:58:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6da44c132sm665777c88.18.2026.10.27.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] clang: Remap lambda paths in declaration template arguments
Date: Tue, 27 Oct 2026 13:58:02 -0700
Message-ID: <20261027205802.2324530-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 20:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248763
Content-Type: text/plain; charset="utf-8"

clang printed the declaration of a declaration template argument (e.g. a
pointer to member) without the caller's printing policy, so
-ffile-prefix-map/-fdebug-prefix-map were not applied to lambdas named
in it. Their full source path then ended up in DWARF names, e.g. in grpc
built with clang:

  WARNING: grpc-1.84.1-r0 do_package_qa: QA Issue: File
  /usr/lib/.debug/libgrpc.so.56.0.0 in package grpc-dbg contains
  reference to TMPDIR [buildpaths]

from "AddOp<&ClientInitialMetadataInterceptor<(lambda at /abs/...)>::...>".

Pass the policy through.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...printing-policy-for-declaration-temp.patch | 63 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0036-clang-Honor-the-printing-policy-for-declaration-temp.patch

diff --git a/meta/recipes-devtools/clang/clang/0036-clang-Honor-the-printing-policy-for-declaration-temp.patch b/meta/recipes-devtools/clang/clang/0036-clang-Honor-the-printing-policy-for-declaration-temp.patch
new file mode 100644
index 0000000000..cda058ad39
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0036-clang-Honor-the-printing-policy-for-declaration-temp.patch
@@ -0,0 +1,63 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Oct 2026 13:05:20 -0700
+Subject: [PATCH] [clang] Honor the printing policy for declaration template
+ arguments
+
+TemplateArgument::print printed the declaration of a Declaration
+argument with printQualifiedName(Out), which falls back to the
+ASTContext's default printing policy and drops the caller's. Among
+other things this loses the policy's Callbacks, so -fdebug-prefix-map
+and -ffile-prefix-map are not applied to lambdas named in such an
+argument, e.g.
+
+  template <typename T> struct S { void m() {} };
+  template <auto P> void d() {}
+  void e() { auto l = [] {}; d<&S<decltype(l)>::m>(); }
+
+emits "d<&S<(lambda at /abs/path/t.cc:3:21)>::m>" as the DWARF name of
+the d instantiation, while the same lambda is remapped everywhere else.
+This leaks build paths into otherwise reproducible debug info.
+
+Pass the policy through to printQualifiedName.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/236240]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ clang/lib/AST/TemplateBase.cpp                 |  2 +-
+ clang/test/DebugInfo/CXX/prefix-map-lambda.cpp | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/AST/TemplateBase.cpp b/clang/lib/AST/TemplateBase.cpp
+index a5e0dde..13d7698 100644
+--- a/clang/lib/AST/TemplateBase.cpp
++++ b/clang/lib/AST/TemplateBase.cpp
+@@ -543,7 +543,7 @@ void TemplateArgument::print(const PrintingPolicy &Policy, raw_ostream &Out,
+     }
+     if (needsAmpersandOnTemplateArg(getParamTypeForDecl(), VD->getType()))
+       Out << "&";
+-    VD->printQualifiedName(Out);
++    VD->printQualifiedName(Out, Policy);
+     break;
+   }
+ 
+diff --git a/clang/test/DebugInfo/CXX/prefix-map-lambda.cpp b/clang/test/DebugInfo/CXX/prefix-map-lambda.cpp
+index f0fb1a3..962bbc0 100644
+--- a/clang/test/DebugInfo/CXX/prefix-map-lambda.cpp
++++ b/clang/test/DebugInfo/CXX/prefix-map-lambda.cpp
+@@ -8,3 +8,15 @@ void c() {
+   // CHECK-SAME:          [[@LINE+1]]:{{[0-9]+}})>"
+   b([]{});
+ }
++
++// The lambda in a declaration template argument (here a pointer to member)
++// must be remapped as well.
++template <typename T> struct S { void m() {} };
++template <auto P> void d() {}
++void e() {
++  auto l = [] {};
++  // CHECK: !DISubprogram(name: "d<&S<(lambda at
++  // CHECK-SAME:          SOURCE_ROOT
++  // CHECK-SAME:          [[@LINE-3]]:{{[0-9]+}})>::m>"
++  d<&S<decltype(l)>::m>();
++}
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 2662371746..d1b784b450 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -55,6 +55,7 @@ SRC_URI = "\
     file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
     file://0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch \
     file://0035-PEI-Call-insertZeroCallUsedRegs-after-materializing-.patch \
+    file://0036-clang-Honor-the-printing-policy-for-declaration-temp.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
