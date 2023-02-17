Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2CC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 13:35:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.6354.1676640894089941963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 05:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/I6d9E5;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id q5-20020a17090a1b0500b00229ca6a4636so1466410pjq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYegfPeiBuavQfQz9NH2AsBJyj3vIT52HZ5jGhnhGiw=;
        b=C/I6d9E5eZrl1hwWfnjk8fMHIPIXpAK8PA08Y0ydKoxbGJsxC6iHwLG+/oarhOYukG
         jdnb+fcBI0yOIGFVHq/ua/2QqH/uJVRxnzhPk56bLNggJKaNAv3w0T/wRb3G6kYmKK4o
         whfKxjF2lGXu9RSh12z+pjQSaNKvEOiwUHu0sIBrH59h5NxzX/X4IEZu32HeuBKMVVjg
         MI5aXdL1391VrWumUTnLmj1VOCjwr3FbwXKQgEknh6zRo++8iQfIFZtdHfrI5i3S9CKZ
         +SckrWQ0HWbcS3jPt8a3i7AO19auRDJIZ0Hl4gLhXXKxVP7pWJDbXb5ZkSfwfdBFCnrB
         9Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYegfPeiBuavQfQz9NH2AsBJyj3vIT52HZ5jGhnhGiw=;
        b=5zyiqVJAXwNtZNpG0zudRuGp30OiYqyCVoKrk8TDJAg5PwjFYbrRxZLQyZ7gobggXY
         BrLFuvMdeS7pTH9L2Ez+y95OgjN/Ow9aXDSIBsJORflgQiuT+bW+Kb4Fr6xrTFOQvgFH
         gdLKWuK06/UI69AN5KULdPlp/W2uRx7w3KYf93117QdqotyrSlE3ZhJqAtgrXFmsnzUM
         gT+1ltEMyKP55g9MDm/TJlwr9uqcu29v8xLm8tAZ7IynIjpUo9S3wlh2XrJz3GBpR8NQ
         8Wy6xb7bFHZ/kyEPKjaI86Xu/7HZoAKI5+UspYxKx3h7tB0bUwdmGkjG++0ETHWlJ13F
         qP/Q==
X-Gm-Message-State: AO0yUKWO9hXdhUG+u/XP02hBtqt2GSNgjlG5KkKEgzD6h6MAC5uSZysm
	TSwexyBG9R3dpQAlWmyLH+m4bFWVXb8=
X-Google-Smtp-Source: AK7set9DDlviQ25REma/r0B4Q3/JpmQe4wt4ahgdZwnlF0ZoaqZNXKOLeTuUOeiibP/Z3QIKz35Oiw==
X-Received: by 2002:a17:902:ced1:b0:19a:a2d8:f252 with SMTP id d17-20020a170902ced100b0019aa2d8f252mr10911499plg.27.1676640893109;
        Fri, 17 Feb 2023 05:34:53 -0800 (PST)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0019adfb96084sm3138299plp.36.2023.02.17.05.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:34:52 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Umesh.Kallapa@windriver.com,
	Naveen.Gowda@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com,
	Yash.Shinde@windriver.com
Subject: glibc: stable 2.37 branch updates.
Date: Fri, 17 Feb 2023 19:04:16 +0530
Message-Id: <20230217133416.2352274-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 13:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177309

Below commits on glibc-2.37 stable branch are updated.

d8e1a7590d elf: Smoke-test ldconfig -p against system /etc/ld.so.cache
6fe86ecd78 NEWS: Document CVE-2023-25139.
07b9521fc6 Account for grouping in printf width (bug 30068)
fb7b95dc47 Use 64-bit time_t interfaces in strftime and strptime (bug 30053)
9f8513dc64 LoongArch: Add new relocation types.
020b43544a cdefs: Limit definition of fortification macros

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index bf6a8c9bd4..1b8665a9d8 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "a704fd9a133bfb10510e18702f48a6a9c88dbbd5"
+SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


