Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.86664.1597837752192365188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 04:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B0o457G0;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p24so25880562ejf.13
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUxp4Ui/wGVg+riD17KV7txftMiMc4gpPXrVJ60ErWY=;
        b=B0o457G0iCESh1fPrGGQjSELPCDNWrpdFVWYfUTuCoMUgLV7i9w6zkSjQyuwnJIebs
         MvWQpZOHljkfVNMNBHDp2SX2tdi/PGYpqnV5jU+Q377+xZ9cKSdeA8xTtu6+fBWAtQFt
         9+ZEpc257R9Gki/Y/dn4qXbTkMynU6+dgjWfxedKMaYX5dXe6XqM/bZ6w5c604cTHHMZ
         YTxF6aOEzPvaM3GRx+MIgBa1NcJCHzxVRhbUpxMSTIQOPf6DTr8dNFplET2QwY6BPvjt
         kI/jdgKa7/9UpNFx6qGsPh2OEGGmE5phaTpseTvR8H0RqPIk4eMvG/lcMx+adqxzxZTL
         uJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUxp4Ui/wGVg+riD17KV7txftMiMc4gpPXrVJ60ErWY=;
        b=HXbcYpCsRgT1lKoF233uMoCp2jOik8qyLDUbA2riqoMUMkw3qVfhEC5DWcMvnyX09k
         Mj/Fs3G6031IfHSo82GnBKYHt+gvveMYx+OF8UqX/NQJLNmidncAMs78cXLRqyNx+xqn
         jokzvGfsgz1FIWznvPMgUkiIQEuVzlRblFLitLlNyRCKR11DUyNIB0+PsFKyl2CdGlSa
         h5Olrw8wu/cFSWdSx78pTLN8XFd8urQvGp/mZdc51kpmnvSR+IhmnDyh+n+Fppd6CjI+
         UEruxB2ZvLhE6fsAUd0314h0MUPUvQIq9DF7xepDIIs/7A1B+m4H42+aJOeOe2/lQ4o3
         B5MQ==
X-Gm-Message-State: AOAM532rnLdTx2DI5RNrumMRPfpYcNjty1Yzay2E4+TYftnLDzs1rf3w
	5jdsVOCjoNsXwXDOfeWQKun9Z63yJg1mIQ==
X-Google-Smtp-Source: ABdhPJyHT/EWBZ93YB8RSKcwbmo5cl12gzgSIYLV6CtOQqaz/3T8PJfc/HZwdU4ju4gOeqFNRXOCwQ==
X-Received: by 2002:a17:906:228a:: with SMTP id p10mr24435578eja.23.1597837750199;
        Wed, 19 Aug 2020 04:49:10 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net (ip5f5af139.dynamic.kabel-deutschland.de. [95.90.241.57])
        by smtp.gmail.com with ESMTPSA id i35sm6419188edi.41.2020.08.19.04.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 04:49:09 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [meta-oe][PATCH] iproute2: upgrade 5.7.0 -> 5.8.0
Date: Wed, 19 Aug 2020 13:50:56 +0200
Message-Id: <20200819115056.19049-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-devlink.c-add-missing-include.patch        | 13 +++++++------
 .../0001-libc-compat.h-add-musl-workaround.patch    | 10 ++++------
 .../{iproute2_5.7.0.bb => iproute2_5.8.0.bb}        |  2 +-
 3 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.7.0.bb => iproute2_5.8.0.bb} (79%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
index f9580b7d44..fdd8bbfb3c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
@@ -1,23 +1,24 @@
-From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
+From ce39396d4617874323f6039a5b476e44bf552908 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 6 Jun 2020 18:00:13 +0000
 Subject: [PATCH] devlink.c: add missing include
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  devlink/devlink.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 16602ab..c278e6d 100644
+index 0982fae..93dc01c 100644
 --- a/devlink/devlink.c
 +++ b/devlink/devlink.c
-@@ -26,6 +26,7 @@
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
+@@ -33,6 +33,7 @@
+ #include <sys/select.h>
+ #include <sys/socket.h>
  #include <sys/types.h>
 +#include <signal.h>
  
- #include "SNAPSHOT.h"
+ #include "version.h"
  #include "list.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 50c4bfb0f2..74e3de1ce9 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -1,4 +1,4 @@
-From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
+From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Thu, 22 Dec 2016 15:26:30 +0200
 Subject: [PATCH] libc-compat.h: add musl workaround
@@ -14,15 +14,16 @@ https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-work
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  include/uapi/linux/libc-compat.h | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
-index f38571d..30f0b67 100644
+index a159991..22198fa 100644
 --- a/include/uapi/linux/libc-compat.h
 +++ b/include/uapi/linux/libc-compat.h
-@@ -49,10 +49,12 @@
+@@ -50,10 +50,12 @@
  #define _LIBC_COMPAT_H
  
  /* We have included glibc headers... */
@@ -36,6 +37,3 @@ index f38571d..30f0b67 100644
  
  /* GLIBC headers included first so don't define anything
   * that would already be defined. */
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
similarity index 79%
rename from meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
index 276afeab11..3a590f9122 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
@@ -5,7 +5,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-devlink.c-add-missing-include.patch \
            "
 
-SRC_URI[sha256sum] = "725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21"
+SRC_URI[sha256sum] = "cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.23.0

