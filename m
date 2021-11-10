Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E374C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.336.1636573195387427779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mrBJadDE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso242773wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GEau+A/xWBhCx577HytQVCM7lt+59UTh2nqQgnJ6uDY=;
        b=mrBJadDEN9H41uBuD2V9bTcb1Sf1hW+q2IWRAVIlHhNTBtIg1r3AkTqRltIyjwYTFu
         sfVG2NjE9Q7VLtbPHwijLTXOJBP2PzB9HTt++p64LLe9lRuiB3EbllUbk9UPpChGHo29
         So7VAZRDawJ8kAofbU0MwdDktAELcFbsEHxRD5se2bEmUk1FGzK6QDpVjJo0yKK+SgNv
         KeXJcYZl52rvYUeLIlFMN+vwv5s40W2rRrjj5/QvqsMea0nQ221eEJbjfPBC3w38Bm2i
         +yfh6Oyn1NLXp5rqs8IXlX0n3gq3rp0WqapdRVZaAyC7oj+yOeWNeJl03QrkFYYZHS9f
         lhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GEau+A/xWBhCx577HytQVCM7lt+59UTh2nqQgnJ6uDY=;
        b=at98hfNJzov6MdX7AB5OA/AT1FUX0UShGWvdSCl192R79AUkTO2C9/Bko12DGwd561
         tzfEUoGmugbDgpiGNkvGq5nWQshb1HFCd8Oi+uLUsLPWdeu44XaVIUqkDx972hjXt7DC
         E9Ai101DbEDLYnhRzm6V/PlJaduS6Pw7rgpZasv9QEVQn4tK8dC+2d4JZxPPDovZGXLk
         T+8QipbDYFIq68gGrPuwHoVfHpVq80GES5y4gzxsgm1HwhbeolP4j+7q8mELhxbDA/VR
         fWDKHsNKY1rTQ+XwxzEnR7h+2vHDI7zVcw/SIDq3iVO1PqeyKfO59Vp6XbTvBXB954XN
         86fA==
X-Gm-Message-State: AOAM532SmaU8tBThfT+i1phv2LEKE0K2qhe+ZYQzFPPsrnwSYZJlE1kr
	9QX9Sdjy6BsGwzKdfrXn5uS7eJJhlMw=
X-Google-Smtp-Source: 
 ABdhPJx3+3l/fjSJ6CkGEQ0q7YhD7sbcr+tBHKsTmCMzrM/TrZyIzu34XHGxkJRFzINIJelTgHdXIw==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr1888734wme.3.1636573193829;
        Wed, 10 Nov 2021 11:39:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/24] vulkan-samples: update to latest revision
Date: Wed, 10 Nov 2021 20:39:30 +0100
Message-Id: <20211110193937.2606747-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158101

Mark as incompatible with 32 bit x86: there are several failures
and I do not think anyone is interested in vulkan on that platform.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index c1ffc7ecde..613ed592c6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,12 +11,13 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "d2187278cb6632ce35920575832eb6f6e2b2e46c"
+SRCREV = "ae6e4a3712cebde49a29e5996a3bd2f403566890"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
+COMPATIBLE_HOST:x86 = "null"
 
 inherit cmake features_check
 
-- 
2.20.1


