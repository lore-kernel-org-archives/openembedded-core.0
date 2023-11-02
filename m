Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E188BC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:46:07 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.30056.1698929162005690559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 05:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HO4X45o1;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c115026985so953763b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698929160; x=1699533960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUeMd6HYci6W3HXRmygq1r4Q/s3oy8sMs0JUjYNZu7M=;
        b=HO4X45o1cseNrBCLXtjjGPZrVZ6c9Z9Vejk4oMfMb8D65jvhuwLPnJB6S2VXMbvSUD
         4lnPRmgMUJJNFuzN4yUyj/m92VNTeWzOKfIobdSrHdrPfzEVqLqQatYFpW0Cvj/pWP9C
         k/sm8SMNAAjDJr9tMeGK/+9I9Lli1FW/VM7S6Mp4r7pVjJqWI14xDMiJdze7zOMtPEHa
         YpyDGtMpnD+RasiDKKeQ4NHgiLCuqQI6UPY0s4KLWSP+qOM72uWuDDQwDXqyA1/jcmx0
         L2nbCfdVn2OUR/UNTNTT7zNjRkGN7a1uHhgZJ1a5NEwUtdQfoYjK7hpq/evs0buFIE/I
         uZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698929160; x=1699533960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUeMd6HYci6W3HXRmygq1r4Q/s3oy8sMs0JUjYNZu7M=;
        b=mtksr0Dgki0nB82/32NxxqiIcCcQukF9e3p6NL353h2oiOW15Ht1XeyRUYlPbPJg3q
         1Y05+mOyMmdtDP7OAtcF9LkRLyL2KUX44LjbodI0cMQiWaBbRXIvKYz30dMIgj6+ofRB
         TmXp07sGSJ2JTCYB3Xms8j8AASg+MSPY+nRI6A35wc1B6QAGCSF0d8VkGWWynLEzbJHo
         9LCwp1L5jVV0Fr+OU1JhYpA0FG3x33wIZQG4RXvteTm4Lb/6nusxY0abNOFMRvgBCgD6
         QvF3bC15qZZyul7sEOEO60x1KUgHUgd3kD90ZQx6/dJGmxP8f8cVAU4ynOxnUSE3brXi
         NWxA==
X-Gm-Message-State: AOJu0Yxx0fvDzHP0mPu9/SJ4snqm2zfgcjYXesS5yPFqpb0EFpW3nVmU
	oMQ55et6qk93fFQeAYiU2cQStgRoBgEL4A==
X-Google-Smtp-Source: AGHT+IEts/77ieCF1W9MWBlmJEXz6iKjSCBcnZHtu9EWwL2VI+A5nnnZPuScJAU1fR4lPCWVbe3SqA==
X-Received: by 2002:a05:6a00:1794:b0:68a:45a1:c0ee with SMTP id s20-20020a056a00179400b0068a45a1c0eemr21024993pfg.15.1698929160269;
        Thu, 02 Nov 2023 05:46:00 -0700 (PDT)
Received: from localhost.localdomain ([61.84.2.32])
        by smtp.gmail.com with ESMTPSA id x21-20020aa793b5000000b006babcf86b84sm2818534pff.34.2023.11.02.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:45:59 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] python3-spdx-tools: upgrade 0.8.1 -> 0.8.2
Date: Thu,  2 Nov 2023 13:45:44 +0100
Message-ID: <20231102124544.1456564-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190081

Changelog:
  added optional encoding parameter for parsing files
  fixed handling of the FilesAnalyzed field in Tag-Value format
  fixed the validation of the DownloadLocation field
  fixed the error handling while parsing license expressions
  fixed output of timezone-sensitive datetimes
  added code architecture documentation

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 ...{python3-spdx-tools_0.8.1.bb => python3-spdx-tools_0.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-spdx-tools_0.8.1.bb => python3-spdx-tools_0.8.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb b/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
rename to meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
index f58a138430..53263ca032 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/spdx/tools-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7f21ccff0f672f2a7cd6f412ae627d"
 
-SRC_URI[sha256sum] = "c83652cd65b5726058dcbdaab85839dbe484c43ea6f61046137516aa1b8428ae"
+SRC_URI[sha256sum] = "aea4ac9c2c375e7f439b1cef5ff32ef34914c083de0f61e08ed67cd3d9deb2a9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.42.0


