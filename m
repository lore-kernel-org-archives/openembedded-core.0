Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16254C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 05:03:52 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.6638.1645679030573439664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 21:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y2ckIFb8;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g1so883229pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 21:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t4wsEgFDaKyAgmDeykTfMrU/jZksPyYCI0ikKaJqATY=;
        b=Y2ckIFb8tXsXWCZhVkMoGA0N38DAciqtU5GkNTU7b8tWKpLcYjipYdSqGc3i61VZzL
         Fht70RIVSVy6cdcKFxqV7Lwj6Md4X+wQXB/Rj9plLHkm/83yMicZq4T75Jd5zjUlP9m9
         vtuEx5QnlrL4JRr4AgpKRGks5ba+lw1Or+lIqJZ9Tjm+RoWV/9UJYLxWxBNgGLMNULmO
         DXPB/nw3SoM+5lKa/JClHVT3DrRutGwzsqz2yzzfsdwPRuPWjFaO9zzrP+kcQc1GQhQS
         SGTrgGZzWlKefAH6r4T5pFRHoKfty2riSuz5T83GwCc9CT1yrI7Os0MHL+QZmFlmfQsh
         3aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t4wsEgFDaKyAgmDeykTfMrU/jZksPyYCI0ikKaJqATY=;
        b=NNG6FYRMgv8PzWzNPr38w6GTmWRGtmQSDS2N01x0ipVOAZg2hv6SVHCLY8SLfCo5gf
         3dBADubcBlTj3EolpEvb6fUYu3c6ZuB7Lc2i9Ulx2wM7p14ZCduxF8HJcxXm6BiMJEiG
         MwbbwtbN2QbI2+z9E6GDtn0tGu9riVBhGGcb08HY61nNTL0/bxMS6aiMVPV/z90CrI05
         RUZe2ceYMcdiS5qyOp95RTr1EywrvZyAChSw6jy1e5e31ymSQxftz6VqvirJEE6hWFaU
         kjHBRYvL8g3QAlhGEcFOhOCcDUSxBvOGIRu8kMFYA7pbfaycnngo0Mpau9KcCtxKB5w9
         dE0Q==
X-Gm-Message-State: AOAM5329n7A/susgwolKRUMXMjLibLXjqkqsc/vgTVux6vcNYcL56Yhx
	niprOPmB0OTXMl0TrplktNAPmNkQqSZmlg==
X-Google-Smtp-Source: 
 ABdhPJxsnZAHi8hAi8IERsLIiSCZ2xHenPPzVjDIL5Zd//LtbmZyy03V6Bw6AmF+v3h9vQfPpkbPTw==
X-Received: by 2002:a63:1826:0:b0:373:41d9:b14e with SMTP id
 y38-20020a631826000000b0037341d9b14emr972127pgl.197.1645679029759;
        Wed, 23 Feb 2022 21:03:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 u4sm1408106pfk.220.2022.02.23.21.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 21:03:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] local.conf.sample.extended: Use new variable
 LICENSE_FLAGS_ACCEPTED
Date: Wed, 23 Feb 2022 21:03:45 -0800
Message-Id: <20220224050346.1236428-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 05:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162293

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/local.conf.sample.extended | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 2ea27d044ab..68f3a966cd8 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -178,14 +178,14 @@
 # product. If shipped as part of an image these packages may have
 # implications so they are disabled by default.  To enable them,
 # un-comment the below as appropriate.
-#LICENSE_FLAGS_WHITELIST = "commercial_gst-fluendo-mp3 \
-#                           commercial_gst-openmax \
-#                           commercial_gst-plugins-ugly \
-#                           commercial_lame \
-#                           commercial_libmad \
-#                           commercial_libomxil \
-#                           commercial_mpeg2dec \
-#                           commercial_qmmp"
+#LICENSE_FLAGS_ACCEPTED = "commercial_gst-fluendo-mp3 \
+#                          commercial_gst-openmax \
+#                          commercial_gst-plugins-ugly \
+#                          commercial_lame \
+#                          commercial_libmad \
+#                          commercial_libomxil \
+#                          commercial_mpeg2dec \
+#                          commercial_qmmp"
 
 
 #
-- 
2.35.1


