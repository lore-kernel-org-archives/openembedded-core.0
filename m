Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50792C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11392.1634657689506979113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nlrTiFZc;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso3643126wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s6BYMDbst5+bZRXwqZzqy//35iDZuOfPFKP20sV53IM=;
        b=nlrTiFZc15W/0MHjaMcnjnhPAt3TD2H5Z8pg2HezPdosOroMjoAGgtWbPETqNcLgco
         0xHwrvo9wQfFnwVHOEYxKgd9w/0CMdMJNNQUF73sg5glk92KCNDx5nOC2dCLzKC0nzYF
         WEwqXkaeZfff2/hs5uBaBt6XKjkqpFR1GGKLL6+YQYi0H5OQCT51YDL9/qdUDMwOuxMQ
         R4YYNjF8Ec0EjSLRWHulJD/QqKmZOhWBWtPkBcH+R0dlFt4lbFWTkI6NpUo/vo/kK3hn
         XjHRUrWSrB2em5H4BKBDWZXN8pZin0Gj3UHx2PPwYzbeFOGoEvZ8IRSnJgo62cgiygq8
         7IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s6BYMDbst5+bZRXwqZzqy//35iDZuOfPFKP20sV53IM=;
        b=4Uu6doDUQncknbyr01o/AvlOsP1wFYZSHpEmZTZDaplKdV/yAxsZffFuRpyT49BfE/
         y+gXqE8opHuw242KX0PeCV3RsZqhvmFvBu2l/KUrmi149C7hoHzLOdIolLzsq/YXuFGW
         9lmpjQhOUC5zxeSQSqmU6OjvkSF/7T8QqNUfna0zpT5/T8TVwvmUArzHf2TmmAg88eek
         +GwmZQf1myalePd93rLtOJfKfynTBL3bSUtd2YGfX0m/2MPqXLG6PmQZilz4ojrpjSp2
         /bYeL8UpD8Y2OxKsuXf0EOQ2GYgbatvrqS+GD8pKo/BUn9ymqfEAX7RUsfpnjWxwtWXU
         kAvw==
X-Gm-Message-State: AOAM531ad7hSma4Hm5ldgY2wpJXptV+k+1GFbdheWE3nbCbK1GvjhvEs
	5V3dZT+55aCHxqgHPeJLDTjMG0YPEew=
X-Google-Smtp-Source: 
 ABdhPJzH84ntBQr1OJnP+XuvsCRAK1ip8P5We27fIlPEGVv4AIN+XCnOBCIgxwM4fTiVW8OQhgaujA==
X-Received: by 2002:a1c:21c3:: with SMTP id
 h186mr6780063wmh.107.1634657688113;
        Tue, 19 Oct 2021 08:34:48 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/65] python3-jinja2: upgrade 3.0.1 -> 3.0.2
Date: Tue, 19 Oct 2021 17:33:48 +0200
Message-Id: <20211019153419.3319802-34-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157153

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-jinja2_3.0.1.bb => python3-jinja2_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.0.1.bb => python3-jinja2_3.0.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.2.bb
index abb89c9a30..139fe663e6 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "703f484b47a6af502e743c9122595cc812b0271f661722403114f71a79d0f5a4"
+SRC_URI[sha256sum] = "827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.20.1


