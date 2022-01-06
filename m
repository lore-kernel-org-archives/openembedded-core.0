Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0610C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 00:26:29 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.2127.1641428788816300149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 78so683138vkz.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0KUalcEytlvV0NYGkt5aQMnfXch4/5121n8sd4pOAE=;
        b=SQlYWCgtKpVUCGKtoKGN2FbWgheFuQcowygdgRs2yH6zavmpTObnNLaUkTzdNBhYnh
         JpEbmAkze2UZDCoanzCwZNEaDyTtWbT+g0ezUdCUOlqB5kJfpoX+pnGQ6m+sQTsoIfF3
         ybUjW9H3IUJigYmKvZsuL7YmvVxunTjQwa+le6tJs0Qo5D3dNGHiY6/2uD5sN78YFv8m
         cr0c52sizza8lUWg1u/VmFmmkHAWrlXsgSZjHT9QxBOqbBllaTZNSaAfxvueFDhliIYZ
         cf0IYOSHHcBcDnXowAKvfsdH6H1ByVliX/GEMnSbkdkMC3+1qC59SgOXKLHzt7MW+6Up
         y/1w==
X-Gm-Message-State: AOAM531I9fGehgvtXpLggwKsKCFc4cipRK3TrmH2IG1X6h0qRjNzFFtB
	ijgZ1mIY5V4dqRYSBEEz2xk7VLQvx+h0o8yn
X-Google-Smtp-Source: 
 ABdhPJzRzzEhhR6v+WS5MChv5kgk0Ny00rUhHct396IZ7XKg1SWuiBMMJ9dza+XABM0JB/KzVGE2mA==
X-Received: by 2002:a1f:2497:: with SMTP id
 k145mr10438419vkk.21.1641428787689;
        Wed, 05 Jan 2022 16:26:27 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 y13sm289218vsk.30.2022.01.05.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 16:26:27 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] [DNM] python3-setuptools: upgrade 59.5.0 -> 60.2.0
Date: Wed,  5 Jan 2022 21:25:34 -0300
Message-Id: <20220106002535.658797-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106002535.658797-1-otavio@ossystems.com.br>
References: <20220106002535.658797-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 00:26:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160220

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
The patch seems to break some native package building due do host
contamination; I faced it at btrfs-progs, for example.

I need someone which has more intimacy in Python to help on this so I'd
like to ask for the patch to not be merged as it has known issues.

Changes in v2:
- remove wrong patch header

 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..5d508f759f 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From 74abf3fae060c87b04e5fb8c382ecc835afc3a50 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index fc848d0..c04a5de 100644
+index fb34d10..217fce1 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -642,6 +642,11 @@ class easy_install(Command):
+@@ -649,6 +649,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
index 878fa08404..8748f91388 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "675fcebecb43c32eb930481abf907619137547f4336206e4d673180242e1a278"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.0


