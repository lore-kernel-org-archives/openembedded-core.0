Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AF2C41535
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7354.1651727151803966426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oi6dGn/e;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bv19so6556852ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmTdQsbDSPhaTmLZNOtbWLmHBMx7OGk4m2Z3S9klj5A=;
        b=oi6dGn/exw6z+55XV/58pHarraWosy1ltd10aQkIfn15uhVqTDcLuCvzKcoCO8nAgw
         GSAQEvw/P6vZpK7mnG58/NmBbXuRQB94Oyc2aDEUlhDZDxZ4RU5fVRCeaH7kGcUwOFmy
         bp18YIf5p/EdhKbcTmFH04gCZIQQ9qQ+9G1rd2rPyluyBi1UcfiWITiOVbEo3Oxq8QGy
         xC6LNlU7pH3UxP5A9dRiktRdZRAcMQ+MsCvJ3U3RjA543ZEhR+hH2Jt3ZLy+7JAmUAmn
         AYuxxsxlqpyuaSm7Xnky8qMXoVAS4LANrTWa1jArofQKJ1IioOf2oB8e8uQtpoilBTrs
         KLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmTdQsbDSPhaTmLZNOtbWLmHBMx7OGk4m2Z3S9klj5A=;
        b=ZVAnr00iTECHJx/CszTMkAyLW9UHxyCCeN1jVzW2SZRjle2ix0gs/eB84+4n2gpu1L
         GzDr8/uVMnl2iY5jE5MuPC21XibnjRcvdzBg0PIvJIIoscE+cwk7fxtCgsLA/7c39o8i
         AbTcYeBQcR1IojULDas/R9o7i1Wl3ivGExYT8d9OI/ecoAUAIRSmoZYYN2h7/f52LgPc
         R8DbowSzvSDklDteDnczivlybFCuqJ4KlhViXEkh8GbxKMMSiHJ0BkIGxG+fR+mAwYGq
         7/b+2ufu0Bq/svx3rvY0H+7Vcsdb1wA21IUPPXuwIaVm8c/LtNfz8XBSIQMI05pq54pY
         ZpHQ==
X-Gm-Message-State: AOAM533G6sX0KP6XEuAlHsc6jew10/hGk27qTnsLUCAFN6tSb2Wlj8tK
	MBPkszIkOgcKS7TFhw4hkGscfWuGNok=
X-Google-Smtp-Source: 
 ABdhPJzgp0PUF7r15nBDDJi395UfCoovrPiI8m7wO8QUc1wqqqZ+BNo5RAeejaeFm3WqOUXl8L4gIA==
X-Received: by 2002:a17:907:970a:b0:6f4:5ad2:5e66 with SMTP id
 jg10-20020a170907970a00b006f45ad25e66mr16097336ejc.698.1651727179624;
        Wed, 04 May 2022 22:06:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/61] repo: upgrade 2.23 -> 2.24.1
Date: Thu,  5 May 2022 07:05:24 +0200
Message-Id: <20220505050544.651895-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165269

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.23.bb => repo_2.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.23.bb => repo_2.24.1.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.23.bb b/meta/recipes-devtools/repo/repo_2.24.1.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.23.bb
rename to meta/recipes-devtools/repo/repo_2.24.1.bb
index 0b4e9743a6..f6e1ce730b 100644
--- a/meta/recipes-devtools/repo/repo_2.23.bb
+++ b/meta/recipes-devtools/repo/repo_2.24.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "d56e2eb4216827284220fcc35af42e60b4faaea6"
+SRCREV = "0de4fc3001b36db7e107e61586296ca25bbf6d6d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.30.2


