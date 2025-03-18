Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007E5C28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.2884.1742323145308741322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CpCKLVzn;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so6638816a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323144; x=1742927944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=CpCKLVzn+36T2CvN0kHUFMxb8D+X5q4guUHF5U4h493zPHwWe12wUPjNfeBZ7YTAj0
         dk3a5EXevny7jhklERcP+ChYJX02cDeBIQmMKepn6zs9SRXj0nvjVgmewI5GFX5eAJ0h
         zloP/4U6U7ura4gkcSva8GMENe9yCewcyEF6hONGkQyqw1JL2d/zmQ+KwUXE67g5HHby
         DfnIWo+e9fbSQUleG2qwlhpDFTrB2YX09dsekDZXUIUKIDAroqAVM22voFzhUcMNhSB4
         WUAu1PiRZkg3bJIsCvRFhrIXwcunOKviD5oLFw7ZLhaRBSLQaK6okx4nbqolMsXE2qff
         QkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323144; x=1742927944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=r26cQLadGkVsvuKU/c2ZywpgE9nbCdSDX5OOLp4hAbu50vuDG0QYHq9gvkaCxe8nsk
         xEWySMTpqX1j+Lrpy29VNQwf4fRz4T/adkjf4KVPhyFTV1zW2mo1T6/Wc8MHoC4krTHn
         lBZ67VWRWlkse8k5nRiXW/P+PtSF1G/IzYFVemstEUjMo3Z4EEY2+ixy5IZKA8tLIMo+
         yw3V2DOYtShDH8S1vMoBjyRyeBVWHbCCfgkOxqGv+jHeYmbsVGOGLZNmGdhRi4n6LMiF
         x2hs4gnJwWQqaXy8ROdlmgl/BL4RT60tzW0PMKuTJI2fEjlDCmLVMqKAvX+/OJJfegpD
         sN2Q==
X-Gm-Message-State: AOJu0Yz/hCiZZy8UMURwROU5764/B+VEzE4uqMN5+Ks2Fx31TdiowzCm
	ENytFJquqJGWT9zWu6WHGLA+sU3/xNKXqcViVEXER/RxV8bHZ7wD0KMTCbiP
X-Gm-Gg: ASbGnctyO2zhNkakQTM2zXvwzEZJALXAdVNHqultLn+xNVvtdPv9wxKOcRGZQO4R4Lm
	Mk5bDo5fRwsJ31h6j1kjhhrBAgY7S8GoBkS9ZrFMsZglke5YfCqODULvFo6aXqgWiC3l8l40IRw
	FCyxHg0gXA9//wzGrW/z4XC9NGh4gcaLnXQynzTOipEqkfMdDqjjn3GJg/NrWEFep9w/2Qy6O/o
	snxG8GK51tUbk+ueDcFqcfFcyHQKiRTwV+SvkBcyH5OjpoUa9VIw74KLyfVq9IPrSEFH1apS8dK
	Fj5kj5GJrIgEQxL2drtj8a2eOvGDFJLFJ/Ms
X-Google-Smtp-Source: AGHT+IFIj0YCUrXyD7ZnTxEXQd7uOqskCCpleecr6HBSblxVTtRumEM3vFIsGFdu712HhrtnpTzyWQ==
X-Received: by 2002:a17:90b:388d:b0:2fa:9c9:20a3 with SMTP id 98e67ed59e1d1-301a5d30a35mr5036382a91.0.1742323144468;
        Tue, 18 Mar 2025 11:39:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 24/25] time: Fix build with musl
Date: Tue, 18 Mar 2025 11:38:39 -0700
Message-ID: <20250318183842.2256284-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213250

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-the-type-for-sighandler_t.patch  | 27 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch

diff --git a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
new file mode 100644
index 00000000000..0f8bf6e03e0
--- /dev/null
+++ b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
@@ -0,0 +1,27 @@
+From cfef684e2c2c93c4a871d6c2a7af8f4c1b7c6741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Mar 2025 09:29:58 -0700
+Subject: [PATCH] Fix the type for sighandler_t
+
+__sighandler_t is private interface in glibc so its
+better to not use it, as an aside fixes build with musl
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-03/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7ff29a4..82eb66a 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -728,7 +728,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  __sighandler_t interrupt_signal, quit_signal;
++  sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d9e2d06b32d..366a64d8e5d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -16,6 +16,7 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
            file://time-1.9-Fix-compiling-with-GCC15.patch \
+           file://0001-Fix-the-type-for-sighandler_t.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

