Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C64C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 09:22:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5047.1648632130237989945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BayhvYjD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 r204-20020a1c44d5000000b0038ccb70e239so805926wma.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6Gr8GtM9/pD7r1DOSwsQd9lCaJKFixyrU58g1b1ZZs=;
        b=BayhvYjDNVOH5pKYhqcIfIcpTtMs8loBFYRsqdaRbbcqFRdTAB5chd/FGH6pAtPFLS
         eakl2dLAwjJfPBZQ6YW1ujXnjdanLMSsuluny2T1n3N2BHpExZBnNN33B7rF3WL4KTVg
         r0bTrN5DHjA7GfnJiQQIZHaspA+vQ1FR+VT2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6Gr8GtM9/pD7r1DOSwsQd9lCaJKFixyrU58g1b1ZZs=;
        b=7avGC8tC/Tf/Qh1Is/22k9j8LlKmgFazMyQWx5rumuQmSvuIPItGTdFOZYJYDF58hA
         Aku1vdkMacEX2COtTei2M6hdTSlrFNzI2kmkkDlUIOzzE4HeeblC9dbjMF8t0bzhxEMo
         F+qDjJ4xMNyC8323Ef+0e8OrIoqDDzukZTrhZHWUMG4/x+PT0CEIMhw9cawMgt/5ES8d
         PvTeyiijCKpuw4eAEAR+M6/kNXvACDNO5Jt9wHLbF75xczLP2ptLvv/UwINVZWLPXXEW
         wiiH2eUjga5j9UN+NgCl9+qIA1UJYC7IVtbtqgj2l+e+B7FfNrwogy25W69U2B4Q6Tmg
         2iUA==
X-Gm-Message-State: AOAM532JpTu1Sn8g0Ykd1+7rLhsRK/hMQPET1m77BOu0zRjal8sPYfiv
	wA+c/7kFtp0TVu7rSK2z1rzxTfbMc+yttC5K
X-Google-Smtp-Source: 
 ABdhPJyxDOQWFPQt50/tuHb4FDAfn1OEMpvVeDNWH7tK6xo2mGUWUIAZb3DSZ+a39vFaIXOccn+HGA==
X-Received: by 2002:a1c:c912:0:b0:37b:e074:dfcb with SMTP id
 f18-20020a1cc912000000b0037be074dfcbmr3387008wmb.161.1648632127943;
        Wed, 30 Mar 2022 02:22:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:367f:29cd:9517:5c4])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d6d09000000b00203ecdca5b7sm18191238wrq.33.2022.03.30.02.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 02:22:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Add missing gitsm entries for yocto/oe mirrors
Date: Wed, 30 Mar 2022 10:22:06 +0100
Message-Id: <20220330092206.1498977-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 09:22:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163780

The missing gitsm:// mappings looks like an oversight, add them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 8e7b35d9000..37dc449ade7 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -42,6 +42,7 @@ ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourcew
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
+gitsm://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \
 hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
 bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
@@ -52,6 +53,7 @@ npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
 cvs://.*/.*     http://sources.openembedded.org/ \
 svn://.*/.*     http://sources.openembedded.org/ \
 git://.*/.*     http://sources.openembedded.org/ \
+gitsm://.*/.*   http://sources.openembedded.org/ \
 hg://.*/.*      http://sources.openembedded.org/ \
 bzr://.*/.*     http://sources.openembedded.org/ \
 p4://.*/.*      http://sources.openembedded.org/ \
-- 
2.32.0


