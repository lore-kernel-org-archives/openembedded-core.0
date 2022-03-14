Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B93C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3259.1647298151117156624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a//Hu1s/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id i66so10173921wma.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/T6elUEfoumhIoFLTYTnqeQ7RABK57HBPnSCpEAU6n8=;
        b=a//Hu1s/+pd1B+3buquuTyt14LcvDxhGikTUYUJy450gPmWnEX8iGNhyishEKoU14l
         KpjGsXTDGaO+8QDzyKZUF3zMQltYKZDo9AL9pAnMvV43UiayzLD83rFayJ7z4xztv+bB
         EV1gsfGZO7QeQplXX4oLyNiMawG0a/fK7iCZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/T6elUEfoumhIoFLTYTnqeQ7RABK57HBPnSCpEAU6n8=;
        b=21tQqtvBoVc5hC4giyRnof9L1LQQHNyQnJahYMQxHLoqkO+pX5u3DVnegeKB0n88oI
         2QWjKViR+mLJUqda8Ks2umTGfcyg4RM4b/cAmIxnU9+xbAnGQnDIOXABkDYO8TxXlnd3
         XgC6nd/5of7s6B1I/Htms/cyLYRKdNw+URS+n2s8wuPqEAdXKcqcSLYQ6P0RO7BrSaTH
         /20bDJSTJq3MMwud28G9jKcGMsgn7o5zA8Xi3uLhaBxasjLHzv/rwvbz4KF4lEyt8XeE
         PnNu3qeevSGkoKpYkCeEJOekii9N/YZunN/WJG64hExvE0l05mFY8Qzk+boI2ugxkwB+
         h3Vw==
X-Gm-Message-State: AOAM530Ke7d9Ba9vctrytvAapeMsrToglXF5aBiXAKNrUhb0OoC3nWJu
	JLCZqTj1RK5zwibKisr8AI37YPid2ELdeN1H
X-Google-Smtp-Source: 
 ABdhPJyoXpYWgwySGJ5juJlZrh/CHHDZLlXnmRpK05dmT9RVHct5+VXuMtJi1+CXGOwxFC39jTI0NQ==
X-Received: by 2002:a05:600c:22cd:b0:389:c99a:45a4 with SMTP id
 13-20020a05600c22cd00b00389c99a45a4mr1021121wmg.38.1647298149359;
        Mon, 14 Mar 2022 15:49:09 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/33] python3-psutil/python3-bcrypt: Add missing HOMEPAGE
Date: Mon, 14 Mar 2022 22:48:34 +0000
Message-Id: <20220314224837.834776-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163196

Add missing HOMEPAGE entries to the two recipes imported from meta-oe to fix
selftest failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb | 1 +
 meta/recipes-devtools/python/python3-psutil_5.9.0.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
index 92a6a0d8c5f..731aff299ba 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Modern password hashing for your software and your servers."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb b/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
index 3df0e5d003e..df304f01e69 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
@@ -1,6 +1,7 @@
 SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
+HOMEPAGE = "https://pypi.org/project/psutil/"
 
 SRC_URI[sha256sum] = "869842dbd66bb80c3217158e629d6fceaecc3a3166d3d1faee515b05dd26ca25"
 
-- 
2.32.0


