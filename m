Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.37034.1622412541215171756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VeqQB0kU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id o127so5127202wmo.4
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kYt48D75CLzwnTtZc61o198UJ7/NlqmqCaUXp7sKU4E=;
        b=VeqQB0kUaMAeUyZthkqsd3xXZNE5RbbKWymfNOtJeQ/o20JTAK0Dyfu1oRfEQrGlWT
         t642IZHejwBL1egybGWV73vVBlV5IPJTXo0LRHaQ+uCyGTiaZb2+cGzrR/C69YyQF1KX
         IIH0mOcR3Ycn9PCXURhBfybrXsdlt5AyJEGyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYt48D75CLzwnTtZc61o198UJ7/NlqmqCaUXp7sKU4E=;
        b=avbsswJasdKb2gt95WYa8BbVo8dSzqkE3Ht1JUx4Uhd/rC+GRgbO19b+PEDRAOgrpb
         rSmp8CVCLLrybalKnGCXW5xitYQ879VQ0dCZUF4QUq7A8idLe43nkL9aMsRk9fr6ZPkR
         881+mRMytMAJU1s5v3qbiiskWvR3byS/94wrZh0nvUuwMNw9oUeEDNYNgivpvpLh0WzR
         1u3vlV9LzvvjdbeeL6Xuwq48Uf8tmLjwJ2U9Nr1sqCragCikT+GQybaCftIXE5Tqkych
         ZceHk0tJatfT9EZ+xoK6/SuQI/LK5T037WY5EaL5gR8mjbPwjIp3P8GLuUeUTGAS0Sai
         KilA==
X-Gm-Message-State: AOAM530jyrT/coAnSeF1AdMcHjnAmSw6xloUwOEt9Pe9CdJZj3ORvkkq
	BV1PKLh6HGtTZUUyUU0nt4+7B9xKLSVo0A==
X-Google-Smtp-Source: ABdhPJwkDGNMXmF7FZxMNRAUTzeGrmoIaojNTzFO3AE9uzLGhL7SMpVexLOP7aR0cUp+AqYXdtViRQ==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr22963157wmg.87.1622412539748;
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/16] libmodulemd: upgrade 2.12.0 -> 2.12.1
Date: Sun, 30 May 2021 23:08:48 +0100
Message-Id: <20210530220856.2830501-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 2f60ce8e028..771b2c094f0 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.12.0"
-SRCREV = "aaed38c899a958a88a6a368a70510e350ebe336c"
+PV = "2.12.1"
+SRCREV = "c0897fa0e9d7d1305fd4813b1010c1d4cca42346"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

