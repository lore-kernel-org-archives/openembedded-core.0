Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDC6CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:04:39 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.5245.1697090674782534360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kUDe0zAT;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-27d23f1e3b8so65692a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697090674; x=1697695474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=kUDe0zATUMKqz1w8HsBfL48vKLDbhYRL1ZTLXcOgYNQb2tFvA1FykyxDikkuGqrv6H
         SsLanoC61dcp74kgZ/jBwxBd3yVVL4iBG0UFjgdr1tv2+GcpOIeAEYXepFAKhTY0ML4o
         Gqn0O+1ivdjjdXOYFXztgqipqpHiouyzo7yDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090674; x=1697695474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=ckH1O5lsuQ5CUdz3bTdi1hSGpUEXM7hjfziKttPfSVM4xac1/RPVhlSKiUumcwXtf2
         SQHs2HhBvuzJhuTgxbthymKPJcuEi3r1NopT4C7C+DDS5mZgh7DdRbRktyMo4WZ1Y7tK
         M6rcmlBTEg33OSZd6A9eSNtJMUxejJomk8aEmK1rXP7c+11Z36a2LHnZszKa+FlR5cg6
         dHXMZo7+HX8YwmrGGpP8o0sAcixTuycpdzLg8YXGRiawzqUZh5eUDnPnPEQ50jIv7ziu
         Mmo/ccvXG8H2vVqzKcuJ/X4mpip8QTlLa6k6ZjVd3CLb5Y34POTfj7/vgIsqpKG4L3rD
         ydAQ==
X-Gm-Message-State: AOJu0YyLwjz7bNBt3nsKAHMMet8RKW+8yVsSBk5OJ0c4OUMJsM4DQY88
	sn1XNKjSeLqKkNdBVInqJmJExYWXcdQneTA1pS0=
X-Google-Smtp-Source: AGHT+IGrbSrNvFqHT7wGcd8JfsDVFJCmLNv5qhg2+PgdjNJ20SSmltwG2MbBYVVP/VSTzfSBL6oLnA==
X-Received: by 2002:a17:90b:70a:b0:263:f630:228f with SMTP id s10-20020a17090b070a00b00263f630228fmr23861625pjz.23.1697090673750;
        Wed, 11 Oct 2023 23:04:33 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.58.87])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902a5c500b001c9db26e2d4sm958253plq.213.2023.10.11.23.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:04:33 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Thu, 12 Oct 2023 11:34:25 +0530
Message-Id: <20231012060425.11383-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188978

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f55f590e6..5e06866692 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


