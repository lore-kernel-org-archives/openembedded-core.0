Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB34C4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:03 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.92044.1669557355916426196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SSFY+Ze6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 6so7705745pgm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kS58cnk+4nzBjeob4orAcaQ4hJtc0c7VFXwA0Ifewso=;
        b=SSFY+Ze6r5e9/t8mcfXRwNZiQP/wUHhHJrlQaDmDq4KWxyigwI+HRSijrCzlMOpOmp
         S8nEY1jXmFPHuw8crW1gYR3LyxD6L20KxXviJpnVPE6GMEu2nayWhEWiFjusEO8VGuIV
         8Rc5bjoDUuc6y0XCQIBUSBDjZi22MlicSlB5cSpIt2M2sU/yWf3zEGgb4EX/LRsCIuhS
         XItzTg6WQlD5tg9SX2S2BCcZh1y3HL0EDPw6kbMSOqnU1XhMtuxfDm9s252eraiePmKZ
         M3UiNuKjqNHmo/glmfBdZ31eLjtwDNznQaXRNzTxrTc6G/Jj0H7tmIlCnNH5uDGVR0r/
         qIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS58cnk+4nzBjeob4orAcaQ4hJtc0c7VFXwA0Ifewso=;
        b=jM43LuCNs9828xF1+xROroO4MOd6u1rcfaFngs0QJT1nK5SP/a6OgHBA/cPlf4pSVm
         CT79VekNjYgd9eMN7nr04JwaN0RTLheLeJ75L4Pod0oRD0qkPF9E/0rwDZcAxycVtMWC
         Xc1mAjfqDxsVYbb56nQIdI0sQbW/reOvWImK1eCsk7AhDW6OzAddU/vRF9LF4sjtiY5S
         XHqXv+1XFJiUE4gt6FIi9IKhjclOD0b4jBrJtAdLaXSDun12nJ5vaUxnWoUkvFiPRwvz
         8mZMP/1caMu4KgWe3Tt+JewuDQYOZ5jtwOOKE6O46unoa5+sMZJEFR0SZ/62y4Sydg52
         hNZw==
X-Gm-Message-State: ANoB5pnAEGDwf99uU+0v3m0UfLdC4va/cgGcACYnza1orhEyi48ylF/D
	cdhdQSL3dzh8uBF/WuIe+i5cyzEfriVh+PvxdR4=
X-Google-Smtp-Source: AA0mqf7k8kP1jPv4r59dK5tPBPmpIOpZsu9yfNr/ubcgVAy6KYiBeNvla17isTWgGwCSpD+jEIj8fw==
X-Received: by 2002:a05:6a00:21c1:b0:562:86a3:12fc with SMTP id t1-20020a056a0021c100b0056286a312fcmr28218826pfj.8.1669557354965;
        Sun, 27 Nov 2022 05:55:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/31] gdk-pixbuf: upgrade 2.42.9 -> 2.42.10
Date: Sun, 27 Nov 2022 03:54:59 -1000
Message-Id: <58629c6c42f018b9faa200c39e819c2db38fd935.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173858

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.42.10 (stable)
===

- Search for rst2man.py [!145, Matt Turner]
- Update the memory size limit for JPEG images [#216, #218]
- Translation updates

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01e1828f8e5bcb0ad88b89fe783c2973480695bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index d33718e3ea..aa44515fbb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962"
+SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.25.1


