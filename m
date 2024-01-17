Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4DAC47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:08:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1531.1705496906095026597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UnvT/ugu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so89386895e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705496904; x=1706101704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=enzrwlNoMBD5du3WFjoYx0aMhvhGmrDcpVXT0AwTEGg=;
        b=UnvT/ugubx86/41ggcTqHpc0Iqbk3FrR8WwGG4OZEBHCmIMWbRsuXQTreoNnIQ8dR9
         ZCjj8RQvPhsTeXzvc2YD5HcqHkbo9Uco0oF5yUNwJeVJoUI1jm2bheWd/U1cwYod3VrI
         KWFrL9C7v//ZG4YKJ9ePrhNaBowcDDBmqMmv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496904; x=1706101704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enzrwlNoMBD5du3WFjoYx0aMhvhGmrDcpVXT0AwTEGg=;
        b=cY5DatBmbwqr0E28VQgA5RDqXTMONcv1owpvz7kQktlZUyF0IU6av8Jy0aowibPU1c
         ODK85cSTV8SzplIm4N166qDvvnrQjBtyQSyfvxWCfMf/BMTXFO0VQyg4NGL6XF5rk/Tb
         aWVysWjuqyukhlExuv14yaxkLSBBEKpVNNDJ5Llv0Jp2j/K+jSZ7LreiWZNfaDmVVM6Y
         vK+pJ6mVPk/LuxDx6I829QNBjJEBJUtrO59wllrW//X6B1vxL/9oanDAvp6RBStuU7Fj
         45z+EfBlCyFly69Ca8rCcyQEdc/nfqD/aDG2MJxe9cundcUIqbfQBAVQ+K9q+RGz1ATK
         JcAw==
X-Gm-Message-State: AOJu0YzDzYeDqQjyn5CUol2xYnD+QB4nM/kSqlz4mMJzSCE+JzJRPp5U
	EhFg3W1xwSm0cnWULnUFjpniuZd650oOQteifg+i/ArJ22g=
X-Google-Smtp-Source: AGHT+IF+P96s0V9BABNm0PcarQxOMMvlL9jV7n0lqbF3+5iEjJn4xrvQQ2JvF9qmcVicnLQA1ugnMw==
X-Received: by 2002:a1c:7c0d:0:b0:40e:7d24:cc15 with SMTP id x13-20020a1c7c0d000000b0040e7d24cc15mr2621143wmc.34.1705496903898;
        Wed, 17 Jan 2024 05:08:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c1d:bf3d:325f:7bb3])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm26263349wms.31.2024.01.17.05.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:08:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libtool: Update patches to mark as backports
Date: Wed, 17 Jan 2024 13:08:18 +0000
Message-Id: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 13:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193908

Several patches merged upstream, mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...9-Makefile.am-make-sure-autoheader-run-before-autoconf.patch | 2 +-
 ...0-Makefile.am-make-sure-autoheader-run-before-automake.patch | 2 +-
 ...2-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
index 437c09fa6d4..1543ad2afd5 100644
--- a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
+++ b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
@@ -11,7 +11,7 @@ So make sure autoheader run before autoconf to avoid this race.
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00015.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=e7dc729dd27b367905cd0ce52b5466d91537857a]
 
 diff --git a/Makefile.am b/Makefile.am
 index 6b546092..84795d87 100644
diff --git a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
index a92e22905fa..67bd27ac928 100644
--- a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
+++ b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
@@ -11,7 +11,7 @@ so make automake run after autoheader to avoid the above race.
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00020.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=e01c0bfe5e041418d84460901a1a5b11b89d596f]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
diff --git a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
index c750303d430..b0f771c9bbc 100644
--- a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
+++ b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
@@ -10,7 +10,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
         no_hostname.patch
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00011.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=bd826173c4c9c3fa8d77d92785754897cb4bfd89]
 
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
 index 022c1292..1a8a2998 100644
-- 
2.39.2


