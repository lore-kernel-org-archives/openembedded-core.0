Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B37CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:25 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.32777.1654526355860694684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6PycklRZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso11890177pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DZkz7CQ35cq8oCmx24tkPVg9f7l7++xUpla3HiCQNPw=;
        b=6PycklRZLh56N/FJxEKZ5S95nCJxmz0FiNQN4vCuhw8stYzDOh/BAjEFp0CsFtG0Yb
         2yUHt2sAJRgkVVYwdUXviR/zzi5prZpn+hM9B0//2HGxEt5aWuloCQ82mAyZ401SKdjK
         Fau06g9JUk1n3ikAdBsWT6RTWd4JCLwMZuN9ol6fYLhahhJzXMdyq/LeiHIUS26MqB9L
         C74FYMlsugRB758S5TbTxhQp9yvD0MQLJWKQC+0lFV0O0npNXi9PIJdcq++zSLsykl8P
         VbZovs1vGyto6WySzbEFwEaDTfkal21lKE4sYpmhrb4MicuZljxjQBAjboZFEdRiLook
         r18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZkz7CQ35cq8oCmx24tkPVg9f7l7++xUpla3HiCQNPw=;
        b=hMPNZRjgcYpYTK29GofvsqGgHldq29KesrlEaOAyZjrjV/NNi+MpEhXJrgyNwMvzCq
         XEGeB0H80cQnfUxyjMy+ZgVrAc+nWOfILmnERSRQ6b8DRnF9pjdyAA+lvq7+i3VBwBAg
         c6KcZecZ6XjqwGgznettkSrVmS8qjk0h0MT8qH9zoklYQK6PUtnfVFwsXWT69+CJw+Ty
         BjNsoVmeakvi8UKmp5rUbGOfrtYegtEnmIuLINYcy85kkg9wPum0+TeznUTlhTqMGfUY
         466jn3DL/b/Cp7PTnXsx8WwJXS6IIMhI6o/NpSLhliQgFskZIBj1FWLbS4mlGZCMASnV
         dwHA==
X-Gm-Message-State: AOAM530JTxVHJ7D7R1uTYDTo0mdLS1xuLfRpi1qXsVMCGGabdkN21jV1
	R0afp386dGKZfS3mWbx/+PlMhZL+D1eB/iEq
X-Google-Smtp-Source: 
 ABdhPJyuxEZBvCloRM67LMtH+BvaPjupP4h+T7R4ztx4AQg37oIWYrHb9T3zG+Cth+r+lfmve3PG7Q==
X-Received: by 2002:a17:902:ef8f:b0:163:d61b:ec98 with SMTP id
 iz15-20020a170902ef8f00b00163d61bec98mr24662236plb.111.1654526354713;
        Mon, 06 Jun 2022 07:39:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] valgrind: submit arm patches upstream
Date: Mon,  6 Jun 2022 04:38:28 -1000
Message-Id: 
 <70ce538164480d739bbee88d6065d6c7e8ed01fb.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166643

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 118a68bbe8c87eac77e87db409ce419749b211bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 2 +-
 .../avoid-neon-for-targets-which-don-t-support-it.patch         | 2 +-
 .../use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index 9f1da7bac6..073713c139 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -10,7 +10,7 @@ implementation.
 Fixes
 | cc1: warning: switch -mcpu=cortex-a8 conflicts with -march=armv7ve switch
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 5fcfec0015..82b8344279 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -8,7 +8,7 @@ test 64-bit float copies when building for ARM. Allow it to do so if
 possible, but fallback to C when building for ARM targets which don't
 support neon.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index adea405213..f15d04b173 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -15,7 +15,7 @@ over-ride that).
 
 See similar cases in none/tests/arm/Makefile.am
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
-- 
2.25.1


