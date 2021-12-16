Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE671C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 22:07:50 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.1009.1639692470019843115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=w6CjYsDa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id t34so732418qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FybPdfUNhHLIKGQStrIaV/vtO9oBtpPUyhBPz/XCHuY=;
        b=w6CjYsDa7RsItSIhldlaRy4/0PiuGu9BC78szLwF4LLqlcwuQY/V/KUhSVI3pXEeDv
         ubkbqNQ+LFOjuCGqPPa3lGWfQLhAax9B62Ui+Mul2v+ybKgrjUULClhWNE2DuSR2xaS7
         bknQEjHp2J4/sgRP7Cg0+gAC2Kcbi3LxmAc8txVawMrB9mbJLZQ0OXghsnTXmxCXIaA0
         OGJAm86kMIskjiWnbmKN9C2MrSD/xT4gvhiPFtPwDrS9Nw7/vszfVxhyjlpc8xS41RFN
         FGyO2pVQi/bWyfByBQOXnuiQFg8cF6TQ+q7WfDdrVD5mviaMi40pVDOcjFLzzQubTyhn
         4L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FybPdfUNhHLIKGQStrIaV/vtO9oBtpPUyhBPz/XCHuY=;
        b=PMtgHMrmzYDpppBVQX87nMUufDJMphAZ44Gbazv61aKUgv0q0yPEj+g61Xe5g0aAec
         kNCcVWpANH8blAGuciSLY9zHZ81Wu/vfD33GrquURRO3zt5g9Tl/GEwhb2k5lV++BmmU
         Il64D8G9EOXpkpzEBsIg+aN3W2xjfwnmeIDKHDoAR21LjNZkIKBoK4nRMsyVgAbQ2V3V
         4/i+Rt8rFtJsIn12yYStsahZxhrT2Ckfz0WQBqhdW6OtnNy0iZuxXmvrZGT/c1/z2kM3
         IP5AiGq+p2xPgBLjhCZB4OddPJIPyuvjBNqLwFWayUJLieNZsKu3uYFzSYN2DSm0EDRP
         WXUg==
X-Gm-Message-State: AOAM5311Kh78dD+IsVBBi5pusXr8/L1DyDabAT5jXiVuVKABJ/UAYYbi
	95ASyZRfVYK/9jwrbc6/pY++1C6kcHHRkWxp
X-Google-Smtp-Source: 
 ABdhPJyViKKB3O+s0UtRltzPUzsMPNCDAZtGnwvwm422k3naY58peu5szHqRmXXYG9rLCJ9h9Unv+A==
X-Received: by 2002:a05:622a:58b:: with SMTP id
 c11mr45713qtb.470.1639692468970;
        Thu, 16 Dec 2021 14:07:48 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:a1a6:f88b:686c:916])
        by smtp.gmail.com with ESMTPSA id
 c1sm5380030qte.79.2021.12.16.14.07.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 14:07:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: add qemuriscv32
Date: Thu, 16 Dec 2021 17:07:48 -0500
Message-Id: <20211216220748.29376-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 22:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159807

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 80f62a0412ad..744b74ce3749 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.20.1


