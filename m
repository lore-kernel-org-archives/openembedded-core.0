Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.4869.1597191029055865524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 17:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=xxyVdCxy;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id m22so271325ljj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnVYruDLfvhVln3et+1MU7DLIFapAx6/eXjq5eOuKNY=;
        b=xxyVdCxyO1L8cgKLy8d8KNVy8dAjqeBBIaCioAPuxOq6JQpMof4lKe0siwIv1+j8lh
         sITb12JY076bgWRFVpVJjTWSym2/JvtG1Qdex4ICb4HUxzkOoXDT48/pM5GRW/Hl8uWV
         q2cIAQElLSUnoEsGcjX/OIx48yiOtn/DG0lCt1MwDhT12aJHPExnaXuN3YEseymjD8m3
         NorkTrq3T8Rau4K6SbEJqHe89wIXb56PTGOkb+/VTZ6hLCtmGPM+7YiLt3m1y5jFObAy
         W6WcBt10aO9L2WzzaP3GrWj0IqaI1eYQ8n9VwOQyM5VRtoB7zw8anPZdRsRPI+uDf+ue
         1wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnVYruDLfvhVln3et+1MU7DLIFapAx6/eXjq5eOuKNY=;
        b=apeGF1hXjLLFJmMAFRmroG/dg7sIovGOhPgUvnF5PSr9GpUdxVgLgJXatc5ayZZM7l
         mqaDKZ3uFtKiP5Eth5f+aoyz1pKCieHLLvVJNEetENrUlKwNV4OkVq+Jz7+nlgIG9z8a
         4I2lzM8K2HCdZmoOhaUzODFtCOtVpiYRWvGM7sUv1ZzvcteaEG9aHdaLS88tBpKAnvwd
         oEPMXT8mG11OM6wNOJwGwe5mClHFLZllYTMTfbOhfqLX7jUAp0eW/uXz6oCXNSETKbU4
         VPDcMulziFuXQw3cDeey/koqoDqM7Tja7gfkjXQRAIvi5EO06KB9ydW2GFnGEcDz+wTp
         FfUA==
X-Gm-Message-State: AOAM532KPtXDgfy+AKFDnyTC0iuUF5Gb59bu8iCS34JYp1qcSody9mn8
	ByARvckIdfS/mTRo0PXvoZ4ANftGd6s=
X-Google-Smtp-Source: ABdhPJyupMXY6jKbTNz6OwVxtDRReQNRSW+ZTFaGJ7CS84cNyqGss1D8qlRtC37q9exuChHklA3F6g==
X-Received: by 2002:a2e:9f0a:: with SMTP id u10mr3930702ljk.140.1597191026463;
        Tue, 11 Aug 2020 17:10:26 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h23sm59681lfk.37.2020.08.11.17.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 17:10:25 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] iproute2: update to 5.8.0
Date: Wed, 12 Aug 2020 02:10:18 +0200
Message-Id: <20200812001018.554194-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-devlink.c-add-missing-include.patch  | 23 -------------------
 ...01-libc-compat.h-add-musl-workaround.patch | 10 ++++----
 .../{iproute2_5.7.0.bb => iproute2_5.8.0.bb}  |  2 +-
 3 files changed, 5 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.7.0.bb => iproute2_5.8.0.bb} (79%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
deleted file mode 100644
index f9580b7d44..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 6 Jun 2020 18:00:13 +0000
-Subject: [PATCH] devlink.c: add missing include
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- devlink/devlink.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 16602ab..c278e6d 100644
---- a/devlink/devlink.c
-+++ b/devlink/devlink.c
-@@ -26,6 +26,7 @@
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
- #include <sys/types.h>
-+#include <signal.h>
- 
- #include "SNAPSHOT.h"
- #include "list.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 50c4bfb0f2..60f31db9a2 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -1,4 +1,4 @@
-From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
+From c6109138e9e13c7e40313aacc3ea582c52ffd61f Mon Sep 17 00:00:00 2001
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
2.25.1

