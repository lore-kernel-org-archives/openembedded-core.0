Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98B3C41535
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.8.1668103990682935034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rru0KrsC;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k8so3475416wrh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0RhBSv2WBGU2085epDV5tXyD/2pi15xXO/6iVVFr+8=;
        b=Rru0KrsCMz2uSj2IIF0Y0nzALc4hGaGhaHKKltvgBcacrxDw4USChVvrbHPWJbU2Ti
         VRlLd9T0khAEirMJlgQxpDKgl8v0cj+WXzQj7c0dZhYtHTggYs1HCx53Xs7g1cB9i/Mz
         Gxrc8EFT92z64ZodiOahWtbIUOKw3fXdY00mVYMJrAoRwqWq7rPQhiNNkAfDhbFRJDOJ
         aiygBYioGdMQVU7BsVFo0rIxqFrPGcGx3BILB1Z+YJRJNTrHarkYIF2HxC6vPGmz+cIm
         wtKDChRwhGKuK1TouUXNp/qk5r6FqvkKtLYNKTKTjQYQQ+726FWlrVTxopB40+4sI63+
         xsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0RhBSv2WBGU2085epDV5tXyD/2pi15xXO/6iVVFr+8=;
        b=4rqEQL1Ju353mlesyqDxlhAy6Id1d6qyQnVjvCybCccWyuvwVuC7neeZIVhhO7wTv4
         aQoIZrtXmKN2tQ/4Frn4YGTjKOTr7dZg024Jdv0PibpsdTUp1Yf9FI/aH767sWS8YDvX
         bO+TBHDXiNzzCRMZUuBMGMm/3odNGcS6/QHVf+IjTkMvIQt8efhpV2TcPocJYkq+H355
         ihtxzJndT0KrlHiFPtmzsyLGX0Z+vkxY0nrjva1E94t/fnokW+bo39xyWvG4Jb7EJPYO
         pbPmHzX+kwx4v2r3vtGzSeJUz0XSrojNWwGxiUf/JmiPWOJw6w3eMN9v8GjfFW9ppuHV
         pJYg==
X-Gm-Message-State: ACrzQf0NZ0Pkg5D5sJVknbs2pmkrFt6cJoaqDu51J5F0Vh0Kafra5Arv
	FndUHsRAaKroPiBRHd7v6KzGQ7GgMPc=
X-Google-Smtp-Source: AMsMyM74mjKCQpbtLhzS69hT5qjcxF3WU+wETF3D4GHYQJwXqaZ2Sbl12YFuewIpV0eEihd+ioVpMg==
X-Received: by 2002:a05:6000:1843:b0:236:770b:1af with SMTP id c3-20020a056000184300b00236770b01afmr42561723wri.486.1668103989204;
        Thu, 10 Nov 2022 10:13:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/19] adwaita-icon-theme: update 42.0 -> 43
Date: Thu, 10 Nov 2022 19:12:44 +0100
Message-Id: <20221110181249.1240200-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173097

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...{adwaita-icon-theme_42.0.bb => adwaita-icon-theme_43.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_42.0.bb => adwaita-icon-theme_43.bb} (95%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 56fd3daead..0a1487f8e3 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 985eda68d3303112791cf6858f6fef1a99288e8a Mon Sep 17 00:00:00 2001
+From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 040975e..5f7b53a 100644
+index 6ddc49b..39752bb 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [42.0],
+ AC_INIT([adwaita-icon-theme], [43],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
similarity index 95%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
index c4f3b1c999..8cb4d147f1 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
@@ -14,7 +14,7 @@ inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
 SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
 
-SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
+SRC_URI[archive.sha256sum] = "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6"
 
 DEPENDS += "librsvg-native"
 
-- 
2.30.2


