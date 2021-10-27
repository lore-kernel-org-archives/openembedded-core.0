Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B651C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9129.1635325674303290249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qr2mMEYG;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d10so2929582wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJC77lZvavSNWKWzb8T5KXXzfXHISOVhgIUABIT4lBo=;
        b=Qr2mMEYGbpAppPSfNNQ1+y5dqaI4wVJUDX+TFde2fEQh8PNRtAdY/uVjWM7xzce9Ja
         /mdzkIbfhODhBUC3zPGQw3tVA427thBLpAIoWtETVbHy9lywbA6U11M4uy7iD/+18jK5
         TTaf8Y/UYRqjuFEDgiWcwUNvrSuyZR+VYkD718+F782IEEYS+vKfK45fD6zbobKTC/Zg
         v27nZWuOPR1OYeOdXjVjyc1PpGaG5fA1oHCcTlDpzGHrD4yg4y85E08qgp9te7DqtL64
         1/cHuuKiacJVGt7AEUGouQ8KkIWV0K33j5QkJeyBUjk+hb5ErRphBPWdJDDtyObOGY7z
         64Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJC77lZvavSNWKWzb8T5KXXzfXHISOVhgIUABIT4lBo=;
        b=eTkqcRIhNIQBamk+ePnDlwN9Ggqxk23rkzvFcGi8AkN5NPp2ZuZUafcBx6nTRjBvKn
         QJfi6OPGdWaHdTzkFaZvZXts3rtQmWBnQJ2Vi3FkwvYnLcOGNuYQAVJLd6JOj9GiFXsI
         8JDh4mjOVUk4gE7sNhMKR3EzRYP9Ml9vo7yzSSZIaGViYS/aoKeBsn2Yr5RiSlYXjQmG
         oH6WVnnPXnJPu5L8DR72BxPby/S5ue0/t24jku2qZCEhuhewdQ+dFBrnco8eAMRWSjNi
         YAveWpnXa3xm/W7lvd0+I2U9imFyXRMNxlkU5O40WZY9WkB/zq7zAZRxxY+vid0G/Mps
         Ra+A==
X-Gm-Message-State: AOAM530ge1yuTRDW89YXo51M4GA920w7HpBgtBOnRSNOmgNKdP95u8Om
	GOecW5nQcwJ1edWapwv6H499+wG0yVo=
X-Google-Smtp-Source: 
 ABdhPJxlf+zGHRPxPTX1Re17NwMCSZBn00chES9FoeQPf3dH8Ug+ecbX8POhbMfmNnPfZNZhQL0bRw==
X-Received: by 2002:a5d:4b90:: with SMTP id
 b16mr39421728wrt.118.1635325672865;
        Wed, 27 Oct 2021 02:07:52 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/30] waffle: update 1.6.1 -> 1.7.0
Date: Wed, 27 Oct 2021 11:07:28 +0200
Message-Id: <20211027090736.2546759-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157498

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-make-core-protocol-into-the-library.patch | 56 +++++++++++++++++++
 .../{waffle_1.6.1.bb => waffle_1.7.0.bb}      | 14 +++--
 2 files changed, 66 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
 rename meta/recipes-graphics/waffle/{waffle_1.6.1.bb => waffle_1.7.0.bb} (82%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
new file mode 100644
index 0000000000..24b2de5d9c
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
@@ -0,0 +1,56 @@
+From 7610ec4b572d3a54d30fca6798f0c406f3fd8a46 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 26 Oct 2021 08:52:17 +0200
+Subject: [PATCH] waffle: do not make core protocol into the library
+
+None of the consumers (which is just piglit) use it, and
+this avoids host contamination from pkg-config suggesting
+wayland.xml from the host.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build            | 4 ----
+ src/waffle/meson.build | 7 -------
+ 2 files changed, 11 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ffc02ff..0bb6128 100644
+--- a/meson.build
++++ b/meson.build
+@@ -104,10 +104,6 @@ else
+   dep_wayland_client = dependency(
+     'wayland-client', version : '>= 1.10', required : get_option('wayland'),
+   )
+-  if dep_wayland_client.found()
+-    wayland_core_xml = join_paths(dep_wayland_client.get_pkgconfig_variable('pkgdatadir'),
+-    'wayland.xml')
+-  endif
+   dep_wayland_egl = dependency(
+     'wayland-egl', version : '>= 9.1', required : get_option('wayland'),
+   )
+diff --git a/src/waffle/meson.build b/src/waffle/meson.build
+index 01898c8..6245868 100644
+--- a/src/waffle/meson.build
++++ b/src/waffle/meson.build
+@@ -88,12 +88,6 @@ if build_surfaceless
+ endif
+ 
+ if build_wayland
+-  wl_core_proto_c = custom_target(
+-    'wl-core-proto.c',
+-    input: wayland_core_xml,
+-    output: 'wl-core-proto.c',
+-    command: [prog_wayland_scanner, 'private-code', '@INPUT@', '@OUTPUT@'],
+-  )
+   wl_xdg_shell_proto_c = custom_target(
+     'wl-xdg-shell-proto.c',
+     input: wayland_xdg_shell_xml,
+@@ -114,7 +108,6 @@ if build_wayland
+     'wayland/wayland_wrapper.c',
+   )
+   files_libwaffle += [
+-    wl_core_proto_c,
+     wl_xdg_shell_proto_c,
+     wl_xdg_shell_proto_h,
+   ]
diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
similarity index 82%
rename from meta/recipes-graphics/waffle/waffle_1.6.1.bb
rename to meta/recipes-graphics/waffle/waffle_1.7.0.bb
index 161bbb0d26..846cd0d818 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -7,10 +7,12 @@ HOMEPAGE = "https://gitlab.freedesktop.org/mesa/waffle"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/waffle"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
-                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
+                    file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.6"
-SRCREV = "d7e8c4759704b3c571fa3697c716279c26fd05eb"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https \
+           file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
+           "
+SRCREV = "905c6c10f2483adf0cbfa024e2d3c2ed541fb300"
 S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
@@ -31,7 +33,7 @@ PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/${MLPREFIX}libgl libx
 
 # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland wayland-native"
 
 # I say virtual/libgl, actually wants gbm.pc egl.pc
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/${MLPREFIX}libgl udev"
@@ -41,3 +43,7 @@ PACKAGECONFIG[x11-egl] = "-Dx11_egl=enabled,-Dx11_egl=disabled,virtual/${MLPREFI
 PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=disabled,virtual/${MLPREFIX}libgl"
 
 # TODO: optionally build manpages and examples
+
+do_install:append() {
+    sed -i -e "s,${WORKDIR},,g" ${D}/${libdir}/cmake/Waffle/WaffleConfig.cmake
+}
-- 
2.20.1


