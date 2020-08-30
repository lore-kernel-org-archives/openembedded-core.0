Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.36669.1598811508887264070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uNsM5A7x;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id j2so3816065ioj.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RRROta47OY5TPZiqiXiWXouywtW6yxfqf8LOdulJPKk=;
        b=uNsM5A7xidZI7CDrp7r6ShNBkiNqjP8slavAtaVrl4LLcDu3LrBD1UxS2EUD0A8sQh
         SBLZoU3icUsBNgSTmFsCRpyX8sRSEOH4eJYMaHQgke3tcZg0HcFubZnZhutKzeqrqIj6
         aY9rEfBu3J1pX0v2FnUsq7xAM5tlZunzhs+B0shP4jxwLUkMOBGjx4lcPr+cQHSrr9r5
         8bxyS7su9xFfUfKiaBgd7njJYKMnbrrPZssjqj3cRIfyBogSHrpeLLB3+vjTjT37CoRb
         fS84lcq2/WaF7QPc6blv7XQhX5+2LSFVLDaienWSnmdaGuahXoeJoohUbzTQDHGLChd+
         R4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RRROta47OY5TPZiqiXiWXouywtW6yxfqf8LOdulJPKk=;
        b=Y4E1vdIsXJCEIbYNRMuxVvpiXtwWToWHRSSKmH9+1Qi0iW36ASs+xNqUv/Jp57q8z2
         n2I+QAGHxBYFdR1CNiJ//oh4kOjDdTCyiOmLuKhOyV1Oj/GGVI+nf/4Qcy3JYih0UC++
         lE6DPchwgVUwGyLmsAa13n9ipCIl/Cuw92c1oMbOLWxm+wQuJwS8qaEk7uUjOiBoIXJn
         K8/1vtdYIF2NchyHB04qEoxL1j3Ot1eqVaqJX2Bhdpow+mXCT9GhJhWbVxH/r+WIOHTQ
         uoDFUKNmy1GoLswS+o3Zmyn65r66L3L4FOd2ZHoagcx4hdGgp4Lh/DFKsOo5sEUQjEeD
         +AvA==
X-Gm-Message-State: AOAM531PX+mgTh0MiHok6vWjTmz4eEplFfS5cXCs/70LLP1y4JRNon/U
	xiqog39axMN6+AkF9Tnk953PWcJSFfFO2+RD4YQ=
X-Google-Smtp-Source: ABdhPJwUJ65AaDYreKtq+o0dQFoM0sJ0BtFdW//edNlRiyX4rvItSccLxK1tmUhPqNd8cZQpMpoK+A==
X-Received: by 2002:a02:7106:: with SMTP id n6mr8552927jac.11.1598811507787;
        Sun, 30 Aug 2020 11:18:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/25] weston: add missing packageconfigs
Date: Sun, 30 Aug 2020 08:16:04 -1000
Message-Id: <f9137fab67b3a13d569b70ca0596e2fd873a39a8.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Guillaume Champagne <champagne.guillaume.c@gmail.com>

Add missing package configs to:
	- Select shell integration
	- Disable screen sharing module (independent from backend)
	- Disable jpeg image support

`PACKAGECONFIG` default value is updated to enable these configs, since
they were previously implicitly enabled.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f883413b2bc6e7d0bd44ce8324cd36a8fe918e5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_8.0.0.bb | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index f8e9e15f84..8fef864827 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -20,7 +20,7 @@ inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
@@ -31,7 +31,13 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   launch"
+                   launch \
+                   image-jpeg \
+                   screenshare \
+                   shell-desktop \
+                   shell-fullscreen \
+                   shell-ivi"
+
 #
 # Compositor choices
 #
@@ -67,6 +73,16 @@ PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clie
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
+# Weston with screen-share support
+PACKAGECONFIG[screenshare] = "-Dscreenshare=true,-Dscreenshare=false"
+# Traditional desktop shell
+PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
+# Fullscreen shell
+PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
+# In-Vehicle Infotainment (IVI) shell
+PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
+# JPEG image loading support
+PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.17.1

