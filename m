Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DC6C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 18:58:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.46026.1660849091634837113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 11:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fFHMj091;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id m2so2269353pls.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JbvcBFDu/292e0v0C2wBzbV8Q3DorNVAqNyr1MIixJQ=;
        b=fFHMj091t4e3nGSK20qbYmrYTQjz8rUyNWqfOtUB5Vcyh5GCnF5vTR7dGAtLccWsqj
         5Ue2hnU0FQB96Qtg0B9Jp1//2KxNBE0DYotSiqQyiOWUz+xYrvD3PHew/360nMkf4rzU
         IoXaZsh27SM/UMc8duN9eX5Qq0QkYFW/hOEFbQGJD1tkkGVv6tjyZqc8VzOMi6Jr6YWF
         0BeXUy4/E0dvVBul01FxwbIbGFUc+uKjy69cytM4ULTzK1q9XVvE7Pr8lM53XI14OiPy
         GdcyWVcZcnTbwPirwBjl7O/8ALlrZ7veb2QMfy9hwRAND46m6rXDkexYL6axEwLPj9G7
         JF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JbvcBFDu/292e0v0C2wBzbV8Q3DorNVAqNyr1MIixJQ=;
        b=ANDXdndW2hbaUjrVrLBlfEviikJ/YD8XszR96ZvsTnhpbR+0yqtCdYaekijEeIIy3O
         7qj9FVhhKgXDF7k5+Tx59dlL6g1bn7jkovxubNZnqELs8ozSgKQ42ulHeBrFz3RJNHua
         MS4vnGi9wpo/O8TAv5B+ocrlj7d5bCkrHYoTnA0xYeA4ynrY7NP+GsPYk8YCLSYgo0pc
         xmFIhs14ppN3b+N/hxd7unewe9vxPvl773AcETVLI+6GyVGS59tSms+sz6FIY53sZdYE
         o5s1OaX/u+6/D3cUnR3GSbKIu2SST8cYBTYzi+9I0rxF+tu2vlTfmDDOoMbB7xYMNxC4
         wuhg==
X-Gm-Message-State: ACgBeo15XcLezlT56zb0Fd6isHiGE83B1rabwVW0xPrIRJ7n9aaOYh87
	DPbUYsXwKr39WqImHxwv6lQa4AaHD8wcXw==
X-Google-Smtp-Source: 
 AA6agR6QIaG30WdU0dl4Fpi1aq6CttBIn55AJ/1gocYRqJPHcWdq+YiUG2x85nJXY07lfjyuPSSDfw==
X-Received: by 2002:a17:90b:164b:b0:1f7:6d42:aad5 with SMTP id
 il11-20020a17090b164b00b001f76d42aad5mr10046929pjb.157.1660849090524;
        Thu, 18 Aug 2022 11:58:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a17090ab28b00b001f4f76033f9sm1839078pjr.49.2022.08.18.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 11:58:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip
Date: Thu, 18 Aug 2022 11:58:07 -0700
Message-Id: <20220818185807.340062-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 18:58:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169537

brings in these fixes

* 37e18b7b freopen: reset stream orientation (byte/wide) and encoding rule
* bf992585 ldso: process RELR only for non-FDPIC archs
* d32dadd6 ldso: support DT_RELR relative relocation format
* 2404d9d6 use syscall_arg_t and __scc macro for arguments to __alt_socketcall

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 510dd4eeee..97c27eba4a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "46d1c7801bb509e1097e8fadbaf359367fa4ef0b"
+SRCREV = "37e18b7bf307fa4a8c745feebfcba54a0ba74f30"
 
 BASEVER = "1.2.3"
 
-- 
2.37.2


