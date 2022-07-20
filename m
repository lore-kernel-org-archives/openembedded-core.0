Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAB5CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.51642.1658306701623392478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WkdLgMT/;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id j22so31835011ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vi2lzgG0sk7O5ssPGH7E9ruWwAcH5Ve6Gc8r6wQcG78=;
        b=WkdLgMT/pzBl3tyKInhNUBK1aXtqFKsgH2E4LTkizntYyUabH1xErL9te2+U1vmvwV
         2CelIwkQfTnkVAvvshXMNlS3pUmPeLFrmWQCzKq38ZQfXdFn0zBjrwyf59mIDYKKDLxJ
         bASv6F0JQocg6OeyQjU0uyTBD5kiTJ/uVYs3MGAkDggnkYezMOlsar6uyJ97eAoj4BIw
         UcoflWjlrc1hX2PJvPWYk23S3WxE9Z/cwMo7f6ZVkBne1xZJmE70lbB5fpy/hjbvm8vd
         FPxSwcVHPFf3DaNV/l6K4emCr1Y4viiUZjlUUojGqdnLFe3HyO03LjAm15runYC/vZO8
         kA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vi2lzgG0sk7O5ssPGH7E9ruWwAcH5Ve6Gc8r6wQcG78=;
        b=V1RbUmsRH2UxuCLV5z9/84s5NbNTr4in6KEED7b8JXa190fiFrozFj9/mIci4rEu7B
         OzWxcJFHkDbUSGz0sWZZeyx+iHAbO3RVnuZgtrWCGMb3fGRpIkWZsk1E6C0U4V4ccTPr
         cjt40YkDE7fyJD4y0EdDG2EPl+WXxny7BFzlqMvxKdGqRTqGcHCgdBWUVdxEEOYmuwAU
         y+z3XlGNH53IufBiCZqdrStNpjJ7TPhhn+C0Z7ooFmjHHCQ9/MY2vEXxUEwcLEaSL61j
         cBWxJeGNhM/TRMQDffmhdwBwwkIxzqw21wNf/9Tv0BlDqp4dKwjav+0Fsdd9KPp6BP6S
         IJKw==
X-Gm-Message-State: AJIora+gaU+5JDeyZ1dvjGt1sKh5Q0E+mi7Yxk1BH6LIU4p8umkoP/8a
	CDwDtoqbbVaz5ut0hs8Xbiwb6FJ4GGw=
X-Google-Smtp-Source: 
 AGRyM1ttcxqOcrSf2M3MhhYHXoe/yLi1SPnsImYW47WTfUa81V+vrnEW09Xwg2TGfzQHhxewSA189w==
X-Received: by 2002:a17:907:3e8c:b0:72b:4f2d:782b with SMTP id
 hs12-20020a1709073e8c00b0072b4f2d782bmr33382886ejc.223.1658306700140;
        Wed, 20 Jul 2022 01:45:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/51] xf86-input-synaptics: update 1.9.1 -> 1.9.2
Date: Wed, 20 Jul 2022 10:44:02 +0200
Message-Id: <20220720084442.2940187-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168305

Drop 64bit_time_t_support.patch as issue fixed upstream:
https://github.com/freedesktop/xorg-xf86-input-synaptics/commit/073b1b40bde9935928758c3452176c0d8dc67370

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


