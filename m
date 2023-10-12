Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B89CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:28:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.5455.1697092093357665278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UObi9ecF;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c5cd27b1acso5560945ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697092092; x=1697696892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPKHNUPjQ2wNskcGA2plnGV3RzkW3elB6OeQJPo7AzQ=;
        b=UObi9ecFV8Q63oRtFTdjBRGuOoaXVY5UUZ0YVtTQMeS2bO0ff3T+sQAkhkvHkjf3OD
         IOjQ89ReHnRcx7F7HVondrWvlpTuP68PSRqUDhznINZY2s/BuRNE76bn+tWtUV9gO9LJ
         jdo4xNJtBUTwlF8WzShUf4G+Fi3q4EMSue/V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092092; x=1697696892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPKHNUPjQ2wNskcGA2plnGV3RzkW3elB6OeQJPo7AzQ=;
        b=UmUZCdTnDaoOFCizSKOE9Ff+D2QtcJ3+kxrYxQBNqaUcicz5O6DeznlGl++4BZzR87
         9T5b/LeinXRRYD2BGRpoc9JachUExzt8SKmG6NBQ+43nDb1NwRqUwGZJasW0DJh5zYaj
         jNMqS8Osmy4lrtE1PHo7MLDB6Lsjj9uoBLtq9X6DY02w8bNxS07ySC0s4yFlcl6/EUSy
         HJDyFK0BtV+Lr9bTUSgQERAXBhkGtdaRHW2oUlJgqU7ctOQfIMBImrMWriuil0XvpkFf
         dKZt8NaEwvNTz+dyww0+Gg4mK3rzdkErKMRZehx88dWq5svndA/UhvQngBzqzogLb2tU
         KebA==
X-Gm-Message-State: AOJu0Yz4CsfS74gU6aBkU9cRY/7eKh4BoyqGqZkzMq3ab4h1RNcnM5aX
	qKRmAYWlRwiI1jJh0X4putzAP2ffNEevJY44QuQ=
X-Google-Smtp-Source: AGHT+IEpKdNHxJvPYY5JeIjeevzeyTWkmCUXMKQ0ykTNOfcT0umQMyNnv7N+uPGsLqwfRBU+eRlhYw==
X-Received: by 2002:a17:90a:b114:b0:25b:c454:a366 with SMTP id z20-20020a17090ab11400b0025bc454a366mr23500294pjq.5.1697092092170;
        Wed, 11 Oct 2023 23:28:12 -0700 (PDT)
Received: from localhost.localdomain ([49.34.58.87])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090a150600b0027758c7f585sm1120475pja.52.2023.10.11.23.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:28:11 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Thu, 12 Oct 2023 11:58:04 +0530
Message-Id: <20231012062804.40719-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188986

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 73e639d7b1..51247cbe0a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


