Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B3DC4167D
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.6572.1635842604914429823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=avqhqktK;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id z200so14091789wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHBr4PaV1iLi+5zv/wRyD4ag7AQXc6A/XDkO57hb7f4=;
        b=avqhqktKWq7hj2Kgmql2gMgnOSHmK/2WpWgiDfmPguWs9Esn6vBVtKSAg7kq2OifE6
         jVQDFb8bsszdNepS5oPSaMpFm20jfrIkbbc8A0TDSewXY6LGbmyTKAIDjMtAIRsaWdbl
         TiB22FuIyTyu9STc73knrgqDK3c4qU3yVt0VicQsLccXgKhBGJwbtkakiqustcKLUVi9
         4g6QfszFyS7Daql7QpsToycvoz6dLLg1KofxTeroitrrQHvybn66I3/ts2gCNI7c4x7B
         sjVwMYsQExduULlyDEDx8rm+/68iJEhmqQeS9e8j3FWkC7uzfIKr5ptRalYWAyMHoUgh
         XLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHBr4PaV1iLi+5zv/wRyD4ag7AQXc6A/XDkO57hb7f4=;
        b=4h+ado315wrcBxCw/UhwKE7qtSLpG9ozRc2DciR9j0SOJfTDbmWjAwzeI5Uc970wXl
         V0TubNU+QkxlAIhF+2K7FsmbKEA5LjDBY5qc4LIWaqVPDvKztPXfDHLjonU9odeYpQ3s
         CoSgOont/bHH8e26Ld9PQBJ6I2M3cCz1wpU1QmoXisinR1e+5KCMyqhy68lqJhnB2Uk4
         9Ei8TWwiWM4C2a6pSaLzPK6hDzzpt61eTlAI6bTQ9zoV2rqN01c3znRuxwJkX6x/iS61
         Brf713vIkeK6HBObHqH6qppPyHB5+KVIxfj1v+LAVvEpJML0E8uy3DIL1nwYLjdy71Ey
         maNA==
X-Gm-Message-State: AOAM533ab3beyJU7iyDQFKJWrRPEZwW2eTgzapcTP3C+Pu/IC893786k
	xrlbJUsmEJAhbajQmrJBvaTyfGcG5B4=
X-Google-Smtp-Source: 
 ABdhPJzwYnaWGHC4DizqLnTl3rz2gplGFgrhZG/3mpdrhZGMiTHot9CyPi/QwCgelAEVwUUmDF6+3A==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr5121952wmi.171.1635842603362;
        Tue, 02 Nov 2021 01:43:23 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Liwei Song <liwei.song@windriver.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 28/33] xf86-video-intel: update to latest commit
Date: Tue,  2 Nov 2021 09:42:58 +0100
Message-Id: <20211102084303.2974802-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157766

Drop patches merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Sync-i915_pciids-upto-8717c6b7414f.patch | 505 ------------------
 ...plicate-definition-of-I810PatternROP.patch |  27 -
 .../xorg-driver/xf86-video-intel_git.bb       |   4 +-
 3 files changed, 1 insertion(+), 535 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Sync-i915_pciids-upto-8717c6b7414f.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Sync-i915_pciids-upto-8717c6b7414f.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Sync-i915_pciids-upto-8717c6b7414f.patch
deleted file mode 100644
index ef3b1afb1f..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-Sync-i915_pciids-upto-8717c6b7414f.patch
+++ /dev/null
@@ -1,505 +0,0 @@
-From 05909fea93f29b2b6e1d554dd64201551bd7a022 Mon Sep 17 00:00:00 2001
-From: Liwei Song <liwei.song@windriver.com>
-Date: Fri, 17 Apr 2020 16:11:59 +0800
-Subject: [PATCH] Sync i915_pciids upto 8717c6b7414f
-
-Import the kernel's i915_pciids.h, up to:
-
-commit 8717c6b7414ffb890672276dccc284c23078ac0e
-Author: Lee Shawn C <shawn.c.lee@intel.com>
-Date:   Tue Dec 10 23:04:15 2019 +0800
-
-    drm/i915/cml: Separate U series pci id from origianl list.
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/11494645/]
-
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- src/i915_pciids.h  | 265 ++++++++++++++++++++++++++++++++++-----------
- src/intel_module.c |   2 +-
- test/dri3-test.c   |   2 +-
- 3 files changed, 206 insertions(+), 63 deletions(-)
-
-diff --git a/src/i915_pciids.h b/src/i915_pciids.h
-index fd965ffbb92e..1d2c12219f44 100644
---- a/src/i915_pciids.h
-+++ b/src/i915_pciids.h
-@@ -108,8 +108,10 @@
- 	INTEL_VGA_DEVICE(0x2e42, info), /* B43_G */ \
- 	INTEL_VGA_DEVICE(0x2e92, info)	/* B43_G.1 */
- 
--#define INTEL_PINEVIEW_IDS(info)			\
--	INTEL_VGA_DEVICE(0xa001, info),			\
-+#define INTEL_PINEVIEW_G_IDS(info) \
-+	INTEL_VGA_DEVICE(0xa001, info)
-+
-+#define INTEL_PINEVIEW_M_IDS(info) \
- 	INTEL_VGA_DEVICE(0xa011, info)
- 
- #define INTEL_IRONLAKE_D_IDS(info) \
-@@ -166,7 +168,18 @@
- #define INTEL_IVB_Q_IDS(info) \
- 	INTEL_QUANTA_VGA_DEVICE(info) /* Quanta transcode */
- 
-+#define INTEL_HSW_ULT_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x0A02, info), /* ULT GT1 desktop */ \
-+	INTEL_VGA_DEVICE(0x0A0A, info), /* ULT GT1 server */ \
-+	INTEL_VGA_DEVICE(0x0A0B, info), /* ULT GT1 reserved */ \
-+	INTEL_VGA_DEVICE(0x0A06, info)  /* ULT GT1 mobile */
-+
-+#define INTEL_HSW_ULX_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x0A0E, info) /* ULX GT1 mobile */
-+
- #define INTEL_HSW_GT1_IDS(info) \
-+	INTEL_HSW_ULT_GT1_IDS(info), \
-+	INTEL_HSW_ULX_GT1_IDS(info), \
- 	INTEL_VGA_DEVICE(0x0402, info), /* GT1 desktop */ \
- 	INTEL_VGA_DEVICE(0x040a, info), /* GT1 server */ \
- 	INTEL_VGA_DEVICE(0x040B, info), /* GT1 reserved */ \
-@@ -175,20 +188,26 @@
- 	INTEL_VGA_DEVICE(0x0C0A, info), /* SDV GT1 server */ \
- 	INTEL_VGA_DEVICE(0x0C0B, info), /* SDV GT1 reserved */ \
- 	INTEL_VGA_DEVICE(0x0C0E, info), /* SDV GT1 reserved */ \
--	INTEL_VGA_DEVICE(0x0A02, info), /* ULT GT1 desktop */ \
--	INTEL_VGA_DEVICE(0x0A0A, info), /* ULT GT1 server */ \
--	INTEL_VGA_DEVICE(0x0A0B, info), /* ULT GT1 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D02, info), /* CRW GT1 desktop */ \
- 	INTEL_VGA_DEVICE(0x0D0A, info), /* CRW GT1 server */ \
- 	INTEL_VGA_DEVICE(0x0D0B, info), /* CRW GT1 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D0E, info), /* CRW GT1 reserved */ \
- 	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
- 	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
--	INTEL_VGA_DEVICE(0x0A06, info), /* ULT GT1 mobile */ \
--	INTEL_VGA_DEVICE(0x0A0E, info), /* ULX GT1 mobile */ \
- 	INTEL_VGA_DEVICE(0x0D06, info)  /* CRW GT1 mobile */
- 
-+#define INTEL_HSW_ULT_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x0A12, info), /* ULT GT2 desktop */ \
-+	INTEL_VGA_DEVICE(0x0A1A, info), /* ULT GT2 server */ \
-+	INTEL_VGA_DEVICE(0x0A1B, info), /* ULT GT2 reserved */ \
-+	INTEL_VGA_DEVICE(0x0A16, info)  /* ULT GT2 mobile */
-+
-+#define INTEL_HSW_ULX_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x0A1E, info) /* ULX GT2 mobile */ \
-+
- #define INTEL_HSW_GT2_IDS(info) \
-+	INTEL_HSW_ULT_GT2_IDS(info), \
-+	INTEL_HSW_ULX_GT2_IDS(info), \
- 	INTEL_VGA_DEVICE(0x0412, info), /* GT2 desktop */ \
- 	INTEL_VGA_DEVICE(0x041a, info), /* GT2 server */ \
- 	INTEL_VGA_DEVICE(0x041B, info), /* GT2 reserved */ \
-@@ -197,9 +216,6 @@
- 	INTEL_VGA_DEVICE(0x0C1A, info), /* SDV GT2 server */ \
- 	INTEL_VGA_DEVICE(0x0C1B, info), /* SDV GT2 reserved */ \
- 	INTEL_VGA_DEVICE(0x0C1E, info), /* SDV GT2 reserved */ \
--	INTEL_VGA_DEVICE(0x0A12, info), /* ULT GT2 desktop */ \
--	INTEL_VGA_DEVICE(0x0A1A, info), /* ULT GT2 server */ \
--	INTEL_VGA_DEVICE(0x0A1B, info), /* ULT GT2 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D12, info), /* CRW GT2 desktop */ \
- 	INTEL_VGA_DEVICE(0x0D1A, info), /* CRW GT2 server */ \
- 	INTEL_VGA_DEVICE(0x0D1B, info), /* CRW GT2 reserved */ \
-@@ -207,11 +223,17 @@
- 	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
- 	INTEL_VGA_DEVICE(0x0426, info), /* GT2 mobile */ \
- 	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
--	INTEL_VGA_DEVICE(0x0A16, info), /* ULT GT2 mobile */ \
--	INTEL_VGA_DEVICE(0x0A1E, info), /* ULX GT2 mobile */ \
- 	INTEL_VGA_DEVICE(0x0D16, info)  /* CRW GT2 mobile */
- 
-+#define INTEL_HSW_ULT_GT3_IDS(info) \
-+	INTEL_VGA_DEVICE(0x0A22, info), /* ULT GT3 desktop */ \
-+	INTEL_VGA_DEVICE(0x0A2A, info), /* ULT GT3 server */ \
-+	INTEL_VGA_DEVICE(0x0A2B, info), /* ULT GT3 reserved */ \
-+	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
-+	INTEL_VGA_DEVICE(0x0A2E, info)  /* ULT GT3 reserved */
-+
- #define INTEL_HSW_GT3_IDS(info) \
-+	INTEL_HSW_ULT_GT3_IDS(info), \
- 	INTEL_VGA_DEVICE(0x0422, info), /* GT3 desktop */ \
- 	INTEL_VGA_DEVICE(0x042a, info), /* GT3 server */ \
- 	INTEL_VGA_DEVICE(0x042B, info), /* GT3 reserved */ \
-@@ -220,16 +242,11 @@
- 	INTEL_VGA_DEVICE(0x0C2A, info), /* SDV GT3 server */ \
- 	INTEL_VGA_DEVICE(0x0C2B, info), /* SDV GT3 reserved */ \
- 	INTEL_VGA_DEVICE(0x0C2E, info), /* SDV GT3 reserved */ \
--	INTEL_VGA_DEVICE(0x0A22, info), /* ULT GT3 desktop */ \
--	INTEL_VGA_DEVICE(0x0A2A, info), /* ULT GT3 server */ \
--	INTEL_VGA_DEVICE(0x0A2B, info), /* ULT GT3 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D22, info), /* CRW GT3 desktop */ \
- 	INTEL_VGA_DEVICE(0x0D2A, info), /* CRW GT3 server */ \
- 	INTEL_VGA_DEVICE(0x0D2B, info), /* CRW GT3 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D2E, info), /* CRW GT3 reserved */ \
- 	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
--	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
--	INTEL_VGA_DEVICE(0x0A2E, info), /* ULT GT3 reserved */ \
- 	INTEL_VGA_DEVICE(0x0D26, info)  /* CRW GT3 mobile */
- 
- #define INTEL_HSW_IDS(info) \
-@@ -245,35 +262,59 @@
- 	INTEL_VGA_DEVICE(0x0157, info), \
- 	INTEL_VGA_DEVICE(0x0155, info)
- 
--#define INTEL_BDW_GT1_IDS(info)  \
--	INTEL_VGA_DEVICE(0x1602, info), /* GT1 ULT */ \
-+#define INTEL_BDW_ULT_GT1_IDS(info) \
- 	INTEL_VGA_DEVICE(0x1606, info), /* GT1 ULT */ \
--	INTEL_VGA_DEVICE(0x160B, info), /* GT1 Iris */ \
--	INTEL_VGA_DEVICE(0x160E, info), /* GT1 ULX */ \
-+	INTEL_VGA_DEVICE(0x160B, info)  /* GT1 Iris */
-+
-+#define INTEL_BDW_ULX_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x160E, info) /* GT1 ULX */
-+
-+#define INTEL_BDW_GT1_IDS(info) \
-+	INTEL_BDW_ULT_GT1_IDS(info), \
-+	INTEL_BDW_ULX_GT1_IDS(info), \
-+	INTEL_VGA_DEVICE(0x1602, info), /* GT1 ULT */ \
- 	INTEL_VGA_DEVICE(0x160A, info), /* GT1 Server */ \
- 	INTEL_VGA_DEVICE(0x160D, info)  /* GT1 Workstation */
- 
--#define INTEL_BDW_GT2_IDS(info)  \
--	INTEL_VGA_DEVICE(0x1612, info), /* GT2 Halo */	\
-+#define INTEL_BDW_ULT_GT2_IDS(info) \
- 	INTEL_VGA_DEVICE(0x1616, info), /* GT2 ULT */ \
--	INTEL_VGA_DEVICE(0x161B, info), /* GT2 ULT */ \
--	INTEL_VGA_DEVICE(0x161E, info), /* GT2 ULX */ \
-+	INTEL_VGA_DEVICE(0x161B, info)  /* GT2 ULT */
-+
-+#define INTEL_BDW_ULX_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x161E, info) /* GT2 ULX */
-+
-+#define INTEL_BDW_GT2_IDS(info) \
-+	INTEL_BDW_ULT_GT2_IDS(info), \
-+	INTEL_BDW_ULX_GT2_IDS(info), \
-+	INTEL_VGA_DEVICE(0x1612, info), /* GT2 Halo */	\
- 	INTEL_VGA_DEVICE(0x161A, info), /* GT2 Server */ \
- 	INTEL_VGA_DEVICE(0x161D, info)  /* GT2 Workstation */
- 
-+#define INTEL_BDW_ULT_GT3_IDS(info) \
-+	INTEL_VGA_DEVICE(0x1626, info), /* ULT */ \
-+	INTEL_VGA_DEVICE(0x162B, info)  /* Iris */ \
-+
-+#define INTEL_BDW_ULX_GT3_IDS(info) \
-+	INTEL_VGA_DEVICE(0x162E, info)  /* ULX */
-+
- #define INTEL_BDW_GT3_IDS(info) \
-+	INTEL_BDW_ULT_GT3_IDS(info), \
-+	INTEL_BDW_ULX_GT3_IDS(info), \
- 	INTEL_VGA_DEVICE(0x1622, info), /* ULT */ \
--	INTEL_VGA_DEVICE(0x1626, info), /* ULT */ \
--	INTEL_VGA_DEVICE(0x162B, info), /* Iris */ \
--	INTEL_VGA_DEVICE(0x162E, info),  /* ULX */\
- 	INTEL_VGA_DEVICE(0x162A, info), /* Server */ \
- 	INTEL_VGA_DEVICE(0x162D, info)  /* Workstation */
- 
-+#define INTEL_BDW_ULT_RSVD_IDS(info) \
-+	INTEL_VGA_DEVICE(0x1636, info), /* ULT */ \
-+	INTEL_VGA_DEVICE(0x163B, info)  /* Iris */
-+
-+#define INTEL_BDW_ULX_RSVD_IDS(info) \
-+	INTEL_VGA_DEVICE(0x163E, info) /* ULX */
-+
- #define INTEL_BDW_RSVD_IDS(info) \
-+	INTEL_BDW_ULT_RSVD_IDS(info), \
-+	INTEL_BDW_ULX_RSVD_IDS(info), \
- 	INTEL_VGA_DEVICE(0x1632, info), /* ULT */ \
--	INTEL_VGA_DEVICE(0x1636, info), /* ULT */ \
--	INTEL_VGA_DEVICE(0x163B, info), /* Iris */ \
--	INTEL_VGA_DEVICE(0x163E, info), /* ULX */ \
- 	INTEL_VGA_DEVICE(0x163A, info), /* Server */ \
- 	INTEL_VGA_DEVICE(0x163D, info)  /* Workstation */
- 
-@@ -289,25 +330,40 @@
- 	INTEL_VGA_DEVICE(0x22b2, info), \
- 	INTEL_VGA_DEVICE(0x22b3, info)
- 
-+#define INTEL_SKL_ULT_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x1906, info) /* ULT GT1 */
-+
-+#define INTEL_SKL_ULX_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x190E, info) /* ULX GT1 */
-+
- #define INTEL_SKL_GT1_IDS(info)	\
--	INTEL_VGA_DEVICE(0x1906, info), /* ULT GT1 */ \
--	INTEL_VGA_DEVICE(0x190E, info), /* ULX GT1 */ \
-+	INTEL_SKL_ULT_GT1_IDS(info), \
-+	INTEL_SKL_ULX_GT1_IDS(info), \
- 	INTEL_VGA_DEVICE(0x1902, info), /* DT  GT1 */ \
- 	INTEL_VGA_DEVICE(0x190B, info), /* Halo GT1 */ \
- 	INTEL_VGA_DEVICE(0x190A, info) /* SRV GT1 */
- 
--#define INTEL_SKL_GT2_IDS(info)	\
-+#define INTEL_SKL_ULT_GT2_IDS(info) \
- 	INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
--	INTEL_VGA_DEVICE(0x1921, info), /* ULT GT2F */ \
--	INTEL_VGA_DEVICE(0x191E, info), /* ULX GT2 */ \
-+	INTEL_VGA_DEVICE(0x1921, info)  /* ULT GT2F */
-+
-+#define INTEL_SKL_ULX_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x191E, info) /* ULX GT2 */
-+
-+#define INTEL_SKL_GT2_IDS(info)	\
-+	INTEL_SKL_ULT_GT2_IDS(info), \
-+	INTEL_SKL_ULX_GT2_IDS(info), \
- 	INTEL_VGA_DEVICE(0x1912, info), /* DT  GT2 */ \
- 	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
- 	INTEL_VGA_DEVICE(0x191A, info), /* SRV GT2 */ \
- 	INTEL_VGA_DEVICE(0x191D, info)  /* WKS GT2 */
- 
-+#define INTEL_SKL_ULT_GT3_IDS(info) \
-+	INTEL_VGA_DEVICE(0x1926, info) /* ULT GT3 */
-+
- #define INTEL_SKL_GT3_IDS(info) \
-+	INTEL_SKL_ULT_GT3_IDS(info), \
- 	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
--	INTEL_VGA_DEVICE(0x1926, info), /* ULT GT3 */ \
- 	INTEL_VGA_DEVICE(0x1927, info), /* ULT GT3 */ \
- 	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3 */ \
- 	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3 */
-@@ -336,45 +392,91 @@
- 	INTEL_VGA_DEVICE(0x3184, info), \
- 	INTEL_VGA_DEVICE(0x3185, info)
- 
--#define INTEL_KBL_GT1_IDS(info)	\
--	INTEL_VGA_DEVICE(0x5913, info), /* ULT GT1.5 */ \
--	INTEL_VGA_DEVICE(0x5915, info), /* ULX GT1.5 */ \
-+#define INTEL_KBL_ULT_GT1_IDS(info) \
- 	INTEL_VGA_DEVICE(0x5906, info), /* ULT GT1 */ \
-+	INTEL_VGA_DEVICE(0x5913, info)  /* ULT GT1.5 */
-+
-+#define INTEL_KBL_ULX_GT1_IDS(info) \
- 	INTEL_VGA_DEVICE(0x590E, info), /* ULX GT1 */ \
-+	INTEL_VGA_DEVICE(0x5915, info)  /* ULX GT1.5 */
-+
-+#define INTEL_KBL_GT1_IDS(info)	\
-+	INTEL_KBL_ULT_GT1_IDS(info), \
-+	INTEL_KBL_ULX_GT1_IDS(info), \
- 	INTEL_VGA_DEVICE(0x5902, info), /* DT  GT1 */ \
- 	INTEL_VGA_DEVICE(0x5908, info), /* Halo GT1 */ \
- 	INTEL_VGA_DEVICE(0x590B, info), /* Halo GT1 */ \
- 	INTEL_VGA_DEVICE(0x590A, info) /* SRV GT1 */
- 
--#define INTEL_KBL_GT2_IDS(info)	\
-+#define INTEL_KBL_ULT_GT2_IDS(info) \
- 	INTEL_VGA_DEVICE(0x5916, info), /* ULT GT2 */ \
-+	INTEL_VGA_DEVICE(0x5921, info)  /* ULT GT2F */
-+
-+#define INTEL_KBL_ULX_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x591E, info)  /* ULX GT2 */
-+
-+#define INTEL_KBL_GT2_IDS(info)	\
-+	INTEL_KBL_ULT_GT2_IDS(info), \
-+	INTEL_KBL_ULX_GT2_IDS(info), \
- 	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
--	INTEL_VGA_DEVICE(0x5921, info), /* ULT GT2F */ \
--	INTEL_VGA_DEVICE(0x591E, info), /* ULX GT2 */ \
- 	INTEL_VGA_DEVICE(0x5912, info), /* DT  GT2 */ \
- 	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
- 	INTEL_VGA_DEVICE(0x591A, info), /* SRV GT2 */ \
- 	INTEL_VGA_DEVICE(0x591D, info) /* WKS GT2 */
- 
-+#define INTEL_KBL_ULT_GT3_IDS(info) \
-+	INTEL_VGA_DEVICE(0x5926, info) /* ULT GT3 */
-+
- #define INTEL_KBL_GT3_IDS(info) \
-+	INTEL_KBL_ULT_GT3_IDS(info), \
- 	INTEL_VGA_DEVICE(0x5923, info), /* ULT GT3 */ \
--	INTEL_VGA_DEVICE(0x5926, info), /* ULT GT3 */ \
- 	INTEL_VGA_DEVICE(0x5927, info) /* ULT GT3 */
- 
- #define INTEL_KBL_GT4_IDS(info) \
- 	INTEL_VGA_DEVICE(0x593B, info) /* Halo GT4 */
- 
- /* AML/KBL Y GT2 */
--#define INTEL_AML_GT2_IDS(info) \
-+#define INTEL_AML_KBL_GT2_IDS(info) \
- 	INTEL_VGA_DEVICE(0x591C, info),  /* ULX GT2 */ \
- 	INTEL_VGA_DEVICE(0x87C0, info) /* ULX GT2 */
- 
-+/* AML/CFL Y GT2 */
-+#define INTEL_AML_CFL_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x87CA, info)
-+
-+/* CML GT1 */
-+#define INTEL_CML_GT1_IDS(info)	\
-+	INTEL_VGA_DEVICE(0x9BA5, info), \
-+	INTEL_VGA_DEVICE(0x9BA8, info), \
-+	INTEL_VGA_DEVICE(0x9BA4, info), \
-+	INTEL_VGA_DEVICE(0x9BA2, info)
-+
-+#define INTEL_CML_U_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x9B21, info), \
-+	INTEL_VGA_DEVICE(0x9BAA, info), \
-+	INTEL_VGA_DEVICE(0x9BAC, info)
-+
-+/* CML GT2 */
-+#define INTEL_CML_GT2_IDS(info)	\
-+	INTEL_VGA_DEVICE(0x9BC5, info), \
-+	INTEL_VGA_DEVICE(0x9BC8, info), \
-+	INTEL_VGA_DEVICE(0x9BC4, info), \
-+	INTEL_VGA_DEVICE(0x9BC2, info), \
-+	INTEL_VGA_DEVICE(0x9BC6, info), \
-+	INTEL_VGA_DEVICE(0x9BE6, info), \
-+	INTEL_VGA_DEVICE(0x9BF6, info)
-+
-+#define INTEL_CML_U_GT2_IDS(info) \
-+	INTEL_VGA_DEVICE(0x9B41, info), \
-+	INTEL_VGA_DEVICE(0x9BCA, info), \
-+	INTEL_VGA_DEVICE(0x9BCC, info)
-+
- #define INTEL_KBL_IDS(info) \
- 	INTEL_KBL_GT1_IDS(info), \
- 	INTEL_KBL_GT2_IDS(info), \
- 	INTEL_KBL_GT3_IDS(info), \
- 	INTEL_KBL_GT4_IDS(info), \
--	INTEL_AML_GT2_IDS(info)
-+	INTEL_AML_KBL_GT2_IDS(info)
- 
- /* CFL S */
- #define INTEL_CFL_S_GT1_IDS(info) \
-@@ -390,6 +492,9 @@
- 	INTEL_VGA_DEVICE(0x3E9A, info)  /* SRV GT2 */
- 
- /* CFL H */
-+#define INTEL_CFL_H_GT1_IDS(info) \
-+	INTEL_VGA_DEVICE(0x3E9C, info)
-+
- #define INTEL_CFL_H_GT2_IDS(info) \
- 	INTEL_VGA_DEVICE(0x3E9B, info), /* Halo GT2 */ \
- 	INTEL_VGA_DEVICE(0x3E94, info)  /* Halo GT2 */
-@@ -407,30 +512,43 @@
- 
- /* WHL/CFL U GT1 */
- #define INTEL_WHL_U_GT1_IDS(info) \
--	INTEL_VGA_DEVICE(0x3EA1, info)
-+	INTEL_VGA_DEVICE(0x3EA1, info), \
-+	INTEL_VGA_DEVICE(0x3EA4, info)
- 
- /* WHL/CFL U GT2 */
- #define INTEL_WHL_U_GT2_IDS(info) \
--	INTEL_VGA_DEVICE(0x3EA0, info)
-+	INTEL_VGA_DEVICE(0x3EA0, info), \
-+	INTEL_VGA_DEVICE(0x3EA3, info)
- 
- /* WHL/CFL U GT3 */
- #define INTEL_WHL_U_GT3_IDS(info) \
--	INTEL_VGA_DEVICE(0x3EA2, info), \
--	INTEL_VGA_DEVICE(0x3EA3, info), \
--	INTEL_VGA_DEVICE(0x3EA4, info)
-+	INTEL_VGA_DEVICE(0x3EA2, info)
- 
- #define INTEL_CFL_IDS(info)	   \
- 	INTEL_CFL_S_GT1_IDS(info), \
- 	INTEL_CFL_S_GT2_IDS(info), \
-+	INTEL_CFL_H_GT1_IDS(info), \
- 	INTEL_CFL_H_GT2_IDS(info), \
- 	INTEL_CFL_U_GT2_IDS(info), \
- 	INTEL_CFL_U_GT3_IDS(info), \
- 	INTEL_WHL_U_GT1_IDS(info), \
- 	INTEL_WHL_U_GT2_IDS(info), \
--	INTEL_WHL_U_GT3_IDS(info)
-+	INTEL_WHL_U_GT3_IDS(info), \
-+	INTEL_AML_CFL_GT2_IDS(info), \
-+	INTEL_CML_GT1_IDS(info), \
-+	INTEL_CML_GT2_IDS(info), \
-+	INTEL_CML_U_GT1_IDS(info), \
-+	INTEL_CML_U_GT2_IDS(info)
- 
- /* CNL */
-+#define INTEL_CNL_PORT_F_IDS(info) \
-+	INTEL_VGA_DEVICE(0x5A54, info), \
-+	INTEL_VGA_DEVICE(0x5A5C, info), \
-+	INTEL_VGA_DEVICE(0x5A44, info), \
-+	INTEL_VGA_DEVICE(0x5A4C, info)
-+
- #define INTEL_CNL_IDS(info) \
-+	INTEL_CNL_PORT_F_IDS(info), \
- 	INTEL_VGA_DEVICE(0x5A51, info), \
- 	INTEL_VGA_DEVICE(0x5A59, info), \
- 	INTEL_VGA_DEVICE(0x5A41, info), \
-@@ -440,22 +558,47 @@
- 	INTEL_VGA_DEVICE(0x5A42, info), \
- 	INTEL_VGA_DEVICE(0x5A4A, info), \
- 	INTEL_VGA_DEVICE(0x5A50, info), \
--	INTEL_VGA_DEVICE(0x5A40, info), \
--	INTEL_VGA_DEVICE(0x5A54, info), \
--	INTEL_VGA_DEVICE(0x5A5C, info), \
--	INTEL_VGA_DEVICE(0x5A44, info), \
--	INTEL_VGA_DEVICE(0x5A4C, info)
-+	INTEL_VGA_DEVICE(0x5A40, info)
- 
- /* ICL */
--#define INTEL_ICL_11_IDS(info) \
-+#define INTEL_ICL_PORT_F_IDS(info) \
- 	INTEL_VGA_DEVICE(0x8A50, info), \
--	INTEL_VGA_DEVICE(0x8A51, info), \
- 	INTEL_VGA_DEVICE(0x8A5C, info), \
--	INTEL_VGA_DEVICE(0x8A5D, info), \
-+	INTEL_VGA_DEVICE(0x8A59, info),	\
-+	INTEL_VGA_DEVICE(0x8A58, info),	\
- 	INTEL_VGA_DEVICE(0x8A52, info), \
- 	INTEL_VGA_DEVICE(0x8A5A, info), \
- 	INTEL_VGA_DEVICE(0x8A5B, info), \
-+	INTEL_VGA_DEVICE(0x8A57, info), \
-+	INTEL_VGA_DEVICE(0x8A56, info), \
- 	INTEL_VGA_DEVICE(0x8A71, info), \
--	INTEL_VGA_DEVICE(0x8A70, info)
-+	INTEL_VGA_DEVICE(0x8A70, info), \
-+	INTEL_VGA_DEVICE(0x8A53, info), \
-+	INTEL_VGA_DEVICE(0x8A54, info)
-+
-+#define INTEL_ICL_11_IDS(info) \
-+	INTEL_ICL_PORT_F_IDS(info), \
-+	INTEL_VGA_DEVICE(0x8A51, info), \
-+	INTEL_VGA_DEVICE(0x8A5D, info)
-+
-+/* EHL/JSL */
-+#define INTEL_EHL_IDS(info) \
-+	INTEL_VGA_DEVICE(0x4500, info),	\
-+	INTEL_VGA_DEVICE(0x4571, info), \
-+	INTEL_VGA_DEVICE(0x4551, info), \
-+	INTEL_VGA_DEVICE(0x4541, info), \
-+	INTEL_VGA_DEVICE(0x4E71, info), \
-+	INTEL_VGA_DEVICE(0x4E61, info), \
-+	INTEL_VGA_DEVICE(0x4E51, info)
-+
-+/* TGL */
-+#define INTEL_TGL_12_IDS(info) \
-+	INTEL_VGA_DEVICE(0x9A49, info), \
-+	INTEL_VGA_DEVICE(0x9A40, info), \
-+	INTEL_VGA_DEVICE(0x9A59, info), \
-+	INTEL_VGA_DEVICE(0x9A60, info), \
-+	INTEL_VGA_DEVICE(0x9A68, info), \
-+	INTEL_VGA_DEVICE(0x9A70, info), \
-+	INTEL_VGA_DEVICE(0x9A78, info)
- 
- #endif /* _I915_PCIIDS_H */
-diff --git a/src/intel_module.c b/src/intel_module.c
-index a71c2e40b774..e0b94c190254 100644
---- a/src/intel_module.c
-+++ b/src/intel_module.c
-@@ -357,7 +357,7 @@ static const struct pci_id_match intel_device_match[] = {
- 	INTEL_I945GM_IDS(&intel_i945_info),
- 
- 	INTEL_G33_IDS(&intel_g33_info),
--	INTEL_PINEVIEW_IDS(&intel_g33_info),
-+	INTEL_PINEVIEW_G_IDS(&intel_g33_info),
- 
- 	INTEL_I965G_IDS(&intel_i965_info),
- 	INTEL_I965GM_IDS(&intel_i965_info),
-diff --git a/test/dri3-test.c b/test/dri3-test.c
-index 78e105a8b64a..5265a30cea1b 100644
---- a/test/dri3-test.c
-+++ b/test/dri3-test.c
-@@ -76,7 +76,7 @@ static const struct pci_id_match ids[] = {
- 	INTEL_I945GM_IDS(031),
- 
- 	INTEL_G33_IDS(033),
--	INTEL_PINEVIEW_IDS(033),
-+	INTEL_PINEVIEW_G_IDS(033),
- 
- 	INTEL_I965G_IDS(040),
- 	INTEL_I965GM_IDS(040),
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch
deleted file mode 100644
index 765d9ec090..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c2d730cf79eb3e4bea41f5ed8a8a21092ced8b03 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@gentoo.org>
-Date: Sun, 2 Feb 2020 14:18:39 +0100
-Subject: [PATCH] i810: Avoid duplicate definition of I810PatternROP
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/commit/652d93cbbdc159c0883f1b626ea48e28bac63ae3]
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/legacy/i810/i810.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/legacy/i810/i810.h b/src/legacy/i810/i810.h
-index 347188c9..19be049c 100644
---- a/src/legacy/i810/i810.h
-+++ b/src/legacy/i810/i810.h
-@@ -322,6 +322,6 @@ extern void I810InitMC(ScreenPtr pScreen);
- extern const OptionInfoRec *I810AvailableOptions(int chipid, int busid);
- 
- extern const int I810CopyROP[16];
--const int I810PatternROP[16];
-+extern const int I810PatternROP[16];
- 
- #endif /* _I810_H_ */
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 21dc8880ec..9430c3f4bb 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,13 +9,11 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRCREV = "f66d39544bb8339130c96d282a80f87ca1606caf"
+SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
-           file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
-           file://0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.20.1


