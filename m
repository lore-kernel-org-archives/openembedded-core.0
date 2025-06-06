Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D44C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 18:56:35 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.2878.1749236188153583929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 11:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/Rq7Uy5;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acae7e7587dso358613666b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749236186; x=1749840986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2HoOLvQkhcOfGiNOC7KqmaoM2vK2sTiPcFqDKxpp8=;
        b=f/Rq7Uy56JrUuYlwjBOgB7cbRViAphp5nrB7xR4K1FOBhP8PPKkeun4DPHujciij+B
         0WKuA5onYjIj8oBl+S7+k1oWsdKpDde3e7vV5Mt1wKh0MGYVcttpABWGnghHKUnFj2+x
         pGKG0gozvqsXSV3Wku8kVVmnQLXHZpkE8Yig+LuC4dZCN+dmO64BVSBuXeTatDYrNizO
         lE61Gbk1PC7pAGZGuotdSH6fxb8Zwgif0HajgHBZG8jaQLLfOrLexFqVQuJ5Eyl0+AYQ
         RtRlHzw+sT+IhitalDyS7T8ROcR/d89rHoo5TEyzKA8Br+QOsgSd7mBRW3/zsOdxLHBK
         SWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749236186; x=1749840986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2HoOLvQkhcOfGiNOC7KqmaoM2vK2sTiPcFqDKxpp8=;
        b=n1m6/8q5h3bE71JMWv15o04new0RUa6QpKec4qn/OrDoJYwwf1xvP/bD6yC5vNqf3N
         awYzQZ5y7IK1bdzlnV1pKGxYNdkFQBsUT+5VOFrYvX1TgoCo90TNiX4gB1pjJwUKFrvC
         zM3leTh7AbfFe1rdGBuleMZx255Z27UWCFjk9R0lQMPxs6NIEX5aOjdFVEttYFXgvaqZ
         d6J0nbUXmee0JWWfOvj4NLPwkwnJr78Y1rJCo+yl5Q9JBC8dCSEEf9dMOTneIuiVB6ef
         eBJt6YYiq+7GhkYTTwaHm4lqG09EhAhB/WR/NZ1/LPnmCR3gxeH7AV4PATaRVnfWrbhZ
         HNag==
X-Gm-Message-State: AOJu0YxYuOta7dd9DK/gOhJO0NZ5pEkehli/ncdYLJNdeU2ZIfGIRsz+
	C89vagwLgvm0ZYKxg7Ipd26rw6MQY/S5e6rit2fRo/Ze7yv8UahURCd+yYSyYQ==
X-Gm-Gg: ASbGncs/xU3EHGOiy6yTHpcwlPJ4zwg4Js6ixZlocmvZnC1RPDZKveP4wR8ZzmLmOQ1
	ahFDg30e+ds/W7TyxgubAT+JrOOnJjwL6gC/p6aDLMYoybZ0OhnRLf7pHlzPENgv2JAehrjo9T5
	mhv+iYEkLIoNZ+XVTutrRfK8r9+mm31oebwMNQv1bMHGtzVIikulpQekqtESVmuctODABEE4uSm
	kw9mELtPdxuhLtWgCOvK1v5Q7zbeXTyZDOIEoTsyvaYqoDuYJ7ItVqlv1xYJocjKG5aTqFCfJ24
	O3dsIBzfVqkE+JUjxQr71yTYXXfMRlHsQQ6KxOGDlwCBvlky8A4Rm2ztklUCrvWRqdtfqtIp3w+
	XXg==
X-Google-Smtp-Source: AGHT+IGz1RyU1KJLmOBL/fydnCsilV8idgRefd8Xu/5cuz7/aBFFc9Tmv8eJsvkM77CBYeAXZ9G1Ug==
X-Received: by 2002:a17:907:7f25:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ade1a922851mr400444466b.28.1749236186139;
        Fri, 06 Jun 2025 11:56:26 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7c92esm157209366b.168.2025.06.06.11.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:56:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] weston: upgrade 14.0.1 -> 14.0.2
Date: Fri,  6 Jun 2025 20:56:24 +0200
Message-ID: <20250606185625.4087714-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 18:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218180

While at it, also add libpam as a dependency to the vnc pkgconf, to
avoid the following error:

| Run-time dependency pam found: NO (tried pkgconfig and cmake)
|
| ../weston-14.0.2/libweston/meson.build:95:15: ERROR: C shared or static library 'pam' not found

Changelog:
 - frontend: Fix crash in output resize handler
 - libweston: fix bitshift in weston_idalloc_get_id()
 - libweston: fix realloc in weston_idalloc
 - libweston: refactor update_lowest_free_bucket()
 - libweston-desktop: don't try to move child surfaces to not existing layer
 - libweston/input.c: Fix weston crash with the mouse event
 - windowed-output-api.h: Provide ARRAY_LENGH() for windowed-output-api
 - drm: Fix underlay test
 - compositor: Mark pnode accordingly when buffer type is direct
 - compositor: re-order paint node placeholder checks
 - gl-renderer: Take direct-display into consideration
 - shared: fix binding-modifier none
 - vnc: Allow neatvnc in version 0.9.0
 - compositor: Prevent startup crash when hdcp mode is set on display
 - libweston/desktop: Avoid a potential crash on invalid resource
 - libweston/desktop: Don't destroy the xdg_surface

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wayland/{weston_14.0.1.bb => weston_14.0.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_14.0.1.bb => weston_14.0.2.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_14.0.1.bb
rename to meta/recipes-graphics/wayland/weston_14.0.2.bb
index 2a0a403d99..43c22c73b6 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3"
+SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -92,7 +92,7 @@ PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
 # VNC remote screensharing
-PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc"
+PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam,libpam"
 
 
 do_install:append() {

