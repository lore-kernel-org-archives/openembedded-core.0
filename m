Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03827C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 16:18:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.25903.1637943512437062541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieHZNIfc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t9so2772302wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7i9IQgYMgMWu4NieYr3g3L86VQRxNzuwhq7SFUK5mwg=;
        b=ieHZNIfcdgjRrwAcycRjVqEVwhunc+hjD8dF7vqNs6UYCButxLGG2cwAh8Y3C0o+d2
         ZTOpGUF7CFHl//ymkY260NnR2f29cHyNkxaV1n3Xe9SBfNe79K3CSW/jk/vX9kPAqExb
         IN5Q1CmX51UjKxYud023KdVCHe4gecxihu+t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7i9IQgYMgMWu4NieYr3g3L86VQRxNzuwhq7SFUK5mwg=;
        b=PwFG+agac76WpNwda9rob6aSpeS+q5g+tJf36gj7zExvFJGqxZeJF9SUMK7zyrwNLV
         WunN9hhzp5TzMdGvdEdUXQxDGzubX7DZZtJcB6ISTcDZpxM6dtPxd6dpxQncP7yVI8sS
         6qGyZ4YFmAfXREMmWfDgIXojzNBOq/G6GAVJiUcXF7Yr52b/LQ+rgL2ggewPp+yUQxIn
         X/kBH4zu95N/hCtPwgO43xY92DKS6pseKGN82fa8VYBcSkAgWsuCQlZ+3iyfvBuR7Ylt
         dm3lxn4vO6xp4yCUMeK/jXngNJbVCuAi7fMhHACYl1a/f755S5WcLfiIXE3kZCfhKLTN
         ZoNQ==
X-Gm-Message-State: AOAM530KRvL1nVKjyb87uIuCUM3Y6ylCs2sEzmHC7/XVo7lEnwzd/Cge
	8ZgRfZmrzqNviHNRx0NKntw0bKuooeDcYQ==
X-Google-Smtp-Source: 
 ABdhPJzcQnLWChmofD/LwbNnFnfXzVScjxxF3WzUdPJgx/cEouaiRztw1hVAuALIE3N4NhsJ3/XXAA==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr15824399wri.297.1637943510800;
        Fri, 26 Nov 2021 08:18:30 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 f13sm7853640wmq.29.2021.11.26.08.18.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:18:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ptest-packagelists: Add missing python3-jsonpointer entry
Date: Fri, 26 Nov 2021 16:18:28 +0000
Message-Id: <20211126161828.166193-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126161828.166193-1-richard.purdie@linuxfoundation.org>
References: <20211126161828.166193-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 16:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158837

Resolves:

WARNING: python3-jsonpointer-2.2-r0 do_package_qa: QA Issue: supports ptests but is not included in oe-core's ptest-packagelists.inc [missing-ptest]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 374c1b8c150..bf9d158a0a4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -51,6 +51,7 @@ PTESTS_FAST = "\
     python3-atomicwrites-ptest \
     python3-hypothesis-ptest \
     python3-jinja2-ptest \
+    python3-jsonpointer-ptest \
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
-- 
2.32.0


