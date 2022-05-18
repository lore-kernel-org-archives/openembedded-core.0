Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53669C43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.3441.1652871571559419393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+Sq9VSa;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id fd25so2502305edb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uxMa+qHIiysSVHvHdILIiaOQlRfVOuLjbv8TOSfZLY=;
        b=M+Sq9VSaInwlaWQazFb476wf7m//q6XSX488voIkUdEQZJU1Jc/b2hCkRHwSb+NWdk
         RnPAnqyPXdHMEJIQpB19T7vJyZbHPUteVaxRToWSymRqh9up6wUPlSzP+TEpvm1L27Nd
         rCxwiIoBahKm/Mi30h5DLmlzhAM7/YoH+eOTx6FANqwmTURHSw1vo7imukMseJYUooMB
         G1zaAQdpVPy0pi3moSs6mdatLPgjq9oPm32syPei0FzyuT9jYd44R2XhFdfhgf+q/7IY
         pQ5xaH+k9sO8LqXOEQV0tlGa0+ek8U4I5iOez+1FDViuRnhxqO5aa25tDtOjV/5H/oVs
         MKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uxMa+qHIiysSVHvHdILIiaOQlRfVOuLjbv8TOSfZLY=;
        b=qWJCkPzlQld1p6KDHdTdku3CYiruxeW6CUgvVoMcGfy4N/5HB1BM7XeIPM0kQgfDgl
         ZbT9XTluNPnwDJavwjOazGeFYPx50VjOi3on5RRE+KZEdJfjnl/9JPieBhyLvg3k8X68
         JflJu9tJADaYYo4vwSeZRZ22gv6oKlG73sr7PyNQbyhUisi+Cq1+nfdHRc/8IqH/Rt/k
         Hk5aoIbpQhIHtRQ2UIwdIXgLA7+abONRf8XfXIAw/og6YJJNqcStKQZhv56o0kLYY+l6
         NXfVBA1yltVbw5ch2WYrripUSG0ZCSkRTtvHfLxzkTg8j0GAkjUpMpS5y2l9rqOjMMq6
         JLog==
X-Gm-Message-State: AOAM5335MjumqweLaSlaQErrZikmZqS/yaSWeGb7K4ucnQe/jrAuA0Vi
	3ziO5NcslngZe6UlamDBbaWWKKzwb3c=
X-Google-Smtp-Source: 
 ABdhPJz6DkYpWkLP5o/9f4zBp1AaXM6e6H4OlPbSUHk/Q2FOS+TJVGB8wSzCN0OG6gRwToVBj4Ua7g==
X-Received: by 2002:a05:6402:3508:b0:428:3fcc:a1cd with SMTP id
 b8-20020a056402350800b004283fcca1cdmr24266124edd.178.1652871570191;
        Wed, 18 May 2022 03:59:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/49] python3-more-itertools: upgrade 8.12.0 -> 8.13.0
Date: Wed, 18 May 2022 12:58:36 +0200
Message-Id: <20220518105843.3299331-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165839

Convert from setuptools to flit.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-itertools_8.12.0.bb => python3-more-itertools_8.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.12.0.bb => python3-more-itertools_8.13.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
index c1e34b205d..94f6f9e4d5 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d247f6064"
+SRC_URI[sha256sum] = "a42901a0a5b169d925f6f217cd5a190e32ef54360905b9c39ee7db5313bfec0f"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_flit_core ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.30.2


