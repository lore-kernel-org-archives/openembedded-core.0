Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.7515.1624360900955066637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i+zI278d;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id h17so13201796edw.11
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yG69FDy2YhI4JD6UAy7FwdAAnoFdZke6z8D7Am940GE=;
        b=i+zI278dSXbwCQdWNx9RKhFyPQvJCWZgSmexMUGIJqmaCLCxNiT1/z0+cjyd7/a7t5
         ZA5h8mF4cdl2GffS1gQAdLeOvWf92sBaSbeT/f/F3cOOrxZxHll/bNBQD20VLdYKL7yQ
         DyoYsNUjW/2stUjt5HULeaDHH81IcW15QAJJ4WSvnPMN3JNDgRcTOFOyKXqa52Oemxlq
         McAoo4KpKgouP9foYwMhu0o5yH4/xiXVhFxLSQD5X0upDtkOmcRN92mPYRTaI//oYE2c
         kTF2ggZKdNx9G2I9q0Vo26uGG6bswkFQjx2fJBajGLo92NiqHHjMw3jjyzCb4VOJSyuN
         hCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yG69FDy2YhI4JD6UAy7FwdAAnoFdZke6z8D7Am940GE=;
        b=r5pktk+ATLArmBuNhsmQr1kxgOVDVcLPGiwRQPazq3NkL0G7qIajIqpi0kRMntZdTd
         wMOH/D4+SVV3ckikSqrcvRm1hDnDmeaaBHPamuzTaNvly3m5w6hEucktu+Biuo9JwmfY
         2fetoR1HtZ9ujsKehlfTU1ze3fgAARLRblyq9Y1durf6FensLtwO1mNC7tErEze4g3Te
         ekiDojvaN7Th6KPdb1n8DrjGTbU3s6z5TQttBxaOv/Fn40oqgyRU1+O8+j0kp8zxus/L
         AtbEERm5fyiwo3aDIpVm6iJZBsvlPaQGcOr3IKcmVtn8+ikAgGcmnFvi54acF9NkGhLr
         mkQg==
X-Gm-Message-State: AOAM5329Z64g90hdn21cCJ4UA9EoRy2M5PUxF9FTnp9Il9k5BK1Dd3mI
	rtCrPlPGJHSRCA5A+DKMdkoT4UiYOo5W8A==
X-Google-Smtp-Source: ABdhPJymMAat9ajoXXQW88BmVW96qT1tvMROJXvyTaYTjisHl/LzAypKILlAbShMHWipCg63+0xN9Q==
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr4282722edp.38.1624360899591;
        Tue, 22 Jun 2021 04:21:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/19] mtools: upgrade 4.0.29 -> 4.0.31
Date: Tue, 22 Jun 2021 13:21:21 +0200
Message-Id: <20210622112126.2026646-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.29.bb => mtools_4.0.31.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.29.bb => mtools_4.0.31.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index f187487096..7240a039e6 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 9590860ba35cbd524cec51bdd009f0c63a7dd417 Mon Sep 17 00:00:00 2001
+From 589a05f9377e3899082ced46c1736f90c0a4dc9b Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 415755f..b61a49d 100644
+index f91004b..b72f8ea 100644
 --- a/config.c
 +++ b/config.c
-@@ -774,14 +774,6 @@ void read_config(void)
+@@ -827,14 +827,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.29.bb b/meta/recipes-devtools/mtools/mtools_4.0.31.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.29.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.31.bb
index 38de1dd923..103036e518 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.29.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.31.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "c6b50b4603e7afe54ba0109094669373028db9af743f5c541bca4b7664aefec7"
+SRC_URI[sha256sum] = "538999277f8f2fa901f3898855d1b0ccb184666457fefddb70001cac612dd586"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.31.1

