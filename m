Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBE3C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.339.1636573194511683483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EEGxWWCQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5564088wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8VPew09axcWKyo0OP64vn+ILK1SeA7dSt4cAiShato=;
        b=EEGxWWCQws6xgpFa59aKaq9EH2dyZF/LiUHQ75E8mc3J5WsjImU0wpCVi3S9STjyeD
         HO3awDUCxHGp0fLsLa6zdGSPsmYc/m4Ql3G/ca9tjIEFVofyEmOce02s8W6OJj58LCXx
         MU+euTHYI1zyadBfTh53fM868Nf5B+ycgNtjHhpvUHHa0CVB1svHW0Q13RYaq5DgqUOW
         Dqbd1jeeT8toe0saTw6hYiHTkwbT0V2OgYk/6xFTQJ/h1EEAD+zq+GoMiQyHRqwL5wEs
         3fLRrjo1iWmHgLJEW4q78oPzQfNpgbd/rtCInr2GtBbhNRNRqUidVc3UdN8SB/hMt0TI
         YOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8VPew09axcWKyo0OP64vn+ILK1SeA7dSt4cAiShato=;
        b=RfTq9TO8Y49IWPUzutH2Pf+o/ZC8RvYxzDak1Z0TWuylnudBix7/EkRxs/zW50sAnw
         fxRecM9rKRNEsk+lf+6CN1FqdOxe+qLeG3pIukW94IW9Jz3yvMuyMk9ahcSPQK8GmQiL
         JnqTndBc8Ou7HNqBtw07gMgdm2WTtQKrcJl1OMLdJzHl16UEp5ISq8ov6e6ZmZXfuAtZ
         419mQSOEGmT1xv0XLn/AXQduANQ3FQgEyNpg97k1OcsCxMH42C7nLqMLyf2MT3reDzao
         au25VqkWX9Ij9iqWnNtE39GempMFy7DT6cPmKd2lqcHvnvrLXrD/DneeHIqtWDVXc6oL
         xQug==
X-Gm-Message-State: AOAM533U2yGI96fxVq8KqQWCpcwttkzV8x9WKwlMq1OtsI+JiuaypGuC
	piKmgt87wypEMOIvPKdkCSKI3WAKEfE=
X-Google-Smtp-Source: 
 ABdhPJzgnEvMfNr9NiaTbgFP+ARag7sutnDDgiX2uiBQvkQ7D/2xi60wrFOtfR1LTg3CX9L33kzJ7g==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr1884529wmq.62.1636573193109;
        Wed, 10 Nov 2021 11:39:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/24] python3-pyparsing: update 3.0.4 -> 3.0.5
Date: Wed, 10 Nov 2021 20:39:29 +0100
Message-Id: <20211110193937.2606747-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158100

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pyparsing_3.0.4.bb => python3-pyparsing_3.0.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.4.bb => python3-pyparsing_3.0.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb
index a862345e09..6f2c7f6cd9 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "e0df773d7fa2240322daae7805626dfc5f2d5effb34e1a7be2702c99cfb9f6b1"
+SRC_URI[sha256sum] = "9329d1c1b51f0f76371c4ded42c5ec4cc0be18456b22193e0570c2da98ed288b"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.20.1


