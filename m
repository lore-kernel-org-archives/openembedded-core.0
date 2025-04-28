Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDCCC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:02:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.53788.1745859767818473813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGpLBEPo;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739be717eddso4196860b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745859767; x=1746464567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLZHdU7f1LIcLDnEjpBsxPkmdRNzulFcxoNLoFlFEJg=;
        b=QGpLBEPoFjQirU/bMYvjIwX6OiKhZYK9OzhS2w62GQvdOKnTbjlXMxn9Fe5fYVzjmT
         pe0nVqwsf8Cfn0YInuec/UytGTB+rAv0SDksF7RZ5BGY8nDLdzNI5wwkejvRFIZMFd5a
         HuaRAK2C9Oprqx838Y6P6qfse9hUpqpyce1d9DcDUyj1SZou01YwwoCGS5/xbzfE+EQK
         7gP+LTP/swcFckvM5az+M5oX2lsCQlimzlGrO9tgn6KZegJTALH/fXIl6jDk0lcaMsQe
         T0WMFs2+eXGsmX01NrcMqCUJX0vl+usr8O6uoqekFO0C4kVOyKgQASx+urn2+s+5ArVF
         fPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859767; x=1746464567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLZHdU7f1LIcLDnEjpBsxPkmdRNzulFcxoNLoFlFEJg=;
        b=wBmEB9lK70xv8Be2QOsK26Qh+xA8234OyvCvT6cCOuqJyq5cFCp3ftMQht2xD4rqjm
         0Yy5s8B3PKlcMw0AOAvFMtkuZva0uE4Hz48Nd+RLFOSLNTQi2UksKrCWX4UZ7hVEtQ+x
         D+JfhVFWGL1hoXFhSvydlpNkKS0MtPWGNBrbE1yOYr1WYgsW7/FArf2VmXBQCWEfe3DP
         kI/gH3gFe2ov1tcN17rA2pVtl8t4fT8DonrrlzTpzn9tN8hFlVeZ5YZaaPbIhgW7p+wm
         S/Jgf4HCoWGeWEwCRnxokVEuDBnaosBQds5z0Jq90AGnXHjwZg8CriWy9JPTS7XmBHI1
         0M5g==
X-Gm-Message-State: AOJu0YxcvYbbFu9RqFq1wikTnGUk4VLt6z8KKe9PqwMpQkI0zvT/x6f6
	zIxcIT77C/nHqMYOnrWVMTHdVkpE9VhCGbqDv65m/lif5RLSk8g94/uQdb+I
X-Gm-Gg: ASbGncvep81qP5QkyJLbCAaIu/bTwmwBYyIfb0Hdt/IcmJcl1xkxCNOEOC8+LrhfQVX
	xNc/wQPbADZm1QEZwTR7ZQT9VHEiDgfUe0c1ITEgmpDqEfZ8W6QHn617hnS1zKPyEKUXUFkL/pp
	3NetMgVd/EnlYcimbfpyC8n3p4FO8mHfxt/UGBxoBkGnhvQ0Wj8yZqj4oKzeD9v/etvqcMREbfg
	8U7iypB1mBfVHrKylNwF7nZ2c8BJJL9qCEPrXg5svWtdbtIHyGjg4EX8PDugHbBHqNhtc6RT4UH
	ZwEki/G8E3FmPWpO9XAZd/1rg4oC51zE
X-Google-Smtp-Source: AGHT+IGTaPpNYfTpxT3xpkhg8eLtS0z5c1Uvll8fFGW3nXcJb+101XgWGJJ+Sa/O0dNzk7HE84PLIA==
X-Received: by 2002:a05:6a21:100f:b0:1f3:388b:3b4b with SMTP id adf61e73a8af0-2045b7005aemr18524248637.15.1745859766889;
        Mon, 28 Apr 2025 10:02:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259134e0sm8240979b3a.20.2025.04.28.10.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:02:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] harfbuzz: Fix build with gcc-15
Date: Mon, 28 Apr 2025 10:02:43 -0700
Message-ID: <20250428170243.3244651-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 17:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215622

GCC-15 inliner at O2 seems to be able to analyse more
This is a workaround to compile the one file where it fails
to use -Os

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add information about github issue to commit

 ...-to-compile-hb-subset-plan-layout.cc.patch | 72 +++++++++++++++++++
 .../harfbuzz/harfbuzz_11.1.0.bb               |  4 +-
 2 files changed, 73 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
new file mode 100644
index 00000000000..299843797be
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
@@ -0,0 +1,72 @@
+From 8d876ea19579ee6b687668921c17be423cf7d6c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Apr 2025 15:26:09 -0700
+Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
+
+This helps compiling with GCC 15
+
+Reported upstream with GH Issues [1]
+
+[1] https://github.com/harfbuzz/harfbuzz/issues/5306
+
+Upstream-Status: Inappropriate [GCC-15 workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/meson.build | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 3d1c00d..fded728 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -393,7 +393,6 @@ hb_subset_sources = files(
+   'hb-subset-instancer-solver.hh',
+   'hb-subset-instancer-solver.cc',
+   'hb-subset-plan.cc',
+-  'hb-subset-plan-layout.cc',
+   'hb-subset-plan-var.cc',
+   'hb-subset-plan.hh',
+   'hb-subset-plan-member-list.hh',
+@@ -410,6 +409,10 @@ hb_subset_sources = files(
+   'hb-subset.hh',
+ )
+ 
++hb_subset_sources_os = files(
++  'hb-subset-plan-layout.cc',
++)
++
+ hb_subset_headers = files(
+   'hb-subset.h',
+   'hb-subset-serialize.h'
+@@ -618,6 +621,12 @@ endif
+ 
+ darwin_versions = [hb_version_int, '@0@.0.0'.format(hb_version_int)]
+ 
++special_subset_layout_lib = static_library('special_subset_layout',
++  'hb-subset-plan-layout.cc',
++  include_directories: incconfig,
++  cpp_args: cpp_args + extra_hb_cpp_args + ['-Os'], # <== compile this one with -Os
++)
++
+ libharfbuzz = library('harfbuzz', hb_sources,
+   include_directories: incconfig,
+   dependencies: harfbuzz_deps,
+@@ -645,7 +654,7 @@ defs_list += [harfbuzz_subset_def]
+ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+   include_directories: incconfig,
+   dependencies: [m_dep],
+-  link_with: [libharfbuzz],
++  link_with: [libharfbuzz] + [special_subset_layout_lib],
+   cpp_args: cpp_args + extra_hb_cpp_args,
+   soversion: hb_so_version,
+   version: version,
+@@ -657,7 +666,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+ custom_target('harfbuzz-subset.cc',
+   build_by_default: true,
+   output: 'harfbuzz-subset.cc',
+-  input: hb_base_sources + hb_subset_sources,
++  input: hb_base_sources + hb_subset_sources + hb_subset_sources_os,
+   command: [find_program('gen-harfbuzzcc.py'),
+             '@OUTPUT@', meson.current_source_dir(), '@INPUT@'],
+ )
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
index 645e1e42163..9eaacdaa5a4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
 SRC_URI[sha256sum] = "477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969"
 
 DEPENDS += "glib-2.0-native"
@@ -32,9 +33,6 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
 LEAD_SONAME = "libharfbuzz.so"
 
-# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolved
-EXTRA_OEMESON += "-Dcpp_std=c++17"
-
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory might
     # still be installed, so remove it to stop packaging warnings.

