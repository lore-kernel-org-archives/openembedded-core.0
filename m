Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551CEC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.3417.1652871572608676804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3w0Q5zc;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id i27so3021712ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C+IJMgZBKcjnD2nhc1fU6z8K5QVkUDsd8H6YMp5W5oI=;
        b=U3w0Q5zcc3lne/Zi+RUKfi+TJ6dZ6XzmXUSRmYKxQSpRrJLko8cmygXqrsAdpNkklA
         We3KeXC6IPKP/60EPlabkbozX2b6q6ma9HYnD3ciHPm2E0Lujr31obffYkRSdtq7EdtA
         hTV2JS+PFVQWvALOayvZvBvL2JAhpZCoxYq2zygfXwwVWuTB7OZagUoxlJSE1MUpsg4I
         pUEsdovnCxXbz1jA2IMZ5zNCQckyidrQnY9iskpek3i4FtFj12l2wv3/D+2Y7Cym/u0J
         9xONBjJ/h18RaLOnHOjvif4VtAbRi7WmUxnfcU5vTK8KOuqxapj974RjQIcrduKIoJ46
         YCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+IJMgZBKcjnD2nhc1fU6z8K5QVkUDsd8H6YMp5W5oI=;
        b=hvjDoxc8zukvpXniVKTvZsqwv6EFwZuM7RWzJV/lm1VmdbyqduH+kTqOyWKWRg9Aoa
         8LAXNpTxMyzE+651eIsnnaNOqTEJ2k4dirr/JrDnikkqmzg/Y3z2RsQ2bPY5UKJgwED7
         /AxR6Qn58ICM4/w4uXl48ZwHiZDti2nl5y9fdWDUiMtuMfACQjDgfzoka8INs9B6wTHC
         HcgCltCfWjLoCBqA1x9254/KewlM0rb08NPP1dUbghH7gGrUVBb2CrP1Ryhh4C3hUqcB
         y04MHk+JI+Vyj5+IAplZx1IsxU6v3ffnNI4BX6xY/ZJIZzAFLCbkPgJAmqiKro2zpfE3
         +yTA==
X-Gm-Message-State: AOAM533zkoZeLY2noPiJlbFmB7vOU4DMTvfp1/JXjpvrd2IY11tyRSdI
	UScjXyMLqeJ1qkfwKxF7sbN72zsLS3I=
X-Google-Smtp-Source: 
 ABdhPJz5hiR8DdjEPky9T4RFul0zPdIuItxN8AwdhaCrJK48dTbrBc1na5AyWFkz1FLMoyyjYsUYxQ==
X-Received: by 2002:a17:907:6ea4:b0:6f9:b218:8cd with SMTP id
 sh36-20020a1709076ea400b006f9b21808cdmr23304564ejc.376.1652871571180;
        Wed, 18 May 2022 03:59:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/49] python3-pbr: upgrade 5.8.1 -> 5.9.0
Date: Wed, 18 May 2022 12:58:37 +0200
Message-Id: <20220518105843.3299331-43-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165840

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pbr_5.8.1.bb | 4 ----
 meta/recipes-devtools/python/python3-pbr_5.9.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.8.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.9.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.8.1.bb b/meta/recipes-devtools/python/python3-pbr_5.8.1.bb
deleted file mode 100644
index c8664018fa..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.8.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "66bc5a34912f408bb3925bf21231cb6f59206267b7f63f3503ef865c1a292e25"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.9.0.bb b/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
new file mode 100644
index 0000000000..c93b71dbd3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "e8dca2f4b43560edef58813969f52a56cef023146cbb8931626db80e6c1c4308"
-- 
2.30.2


