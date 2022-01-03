Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6259C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.30366.1641226802001338662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id i187so29633345qkf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=P+KG31wh1SiH5aJ0mTvyGdunJUFCL5cuo6/HCz73Uuw=;
        b=kPsqgbOE2hOlny0UyRVrdbpF9tPgTlPgDxDZ+dx48Cfr+5poFIbeocPH4ag5O4PhOP
         IxEof3ca2M8x3aCnaQR8drxH+ML7rWHiDYsYUPJDEbEgIVMVEDVYT/CmVPNVaDCiTEJD
         c7kaOAukjr18oehVgFfAbogejBR1k+D3tGx6JXgaxx6MFqwsbrXmI6yKJafbo0Xc8gy2
         a+kJZqysjbvsNeKWGrlAKD0S8coPHUowwC9GeRt5WsAZZVUYaWQa2XdUg1WJ/dT8T8UT
         UMDMhvlUZmAmeBo4b370veVi8MDVv5L9kyYO/GL+T4PwDMs4ry372bxHFLVq+BBzL7Az
         qdpg==
X-Gm-Message-State: AOAM531nvf9GN9eKRS4UCqdC5yvL4tSoNS1KFk6E6TQcfR4bOxFv10gc
	8L7KTF98rKhVOgg9VAtw2lOsmQiMp8utac/9
X-Google-Smtp-Source: 
 ABdhPJy2rZ9zxAjYjbYzennhQSUPePJjCzXJU2x2goYt+KuegulGJ6OhDbafA6kX2RGlpk76YA8VCg==
X-Received: by 2002:a37:a2cb:: with SMTP id
 l194mr33361106qke.774.1641226800623;
        Mon, 03 Jan 2022 08:20:00 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 o1sm30383420qtw.24.2022.01.03.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:00 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 18/24] python3-pygments: upgrade 2.10.0 -> 2.11.1
Date: Mon,  3 Jan 2022 13:18:48 -0300
Message-Id: <20220103161854.301148-18-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160135

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{python3-pygments_2.10.0.bb => python3-pygments_2.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.10.0.bb => python3-pygments_2.11.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.10.0.bb b/meta/recipes-devtools/python/python3-pygments_2.11.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.10.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.11.1.bb
index 3c1b5d15c3..a110122501 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.11.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "f398865f7eb6874156579fdf36bc840a03cab64d1cde9e93d68f46a425ec52c6"
+SRC_URI[sha256sum] = "59b895e326f0fb0d733fd28c6839bd18ad0687ba20efc26d4277fd1d30b971f4"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.34.0


