Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90AFC6FA8B
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.897.1663362511252882215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=foVgHLxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h8so30982991wrf.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=tgHxglGeU1qVfLnOVcldn38pHoqBalAWatowHmUzV0c=;
        b=foVgHLxvc8CQplnDJyMJlLRFpFpF0Dd+fbIjxZE7/LYdgUZ6kO05kWE7UfhC1SX3DW
         yQWAKbEPze5o8G3pRjq/Qg3rCTZRpB8tXqXDk828VTZPMYs2Z55XFsaqxX9rqTm7xfoX
         4W4IVbB39elXH7/qlcq5TdJ3wUlBvXL6+6LEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tgHxglGeU1qVfLnOVcldn38pHoqBalAWatowHmUzV0c=;
        b=rUA7baD5lUGFqIKtdxePpW6Rc9WLigoJwDkO3F9h1UEiYg+qVQ1Uw5wnPnqe2/x1l2
         zgKS7kEJn9zUq817/46FzQqo7PyEDSUbIs9DCIc6oTMtjH3novOuCKfksHo6rz9PmHnj
         a/t+wqeF5l2xgH1GvYVkyEw3YqC4H0dID/XqkIaWcZwvqHV48uFgZEsN7ommvWOdcE86
         f6SZEpYjPWhQDtcfAAxFXOkH3RJvD8z4xrbDz9N+qvapSWX4OapabMITPV7zI5q3CQWd
         ZDE/3v7GvZdgDb06s9EHWD6T/uHyZZGtfcqyDkw/xLqLkgFnrRwYXWu0jArD8cE/nd8y
         zCeA==
X-Gm-Message-State: ACrzQf18kuSq2yaN6Qf0bahJDU/za5atEILuc73aVH5MYQpVee62WQ0k
	LjJAG0lLYBOuzDQqJje28qy/G7hxR01BSQ==
X-Google-Smtp-Source: 
 AMsMyM5ppmR/qWdjuWrHuqWGsuzNFNKOfPF92AIV3F2vLMxV4Qz9+RTLZ3McS1biy/ZitrwgbbC2jw==
X-Received: by 2002:a5d:6c62:0:b0:22a:2f91:b99f with SMTP id
 r2-20020a5d6c62000000b0022a2f91b99fmr3877547wrz.124.1663362509224;
        Fri, 16 Sep 2022 14:08:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/24] ninja: upgrade 1.11.0 -> 1.11.1
Date: Fri, 16 Sep 2022 22:08:03 +0100
Message-Id: <20220916210818.1228761-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170807

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/ninja/{ninja_1.11.0.bb => ninja_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.11.0.bb => ninja_1.11.1.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.0.bb b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.11.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.11.1.bb
index 4ec361cc1ad..255f5efb703 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "51edeeb063a82693573db43782d9e3733b2840e4"
+SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.34.1


