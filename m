Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C17EC44516
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:50 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12394.1784134069724653398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qCet0XmM;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-45133d2974fso3287705fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134069; x=1784738869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGv/8T7yDDrALyexZk08k6GntUESVyqbyPAZfm4o5uI=;
        b=qCet0XmMvv250Me2hx0QtcJt5WAvtU2kIrl64ymP3Fk6lPDumclA2m4si+La03pHA7
         1lS3jSH3SiqdLs6n4kfWnsPTYMErtuDjGG2VK/giWY8WdZ0fFuRGuR21tvQhlVX7Pbq5
         f6rhvSL4gqABzb0zntJm/gbMzjCSgzJO99/aRRALdUFyaHeKmljgZZ6Y3L+nvfJwzBzN
         GAsApv3+cUi7FCj0Bsye97gPrJDIbcGvgOCnpF4a6BsCZD77jpo3Yo9KiKpz5cTY3jNi
         qQHmJNG5ojG7k/0cu5QDZER4KZ+FWIfdhQJAoX3AhXlFLrHaO9akxbM96YfBmVkh+VUv
         KZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134069; x=1784738869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGv/8T7yDDrALyexZk08k6GntUESVyqbyPAZfm4o5uI=;
        b=BMRv3sH14aS+XzEApxIh6OM4yjrFKXDih01JikSVLaqTRcgCSfZbA4nqIJbaDVfSKX
         9OyVnM2FF4gxBWjoB+BZBGN3i3KKYYBVyAvEHPs1VuIjyEuPW7XaZBmaEbAcdIcw7zgj
         pF1ePxjg3Q7MhiYqsMMzotYF5Y/siw695lWb1J4jUCxXXjL0QweCpjFzulu5KpuVRXIl
         VeeQPMfmm/5RwT+4qV7r+FibW/EWCe9bbWvJlN/D5JrFpeLt28qdC7nudyxUQvWO5GPk
         E4lw2rt7hCBBnqpOhPl1liEiXQiIQNd9HIbdDHRnS8rQsJWuAV8keHLlXY3KDpLcH9Ov
         3P1A==
X-Gm-Message-State: AOJu0YzhUfBfn56B21lFdwt6ZRBMtEJ2CiD0bzxCOeDyik447Q5/FQTB
	WIsQezC3HbdI/qw5N4zpMK+fDxEcPvKpbTo4eLwjxnLJG/urxVk74h3hC7NJRA==
X-Gm-Gg: AfdE7cnFAoQnl+BbTaVIgBV1gCjmAk0/an2Nb+JSOhuANaHV/jy3dMD6tpsBsTxSIzq
	e+7BpnYckLFcNjVtjY4wg5xWbDIIzepG2O2OVFlou7Hx/8+ku0OTDXiJEdXa622i+NMcc0iGwa8
	VWNQ6nIORwtRKNYIOaK2G4FZSmgO2DDfjzZh43RPpf2B78QG9wFkRl/jJo920hRmnL9WTolV+oT
	XzxA2blMpqzdHWC/HMvIlnzABct39yV4Wo1lyVH6Ezcn9t8pN4SjyzWYsB+OSfFzc496seuKPnX
	EvhSWVe8Kb3045LPrwkYz9hjiAiX9L1POIL1G/AqF6qG5gl1TekWGS0gVU/TSyWXb8lCJDmFzr/
	iT6RSJlu3RcxrofNdlBABvCIuSSlW4p0k1eNvHyV1SmznjfOB+rz598gmYr7IaHTLU8xiqit88C
	udjLH7AxR6
X-Received: by 2002:a05:6870:31ad:b0:448:558c:d82c with SMTP id 586e51a60fabf-4560b848d24mr4678390fac.37.1784134068905;
        Wed, 15 Jul 2026 09:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 09/25] gcc: Update license
Date: Wed, 15 Jul 2026 10:45:05 -0600
Message-ID: <20260715164739.364323-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241002

GPL-3.0-with-GCC-exception is a deprecated license ID, so replace it
with "GPL-3.0-or-later WITH GCC-exception-3.1".

Also, the LICENSE expression in gcc.inc appears to be incomplete,
missing GPL-2.0-or-later, LGPL-2.1-or-later, and LGPL-3.0-or-later, even
though the checksums for their corresponding license files are clearly
checked in LIC_FILES_CHKSUM.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc       | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc    | 4 ++--
 meta/recipes-devtools/gcc/libgcc-initial.inc | 2 +-
 meta/recipes-devtools/gcc/libgcc.inc         | 8 ++++----
 meta/recipes-devtools/gcc/libgfortran.inc    | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 4598aff045..a82e993f08 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -16,7 +16,7 @@ TOOLCHAIN_NATIVE = "gcc"
 DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
-LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later AND GPL-3.0-or-later WITH GCC-exception-3.1 AND LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e305180c64..cb62fab489 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -4,11 +4,11 @@ SUMMARY = "Runtime libraries from GCC"
 
 # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
 # All gcc-runtime packages are now covered by the runtime exception.
-LICENSE = "GPL-3.0-with-GCC-exception"
+LICENSE = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
 CFLAGS:append = " -Wno-error=discarded-qualifiers"
- 
+
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index ce100d7ddc..d067f7eb00 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -31,7 +31,7 @@ require libgcc-common.inc
 
 DEPENDS = "virtual/cross-cc"
 
-LICENSE = "GPL-3.0-with-GCC-exception"
+LICENSE = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 PACKAGES = ""
 
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 74e8746b42..e92dadf021 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -32,10 +32,10 @@ PACKAGES = "\
 
 # All libgcc source is marked with the exception.
 #
-LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-src = "GPL-3.0-with-GCC-exception"
+LICENSE:${PN} = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-src = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 FILES:${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index fa6aecaaa3..1726b40c6a 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -60,9 +60,9 @@ PACKAGES = "\
     libgfortran-staticdev \
 "
 
-LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
+LICENSE:${PN} = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 FILES:${PN} = "${libdir}/libgfortran.so.*"
 FILES:${PN}-dev = "\
-- 
2.54.0


