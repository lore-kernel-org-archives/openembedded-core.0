Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3951C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:56 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.53464.1638136735507363905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fXQNBm6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id l190so13875828pge.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KXxiHFkeA5e4lnXI1/KwzwVy+Z+rf02pLK6ddthqcF8=;
        b=fXQNBm6iaBALEs7YMtUDRvKivGYDDE8EjriMTEKRK6QhBDOa4e6eHl4iFBRmR1BQuY
         tdJ+NgqAxSj3dWirVgWhl4gfk4fpxJvScJSNqeQB3NDIzjJGqlPjOpjZ+r1+eLR99wVC
         3mhONuJ156yI1QQGgHt7zaDrE/aADtadbZOgo2N7Vwena3qoHfYgCDwmyHioSUG1OXPt
         jLlWJYxInNeYGdplwxY+avqmyfy9s0/G8EJ7d9CvyXzVMg10fT9JsGwBd9pWKzGOq6oh
         mJh96eqLwbcsHdZ26rKjqRcyJfTJdiYXKaN+ZCfKX5N6Z3RFvuc6inRKeNm9y0hyiqBm
         zRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXxiHFkeA5e4lnXI1/KwzwVy+Z+rf02pLK6ddthqcF8=;
        b=ckhl3/+vYkdlFgEfq5eDg/oVGZ+MQD7TlDYhaV5Az+p7JnbCfNaar7YvGa+g32jc5w
         ZGjAfM32beoO4ZSj6zQv8KIuxqGW0u+D8n1f4Ur6V6sr9665fcqlBNoC1uqL5mPC7+9a
         LR0LT5whOVoQUeWvjrNTIxEVX+tg4E6UVnj3LHVUYPSplus/1hoKEjECv8nfBCDzfKx0
         RWYhrUkwoGywiVLM83CS6rDtNpQUpzT2jot2JVAdC+DLBxL4g+sjhYyf5xFSTbpwb46W
         ajiDa+wbalhfsHA5f2LrRp7OHqcsTLmsckoGeVbXrHRaiQL1+tuhGGzBBCgqRZVGo1kK
         HkVQ==
X-Gm-Message-State: AOAM531Wtz7qTkZav3sSYcNpEIZJ8JtqDDbfVLdWmks0V5rBAx0NtHkV
	qm0/tlaeGrU1kEhRnB5XkQtysPMSkcDxXOy5ksk=
X-Google-Smtp-Source: 
 ABdhPJzZ9uZvlxULbS7LTh2RDEl1dSD2SlpqwClcFZSPGk3VCMMoE9mwFATsDndVzZOGJtVz6RhVGg==
X-Received: by 2002:a63:7b04:: with SMTP id w4mr18137360pgc.588.1638136734495;
        Sun, 28 Nov 2021 13:58:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/42] scripts/lib/wic/help.py: Update Fedora
 Kickstart URLs
Date: Sun, 28 Nov 2021 11:57:26 -1000
Message-Id: 
 <f01e3e8ece228a355cb91cbd043e0fe7fa951ebf.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158896

From: Jon Mason <jdmason@kudzu.us>

The URLs describing Kickstart are no longer valid and do not redirect to
the correct location.  Update them with the correct location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5ac75f93c8128b0761af5fee99e8603ddd1657d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/help.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 62a2a90e79..fcace95ff4 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -840,8 +840,8 @@ DESCRIPTION
     meanings. The commands are based on the Fedora kickstart
     documentation but with modifications to reflect wic capabilities.
 
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#part-or-partition
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#bootloader
 
   Commands
 
-- 
2.25.1


