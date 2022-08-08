Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3735C28B2B
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.22574.1659940965163259279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SeF0TNwB;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z20so8163498edb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=340w38EUD1RsqqNFk1BrCe4Z5+LOT8a4oqF5q1/8FaA=;
        b=SeF0TNwBvNRtXt8hK5EK38VrCcGQdz2JNz6BdavrvMSpa97kWUEDJpMttoxe6ejKEj
         mK6wH6BeVwv7ErM0UfttUM70sGn2w4Qspp4f+CES/WBLO4xUNjcGgughwRYAen+08zFn
         MqESduqSZrOpANl1jHARoVo+RmDaYGhSBuTNWF3A/A+0iQ/ovI6itp2d+I4NuwLlG1rY
         93wogiVlO9Ev7kMvU3OhtQI89QoCVFJmrxPpvUWobsKyaQCTUopbUoeXC1zfWzGOCCUR
         UqKs3g9MbA3hygHD80z8/4JoZTOUFERpgVrhJNHgL3ty4/a0nCkN0Dok7bQF/9PPKfAv
         Sucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=340w38EUD1RsqqNFk1BrCe4Z5+LOT8a4oqF5q1/8FaA=;
        b=afNhbQhx+NQTgu3qff5NyGS9hnVDiTSb3utHB7PvSOq9syM6AoRs6vZGChlN+VPAHD
         7UOmDH+PbcxVYuylrMPB9cFJz01yUNpVhFpIEvZVCi7D0GvL2cTBqy9C9lEmZjLzs/Q+
         TJ7BuRQydaweqxhjOXLOnz2iBh5R2e/v8P/D0K49SeZcgQDEMwbo4aSBWfn/42clCL6k
         tdlObfK4e6/4Jnk3OxE1yahvgBhYCsXdDBIzbvxESklEq+QQPq/SSMBlG9mRL4AAzudx
         TvTlGL6sYvOynhns02I11c8iuV2neBm7tAsWy4An6hmpQurpzyaUC6Ehl4/zG5WyRQZJ
         Mjhw==
X-Gm-Message-State: ACgBeo0qwSjBO5Z3uBYfwWGTXXP8yaHiaqPE2Dtr23iEVsAnKqnVf0Pv
	T2XowdSOHcFyZ4u7HprlhZRr5cPC05U=
X-Google-Smtp-Source: 
 AA6agR6uUMuHnObA04mfuKbFbFbsGA2ICpqX/gGBTluiK3M6mXkdBlJrdntfMou7YNkluz++pHrjFg==
X-Received: by 2002:a05:6402:35c:b0:43c:8f51:130 with SMTP id
 r28-20020a056402035c00b0043c8f510130mr16540764edw.393.1659940990834;
        Sun, 07 Aug 2022 23:43:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 34/44] python3-hypothesis: upgrade 6.50.1 -> 6.54.1
Date: Mon,  8 Aug 2022 08:42:27 +0200
Message-Id: <20220808064237.3975347-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169058

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.50.1.bb => python3-hypothesis_6.54.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.50.1.bb => python3-hypothesis_6.54.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
index 0c93c12493..afcd5e64ef 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1a19ade3b27825cab622c95fcf25182a27a42f97589c163173fcbdafb8621d1e"
+SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


