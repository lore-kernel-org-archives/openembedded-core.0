Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F132C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:16:53 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6089.1657113406359058485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M0Kx452V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id s1so22030571wra.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OHek/AvXv5iUq+a77IgmT50+z4cKgy3NlgN/DmCSjIk=;
        b=M0Kx452VTvj1W5PEMufkHiLoSfBmFaVHREAMCrE2dzlGEi9loHP/H51p3Mz1sJaJJ3
         3B3HyolouGiCdjP6fBKEXjoUDV2KeN/PEbnPWQJgh+1T1TLWCpt0aUoc7YQIrHBNDrl6
         qVxxNHTq442fUzlE0j5jqa1RrsMs+pOn+L+dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHek/AvXv5iUq+a77IgmT50+z4cKgy3NlgN/DmCSjIk=;
        b=GPrV9+befAZ/5tVgcYWE0zlKwVE18ZMQDx8ivQsALfOwLriAGJ3q0MwvRVDVylp7Np
         H3JvWHEtwCpAPyaMwTlcZTICTZfaKqksHyBiAmZcOUokJc/9owoeup/4DMrG1y4JqMmc
         FIIeJnGhc78/lNTTLC+s6EcCNftQb4u9ar5oAiXW2Nar8Ih99/80Y1sriCoDfZUtHhxI
         fpv5Orb/CrLvs/KGupHEec1udThWlLvugzm2u4s0EgkVaaWIu0iQpe68aF0PP3S2BYwO
         YGwsIR6Y7HyJvk/NpZIr2h2RWZKmF+ocFvuoWhImJVTEilXizQC/8OsSxdhjqgSNHrsb
         94Kw==
X-Gm-Message-State: AJIora98uLJk6d0/xTXATL8fQhzopKvgKnnhavM+uLgWc4/giy6ep0zZ
	xyGYOSe0aBpgO+dWq1M7fSgUyw1zfN/brw==
X-Google-Smtp-Source: 
 AGRyM1vUyyCV3tY1NM4sONOzt3G1YTAc0wW2pmTtRE7dTP2EGNJKKfWs1EX2trTKZE7NRrM2ssgkgg==
X-Received: by 2002:adf:ed44:0:b0:21d:81a3:d78 with SMTP id
 u4-20020adfed44000000b0021d81a30d78mr181195wro.677.1657113404604;
        Wed, 06 Jul 2022 06:16:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm35893317wrs.31.2022.07.06.06.16.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 06:16:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sato-icon-theme: Add back with support for scalable icons
Date: Wed,  6 Jul 2022 14:16:42 +0100
Message-Id: <20220706131642.1011068-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
References: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167722

Resurrect sato-icon-theme and move to a version with scalable icons support
to replace adwaita-icon-theme which no longer supports the icons we need
for the sato desktop.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../gstreamer/gst-examples/gst-player.desktop |  2 +-
 .../packagegroup-core-x11-sato.bb             |  2 +-
 .../sato-icon-theme/sato-icon-theme_git.bb    | 28 +++++++++++++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb

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


