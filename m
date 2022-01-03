Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E951CC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:14 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.30116.1641226813950621838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f138so31705984qke.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=/C5/WeB5Qt5zOCYb3e79AWqXJKTU5JKzOeWK3B4VIRg=;
        b=6IhghE/dAx7bdKmhIIOU6fe5ChmKi8VxrqHHM4YJ2g6Wak3auJs4+kDaURICQhzudf
         nKxkO0Wl9aPX+feSLJuO7ywUjRTcflLj2Z8HY5KB6RpOa4IP/aeV1Z4pINQ9J4Tr93Ud
         pxE+FI/IP+CFy6qFlXycFfsY98J+Hwl1CpMhwm9XB1uA6R67/sav25XCxa/7fUi3Txu2
         0fodIrUOjYVW7sZwXpMhfRfrHbcxmuDfDLSubU9w8sQhxneFemZ3jEOU2rD06dPwCzlK
         naNJCmm/TMPaWeLnooKYbvWqrvwoz/TEbgWdG4G4UcM6cCkyqxowjAe813+Imjzh34Qr
         gs/w==
X-Gm-Message-State: AOAM5330yw/dRtNfmP2nvo3WaCIkAIu4gwStUmzalttXgygmOonMnl7f
	Q4rn/XNkxVcMsg41jYfAwAtPjNe6y19I7PxG
X-Google-Smtp-Source: 
 ABdhPJxv0BrLAblrGTVYhBPu/KfFm3HZ75dMyyPUc9u0LcfHTuGCSOHLz/Ap/HNOoDw1GmrsE1eNFw==
X-Received: by 2002:a05:620a:2444:: with SMTP id
 h4mr32264756qkn.398.1641226812852;
        Mon, 03 Jan 2022 08:20:12 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 y15sm27787706qko.74.2022.01.03.08.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:12 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 22/24] python3-zipp: upgrade 3.6.0 -> 3.7.0
Date: Mon,  3 Jan 2022 13:18:52 -0300
Message-Id: <20220103161854.301148-22-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160139

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../python/{python3-zipp_3.6.0.bb => python3-zipp_3.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.6.0.bb => python3-zipp_3.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.6.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.6.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index c98bc7a3a4..9ce987c870 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832"
+SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebceafb87d"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.0


