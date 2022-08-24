Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8144C38145
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:34:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.8102.1661322887453628816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=muY7hMMt;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id s206so14211430pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3/nwFDNTNYbe/TO67FbW9O5jssExbog+/GBYceNt/qA=;
        b=muY7hMMtmcZnytCz2OxyA9QG9YkG95uypFXX01na+cEItwIBBWkdNIL1tWJ5mqN+tA
         u36C4/avadpKioT1pQP+SqrCEiNjt/8njshH+W/SPSTt47C/6V6qmreXVLyrbrLmn5cp
         2Dn/JRPY7cl3yL56JZRnO4rCJpj69NUUke73JDy88rjOb2YMcVwUncjQL+PoPoHX/ytQ
         PggGI/BLQSlGfLAgoZJWOCTi0gNR2jseW4IbITCQ8oq9EifVidPATmjKCgphtqu6mouE
         Ld4c6ns1jEImCeJ5T5EI4hNyn1IiIUoySz44+8Z/JGxsnenaP4ziA1cexRL0hIXrLP9d
         cWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3/nwFDNTNYbe/TO67FbW9O5jssExbog+/GBYceNt/qA=;
        b=Ciu6qyMZ93S2xnyX3NzNGGEXmWDKpBM9zGNfEeWIu2f0/kn+Kr/8LFBorchofsE/bY
         fGlzi7ds9mFmT2y5pmik4zHo081apdxn123+/pUT0hYGF6UIbp1Bt922P523Fid/fgrw
         T1sqQTTeTSYQJKukyv++e3PUqEHo8rFIYXReztPAIEp6Qatz6uWYRzMNwIG+MmJFlB/q
         HBecaXdWvHpPbsHxejsWu7MEl62gGyzJyESJQzcbztnh8mJoytafRyLw6nSGW0xF9a5x
         ZKGTwrDJyAcK7z4iiVDzjiIM22vvHo5G7fRK1Kdmfvy4CU85K3Hzp20iljNnbxGD3t0S
         LBBg==
X-Gm-Message-State: ACgBeo3ovEMhbmlXubVSvL930cwI1/IOoIzC+cphWppW+R4WlYd4+6bT
	Yu0ywMetsthYvMOgdo/ldofJaNcsRxLRng==
X-Google-Smtp-Source: 
 AA6agR4owwI1lWk3sReTHLbtQaVObEU3oHFyD4SD0uKhlPnoXNLR2oSFTA52uNTXL2mF+P/92uDAdg==
X-Received: by 2002:a63:f49:0:b0:42a:fdfa:ed5d with SMTP id
 9-20020a630f49000000b0042afdfaed5dmr3967666pgp.297.1661322886572;
        Tue, 23 Aug 2022 23:34:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/7] watchdog: Include needed system header for function decls
Date: Tue, 23 Aug 2022 23:34:38 -0700
Message-Id: <20220824063443.1774094-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169776

These headers are needed on musl too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...guard-sys-quota.h-sys-swap.h-and-sys.patch | 37 +++++++++++++++++++
 .../watchdog/watchdog_5.16.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch b/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch
new file mode 100644
index 0000000000..8c419e1d11
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch
@@ -0,0 +1,37 @@
+From ca1d379fa13c4055d42d2ff3a647b4397768efcd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 19:23:26 -0700
+Subject: [PATCH] shutdown: Do not guard sys/quota.h sys/swap.h and
+ sys/reboot.h with __GLIBC__
+
+These headers are provided by uclibc/musl/glibc and bionic so we can
+assume they are not needed to be glibc specific includes. This also
+ensures that we get proper declaration of reboot() API
+
+Upstream-Status: Submitted [https://sourceforge.net/p/watchdog/patches/12/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shutdown.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 1d9a857..6aea0d0 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -29,13 +29,9 @@
+ #include "extern.h"
+ #include "ext2_mnt.h"
+ 
+-#if defined __GLIBC__
+ #include <sys/quota.h>
+ #include <sys/swap.h>
+ #include <sys/reboot.h>
+-#else				/* __GLIBC__ */
+-#include <linux/quota.h>
+-#endif				/* __GLIBC__ */
+ 
+ #include <unistd.h>
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 1163846ed8..26fcc10487 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://watchdog.init \
            file://wd_keepalive.init \
            file://0001-wd_keepalive.service-use-run-instead-of-var-run.patch \
+           file://0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch \
 "
 
 SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
-- 
2.37.2


