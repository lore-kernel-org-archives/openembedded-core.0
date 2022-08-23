Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D8FC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:02:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.1195.1661277717180653419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvqkEPNH;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso17998516pjl.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=601W2iaR1lJtVkwxcdUPBb+2wdjSfstwJM8fNegvmIk=;
        b=LvqkEPNHRUtFV/fuNAbZNp38Fa/O8vE08eosHhAkfGdQwsORkQYCubpuEvfCUU/Ykn
         2t8LitssS2LG/V0+y6M4H3TPv8Yg0q/yZfxGaVn5fwa6P38Cl+2XbLLEwC48XD40z9Sl
         hmeE57lJs28UBgUZSbR9b0MnsoDWDHQnvmLfcujL9+MAGtuOkJwUbE+GzGxBJM7Hph+n
         VfrymrKoalxuMrx4eTeTZ9Itr5u9eGL410s17PIG5WsmODH5ytCN1CoUw1Hx4aVfV3BA
         i59KT2JcVCUXA/fAuOWgNcRUkAeZLcqqjr5rkxnP3vx0McuUdEb5sRSN5I4qUKQiWKld
         SkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=601W2iaR1lJtVkwxcdUPBb+2wdjSfstwJM8fNegvmIk=;
        b=Xyq8umXrfgUaNMNIGFtdVdho261EvBqwTW9/R5lWARAgy87rN6dHEgEKEWBunwt2ox
         T4qzr8qgmk+jkQi4KwOldjRAkBW3dWt/b2MIfpyrg7vjgziDljQLjbc56nd9n1oLLDPx
         YBYb+eQfwz9osWqjK6pTOEi2HK97injOYMXdr1z1XgJJhL8yxp1E8StTTpCcevVoGw26
         XaQPlhJ/iET5XCZ/jsPRELyVhWutH/0FP1w5EES6ry4smIUdZuQSBfybVMC1xEOJu6rB
         w1LkXU/cGnvJCDt5Yca9KM6tMWmg1mjT/m34NvamfFIBB5ejzBD7nNEfVGUbkDafAf41
         c07Q==
X-Gm-Message-State: ACgBeo1K2VTAuquKHG5EVE0Ihj85bekqywQcMChewYxOamUF69KZewmk
	Ol6GfjOhnkcYcuOyUV25zzme5WlaWlkipA==
X-Google-Smtp-Source: 
 AA6agR5fPaDe6dCM/l+9Hh7F+28QlYj/PHi+HBAcWFJoV7aQ5skydVuoHMMeXuEByEmuGsAnK4wNGg==
X-Received: by 2002:a17:902:e844:b0:16f:9d2:f4ff with SMTP id
 t4-20020a170902e84400b0016f09d2f4ffmr25527034plg.27.1661277716332;
        Tue, 23 Aug 2022 11:01:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a2c0400b001f54fa41242sm12290295pjd.42.2022.08.23.11.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:01:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] ccache: Upgrade to 4.6.2
Date: Tue, 23 Aug 2022 11:01:51 -0700
Message-Id: <20220823180151.3321962-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823180151.3321962-1-raj.khem@gmail.com>
References: <20220823180151.3321962-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 18:02:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169724

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{ccache_4.6.1.bb => ccache_4.6.2.bb}      |  3 ++-
 .../0001-Include-time.h-for-time_t.patch      | 12 ++++-----
 .../0001-xxhash.h-Fix-build-with-gcc-12.patch |  6 ++---
 ...ude-sys-types.h-for-mode_t-defintion.patch | 25 +++++++++++++++++++
 4 files changed, 34 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.6.1.bb => ccache_4.6.2.bb} (85%)
 create mode 100644 meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.1.bb b/meta/recipes-devtools/ccache/ccache_4.6.2.bb
similarity index 85%
rename from meta/recipes-devtools/ccache/ccache_4.6.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.6.2.bb
index 716aec0584..dbac02243c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.2.bb
@@ -14,8 +14,9 @@ DEPENDS = "zstd"
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            file://0001-Include-time.h-for-time_t.patch \
+           file://0002-config-Include-sys-types.h-for-mode_t-defintion.patch \
 "
-SRC_URI[sha256sum] = "59b28a57c3a45e48d6049001999c9f94cd4d3e9b0196994bed9a6a7437ffa3bc"
+SRC_URI[sha256sum] = "6a746a9bed01585388b68e2d58af2e77741fc8d66bc360b5a0b4c41fc284dafe"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
diff --git a/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch b/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
index 6c1d3cf4f9..d752eb0651 100644
--- a/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
+++ b/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
@@ -1,4 +1,4 @@
-From 3d3364221c235c733436abaeeea9b5e6813b06ae Mon Sep 17 00:00:00 2001
+From 590c656838a9b3769a7a855fb1891bfa8d8878ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 23 Aug 2022 10:27:21 -0700
 Subject: [PATCH] Include time.h for time_t
@@ -10,22 +10,20 @@ src/core/Statistics.hpp:41:37: error: 'time_t' has not been declared
 
 Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1145]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/core/Statistics.hpp | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/core/Statistics.hpp b/src/core/Statistics.hpp
-index 3e9ed816..0017f209 100644
+index 54f32e9..eb80e1c 100644
 --- a/src/core/Statistics.hpp
 +++ b/src/core/Statistics.hpp
-@@ -20,6 +20,7 @@
- 
+@@ -21,6 +21,7 @@
  #include <core/StatisticsCounters.hpp>
  
+ #include <cstdint>
 +#include <ctime>
  #include <string>
  #include <unordered_map>
  #include <vector>
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
index aab943459d..67c74a1e8e 100644
--- a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
+++ b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
@@ -1,4 +1,4 @@
-From cfde5ba7d10ae1e9d0c259dd1e7027e9bad8f83c Mon Sep 17 00:00:00 2001
+From 550834a3ec2e05e379be63b084e7fa06a1723f84 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 6 Jun 2022 17:53:20 +0800
 Subject: [PATCH] xxhash.h: Fix build with gcc-12
@@ -17,6 +17,7 @@ Remove inline attribute to fix below build failure:
 Upstream-Status: Submitted [https://github.com/Cyan4973/xxHash/pull/720]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  src/third_party/xxhash.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -34,6 +35,3 @@ index 08ab794..c754e99 100644
  #  define XXH_NO_INLINE static __attribute__((noinline))
  #elif defined(_MSC_VER)  /* Visual Studio */
  #  define XXH_FORCE_INLINE static __forceinline
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch b/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch
new file mode 100644
index 0000000000..0fd77602df
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch
@@ -0,0 +1,25 @@
+From f98b390a2d323f7f92fb0492b0943d201afe5b8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 10:40:53 -0700
+Subject: [PATCH] config: Include sys/types.h for mode_t defintion
+
+Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1145]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/Config.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/Config.hpp b/src/Config.hpp
+index a9e08ec..9e7af40 100644
+--- a/src/Config.hpp
++++ b/src/Config.hpp
+@@ -25,6 +25,8 @@
+ 
+ #include "third_party/nonstd/optional.hpp"
+ 
++#include <sys/types.h>
++
+ #include <cstdint>
+ #include <functional>
+ #include <limits>
-- 
2.37.2


