Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.36967.1622412544407687047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=elnxxIyc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so5416410wme.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i2Kmu3vL5cPeOgtz5jmXNMKgBsz59uD7ZWN2a4HI/0k=;
        b=elnxxIyc00CmqLJvlgcTmVh6dUNzEZ0WM97qFccYvo+mwyCJqXaGm+djui+tpL1Rx8
         kTNYVcMCD+FhC/Lm3OP6imMy9eAFAjpC0AjpLN+5YaVFO5Zt7ObboegtnyN//boVcu+V
         AErnB5UL8bbUktlrE8+4IWJGFIeIo8an1hwp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i2Kmu3vL5cPeOgtz5jmXNMKgBsz59uD7ZWN2a4HI/0k=;
        b=iiO01FFDP83PvhylGgT7L5NcdlzbLaM38nIb9Igw5Ke/cNGxv6q+CnwcnHMKFg6J7c
         JPK/NJJNHQV1K/EwPJorIcYQdzci4xNQOEUmq5r/dYfDKDitKy33StJ4D8E+X8tURhnA
         NJDgEw3WIrA9jAOJ6bmL8CrrnXXf1L0shOsB8qvNmeafx2MeyC9MErTJFX+0WQWjRR5T
         w1Zsk0MH5t27UH4Ss4LC+QQre/BpAlUTX6KeAuPLOUJ5X421+zWMsFnybMBxu/Ja2ID6
         vtwhCwIBbtfW/kaqHOHoO3FnKACaomZ+E2HyTX8N/ZzGGrq7f+5yNl0XEpvk5ZIwbe4M
         pNfg==
X-Gm-Message-State: AOAM531CzUcwibvo2SawnE4ESnEPmfii44Oh2bJIS7Bjqd8GjWZNjjA9
	rS5PdFP/T1I8/pxLpigICQohR6e/675U+g==
X-Google-Smtp-Source: ABdhPJxX9L3uQAv0GH4ZYRucvrAcvUD0Hzth6Km3thqxvBUxN6Yac1TNohWhhVmgYHxJiXkbP8ZKLw==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr18351529wmi.69.1622412542948;
        Sun, 30 May 2021 15:09:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:02 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/16] python3-jinja2: upgrade 3.0.0 -> 3.0.1
Date: Sun, 30 May 2021 23:08:56 +0100
Message-Id: <20210530220856.2830501-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-jinja2_3.0.0.bb => python3-jinja2_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.0.0.bb => python3-jinja2_3.0.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
index 5ae8d49b530..b37a043ccb2 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ea8d7dd814ce9df6de6a761ec7f1cac98afe305b8cdc4aaae4e114b8d8ce24c5"
+SRC_URI[sha256sum] = "703f484b47a6af502e743c9122595cc812b0271f661722403114f71a79d0f5a4"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.30.2

