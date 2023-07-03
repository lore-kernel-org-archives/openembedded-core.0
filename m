Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3326EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 08:51:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.22994.1688374277829719822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 01:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XEbV5zgx;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3121124a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688374277; x=1690966277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9eAE1K0zy2U3fpHq79TftvuZvpo5qAIWvMM9HpFGpxo=;
        b=XEbV5zgx9WH9FM+f7gt6J3gOLw7IcZ2swipXnK9iAukReVsKNOwZgWxtmMKitvUZcQ
         JD33zOlRVTOmf5RrFC7BYK8uNmF3vgOyqgszAvRNI75ckFqLnx50r9rejm6mdkQQiTbZ
         qJiJBzZDFV8ELdL0l4/QeM9r+YuXfifmLIS1mNymlioNBIRtXmKF3J2FMhHR8tVCgq2H
         JyY2JjDwSyDDpkvcDpxMoFC+RpydBxsj6NTMtUzBQteU5PzfwiGE/dKpq07R6bbMrxFb
         nL2DGgrVcYe+AV/bfxI2LjlB8R7QgEwfsN75bUwOhGWTlRWhX4/ITHqnQXp554TeZWQS
         RTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688374277; x=1690966277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eAE1K0zy2U3fpHq79TftvuZvpo5qAIWvMM9HpFGpxo=;
        b=MP7J0etqZhQUq3VJJN/ACr0JZBjf3kFrLnGpsDNKj4O9LtaFsegBO+PK68ipThC+4w
         BV720YHybpTCBbmGJxg1opdj5zDyFEyUvCv6nqjWmYfK1OyaksQuW1OW4c7hT4xuhdwI
         ZTIF6dzvWCz9qN711vgs8kzM6ui8JElqgpg5MYgrG+rVZgzI5fIZksnIKnGZTOBHkkol
         q6wdJIfDST8T8Cehy+9y975KOwAa/gQFmlvj06IULz5UxqjjWcFV/x9LZBLtMmX1tU6d
         WJbAmLStcozcuo/qRADAOAM8kTrHzawicRYs0OHQKoTa3yYZiLcEz82HYx1gPr+Bv4lC
         sBkQ==
X-Gm-Message-State: AC+VfDyziRFJS6k0Ta2PEoFImvz63k8ds6cOmug4hAXogVV6m7FwdKDD
	rSdWTiFoK6pGzx/7cfLq9AVRc14Q/yHe+68W
X-Google-Smtp-Source: ACHHUZ7j0IAf+jEwc+l7GM21CxLgMuQ8vb9dNaK2jtkRXcM4zlzm8N9x7p3mJHfGB/DUnK5wu+2crw==
X-Received: by 2002:a05:6a20:4c23:b0:122:20c:fbb3 with SMTP id fm35-20020a056a204c2300b00122020cfbb3mr10078875pzb.39.1688374276559;
        Mon, 03 Jul 2023 01:51:16 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:48e3:fac:52d:29ab])
        by smtp.gmail.com with ESMTPSA id z6-20020aa791c6000000b0065434edd521sm7457642pfa.196.2023.07.03.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 01:51:16 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-typing-extensions: upgrade 4.6.3 -> 4.7.0
Date: Mon,  3 Jul 2023 01:51:11 -0700
Message-Id: <20230703085111.3129537-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 08:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183797

New features and bug fixes.

NOTE: This is expected to be the last feature release supporting Python 3.7,
      which reaches its end of life on June 27, 2023. Version 4.8.0 will
      support only Python 3.8.0 and up.

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-470-june-28-2023
https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-470rc1-june-21-2023

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...g-extensions_4.6.3.bb => python3-typing-extensions_4.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.6.3.bb => python3-typing-extensions_4.7.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
index ebce6e8d4e2..887cece6883 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "d91d5919357fe7f681a9f2b5b4cb2a5f1ef0a1e9f59c4d8ff0d3491e05c0ffd5"
+SRC_URI[sha256sum] = "935ccf31549830cda708b42289d44b6f74084d616a00be651601a4f968e77c82"
 
 inherit pypi python_flit_core
 
-- 
2.30.2


