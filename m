Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F95C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 11:27:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.9483.1660303624282774856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 04:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQOLxHSA;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id n4so865766wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bebxoKUjeoPxd5Y7aKdotuxdUUut6gInqBZjBRrxThk=;
        b=HQOLxHSAovFXF2VYbfqMTX4zJGbbe2GnTzCP7wM215GGJqdoBeR0Kva6rgMUCX/v7I
         NEtjXhR0UmZzEj9FxtfYaDbkmmP6t0/KXpuP6GH8F7mBf7PgTQxSxO0/4w7MBQRPDSfi
         bvb1fZVy57QaSdamZH6kqJckWIpQAtgJ7o9rl6iTfomKwXMe95URJO2BZr7qKFHkrHqY
         FCfHObHNIiGZ6rkDJGgBsfmc+tLwR0NzlrcdFGyMAq7Zn9PaoCd7THMUeLIzUXF6NQ4U
         uxRU6ytbM307QR2upoopPIeYiIdwo0r4sS1qPIS0aj19ws/K5rYfn+d2RSEb6OMKAD4/
         R2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bebxoKUjeoPxd5Y7aKdotuxdUUut6gInqBZjBRrxThk=;
        b=Tfn27csxfl2eRPhxQX93CSVsgO4M+4Q24sEVDbXl9GJ03aI+bluLIQxeOeoSG3X4KR
         V7avD0WYq22c+t+nPppFbjFvZ1PKUe0AispqZ9hcS+ocr2jp52BoUpXnkr+TTu8krFB2
         aPqvp4FSNVWQjh3enGb5fi/lACLX/tbBuVn/l6yClesPLfbL6i2YyYYQhO7L1YLCckbG
         dQs6tUos2vhdrWgVVsRP4JskxCwsub3klHd8027t/dEdT++4ZyjDz/3ythyiE581hHNw
         7f5qMPdTmp1avGrqC8cQJEHTgBl7rwR5Au3kpsn/yx1TN+PHlvVXKxj5zP3ndSy0k7ed
         tX/A==
X-Gm-Message-State: ACgBeo3sDHnvqf+4TJBgDpUtg8bZo/vKv5+I1v50OJqWSjy531PqyP9m
	hsN3mIPkc844iHLN5CqSHE8th6of2nQ=
X-Google-Smtp-Source: 
 AA6agR4Wl6WaI+WarGeihCTivpvlLVetYGpkHuuDI9N83N+dlcVLjJ4DQ1Uw297CNTagw1AHSI27Cg==
X-Received: by 2002:adf:db06:0:b0:220:7a57:6665 with SMTP id
 s6-20020adfdb06000000b002207a576665mr1922475wri.55.1660303621980;
        Fri, 12 Aug 2022 04:27:01 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 f16-20020a5d50d0000000b002205ffe88edsm1732932wrt.31.2022.08.12.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 04:27:01 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] linux-yocto: adds a space when append to
 KERNEL_EXTRA_ARGS
Date: Fri, 12 Aug 2022 11:26:43 +0000
Message-Id: <20220812112643.2168104-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 11:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169281

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index cabc8f4975..7ea661e138 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -60,7 +60,7 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-- 
2.34.1


