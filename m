Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8370C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3708.1684914796120340886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=O1GhXMFS;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-510d8d7f8eeso1570647a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914810; x=1687506810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV4u97YsRMKdO8QLEy+WgBPBzifpdT95B/Met1LCJcY=;
        b=O1GhXMFScMxVu46xHElm51lKOn4ggBPEIgKja7MI5K0SJ8vRTgG/yRnaDo8blkeSaL
         TyobsFv0IUX84yc7ULMd/mIIvybKGVbJL1Jm2inGgpA4ZJlD+vzK7mb+5Pt8eczhiB5/
         ZIivrzfEJVN9IQHZYvVd4vO9XO+tHlN+JR/s2ckOXCuUf27JiAXoTjMTRS86vFGW4QuS
         m3EQgaTyiHLim5DYM2ScdhZGVGq6S3PoubQD3vvJKqd+OceZtTZGoFIvyQfDdVpG3CYn
         rEMc/9zfjgZ0C5NIYn2gxqFF16DcbWdWe7vym8piLCnRWIbUd6TD3csiiIl73hT8vxo6
         pasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914810; x=1687506810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV4u97YsRMKdO8QLEy+WgBPBzifpdT95B/Met1LCJcY=;
        b=cpfDxMarJsFrvycKHa9lM7nNIMFcW+mNy613L2DdCgp73a/a1UScXyinWZ6itYQMe7
         SuOehrMXItdCkL8lHetyFfyccA9FDfF/kr+LUKDDhwL6YYBbM8ysJII1aB/ddIXJTZWI
         cEE26s9W3bt+MIE2xNu+FnZZuYa044L5XpKjETp5z5snqh+PLgCJmTd1tLrYjhC79Xnf
         7+Lnt6/3a7ppCzayOEzn3gIi4eVod7LR5qW+4SaUiUZhmqD85RDvRMyBZ5x8t4f54SlB
         Tj2wR4bGXmGu1gqtCAqpPwimj0oy5RocfiombkjSB4L684vUgc2Yf62u+7oDcg2cBRWO
         RBKg==
X-Gm-Message-State: AC+VfDw/51xrdZNJYFOlEK3CgfR3NlrkNhaZtRymVUqZTwwqs5chxYy4
	FQUy13LHJkHp6eWzzxV7d7eLCTNdTsg=
X-Google-Smtp-Source: ACHHUZ7oTSIEh2kaTuh9CHW6iKjzEinYluQZKe3Hp1xqcK+IhEv91dIhS4Jl3pZrGdk4eIZ5CSShVA==
X-Received: by 2002:a17:907:3184:b0:94f:3521:396 with SMTP id xe4-20020a170907318400b0094f35210396mr14288564ejb.23.1684914810250;
        Wed, 24 May 2023 00:53:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id de16-20020a1709069bd000b00970f0e2dab2sm1938427ejc.112.2023.05.24.00.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] kmod: remove unused ptest.patch
Date: Wed, 24 May 2023 09:53:20 +0200
Message-Id: <20230524075320.1086358-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181665

* it was removed from SRC_URI in 2015:
  https://git.openembedded.org/openembedded-core/commit/?id=f80d136bdd578468035a88125fa1b84973fd912b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/kmod/kmod/ptest.patch | 25 -----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch

diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kernel/kmod/kmod/ptest.patch
deleted file mode 100644
index 831dbcb909..0000000000
--- a/meta/recipes-kernel/kmod/kmod/ptest.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Add 'install-ptest' rule.
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/Makefile.am b/Makefile.am
---- a/Makefile.am	2013-07-12 17:11:05.278331557 +0200
-+++ b/Makefile.am	2013-07-12 17:14:27.033788016 +0200
-@@ -204,6 +204,16 @@
- 
- distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
- 
-+install-ptest:
-+	@$(MKDIR_P) $(DESTDIR)/testsuite
-+	@for file in $(TESTSUITE); do \
-+		install $$file $(DESTDIR)/testsuite; \
-+	done;
-+	@sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
-+	@$(MKDIR_P) $(DESTDIR)/tools
-+	@cp $(noinst_SCRIPTS) $(noinst_PROGRAMS) $(DESTDIR)/tools
-+	@cp -r testsuite/rootfs testsuite/.libs $(DESTDIR)/testsuite
-+
- # ------------------------------------------------------------------------------
- # custom release helpers
- # ------------------------------------------------------------------------------
-- 
2.40.1


