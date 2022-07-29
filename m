Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB9FC19F29
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:48 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.51.1659106062915818719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=78BQC0do;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s206so4200786pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+i65IEH76QQ/dTksYCF4PjdKpWtdPtoPLfxrUz6dV/k=;
        b=78BQC0doY7NaSoOPAqAUeElcf6/FH9yM/KJtBrrGiNJiTkSxMH5d/Vkvm5gKRR9Us9
         Weyryy2RlQMALtBXPDbu2Tyy0SK7OCYYOsUmiEzNTnV2n54QAJNjvJDyLVYBXTltI9tk
         1DnWznNxwhcyL/CLpJP52AcVxV75/fbJYpsapiJLJMGNof7gIeT4YFaOV+nk9tQYMQjy
         aiHDlVzQodxTvxRNiF2/Bv00Wp7qydkb9FwijiNPlD9ThxjWWWxqL/zjwQYvRuBIsHWq
         ld6fq1rWsj3oVExNH2t1p2PlA988wrd+PKX5IWFdWSQcMSYa+7Rv48PPAiRY4L/Ysm4F
         fJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+i65IEH76QQ/dTksYCF4PjdKpWtdPtoPLfxrUz6dV/k=;
        b=5rcWROoVCALpZvDUxkLddgZX8jZcUvM7hkBF6RfaiDGIOSFHTTYujzTAE//OVCHs29
         M0QTIqkSnh3DUCnBV+n706dps7KWXTz1QKFyHIXx/RhMsIznZ0OTqSm5EbbV5NLHcyXe
         tLxPusaZ8xWcZ9wlngi7ym9GnFlGyzFMjEqeWg0Qnk2+EsGx3W5X8aAy40EWIpezFHSM
         jxZyrk9HfCZnMQM00oAchvKP+e9T67/H6oUD08niUM2dVNAhd+q/hhNZCQtSwtcZYov3
         UghLk6r5jvBC4zYAbs8AGLH0DrBudPhDIJ4bb5udJfzKSv+/VAPSLxlPGXwCNtnfesqq
         8izg==
X-Gm-Message-State: AJIora+iGL7JmmfsYJLQ4Bz+Qt9b+yj0oybMtIua+laxVhLFyOC4ppVI
	GKJ3DfVkEqF8ZXy5UBL/NvUNt8QMMdOM1S9J
X-Google-Smtp-Source: 
 AGRyM1vrXVZvfWS4JrwT9hnJFcKlDbYY3pEyHYmgddfcqmiLk70RH92bltocAz1+UcHq21jZAkjZRg==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id
 g4-20020a656cc4000000b0041235fa5bcemr3182511pgw.466.1659106061774;
        Fri, 29 Jul 2022 07:47:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/29] xf86-input-synaptics: update 1.9.1 ->
 1.9.2
Date: Fri, 29 Jul 2022 04:46:24 -1000
Message-Id: 
 <d083da164ddd8ebe73db5b97e4e4b8b7078ba21a.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168643

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

Convert remaining source files from ISO-8859-1 to UTF-8
gitlab CI: add a basic build test
Fix spelling/wording issues
Build xz tarballs instead of bzip2
synclient: allow negative/large values for AreaLeftEdge etc.
eventcomm: fix compile with pre-time64 kernels
eventcomm: use 64-bit time safe accessors instead of timeval directly
Use fabs() instead of abs() on double values.
Update configure.ac bug URL for gitlab migration
Update README for gitlab migration

Drop 64bit_time_t_support.patch as issue fixed upstream:
https://github.com/freedesktop/xorg-xf86-input-synaptics/commit/073b1b40bde9935928758c3452176c0d8dc67370

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d4d2c176cf33ced4d7d5c20178066abe1e9c4d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../64bit_time_t_support.patch                | 51 -------------------
 ...1.9.1.bb => xf86-input-synaptics_1.9.2.bb} |  7 ++-
 2 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.1.bb => xf86-input-synaptics_1.9.2.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
deleted file mode 100644
index 4bb7fb3e23..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-This patch avoids using time field of input_event structure which is not available
-on 32bit arches supporting 64bit time_t structs, Patch makes it compatible with new
-and keeps old input.h implementation functional as well.
-
-See https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/eventcomm.c
-+++ b/src/eventcomm.c
-@@ -575,10 +575,12 @@ SynapticsReadEvent(InputInfoPtr pInfo, s
-         ev->type = EV_SYN;
-         ev->code = SYN_REPORT;
-         ev->value = 0;
--        ev->time = last_event_time;
--    } else if (ev->type == EV_SYN)
--        last_event_time = ev->time;
--
-+	ev->input_event_sec = last_event_time.tv_sec;
-+	ev->input_event_usec = last_event_time.tv_usec;
-+    } else if (ev->type == EV_SYN) {
-+        last_event_time.tv_sec = ev->input_event_sec;
-+        last_event_time.tv_usec = ev->input_event_usec;
-+    }
-     return TRUE;
- }
- 
-@@ -725,7 +727,7 @@ EventReadHwState(InputInfoPtr pInfo,
-             case SYN_REPORT:
-                 hw->numFingers = count_fingers(pInfo, comm);
-                 if (proto_data->have_monotonic_clock)
--                    hw->millis = 1000 * ev.time.tv_sec + ev.time.tv_usec / 1000;
-+                    hw->millis = 1000 * ev.input_event_sec + ev.input_event_usec / 1000;
-                 else
-                     hw->millis = GetTimeInMillis();
-                 SynapticsCopyHwState(hwRet, hw);
---- a/src/eventcomm.h
-+++ b/src/eventcomm.h
-@@ -34,6 +34,11 @@
- #include <xf86Xinput.h>
- #include "synproto.h"
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- /* for auto-dev: */
- #define DEV_INPUT_EVENT "/dev/input"
- #define EVENT_DEV_NAME "event"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb
index 388350c96e..8e446290b2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb
@@ -10,9 +10,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI += "file://64bit_time_t_support.patch"
-
-SRC_URI[md5sum] = "cfb79d3c975151f9bbf30b727c260cb9"
-SRC_URI[sha256sum] = "7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576"
+SRC_URI[sha256sum] = "b8fa4aab913fc63754bbd6439e020658c412743a055201ddf212760593962c38"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
+
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.25.1


