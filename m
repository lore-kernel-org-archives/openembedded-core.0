Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FDBC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.5284.1637302531463779164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SfjYl01Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so6616663wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=SfjYl01YvPm8U/xPnEg3XXJVTtbqEnZVA6Sbvzzd1x8rvy2xCJirddvdPEgJ1rzNPt
         TQSZF4O2AfJhmb6eS7t2jaNNQBe2wpddEPekgDPg19+aoHfUn/bc0vpO0sPjNBD6UMbm
         YYV/iBfxdkPZUwHJHu6HZEEmq5eTfki4Fjg7ZgaQ9wJGMAChyeJH5W5cwFxOQwJZFSJ2
         Re3VlW5vgZ8f2sluSEu2Abtp8utjMN3eIGpxJGEWOvglnXwpBMR5NxeuFxEDVwiGMDrq
         vKo3zLjwg9AZrsjN1y5fiXhGaOZjTRX8nHoP2QjhhBXHGEZnz3mHT9cPOWzDy3gieFs7
         YmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=LPqqmxCUZUSCrPrmDIZALZK1toWCTeLugfza5onYEDZQvEB192LSjflpVQ3PsAdUB+
         w9scwvznpaadzKf6rEOKHH4LOifRaWbv1rhc6ivIvzZTN4deREJcaX3hqAT69DNmM7Xu
         ZyCraEjEPzEg2AxuvF9xSpPo3Am2BmW++WEHxN81GVSwJdl62Wb432agsWELpdoIA2uP
         ANT51ZbwA229MhA8g/370bHZIYTB/NDmiUyXVLfkuUI03QbEOylaezXkKpUysSBRicD1
         TBezSn+ARzEeL2rxeb+KYbQwB93TMv7XK8j61EO/l6FkarLUwjePfYJG13THTakb98A2
         h3CA==
X-Gm-Message-State: AOAM531JML0rYF+/CAgIkzS/BlRXb2PuRH8t3kQtS0203hE7TBoc8758
	R4kd1QwTBwDxP2Bi2tjvguQiuleTHhKQrg==
X-Google-Smtp-Source: 
 ABdhPJwTXbrMI4ll9lRsYf9g8EMhojDSq61yFjsad+bZJPbT34atj2xdBcJFoKbP6huvKHnVt5duhA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr3797000wma.85.1637302529824;
        Thu, 18 Nov 2021 22:15:29 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:29 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] overlayfs: update notes on /etc
Date: Fri, 19 Nov 2021 07:15:07 +0100
Message-Id: 
 <0aa5133f3ef72680b8d4cd181db4b9ca07dbe8a8.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158498

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 3c0f4dc882..f1b8086ea8 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -31,6 +31,7 @@
 #   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 #
 # Note: the class does not support /etc directory itself, because systemd depends on it
+# For /etc directory use overlayfs-etc class
 
 REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
-- 
2.28.0


