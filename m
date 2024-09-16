Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B5CC3ABC2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.128380.1726453187823459963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AE2vhpeu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2055136b612so48919895ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453187; x=1727057987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSYA5pBCqsLh2NjTC95ALLFTrafOVixZ39m1U67v5Q8=;
        b=AE2vhpeuk1rCCw3S3W3MNhk0LpNH6+f17MqDF0ZcEa/o8+Kh3CqYpBk53+tJ7/o0T1
         EWKc5w2FSr+uHB6ddwXZf7akuY1scwU5G2aGdu2oZTm3iK7AbHOnXRZmIvE9RXi+yRcR
         7vhuWs05aG0tSaFBPQyvDBO+PdtB/Oplr6lFE7wYPUAfAtc77X1WB7VcVcNCxKBXs/US
         HV+WSOiuIErdXunqa06I9UljXMYzV7j08IrUUReZIOI0hNsYRAtgsC5xq9ih0e85iRPW
         RZB/oiW468DPn/upJzdYoj215BgRryRKgc6zSE9Wx+IYpH2auhjJMKvziic0El0+KY9B
         fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453187; x=1727057987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSYA5pBCqsLh2NjTC95ALLFTrafOVixZ39m1U67v5Q8=;
        b=eyE9un3lR46E8cGbnxcE9/i6bicFpJ0tfUw38JZ/zfPWV1xuT1v8uG6SQXGfReTOhn
         c22A4dwU1V8t5zXmbhqyLraYXSFrCPYsI2Wha0KAKRA+2eySFMcwssAUiSNrtxNk85Ct
         WAt+K9VVkonSCm1uuk7royiNyOrYqNAE/jDO4PPTeqWNaVfuRNbGLEU/Nbq35iEK1Dum
         PAxFko2vZEhMK10iReka8hyGOmHkjE/aGyzsQsEcR+3pXdnQUAgqny1cGEWt23h28wpZ
         dkTXS/rQ4YJTNWrEnHkV1ANvla7bzF1IqPDskb/it8W/Tf4c+FbC99T+vhbrNW7FEw7i
         GeTg==
X-Gm-Message-State: AOJu0YzX4EOopUmqtzegCQvZXXzmasarGSpfhI200b3kqtZVOOoowhJF
	ab3r2ns26RG6Maai47O65S5hJqIlDkZh68IfbMReriznjNGzbBewaNV/4JGWh/MastF+9r53coQ
	kQC8=
X-Google-Smtp-Source: AGHT+IFfFfX2N1eeP902jUPTAm84ysGrR4W35CGcd0qbWuCXm/NUdMl061gogTHJzQEqwdad84uJEA==
X-Received: by 2002:a17:902:d2c2:b0:203:a116:7953 with SMTP id d9443c01a7336-2076e30a904mr241926065ad.10.1726453187020;
        Sun, 15 Sep 2024 19:19:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] vim: Upgrade 9.1.0682 -> 9.1.0698
Date: Sun, 15 Sep 2024 19:19:27 -0700
Message-Id: <829e474534777b2154f1b1246c5792b3159dacb1.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204591

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE-fix for CVE-2024-43790 and CVE-2024-43802

Changes between 9.1.0682 -> 9.1.0698
====================================
https://github.com/vim/vim/compare/v9.1.0682...v9.1.0698

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e530265415d93e3f49ec7874cf720aad18ab2e22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f8ba37156a..11daa900d2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0682"
-SRCREV = "cb90ea9cba6f033fe141db0e466fb4117f28402b"
+PV .= ".0698"
+SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


