Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8773DC4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.6565.1635842588713027162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjNSE2te;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d5so16720046wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTKQEkM26KhVGmRET10Bxq9v0m+6VtXvznrX6hrHgmU=;
        b=fjNSE2te0dAN1Q0wTsBPCYhC1dSFXQIwwujGW27ftMYuJjosQgyErrUf27u6K0iznC
         wKXnTA2CNThT67b0dFwBrvN/FgfdI9YJ0jFG/tN5vAM7cp7H9IoB/7434I4mDyktNK3u
         NxlH1nTpkyv9ORs81VSWPMudIlH8DJaBK4wFeB5qKOSEjLPckXIc9ps1GlrwgVhQaFRZ
         UHGeUIvBmytZd05jCxJckE73okytE8O8+bPlnYhvmq5G/P46CeDRII9uqXYwGKMFXm2Q
         JlK8OPTi0+wgfINoESUfCb9RApkdTA1+RP4xjI84WXP3aMOqs/VOLV+IM3hpK4jBmGGl
         Fbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTKQEkM26KhVGmRET10Bxq9v0m+6VtXvznrX6hrHgmU=;
        b=lb6FfeeC4to25ARLgWyqDlrZ5RrNkMGUHQQ9ieeOHQndI6KmaCaL8GUZ1+PT+RGJ/S
         FGmaucflQlfYQ8ABhtFxpHWd4VAUu+b+IpcKN796MIKsJGoLewN+yrIg92BB3D6D0Lu3
         4Ji4QddevXZz8bTIyR6sIhBC8XR/I9AZaCS7LtWNTl8Zqze3EhZEeRp5r2LNq770tL5H
         /bZPHbiRWpyCdJvGWk5/Zn1qUhrYEHlH/TqQLwBU/0l69zKC+8jMmeKN01FRqiqTMC1c
         vUDfOHz8CV2P39Akgk3IB4WBI47qZEQwWUqdyB6Pxo0ql8YOYfFtDLzmOvhA8a2Xlfk7
         2VCg==
X-Gm-Message-State: AOAM533BJ+XKdw+ma2tRNT2aVCwWjQ6fkxaeIpwvjtetB2+vfXvsMRDH
	Q3IOt/Z9NUtRrN9ZfBpGViqiRWw2vIk=
X-Google-Smtp-Source: 
 ABdhPJxZC9QyRHccQCIhYQ9rC49rRXXUIVTJshLZPsu9zDyOgJcEZsYD83dpr8mtuDTLhegF+GzylQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr45980759wrx.137.1635842587198;
        Tue, 02 Nov 2021 01:43:07 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/33] glib-2.0: upgrade 2.70.0 -> 2.70.1
Date: Tue,  2 Nov 2021 09:42:34 +0100
Message-Id: <20211102084303.2974802-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157742

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.70.0.bb => glib-2.0_2.70.1.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.0.bb => glib-2.0_2.70.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 9bfb6e85cc..7453f45395 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From ab071f315deed3740f867161ee58436b985d6fc1 Mon Sep 17 00:00:00 2001
+From 7007fd6859eca9361e4362800928a1ae3a05daa0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
index 8217aaa8d0..f7bb62f74b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742"
+SRC_URI[sha256sum] = "f9b7bce7f51753a1f43853bbcaca8bf09e15e994268e29cfd7a76f65636263c0"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.20.1


