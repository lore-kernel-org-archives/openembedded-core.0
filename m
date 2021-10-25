Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CAFC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.4611.1635201864255540798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fLvmTCU3;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f5so12101921pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qk73sqU6tYyFKr4YclQJXWZBEF2QOUuNoql1tnyRv9c=;
        b=fLvmTCU3r0x5GwnZtijbT8wr/vycduFqP6YS2uMdrKSByVC6pp/zE0trYXBWeSWivw
         YdvvhKMioFGZ6ZmAdKV+ToovpEM6xLtLFilivrTuSfnNJAkZ1Q09+BFFJWH6obkpyIJU
         q4d4TLtkIb2RyT9jOWbCj/WPbyxTKYKKqnNulOPBh1DUJLhsKMq1GeQuLVlg5QG6BcAu
         yGPmee984vfOWsxuiSQC2X4j70V2T5u7eciTqQxTt090GffEsLcaW9ikAXSAHHXenh93
         JNW+QI+Nfwt+0SUJHYFGfn/5EhYe7ICg1UJ+Db/j4a+xOW4dvDCjOXVcDzfsI+6G5aZm
         2VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qk73sqU6tYyFKr4YclQJXWZBEF2QOUuNoql1tnyRv9c=;
        b=1W0tqX6FZRyq6mjQ9nCDCyheKHYnEgkpnA/wcw1oBqPuPxZDWvQcNDQ7L3BOEzMeIi
         lIJorGNQNUl0VMkAxMwds7iJmPySqpjbp69kOO/4CUeqb6uVRIAf8bHp2qEG5ET36hT3
         mtlG2H7V9LGfNBxm1GojasURqFz0j4JajSO0BD7ZJDwQLnHtluuYdtoMwf9MQve2JKYN
         XdCYy0Q2oph8INFMmKen/0jl4KwG3+qDrwRE/iDQxxJf+7sGyyIYgter/aygB30TCUyp
         22XKqrX5XhRODYgPnxPDeUjBAye422AARdZrd5BZBBsqVvAHjGfswzTjjbfFNiwHS/SW
         VoHw==
X-Gm-Message-State: AOAM530DiRLmlVK7fXw/h9QcWCejWR4jvg+2qsG5GROfaHrjjZXbxMLE
	ct29vJ9erVEloD6Kc455yOgdDjPosnA=
X-Google-Smtp-Source: 
 ABdhPJxFtevDUDPstc2jGDDFkdb1k0ih1PddHLZ5QGBCKDx4gvc8T6g6jySVYYvn98bt3AqFkaaRbA==
X-Received: by 2002:a63:2acb:: with SMTP id
 q194mr15803870pgq.384.1635201863582;
        Mon, 25 Oct 2021 15:44:23 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 k3sm22160363pjg.43.2021.10.25.15.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 15:44:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/3] python3-hypothesis: upgrade 6.23.2 -> 6.24.0
Date: Mon, 25 Oct 2021 22:44:03 +0000
Message-Id: <20211025224404.508616-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025224404.508616-1-timothy.t.orling@intel.com>
References: <20211025224404.508616-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 22:44:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157366

6.24.0 - 2021-10-23
  * This patch updates our vendored list of top-level domains, which is used
    by the provisional domains() strategy.
  * (did you know that gTLDs can be both added and removed?)

6.23.4 - 2021-10-20
  * This patch adds an error for when shapes in xps.arrays() is not passed
    as either a valid shape or strategy.

6.23.3 - 2021-10-18
  * This patch updates our formatting with shed.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.23.2.bb => python3-hypothesis_6.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.23.2.bb => python3-hypothesis_6.24.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb
index 4ffba1c612..50f7e01061 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.23.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b71b257916c91484716a10220ed2b9a0cf82acc3ed8ef421bb2aa0a671761053"
+SRC_URI[sha256sum] = "ef53bd1c4756436be2e8d4a2e16f6f5ffbca7acbe8041e6872aea16176ff3806"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


