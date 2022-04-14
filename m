Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F4AC636F9
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9751.1649929318054830365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f03kDToU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so2795950wms.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=duYPjs/m5qXR+DOaoipIwKR0LEFDZd0BrZ1KjjoPzh4=;
        b=f03kDToUN4cxZ5g5K1FlgIFGHwnfH14TIYt7ABfXGAGI1MixBGk5840UDJ5+mnPnu5
         6eZ9xtF2ffXrZF7CGMzDZ7HdlbhPGSz1fB4g/jh2+pP1r7ID/3jQpgb8trLlNcRvYJlG
         6flx6ZENUa9Al2xLAJ8rsWvhURQ5ybKqawht0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duYPjs/m5qXR+DOaoipIwKR0LEFDZd0BrZ1KjjoPzh4=;
        b=zmmjjte7zuuHfHvi++50CbzhSaBDTRF7PaKfVulo705NYPs29jcj0EdxRQBF/66pl3
         5DCWnb8eHe7UUCdXKCftTLHdJWbptu4YAlsnb3c1VrWM8wiPsqR7wc/kLHAMr+9fyJLB
         n4uaTNdQsgcxFQSSTplR393tVGnpre1dxQaTKDg37u9URPVjZV8Kr98KivzP1EaC4sCj
         QSOELEX6PxPUXVa93DbqVk3WxuOQKT5kntMNx72hSnFOvK6FFUxs4GdlDhORgBNIIj1m
         QtZZ7uZgGLlkbyi7Ktc/Cq93nX1h2hyoyfXSy0HnIq8g/6JJx/Gsbs+uCBpZe4YuU+3y
         mRqQ==
X-Gm-Message-State: AOAM532Tvl6oZFipRompsTKeHHkytrrsOfr/c/Yuqgtj+ppyMCeUoBDt
	ly9SCAmbzw5lNOHPn+Mt2GEgm+xYQDFo+g==
X-Google-Smtp-Source: 
 ABdhPJyczuvuA24BJUzmTGVCQMt5m2sNA8H7u6QXbztEO28b4LmllmYg6zhjLsQwQStlFgEW0qFCIQ==
X-Received: by 2002:a7b:c119:0:b0:38e:d23c:1743 with SMTP id
 w25-20020a7bc119000000b0038ed23c1743mr2292724wmi.28.1649929316358;
        Thu, 14 Apr 2022 02:41:56 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 g11-20020adfd1eb000000b00207aba911aasm1698629wrd.3.2022.04.14.02.41.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:41:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] puzzles: Drop broken icon
Date: Thu, 14 Apr 2022 10:41:54 +0100
Message-Id: <20220414094154.2235950-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220414094154.2235950-1-richard.purdie@linuxfoundation.org>
References: <20220414094154.2235950-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164405

The renaming left a broken desktop file behind (the others are overwritten).
Fix this by removing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 381d3cc4561..0104f2672a2 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -23,6 +23,7 @@ DEPENDS += "gtk+3"
 do_install:append () {
     # net conflicts with Samba, so rename it
     mv ${D}${bindir}/net ${D}${bindir}/puzzles-net
+    rm ${D}/${datadir}/applications/net.desktop
 
     # Create desktop shortcuts
     install -d ${D}/${datadir}/applications/
-- 
2.32.0


