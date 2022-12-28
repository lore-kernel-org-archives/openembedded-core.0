Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DF8C54EBC
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.177178.1672213057657399248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kNXKwoo0;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d4so6226700wrw.6
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaXx4zBnxJVwwx6gEM8i75gp0UWmM1RJ2CtWpVam8GI=;
        b=kNXKwoo0TKNfjnuKhsxi2Nw9T8V41VI6oQUQk/2JIx7uUBHqDi5ZjMaeZrMPVH3UvW
         dz+RYaNc0aFZerkL4mEMDo4BHgq5n52aEuAZprjDMQuJ/uxIH83sozPGpp0gvqQ89SbP
         Yt6fVMsgqFF14Fhd4+M35+t/lHvZ4HxEZhbnukFnOt/LAyvZ5KYIVuKC61fqKgFzBwYx
         n1ih3O4ARsuL0I1yGAeWonMOOpO1v5Ki2xOg7poqDkV8TQOoXyDdTpxcqTYuY2FviFug
         RjPTrLQ+HUl5cHxo/ZpjVWJduJ9E8oQLI0ko0BIRKWG8RfMP37w3rUVebVCWu2J/hNSa
         nlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaXx4zBnxJVwwx6gEM8i75gp0UWmM1RJ2CtWpVam8GI=;
        b=LbuhTbi3MKLmwo4MHlgxaYErHSFsWaa5XoCJszjYdDtUZBf/eUvSskorqPI/tvcqym
         q2Xpog9+I7mAB5ehHqRi2NbPzymN7dIkFRypSYPFL4IUkxNczzlqdd7YXC53QfmjOGen
         Ro57wvjorXRzRpdS9OJyE57Aurs0r4dRqDs1ooJKQmZCZ79WBa+JN3u2cJnycixVRR5c
         0+xvPxw3gR2KtCS6BO0H5FT2RCIUzrHKMq7b1rl6pdJjzBkdEYvohIFrEo9/CAm5lnzw
         UpqTqSEWlRYdGOwr0aYFdlPYrbubxS/C0DGr1S7lt3Hvxdb4q6hnNEz5QrIc5VshTfat
         pgBg==
X-Gm-Message-State: AFqh2koaoLqUVUi46w966OpP6xNACeuCEsMSJ3qZ1/HOu9tbeXYE0A4E
	XucBk5OMnmZamJ3TArGYWE32dZWTDZ4=
X-Google-Smtp-Source: AMrXdXsRP7KhpjLVPBL4DC5DslHDuiYWHQHiuI0JBVQhRt+uKedQeiVsWPhE6s67DHroOi00A7PXJQ==
X-Received: by 2002:adf:f646:0:b0:27a:4d96:3a7b with SMTP id x6-20020adff646000000b0027a4d963a7bmr7041511wrp.34.1672213055998;
        Tue, 27 Dec 2022 23:37:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/25] xset: update 1.2.4 -> 1.2.5
Date: Wed, 28 Dec 2022 08:37:06 +0100
Message-Id: <20221228073721.3454255-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175049

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/xset/disable-xkb.patch           | 23 ++++++++++++-------
 .../xorg-app/{xset_1.2.4.bb => xset_1.2.5.bb} |  5 ++--
 2 files changed, 18 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.4.bb => xset_1.2.5.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index a97c7b72fa..0bb05a3b88 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -1,14 +1,21 @@
-add "-disable-xkb" option
+From 3090dcafac7c8080091b5e3e3720209c65251a1a Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard@openedhand.com>
+Date: Mon, 22 May 2006 22:15:57 +0000
+Subject: [PATCH] add "-disable-xkb" option
 
 Upstream-Status: Pending
 
 Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
 
-Index: xset-1.2.3/configure.ac
-===================================================================
---- xset-1.2.3.orig/configure.ac
-+++ xset-1.2.3/configure.ac
-@@ -53,11 +53,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index e7c2bdf..8e1ed5e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,11 +52,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
  	AC_CHECK_HEADERS([X11/extensions/dpms.h X11/extensions/MITMisc.h],,,[#include <X11/Xlib.h>])
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
  
@@ -22,5 +29,5 @@ Index: xset-1.2.3/configure.ac
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
 +fi
  
- AC_ARG_WITH(xf86misc, AS_HELP_STRING([--without-xf86misc],[Disable xf86misc support.]),
-                 [USE_XF86MISC="$withval"], [USE_XF86MISC="yes"])
+ AC_ARG_WITH(xf86misc, AS_HELP_STRING([--with-xf86misc],[Enable xf86misc support.]),
+                 [USE_XF86MISC="$withval"], [USE_XF86MISC="no"])
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.4.bb b/meta/recipes-graphics/xorg-app/xset_1.2.5.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-app/xset_1.2.4.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.5.bb
index e21120e788..398530f342 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.5.bb
@@ -12,8 +12,9 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "70ea7bc7bacf1a124b1692605883f620"
-SRC_URI[sha256sum] = "e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957"
+SRC_URI_EXT = "xz"
+
+SRC_URI[sha256sum] = "9f692d55635b3862cd63633b1222a87680ec283c7a8e8ed6dd698a3147f75e2f"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"
-- 
2.30.2


