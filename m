Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.769.1603381969247600898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fz5S0cnW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id e7so1373374pfn.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1qg2vx67D52PcWXWa7TcL7P2SYJyh1wdLivBYnv/U5U=;
        b=fz5S0cnW2sffJy/qh9cvsJZNaBIO2avuTXCjTye94X8OdpzyKBmAGIDRqsgu40cxem
         nrnxUczTgkhffaPpOP9SErCi1WwdiUOv6xC76nMzRwpZoTF03slxpoRGi2sF1AbpqtQj
         eu7LhS87TcAGDrHyLQkACiRoC/cmsw5Teho+ZsoP0b6qFTM7arTbLU13HlngWwz8egbB
         ArmFtWRXDn7SNt/ZdaD5vvRzaHuC5k492/IdrRzeok7lOajuPe5MsZKfcrddKV3VKzBO
         0oxNHqeRH6zYOjsCWFAVflPIUIwPiPAsja4ET3eUdrDOnZ+AHMMpcmL28ttSuUPkDRJY
         s9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1qg2vx67D52PcWXWa7TcL7P2SYJyh1wdLivBYnv/U5U=;
        b=WbaudA2fj3FOJc0+eI3TSUDwEiWxkF8P9BaQTbpbyylzoyrw+f5R0OBlSSq4YS4OsJ
         r2UjpNJx2zVDaxxKJUhwqWGbahairj9vGPuUb9FbOlfgcUPMAthPuxQISnIYY16y/oT5
         1l+qsKuPmKFBmEBJR+rTWYWWUibCx/uLKcqzZ8Hk6sDqnGOXGuSQyZjpQNKtapqQLoz9
         I21/AvgTvy1hN/tBiYVH/iEcpekbKSLjB9hO5koznFzE+VSAZ4YFl+A8n2a2jxey59c6
         uWW8pXJllr+QhV70BZzdN+veE+reYnJzJL+tI6dbA0GIH8N1FHBTQXkWOjs5GZ1xubYQ
         ywYg==
X-Gm-Message-State: AOAM531G/y2hg/H2Uxsp9bQnx3R5eoTdrB3lBa8BLQdx+i9lw/4kKgBj
	ukIZKgHnfvm0M90j6LIiE7SM3g+RJ63iYeL1
X-Google-Smtp-Source: ABdhPJy/3AFWlwwuVoIYDwDmg6wEX8Ysz1RsOjs28E7yqk0KZjFx7u6cBIJaYiV+jgUj5+T3NrFNyw==
X-Received: by 2002:aa7:84c6:0:b029:155:d56e:5191 with SMTP id x6-20020aa784c60000b0290155d56e5191mr3142618pfn.41.1603381968335;
        Thu, 22 Oct 2020 08:52:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] toolchain-shar-extract.sh: don't print useless info
Date: Thu, 22 Oct 2020 05:51:39 -1000
Message-Id: <1bdaf40c02791fd2c22c19414f554a3c8d26e476.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

useless info "gcc: command not found" is printed when run
buildtools-extended on system without gcc.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 289a58ddbbd8bb3f5ae0d3421cfe8e75b60b0fbe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 04527f891f..bea6d4189a 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -26,7 +26,7 @@ tweakpath /sbin
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
-INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
+INST_GCC_VER=$(gcc --version 2>/dev/null | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
 SDK_GCC_VER='@SDK_GCC_VER@'
 
 verlte () {
-- 
2.17.1

