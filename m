Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7BAEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:10:36 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.4849.1688699428533651477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103043894"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103043894"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:10:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 86646C68E5
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:23 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4919D969B
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFBAA2FC7C35;
	Fri,  7 Jul 2023 12:10:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwebp: upgrade 1.3.0 -> 1.3.1
Date: Fri,  7 Jul 2023 11:10:06 +0800
Message-Id: <1688699410-2397-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
References: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--3.017000-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jHig
	8HCMVVLutNw2HyrxVvRkS5edXgYaHv12TsqRMnfHr7+qhZS/khmOVGny5q72htWM2x6EZ/S9+rr
	lEr/ONjUqqtDuUtwyfC38M+247Q7B3Nkas/vriw78dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bjSAa8O4E9d0L/8yUNGojyaVOBNtnikPqpVRzPxemJL0giShKpB+zk26pZ/o2Hu2YaqXN
	Kklxta3Hn8Hwj93cizmqHWbaf3aKV0ieHN50/kHxi///JpaHQO/yN2q8U674pktE7XoY6SSnkSu
	6sFLXTD97bACCqgEGpbNfgtQUD+kc3vw2YCM3y/qcdt4G7kueTK1/qdbjc7QJiSnLHwSevaem2v
	w+cenKeLzNWBegCW2U9w4XVXDWCYLbigRnpKlKZx+7GyJjhAUdqEfLAnRy0/dpnz+7VnnFdrQqC
	0Xg+W1XEUlHjwLB+cZJTj/H/4IzUHpNfy4SS4RIywGHUMeOjTZZgQamiiAu/+TTWn+QZzG7H2fV
	ekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183990

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2023-1999.patch
removed since it's included in 1.3.1

Changelog:
==========
  This is a binary compatible release.
  * security fixes for lossless encoder (#603, chromium: #1420107, #1455619,
    CVE-2023-1999)
  * improve error reporting through WebPPicture error codes
  * fix upsampling for RGB565 and RGBA4444 in NEON builds
  * img2webp: add -sharp_yuv & -near_lossless
  * Windows builds:
    - fix compatibility with clang-cl (#607)
    - improve Arm64 performance with cl.exe
    - add Arm64EC support
  * fix webp_js with emcc >= 3.1.27 (stack size change, #614)
  * CMake fixes (#592, #610, #612)
  * further updates to the container and lossless bitstream docs (#581, #611)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/files/CVE-2023-1999.patch            | 55 -------------------
 .../{libwebp_1.3.0.bb => libwebp_1.3.1.bb}    |  6 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
 rename meta/recipes-multimedia/webp/{libwebp_1.3.0.bb => libwebp_1.3.1.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
deleted file mode 100644
index d293ab93ab..0000000000
--- a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a486d800b60d0af4cc0836bf7ed8f21e12974129 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Wed, 22 Feb 2023 22:15:47 -0800
-Subject: [PATCH] EncodeAlphaInternal: clear result->bw on error
-
-This avoids a double free should the function fail prior to
-VP8BitWriterInit() and a previous trial result's buffer carried over.
-Previously in ApplyFiltersAndEncode() trial.bw (with a previous
-iteration's buffer) would be freed, followed by best.bw pointing to the
-same buffer.
-
-Since:
-187d379d add a fallback to ALPHA_NO_COMPRESSION
-
-In addition, check the return value of VP8BitWriterInit() in this
-function.
-
-Bug: webp:603
-Change-Id: Ic258381ee26c8c16bc211d157c8153831c8c6910
-
-CVE: CVE-2023-1999
-Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
-Signed-off-by: Nikhil R <nikhil.r@kpit.com>
----
- src/enc/alpha_enc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
-index f7c02690e3..7d205586fe 100644
---- a/src/enc/alpha_enc.c
-+++ b/src/enc/alpha_enc.c
-@@ -13,6 +13,7 @@
- 
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- 
- #include "src/enc/vp8i_enc.h"
- #include "src/dsp/dsp.h"
-@@ -148,6 +149,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-       }
-     } else {
-       VP8LBitWriterWipeOut(&tmp_bw);
-+      memset(&result->bw, 0, sizeof(result->bw));
-       return 0;
-     }
-   }
-@@ -162,7 +164,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-   header = method | (filter << 2);
-   if (reduce_levels) header |= ALPHA_PREPROCESSED_LEVELS << 4;
- 
--  VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size);
-+  if (!VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size)) ok = 0;
-   ok = ok && VP8BitWriterAppend(&result->bw, &header, ALPHA_HEADER_LEN);
-   ok = ok && VP8BitWriterAppend(&result->bw, output, output_size);
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.3.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.1.bb
index 7ca67e44fb..b9e763b08e 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
@@ -14,14 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c"
+SRC_URI[sha256sum] = "b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-SRC_URI += " \
-    file://CVE-2023-1999.patch \
-"
-
 EXTRA_OECONF = " \
     --disable-wic \
     --enable-libwebpmux \
-- 
2.34.1


