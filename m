Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD5FC7EE26
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.70163.1684081910710761650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nTWMAwqv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-643465067d1so8685496b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081910; x=1686673910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdDuhepV8745iW233k9U7cT1HQ7Mq4TzKlXaDxsqnhY=;
        b=nTWMAwqvyNvDDoGFw78WLQbmXpHJIyW96tu2qjV4OB7/GJfLBb+OFi8Wyb6R/g4Rvt
         Njucf/rAB1UTFCALzFO1KWRi2SlFrMS8p2GF+CEdlSE4oU58zwiqKyRdtin01vqtSeDK
         OeEbnv3JYlCYu2sM3ezju3Ekm009DUdXp95K0dhGzcXCalIXriPsCXF0M3915TuTSzZZ
         lTwP/SECM2k59J5Tr1TG3eKzZnTTFu3bMTEMO5nFArIIlqJsVOs0r0WugkZjj5HtR1vv
         GX02FEcXLrRWM4CTALQ71IXolXoZegvJeSj/Xiie1onBeqkdYweFHQ6+zkuGDF56HXxR
         snCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081910; x=1686673910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdDuhepV8745iW233k9U7cT1HQ7Mq4TzKlXaDxsqnhY=;
        b=f5CgiqLMGljV2ribJq4gYmkpVQTKfao/O3FLJq80vR3Lb5WiytrUJXdxdhjabin+Pc
         1B0+TTT+/zECOK6cvWPin+IIsHDMWncb+zs35oLlFIxd9JdnACFE1+//GODoqpT9tl73
         gPFhyzUohEBWCc6XpKyegCYhDUiZRa3jyVNY+vhs9L6ZUDegwO0XLXv+jQhEwFgN2C6b
         +6eLJrWeKy0uJziPkeMAQ/518MHH4OyUoDuAVRaTBkPcomVQ8vEIDSXo9izFqh1NEqTK
         CBcUvUMfB4vdoadnjHwSBbQ2ZmUrSL+7XvVjKnRB5CzXl0dAjiNrz1gce6+Ds98lYT8A
         vBZg==
X-Gm-Message-State: AC+VfDyXvmX3DHdD2LA6/xDL+hBN53M63hi/zIdFL6uG8jun7z9tXjcE
	pF3/+E5YYO7VBSo99fKpNLsSXh3ACHRKKpLs6b4=
X-Google-Smtp-Source: ACHHUZ4NPtHxCe4ahipwDmTaDdXiah5TBJOfPjaS+TvCHvjZcTqB6n6WxJNvJQvCgvkw+L03M+ff3w==
X-Received: by 2002:a05:6a00:2289:b0:625:fe95:f120 with SMTP id f9-20020a056a00228900b00625fe95f120mr43557977pfe.8.1684081909704;
        Sun, 14 May 2023 09:31:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/15] mesa: 23.0.2 -> 23.0.3
Date: Sun, 14 May 2023 06:31:27 -1000
Message-Id: <77d46f01147036c38c21d7c840144adda89bd894.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181203

From: Otavio Salvador <otavio@ossystems.com.br>

Update to 23.0.3 stable release. Release notes in:

 - https://docs.mesa3d.org/relnotes/23.0.3.html

New features

None

Bug fixes

overlay layer: unable to launch titles on steam
radv: possibly not setting state dirty bits correctly
RADV: VRS attachment not working in specific scenario
anv: zink ADL failures
Vulkan loader `vk_common_GetPhysicalDeviceFormatProperties` fails to sanitize properties bits.
Loading a model in PrusaSlicer 2.6.0-alpha5 crashes GNOME on radeonsi

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0defbb5925e309799162e221285e4cfb2e2c2ca5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index babd10a855..10efff96f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
+SRC_URI[sha256sum] = "386362a5d80df3b096636b67f340e1ce67b705b44767d5bdd11d2ed1037192d5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.2.bb b/meta/recipes-graphics/mesa/mesa_23.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.3.bb
-- 
2.34.1


