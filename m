Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57544C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.11394.1634657690869688412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VIQuU5PI;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso3620275wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l0tK+Uf/gLjLibXPYb54pTEa4r6foWmae/0GWDov9BM=;
        b=VIQuU5PIceShoTBIWPnpnltq7W7rRRn+LGxbIb963CuCu28HQk0PY9Gu8YXMAb7+p/
         0T1MiSqWyfu4nkomqZJIiLBFmjHIukn4IHgmKktB51B7XzRn0qR+fHsxGADNXGkwyKhv
         j3U1352W4A9TZpcRHrZH7cpG2bZ4gax7+ymMZXpybUxuAjUax7XjQF17mcUbD6A7WJAw
         62lEp+og4czV1uEIpAa/FrsVZiV/BqClebi4FNG9LQDKY80Sm6o1AcOS4OaZVstsxOiN
         gzt85XbUquC5AEl3DIO0kYn5SyLkJ+yg7OkzIvqEXgIfWUtEPzjUHlPJJmmPBy5jJliY
         o8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l0tK+Uf/gLjLibXPYb54pTEa4r6foWmae/0GWDov9BM=;
        b=i6H1/pRzs6m1oSYxFfbuazIQ3pBceu6wthHvKFTPu774FMFby05su2vvJMdmPqdVfq
         S+OlVtPCcGamEew79Erg//gl2JtC9WUPG/wx2bxeuHJcGvR06ixdjdqZO0BIvBFXwI90
         Gyt6+EJcB+JiemoqjZDeekDXx/ohqGitXiykmZDGjDmA7SF9o4v87+y2rmLfakXzGsND
         ODQVk+EJxk0+aigiNF4wjQaCKeapw5YjWMvkdifvDbuAQZimxXJt5xbDuP0RCNUk81Vr
         6SWX+5Suo8uCbEoxe4vK3cFxco2pAZUW7t9PnaF6R2w5mT4lExrsHGDhmry/tO2LqXgd
         LIhQ==
X-Gm-Message-State: AOAM530yt3IC4XMviz0Qfu3uCL3WN/Vczn/274PuUYxO7uG+g3edmT1+
	WYhfd/+ZTRDPz3I2fPqEALpX9a6eDvE=
X-Google-Smtp-Source: 
 ABdhPJwbMGIATeyevJdjNh47bs2J+0PWm2/0Mnh91kKoFcTrEmq9MmStlY5KxG+oAawFUMy62Xij6A==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr6849600wmq.63.1634657689525;
        Tue, 19 Oct 2021 08:34:49 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/65] python3-setuptools: upgrade 58.0.4 -> 58.2.0
Date: Tue, 19 Oct 2021 17:33:50 +0200
Message-Id: <20211019153419.3319802-36-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157155

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_58.0.4.bb => python3-setuptools_58.2.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_58.0.4.bb => python3-setuptools_58.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 2b1f899eaf..d1c77a971c 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 4e2c87105884af6dfc3bc9f8c65b199ecc3b5186 Mon Sep 17 00:00:00 2001
+From 543f12f43e10b242802009ac1d03ded800526934 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 45adb6a..9ac3342 100644
+index b88c3e9..dcd2898 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb b/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
rename to meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
index 8df69ce920..0a05ac6079 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e6e237b"
+SRC_URI[sha256sum] = "2c55bdb85d5bb460bd2e3b12052b677879cffcf46c0c688f2e5bf51d36001145"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


