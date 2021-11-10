Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12524C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.340.1636573188403829574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T+BadAzf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id s13so5919799wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Q6EuvAcLp3RBO8JhzdPrvrcSpXx23VISrpng8aV2FY=;
        b=T+BadAzfVHTm2R/80nc78H+XsoXCs0+tu2ofPBBSLX4MU2tXvm22aE1vcSVeDrpuHa
         npj/20lKJi9xn2ZnWjozhlmT+ZK/Gb60C5nR6Xe+ju3Fk0AwQotmKI95X3piPUpUBMqN
         23HvNiSMsAs2th1KTlJtHemMrnRIWbnexl56+8DTRwVfb0dJEfpEVKEn1AwbpGGO6SiZ
         SEnXk9gaLEX1OLJ7vx+PCSxRIvgiO/ziPeSXmop0vQAnlSAB2LSzcfUwQkIZrKHdFxxI
         b9splOJKT4k/UwQ9OlADnfvEV01Pcr2cNklL1zE6mv/PqOLBJh13ABjtUHYwb+Vo56YU
         epHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Q6EuvAcLp3RBO8JhzdPrvrcSpXx23VISrpng8aV2FY=;
        b=Q5I7w4kc7lDEx6I4MyWWFTUF0mcpktgYyK/SKse52fbKIJk5kdJGhYz89MJ2RbhHO7
         KcQByoFdToNuO7CieZK4JwtW0TN/5LaAxBz3yx6tgPtIYt4jOYhtJuAULCjd9gatzl9S
         t6oWc0m1ApIc8/iQ0oxde6xcI1xCwSd0WT3Nl8pmN9JMF2gS1sL0FQqJO+8BglIhXP/b
         LLzQxC+AC43TZRjevA8PruksHBK/KPYFKyNwICFm8voL1EvEdkhu35K74+8f10z7Enlx
         p9lgtiO8t9XcIgyoFV7ht/026ga43rcaO8VoQFBXsXGM8RPyPBw0kETo75/eO2X/4cQK
         clPg==
X-Gm-Message-State: AOAM533KfWELNfhi/4tc8Hg1AAw0JQrOWUMG+7SKwPpKB8JoJfTjOEaX
	66GjREnV0UkgzKim42ktMP96GlmBc+w=
X-Google-Smtp-Source: 
 ABdhPJzA8yhHh3Pi4T1WWpXQblLZYxCdUUc4olKHlhfsFPk8OlaQLew5fS+pQd+wgkmBOTqzBh8pug==
X-Received: by 2002:a05:6000:154f:: with SMTP id
 15mr1880027wry.74.1636573186897;
        Wed, 10 Nov 2021 11:39:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/24] kexec-tools: update 2.0.22 -> 2.0.23
Date: Wed, 10 Nov 2021 20:39:21 +0100
Message-Id: <20211110193937.2606747-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158092

Drop patch as problem fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...exec-ppc.c-correct-double-definition.patch | 23 -------------------
 ...-tools_2.0.22.bb => kexec-tools_2.0.23.bb} |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.22.bb => kexec-tools_2.0.23.bb} (94%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
deleted file mode 100644
index 6aeebc3939..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ba2fb5baf6b0a8c882ac32301dd7a8d16de0dcf6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 27 Dec 2020 23:39:29 +0100
-Subject: [PATCH] kexec/arch/ppc/kexec-ppc.c: correct double definition error
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- kexec/arch/ppc/kexec-ppc.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/kexec/arch/ppc/kexec-ppc.c b/kexec/arch/ppc/kexec-ppc.c
-index 03bec36..5b3e244 100644
---- a/kexec/arch/ppc/kexec-ppc.c
-+++ b/kexec/arch/ppc/kexec-ppc.c
-@@ -35,7 +35,6 @@ unsigned long long initrd_base = 0, initrd_size = 0;
- unsigned long long ramdisk_base = 0, ramdisk_size = 0;
- unsigned int rtas_base, rtas_size;
- int max_memory_ranges;
--const char *ramdisk;
- 
- /*
-  * Reads the #address-cells and #size-cells on this platform.
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
similarity index 94%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
index 95ff5e6ef8..22a9498a7b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
@@ -19,10 +19,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0005-Disable-PIE-during-link.patch \
            file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
-           file://0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch \
            "
 
-SRC_URI[sha256sum] = "40623d4321be2865ef9ea2cd6ec998d31dcf93d0f74353cbd3aa06d8821e3e41"
+SRC_URI[sha256sum] = "c7dcc59f5b66004d9d91264324e20e0387ea263dbb449708fbf84a4e5ff7decc"
 
 inherit autotools update-rc.d systemd
 
-- 
2.20.1


