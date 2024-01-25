Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF6AC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 14:57:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.19702.1706194674345858376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 06:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFH5/6be;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9b41a3cb7so2179490b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706194673; x=1706799473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uojlWK1RahhVvtbsrvVRTz9nupO/b9Mw2sT+vIuRUwQ=;
        b=dFH5/6be6rzgRHaEN+xKmOuUshced42Ifq4BnYHiN5MyBRoaPCuE2e6xpmDK7IgDJM
         EY+xepanGBSCKejQkbb2Zn9QVU1fMRZWmX/WgyuDhrf318A36AYsN64nFyXoBaltndnm
         VPgkYKX2XOukkXiju9yWXqMBKObYnnlMIUMtYiSDRTrJTM8V9V3A943NQd+SF5er//b/
         Lfegx5gBoIfrRg377E+RHFZ70w06kg6UZtuXhYlx9jdziwzcr7KdA4tmKQ0pRs2Hafv4
         H7fjrrzClonmjbR4kr8+941QLhXnBK29ufHSBF7PthCgVw5IXwM+FZdKNAS9aF7CQ1y5
         XMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194673; x=1706799473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uojlWK1RahhVvtbsrvVRTz9nupO/b9Mw2sT+vIuRUwQ=;
        b=l5aorM7mSsPQfZyzMAqWq0FYtU2NAPNj8X2SnkJpveJAYvSJpkBGuUYqTEAsBwpUuU
         7mVck+dMlQDCs+vMw3LHfcDDBAQgbDKRhp9CSFyRws/APA8uabsdYKN3d1DLzBe7drZw
         tbkj8WckWiMs4q3rYYLZ07u/IaLV/2XdjyUej2XToOQh+upRZbaPLPsIscn7L0pcrhb2
         v790aYk1bQW1NYQZPXK+URZ77vYl5KWm843GChTrksUKAldEkmbuSCNqG0B4vBaKoFDg
         igZUs+wjPdy0KHYPCyR9Cx8TYzrCU3iGGo4URaFZz8qFSq7N67EiFS6+zyG7fZIWKpPt
         774w==
X-Gm-Message-State: AOJu0YwGSCUTq688TBCPhyT3+rpLU4d0yp0U2qNdMp2GijWRRaG3g27n
	Td54S9FDf73dxmKL6PAXnCjaoy9HNpAoaddis/P3dEnqqnmdFDaRMMqt0nKS
X-Google-Smtp-Source: AGHT+IH1eHuUUxhDLCTwBixotpPFah4z/7sk6Cdf3hALD8mzNB1U98gOclTSD8to4twl2SZlbFLkYw==
X-Received: by 2002:a62:8454:0:b0:6dd:c5fb:9aaf with SMTP id k81-20020a628454000000b006ddc5fb9aafmr1790900pfd.1.1706194673374;
        Thu, 25 Jan 2024 06:57:53 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e3c0:17a:3048:5d55])
        by smtp.gmail.com with ESMTPSA id 15-20020a056a00070f00b006dd83a2fc1csm4816554pfl.164.2024.01.25.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:57:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] piglit: Update to latest revision
Date: Thu, 25 Jan 2024 11:57:48 -0300
Message-Id: <20240125145748.1774954-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 14:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194329

From: Fabio Estevam <festevam@denx.de>

Update to the latest piglit revision.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 69294c6c9468..1bc3b784c77e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "71c21b1157c4f9a96453bdfcb9f4dda091360afd"
+SRCREV = "f3f1b3f960611a88cb1a037114ba4724f1bf330e"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.34.1


