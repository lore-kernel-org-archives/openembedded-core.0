Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54B3C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.3082.1639000808079562538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S02r359K;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t9so6503730wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhM8Lm41t2b1g9AFIY5IpnnPaddl0/3Yxl0cDjnsNgU=;
        b=S02r359K9g27SVmOsFwCJuPNvH2cmubXkxVcOiSjghckBmUKK6fUrte6x5Nb72YQxt
         tGa0mME7bUgUytfSYrrcIdLXnwp1jEEMZSCxQ3nk+Ey3D8CqrQkkOQiEHZB+ZZiN+XiQ
         kIPLEA9IbgjlARVnnqbGnoTqMU5EunperzgBMG1SsYLQDbLNWvMKvQmvg/49dELW57Bq
         Uxz7pr1Q24pbWJuaoNJoY/3Oo5v5XUhw3AZsmuLu+BOqj2xeOVoITQxvmlkgQTxLgdNU
         T2a+R1thlVIxYPDpvAVXGg7QIas4++JxU5lZxtysIS55cyCZF2iWb84guvR3cZr70W+n
         2YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhM8Lm41t2b1g9AFIY5IpnnPaddl0/3Yxl0cDjnsNgU=;
        b=DvLceeuZd/ONVna9QN9AuY3A9kGSAqViR4k40vffbCHlIO9eokafl11v4mSm1ez8a7
         jBRXkuijxPkl9Gl4qHbYCmQuidNVvMRCEAKF9BlZ9g3L2IRFk4mbh+mvrDiK5lSaxanu
         2BMtsPLu3xsA40+84+spf4czWlrgE8ZP9NYMkx1DPyXZS3VbBIgRbk0+a5ysa2ghiXrA
         c4Y8HHt3ywvrtDTCrnbwrDW/QmXcZbEVoeOfAZP+45tQHOKRTgK1RpzJvSidcLX4qyts
         LUzfQjshsQ5kEQA7PO1+tjYJhCtg52PDrHFKTEFRDLIY2oyZaRFbTkWpOkfY++8XcUGU
         DROA==
X-Gm-Message-State: AOAM532vT11zhn7hpZaYHEkbdLQrCRpz/az9qj11mnbq2XgA5NlxmiOZ
	4Z8At9QiKV1P4dGdenDScLUHjLyJatf0Rw==
X-Google-Smtp-Source: 
 ABdhPJwZtq74IhSAAJIicQIPM2k5FAINnD6TyKtc37fm0Wvn0Fvea4Gwrce/p+ysPswmNItOhpc3fQ==
X-Received: by 2002:adf:e8d1:: with SMTP id k17mr1495867wrn.465.1639000806697;
        Wed, 08 Dec 2021 14:00:06 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/29] python3-more-itertools: upgrade 8.11.0 -> 8.12.0
Date: Wed,  8 Dec 2021 22:59:32 +0100
Message-Id: <20211208215947.1979470-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159380

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ore-itertools_8.11.0.bb => python3-more-itertools_8.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.11.0.bb => python3-more-itertools_8.12.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
index a18bb4d667..c1e34b205d 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.11.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "0a2fd25d343c08d7e7212071820e7e7ea2f41d8fb45d6bc8a00cd6ce3b7aab88"
+SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d247f6064"
 
 inherit pypi setuptools3 ptest
 
-- 
2.20.1


