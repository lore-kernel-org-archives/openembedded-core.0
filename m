Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A79C43219
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.2639.1639608054415624233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3CPAs/g;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p18so17670447wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xyozU0iWhtGUqO9hGknqsmUNVXOAJ31Z4Tu6PpbnLEc=;
        b=p3CPAs/gSUJMWsLTQeFJfQPvst3e5qqSEeoJwJeDATyehMKmU7zecq/P26tc7Ik0tV
         DQqcSJEDaaxqf7Jh+jYKAE8tYb4ZYdqRdSTku8fxS0HNcK2h7ukcP5hWwry+1b59vuQT
         H+ZVq7V3gnQlpuCE2qtEUy8aP+gqrIDsToBUizgcJgBzEWhEmrpRghqUVUXB75GlZkNK
         caCF7CD/5pA1kWpWyY06PLuVBVbIB/tKhE0nH+n30Z4MRDFYiZ7PXXVylZRCkYSrLRhS
         bH7ypEXFMY+4aJ92oFcT9PTxG5uq4aa51bjV3b7g8x1lcSpyBl0YxA4vbz+sP41R5zlX
         TGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyozU0iWhtGUqO9hGknqsmUNVXOAJ31Z4Tu6PpbnLEc=;
        b=Kd/lb17vxvT7j1+43ER/KZ0sXuB3MH3G7pqHxHO6wNpMU+Ra8SBzjS9wODwA2EAi3K
         SJLcsRi84HBzXCeH9tVyVq63rquPlW9Y5WFPRgdUEoqvRk538qeKNc3N4Ab3cSEusY+0
         KZOckeXK1l2Y59r+MvLZKqydOyXQR3qMH4Ip73cuudpNN43Ih5DBSP54V45Y4l8/AZV5
         dNWXa81hOo01N6BrNXFvYdLhro0GZkOgaqIWOfk3SA2+N+pfqrLyS10ei4QBq/V+gxd/
         5AOTJr+SxI5xUbinkEb2UV1ZqYF2QMr8k6BwjjjZEEnWMhPiMibRwZvelNo7NqsCNMnN
         TsXg==
X-Gm-Message-State: AOAM532bRh4X3UWIGtJ5TkWiXawPP/c5JZ9UVp5O7+CRe5+cvPXITn08
	RU/rFLwlk8+IBTxTn+l6OVCtTDOq4IXMgw==
X-Google-Smtp-Source: 
 ABdhPJzr/hHfbktgGc1mSYag+NR3LoHg+txNNteCcz9VDKnj81qZaswa73RCHeJ0Ul8Y2mvPyKG7Jg==
X-Received: by 2002:a05:600c:3844:: with SMTP id
 s4mr2223460wmr.165.1639608053045;
        Wed, 15 Dec 2021 14:40:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
Date: Wed, 15 Dec 2021 23:40:30 +0100
Message-Id: <20211215224034.1814148-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159764

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...antarell-fonts_0.301.bb => cantarell-fonts_0.303.1.bb} | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
 rename meta/recipes-graphics/cantarell-fonts/{cantarell-fonts_0.301.bb => cantarell-fonts_0.303.1.bb} (73%)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
similarity index 73%
rename from meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
rename to meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
index 8e39ef025f..a92f9cb729 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
@@ -11,17 +11,11 @@ LICENSE = "OFL-1.1 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb1ef92b6909969a472a6ea3c4e99cb7"
 
 inherit gnomebase meson allarch fontcache pkgconfig
-SRC_URI[archive.sha256sum] = "3d35db0ac03f9e6b0d5a53577591b714238985f4cfc31a0aa17f26cd74675e83"
+SRC_URI[archive.sha256sum] = "f9463a0659c63e57e381fdd753cf1929225395c5b49135989424761830530411"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".2"
 
 EXTRA_OEMESON += "-Duseprebuilt=true -Dbuildappstream=false"
 
 FILES:${PN} = "${datadir}/fonts ${datadir}/fontconfig"
-
-# This isn't a GNOME-style version do gnome_verdir fails. Just return the
-# version as that is how the directory is structured.
-def gnome_verdir(v):
-    return v
-- 
2.20.1


