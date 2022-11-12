Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF93CC4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:52:39 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.3345.1668264758692888101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cxy1JE0s;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id z18so11326124edb.9
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh2Y61KxVThT1qQN85keSAryRjPMqxRt/uxaeAQhP7g=;
        b=Cxy1JE0sR6cthAd0KWbLFBv6sjSwnsKcUkLwKkhpBHNOn6liPLn0Jxwu2VqR+cUBTP
         shA5yuMnchOal9+/VjmsyxuVJ4Cq3FszY6FTGyVw0bIfIUgg5zQDWzUAuNs7dp0pEmZ3
         oYKmoKVL5ATZ9KUg2I/AEi1uaTC/Kr2acUp75LPF9kMzF4MjzmjAbCuiTGkDyfHrXFuk
         xlVC1bKPU4iVX7tqCyaIVOmA3kF3S9gVZIm0oXocZr9MSZn8mf6Hzo12z1LwxKj7CNXt
         UD1HRImEX/ycuU5alYUk2guGdP1expLOIVdZeqozqPgjEliy8hwxW8as5pmOkSxJfFj4
         eMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh2Y61KxVThT1qQN85keSAryRjPMqxRt/uxaeAQhP7g=;
        b=vqx3PilN8ayLaHZxrviF0kio2R0zV8Abaiu9DgO2E+IZISBmlgdEjy2ATwmJwbnoCl
         VTC20kYaK6PfjEHAfJTZMEBVb2wrAya3QSWlTlqAQCV7glNmchplBV2h81OjkXVdaSLd
         Bk+X9gr8Hl5RbgMHlfJBuxr0TNqEd767Q6M9C7VhUs5TGZPayV0Es/Hxkbre7K9XRSko
         APBTH/kinwmA5SRhcQ8e/I/q/THGImefElopFTWCjljJTbkqocBVbq7gSfL2CFrI2uCC
         oPI5ri5hodFZEn8HQgO6w9xTQuxm+6dIaPvL+stFtW7CHbsqsBmdl7Krht6+PxFQ+lSb
         o8Tg==
X-Gm-Message-State: ANoB5pkR7N1tT87E7zSVQTJwgFXkueA5+fQphEo223S+PX+ecHq85+25
	4ufpupNaxB6LTZ/lpdf0qBPXlsjIqok=
X-Google-Smtp-Source: AA0mqf6R2NPIBVwFP/nQAP/mt9FjAKSDCyn4PpvG+QiTu/5iipVIsZwzUIr14YTFeIVe9+OzR2m7DA==
X-Received: by 2002:aa7:cdcd:0:b0:461:fdea:bb7d with SMTP id h13-20020aa7cdcd000000b00461fdeabb7dmr5541077edw.203.1668264756254;
        Sat, 12 Nov 2022 06:52:36 -0800 (PST)
Received: from localhost.localdomain ([141.113.64.50])
        by smtp.gmail.com with ESMTPSA id z4-20020aa7d404000000b0046778ce5fdfsm1124007edq.10.2022.11.12.06.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:52:35 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] repo: upgrade 2.29.5 -> 2.29.9
Date: Sat, 12 Nov 2022 14:52:26 +0000
Message-Id: <20221112145226.73982-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173161

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.29.5.bb => repo_2.29.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.29.5.bb => repo_2.29.9.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.29.5.bb b/meta/recipes-devtools/repo/repo_2.29.9.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.29.5.bb
rename to meta/recipes-devtools/repo/repo_2.29.9.bb
index 037919641e..a5a5c5ce87 100644
--- a/meta/recipes-devtools/repo/repo_2.29.5.bb
+++ b/meta/recipes-devtools/repo/repo_2.29.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "b750b48f50eb4a11087ca6775161d5bf4d5c47d5"
+SRCREV = "47020ba249c39783a66c0031fd9200caecfbbdc8"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.17.1


