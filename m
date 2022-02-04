Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6AAC4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 04:16:45 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.5351.1643948205061854465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHNePvGO;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id j12so4776248qtr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BquNB8LY7Dr1Q5t/MbU8zGZ3qUVJGD5fGtjc97I7ZbM=;
        b=pHNePvGO/f3kKo/YzNLIA1cmI0zbGAwX7GtsZg3xEgQqetfkPniSRGed5OxuhsdCeS
         5RHHGYFQPwjkfzbZiKRf2Fn+AaRim6gBUHfYO053mndLOOYi0fYJRX0a2MC8Ci3W3qp+
         D+3Wbh4TQsJtLxYAwKzaDUo2Il9rZXfvKxqSQPI4cyJNt55hmoqfb8l24BBETqGv0s6U
         aHb5dEFGnzWCSQ4qAIv9X4P5ECXnfPyiyXtGQuTlDWjXJHfTdFgBESe1IJYReb6jd3rD
         4p2UfIwrHtoON0o4U+1sJgkVUrZHbPXkfqlEnW8hj73YapIU8Sh7awWxQ5GKJBEqAxzs
         o+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BquNB8LY7Dr1Q5t/MbU8zGZ3qUVJGD5fGtjc97I7ZbM=;
        b=MPRrbOSw/ZxuJkqUQ4CJEXVzdpksx+X6vsLIE9DapFJN4R9utAsy5fx/64ob7ve/Lz
         j8HSdjpqCORBBmXqbWNFfwkinkVs6FMdaDRAzfAH6LDoCGBGJO+XCTMx9pagrauYNOTj
         Gn5EtR5L7s5/RluPZlCbIh3AfVTorbiWiX6WvF57gbV6B9cevQaszPB/YyGdb8Lzp8Ue
         ZV89s7mKJAmNqkB6Yz0b7izW971WKS4GPUZP49V5X4bJHz3aY28mjpRhqWTbSVYiLMgz
         eP3QgjVlfLJZlFXX2jDrraL2u6auC/iWiiKWAv4vQuqBwyBMebyuphy4FGmIt05xLLsJ
         IIzg==
X-Gm-Message-State: AOAM533LxdhsSD38ztyKtONJ+MSab+FJzVB6AhRVlmfqXJXr3NUxcidz
	dwAQjK2BJx5Vaaq/g9WfAePELeksOogWaA==
X-Google-Smtp-Source: 
 ABdhPJzZ+ZKa4XHG1V0VbKB9Gje/ligMhHmzWInutykrqVhZeXGsfN/5uJtaLW9NBs75Wn5hqo/wDA==
X-Received: by 2002:a05:622a:487:: with SMTP id
 p7mr861530qtx.426.1643948204217;
        Thu, 03 Feb 2022 20:16:44 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u17sm515424qkp.90.2022.02.03.20.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 20:16:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto-dev: update to v5.17+
Date: Thu,  3 Feb 2022 23:16:35 -0500
Message-Id: 
 <0da187b87df3e7f0921888b3de6be3615f72f054.1643947217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643947217.git.bruce.ashfield@gmail.com>
References: <cover.1643947217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 04:16:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161338

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the -dev kernel to v5.17 to test the latest upstream
kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0d94637352..0d3601583b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v5.16/standard/base"
+KBRANCH = "v5.17/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.16+"
+LINUX_VERSION ?= "5.17+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


