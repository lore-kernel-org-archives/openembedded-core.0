Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853ABC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.66627.1638882441166997586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CPQTXFvv;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d9so29366101wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AbidH0h3Nkw6SxJ5bicXDQIssUtOlMlCNTR34v62RU4=;
        b=CPQTXFvv3e408Q6YQc+N8+YelHpDNZHIh/QSqa9DtCPXhouGSJcUjR58WQ0fHVoje1
         bAcvYZ8BCyENH1aSEAEtZag1B3I0PI1/BPAg64Ur4c7Kqx9IlvqCZEEGho/QPi54VWNy
         vK0zTLvatCGsF900Jy65Gi9AbQzJ6ndxl4MPNbEC+8BrYepeXYWdYcErTnWhBg/O9hoL
         tSYrxMu9NWDtA33lM/+2DQFCl4DM66xvDGvjWgPz9qH0bV0E5L1vO4dAhrNisRHxY3oM
         gAZtCsNiMK+Am191uuv9oiZPhLpwrGY1vQ3gJ58yPnXvA10WvVYksJ1X+JNNKWOHXSJw
         U7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AbidH0h3Nkw6SxJ5bicXDQIssUtOlMlCNTR34v62RU4=;
        b=5CniJJUtIMLb4y2aZG5AoDpC1VkpjEz0lxht0/cFUgcfXq6tCcOnmO9L4Mubx02oo/
         wnUy3V6PWCqU8Qd5cUFSzMhWifyOADi/fFMLqudzZRos5H2slAKWY3dB8kEAxYndaQ0x
         sUZP0Gd4npzrW+2Nzua+irNRWZSss3XtTf2GNB2y05m8vOY3Hj0ACO2TU7IkU8bYWPjc
         WUDndthpuWjGipWEkdnX/UKdVmEHEPXyvlzXi8JpIv6or+1ua3apDaBbrUpQCjPdc/ve
         sPxn5sTX7FIcJDoEbKEev78lLjlMAfy0IIbMgJ0q+2cxK7/oRlHo8mj4fFn5rGldldSJ
         J+jw==
X-Gm-Message-State: AOAM533DBsU4r9VDg0RiWHaQOtAeupEURwR6BR22/LESanyCtX1b3kAL
	Fh6fkUK9QrFyW31DnGfphY90dpPQKVlwtg==
X-Google-Smtp-Source: 
 ABdhPJwRmT/tGNcvHhfaQpG7ME+3n7R2voNf+QWPPU1hjYVndcrWR/w9aOrE/v/LCYy9mxlYsUmt4w==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr52056551wrq.364.1638882439789;
        Tue, 07 Dec 2021 05:07:19 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/16] libunwind: update 1.6.0 -> 1.6.2
Date: Tue,  7 Dec 2021 14:07:03 +0100
Message-Id: <20211207130703.3196805-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159301

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libunwind/libunwind/musl-header-conflict.patch            | 4 ++--
 .../libunwind/{libunwind_1.6.0.bb => libunwind_1.6.2.bb}      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libunwind/{libunwind_1.6.0.bb => libunwind_1.6.2.bb} (91%)

diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
index 63b78a8a30..49985b5b3c 100644
--- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
+++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
@@ -1,4 +1,4 @@
-From 49b21f0fe5fb93b30b94cc449429fd33de0652a7 Mon Sep 17 00:00:00 2001
+From e1de5a5b42062dc02769f320c7785928b2ee0c57 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 18 Aug 2016 14:46:32 +0100
 Subject: [PATCH] If you:
@@ -28,7 +28,7 @@ Upstream-Status: Inappropriate [really need to fix gcc]
  1 file changed, 4 insertions(+)
 
 diff --git a/include/unwind.h b/include/unwind.h
-index 7cf128d..31c2871 100644
+index 93780fa..c812414 100644
 --- a/include/unwind.h
 +++ b/include/unwind.h
 @@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.0.bb b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
similarity index 91%
rename from meta/recipes-support/libunwind/libunwind_1.6.0.bb
rename to meta/recipes-support/libunwind/libunwind_1.6.2.bb
index 91189fdb71..716be9a452 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            "
 SRC_URI:append:libc-musl = " file://musl-header-conflict.patch"
 
-SRC_URI[sha256sum] = "7194c20dda841b26917c0579e6467b53f7ad2e3f9452e5c77f3c3829c4656b70"
+SRC_URI[sha256sum] = "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976"
 
 EXTRA_OECONF:append:libc-musl = " --disable-documentation --disable-tests --enable-static"
 
-- 
2.20.1


