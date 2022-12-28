Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19911C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:38:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.177183.1672213072797548842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CisEeLq8;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so10742872wms.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BnQtcuLDxDRD6ESGSU/T8nrw4TCDqxR9loRgsz87cc=;
        b=CisEeLq8MQpAooiXDrFHXXFRoB3YCuBHnvZmJVVtiXRSf3n8dSqTShdo91wGe5jHKS
         /QxYrUI14ly6pOILQGgJ+1/GBDCnyQYmAqy+1+7TDGb80uQvsv2GE2kKq6rLaFEFEcI9
         ZZyGJAQP6PP7wYL082aCsV4g5Yo/Yzxk/j2NFO1LVYEHTnHZb3pq6INL7MMCLuqTCIzs
         TItjRw98jDzQE7Bum1KdV1+NovFn5MuxaIn5veZogynXF0lgLgNveqdgeH3I6wZ6TCh7
         XdWo/QJu2gY1N9qHZT/IBTL6sFa6EVhl9INxHJaG4yivakFUWCCUCjrJYJDMNTyfxvE4
         nKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BnQtcuLDxDRD6ESGSU/T8nrw4TCDqxR9loRgsz87cc=;
        b=D1y8x84ogMietI2Mj93FqO0f30cD8J4lyfi+pFKPOnuGHt5qWvMfR/HvhrwI3QJCxb
         yw8ovMjIMmT9f776Tnp/qMStXrkOR4Q6J1Y5KlPU1tI6FawZf5ZL3f5y+G1ER0KIGqsd
         YtgvPavgGcWi3xwepLjrU3FlTLvBv/mq1ccfht4TFEgPDAFN8MFd0HIAfa9XuMp1sKbz
         cmIv6bR21SD42a9wZEhyI3y1QcvcDphZAb8f4HAK0F/QtoEhAh3NZAdZs72GCbIrTJWZ
         lw85BIhA0dkvj0Mieh3OUrKu5LvdUZwJP7sZcgM7cLtgwbfVpE4gkoaRojY/F8ecV4as
         d1HQ==
X-Gm-Message-State: AFqh2kp1zPYZSRQ4UgxkLlNYDEkUhMSiyIo/EuW2qWO1yfT0Px02qAVq
	1Fu1TxbsKwnWo2b762vbXaUZ/c8TZZk=
X-Google-Smtp-Source: AMrXdXtTeAhlpEv/HjdHw5qCFEs9RS0tQrl3otIz4lurFPjCA0cJHk5YLa42tMiFeo9iUpYITeZiQQ==
X-Received: by 2002:a05:600c:3ac3:b0:3d1:cfcb:7d19 with SMTP id d3-20020a05600c3ac300b003d1cfcb7d19mr21695668wms.32.1672213062420;
        Tue, 27 Dec 2022 23:37:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/25] jquery: upgrade 3.6.1 -> 3.6.2
Date: Wed, 28 Dec 2022 08:37:15 +0100
Message-Id: <20221228073721.3454255-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175064

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jquery/{jquery_3.6.1.bb => jquery_3.6.2.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.6.1.bb => jquery_3.6.2.bb} (81%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.1.bb b/meta/recipes-devtools/jquery/jquery_3.6.2.bb
similarity index 81%
rename from meta/recipes-devtools/jquery/jquery_3.6.1.bb
rename to meta/recipes-devtools/jquery/jquery_3.6.2.bb
index a474889099..fe6c57d206 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.2.bb
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "df3941e6cdaec28533ad72b7053ec05f7172be88ecada345c42736bc2ffba4d2"
-SRC_URI[min.sha256sum] = "a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74"
-SRC_URI[map.sha256sum] = "856ee620cebac56e872d6e99b09de05f81ccd3f3dc346e9b55eb694611a6d5e1"
+SRC_URI[js.sha256sum] = "a649f609466685e49ecacb18c37bcca75fb1cae6f89be7be40ae2c42c92fba8e"
+SRC_URI[min.sha256sum] = "da4ad864a87ffcf71c851b5df87f95cb242867f7b711cae4c6133cc9cc0048f0"
+SRC_URI[map.sha256sum] = "f46902fc1b81c286e51f4eb4812382ee9eedba0e9fc855e4dc3af59e0c57f404"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.30.2


