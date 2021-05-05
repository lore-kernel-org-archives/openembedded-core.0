Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10081.1620227976407217136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZljCeVNs;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id w3so3464006ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IbU1dGPahK1ilTOPXSUPk+ll6IfKLpOgXSGLoer/9pI=;
        b=ZljCeVNs+fKMXyIT4/3Ai3ZTKAw9Fiwd6PVkg6bq4aFxZNSm37Nc5QTt/IMW9cgp9u
         yjOpSm/32K75kmNMcVxWqpJkoRMM3saFazsFyt20qZQKPV0JcZnG3cYcn83WZRLTH9Ik
         PYbtKv6Y+Rcha9D4UD7P3/LWYN6y7eAMFF5s/7rNOZ2tYqKUB3Rio888mclUayCdeoab
         Z8hYAOx0ku5WDJhq71otBBBj5qtSMQIkE3eZFr5FOGrs53QW3Y9SZ2VM83REKah1rdXJ
         xW+6N/fsNifVqYfYrLLFZLC8h1u5E+iQAmZRtve8myB0ACzCaDObcvKJS1UnlgCnnFth
         V+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbU1dGPahK1ilTOPXSUPk+ll6IfKLpOgXSGLoer/9pI=;
        b=qJXrMzUQfX+v4Yq/3cplOLocAGgWkPatkjekWbOPqdASAZbKFt9hbSWdaqFik7z7UK
         z8NfyPT36P1bh6LyGoVQibuH/nQuM/sBnqnKE3w5VYnUGSUrrkTzUIjRdiIMe79JrSez
         BVhiVhQSQQ8rAaBA4nO1qeFR3vXiUBV4g2xaCncTKbcDmGqLRmeXA1Kp2lcsC4Nxu+pG
         q41vFFol2vP+S+dkFRp11J0lRmRjbf4gju9ZhtraTbcD+CmBIogvafLAB5QzuVeRizOd
         akuE0pUPyTl4HQXaGkw9nWw6LcwarICGYANOGbxBwo1H25UZMiv6q5g3ekBnXkcJdSY+
         d7Zg==
X-Gm-Message-State: AOAM530GXw8O9dVjQwTF+F7zJNVLLQ5xkS25eROPgJOhZJ+x2eIH8imp
	QvXQPwH7HsJJOzl32ufCfCEPkpwWB3bzuw==
X-Google-Smtp-Source: ABdhPJy0aTLYjNO+MaN62fu3mtJdJ7DeO/vJHuCBkGAL+gcCUAD7zqlFKARbUHKxI2vaiziROyJmmA==
X-Received: by 2002:a17:906:9141:: with SMTP id y1mr22165061ejw.111.1620227975050;
        Wed, 05 May 2021 08:19:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 50/61] python3-setuptools: upgrade 54.1.1 -> 56.0.0
Date: Wed,  5 May 2021 17:18:39 +0200
Message-Id: <20210505151850.660512-50-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 680edbe704..5dd55f19a2 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
+From 552758405739be9ae220bbd158c2a1b7176fe292 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index eeb21b5..eca1edd 100644
+index 0917804..eed4a5a 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
-- 
2.31.1

