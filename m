Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F175BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.4734.1642588903948172187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hYF3eCB6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso1674371wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S41Z6qsUF6eHIjbpFmU6E1nvqAHXkOfKvoI6EwuIuXI=;
        b=hYF3eCB6EZXIhf4RkPCT589HJadBrMMeDpjlYADbDokiQGGmeLkJ7m9NfMM9IpJPRn
         pzE+4OpJUurPFzMSERtjWt5jAt8lTWWX4+naPZdhsCmmghGkv9BQk9lloNlKZx2Vpk38
         l9VLFFU/VZeo5sqdDTPmPs5CLbUEkhc/Pr0YcOLxSzxNhLSrTgwB/60ewceY2jVpotDY
         lFtaNhd9Wmv+sHrcEzywnndTkLXmx4xXp5RGXBa3nyie0MZCg8VxBA4D85hp1Jyb6tqq
         F1E6BU6TmKRxX5XPIOWhkoRIP/Ujhj+bi/yx3InvraADf4+/wzSTAPibH6s8MagNVqAF
         ni+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S41Z6qsUF6eHIjbpFmU6E1nvqAHXkOfKvoI6EwuIuXI=;
        b=so6qdx64NeyCEkW3mA92h8DapPYlPsR/K5FnIGxLrNislIpmee6MTGrqwqPmyB1mEa
         qlQRAzcf1EL+d6dGCyDlKmx0JR8Z5cuBrZzlGk3TQAcCIhQUi90qqg6jVj1LkteY4dsv
         DPdhDAAcqJvexywxzC4+L56n2/uqtrpL9cHimI3WXqjhS5Q7eZ6sVG2Qw4QJS/DtIbNe
         dlLk0CxDIrOlkgGJK1JsdjO+JyyFnzU0ibjHDonFWGEZ5Hi64EPqcK+bGnD6yA3llRRC
         m0mnemQtCw89OhMODQL+BmgMj1fgnYfF93B3Rcp1ElmIeYmU/zEGI5w1TJtKOB8Yhejy
         lkIA==
X-Gm-Message-State: AOAM530vcwpR0Lue9P7dBBRczaLIcMs8lqNT0KizAax7qLrt5Kbo6Vka
	1LDtdBIIpiByYMWrQ1Yn5AOcTHK3eBw=
X-Google-Smtp-Source: 
 ABdhPJzv204MLd0rWjVnrFwLGYLZ0GyIBI1glmlNHzVngwbBtsN6tSfG8T5o3V/Jjrzj2lTAa2U++A==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr14165600wrg.710.1642588902607;
        Wed, 19 Jan 2022 02:41:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/39] python3-pygments: upgrade 2.11.1 -> 2.11.2
Date: Wed, 19 Jan 2022 11:41:01 +0100
Message-Id: <20220119104117.2120127-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160715

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pygments_2.11.1.bb => python3-pygments_2.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.11.1.bb => python3-pygments_2.11.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.11.1.bb b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.11.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.11.2.bb
index a110122501..35d288c89e 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.11.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "59b895e326f0fb0d733fd28c6839bd18ad0687ba20efc26d4277fd1d30b971f4"
+SRC_URI[sha256sum] = "4e426f72023d88d03b2fa258de560726ce890ff3b630f88c21cbb8b2503b8c6a"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.20.1


