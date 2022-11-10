Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA24DC43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.8.1668103990682935034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iv30Zaqh;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k8so3475582wrh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkSxWGLOQGMoOdDShr6QmFAd98syu6Ct91LL6bMwZYc=;
        b=Iv30ZaqhrrOQ8YnVgwQlCl8Lz6BrqbXY7FArLnGX3dn/dqGAVZ7+hV0ighl3aMI3hX
         2tT1G8fFhLHzD2F951FLnokbyTMx4TgpFspavsAJj+kyUG+qQX+nYmsJAionXYcNNQHE
         5ciNnzwV/b4WIWsuf5LSrXeJyqZg6Z+ofMsUM3BlBfhrtHNqc9l0R3a438xvZwrFtHF4
         Qewyj9mmhSgc6LTdeJWKvpAncO4yW+DC08tq77BgugilDm2Nm4lSOh6fvYldt3NB/6uy
         M5eCXElyUOj3b1IWhW+xG/7ymjMzZbWSkpaZ/P275c1gMozmK0rDJxaD7HgKt9ubruOf
         pR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkSxWGLOQGMoOdDShr6QmFAd98syu6Ct91LL6bMwZYc=;
        b=YKnkcobmENSMocnxxdXW9bevQPv4YVjeRrzJv59dxT1HWMzUmGgLt3ZP3uxMfWclj8
         vDFp92GufV3oYkV3FgBTOwsjqun2F9TjAj8261fGwhLMns0D9llImfOPG31h83Ty8dx7
         TFe60mzJsWTajVV0xPCd0hKZf2OrsZdtshspD9Z1DRB3JaXug9U/gdeFHAw6YkHC8W8+
         iGnU5WBeFrbEHN7mGzTtxISgO6bJHA++5vcegnjoAvo3kYo6CfgJqCpiM0tmXyXcnLiv
         hdKPW5IAu4zyY2W0yYsqcXYuBkJYmDoT5RA/5HqWWfbZ8zBoJYeMhLGuv+3WEs8oGE5k
         SyOQ==
X-Gm-Message-State: ACrzQf08rWQvtUhy1h3ujJdUDr05r6PMIInhvqykZnYmKRiNTfLSPbrd
	pDliJsnqVY8PgItWYs2daWMckbLTLuY=
X-Google-Smtp-Source: AMsMyM7GTKoGUby/WRtL/vdQyW4XygsDYU27QxTB1fnkE0vt1bdohsKEuGfvyCPT+u7/j+lTJ0iwZw==
X-Received: by 2002:adf:f447:0:b0:236:5840:1c72 with SMTP id f7-20020adff447000000b0023658401c72mr40352583wrp.686.1668103991880;
        Thu, 10 Nov 2022 10:13:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/19] meson: update 0.63.3 -> 0.64.0
Date: Thu, 10 Nov 2022 19:12:48 +0100
Message-Id: <20221110181249.1240200-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173100

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-is_debianlike-always-return-False.patch  | 15 ++++++++-------
 .../meson/{meson_0.63.3.bb => meson_0.64.0.bb}    |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.63.3.bb => meson_0.64.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
index 83c4782a61..a9a32e2b7a 100644
--- a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
+++ b/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
@@ -1,4 +1,4 @@
-From 667b9ede638677fb37911306937ea62f05897581 Mon Sep 17 00:00:00 2001
+From 361f51c2c7685491186703e8f26be991ab698edc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 15:55:59 +0200
 Subject: [PATCH] is_debianlike(): always return False
@@ -7,15 +7,16 @@ Otherwise, host contamination happens.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
- mesonbuild/mesonlib/universal.py | 2 +-
+ mesonbuild/utils/universal.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mesonbuild/mesonlib/universal.py b/mesonbuild/mesonlib/universal.py
-index d670d04..47d1b52 100644
---- a/mesonbuild/mesonlib/universal.py
-+++ b/mesonbuild/mesonlib/universal.py
-@@ -651,7 +651,7 @@ def is_cygwin() -> bool:
+diff --git a/mesonbuild/utils/universal.py b/mesonbuild/utils/universal.py
+index 570edd6..4119aa5 100644
+--- a/mesonbuild/utils/universal.py
++++ b/mesonbuild/utils/universal.py
+@@ -634,7 +634,7 @@ def is_cygwin() -> bool:
  
  
  def is_debianlike() -> bool:
diff --git a/meta/recipes-devtools/meson/meson_0.63.3.bb b/meta/recipes-devtools/meson/meson_0.64.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.63.3.bb
rename to meta/recipes-devtools/meson/meson_0.64.0.bb
index 9267077422..84c3c84515 100644
--- a/meta/recipes-devtools/meson/meson_0.63.3.bb
+++ b/meta/recipes-devtools/meson/meson_0.64.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056"
+SRC_URI[sha256sum] = "c5e27e091c2a35b9049e152a6535045ebbd057253aeb67856de6ecbb7b917bab"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


