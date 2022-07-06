Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AC6C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:47:58 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.459.1657144075397124481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=guHr/5f+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d16so17471339wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8/GtU/ysPlsIEt7AGCBEKKAmGEDydsuQcJOkOhF12M8=;
        b=guHr/5f+KMWVEWxnQtnL3im/KTMOQ9UsP936Rt6zCIzWUGgBIHPIkbE7uFMu+WmTzp
         Xu50GR9lbp1HIVTX0sxZlPH6FtywKkQ4YK/lzSKiubT3kmOlhV3YuPe5Uh8pGNhEB78s
         unUuerHwpZmeN2aPcnbzEw0Yy4IZlIgjGSxyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/GtU/ysPlsIEt7AGCBEKKAmGEDydsuQcJOkOhF12M8=;
        b=gyFfyGGSsGmnwsYJwtBuUu42PZnQk/wh7Qn3xV/fE/tZSMGdyXxcnCLJ/pgeugvJmV
         2z8ts9NbI0a5ZSbCkqpaNy7Sp9WvCl19gO8mN2XhRnKJkxQ+rDgvWO6PkppkP8A6tFaB
         RrZUS4nZUMyHsk5BMiwD1TLUGXZGAaqNBlYi+Qq6otOWPF8VowxwYNbRDw2D4Hc9Tsw4
         QWZVzkPqou/ZfQDABwLMFhBt+qRvQi9v+iVuE/VoJc2DJw7LQvEDib3flmnxDoDzrnRv
         0GcLsWmZVHialM2jDeU+YdvgeklwoY5TH5mpkyfXkize2rQepcayOBx3VR3J6jSobDMD
         0CIA==
X-Gm-Message-State: AJIora8l82WJS3Bs6uQAWPCYDErqvN8cB+49nkS1rRnJfOskZo0qxCud
	/EBqGM+erM7aXUcAbMEzCs+d+T+qdgrZ8A==
X-Google-Smtp-Source: 
 AGRyM1sChRCBR7Umew39viSad83aqzwJClJ5fL5RW8KeSFknIiFG4J/4fyoUUpSNwO4w+QUMWXywjw==
X-Received: by 2002:adf:eb48:0:b0:21d:7ffc:4919 with SMTP id
 u8-20020adfeb48000000b0021d7ffc4919mr3367448wrn.537.1657144073513;
        Wed, 06 Jul 2022 14:47:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e441:58cf:44fd:9058])
        by smtp.gmail.com with ESMTPSA id
 q11-20020adfea0b000000b0020fff0ea0a3sm36169755wrm.116.2022.07.06.14.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:47:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] sato-icon-theme: Add back with support for scalable
 icons
Date: Wed,  6 Jul 2022 22:47:51 +0100
Message-Id: <20220706214751.1035230-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706214751.1035230-1-richard.purdie@linuxfoundation.org>
References: <20220706214751.1035230-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167751

Resurrect sato-icon-theme and move to a version with scalable icons support
to replace adwaita-icon-theme which no longer supports the icons we need
for the sato desktop.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/conf/layer.conf                          |  2 ++
 .../gstreamer/gst-examples/gst-player.desktop |  2 +-
 .../packagegroup-core-x11-sato.bb             |  2 +-
 .../sato-icon-theme/sato-icon-theme_git.bb    | 28 +++++++++++++++++++
 5 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb

v2 - add missing layer.conf change to make allarch work

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c55b2a09cf9..a69af3d7805 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -725,6 +725,7 @@ RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 076cba58d12..1387539734d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -82,6 +82,8 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
   connman->xl2tpd \
   lttng-tools->lttng-modules \
+  sato-icon-theme->gdk-pixbuf \
+  sato-icon-theme->gtk+3 \
   adwaita-icon-theme->gdk-pixbuf \
   adwaita-icon-theme->gtk+3 \
 "
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
index 7ddd456a1ed..d165e5d910e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
@@ -1,7 +1,7 @@
 [Desktop Entry]
 Name=Media Player
 Comment=Basic media player
-Icon=multimedia-player
+Icon=video-player
 TryExec=gtk-play
 Exec=gtk-play
 StartupNotify=true
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index cfa301a58d2..6866a4d7380 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -31,7 +31,7 @@ RDEPENDS:${PN}-base = "\
     matchbox-keyboard-im \
     matchbox-config-gtk \
     xcursor-transparent-theme \
-    adwaita-icon-theme \
+    sato-icon-theme \
     settings-daemon \
     shutdown-desktop \
     ${NETWORK_MANAGER} \
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
new file mode 100644
index 00000000000..e2140bfdd70
--- /dev/null
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Sato icon theme"
+HOMEPAGE = "https://www.yoctoproject.org/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+
+LICENSE = "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
+SECTION = "x11"
+
+DEPENDS = "icon-naming-utils-native libxml-simple-perl-native"
+
+SRC_URI = "git://git.yoctoproject.org/sato-icon-theme.git;protocol=https;branch=master"
+SRCREV = "d23f04ecb0328f655bf195df8eb04c1b734d53a9"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig allarch gtk-icon-cache perlnative
+
+# The configure script uses pkg-config to find native binaries to execute, so
+# tell it to use our pkg-config-native wrapper.
+export PKG_CONFIG = "pkg-config-native"
+
+FILES:${PN} += "${datadir}/icons/Sato"
+
+do_install:append() {
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s preferences-system.png {}/apps/preferences-desktop.png \;
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s file-manager.png {}/apps/system-file-manager.png \;
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s ../apps/terminal.png {}/places/computer.png \;
+}
-- 
2.34.1


