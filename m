Return-Path: <suhridsubramaniam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C6DC433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.10572.1650047128860739768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 11:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Niw51y3u;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: suhridsubramaniam@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id k14so8089481pga.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2dJ+QA3FdYskBVet9oH+ut/Uj+akVowpyZO32SqYek=;
        b=Niw51y3uVwHjtZtdFHUaMoYBk18GyHcm4zQ6DNKAQIZiLlJz1lccgX4XLw4T1WrvYs
         W8PpT27R7P3cq7K+Sd0iZFQNJULXCJircqG+080kA1fqFBvnHrdQz1hwJG7GeMu5jQ6o
         oQHYzQkBc6jc6iYQDE1jCeBobww8hTM9zF5h8Ihw5iggiXRCnjYlxZiD6FbjIGottKZ5
         TyJSGQW6q132vA4D00h8ETQHolPmsIRwn/p6kxfMnJQC1qF4p8pkJg/AgqtsNtGCZBcL
         pACvdYK3/QPmHRNNPKx7QpUTytwCmDrCxrSx3i4ouH1BXB/h60Dsk3r1K/f+O6fnX88s
         vNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2dJ+QA3FdYskBVet9oH+ut/Uj+akVowpyZO32SqYek=;
        b=fPhe3onzj1gZMWkbvF0wBKYgubUeqaPrpdbmGjYCHCWrM4w5mWuV+x59DO2SkUq0KF
         jAAsZW3F7eom5sQ10J0RCv7RQt5VglxAp6AL34+uAGfxyfuRhlANlqm355QnjFnuSTQx
         Y7ZBEvzPAhfEj/FiZFYIrib4UHetkK7k65CuBh2WxP1kU6Qgw2Y5n2oxZb4stpbivcBz
         bNS1yiKk68t7i3gce6W9vy6ps2oq6YqqzsJjzgkE8N8xQKtIoPou3YHKcemv5TOfle9D
         WOktqSBTCm+PRAkV9vFmNokCXb8kEcVE6aDzZign+jKe0PQJslzXKJiXQcZ/1e8IB6EX
         /qTw==
X-Gm-Message-State: AOAM532lU/3tuYXQqP7cxgdiULU2v8ZwavGIUEMleu+x76w+4PyICr4/
	aXOruvMFxSuwh7k3PeuQtdX7/Sso251OyA==
X-Google-Smtp-Source: 
 ABdhPJyrMXpQbyp6925/ygUjgnmblxzP3zEfVcJx27ygMsCNfuwx2/vPJjU/h4k178kFLQ29agNNrQ==
X-Received: by 2002:a63:aa07:0:b0:386:3116:d222 with SMTP id
 e7-20020a63aa07000000b003863116d222mr230537pgf.313.1650047128044;
        Fri, 15 Apr 2022 11:25:28 -0700 (PDT)
Received: from mediatek-ThinkPad-X240.hsd1.ca.comcast.net
 ([2601:646:8200:7890:bc59:b9cd:b61b:ce00])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a63ac0a000000b0039901c45810sm5317661pge.47.2022.04.15.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 11:25:27 -0700 (PDT)
From: Suhrid_S <suhridsubramaniam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Suhrid_S <suhrid.subramaniam@mediatek.com>
Subject: [PATCH] clinfo: Upgrade 2.2.18.04.06 -> 3.0.21.02.21
Date: Fri, 15 Apr 2022 11:25:19 -0700
Message-Id: <20220415182519.47954-1-suhridsubramaniam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164431

From: Suhrid_S <suhrid.subramaniam@mediatek.com>

clinfo 2.2.18.04.06 released April 2018 does not show correct information pertaining to OpenCL 3.0 released Sept 2020.
It shows version as `2.0` or `2.2` in systems with OpenCL 3.0.
This upgrade fixes it.

Signed-off-by: Suhrid_S <suhrid.subramaniam@mediatek.com>
---
 .../opencl/{clinfo_2.2.18.04.06.bb => clinfo_3.0.21.02.21.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opencl/{clinfo_2.2.18.04.06.bb => clinfo_3.0.21.02.21.bb} (92%)

diff --git a/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
similarity index 92%
rename from meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
rename to meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
index 831b15a45..35b5a000e 100644
--- a/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd8857f774dfb0eefe1e80c8f9240a7e"
 
 SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
-SRCREV = "59d0daf898e48d76ccbb788acbba258fa0a8ba7c"
+SRCREV = "d34bc1a3bdc148e2e1fe64998398e1a0552ab04c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


