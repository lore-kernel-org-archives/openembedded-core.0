Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28896C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.16571.1644196131011450723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwWsyfq/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id n8so8772295wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fjan2I7c/2wjh0jFaPXz7Ffd082WXbarl4yQw8I4JtE=;
        b=pwWsyfq/lkFwbC3HZTZHkq/iwWb/P0Wac6C4njhlUbU+m9cL3trVst5v9Y7QI7zifR
         jCSRt1SrzVeWMt+cphGWttP922kwGW4/XpddgFMOI+JB8v6cvFTKRtEp1tG6Kg9Y0+xm
         +rAr0mZeKXBJquCToib9JG4iNiH7jDqrOBM5gfjQj0QUumEyMJcUzubVLO8ZdMmDJXbo
         BYhsFHGKZyYXeJPSf8rT3TeBJI/NRMFlcZcrs1AACoDktEVexZceHGl8ttHJND3NUjmK
         jFDyj3lTPPdRUHZ+0M7nUuecdyILOu5tJJ3/VIbiiUEj7OlQwXuhcY/pQdt7sBEQCrmR
         579w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fjan2I7c/2wjh0jFaPXz7Ffd082WXbarl4yQw8I4JtE=;
        b=SDmiglpYuxU0s8ZIxzL+WeJDEARDbYH8NqrPZ1LFx5n6VgrxwNTYTxJogfKJfz90bR
         xN8lz8dLm3llHiE+CgfEPt0tl4l3+bsOTYUR+ESAvMyl/N88ldg9bczv3eRXXTSt+dGV
         LwjsWMHZgKpabyNQ1ZxuKiDP2W7s4ZzzIylvzkjqP701vTIwgp1PFCdSh43yqv/jr7fn
         dij1mP0j9umTgXFMxcgt1N+eVAzERTNsQ2vMOKasM3gn4aNiDj/03k0NZFf4uj52Dq5P
         Atc3W3/KePgAAIaw/jcHO3yI5uO9qMJxrFX0mAxr7+VzF/kepbNkMxORgqvAmcCEpVZ7
         JtzA==
X-Gm-Message-State: AOAM530nHDmYdh+ut0rhSeIvquVJC1lyYNoO8+FtG1fQW1prQNk4Ssl/
	QH0foaL9gwY3DVpl3MznElLWgGLRZW8=
X-Google-Smtp-Source: 
 ABdhPJzHroh1ucyfuX+b5wDuvmCwOwVrzkeZcQvKIP7AgjHjBnz58hoLxLYUMp+LQKoYUp5LllOBvw==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr12037263wme.91.1644196129384;
        Sun, 06 Feb 2022 17:08:49 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:48 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 11/17] gstreamer1.0-plugins-ugly: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:17 +0000
Message-Id: <20220207010823.143664-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161431

- Add new meson options
  gpl: Allow build plugins that have GPL-licensed dependencies
   a52dec: Dolby Digital (AC-3) audio decoder plugin based on liba52 (GPL - only built if gpl option is also enabled!)
   cdio: CD audio source plugin based on libcdio (GPL - only built if gpl option is also enabled!)
   dvdread: DVD video source plugin based on libdvdread (GPL - only built if gpl option is also enabled!)
   mpeg2dec: MPEG 2 video decoder plugin based on libmpeg2 (GPL - only built if gpl option is also enabled!)
   x264: H.264 video encoder plugin based on libx264 (GPL - only built if gpl option is also enabled!)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...gly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.20.0.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.20.0.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 9777aaee19..8128104319 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
+SRC_URI[sha256sum] = "4e8dcb5d26552f0a4937f6bc6279bd9070f55ca6ae0eaa32d72d264c44001c2e"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
@@ -23,13 +23,16 @@ GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    a52dec mpeg2dec \
+    gpl a52dec mpeg2dec \
 "
 
-PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
 PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
 PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
+
+# GPL - only built if gpl option is also enabled!
+PACKAGECONFIG[gpl]      = "-Dgpl=enabled,-Dgpl=disabled"
 PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
+PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
 PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
 PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
-- 
2.35.1


