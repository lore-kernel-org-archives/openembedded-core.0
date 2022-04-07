Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C08C35294
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.1083.1649350848730250330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wb15no8a;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id bg10so12197311ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UebzJWBm99RzRTiVkdsvoFlEhj61UJ3nrjZqM30+21U=;
        b=Wb15no8adSEipQbtUcy0Y/83n08Si3ICJiPr4VNMapNJi/OeSWWCmAjg6uZPw1yE/W
         pWNbWexaKyBcqpnO/0zETVT8F/oPMI1Z9vu+g+H6CBnOmqwaFH0uWURaYxsR8f4UiOnD
         1XD45laUzwiG6NhvQmTutcUL4a3hB7g8kHUOB2ay1oDbCNE/tkgxrEaM/KD9Rr2LfDPI
         5AbFCRPMemfgcMNiWImdsjh87jpCkO/mm1YbJa1o4j77oQU+RSLSDlPztkdZgtcBxxNf
         wAifm/+cfz/BMqZ17VI2eU6Y8QzVo9PCIrkZLG8VYHQlNRlQcH8PkpLAvveUF0DxOlHG
         J/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UebzJWBm99RzRTiVkdsvoFlEhj61UJ3nrjZqM30+21U=;
        b=kqLpeYuFjjaAxoph2IqD+RZjXSv0lVsCB+4Z0UaWl3k1B+Q0e/9qLE0cqghfU+vYKJ
         Zdir5SBg32W5Rp9+lQUGM/6bxnYutXxT+PnUQr74LOdIvNLOAgZbL+MF6hAuBLILiPxz
         YEikxyIzO5RfOC2eJCsFietCmQrxS9vODyPgUOORE9DjxS3bIacd+wd6IpW/tWj1Ffq3
         w0ntKogbV7qcvLyR42023L4/+EH9IAMjnxpyxmmbBUKHgeuSNV/6xdMwG8CbzLp84nHe
         eaK9tOeMgacs9CmZt8hM1P04pWsaOId3Bh3BDEnoXFJNLIDJLh8nGDVAUafWwgi7yANU
         QR5A==
X-Gm-Message-State: AOAM530pmlnlSCBpykxib2/Nd0RxnlaCxkZrgwMRz/YtWFOK0S1Yem/Y
	fPq9E1r8aubLAehisiFfltL+4iQbbuI=
X-Google-Smtp-Source: 
 ABdhPJwRXm67ZpEzuiY4EsXo1fKTxISHqAf48T9eQRX4VLJbbC6z1zYpSy+KTggaX7zzd8aaRxw1qQ==
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id
 hc10-20020a170907168a00b006da91779fddmr14555740ejc.757.1649350847128;
        Thu, 07 Apr 2022 10:00:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/17] vulkan-samples: update to latest revision
Date: Thu,  7 Apr 2022 19:00:19 +0200
Message-Id: <20220407170029.3500874-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164123

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 53c7254ce7..fbadc506d6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "28ca2dad83ceb157386e0708f5151ae89c177ad4"
+SRCREV = "f37bb1ea48d2782e997085aedf440b4a159e8189"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


