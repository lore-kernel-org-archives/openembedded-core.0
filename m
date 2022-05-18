Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E631C4321E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3543.1652871558006799806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g1hs//fi;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i40so2471928eda.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=84woK1woIFju9i74TRDVN9qXrwWXQ1oXBQ/GywySoso=;
        b=g1hs//fiy9BYB+uwvkP18/Pz7DfWvbw8PuIfYLx+JBrfHn4cMgY55pH8LdJdwQnLD7
         ruEdTxZyWKa1ABYNlsCcgZ5Dnwze9aZnB9TFL/c/a7Mu7JMnYFkEMAdXhD9d8eWz63QZ
         la6/1vJDhF6zfOrtCdkdOeHqxpbXSFsPJ9k//qwJi97FJO1tCaih/+wiRTk1uvLJt5h+
         PVY5G8MyO8jWdZQ38jt5SCjQrJ/CVkih7zc0B6o7ZfXG1/Z5zI3GAp288i/CCkXrtUnk
         5OyzhfQ2ZRuqEoywZnX1YwDeApoXn4HpU4VOG4XDbGNKOsGUksoxT72zJH2XsZG4Nl1l
         5imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=84woK1woIFju9i74TRDVN9qXrwWXQ1oXBQ/GywySoso=;
        b=tjNXxJcs9/aHll5UJ6hJrUQJfxnENbR8Iv25kTOE6Gwz6Frd1zoglHiAq+fqVdH+fB
         WAIhYsU+CdhREefLEzicoCy50NEhPuBTisgLBx/ZOsD+6sUOwOW15vDK6EQXiL41LKsu
         xkB52ME1BZxL5LRDQ12SJN3TjNkWkFyfAPBj2a23cY2lmYFTGJ1hpuSvXtDxFFfrj3tw
         FncRHAePtkApPP4tJjBlAZeioj5wHOn8qxVk+okcw6RnpuSGFuPXvn22JOu5ju6RmtQL
         7NEupdsPXkFQb9FAw27kI1FgBRLoOtHgBsLiQ8V0MP3y2e0ONuNlm/g5Ou5037ND0a5a
         YEKg==
X-Gm-Message-State: AOAM5312QV27wz7QLrLT/c8c2YUIpTUeUBfLZ1ny5pc5bzonc1dgeB46
	036omSL9g2Ph8mEHSk8MukqHP9OVtrs=
X-Google-Smtp-Source: 
 ABdhPJyj0kKJnaC1E/nkVlfRNj763lGQ/8sytejgnruRXw5jb3YwQn9k/JcqZxgzcE+0t/o5Qin4/w==
X-Received: by 2002:aa7:c3d2:0:b0:42a:b39d:b30c with SMTP id
 l18-20020aa7c3d2000000b0042ab39db30cmr15475095edr.368.1652871573025;
        Wed, 18 May 2022 03:59:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/49] repo: upgrade 2.24.1 -> 2.25
Date: Wed, 18 May 2022 12:58:39 +0200
Message-Id: <20220518105843.3299331-45-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165842

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.24.1.bb => repo_2.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.24.1.bb => repo_2.25.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.24.1.bb b/meta/recipes-devtools/repo/repo_2.25.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.24.1.bb
rename to meta/recipes-devtools/repo/repo_2.25.bb
index f6e1ce730b..b7332515c8 100644
--- a/meta/recipes-devtools/repo/repo_2.24.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.25.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "0de4fc3001b36db7e107e61586296ca25bbf6d6d"
+SRCREV = "501733c2abb1180679f25b2f78970d73a2f8d413"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.30.2


