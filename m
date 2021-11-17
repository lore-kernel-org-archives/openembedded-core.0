Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EF2C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.8806.1637163352663390361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ERaWU9yz;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id o29so2626511wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=88KRXZyiHxd79Xzap7UjiP6YT9+1IEvbNtjslDPsBqA=;
        b=ERaWU9yz0goCwOS493KOddDVtA1VmiUns36WHQV1vPXBapS/NMYLPb3iUGS5lKUZyV
         q8Lup2MMnfq0H4FIlOpkrjpFPXlf24QNBlDRV6k3ukuaojFOIFywh1oWnEoPMsiOM90w
         hLaeNLpFieQhMOrPPuLOGsPrTsllGSGxBmzlSTLJfC5VEnABAZl7K49gwb4xLmx/4IBV
         xse6/En5ThwlofSpxXGN2ByRtuyISPOa+f+uwcYo0TGCLps1W8kAx1p+IYP9KkgMwyxB
         hEdqq1hKfn+TdjpO2vN967372yM7uKI0WWiH3vvNeo3B9NJ98xWGiX30j6/8KJu/2BtK
         fu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88KRXZyiHxd79Xzap7UjiP6YT9+1IEvbNtjslDPsBqA=;
        b=HAiYQ2XTFstAL0cmPc580rO7ZpvEFMpmI4vDBmhAJkFk4Nl3zOQCoDC1GHujGylpGC
         Ye0U+Xn0CcmmRzTMx05/frwpull20BeM5GRv9gcfa6vqFhKpJ0HX3s682ZW3k2TcoHVN
         C5lQhpVe3M+8YlPLcuR1UZpWg4EJzpv7Mx8xwLgsnXL2X+Y4wrtn2ck7NmgQKvuRXE2k
         G+iMg872P36O8okh3XEmVHxbA5UlMXI9MBtFJv6u3nvh0vd89Ywbge6wFk5OxF8OSQNy
         WNkFuGhkhcm7HkH8Ct3pNg7kStbIBxanAOV8CZuB4CfEH517f5RMy57hTYZ4VuB5Xw1M
         WtzQ==
X-Gm-Message-State: AOAM532bTOvTUMKo39kqZBcKg01Qj/zKAXwtSH63kfHsl0mcnzr6vGWI
	PHomvG5gjktd/S+gfUmibUn7O4H/LF4=
X-Google-Smtp-Source: 
 ABdhPJyazKZB6l0EgcRPGZIBdIvOCq5nCgh3rIfSgfurA31n6iepS0wTkMDoFgtfBnMGar7ru5g6mQ==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr605791wma.83.1637163351260;
        Wed, 17 Nov 2021 07:35:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/36] slang: mark patch as inappropriate for upstream
 submission
Date: Wed, 17 Nov 2021 16:35:24 +0100
Message-Id: <20211117153525.257146-35-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158430

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/slang/slang/terminfo_fixes.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang/terminfo_fixes.patch b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
index 3e6d15aa79..3ca20a8cab 100644
--- a/meta/recipes-extended/slang/slang/terminfo_fixes.patch
+++ b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
@@ -2,7 +2,9 @@ Do not use the JD_TERMCAP macro since we cannot get the terminfo from
 ncurses pkg-config, but fix the macro to not reference host directories.
 Also add src/test/Makefile.in so that we can use -ltermcap if we want to.
 
-Upstream-Status: Pending
+Upstream isn't going to take this, as it forces blank values and
+removes functionality without replacing it.
+Upstream-Status: Inappropriate [see above]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
-- 
2.20.1


