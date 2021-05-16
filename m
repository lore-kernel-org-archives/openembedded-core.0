Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11443.1621204383511195518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QNRJXwMC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id y14so2365929wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LmmOp42IDfJxm5mKkomiR6cewh2NMp877YoM0k9xhHw=;
        b=QNRJXwMCyAEiRLYfb6Hg3z4i/aKlFKeU6KWGIH4X/FvSFm/sBC40VK2kWZe+Trhmbx
         dLsP7BcamvLkvThyqdgzCB3bDb/wnttJWFBal+qINc6P0ElMChAe5IEm88NIVUf9fOAV
         HZ6vrjgInw3h5Q52sQMKamhlb70x4k48jk/qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LmmOp42IDfJxm5mKkomiR6cewh2NMp877YoM0k9xhHw=;
        b=PFHCiZhd8QrHMuh/ksoUFKaitLVuAy9gjgfQnggu3CdiDCzEET3Pygxa5cxRTxnpeF
         NeEPFlSKqfRyKemQBNesaw6xXbP3f7NdTy638aCAQUALvQL/rEjxijuiyg9EC6hiu9dU
         HQK3JDY8+KLX6+Qfapk98lUh4S2EqKHLEYm+y4z+0wgv6L5OXajhevpYCKqQaHr5B3Hi
         +2LeEwEkyx7hWsCkYS3z20rt5kXZBPYYqRsvMTJ+NS+rdA2kYYC9W5EY+EBCi1E8X+aR
         lZTxxc7kLEzVm0qDqiI83H26OW+QnsDfdwthcJauBBwBIWrZUY3T435+QP2O3r/qMdax
         NoAQ==
X-Gm-Message-State: AOAM532u6yVD/qt+udRMM/aoeb/RaKiM1PeFneM+47ONdE1s8pcVMZQf
	Dmxvz+bBM3ZPJIbVqg1+IkSYLBWYJxuXUg==
X-Google-Smtp-Source: ABdhPJwwXyH3/LQF6GFj4Lzf7v9ZbTFZRaDpZobgsasxyb1UXfD8aAnLXh/udKmiiXSQqj/ivc2O+Q==
X-Received: by 2002:adf:f386:: with SMTP id m6mr5973465wro.111.1621204382043;
        Sun, 16 May 2021 15:33:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.33.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:33:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/27] shaderc: upgrade 2020.5 -> 2021.0
Date: Sun, 16 May 2021 23:32:46 +0100
Message-Id: <20210516223247.2401235-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...aderc_util-fix-glslang-header-file-location.patch | 12 +++++-------
 .../shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index df670cdded4..0e8ad7e4d2a 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,17 +1,18 @@
-From 046c3c2da9c4ff66f14db5bd68e9557504a49241 Mon Sep 17 00:00:00 2001
+From d02ad48d5c9b48af70ddea2e6998081347ef82f3 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH 2/3] libshaderc_util: fix glslang header file location
+Subject: [PATCH] libshaderc_util: fix glslang header file location
 
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  libshaderc_util/src/compiler.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index c5ce37e..4703634 100644
+index 051558b..9c4476c 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
@@ -21,8 +22,5 @@ index c5ce37e..4703634 100644
 -#include "SPIRV/GlslangToSpv.h"
 +#include "glslang/SPIRV/GlslangToSpv.h"
  #include "libshaderc_util/format.h"
- #include "libshaderc_util/io.h"
+ #include "libshaderc_util/io_shaderc.h"
  #include "libshaderc_util/message.h"
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2020.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.0.bb
index ce51aab0343..3d59e0c38cf 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "f3e39a7eed682faececb73f0b85717f2f44ee9ba"
+SRCREV = "1a3e2aaab191f44644e899e29ab7bac50bebdeb8"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.30.2

