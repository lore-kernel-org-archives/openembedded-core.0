Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C158AC4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:19 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1643.1784055856796249819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYuxGtRb;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a382104a85so849629eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055856; x=1784660656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGv/8T7yDDrALyexZk08k6GntUESVyqbyPAZfm4o5uI=;
        b=HYuxGtRbmtEXx03i2u4lXe0q4NKlLSWnqqLN3DM6U422mPuxVdOi/7pNjvgw3Wkb3A
         zbR9dHJeDRPbEWFQXr4aJd42ThPfN7jMtt2aSgSpyg0bzW98VoRDenR8mvm2p1sw40Va
         DSXNM3fZenIRhX/iVyZgS9tBbUb2gvf1BlxrtwRxSJOpBcJlZPWRJx4zyf7YBunLT5lA
         8W+jFHFA5UDpCMYkCgY7sIz7QzKgIF13yMabHAqKwkU+Go+KdCwCkCaLk7dMAsKUW5BF
         W6vVuv0dCnjylB+BBbStlwSr0j8BCXU6lWjDxwaO96kfXTr9r0cY5vXutAbQpoNIKzCO
         fvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055856; x=1784660656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGv/8T7yDDrALyexZk08k6GntUESVyqbyPAZfm4o5uI=;
        b=gwQfbZRLRcWeJe6CD/ZCaKL/vPOMpjZMwpI0Ko+9zN09k5XeKVrl5tjh2uXahB27La
         TJpqrOnZuaFcHp7YuuDuHmJojaIanAvrR3xwIH59zDYdFW5udrDqSgFryQe7pT0CiNao
         mTMITbQMmyImLKuZr/F4w98dGWxpJYAZZ0x+OJwx9myAzviIMbu3KQt32K/jhxO2wkLR
         sMBMELTQiSoZhMOwXQQP1Rl4nOXPiyRxGEbj6sYt2y7pnzgXJ/8wLfPLSeTDIao5GEMv
         bnduMu0mzdr/8/7kUCXrPcYZHuaN22Up9I1qCUk9sHr3lQE+NC16nhYUFYABXJGa3Gh8
         jITQ==
X-Gm-Message-State: AOJu0Yx1qIgJpQ7ZowszyzH9txoBRBmGkK92Ktg7JPz/Y1ilhgXqujj5
	81cdvAYUREPcTe+n7o3cEwoyCKO4MHYKC6tEfTvamKXhuvm6R/vdNuXuJzclGQ==
X-Gm-Gg: AfdE7ck6xQP5dq/DbFlsb3Dmqy1C8x5N9Nk2WuSwLzSQ9VM5eddf7RqUc09kJ/rxe/f
	b8tW7ygPSn/3G8gj8cAY+haKE+0aV4/ywqT6Nkr+JST6fRSdPxYuM3nAqud2jOF65gu7+trHjdX
	a/1cW2UxBqXw4WCgt31WdnIzBUmDkP+FT6QESdZQhjLJ1zthotBBYN0krpy2GqqOlI6i2g9Oc5H
	/XQWUJjm5csPHo7x2sj3OHpqafr6S2br39gGJoM9245mWDa5vxsV9q1QZZ77B5U2b0sJjt3YlP4
	hKLBNB//ORCCU2DKw/5qod6MRopsS67ZyHACGIBvyEZ4wIfI7f0tzdPrQV/2MX3OausYgvhC/bY
	Sa9ahraTihH/iG0GMHyWUPJKhRQYhUwNOdf4YFe5H9x24l4St1w2GfwOODNPjU3Exem1kwJI+4x
	lcCbS1uNDxRw==
X-Received: by 2002:a05:6820:1387:b0:6a1:98cf:c13a with SMTP id 006d021491bc7-6a39a598a2fmr8024218eaf.19.1784055855931;
        Tue, 14 Jul 2026 12:04:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 09/22] gcc: Update license
Date: Tue, 14 Jul 2026 12:31:19 -0600
Message-ID: <20260714190405.3328796-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240917

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


