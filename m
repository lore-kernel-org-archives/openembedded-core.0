Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47916C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.3440.1652871569503225853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eKWhtscv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id y13so2303335eje.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FpNQ+TpZEEJyPw9vG1cMXcjl1FNEw83Bi9RfULuf7A=;
        b=eKWhtscvwMQH1cHClbtRZbzvIESwNkD1QjurvNIFITw/9pvO7tSm89UOBdC+Zg6btL
         ZNyQ48Vai4oCvE129/ykGJ8GiVif1girAM7Jq9a7V5mF5TM2vkIOjzdkd/tkGm+pSwJn
         WeR9pMRNQjOcIgo5E8+4/u+iT2DK6riNayTq/tr74nZZ2FK76JtTi/XbeG5JQVbH7ST3
         PmVAz0Ma2YPn8kugycxzLZX6ELpAYMd8Dl2VgSISHDZ5sbUUiGMoLF2Obuu/67fzqlya
         P9GN3rBsHdgXoUqHsztRa6yhx8rTeNpNJe13vEL/kpNVwyFCioDecdCmqauuk32N45FG
         tXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FpNQ+TpZEEJyPw9vG1cMXcjl1FNEw83Bi9RfULuf7A=;
        b=PvrgesCavmCkJL3k+18Gtnpsab1eDA0n426z19X+q6xL6MipikBeXfwcD+W6wyGvM+
         yEEbSCANBJ64SSVFWjLEMDyd3fQn/M3Xhzg+qmTLzj9W42TiNfIzSuCQpTNzMqBfLAGA
         u+8j6edWFq5zZDKL742HfX9yjSNNK7QGF/s8F1LKH1Mh2XXInNacrpdXbCpBdT2YoSz6
         odFXfQQnQcq1YbOp7dt8hKBJnE80TWtqeEnymOungBJmP7GwwNcXhxQdY8IQYqyLEbO8
         xXSzWmdAWRDp1VTZRO5x6HQ/SS3RLFVZXDbkIsg/HZ6c+R6xKnJvZwcYaAP5Aed2j5Is
         WeUw==
X-Gm-Message-State: AOAM530S1C0NDRzm9S4th3LXxTviT+8QlBKTQ4QI9HG19QM05gnzAhR+
	QyUj7VxZKe1Z0vIwKVhvCejjtEz5DXI=
X-Google-Smtp-Source: 
 ABdhPJyN2Fj+MTPtzgoGjxVr8i6bxSWt7VESYAqaWn8FMBFQgNJnxroaqwRLCMx1TGwUD0yiV132KQ==
X-Received: by 2002:a17:907:7fa8:b0:6f3:e975:abfa with SMTP id
 qk40-20020a1709077fa800b006f3e975abfamr23420684ejc.86.1652871568019;
        Wed, 18 May 2022 03:59:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/49] python3-jsonschema: upgrade 4.4.0 -> 4.5.1
Date: Wed, 18 May 2022 12:58:34 +0200
Message-Id: <20220518105843.3299331-40-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165837

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-jsonschema_4.4.0.bb => python3-jsonschema_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.4.0.bb => python3-jsonschema_4.5.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
index 10b39e76b2..9f8719870c 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "636694eb41b3535ed608fe04129f26542b59ed99808b4f688aa32dcf55317a83"
+SRC_URI[sha256sum] = "7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


