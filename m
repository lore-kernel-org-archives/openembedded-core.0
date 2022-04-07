Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C1EC352A7
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.1092.1649350862288336802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MSKezsDF;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id l26so12211085ejx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I86Y8zrbV70fpaci/V9dYzHfinRg2u2yKOISCbz7O7E=;
        b=MSKezsDFsSCGy+KaSZV4vNpKQ8/mtrRHhjNUd7v8DfzfpbMw1+rv1YzRh+5HrFTdDw
         HzcqrgMa4UbZQML1936YkF2IxXDjr4ZJMIzY9d+9kicVNra9T+hR3wiFSVEVx0v5UQED
         u8YYlk0JX6047HC9IQUDtU1KjEkrImJARhGzcDC6ONwh7BD0HvHUGPUV5k3nw7RlGAml
         yughpoqdkn93RQZGHKKCvPaEMhfVQF3XbwB2O5z+1FqQHw0gnmt8Jx4uAxg4c5u1T2SD
         Ve0W1K5AFNnjwJ+FvqCrSt2QqwjmAA+u0uhzpah0CRHmFrZDlO1mB/W23Ql25vdDZrH9
         Nt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I86Y8zrbV70fpaci/V9dYzHfinRg2u2yKOISCbz7O7E=;
        b=374C4eCLTRhbwei2kdZoER66LyrgBmCtk31V1+Jp1JfD8qrjkBSMhsG9XlrmJg7/Ts
         4dfrEtxRZjZJaPfsluPk3KJRspVem/9iswa3hqIQaII7ejGuD4UMVBd2+ljv47RpcsF3
         W+mnYCwJ1WE5Lo0VbPjsTGeiN1hIEF2ODUUG0tE3ygQbwLqyXiK0jcB1tNqZFqjPlvPd
         FozacbsSBgs/BXGTY6cAJPTxaql43uEGE+HjYGQP41U1BsCKIEuo5h0qqE+Zai4lIL06
         orV3BXeS9lYd1J/7UIya4cfgjOJQuCS+Ntdicf3eIxAhiWjYT9id+ZN51KcC4nVbZWny
         7u6w==
X-Gm-Message-State: AOAM533M9a88p9kNB/TDHoDSWUNW/vUZPnss/Eo7wRYkJNuGivCiS8G9
	JqwUwmaZ9fzh/xszgjLZE/YqEpNAyug=
X-Google-Smtp-Source: 
 ABdhPJwdoTp64pVm++MIegpQm3dZxW7H+n4H8riq4KY40BD3G1FbI9KnnFdb2ZnCzYm9qBNn0d5k/A==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr14362095ejc.459.1649350860689;
        Thu, 07 Apr 2022 10:01:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/17] python3-typing-extensions: upgrade 3.10.0.0 -> 4.1.1
Date: Thu,  7 Apr 2022 19:00:29 +0200
Message-Id: <20220407170029.3500874-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164133

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
index a8e83fc824..6c80a8b237 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
+SRC_URI[sha256sum] = "1a9462dcc3347a79b1f1c0271fbe79e844580bb598bafa1ed208b94da3cdcd42"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


