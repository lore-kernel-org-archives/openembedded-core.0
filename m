Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ABFC4167E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7366.1651727180277086270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3iY0xnQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g20so3894901edw.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8TSP+dGkzBpbD7mDwZojprS30g7cZjXVtGZdn25XAw=;
        b=U3iY0xnQ/UcJ65WhVM4vccN1xETgpZ7GFoVJHTsuUKhYXfEb/VcIRCFMKtw3sgG7dQ
         +s8uX8LDUX7+w8k5GWQk7OwYRdCRHFOiKRpOPW4JAXthp8W+ctRvL4OP9fQWS6P0wEXE
         7+/vpukWaVuc2ZmTMsZ40Jh1W+KtlhTPVp8GkCXNNdBK12R/jNjqmUYVMUFfq6uvfiBm
         7RzQ16mjwpq9lghFU8AVFOcaFtvpzVMv70u+d7wgnpqKWY1ki7zY1QdlWLUMYikGZPBQ
         g/XM6PtHb094vtDs6MdE8WwAjizIQN6QA8bE6mzHr20txrFTXTT8nqFa8w90j19YHr2M
         dDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8TSP+dGkzBpbD7mDwZojprS30g7cZjXVtGZdn25XAw=;
        b=aPLTM8eYoTaUd4Hpg4qfxV27P1mQc+hJgN2eFjcqPegplB3NI4RS9kLWyGIejEAYrf
         yST7InFFNT9XU1DnbAWRg8QCKEN0vA4LN1u2hDOb+4R5BqSRzZsQnd1A5NVAB/h7YFJ1
         4zlOr9n6xhRrj0FLbz2QjBGGPEIrWzk75iXGBabYOhn0faSQi2ZRYDxC9lOL8NQ9GFlB
         SMSfTcgbqDNeRydJ8Fbk9nY8m41IA48WQ4MDxdR/sll/rIyrcIMIuurNyZNhSRG99wCK
         AmqOqaRDli6CpvFSvViUptjXS5WsGnrrKhAdx39/N5aqM9AfC/GaivUC1k/7LGkzCJci
         K4mA==
X-Gm-Message-State: AOAM5315sFZETu+SYtOXc5a5Xm2P7bVtJmIWWwhdZotFTareij2crddi
	PlZN2a1VevBQM9QyPxoyRWtymaU3gkA=
X-Google-Smtp-Source: 
 ABdhPJyM1oznCgRETK4YJ5OsdWdLMACdN+X0MNf6LUzpff8BGiqE+epkSWhzFIg8YU+GoFbFmw2fNQ==
X-Received: by 2002:a05:6402:5c5:b0:425:e014:f1bc with SMTP id
 n5-20020a05640205c500b00425e014f1bcmr26852768edx.361.1651727178915;
        Wed, 04 May 2022 22:06:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/61] python3-pytest: upgrade 7.1.1 -> 7.1.2
Date: Thu,  5 May 2022 07:05:23 +0200
Message-Id: <20220505050544.651895-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165270

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pytest_7.1.1.bb => python3-pytest_7.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.1.1.bb => python3-pytest_7.1.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.1.2.bb
index 1cb2fb01c0..c642d9a232 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "841132caef6b1ad17a9afde46dc4f6cfa59a05f9555aae5151f73bdf2820ca63"
+SRC_URI[sha256sum] = "a06a0425453864a270bc45e71f783330a7428defb4230fb5e6a731fde06ecd45"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.30.2


