Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C10C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 11:57:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.105785.1692014216079939866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 04:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CkJHQVEs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so38178375e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692014214; x=1692619014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=akbWI3bssFReKsjCEXayJrfslwizd9C5PFUztFC0sbo=;
        b=CkJHQVEsbKCtSjhnmEwGMYasLlHxzouUjui6o2P6U9VSfk+AP0uvkMPV1oBHC/TuUV
         qEoeVQYrtRGOrG+QIX70OyADzm/yZFM8vb+1L5FGr8IwRvXn2uy4/u9qb7mJVPU++A++
         8Qr+wfCrKbbnRNuUji5Yn4Hch5yJyuKoCrNjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692014214; x=1692619014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akbWI3bssFReKsjCEXayJrfslwizd9C5PFUztFC0sbo=;
        b=idp7YiJ+NuXrZEhrYG7wuvInFPgWHA8gA1Igj46AtHwHFGdKMTq+1pyqPBGHbhGeH9
         eAvqYFIEKm1HVEl+nVevgLGS1wap9AXA7f9MrwapH6c5Eytaehbklc5Qa1IPjexmYcj8
         aQ1zdalfQ6U8nYGrFK4YDuSoPQAU3aIlC4eBFCm7Zj9arZX/27jfAk+yaF/EP8Vci2Iz
         eJuv6jW3tQMGQrP/mryycyTn68jBYcI6zMDAarCz7qG0W2CvLelQhdsF3Bt9vbH+inQs
         8rYvnVc8OYmFH15nf9owLH2+X9jamQ2zZekjhu2CEwotGYopLpPUORZ20yQMcp3A5SAf
         ieZg==
X-Gm-Message-State: AOJu0YzIxBkOjEQ6l38xLBNq5JyqeJZdtZpVHj1NgcKIjoHXh6UD6Ud2
	A7KBCrohrYx3UoxMXZirmya/+F5GCujERuUGKRs=
X-Google-Smtp-Source: AGHT+IFKyEi/rqBcXAHDnCvFUBWKXeejAiC9ehOZY4zrnqQyCA4l9r+MPvYRHqVQ+YTzPoq1WOe3eg==
X-Received: by 2002:a7b:c4d0:0:b0:3fd:3006:410b with SMTP id g16-20020a7bc4d0000000b003fd3006410bmr7233438wmk.34.1692014213965;
        Mon, 14 Aug 2023 04:56:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id k5-20020a7bc405000000b003fbdbd0a7desm16947274wmi.27.2023.08.14.04.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:56:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 8.0.3 -> 8.0.4
Date: Mon, 14 Aug 2023 12:56:52 +0100
Message-Id: <20230814115652.294438-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 11:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185934

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_8.0.3.bb => qemu-native_8.0.4.bb}         | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_8.0.3.bb => qemu_8.0.4.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.0.3.bb => qemu-native_8.0.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_8.0.3.bb => qemu_8.0.4.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb b/meta/recipes-devtools/qemu/qemu-native_8.0.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.0.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.0.4.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index eaabc0e7066..ea02bf0c73d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,7 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09"
+SRC_URI[sha256sum] = "81c817dda38af958be5bef1a6cf55b658bb2d3fb87c1e6a571de6b7b2c44516c"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-devtools/qemu/qemu_8.0.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.0.3.bb
rename to meta/recipes-devtools/qemu/qemu_8.0.4.bb
-- 
2.39.2


