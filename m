Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBD5C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:45:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.28329.1690127119333868379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UhrrV8hn;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68336d06620so3410462b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690127118; x=1690731918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujkwumUZfAY+oV9Q+4uGUPZIVZAmu2dZR0OnZSgPdaA=;
        b=UhrrV8hnrx3AoikvsI81vj+gdMYytVGbhCLNVk25ay69RdKRKPtxhC1INNUFSuRtEM
         mK6wALn31znRJtn7FS3uyM5A2MLmAQBscbH/mH7JaOQRTqKrgfddkguBGEgDtIX8mB23
         a24tG7b9Jrg5mq3UYO4d52O9EfCngdpd/P7sZDtUPUeTeuYC1ee5HuTueHQmoYRZ3LcG
         GbfAvH7TS/JkO/fNOqbtS/tfX7yTwmyw+IQ5MBKseKCygJjE0rJXWnqzFCV+mAsBDl2p
         c75PQ8B5WZOpHZ/T8eSdTeQbtzk+BLzvYdoVPgJ2flwMBZ5pZnG6RaDAUhbvE6iZLgJl
         wDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690127118; x=1690731918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujkwumUZfAY+oV9Q+4uGUPZIVZAmu2dZR0OnZSgPdaA=;
        b=SEjpEZ4SLmJSBjNRKQ3uHrP7uMWY/kfiiKt+1pwoXZXzuer3euPu/ivfdxwByQUezE
         Mt1af15qqZFyMP8f39wKsI0+5UnMrqERPGK5dFZOyaYG2UMohuHbe5RHmKWDoItkb+70
         zdjYv/oTBeRnnKt9DJwREUlUqhFLithX+cu8gLSOtqtoBzJBn+DwfwmjR7yIyQkvKUZS
         rufZS0Awg1bWhlLqqucsGsweIttGqADBjeSNk0MnNjH8wg3kKdMCaoTWTneTNTsslNpY
         qc3XYE842EQdLaDcvuEfYzZi9KS95c7u7KPjfKBCPC2RZ+zCDJfMsM2/rypiFYLMlcFF
         lEAg==
X-Gm-Message-State: ABy/qLaDhSs79/6GfdHiNumHF8ZgqtRBseXNHr/gsfxq3rduQPdLcOOS
	4j9Yzp00Aej974MlbXCj/iJ6TYOcvQU=
X-Google-Smtp-Source: APBJJlFEkTzlB6XpRSyd/JVk21VE7GpQVcLi2BhLCa09Bb+QL5fhA7hO5SUD5NWbudmwPF1Tq5MF3A==
X-Received: by 2002:a05:6a21:999a:b0:13a:43e8:3fb5 with SMTP id ve26-20020a056a21999a00b0013a43e83fb5mr3579499pzb.51.1690127118169;
        Sun, 23 Jul 2023 08:45:18 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:9ac3:5615:a7a6:3dfe])
        by smtp.gmail.com with ESMTPSA id e2-20020aa78c42000000b00666e2dac482sm6106026pfd.124.2023.07.23.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 08:45:17 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.81.2 -> 6.82.0
Date: Sun, 23 Jul 2023 08:44:32 -0700
Message-Id: <20230723154431.3967246-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 15:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184758

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-82-0

6.82.0 - 2023-07-20
* from_regex() now supports the atomic grouping ((?>...)) and possessive
  quantifier (*+, ++, ?+, {m,n}+) syntax added in Python 3.11.

  Thanks to Cheuk Ting Ho for implementing this!

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86_64 core-image-ptest-python3-hypothesis

 ...ython3-hypothesis_6.81.2.bb => python3-hypothesis_6.82.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.81.2.bb => python3-hypothesis_6.82.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
index 93bf638759..0aeeae1019 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "e35165a73064370d30d476d7218f600d2bf861ff218192c9e994cb36aa190ae7"
+SRC_URI[sha256sum] = "ffece8e40a34329e7112f7408f2c45fe587761978fdbc6f4f91bf0d683a7d4d9"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


