Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4610EDE9AC
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 11:25:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.9525.1694690749892871975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 04:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hrBVbH+r;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1001109a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694690748; x=1695295548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMUfp/GSwbXqodtQDIZCDOwLR4plKxbJL719NyDo//k=;
        b=hrBVbH+rroVBLvLWRAb7hCaXWzJ3mPKlsQi9D+W9+FyKjwLpITv5wuF1JoAskMDIXi
         BPqFDyU+LAnGF2d4D4ikyYYgVVvgBuYxE0SdJzsljwSF1jItGzrZp8BdSVr83SHeHV3q
         PqGCv+TEX/TnfdtVgGqdNVEWSyvkAB5IX8edq1/IfkhYNndXEZg4YdEZSHFWqlZOkLSM
         JO+FwwnTQZt3fCyKi54Om4dGGIDSyJVBvV6w74qR285x+TbDI9Zr2X9fq3C3PWloUZzI
         vlQPM9RXRdCM86pWv6BHpZ9rhNUd7URsBl5Q1Wv5WAu0X9wSv3cb0I1zOfnDVatmJ3lz
         92hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690748; x=1695295548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMUfp/GSwbXqodtQDIZCDOwLR4plKxbJL719NyDo//k=;
        b=FfJ5WrBUxLOB4Pk/XPb6bVTU0CnzxMScQQArQYiYLyyddGP5Xyht7HS5NGI7PpEZxL
         rZ1kN21Mk9VI2BwHpyU1s0hC3pXtZsw/ejWd5oXSJ/LIYHO7+gffkOeabnMn1+Rf0Vbt
         pHOiGCESjSYZr+VkZP2SZZYN4pqiS4tuUJ4e89iWr/ASLwG8WZeEcDH85g0BndWnRbeJ
         V6FbecISEZCnS4E728PM2BgTXFtThBctlPj993pD/Aeed0lXSm/5565sPXKiv9M7IIV8
         0STZdPV9npXM26iyh5sGdKZWjzJRJHZjJnDQxKqWOHWJOxfP4caT5eUIudXfCp37hcdv
         wc8Q==
X-Gm-Message-State: AOJu0YwfnM1JAWIDoWA36mrWbj5FG+lDg3u0ByXZ5cayoB5W6ify6PlI
	err/rhtfOwwXmz0f930/GeMF2VyMTgQ=
X-Google-Smtp-Source: AGHT+IHRtdnSjtOIAe7diT7BCbhuOk4epbtB/y/2CUukwImKNR2Xl/xzLrvpVJfhrr2QubiHZY/uWA==
X-Received: by 2002:a17:906:20d0:b0:99d:dce8:41d6 with SMTP id c16-20020a17090620d000b0099ddce841d6mr4347245ejc.71.1694690747636;
        Thu, 14 Sep 2023 04:25:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b00992d70f8078sm873832ejx.106.2023.09.14.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:25:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] meta/conf/templates/default/conf-description.txt: add a template description
Date: Thu, 14 Sep 2023 13:25:38 +0200
Message-Id: <20230914112540.2214062-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 11:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187634

Existing conf-notes.txt is not adequate in situations where the user
needs to select a config template from several, or get an overview of them and
is interested only in a brief explanation of what the template is for,
but not extended multi-paragraph instructions for how to use it.

Such descriptions can be provided via conf-description.txt and
this patch adds such a description for the oe-core default template.

Updates to the tools and a tool for selecting templates which
will make specific use of the description will follow.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/conf-description.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta/conf/templates/default/conf-description.txt

diff --git a/meta/conf/templates/default/conf-description.txt b/meta/conf/templates/default/conf-description.txt
new file mode 100644
index 00000000000..e49172fa0ce
--- /dev/null
+++ b/meta/conf/templates/default/conf-description.txt
@@ -0,0 +1 @@
+This is the default build configuration for the openembedded-core layer.
-- 
2.30.2


