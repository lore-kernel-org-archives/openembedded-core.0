Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39642C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 12:20:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.33546.1639311634115073463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MJLVWRMR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so9891209wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvIMasC9mtUgTWp/hfbK8Q8GwfwDq9rFhFlpgF8DXQM=;
        b=MJLVWRMRPhHUN8cmyVzbZcGlbp5YPqgZUFCYewP2Mrxof93mj51w7J3dXPIPZZBwIu
         VkknTIarMopLTHmAT+ySV7mmoMmR08haeLMFUWXxXyMcuNsdi+8G0tDQhFCzMUNX56M/
         U5Xj3DQ6Xpk5tqb1Bf7bYPqfU3fwlRo6b9oz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvIMasC9mtUgTWp/hfbK8Q8GwfwDq9rFhFlpgF8DXQM=;
        b=nnYh1lrqdfqNM37f4q/1UYS0ylxgG5rAXAcHRjDuzMYjeTnr/Z2SKqV+rugVxM1QVL
         IFaI5FiP3aiEi4PKvKJ8GjJuvR+Qx8hww0Cyx4cZ3hsY4e8EMvJ10UX7uK/ZKv2cmsVs
         q/2G/HfFNw0/06B3WSw2MJ5AF1tM2sKbE55PmZwtcrcb9kX4hhy9eBTWLcMfBAi8nOxe
         +acg9zDimHqTS/HxHk9kDdFTyGzyWdb5Q7pccnjVMCJom0e8ipZUXyo7pXFD/ZLAR8YL
         B5jKybvQKdDvMCAr6jZ1qVA+OoqdBwQ8rhUzxpRGYIE9chHXQvO8NHXMytf4NZ8UpV5H
         QgRA==
X-Gm-Message-State: AOAM532S0mxhXZFlVdxFAAqtkEWNs422lejCQedr3ToJm4qh80Z++c1H
	1xAiQlZGO9a3S5sgqOLi4axWzH9LxQ1XSA==
X-Google-Smtp-Source: 
 ABdhPJxPGEdaYS85NbniH5MZkpcsHdr9rPJ7T2FUxc6WS37ClEIse27bBIbOadX7RVB/ZX5GI4Sw0A==
X-Received: by 2002:a05:600c:4e01:: with SMTP id
 b1mr30393227wmq.109.1639311632309;
        Sun, 12 Dec 2021 04:20:32 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:dd:524c:81ce:484c])
        by smtp.gmail.com with ESMTPSA id e3sm7557515wrp.8.2021.12.12.04.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 04:20:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-ust: upgrade 2.13.0 -> 2.13.1
Date: Sun, 12 Dec 2021 12:20:30 +0000
Message-Id: <20211212122031.734474-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 12:20:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159580

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.13.0.bb => lttng-ust_2.13.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.0.bb => lttng-ust_2.13.1.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
index 7c6a0743e17..82e544a4b92 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "54e4c933679cf6a07971dc5861ce57fc4876ab740ab612407b30b5fc85371750"
+SRC_URI[sha256sum] = "5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc"
 
 CVE_PRODUCT = "ust"
 
-- 
2.32.0


