Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F163C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 18:06:37 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.127.1682532370764208811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 11:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.com header.s=google header.b=Ghohbeps;
 spf=pass (domain: meraki.net, ip: 209.85.210.179, mailfrom: alex.yao@meraki.net)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b62d2f729so5916659b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682532370; x=1685124370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsL7E6W5HqM6OHmEhkL35N3YaasuqoxWUsLLyAyH1mc=;
        b=GhohbepsRcsa50ooQS61qIaw4VZFJ922u0DyD5bmyuQdJ2hBqTOHIZC5hRls5Rqbyw
         ZzEmRqF381+vUwPR5LumkdnB8agpoQBeCLclBPMuRDTHAizcKHX52Wr/amLWujoGi/ik
         0xM1z2R/p+eTYy8YFSpG85i+eWsxUz1jzi/0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682532370; x=1685124370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsL7E6W5HqM6OHmEhkL35N3YaasuqoxWUsLLyAyH1mc=;
        b=UvHQd6tVRewJi064MU+cw+FsxNli6Pgk1G7pUcQkTxs8ZXEU9hJnF9DMZ41fcTVqFc
         JBYupBXnJSIqcaxrJuZSHeSer7Vw7UgP1PFWL8KsvkbbkoD7vygiADUfsCMHZqLSm0RK
         32mSwT7+/9Tj3ZLRPERlnRupy5cQ2XJevEiYrRD6SnAetORD4VViDN6SPmUST/BwtQE5
         v1pR8MZmGISeuK432zeNk0o2O6Xm/Os/ZapnaIYMPoXr14yyHWBmSaarPaU0kFX28wd9
         XycBxku15rycEq4Px5YBDyEZkcshxuSD+usnmJCKf4In6hWH9mNkXgJzGD5w1NXPS2Ts
         XPCg==
X-Gm-Message-State: AAQBX9eFit65mrvhw3eHzHpQFBaqpzAfmba+uEgeRT7eQ90yVjMNjC9z
	8NsF0xi5SS3kM/IHWIeMZWAPGCbqJCUALjK8CS0=
X-Google-Smtp-Source: AKy350aGoxvEN5FJQdwbiBgwVWzPBCw/wmMJm7/MzoAeVNp7rGwydtiBSNJQlxNV1JtfeoCwxXUrxw==
X-Received: by 2002:a17:90b:3756:b0:24b:a5ba:6ac4 with SMTP id ne22-20020a17090b375600b0024ba5ba6ac4mr12968890pjb.17.1682532370070;
        Wed, 26 Apr 2023 11:06:10 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a858400b0024bcad691d4sm4458832pjn.14.2023.04.26.11.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:06:09 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Alex Yao <alexyao1@meraki.com>
Subject: [dunfell][PATCH 3/3] lcov: Fix homepage
Date: Wed, 26 Apr 2023 11:05:50 -0700
Message-Id: <20230426180550.22949-3-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426180550.22949-1-alexyao1@meraki.com>
References: <20230426180550.22949-1-alexyao1@meraki.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 18:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180454

From: Alex Yao <alexyao1@meraki.com>

Lcov moved to GitHub so fix the homepage.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 3c09161dee..e9ce4df9c1 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A graphical front-end for gcov"
-HOMEPAGE = "http://ltp.sourceforge.net/coverage/lcov.php"
+HOMEPAGE = "https://github.com/linux-test-project/lcov"
 DESCRIPTION = "LCOV is a graphical front-end for GCC's coverage testing \
 tool gcov. It collects gcov data for multiple source files and creates \
 HTML pages containing the source code annotated with coverage information. \
-- 
2.40.1


