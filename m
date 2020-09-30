Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.5243.1601500618176084748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g72so3052193qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=3pbHKZeLdBeTWQlNG6eahTECzf0JWsaTAMLFtuwygig=;
        b=f39QzTO85krmWEhBj46mYPm0jaAue6vYvWfZ6/9zExi5XNzcwQUAzYu3Nkm25cuGfP
         pSsAfOS3qFUbPtAvgxAHp03GCmng3JGde4wHFDAolD8CFz0/l/hmY36ztWniB9Wm2zn2
         FI9qJygfErE4LFbgkBPqp5zEfPGVfhUbDvTumKgfmSMiK8zh9W3iefYlktg2RBeejMlu
         0Nm8BYhojeR/BNkJQCw7Fejz42/j54KFbVGgMzoc48o675VKmf4rwcUVZEoVxSyXQhDE
         xYXzrOB6HoUOKjzy3sfn+vlKGEj//zmhjmVouWrOJh+SqVyRWJuW7eoc1SKMNCsTtHiS
         +SDA==
X-Gm-Message-State: AOAM5315Ul4x26Mr0oZRjLkCiHXKmqb3Bgc4vDenoX6fbJBN1++eWY7U
	BHXUdoIhu+JuRljS1SGCGiKoxrEGEOwn2Q==
X-Google-Smtp-Source: ABdhPJz2G50fyAX6l29D29Z/n5nCkp/1/hs8HONpdZMfd3gLPn0Y0LWrxLXOHUzzVnboSQ703l0YxA==
X-Received: by 2002:a37:7805:: with SMTP id t5mr4621709qkc.157.1601500617011;
        Wed, 30 Sep 2020 14:16:57 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id 16sm3676744qks.102.2020.09.30.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 14:16:56 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] weston-init: Add environment file support for systemd unit file
Date: Wed, 30 Sep 2020 18:16:44 -0300
Message-Id: <20200930211644.119920-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Fabio Berton <fabio.berton@ossystems.com.br>

The /etc/default/weston file is already installed and it can be used
as systemd EnvironmentFile.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston-init/weston@.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
index 0a1df15bdf..ce8f4fb71a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -29,6 +29,7 @@ ConditionPathExists=/dev/tty0
 [Service]
 # Requires systemd-notify.so Weston plugin.
 Type=notify
+EnvironmentFile=/etc/default/weston
 ExecStart=/usr/bin/weston --modules=systemd-notify.so
 
 # Optional watchdog setup
-- 
2.28.0

