Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D57C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 04:10:45 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.22913.1647231044960290338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 21:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zn4py7xr;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id e6so12684475pgn.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 21:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MQBbi8K0XxzSAAgLsh7UGskwVbp+8X6VEg0hDgT8Vgw=;
        b=Zn4py7xr7G1OfS6oXkkX+P8hl3WX8hdrcZYWzMe5Mz7uL6VcS43nBdz5ktP6hrN0Sz
         2SXTjqpW2ujWsMPQxcv6+IzU9/yUDS44fMvrat7Y0e/Hf8CpTSMZ9VwFu07kKJOXRZmE
         54uqExrkbULwv9LBHuC/f5J/fXJ7Yj+2bNcxobhb4V+Nv94SNgByhHmSuwrtU1xmiber
         Hb9tslDIFR0EV0GE16UML/gm9+7p8qonlV/nuLnNrTiwveW3ZTy9ijCCxRGhY3od8nUE
         8zacyGcE2hcXvhT7n5V4bEsjhPDRpTgBK0XFDSmOX7bW9CWkAdGdefTrBVewlFigGQYy
         XINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MQBbi8K0XxzSAAgLsh7UGskwVbp+8X6VEg0hDgT8Vgw=;
        b=5b5KaQqGsrak6c4GjGlnatwv1njELjfcO56AE4+moyvDIsfulORiHHRiWTfofwpkK1
         p8lwBt2/D8lGHzMg6PSXB7xe2j3GmcS/MykXP/vDbZzidZKy9Npl5OptpfBWdGz/tFRQ
         8y2aQlXYoOvwWjKsVArYS7dHTDjXuaQhkBevzsRvU9FwpgFSz/tRYDE53VcNcJTKMbgM
         SROx5nIy/BJWR9lHmvPer6XLJ1wt6mqp2Jaf+nItb3dDLqFKgEksIcswIGkzuYCm18yn
         KZBPqH0ySYXCnR8IlmD/R5pKqMO0VAisJKUmU74/8nKhBLr8VI6/wWMNJJSkbJgV1BuW
         6mcQ==
X-Gm-Message-State: AOAM531rrYBPz1MG5eMJPZ7Z3RYtPpdswrdBU0S/f/UsAGiifJ4eI6Wm
	0RvxlWEOX9AXOPf9D4DxGK/qQiVUQkI=
X-Google-Smtp-Source: 
 ABdhPJwkG0HQ8wwUkWvDyjNBnu3MS+WIFJeTBirLXA8c1VBs9GCrVq2Wqi0LUJly2VsVvnT+BTjvBA==
X-Received: by 2002:a05:6a00:2314:b0:4f7:d9a0:3396 with SMTP id
 h20-20020a056a00231400b004f7d9a03396mr2465908pfh.11.1647231043755;
        Sun, 13 Mar 2022 21:10:43 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:f0e5:9c3f:5f9a:6445])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a636c06000000b00363a2533b17sm14883090pgc.8.2022.03.13.21.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 21:10:43 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] ptest-packagelists: add python3-bcrypt and -pytz
Date: Sun, 13 Mar 2022 21:10:34 -0700
Message-Id: <20220314041034.671280-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 04:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163124

python3-bcrypt and python3-pytz both run in just a few seconds, so add
them to the fast list.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 45a3d3fcd56..c705b41a94e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -49,12 +49,14 @@ PTESTS_FAST = "\
     pango-ptest \
     parted-ptest \
     python3-atomicwrites-ptest \
+    python3-bcrypt-ptest \
     python3-hypothesis-ptest \
     python3-jinja2-ptest \
     python3-jsonpointer-ptest \
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
+    python3-pytz-ptest \
     python3-wcwidth-ptest \
     python3-webcolors-ptest \
     qemu-ptest \
-- 
2.30.2


