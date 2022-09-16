Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3BCECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.875.1663362504071366758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BinobWQI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n8so9334967wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sJzA0i/H+YDKmFiCrU5oGCHwb1AfA8IVbHKvd2rmZ1U=;
        b=BinobWQIErbzXN62Tm8GQjvqMkK/Cb5JcPz9hgTF+P6VxU0RCIeizChE9wDSLeIcvV
         YaIXYEwjUMYPynl3dCdSAuU8yTTgYErISADY1yqTkBry0yewNurpr6V9FPtTfroTonkr
         qxXdNePgMJN21j79c4hwrNOfZrhhQ89tQUcjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sJzA0i/H+YDKmFiCrU5oGCHwb1AfA8IVbHKvd2rmZ1U=;
        b=e5+iK6BRQd9PPwEcgE2hPJbY8pAKcEcDP7PLlEngYv2shX7ijy0SYMXDQldIwVSoaR
         Zzhw7uHRCsWhcCrfchLb3bnxlybZQMaGUCQBMC0wN0fh6+5yxJ9QEOYw/vkmvgnwpi/s
         MVR6gdlgmnPSDeqNGEKJMePGVH/7pzRsGDM5svReJBogc8j3dpP39/BPdPbdZ/fueV8c
         7xtRDJBm3O0enMj56I5rmtEBry37f4yipy7BOk37Yx1dshXWb5dI4NWztO1kA9ziQ2+R
         le4Elfnmcg3iQOgqJ+e704M807xHSLv/Q4Y0aW1m8TXdJcIGX1bOeAEVtVXhqSTjRbc4
         5ygw==
X-Gm-Message-State: ACrzQf2xc8lTRAySblM8ilc1KkmggAwTgxlUCak+GzU5CB39UKpbClOU
	Wmi4mcqdkghQJMagaFlAzLODu7VyBw0IZQ==
X-Google-Smtp-Source: 
 AMsMyM7DuVu7j9B3QVC9kBRwLmMHlK2oIahrg4zO+MJNivYNMtQllPAJWSS6HRqAaLMmeby0rkqSgg==
X-Received: by 2002:a05:600c:3d05:b0:3b4:9a42:10d0 with SMTP id
 bh5-20020a05600c3d0500b003b49a4210d0mr4720837wmb.135.1663362501668;
        Fri, 16 Sep 2022 14:08:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/24] ccache: upgrade 4.6.2 -> 4.6.3
Date: Fri, 16 Sep 2022 22:07:57 +0100
Message-Id: <20220916210818.1228761-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170801

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{ccache_4.6.2.bb => ccache_4.6.3.bb}      |  6 ++--
 .../0001-Include-time.h-for-time_t.patch      | 29 -------------------
 ...ude-sys-types.h-for-mode_t-defintion.patch | 25 ----------------
 3 files changed, 2 insertions(+), 58 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.6.2.bb => ccache_4.6.3.bb} (80%)
 delete mode 100644 meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
 delete mode 100644 meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.2.bb b/meta/recipes-devtools/ccache/ccache_4.6.3.bb
similarity index 80%
rename from meta/recipes-devtools/ccache/ccache_4.6.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.6.3.bb
index dbac02243c0..5ed46cdc19e 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.3.bb
@@ -13,10 +13,8 @@ DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
-           file://0001-Include-time.h-for-time_t.patch \
-           file://0002-config-Include-sys-types.h-for-mode_t-defintion.patch \
-"
-SRC_URI[sha256sum] = "6a746a9bed01585388b68e2d58af2e77741fc8d66bc360b5a0b4c41fc284dafe"
+           "
+SRC_URI[sha256sum] = "f46ba3706ad80c30d4d5874dee2bf9227a7fcd0ccaac31b51919a3053d84bd05"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
diff --git a/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch b/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
deleted file mode 100644
index d752eb06512..00000000000
--- a/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 590c656838a9b3769a7a855fb1891bfa8d8878ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 10:27:21 -0700
-Subject: [PATCH] Include time.h for time_t
-
-Fixes
-src/core/Statistics.hpp:41:37: error: 'time_t' has not been declared
-|    41 |                                     time_t last_updated,
-|       |                                     ^~~~~~
-
-Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1145]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/core/Statistics.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/core/Statistics.hpp b/src/core/Statistics.hpp
-index 54f32e9..eb80e1c 100644
---- a/src/core/Statistics.hpp
-+++ b/src/core/Statistics.hpp
-@@ -21,6 +21,7 @@
- #include <core/StatisticsCounters.hpp>
- 
- #include <cstdint>
-+#include <ctime>
- #include <string>
- #include <unordered_map>
- #include <vector>
diff --git a/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch b/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch
deleted file mode 100644
index 0fd77602df5..00000000000
--- a/meta/recipes-devtools/ccache/files/0002-config-Include-sys-types.h-for-mode_t-defintion.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f98b390a2d323f7f92fb0492b0943d201afe5b8f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 10:40:53 -0700
-Subject: [PATCH] config: Include sys/types.h for mode_t defintion
-
-Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1145]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/Config.hpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/Config.hpp b/src/Config.hpp
-index a9e08ec..9e7af40 100644
---- a/src/Config.hpp
-+++ b/src/Config.hpp
-@@ -25,6 +25,8 @@
- 
- #include "third_party/nonstd/optional.hpp"
- 
-+#include <sys/types.h>
-+
- #include <cstdint>
- #include <functional>
- #include <limits>
-- 
2.34.1


