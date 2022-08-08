Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F041C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.22461.1659940995760274244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=amVU92XI;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id w19so14805528ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/kGzuyZREWwTYB0b8uS7syLLkNtRukMexzeVtRuZJI=;
        b=amVU92XIJleLGlY+N6RP+SwN+xzsfv7FGyNprAVBliEeJX8I5Md3fguxB6vM0qCT1L
         DFQ7Q71Sy7Utmwgm+Syu71vp4aQXtNX23hlxajYObaQTdVjXiQKWuqcIrdGeyy/+SY+9
         Yq4uR95Vn9JvPm4UfIp5sYN23zPSLTlyk8RmfL4LggHMPy1vw1x1U0akGQt6mEx26dvE
         GXI446pZ32rUMVdvI2VxryuTlIZ5jH5ozAFZWEu6LaoJBKDRjOk0lkfKLKNNHDNVqf01
         Fld8jkzTLfNwsLYhHn0dnp0GJc7ZU96HrtXAvNdDX654D3RG468PnuvC7MsS9pxBMgtN
         wX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/kGzuyZREWwTYB0b8uS7syLLkNtRukMexzeVtRuZJI=;
        b=T98x+5ds6Utwq69Z8rzd50+xBd3OcE6obLM8Wtx1zCVjb8YaqbXSGECLu2raKqr1bJ
         T7PfpKjxUvvwXVmLdTzkuRZrrT4x4g6LLHg+cxxRXdhrPMZOEiCGM0HhdQqgHI1UIO3M
         hHaQlmzJ7EfgFFb4ubcCJ7o2jmp16eEwJ1HzLME22FPIoYWKjOUgBNkwdlFue3Kh/GFA
         i2HodEArl/neCxhuxiOhPoH85eegCaWLEC5sefMpDf/K/XH6byQu05xmwTZL2PXQYz2A
         F1kxsiMVmG5cycAUFA0adpJqaNDDsfcKEpVMvwViTvVtYWgcVqvbgFqNZZ7dhP6fV3SN
         LA7g==
X-Gm-Message-State: ACgBeo0ClZR9rowWFpGIns5jKvrd8SMooGCksnoA7MnaEOLX3ONZsn70
	8mppcS3L7/lCecYwgZgs7Je/piffy4c=
X-Google-Smtp-Source: 
 AA6agR7zPL7bJotGipgYrNojJ5TuYjIOw1aZx5NcTjtrvpad9b8Oyyr0fruJ0RLLEpb6KqeU9CAZ9g==
X-Received: by 2002:a17:906:5a6a:b0:730:bc8a:57dd with SMTP id
 my42-20020a1709065a6a00b00730bc8a57ddmr12433846ejc.301.1659940994316;
        Sun, 07 Aug 2022 23:43:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 38/44] python3-sphinx: upgrade 5.0.2 -> 5.1.1
Date: Mon,  8 Aug 2022 08:42:31 +0200
Message-Id: <20220808064237.3975347-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169062

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-sphinx_5.0.2.bb => python3-sphinx_5.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.0.2.bb => python3-sphinx_5.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb b/meta/recipes-devtools/python/python3-sphinx_5.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.1.1.bb
index 46cc26e67e..1bef20c2e2 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "b18e978ea7565720f26019c702cd85c84376e948370f1cd43d60265010e1c7b0"
+SRC_URI[sha256sum] = "ba3224a4e206e1fbdecf98a4fae4992ef9b24b85ebf7b584bb340156eaf08d89"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


