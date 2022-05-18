Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13450C4321E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.3577.1652871540591041818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TG6BqMqz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n23so2553534edy.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MoQxZqZXX+84BxIJZhtb46A6BWj3TCeXabREOsz9tc=;
        b=TG6BqMqzuVWazIxHr/tmDaN5rK5uY3u/JtC5sPX1Nok6hDcNsVhaGC4CmOgKw02yuV
         LMby8841rOJ5/SsY3nnyAnqRRaU0GUMSWqgolf6QM1LVJUODBA6ntxwMCZolVmRxeunn
         VcO7v+5wuU3xJU9TncQBJ3rXPqG0vIIvxBqPB+H25C5XxXcY8trmDoQmBOKuixG+Dhnd
         7EzQDTLcsFTGyLl1IEK+MV1nIp1EreAS3pfpYeftLaeQHmG1Js9JLaP9dZX1sasZoTnb
         iqeUsREjlM6Ft8PJWgTRWy8D7wx+PPHQxTRv3bP6GUoggaMHTz83glBnkLB+E4WBIbkT
         DCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MoQxZqZXX+84BxIJZhtb46A6BWj3TCeXabREOsz9tc=;
        b=ag9OyTnUlcR4XI+ZEKhdZ8cxrLO9Vtn4QXfFMkDq5z07qjS8J8u91vFWLLSbkXJ3Ik
         aNxaMPXlLYWX8lFVTy5127Xc7fcXkcCUBmQYss5t9MTYaZxpmOy7KkB38t01Zh0ogAya
         7LVc/UJLDrf8ZRZ/rJXOFUag9bbJ1YIcHQF+ZFaLHlWD4Qu4VMCLYjQQyIElKOPXl9vH
         ZnGPoHZHnZgvzghmdDOhIuCmx2+ILDkpYqG0GzAJDM2ta2QXvvOPNZmjYHr2m4UzAKHj
         WcLCYd5CCfl1Xkwcn6ZcTm1bdsSP+3xPf3Q4AMbGS0zTm0iOVgh5+zsnWxDhlkcq7POU
         HElQ==
X-Gm-Message-State: AOAM530ED2pQTtfoZsCSUfdoxnUiagRWr+LcIjJDuKngDYuvNktQ1iLI
	ZOJiDokgXGu6dCmYgOsRGghU+VSebYc=
X-Google-Smtp-Source: 
 ABdhPJyMEiJH8mkIDr7vBEFIdgvFDbRN1KBDpLISVK2ln8TQvrGuH0rpz3/5OzxpJ2vWsKV1zDG7GA==
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr23761929edw.113.1652871539205;
        Wed, 18 May 2022 03:58:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/49] vulkan-samples: update to latest revision
Date: Wed, 18 May 2022 12:58:06 +0200
Message-Id: <20220518105843.3299331-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165809

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 467295dbc0..57d3bd8fe5 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2d20e243b8d2553b2a9d6c9a636bf9649b76ee03"
+SRCREV = "0cc04a63583769bd13bcc51229a5a263d59343df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


