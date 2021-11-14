Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1A6C433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 20:27:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.13647.1636921645373183204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QxmQBURv;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u1so26435749wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TxSV8ZCGQzf7aJjin++zvx9+jpybZ9coJZqw4Affm2M=;
        b=QxmQBURvYwpdZ5S6qyeIcKhnu6ZLoLFCsATw76TCBq3crWWwljqk6Ara6MzYsFU9bN
         3Th5Fd9flW15pGtvorgXiQDl+YVCYvGcZOn/+DKV3pAf8R7PWCVULQMcVMb+OQW/TR4l
         CmQiUDenFTVeWqqCLxKL+2G2axm61b+qHH73gV22PazpCs3t59s7F7pay2mY94scpdfH
         8dWg2tY5nzUP7hv2ewD+0WO7gqVMaVZMpOH8dL/KAyh/kXOD06RAf/gE3Dx46Jav3EcY
         ohgiosFvP3mbDfZ+YWt3NLpsav/R995f9ZFIV9kcKYIwZaao+9c2JuUMsrBFSSEazBJs
         godg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TxSV8ZCGQzf7aJjin++zvx9+jpybZ9coJZqw4Affm2M=;
        b=D5hpmNcSBlNFLvTribf08Mih4DMoPNsPZEjEPbC6/xKYHg0IHWEZpuno7jenU2O5lR
         SKHNLeuR7cW3EIDJumbdePdKxFwH3NCzjZ1K66PCXt8rBOBswtYOjxE5mySJLtY34jD5
         dy1pnk9K+UeviuRtU9yG1/NI5sa706F9Xhom/bAIYZ4ipT3RcdE9zgTCOP2f7N+umbOC
         v8orOt6IJshc+gZ5J8JJYiHzas5eOLPFKnDMUauGA/fL16UCHARMK8GIRY1hjdvy32AB
         mTSGa3291d1ma6m62ug+GZ7Ahmwyv80cfDNmV49Mf7kF/iwZKSnWQEydDyTMWGbjhU/E
         UyBQ==
X-Gm-Message-State: AOAM5302h7ZeHTrdHLmbqlZbTZaBP+J1iTV60KUO7RJ8Ij4zi+K1tq1a
	FErCFF+SQTyLR2Y1HqDny+PTc9yjYNw=
X-Google-Smtp-Source: 
 ABdhPJxxnbCAN0K/dVh03U0RXI15SfmquJn4uBDGUE+cIjDPnUAiR+WZYSBrZHqXbcJ1TDnTW4XQqA==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr41581575wrb.50.1636921643575;
        Sun, 14 Nov 2021 12:27:23 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r15sm12733295wru.9.2021.11.14.12.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:27:23 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/5] spirv-headers: bump to last master
Date: Sun, 14 Nov 2021 20:26:45 +0000
Message-Id: <20211114202648.316923-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114202648.316923-1-quaresma.jose@gmail.com>
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 20:27:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158268

SPIRV-Tools v2021.4 require this revision
https://github.com/KhronosGroup/SPIRV-Tools/commit/21e3f681e2004590c7865bc8c0195a4ab8e66c88

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
index 101a2e2948..522708618e 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d"
+SRCREV = "814e728b30ddd0f4509233099a3ad96fd4318c07"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.33.1


