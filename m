Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DA0FA374F
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2192.1666901787311117763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YncsOGJ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id sc25so7840159ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWAnWRl6HIMRLvKLvyh+KSCWWNXHL8ICYHetcl/2uOw=;
        b=YncsOGJ0lmxMJ8u9iFscK0upWCrlUo/c3cnTtJvWaQ+EB55mpcBfc5GaCJXzmnC2uO
         TplTL/ZnWFJPce0qCv8Lg0BrIxlRr7DzPE6tY8RY8R/yhK6YtAh/wdyJw6m/nq/M50Hz
         qU0eUnZVLLT8Txb4JVSicIPxuVt5kcaDyVxbJHGrIXfT9Vonulmb1p0tjp+/hSN5QNyq
         CsvTNtixr3gBbhU877YgCzkUwkajJjYuzf70xvvQWqCsHU8BPZbPrvf+c7rgRL7CPR1T
         4q5ZqfAMy1Zpva/DPAww0CaKzbdPkK9AovXZDoYmI8u29xgcwePJ7mSZxZHhtbR0kdjk
         VJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWAnWRl6HIMRLvKLvyh+KSCWWNXHL8ICYHetcl/2uOw=;
        b=eskcXzQ8HD0xrqbiNnIsrEcZJgAsiUCUEy2oBnF1nELaxBe59PdJyBPu3InmzqZI0x
         dDgH2irWHYBEyRqCIQVepHbXvF9BzlqxSx1urOwmrkHzrVMYrOaiDKF0DSQoEDcQfcTf
         GMTP8VumGd9zIbV2sqpVrscF7dY1Z+Sxemc4JcFgh1URuYDMHW7Vj4oLuF3WE6LwO8aF
         SssFk8icd0+JIZ0Gr5Nk8ll1nkIfGn7y4Jm03DrjLN5CizmKzO5qDeLtzUeTcLgslIJ0
         Z9ZRtd4/Bavpr3iMR1OuYchw2/bHZwv9f7mJ39FPqZxitMur/CFpPotx/ezM1gMNEb1/
         0/gw==
X-Gm-Message-State: ACrzQf1r8GLYmkoE2DjBJj6gq9QUFk+WHhOnqwMAAT7rV8k66Rn0syUv
	qh2ytTYYc9DRU8/LejXfxLM/gZ/evoahMg==
X-Google-Smtp-Source: AMsMyM5fPCtEpQWd5aYQDNiMy+5A5I3yheOAWvqqVauhzikBcrR2X2FWzPuVOrItbo5YDir2KvJ2tA==
X-Received: by 2002:a17:907:2bcf:b0:79d:e8e6:d579 with SMTP id gv15-20020a1709072bcf00b0079de8e6d579mr28354156ejc.563.1666901789467;
        Thu, 27 Oct 2022 13:16:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/23] wayland-utils: update 1.0.0 -> 1.1.0
Date: Thu, 27 Oct 2022 22:15:57 +0200
Message-Id: <20221027201611.3644334-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172212

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ayland-info-Fix-build-without-libdrm.patch | 42 +++++++++++++++++++
 ...-utils_1.0.0.bb => wayland-utils_1.1.0.bb} |  5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
 rename meta/recipes-graphics/wayland/{wayland-utils_1.0.0.bb => wayland-utils_1.1.0.bb} (69%)

diff --git a/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch b/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
new file mode 100644
index 0000000000..86c44d4480
--- /dev/null
+++ b/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
@@ -0,0 +1,42 @@
+From c79a3fb51718c4286b74edf0f758df9219994844 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 14 Sep 2022 09:07:10 +0200
+Subject: [PATCH] wayland-info: Fix build without libdrm
+
+wayland-info can optionally use libdrm to provide a description of the
+dmabuf format modifiers.
+
+When not using libdrm however, the build fails because "dev_t" is not
+defined.
+
+The definition of "dev_t" comes from <sys/types.h> which is included
+from <libdrm.h>, which is not included without libdrm support, hence the
+build failure.
+
+Simply include <sys/types.h> unconditionally to make sure "dev_t" is
+defined regardless of libdrm support, to fix the build failure.
+
+Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
+Reviewed-by: Simon Ser <contact@emersion.fr>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/wayland-utils/-/commit/baa65ba9f62e6a05c32b9202b524158a21f24245]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ wayland-info/wayland-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
+index 53cd04b..98ff205 100644
+--- a/wayland-info/wayland-info.c
++++ b/wayland-info/wayland-info.c
+@@ -34,6 +34,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
+ 
+ #include <wayland-client.h>
+ #if HAVE_HUMAN_FORMAT_MODIFIER
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
similarity index 69%
rename from meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb
rename to meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
index 4c51f7e8c5..dcee87e2cd 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
@@ -9,9 +9,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+           file://0001-wayland-info-Fix-build-without-libdrm.patch \
            "
-SRC_URI[sha256sum] = "64fecc4c58e87ae9b302901abe10c2e8af69c7503c221a96ecd0700e0aa268c0"
+SRC_URI[sha256sum] = "9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.30.2


