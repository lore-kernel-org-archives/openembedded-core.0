Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961FAC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 20:05:08 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.6742.1691179501446108346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 13:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bc9c01e154so2272514a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 13:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691179500; x=1691784300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCAYJZAn9I2fSZmUfrzBfb6dLyfspMryFu7mxfD1nWw=;
        b=MIL25hTXBvgS2vtXmBnMIZnlyc0gGPmxOcH/tcZ1dLDh+9knGkLRDl3O2/dHH7K85Y
         wTm5te1wr4nJTMfNg7PTGBmDXbQdWIqwlEzEZrI/+wPjcW8LcMoU/rSt/Rofc2OWFn2K
         XXPOHUNFQcosGRk+uzU/FZbSS/4Z2rrRGlX9CO2RvkGpOGJ6sAmiBIFtUv1jVmSBvMnV
         fB9dJIlt9ZPvwprvIvgdog5snH3AU9Bnu3CH+eP3mRpkoQtuoca0bin49OBTBu0ZUlhR
         n3A7a7UzM75pxLP3uqpBFoTlU4hqzrZZi2TDQhn2lX9EW/U/puefPLcofsG0Ym71bZ35
         yPlQ==
X-Gm-Message-State: AOJu0YwW6LcNbLT/PUgcNLtw+O/FRu5BD+oQkcKmtOGChkYvKZR+RLw3
	TSJwP8VqywR0ApTeF7O50xX7kpjuYuzeoQ==
X-Google-Smtp-Source: AGHT+IGxafDlhf3Jwg22f41JyWWuiBNdQqdAeldQ4WZxV9XIHE+TcC8o6IV4v4iDf9Qf7aqQhF4SNQ==
X-Received: by 2002:a9d:6650:0:b0:6bc:6445:e24f with SMTP id q16-20020a9d6650000000b006bc6445e24fmr543565otm.19.1691179499806;
        Fri, 04 Aug 2023 13:04:59 -0700 (PDT)
Received: from localhost ([2804:d51:5904:c000:7713:9c86:e19c:d8a6])
        by smtp.gmail.com with ESMTPSA id a11-20020a9d6e8b000000b006b94a14b52asm1563734otr.9.2023.08.04.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:04:58 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 2/3] weston-init: fix init code indentation
Date: Fri,  4 Aug 2023 17:04:10 -0300
Message-ID: <20230804200438.1651568-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804200438.1651568-1-otavio@ossystems.com.br>
References: <20230804200438.1651568-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 20:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185540

Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston-init/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index d3b0d1873e..a5c54e001e 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -30,7 +30,7 @@ done
 case "$1" in
   start)
         . /etc/profile
-	export HOME=ROOTHOME
+	      export HOME=ROOTHOME
 
         WESTON_USER=weston weston-start $OPTARGS &
   ;;
-- 
2.41.0


