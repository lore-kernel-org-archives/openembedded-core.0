Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514B8C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9723.1633945272416287520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zv0kQCFC;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e3so20541461wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=frvEvM+5dAhwh+0XNgA/auAlBTzTkFuUv0aYP9BjS5U=;
        b=Zv0kQCFCq9mq1vXBgHbKGzVcm+nO6RpI3QDfmVCf7wL1U9IatZT16AxbSMi+Er08fL
         grxkWcH+vYtkvTTS+0dUMRiV1zbPIIBlWXqNO02w9+6YN1ICel54JDE1XAmpfAsLHbdZ
         aeTS9oM48WLCqJao++6ZMLn/WE/NeXMlL5M3WbsLQ2xjf2/m5oDEMFAIFPSTWjfu+phN
         vozgjaGEO53TsIodb0FRY36M04jFeULEhs7Pq0M7CAcok9mT2D/JLFJTK1dqen1Qft8A
         cHVXw+bikCJCHvE4HrkqWiF3JrSNWeD2GpNgqIo3uWaAQwI94tv1KTya9B80i6Y9VTE9
         WtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=frvEvM+5dAhwh+0XNgA/auAlBTzTkFuUv0aYP9BjS5U=;
        b=ExdQkzZXT9wB38uR0U9t7TRJNvNqxOkVQHrSXj52cL0wL8nWp999fa46sI1rZfrSvl
         dJ2P92ZAANSYBRt03upF1giLaMItvxQ2HKgw0LyBtmopBaDKqFm0JBWiZBit5vMFpXol
         E3VPC91b41TyLU6QqCGM54EHHhTR7nwQXxSAIC8RH/qk7aTgrg18w7fGXfnCupT2256A
         qQir0G46tGchUkp41m6upPWaxYxkO0wcxWZ/tmLMs/8Z23p/A/ck37Sddo0h/h2tRNo2
         4RhVe6IY5PcBz3AMkJsqxxOR9iWAWHYWgk12Zn8p3IgCejP2pTt9QVoWvLuJeEsKPp9L
         wOig==
X-Gm-Message-State: AOAM5320H0FdLzaSzHDcyjEopky45WL+FdD2N98otg/C65tmvZ/OBFGZ
	vALk2l5gCV6kh5C6xebT/eslOAtpDQ8=
X-Google-Smtp-Source: 
 ABdhPJzc3YvCj//qvtry+JzUkAQcNUgR1vLvZKf0rzZP0aSipQOZOJtEiJPwHxpeFs+qRDZy2SLxrw==
X-Received: by 2002:adf:a390:: with SMTP id l16mr23006860wrb.72.1633945270970;
        Mon, 11 Oct 2021 02:41:10 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/25] glib-networking: update 2.68.2 -> 2.70.0
Date: Mon, 11 Oct 2021 11:40:46 +0200
Message-Id: <20211011094059.4184654-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156825

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{glib-networking_2.68.2.bb => glib-networking_2.70.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.68.2.bb => glib-networking_2.70.0.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.68.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.70.0.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.68.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.70.0.bb
index acea26e0804..fc700e03b71 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.68.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.70.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "535ebc054ef697db56a4fffed91bc0e11c8ee1c9acb48aad28c8e1d5c3d5994f"
+SRC_URI[archive.sha256sum] = "66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.20.1


