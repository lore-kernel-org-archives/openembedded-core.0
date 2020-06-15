Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.26479.1592249762970154707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Wr0s6BIg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id y18so7217530plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=347Rf7CpZZdzJGXHSXBEGV/InPPK8XNCpavMGtHgNq8=;
        b=Wr0s6BIgA4Fq1jiEAWoe7kiKuxXDKO+D9ckALYQWUVhvAZxbibTqPUw/QK5j+BT5jV
         9G8ge1xHYmK5I+zvJpypVnyxiWTCeG+PWw9GjKRkzqMlgVQ6dWl1ykVe6x6wj6it02q1
         UZjy3soipb3wmn3TAJMzvVuG6OlHUeACudgoYyKtRWy1ENR27u8U4U2v1oB07EdUuEcD
         3wR65TNt2B2uoAXhijvUp6CUUtr7v8TqyWHva4Vs8elQN9dO6tuXnw/kP9LBGyL0dm8Z
         WzF4ahKPtNjQSxCgYb0AQlowpWFuItJr1/YRKiTphWNVvTAREuXfst5Hn51qIVGaksSQ
         CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=347Rf7CpZZdzJGXHSXBEGV/InPPK8XNCpavMGtHgNq8=;
        b=cWjbFaGcEUxGzOZZakFjfOyYv18yYxFqUgD16KgOKw5LyWntFjMkcqIzsssfcRXr0k
         0ZQGUfdDeHDz1GgcwOG4IkZkdUh/+9OkcPmtBk0+IotLMFsxowNqeJUxaJ9i1XUvsfTW
         Eu2K107GpFUFM3up7FG1QQX2hwe+BhKqvgnUQnZmcpeMLVzTambexlTxWHZ78v+ZRKEy
         ARvVtgzJYN0NgeGh1lJtCXeAfOO1VJPzNy097xu5ElQqZ7U5elCd2lBE/lSlOybV7oYG
         10oeDeNUsiewGjxTYeDH28Paks2mW8Yw8TR7tbgaAAhhJao9ECl7ytAkRhHLbeckGnMb
         Loyw==
X-Gm-Message-State: AOAM533JTUox4/FZy3m5Un7yhZfTw3RzfqfiZKNfKWqWGCbRvx57qydv
	S+JOez0Hr1yKSGv4CMaRTQaAAU8n+vI=
X-Google-Smtp-Source: ABdhPJzlNzrrUMQeKtiOofvuAiQ9/aAt88i6WytJsH2fsundWuT98xtljJsGf6mXV6+d4KGT0xEQ1g==
X-Received: by 2002:a17:90a:336c:: with SMTP id m99mr784773pjb.168.1592249761879;
        Mon, 15 Jun 2020 12:36:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/21] core-image-minimal-initramfs: keep restriction with initramfs-module-install
Date: Mon, 15 Jun 2020 09:35:20 -1000
Message-Id: <176da1d6fbd006c770c3c02c6355a692adac3c74.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: hongxu <hongxu.jia@windriver.com>

Since commit [882ae0dcce core-image-minimal-initramfs: use
initramfs-framework for initialization] applied, it should
keep the restriction with initramfs-module-install

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 295dbabce213855432b6274026e3b45a18b90e80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 7df8ab1ebd..83d0eaa8df 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -27,5 +27,5 @@ inherit core-image
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-# Use the same restriction as initramfs-live-install
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+# Use the same restriction as initramfs-module-install
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
-- 
2.17.1

