Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E77EEB590
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 12:55:37 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.15952.1694264131291320984
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Sep 2023 05:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a9f87adfe1so2216572b6e.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 05:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694264130; x=1694868930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCAYJZAn9I2fSZmUfrzBfb6dLyfspMryFu7mxfD1nWw=;
        b=fdoH6/Hn/b64creDdw/XsNeYPwK7j6A5DF+4Qf9dovaBJUUR225mdaFZNNo55b5ACM
         ATn//vkU40mB6pILNK/7S7DIu59ICRFfrHC/stqbzaax8C79i55K1KeJKnBqqKBCBK3A
         XWf2paVU9LwjR1dOxWnyFAER21M5pzohw99vl5pamv5qQLm/Dscc62ygM/YIGgWr6AHS
         0o/pGyKl3pjIgeyaIVrQR1fAeCB6OnyTZq8aw0TWSa1eHlqY6hV5U/maAr8NeyTJ94v5
         tymK1ae15dyiBsQqQwOUo0TOyTZxBodutxttbyfUVM1nJTNPW/hNrVRJnBxMdt+hoDy7
         icCQ==
X-Gm-Message-State: AOJu0Yw4x/2VI085QjlMifCoEjSp9Xdv2x/ngvQ9xsjeS0gxVbAe12Iz
	HZuGaLk3HyoeqiYCkrnQCYF5Wk+jrCvR0w==
X-Google-Smtp-Source: AGHT+IHolGedEFY9gxCL4Ipq1GstQAh/PUwLl1zli5vwbeOK/P8HthieyXC0xSyFuve9+zluIPsI6Q==
X-Received: by 2002:a05:6808:18b:b0:3a7:2390:3583 with SMTP id w11-20020a056808018b00b003a723903583mr5229041oic.38.1694264130258;
        Sat, 09 Sep 2023 05:55:30 -0700 (PDT)
Received: from localhost ([2804:d51:5956:ac00:e7a2:489a:8055:28a8])
        by smtp.gmail.com with ESMTPSA id r10-20020a056808210a00b003a782e88fd9sm1611156oiw.58.2023.09.09.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 05:55:29 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 2/4] weston-init: fix init code indentation
Date: Sat,  9 Sep 2023 09:54:59 -0300
Message-ID: <20230909125514.214512-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909125514.214512-1-otavio@ossystems.com.br>
References: <20230909125514.214512-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187448

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


