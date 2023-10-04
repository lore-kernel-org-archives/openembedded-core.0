Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E07DE7C4ED
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 19:15:29 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.3662.1696446919260402200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 12:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZIHjLCjS;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-79fa7e33573so8770839f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696446918; x=1697051718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vjEpY08FOGeEE/u4vdOB9wRBKdhCfvk78OMl2dp7Ts=;
        b=ZIHjLCjSVhTj1aQwxo1rh+r91QAxocvWI2ZmdqQDugygKAF5j0QFe4qzri2t8MXHm5
         9DSBcyozdRc5MNVen/32yoItBDsBGXYoLptDHz2fziv3A+qI9lXNZv3O6KJawCid1YIZ
         r6NMxYSFOhmAgrP4tRJzKY56/+V6iwf3ezIrAQE9uPIjRdu6i4rGBjsI+IEEDWOVGlPx
         IxS+VG+rAaiBB1o7MD5PqE4XznPWrMv67zHs4lAkna2Xb9WtiIgVFhz5cjTNR1L/Vo2T
         i+FRBx/CdDLz/gDj0UlNCXgXbFxxEPbmzOHkgYrxwCPrlbQ7nrIGJcMxk/b3oJcaagQO
         pMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696446918; x=1697051718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vjEpY08FOGeEE/u4vdOB9wRBKdhCfvk78OMl2dp7Ts=;
        b=V92GTiB4T7V6d7NxIR9klpjloezF+RkjVKX4ejV4uhKhh+eqIV3YcSlmzjLe1W6yq1
         snpUXqjt+8NkzyiPs3/jp4XEjigIJGf4ODLFUZzpKQI+5eLOPvglzb6B5H6MSQRbc6pF
         wgw2ZIbZE7pRt5vGV5QQlme07ZFnJPMjUbcpzSRkObOdGspvd9LhQg+OfnB1m/KzPnEg
         4pU/dqXrJg2vrKljXl/Ywakm7lWdW8ly3UvYbbDDC1qgdKMMlfPZsQ2DRTdK+eT6AEKz
         7Up8dZwsl0/M8FMLlquIhIxvXkL/MRLmsE4Hiy0TfIjgd2ztRhnMQTYs+at5KSO7rvNZ
         f9KA==
X-Gm-Message-State: AOJu0YyU5p3jWhcbtpCmcsjhdQLTp810tn5ShdbtLnki0HoS/MVGGP8U
	JwfI6frUH4ShPXzqhy6GvCztQp5o6bvcRQ==
X-Google-Smtp-Source: AGHT+IFuuM2hPdZ/v1I0F/TGkhwh5JVOw/F0Utytf1r0bA9VjsFgBVr7MMEcF4FEwRHrcdT5ibHxLQ==
X-Received: by 2002:a6b:7943:0:b0:787:4f3c:730d with SMTP id j3-20020a6b7943000000b007874f3c730dmr3488642iop.18.1696446918277;
        Wed, 04 Oct 2023 12:15:18 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id c17-20020a5ea911000000b007836c7e8dccsm1097177iod.17.2023.10.04.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:15:17 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] meson: upgrade 1.2.1 -> 1.2.2
Date: Wed,  4 Oct 2023 13:14:45 -0600
Message-ID: <20231004191445.409831-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 19:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188697

From: Daniel McGregor <daniel.mcgregor@vecima.com>

The newly released version 1.2.2 adds version 17 to CMake LLVM
detection, so we will now choose the OE provided LLVM version
instead of the one on host during native builds.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/meson/{meson_1.2.1.bb => meson_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.2.1.bb => meson_1.2.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.2.1.bb b/meta/recipes-devtools/meson/meson_1.2.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.2.1.bb
rename to meta/recipes-devtools/meson/meson_1.2.2.bb
index fe452662029..6a07168ee1b 100644
--- a/meta/recipes-devtools/meson/meson_1.2.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.2.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "b1db3a153087549497ee52b1c938d2134e0338214fe14f7efd16fecd57b639f5"
+SRC_URI[sha256sum] = "4a0f04de331fbc7af3b802a844fc8838f4ccd1ded1e792ba4f8f2faf8c5fe4d6"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.41.0


