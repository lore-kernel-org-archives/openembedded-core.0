Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183B8C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 23:36:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5731.1745192174452644260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 16:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOHE5JJf;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so17050625e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745192172; x=1745796972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aYHoAudAoUHG1dGC7Mj2NfE/y4gyPWUR2/0eJP/jBA=;
        b=lOHE5JJfR4HYD0prnqMlmwZrdZ7K+EJbeLh6Py4d/2WqYlYIjwimREJrWC/SKOncpd
         GW8cO+U+TVzsIc6xGi/We2kbEQnI05XSl4iTIqQL8PVXJqGVQFyA422Kl16oricj1KSq
         VIbSICIQNB2yF57LbAQiymCqoIDaEAdEoG1aZAsro5o36I2JgrFQQipCrBR6E4ZmO68r
         /5wcoaFt4yICCJeJkzV3LiQOJvVhP/uCOs+wAHdbRwC2nv9am3Y1RlAD8iOdPIHiAvYk
         hv/x07x7/0SKY/ubKcYkPdahzEo/l1SPThDgRuWGSAQBM0Ir6gNTeLpOZYqS2ZNQfHRS
         hn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745192172; x=1745796972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aYHoAudAoUHG1dGC7Mj2NfE/y4gyPWUR2/0eJP/jBA=;
        b=ICirQ4emq6J681TFAk6/Qcc+CYznzf32Z0mPzzJ/0gaH+qzDhSN6wXMsvNWKSfewK/
         PK321DFTaxMIfJ9bhQGv8w0oc4ZpIkfg17GWy8o0Fh0kzgRcFPs0NIDAaG6NAi1HsIJ/
         obKgFPQ1o216dm+7d5job+90eYaXlB6S4s3Z0jjGkAuuSoCyO/0o3mLj95NvYuoo8q+Q
         7rGy7dCIk2X1mmhIkOelPBoSsVYmCFCqH7v1TsJL4h0DKuQP6lZstJz1LyD2+Y5RwUda
         T95IW5Q2j5ADmhFi9QwiCt0/9jmcU/4QwtJgDFLSSUt+MKkNR34zoTZBycm79N7Bd/rc
         a8gQ==
X-Gm-Message-State: AOJu0Yz6UgzVzMuhGOA2zRlwIkJE/lKdkeldDzlT1R+TLV5njzH1lAsx
	zTqq/1mFkyC/ZqPXxRAyf4cskzII8inzs4Dtdre5Nm6F2RZZeWxcJeKF+A==
X-Gm-Gg: ASbGncvm9xAZ+oqpXy/V1zd7nlfTgZnm1wd30kiHP39/rUbixIM3cHaXHGeELjPPKo4
	jhvln5puFzikMSrmliI4C4EhvIhqTUrNNVDQVoJ2FfUMS4NRL+eVHqJkMjuVqOcrsruumnJP2Lo
	92RcxOaUQ35zSDTQzL19yW1fiIG/lr1GLkYCOIpOQNARMRzGw82Iah3tAbhqNpFn3P4aOZ6QCat
	TkqPIR2TzlOWGa1xOgfrtjGbRYQHiuBMVxbvJZIJUnay4gDaCOD+fvXoac8T71alQziPESb0OsQ
	pw9onQfGe2pfggX8sVoRmISlwQtHhLx47DTexpDAxoAOGZd7RsogfGBOMsE5UrcUJA==
X-Google-Smtp-Source: AGHT+IFH3J2GGI5+xsj6CxWTjS/64BGyqqHUdhdMwFICoV9FNVEJVGKujEG89q7IWkYnqpQ5UYBB0g==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr97514995e9.15.1745192172434;
        Sun, 20 Apr 2025 16:36:12 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49313asm10062753f8f.75.2025.04.20.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 16:36:10 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] bluez5: add missing tools to noinst-tools package
Date: Sun, 20 Apr 2025 23:36:01 +0000
Message-ID: <20250420233601.1860198-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 23:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215162

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.72.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
index 9fda960ea7..d64286ef6e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -46,6 +49,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -56,6 +60,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -65,5 +71,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


