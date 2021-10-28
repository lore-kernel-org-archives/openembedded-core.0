Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537DCC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:23:44 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.283.1635456223169103210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=whGIKnTN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id d23so11668227ljj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7/PIWd15u0ZI3ikQUA0j+j3YLaeB1Uzilex6ZtxKbw=;
        b=whGIKnTN/nnSJIrY4q5H9ogetFgqTkHnt3rxXs5nKPsBYF8iJ3IjK1XvsI7o8+KMna
         /ASVnaUEMxQNQ5Xq/rzSIzf5Zm5yfm4Jf50lKFKBYmi4yPmX1O8EPPJteRb0LXxuDm85
         hYJ4oanTVlLY7ngujTSxJfLs3ag2Rzu4kAf0k0Q643V2rGvudWIRHeWLPH8mJFi8t7iX
         vlfGimK4MI7S9ZAP+++1PKzIwxjXS+pm9CE6sTjrFaPh2BYzERbP2rtAFUG8QgS8eVen
         jh5s/YyjYwrLyF3SXFNcOzvPC6nZkhequaXA+0VkPXeUbDUL+P13a4j7ByyssKOf9yix
         wBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7/PIWd15u0ZI3ikQUA0j+j3YLaeB1Uzilex6ZtxKbw=;
        b=o0s0aPyv06NmsMMkWWJ227l/F5TMzQ36OE6Qk4dLCbeLTHSuumXm70GV3bsY9B7Pof
         IBZXP6V4kL4syE5MUm8FNw2Es2WsbYsIQq8XgjfzsJdStO+OV/K2FFiY5aEwFHtIM0BJ
         aqfj5Pryjs/8kr5BMHfr3rJkXvdpcp8rAoJQI9dknbntSrMiN+wxwhOOtxzwQtieucC/
         mdzDhF6nviCrrzb0042Nphdw1uAgEuA2V7dHDFIAbvEM+W+oHmYgmeKQNEuFMn2Xl4GC
         nJ6i+3KaiuDmO9cmK1dwpgAxzJCVJWLT5t0LESMu/TX1KYTHYlhrXJ/rIk6WoztavQ17
         gulQ==
X-Gm-Message-State: AOAM533a7RdJo4CCh97b7BLYBqqp/X+UYFPjZchH+rs/nFbKrE6QXu8h
	xovF/15QuT5gL9ViGo4IG0Z3NwtunH1x3nXH
X-Google-Smtp-Source: 
 ABdhPJzbOQiXIWbfq24y6uUvTz/Z9zHo3HH3iAGJn+mipXQcQK+Kw8789cjJcM+bcE+4OCIRJUttBw==
X-Received: by 2002:a2e:7617:: with SMTP id r23mr7177014ljc.187.1635456220765;
        Thu, 28 Oct 2021 14:23:40 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 br3sm421592lfb.306.2021.10.28.14.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:23:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-google-api-python-client: update to 2.28.0
Date: Thu, 28 Oct 2021 23:23:38 +0200
Message-Id: <20211028212338.1364641-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157611

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ent_2.27.0.bb => python3-google-api-python-client_2.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.27.0.bb => python3-google-api-python-client_2.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
index 41ab48c6b..19ae3cba3 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "659e9955f0f1e02fcce5dec85622eb5af1807572ef0f09c49d68d8426da670e7"
+SRC_URI[sha256sum] = "07e6fdfc489a452d79c5efdc4cc2d5cfd7f7aa207dec82786bfcc436b208e027"
 
 inherit pypi setuptools3
 
-- 
2.25.1


