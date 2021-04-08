Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.161.1617899544504750565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h8VCyV62;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso963623otb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JImC1Lqd/a54etJ3kZtZSceTw09e4ArXM4BsfS2GwFM=;
        b=h8VCyV62L7Rug9Nm+4TWQ/j2Ikwy0qg7+enQHe+WFey9yryisjIj+OI2BUUFPFwBLG
         1xUMbkD/9OmyZ3tUPLyAzDDywJgnJpvJvtXfSkNWZdsrUv5WxCMcSs/YJSl7nTlrFdTe
         7B1m56Ugdj0TGr6SJLqBGfSSKiFu1XHBhC/LhMGeKRBEQ6Ni34hLPMkCxTKiNfje4KtW
         gskGoyaIzK7sy6t2J2HF9tqrIUljhnOUdmeZYvk/4HCWnHMYPrEjj4AeWW1q8+OF2s9H
         1UCeirb3jQDfS7B7a2beGEQ13PgyrB5t6JcTzb5XAwib8e4FTmlkrjrBdluRDo4UDMCa
         yHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JImC1Lqd/a54etJ3kZtZSceTw09e4ArXM4BsfS2GwFM=;
        b=SXHcWVjHqtWGLXVoa3R3wGg+wnAW1MTo8asDkqhFPxEReo9nb2xvMxdr9A0D3VZ+3f
         oyaLWpMrY5M5xbOG4UYd9mhojHxi3/S59vZ1gdLRLe4P5vH9UlLZWv6JiSK2FgWLnZdc
         EFgY9AR3aprEO7r5I9/4eUMbLhjk1icos/2CqvhSLvv2+DNddZF0u+XbVaBgee6Z2DHv
         s9VWDeyAhWcdoSyDA9tXvywWUMsmeot27xBTO0h9UYcELyCkTClvUDi6/p6Xu6SUXQtF
         sianS/hv7nGUI7mtHBHdTsNoXO229D5Kfj7daiEHcN8J14P0eJYkjC47JLQyEqAPYJ5T
         gq2w==
X-Gm-Message-State: AOAM532ZLVEugmPmAX2Z3v3HhgzKBe9tbK6dOGPRSc1Ka8CqSD74PHkr
	nEYKzKUym3Sd8aD1H6Lj/MpaQU6pj0hihOD/h34=
X-Google-Smtp-Source: ABdhPJx/VKSsaX6EDzghfTbELnzwWRlvhisGWgy4UOeCzt1JiudxFQGVTb6Oro3oNda6KdYq1r+6gw==
X-Received: by 2002:a9d:37b4:: with SMTP id x49mr8371466otb.237.1617899543282;
        Thu, 08 Apr 2021 09:32:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] image-live.bbclass: optional depends when ROOTFS empty
Date: Thu,  8 Apr 2021 06:31:09 -1000
Message-Id: <612ec1a471695638e0bf3f6b68d40522843ab188.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guillaume Champagne <champagne.guillaume.c@gmail.com>

`ROOTFS` is optional. It can be empty if the live image doesn't require
a rootfs.  In such cases, the build doesn't depend on
`do_image_{LIVE_ROOTFS_TYPE}`.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96f47c39f1d17f073243913d524bde84add41d8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 54058b350d..e9eba1fc4b 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -30,7 +30,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
+                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
                         "
 
 
-- 
2.25.1

