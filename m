Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05225C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.4642.1642588906430223053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KW6mJfGN;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6767277wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpLDwUBENjeqAEsWZppy+G7LsKdahUHruUiVGBAii0k=;
        b=KW6mJfGNiWk3FkVPpIzdul4cDqH5tDvXjSY4Y69YtWmdEbi8pyrt1bK4oTw1SPuBlD
         N3PbNuWJvGxUYPJo3oND3it4nDiE2in05CuBq+ymxx+kn6OZ4SyPtpS2ksuFjE8C3LA2
         PJdBP49tDm2dwITCvktQT++qJB4Pz8Z9J21lv2itcID6xctNCDt3X8iBKP0kuu09BWhF
         funizOy4MXlzI6RyM+x4rMAgOB8KRQnvZBNlQDOsujfdkh+1IUsrZD7fhX989FhupXhb
         8dZrP0ni6VPPWApAhO9iYamCnZBAQFw1MYUnhMo2KzLr+jCYs1+8qkXVWXnEHlLZtTPg
         Zf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpLDwUBENjeqAEsWZppy+G7LsKdahUHruUiVGBAii0k=;
        b=h7ZAtlQDg7eKhMepnu8DYtpSO4xU9WJqnJQvxbdHc5C44zyKm7IH813CFuW0Q9yDUD
         Eac3GASfyMWp9up1FfA7luRHTUvyHMIqGy4OJVwtPP3NTk5EwLyCrRIpBwjOfNJgXqSC
         d0aX04chMWqMJRsahJCLagiDWpVFoZHkdCEW4kh3401jdvABNk0y6j1QqiGi1/PJ/VNo
         BiledrVYU5v0FyURYW3iFNLKCUJTBEbVe9plxvDAzr8w928yvxsAZIdtv3YNfHmzLmu9
         0gHi6vf9IHwRGn5riBrr3SUDSvjgOXVtWzi1xENoCMBP6IOQyDqw6oJvYRKEXfBeNgGw
         gOAA==
X-Gm-Message-State: AOAM531sYOnmaeLC3QnP6S47s3m/5PRvCV7vMv7YSoJ08TKJdsQ7Smbu
	xmAfejWe8rA2rSuCNqAKAYBfI9O79/8=
X-Google-Smtp-Source: 
 ABdhPJzWSfX7tVCsEbKJjCbvETz89sJWTxwejTkv8TzTV7yI4QAzwfuFXJjYH75TOE6ml4upkyJEMQ==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr2830817wmb.156.1642588905020;
        Wed, 19 Jan 2022 02:41:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/39] vala: upgrade 0.54.4 -> 0.54.6
Date: Wed, 19 Jan 2022 11:41:04 +0100
Message-Id: <20220119104117.2120127-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160718

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...apigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch | 38 -------------------
 meta/recipes-devtools/vala/vala_0.54.4.bb     |  5 ---
 meta/recipes-devtools/vala/vala_0.54.6.bb     |  3 ++
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.54.4.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.54.6.bb

diff --git a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
deleted file mode 100644
index 2aaf2ab94e..0000000000
--- a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From dbb1c58e86f2af4613f3ac9571d9b163d4bca675 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 16:13:54 +0300
-Subject: [PATCH] vapigen.m4: use $PKG_CONFIG_SYSROOT_DIR
-
-This is necessary in cross-compiling environments, where directories
-returned by pkg-config should be prefixed with sysroot location.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vala/-/merge_requests/218]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- vapigen/vapigen.m4 | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/vapigen/vapigen.m4 b/vapigen/vapigen.m4
-index 2c435e7..6228991 100644
---- a/vapigen/vapigen.m4
-+++ b/vapigen/vapigen.m4
-@@ -82,12 +82,12 @@ AC_DEFUN([VAPIGEN_CHECK],
- 
-   AS_CASE([$enable_vala],
-     [yes], [
--      VAPIGEN=`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
--      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
-+      VAPIGEN=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
-+      VAPIGEN_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
-       AS_IF([test "x$2" = "x"], [
--          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
-+          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
-         ], [
--          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
-+          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
-         ])
-     ])
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/vala/vala_0.54.4.bb b/meta/recipes-devtools/vala/vala_0.54.4.bb
deleted file mode 100644
index 695f64e336..0000000000
--- a/meta/recipes-devtools/vala/vala_0.54.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
-
-SRC_URI[sha256sum] = "6051270a2fc30de023c88562566f2f6043e67beb4da4b799c14cdf12048eb40c"
diff --git a/meta/recipes-devtools/vala/vala_0.54.6.bb b/meta/recipes-devtools/vala/vala_0.54.6.bb
new file mode 100644
index 0000000000..d1202b83fd
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.54.6.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "49d60d96a3fdf6c4287397442bc6d6d95bf40aa7df678ee49128c4b11ba6e469"
-- 
2.20.1


