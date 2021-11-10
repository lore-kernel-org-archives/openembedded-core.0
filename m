Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E729C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.340.1636573196392686430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYhgPLu3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 133so3228382wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUFoRBEQSU1phY+/AR398pEhNYl5kjxtTnKyRhewLqc=;
        b=UYhgPLu3b1e6piGAMSqj4N+KTIlwlmSGmszzR0GSnmTK1LbU/P5/XThrB7ka4UHth2
         fe6uNQ6wy+5NQewWBVyMtJXkzZVSC8BRiTIdbMXeeptByzX49xluANXAAhA3v9/skHFq
         Qfp2VqzaTVDZlExeZXvVr+NKnTdSpPEj3Pm08m36Q/hbfL4SZzl+YerJLIfMMRAvTf7u
         Yg3vChkrKMHGVuyXAshpzRbdpJaGgK3jbMEk1ZOcKZQEW5UsZ5WV8cnwhJ21FG2pyhiT
         ztxsoL8jlqfkDf2iubafGykgqn9Ycj3tkMIjZfvIKPFnq4JXVS4HwKuFA7lOwXV47wFa
         38CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUFoRBEQSU1phY+/AR398pEhNYl5kjxtTnKyRhewLqc=;
        b=TwZKZpPJ4a96BUm7DrDt7XbisUDFYBG1+8caaOOz5JzqPHYNuU7b1Rt8F52PhwRW/Q
         bR+euLAB/FJO0sNWPtDOgFPgGOc5qNFnJRolbcJMNOo7fNKcnEbhMTUYpLur3dkaPCAE
         O/IcLZqlMTtwoB3PE1dxF9+Nvf/XaWBzamHkYGtUL64d9BWLxMhUqpKBIA1alT9DZb00
         gX7ArPOI5bAYf7L4B/67HKOTpVPxZYtNqZK4zbzRlK0PRkoCLyc6MstiHUKC23PFLlLS
         dpmsiLeX5rdXwcvkKxie0DqngXw6aDul5o4tvbLUUH6oYKtWTgvLqHEl7hb4689iXSUr
         omiQ==
X-Gm-Message-State: AOAM5318MKX/CGszTl1kRvXrnognAK7e2J4kd0gENjXf3mgVvFosYNBG
	vdMGDWbFuVPGNFkXPlRepwAGrYSFoMQ=
X-Google-Smtp-Source: 
 ABdhPJzJ+fq7heY5WGmoq9wpqirgEeilaoM76ViqpD9tzJT0NwKEmKiwNni/Glg7F8iWqoFD1/WjEg==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr19739416wmb.155.1636573195057;
        Wed, 10 Nov 2021 11:39:55 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/24] gnu-config: update to latest revision
Date: Wed, 10 Nov 2021 20:39:31 +0100
Message-Id: <20211110193937.2606747-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158102

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 794e39546c..6b025fce2c 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "805517123cbfe33d17c989a18e78c5789fab0437"
-PV = "20210722+git${SRCPV}"
+SRCREV = "191bcb948f7191c36eefe634336f5fc5c0c4c2be"
+PV = "20211108+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
            file://gnu-configize.in"
-- 
2.20.1


