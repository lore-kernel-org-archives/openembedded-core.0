Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1C1FB5177
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:29:34 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67163.1775514570433341716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RcCovHip;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: festevam@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so11023485eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775514569; x=1776119369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NlqRAjq1BBvsIAjAaNpsqlWNoPVHtvsVGzAEIS6YZ9s=;
        b=RcCovHipFGacf7DWpsZbU/BeSyo0gH3yC5uqgSGFb52PceB8IHfKJZ6jZCMbJsv2pE
         0SbAUHmI56pe8TZWfM73Lr0XZOlrpRJna7NgHNwTzpWm5EnW6dlZjHkInmd5ALBJ1Mck
         BuxVVjKnVk4uZf6lmxgaMofX8snM5AvKBvrJieyTH0Mwq5/VTBHC52N9Z37x5Sd/SGsQ
         eiH0jwRzkZ+sXHemUU6MYLBvUL0TJjnpUUJ8nt6e6ialJ5vug8kmdyufgq4yHdDZWo3H
         j3fPcZqAwrs/UHJLK353jB5wdWX2XbUhTjuMv5hrf3oA5c4GM6Vv/SQ+OmK5vIffZE2e
         qwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775514569; x=1776119369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlqRAjq1BBvsIAjAaNpsqlWNoPVHtvsVGzAEIS6YZ9s=;
        b=a/5otgRwh4+CnRet/9MKEevGe/n+PAdhBfXulV3uF3t4GRCLZ5ZbEe4JkpQfcJiB0z
         KsBHAJrbruedHJkCelkZx1PyffEaga1iSGcYXVTv14bDGeanzqUPa7ufZjaqa3C1pvKA
         GaYylhYQ82lvTfBucCcYNFdjauGnFBZzJKEB+hsKEl59aom8sWONe7J63K8fMSaedqDi
         9vfPEF6C+SB1t75pB1zBbSiNpytUm1FGryxG7E/dd7U0wcc15uP0m28lRFbFvNoTtibY
         ta4m7FYPVoSLkgr/1bjbP0JGZIYRYlwRkBmZxRAQnedej8GpbzeGjkE4reV/AkwZasso
         AyHA==
X-Gm-Message-State: AOJu0Yygf48pzbit3KV2NrkWZGM9JDp6AfxR4F1WKDe/ld0bQur3rbIT
	S4D8Unqgxm9A1dNq68U0KQLdxfbrtgJoaGDZkZmFKEpvRyw1n1KZYdmVlra3Tw==
X-Gm-Gg: AeBDiesfKDZpqZerhTTSO38avbCtZOqPeO+ZzY0Z30PWf44oIgb+F5MrmA5ZMsKu2i+
	RurZR9MHJosPut/CqLFVI+XRReRU9DuGWTM0GBkjVnOoC43I46i0P7qHTz88dB1PM//p5bBZQly
	qOe+MH/5N6DPuJD5AhXna0oW5JrCKQe9A3e4rQ+g8FAn7qGCgzrF5RrcMea4/jV6SEIA25o5Qgw
	x79D3DYHLS3ElIA5FNcc3dHAi9lMZsGMnhdFRp3Nah+RZnxD1zacHocM+Y2ra+7W0lmXQN5ojUW
	b5BcXl10CMxfazVYzfxDPZnvqxPQ4lJ5KDSCSPZ6vin9tPKOLOB4ZXbhsk/ULHpDdJTp3CxLEzb
	r4p/LTo1MYHyirv0OV3cpK1Sup+kZxi4Z3hciuPBaYZHE+2ajZKzlHUw3qAgjzYLoNHBW5Yly8n
	x2CbJHZAveC98Jq6oJCidCSFAa/x70V1rPeYR3jIqjroptX7hEx5xj6btnxo6WeJL4NUSq
X-Received: by 2002:a05:7300:fd09:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2cbfc55b4d9mr6796554eec.25.1775514569039;
        Mon, 06 Apr 2026 15:29:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:fafb:8e1b:d8cc:3e41:f5b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm13577960eec.5.2026.04.06.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:29:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: upgrade 2026.01 -> 2026.04
Date: Mon,  6 Apr 2026 19:29:06 -0300
Message-ID: <20260406222906.7171-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234694

Upgrade to U-Boot 2026.04.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2026.01.bb => u-boot-tools_2026.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2026.01.bb => u-boot_2026.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2026.01.bb => u-boot-tools_2026.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2026.01.bb => u-boot_2026.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5e2ec08c30..574768b9f8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
+SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.04.bb
-- 
2.43.0


