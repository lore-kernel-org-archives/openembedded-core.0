Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C94C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 05:59:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7150.1676872759378615627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 21:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UX5g711B;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m3-20020a17090ade0300b00229eec90a7fso223104pjv.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk9pkLVmc4nqGXfC12/H71tg0a1iwJIIPKS1WHlUPEE=;
        b=UX5g711BRxjzisPjfjHykd7LQkEEW2oNgETbPNXj8TmR5eIz0mMUSlTmFMez8pQBns
         zePq7nX8LNfSf9wae8USbkwIWZF02O2PWbFctQ4srRbCgQfJRPAMf4L/7qbNTkoXRaKi
         WB988b0DRIggC2Tyt8Ox/kLGzdTkxkHlT/CE5VWxuJSqBJ3UzyibUMi0lUnfISxPkEou
         aPgxAr+hDEa1Uy9lNwFRW+OM39pt41C8fl/dH9i1nGlgiOY3aAanOsktWQIikl8mGD45
         Tt2gALiuWRX2OtMGFmQQyHd3kY8UxLo4qtXT+nPYmUjnQvhgLjJvC6JY5f+M8vqZ5SVI
         hg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vk9pkLVmc4nqGXfC12/H71tg0a1iwJIIPKS1WHlUPEE=;
        b=QnVCL/dvSZAvV5oeEFqhp7PVuTPWbVswhoM4OaU2mB9Lq9uD/w6Hyj+uHc6ggz4eYR
         gIgfN/kRmPDCUItaTr0et7KDNPqmXhBPL/dPdCYdYfA9tdSv5cKDqINhmagwS9IWWil3
         hqmuWI5t6ssBYV2lFIsZRvGnMCywN931SX/5XUgRPLrtal32x29B75ZDhmyvaDeRkvjD
         zRApOPvQ9RiYKk8mVnNvyHOuphM5F4D3EBy81Hu1f+FqgMLmrKuxu814Cm+FpyUrxTAp
         6DEgtCM+00MgjfoqVWJnJvKJjOHyj6NheY0B6kdZqIxw78dGamBbUa8g377BApr6ci88
         lTrQ==
X-Gm-Message-State: AO0yUKV2y9VWe8nkdiVzMABMr9Kln4nrfRH1FE8c7a4Yck0gIiTlzu/1
	g3OADH6GeB00izWX2FqOUIJcjzylVVA=
X-Google-Smtp-Source: AK7set+jP/YTUnhp6H9BPFGX853yCmExv/9AQaRZ7TBAFa83BpdhOfLArpJkrRrsSxpY+aicb+mrYQ==
X-Received: by 2002:a17:90b:30d7:b0:236:cace:9b1f with SMTP id hi23-20020a17090b30d700b00236cace9b1fmr1211977pjb.22.1676872758541;
        Sun, 19 Feb 2023 21:59:18 -0800 (PST)
Received: from localhost.localdomain ([122.171.165.129])
        by smtp.gmail.com with ESMTPSA id t21-20020a17090b019500b002311ae14a01sm566726pjs.11.2023.02.19.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 21:59:18 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	virendrak@kpit.com
Cc: akash.hadke@kpit.com
Subject: [OE-core][dunfell][PATCH] git: Whitelist CVE-2022-41953
Date: Mon, 20 Feb 2023 11:28:37 +0530
Message-Id: <20230220055837.25320-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 05:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177395

From: Virendra Thakur <virendrak@kpit.com>

Whitelist CVE-2022-41953 as its specific to Git-for-Windows

Link: https://github.com/git-for-windows/git/security/advisories/GHSA-v4px-mx59-w99c

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/git/git.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index b5d0004712..9cc4092e17 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -24,6 +24,9 @@ CVE_PRODUCT = "git-scm:git"
 # we don't see this as a major issue for our general users/usecases.
 CVE_CHECK_WHITELIST += "CVE-2022-24975"
 
+# This is specific to Git-for-Windows
+CVE_CHECK_WHITELIST += "CVE-2022-41953"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.17.1


