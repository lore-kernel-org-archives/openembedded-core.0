Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEF2C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 23:15:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5279.1668726949285758711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 15:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CFeHPa1Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id b21so3019401plc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 15:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYh0FEeMb2QHX7876jfNGnSJS+OVC+hOp0O5znAg3iA=;
        b=CFeHPa1QBtlCiOoCo0FBgMK/bb/rEVcvay7Bj9DDENidUN9s6RHaUvSEeXX3B91D26
         ykwiire6AYnn7fDPkQopkRVw7mK2w6fh6/Vgn4E6nD0pkAaQnWQ4bbYgc8ap58mSX60c
         9/6v8VFTqz2VixzNNvOycAlPYzjG0reldPiE3D/dRVC+NIVO+y7Ybx8qtDt5Bc/5czys
         ZDF7wcqGMZmT0w7oqG0DZaMMnCMmiWODhd6skPp0YHHCCppw8jWPPOtGyPCxqC/wXbTY
         h//upjaZuObY6W0k/a3hi4b6ow3lXfmxKCvsO5JPBtIzxJgeY63/BYKYaP0kvO8JKAJr
         ViNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYh0FEeMb2QHX7876jfNGnSJS+OVC+hOp0O5znAg3iA=;
        b=l1+mPUKdQdoT7KUjBQbH/uf88nGTPeYQofNfNiBXPyuJsAk18ziJDqQ0sVyzkCqfPw
         y6IrclpythpMwL9AZnoIOC4ktKVSmXNBWIlr155lDiXIuv8t4PQ8ekSjzWDWRvPPBGu7
         v6RBUYFrZR4cFbMfGVSLRQ6My3aY7HWQSxEngmD/BK7LLo6zoiQIFSmPqRLVRNPVU1dl
         7Epz2jZdMgq2ihW3KDCw2WOyx4rIUGYsQVHFhBp28Z6hK57b2fLuQDJ14DjtGsefsxsO
         nyyQzITbIlQ6SJev3QbxrlNgUZ35LDE56IOHkbuhNAvdNbx9kwKEdTJh3Ni8EYDlrpWa
         h3Gw==
X-Gm-Message-State: ANoB5plKHPnkwGKkSRT3NQAGCjsfYTTkJtF/iqNraBKVJDfqVgSQt5GV
	DOGLD5icb04ewRVtdl4NHs2aG1RsCgaLWw==
X-Google-Smtp-Source: AA0mqf5yDfGAcZvfCdwuuO/xWKvd21HZxspRA9qloo+XQlDIxrk7W3UoT3Grczuv8oTNH6vl98foMQ==
X-Received: by 2002:a17:90a:307:b0:213:ff80:b37f with SMTP id 7-20020a17090a030700b00213ff80b37fmr10976007pje.118.1668726947815;
        Thu, 17 Nov 2022 15:15:47 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:136a:c5ac:9c02:4bf1])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b004308422060csm526129pgc.69.2022.11.17.15.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:15:47 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] at-spi2-core: upgrade 2.44.1 -> 2.46.0
Date: Thu, 17 Nov 2022 15:15:35 -0800
Message-Id: <20221117231535.3728976-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 23:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173450

* Both atk and at-spi2-atk are now merged into this project.
  - drop atk_2.38.0.bb
  - drop at-spi2-atk_2.38.0.bb
  - PROVIDES += "atk at-spi2-atk"
  - RPROVIDES:${PN} += "atk at-spi2-atk"
* DEPENDS on libxml2
* Ships:
  ${libdir}/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop
  ${libdir}/gtk-2.0/modules/libatk-bridge.so

What's new in at-spi2-core 2.46.0:
* Fix GetInterfaces documentation on org.a11y.atspi.Accessible
  interface.

What's new in at-spi2-core 2.45.91:
* Send device event controller events using the same signature as other
  events.
* Document the Accessible, Action, and Cache dbus interfaces.
* Fix license of atspi-gmain.c (#87).

What's new in at-spi2-core 2.45.90:
* xml: Add some documentation.
* xml: Fix event arguments.
* xml: Add some missing DeviceEventController methods.
* Bind the AT-SPI bus to the graphical session.
* Mark bus service as belonging to the session slice.
* Add ATSPI_ROLE_PUSH_BUTTON_MENU.
* Add an "announcement" event/signal to allow objects to send
  notifications (!63).
* Various code clean-ups and test improvements.

What's new in at-spi2-core 2.45.1:
* Atk and at-spi2-atk are now merged into this project.
* Now requires meson 0.56.2 and glib 2.67.4.
* at-spi2-atk: Expose the accessible hierarchy via dbus introspection.
* Properly escape the AT-SPI bus address; fixes warnings about the
  address not containing a colon (!55).
* Add a text value to AtspiValue, so that a value can expose a textual
  description, as in the new Atk value API.
* Add atspi_event_listener_register_with_app, to allow an event listener
  to be registered only for a given application (!52).

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/main/NEWS

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 --
 .../recipes-support/atk/at-spi2-atk_2.38.0.bb | 20 -------------------
 ...-core_2.44.1.bb => at-spi2-core_2.46.0.bb} | 12 ++++++++---
 meta/recipes-support/atk/atk_2.38.0.bb        | 20 -------------------
 4 files changed, 9 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
 rename meta/recipes-support/atk/{at-spi2-core_2.44.1.bb => at-spi2-core_2.46.0.bb} (76%)
 delete mode 100644 meta/recipes-support/atk/atk_2.38.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5b7ce77c3cc..03db94824d0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -46,9 +46,7 @@ RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-at = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-at-spi2-atk = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-at-spi2-core = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-atk = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
deleted file mode 100644
index 87f7b83c7d0..00000000000
--- a/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "AT-SPI 2 Toolkit Bridge"
-DESCRIPTION = "Contains a library that bridges ATK to At-Spi2 D-Bus service. Toolkit widgets use it to provide their content to screen readers such as Orca."
-HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-BUGTRACKER = "http://bugzilla.gnome.org/"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.sha256sum] = "cfa008a5af822b36ae6287f18182c40c91dd699c55faa38605881ed175ca464f"
-
-DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase upstream-version-is-even
-
-PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
-
-FILES:${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
-FILES:${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.44.1.bb b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
similarity index 76%
rename from meta/recipes-support/atk/at-spi2-core_2.44.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.46.0.bb
index 95a6c619f0e..5ab501908d5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.44.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
@@ -11,13 +11,17 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4beb23270ba6cf7caf20b597354d75194d89afb69d2efcf15f4271688ba6f746"
+SRC_URI[sha256sum] = "aa0c86c79f7a8d67bae49a5b7a5ab08430c608cffe6e33bf47a72f41ab03c3d0"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-DEPENDS = "dbus glib-2.0"
+DEPENDS = "dbus glib-2.0 libxml2"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
+# For backwards compatibility
+PROVIDES += "atk at-spi2-atk"
+RPROVIDES:${PN} += "atk at-spi2-atk"
+
 inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
@@ -31,7 +35,9 @@ GIR_MESON_OPTION = 'introspection'
 GIR_MESON_ENABLE_FLAG = 'yes'
 GIR_MESON_DISABLE_FLAG = 'no'
 
-FILES:${PN} += "${datadir}/dbus-1/services/*.service \
+FILES:${PN} += "${libdir}/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop \
+                ${libdir}/gtk-2.0/modules/libatk-bridge.so \
+                ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service \
                 ${datadir}/defaults/at-spi2 \
                 ${systemd_user_unitdir}/at-spi-dbus-bus.service \
diff --git a/meta/recipes-support/atk/atk_2.38.0.bb b/meta/recipes-support/atk/atk_2.38.0.bb
deleted file mode 100644
index 62fec9abf8d..00000000000
--- a/meta/recipes-support/atk/atk_2.38.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Accessibility toolkit for GNOME"
-DESCRIPTION = "Provides application programming interfaces (APIs) for implementing accessibility support in software."
-HOMEPAGE = "https://wiki.gnome.org/Accessibility"
-BUGTRACKER = "https://gitlab.gnome.org/GNOME/atk/-/issues"
-SECTION = "x11/libs"
-
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
-                    file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
-
-# Need gettext-native as Meson can't turn off i18n
-DEPENDS = "gettext-native glib-2.0"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
-
-SRC_URI[archive.sha256sum] = "ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


