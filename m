Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6448.1618491080493409022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IwEJugE3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j5so22232274wrn.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahcMnTl7/EseYs/td5zG7AB32XdU+0hd64bEqhiPgUU=;
        b=IwEJugE3Vok4QoeQu1p/vQ32+4qCK/Anm7L25rKX6gsYXaT4AoKR9DMgA+3zGKg7wk
         VuRn5aNfddUYF7LkX02g2k/LYSqlzjcyyCLqdWoKQ2FYc2gi1VOPzc0+DPmUvevS1WhR
         uUCy3ijKvOhluarkIeosCUE6YCURI7IotVCvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahcMnTl7/EseYs/td5zG7AB32XdU+0hd64bEqhiPgUU=;
        b=ANt+axP0NF0XAj4oMfhYdxuW94JrY/gT/ulVQ0VOQP4fA6F8kbdgoIikrHe4whTfB1
         Ro9lOLwwLfMh2Fyq2I722BbWf70hy4Df/iV90U9aSvrRzq5gVeJzOT5oGfjA+AkDetkA
         pZgauC7eFLL9C56XmJVcHZW2+yQc/YjuQ2Pt6z4uzZYwpXxtkv3aXhwLJ77lC/BYy/CN
         PIlYLvpN56kNsmyJJsoWsLQgkJJJVLce4W68nq68+I1K3PQToek3E2aJoyF6+QaJNP4m
         bcrfprk+aR3tiHj4V547EiGFbN/eZtxXH3QpsaXwMCPDrt6oPN9Xba3bLJJ6EmSi8IAS
         pDMQ==
X-Gm-Message-State: AOAM533s6y5l+xD1kF5vsCy+lxrojXOyb7J0g7UzxQPso4v7xxr006tc
	JYgFj43RGgaZr/vSEX/ymHAS2GGj43RmZA==
X-Google-Smtp-Source: ABdhPJyf/yMN9ASgWoJQqq/9zG8/QG36tMqZATZXWnXtAd1MHi8TYyHXx/8WfOZqnWDADpdKXY8mXw==
X-Received: by 2002:a05:6000:12cb:: with SMTP id l11mr3289042wrx.267.1618491079102;
        Thu, 15 Apr 2021 05:51:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf])
        by smtp.gmail.com with ESMTPSA id d5sm3672229wrx.0.2021.04.15.05.51.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 05:51:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Upgrade to add trailing slashes ignore path fix
Date: Thu, 15 Apr 2021 13:51:18 +0100
Message-Id: <20210415125118.1315200-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in:
  client: strip trailing slashes when opening an ignored path

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 17bd02c27ce..4eab133128a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
+SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.30.2

