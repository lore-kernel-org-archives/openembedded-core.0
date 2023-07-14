Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CD9C001DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 16:18:34 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.3310.1689351511185450570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 09:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=n8/JEIOX;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b751cb88bfso301071a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689351510; x=1691943510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=062/4MeBpcvoMllt2P1OksfxHvwr1wk94aYZb/61LS4=;
        b=n8/JEIOXyC3cL7oZ7MgaMl9vcvtDPZWy3AoU+i6hUfCn9nqER+OpNiLMNVGJjucKv5
         IPgqdsK/UdMSvqEH9j3Dw8Z24sSXqu4NbJlndLPhcSq7KxbtDLs6+765W8Kn3ndbyRam
         9NU16H8LNApVz5+LZA3RvprRCdqjTF7/ucoa4pX2ByD0ZQ87odbmUb69jeJiNC5Kz8Qi
         c4Mn5ixMjTXCFs5/eIQNOArGZz7NGa15MjXJr8aKUyIUAWeUCLu0ycwM+Gds/v40whOE
         ZzOTjTZJ+BdyJitgUAVyQmzOc/dvUvKcFWMBH2xCCBXQHnSDGRq5gpoEqONi7+zU2vJM
         eT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689351510; x=1691943510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=062/4MeBpcvoMllt2P1OksfxHvwr1wk94aYZb/61LS4=;
        b=BZV8pMcbt90E+SZyTMB1Dhi9XYuk9oWN0vQVfUH8HrwsQ8WfMnRwzkfJHQndiGXOw1
         0ng14b1wOG/o4+FQqfRNBVafprifmZxnuY5yq9LzsG2qcG4SypW8dZlwe7DvFzqx235P
         Nae6koYyNrmW74Qc+hc2uxJZ5flW+SH/tzVJ6fevcg89KLUlQ3ROMJRgFpPbtVAiUptt
         JLPKQKNlDn2NxTa+F1DgnOvLisVAlVWMsieLUVSGwKqm983laDKvD48NCuNpcEEAhkAb
         tUge8qhx9108y6/GKzrjPD/M6oyhwTnlYzBlQ0o16wV0dXjIY9e/qH3wMM+IrKgJJqkX
         h1nw==
X-Gm-Message-State: ABy/qLbMTm7aVD+CF+zfWD1Gz/XJd+vdXR9yGd6ytf4KtF78paZGq6N8
	rZKataWUEH6vsDeK5VRkYShijDIU9LIzFg==
X-Google-Smtp-Source: APBJJlGaOwEKRTS1W47+G9dWtbc9o0vs4rkSk4n10FTX+BK1stCYCIknDchgVhZkc0cCZYWILHOVig==
X-Received: by 2002:a4a:b206:0:b0:563:3b56:5dc1 with SMTP id d6-20020a4ab206000000b005633b565dc1mr3811817ooo.0.1689351509928;
        Fri, 14 Jul 2023 09:18:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:313d:de97:6253:5730])
        by smtp.gmail.com with ESMTPSA id t5-20020a4aadc5000000b005255e556399sm3648104oon.43.2023.07.14.09.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:18:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] u-boot: Upgrade to 2023.07.02
Date: Fri, 14 Jul 2023 13:18:23 -0300
Message-Id: <20230714161823.20685-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714161823.20685-1-festevam@gmail.com>
References: <20230714161823.20685-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 16:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184274

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.07.02.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../{u-boot-tools_2023.07.bb => u-boot-tools_2023.07.02.bb}     | 0
 .../u-boot/{u-boot_2023.07.bb => u-boot_2023.07.02.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2023.07.bb => u-boot-tools_2023.07.02.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2023.07.bb => u-boot_2023.07.02.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 29beac4c1127..ae9a7e6df143 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "05aa6516c6bb419d01d69fac457c0de563bfd694"
+SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;nobranch=1"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.07.bb b/meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
-- 
2.34.1


