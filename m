Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.1176.1604335824634744215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NvkaYmRu;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v4so15067909edi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLxuw/yxEq/qH2kmbd40dgfVslkycA5i5PzM28JZxmM=;
        b=NvkaYmRuKUyCGmXDU75BJ1wW1Y8KgtkqCKSAIN8mn0NCa9Hfkf1rv25CXv1atJb5dr
         1gxfXieBRMEuzmgeFbWtr1/0vCFcnNmA0bk6fzTPzY/JbSxXOGCJiLlWeOp/Zmw/BpqS
         3sCztjzTBxhjLXTxsILPjmb10FMj5/sLHzkAEN4UvqdLDxMxYvbVYDnqBRBRWxikA4Dr
         EWq2YGypGocMAFia1zGWYBWoTjHamEUSxD07KBQb5dthIf1Bhm0BXsupNV8KfQosX1NF
         +WBPwT/gW8fzFL43TEihc2Dp2Yn8IPiWGdxKmdDUh6uzJI0Mmg40PIzFiuYvWSeBnjRq
         /HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLxuw/yxEq/qH2kmbd40dgfVslkycA5i5PzM28JZxmM=;
        b=gfqtr3p8ygfRhMQfQceiBph0lVJO6KrQOHJ5m+RbG0lTvRs0Yb8mrhhk4UlN9taF1Y
         nte71B2wJIPOdRx4M/lviFxjUXSh8j6my8/n4M0XbbTdstyrMffrEApnFHf9IM3quJkZ
         DN1nPPMrP6HYNF6TOAO0bhZnA4BaRjM5pi1TTdBrJKKvondjfqusCm7jcyxlZiK1pU30
         AblzW7G4E40hdtH0DyaABoq9viVQpCSC1OTQU5xwp/xq78GTyY+WlNXM2tQ05IwOiOBZ
         VVhcT4xXFgXgyKfnOpGTI+EdsZ6sQNVqNQnxrT9gyA1UZI2hM4aZnkfBjsivltQCa+7u
         JoYQ==
X-Gm-Message-State: AOAM532PGjyZoOiAFhyCKlbxgV+q3biJcVEkhuc3uCU6Z/Sc1Ud9zX1D
	ZdQpnuPQ9PM92nUUnSHomfY36wbX5zU/MQ==
X-Google-Smtp-Source: ABdhPJy6FanCh5dxShLJwcX6MP2fPFkPI/ahemT8JOzaQn4+4+pSYjhNaFffme3p/QYVcfO2ZwDQ9Q==
X-Received: by 2002:a05:6402:1b19:: with SMTP id by25mr12730475edb.108.1604335823049;
        Mon, 02 Nov 2020 08:50:23 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:22 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 74/80] libassuan: upgrade 2.5.3 -> 2.5.4
Date: Mon,  2 Nov 2020 17:49:01 +0100
Message-Id: <20201102164907.27572-74-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libassuan/{libassuan_2.5.3.bb => libassuan_2.5.4.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.3.bb => libassuan_2.5.4.bb} (88%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.3.bb b/meta/recipes-support/libassuan/libassuan_2.5.4.bb
similarity index 88%
rename from meta/recipes-support/libassuan/libassuan_2.5.3.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.4.bb
index 52b4c0f1b9..e83f571183 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.4.bb
@@ -17,8 +17,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[md5sum] = "226c504ea78a232224bf3b6846b3adb9"
-SRC_URI[sha256sum] = "91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702"
+SRC_URI[sha256sum] = "c080ee96b3bd519edd696cfcebdecf19a3952189178db9887be713ccbcb5fbf0"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.29.0

