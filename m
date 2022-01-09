Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA9CC433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.24181.1641767278410323990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gDHxuUrv;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id r10so15693937wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6EyuHiSVoY16L1SluJb2eudkoAnYn1Qn8T9AVhardhc=;
        b=gDHxuUrvRt6ihLVKUnDzC6GDLEcbbXJPm0CaNqiDUvuvSqNOeRkr9tZ3L7hT5Zwxiy
         euxlVWR5hQ7Y+a0mSwzteFRTrU4pUz6qy59svOJUR7j6vQGCu+7CWqS0+K3Q+3wr0kHW
         TNXo0hmAGC+uK9XSTa8pJ5wE8bG1E3Hp9pAYj+qydK1ID/YqATR8LFOmaY1EIVXkIXP8
         eRJaWDt4ADFcpLRgCPclm/tnKS2Fa5aUgnvQyVMknB68G0BiJuHaa8hjqC0xsc3xQV4j
         3xqXJs07ate5ZYwThxuLQG41SW9N8z6NiyoWRMszA5igSOpiwcvqAeNhpDwKABdJ4ydI
         aRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EyuHiSVoY16L1SluJb2eudkoAnYn1Qn8T9AVhardhc=;
        b=Z1ZLjKTyocQpVo/b81IBHH/I8GV6S2hVxebzoSlWWfSveFR8gkmyBkg0NAu7o/oP/5
         T0XIcZyLG1Lu5n/2ZfwZ7XfS6iKly6uin1MCuuciAE/dQOmqc4nx3M4NcmpOAwzrI+VZ
         bdBxlni28B92nFIIx2UYcsf2hKJBqPD/JeR9n5TqqbxWyyUNzB8z5R0s6xxfH3VQnH1e
         JMAPmyZdou1IPLgs6gEm3VTpUBNt6Tg90eUuf14/QcVZjEZFE5gDjLkUOO35GRZN6o3u
         igEMFTSOnQoyIunwuVtdN7imXK1PHd+ioR2SXxesOH/OQgPUPKSVGGRiNTB9/0lSBO5v
         gX2g==
X-Gm-Message-State: AOAM532awSBOhbnWkaSunV/OcpDqEvyiHW1I+Es5AZ7iD34L5cOqoSV0
	qorm65ZnczFXVgK5Lq+MyDGURN85rho=
X-Google-Smtp-Source: 
 ABdhPJyr8au5HbaF0I31HB4KVcXk05h/zR3ytY/3XKwygKkABJfue+NUngLtftJmsmFthd1aKss1Ag==
X-Received: by 2002:adf:fc47:: with SMTP id e7mr3033367wrs.77.1641767277018;
        Sun, 09 Jan 2022 14:27:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/14] libportal: update 0.4 -> 0.5
Date: Sun,  9 Jan 2022 23:27:27 +0100
Message-Id: <20220109222732.2252416-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160311

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libportal/{libportal_0.4.bb => libportal_0.5.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/libportal/{libportal_0.4.bb => libportal_0.5.bb} (60%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.4.bb b/meta/recipes-gnome/libportal/libportal_0.5.bb
similarity index 60%
rename from meta/recipes-gnome/libportal/libportal_0.4.bb
rename to meta/recipes-gnome/libportal/libportal_0.5.bb
index 5817302688..67f63fea68 100644
--- a/meta/recipes-gnome/libportal/libportal_0.4.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.5.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals
 with a familiar GObject API along side the D-Bus API"
 HOMEPAGE = "https://github.com/flatpak/libportal"
 BUGTRACKER = "https://github.com/flatpak/libportal/issues"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
-SRCREV = "f68764e288ede516d902b131cc4fadded3804059"
+SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
 S = "${WORKDIR}/git"
 
-GTKDOC_MESON_OPTION = 'gtk_doc'
+inherit meson gtk-doc gobject-introspection
 
-inherit meson gtk-doc
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
 
-DEPENDS += "glib-2.0 glib-2.0-native"
+EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
-- 
2.20.1


