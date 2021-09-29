Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF34C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:05:03 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.5954.1632902702710402444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBaUt4m9;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id e7so1902925pgk.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3xn1owRhCG1PvfXQ1NJmpG2oy/aPdOc+nxT4yhe+3I=;
        b=RBaUt4m9FUVuJmGGZpBaZVr1nFRyYnZj8J9Jd87aNF1nnPsLLuIurb6MZTSthwFwwD
         PUbWnEZNqgF4SHoduBt8Lfzprz65dVq6INUWkua9rSIPu3g9DyaPhRQVYaywKWKtNumn
         5QwOvib4NUohslyuIP27vDIL8T3pgW3jK8ncjcXyC8oRiwr6carfDW0+11Bf+fqVs8Qv
         A5jrSlo4i0MvoTiUQ6nfeXX4To1n8qAhIFwfEN9nuKgMX4Uc79QFVhaf07z+F3sJdzL/
         yBC/VzBOIGf1wRz71pD/pMRjy5o9tMg3iZle2ji2Sx3zVb11IVggkKnPr6UEEp2eqXCD
         MKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3xn1owRhCG1PvfXQ1NJmpG2oy/aPdOc+nxT4yhe+3I=;
        b=bHa+sZnsZQersoiwAAIjga4ZfXyKs5rEFpZ9mYoqLY6QcafF9h/jCWBywcPpq8rV98
         KvagCTtnJJqcuUnCEHqU2ABX95Pty314NG69qA/79IN2VSoP3nXQvjDzvAtTTMqH0Seh
         36P3KzuZzzgnps6duKu+9NAdvW+9xJIkIFWqEydsBqkgbnUhH3hOANkowdS6dbX9tMQl
         kIso+k1Rs9Gvd6hqCjPQEjkb9snD1IaG2Kj1ysMyXwdp828CYcAFBQRQv8X8b3mCrsjq
         tZxKgparJzHwwsl9wcpq3qT/T9JtXXpb99Cdwd6q1hOddbN9deJIOYbYPv1qpG8bbIgP
         6RCA==
X-Gm-Message-State: AOAM533YOqQEHyw3JWwE8Yog4DQ6+DX4yutIRoX+vDrJtsbNAJRlrb/p
	lN0i0fzrhDEyIdQ7H7JhZQwPR/quynHGxQ==
X-Google-Smtp-Source: 
 ABdhPJyazjj1kJ6Ff2PcOkVQd0H94C1UequmMcroQwG/7ziJHkFRuaQwKfJNxmF0OpZN0puvG7s9dQ==
X-Received: by 2002:a62:5584:0:b0:44b:62ec:1ac1 with SMTP id
 j126-20020a625584000000b0044b62ec1ac1mr10020156pfb.2.1632902702173;
        Wed, 29 Sep 2021 01:05:02 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 cq21sm1075081pjb.10.2021.09.29.01.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 01:05:01 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v2 3/3] Rust oe-selftest file
Date: Wed, 29 Sep 2021 01:04:48 -0700
Message-Id: <20210929080448.16224-3-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929080448.16224-1-pgowda.cve@gmail.com>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156450

Add file for rust oe-selftest

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.31.1


