Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.89817.1597848492433762966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hzjT1ESg;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id ds1so887426pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XO1IVmo8gghqFFEtf2fgnMEOaTvshT/JZP7iOQilE9Y=;
        b=hzjT1ESgVJ91xkO3rRtTHBCD3w+yw/HAIhLgmb2n9Qvi2MHjBUfFZ7WD7/KYfCS5Zq
         +fTvCUc9VcjEgU39KGsXdrx2ivTI5S+42k6XiexH18yhXi6oflAOvU1w+2wKAd+CrYde
         chA5xi7x3xq3i+IkoE0WmSDKZuuwDH7n7B7aFErA8ja56fubBFNFcs/GEvx9QSvwGt/z
         TYqhK4C1jrwiZFUpNZqGmt4rT7Awj466REZTljhOAgq6PzcgKIGSLlwzh+TKCTnwTvv4
         5SdTUtUbiTbj3CMeIXLkRLQQx/8CJMU5Y8k8zq/np2e6IhJn87ma62H166k8LGtG2Dxs
         8kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XO1IVmo8gghqFFEtf2fgnMEOaTvshT/JZP7iOQilE9Y=;
        b=YxtjX9MSCH5PJbAC9FHyGj/fBUQJh+HpwAFNOdcgSLLf+GmzH1lWbltqDjFaPGBsk/
         MCfiQc+UHDIAOaeWUjPu3WLeap9fIIlp7rYrFkpsPvD0LxjRuYOzit1CtNRarbd8TT5H
         ak4xu9ic9I2xR0/rz0xUo2Jw+n2kN5bskno05eChXcBAyV5FDlyDxZEYehB0B2p++POb
         SED7gpXmZoTRLbaZ7HGvtvzfCwx94h1mNPuOkkSpp/KSXEvFFv67Wen2Bf0qXcjGvOnt
         QEYJ/oHiV6uqDvHGLs4v+rC0rAf5CiIIr9/nDC+GREkTMBiQTQgWCRJqNUkqj8y4ZxjI
         AZEQ==
X-Gm-Message-State: AOAM530r3p7UVjFSP1fiJy+9SkH+l5RhUYAGced3svxCvDqApq1EEcm7
	cG0fcYF3mfb0iFxySFc9s47BjpqYKS7qjA==
X-Google-Smtp-Source: ABdhPJxYH+tw0zFkY79OsrqQGnJYdXPqfh2Y1CWGAZAN1w320Sxki44gVF3OXJX386cEhdfXUON9VA==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr4453764pjb.228.1597848491652;
        Wed, 19 Aug 2020 07:48:11 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net (ip5f5af139.dynamic.kabel-deutschland.de. [95.90.241.57])
        by smtp.gmail.com with ESMTPSA id a5sm27983944pfi.79.2020.08.19.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 07:48:10 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] ethtool: upgrade 5.7 -> 5.8
Date: Wed, 19 Aug 2020 16:49:43 +0200
Message-Id: <20200819144943.25510-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test-features is only generated without netlink configuration.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.7.bb => ethtool_5.8.bb}              | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.7.bb => ethtool_5.8.bb} (83%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 8ecfde1417..75a3841f2d 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 1c6c017e56ec536f5cceacdb02092777d390debb Mon Sep 17 00:00:00 2001
+From afecc8791f904dc1893858d68a642b491356c74b Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1169b7f..ed82524 100644
+index 19223f7..8a58d15 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.7, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.8, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.7.bb b/meta/recipes-extended/ethtool/ethtool_5.8.bb
similarity index 83%
rename from meta/recipes-extended/ethtool/ethtool_5.7.bb
rename to meta/recipes-extended/ethtool/ethtool_5.8.bb
index d9fc30cb55..0403f0e3a9 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "c2e16f8bf510c5822f8e25061c2533972308a421767c54abcacb1038b08bb782"
+SRC_URI[sha256sum] = "91e8bbda48a7fd5d374efacca542364ceb3a6c1f286f024b64ec40ccc799e125"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
@@ -29,7 +29,9 @@ do_compile_ptest() {
 do_install_ptest () {
    cp ${B}/Makefile                 ${D}${PTEST_PATH}
    install ${B}/test-cmdline        ${D}${PTEST_PATH}
-   install ${B}/test-features       ${D}${PTEST_PATH}
+   if ${@bb.utils.contains('PACKAGECONFIG', 'netlink', 'false', 'true', d)}; then
+       install ${B}/test-features       ${D}${PTEST_PATH}
+   fi
    install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
    sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
 }
-- 
2.23.0

