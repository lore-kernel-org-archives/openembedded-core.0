Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.196.1630174462502241904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M/3toueo;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id b200so13519902iof.13
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MIQLCZViG69emILvNV0pl7J6epJmNDBb/0yLdNsKyJM=;
        b=M/3toueoSRourU0ts3/8yHxeEw0oAT1voRF/RsSNgWry6QwBMbNHzNbPsOOp8vmsBl
         4r01bxhJhoj6WCwMRE/rA1SbXeE7QPTWfNq3fI8+vPKI0U8g5Orwpga84G64MvI2/9A1
         F5JRXAI1NCGWN9+oTyAKAzoc8fj96INcIWkqhzRJ4XropmBB2qY55tYCr3QjTSEikqCW
         tdIydYlWBPZyQ+ogOzwO8vJLwYNQi1RgiqIj9sF54sX0cGGwEJraTESeyU+XQc1QRB3A
         qLYmPp9+nuBHwYud4B43Y6k/7GjTVCXEp8g5iT/CE3GeJt6pzoBnXQK9OROUy3XBhyxD
         O52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MIQLCZViG69emILvNV0pl7J6epJmNDBb/0yLdNsKyJM=;
        b=IsEJzTM1eEjqrvzeUVD/lfvBVQGwxMl37VKSe5otuyHoSfCUgkBxbccsNoFG5ChUS7
         eC9IlJUMGIS8a6d0aDXOBnwH8z83xAh+5UGhmbE0C2ZeA2vczPML54zkD27DME+7f3lM
         px0cJVDpqkX9Zj0EDGC7rfn7VFzpSTl/2GaMGYlrbqpFSemNuLmEwGGPJE8CIOmi+dok
         FkTgR8sfEmhDBYO4ueznHRs2REfNo+8ftHGMDh57pHwYCL5X6Xnw8hrOfvEt3c+rWqKQ
         jII26ovaRwoJ3tPoZaCCYJ761th3WkkyFqviLNT2lNROs4rRLjiDvWndqq9y/ePTeczd
         +6HA==
X-Gm-Message-State: AOAM532j1ZXXsTwHMa+o2nbtGAsITLq5sRnYxRKN6/JO6PP446i7zcJH
	Z+zaYHCF2Gs0vx6CeBnY24d5diyGlauNBa0t
X-Google-Smtp-Source: ABdhPJwChPRVsFKAtDJX0aiXXMsbk9dUOlP1gUsp2tG6TOCDITxX/+5B29vKV+fcWfZwbyvIDKIrtg==
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr12030820iov.42.1630174461460;
        Sat, 28 Aug 2021 11:14:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/36] tcf-agent: fetching over git:// no longer works
Date: Sat, 28 Aug 2021 08:11:17 -1000
Message-Id: <419503134b76abeb57727259f846a2394dc73ea5.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44a6cd03721b51cbb4e05870375fa347527b0db5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 44a0d227ec..60faf481c5 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
-- 
2.25.1

