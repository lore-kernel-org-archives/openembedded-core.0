Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644E4C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 00:15:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.21198.1646612141109379164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+UCXa53;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id x15so20733194wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=epNp7MgOWVR0EjbdVGvTwTVAC4bKpdewKM0tzmdABME=;
        b=f+UCXa53v/1ca0IYyq9vT7Ze276PS+rYfkLHzJL+jxpGddu8fncTZzD24XZdhrWqj4
         QjyikwqJGAYQRFs+dakamFGLsYV8tkegyCAvvARbZqvfQ081CIbzq2PJMT7Q3rbYYaYV
         39ydDYq4vkFRvG/udKkwvYK2o0ESUG2iHbEMxPchpHL/JDGVyzpfCWJEl1vJigjohLEq
         FaOuAdQC/AoxX7GLnn76X4Q48Xu7LIClEgcJ5fRaiZXoX4BtoL2ziqGfC3UPxg3SA3UF
         szRPn3WHnOSAL0d/wSbH+sK6OB4tGm2u1m4zG7qUN18yoLXIblvN9wWwhYzcd0oh+ztA
         78Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=epNp7MgOWVR0EjbdVGvTwTVAC4bKpdewKM0tzmdABME=;
        b=BkE/1CUcii7Uu967Afw4beuH/57ycll9uCEYTFcv3qyWw80ZJOHhpDVi+cH0ryy1K6
         3bsdBXhphEGVMg/u+kzxZIUjUQ/LyrTvIghG1IEZNZFaFlIKEuu/dinckMddr7wkZU4V
         8im0VQ8eRjGdAYv2mgowtOPp1vEDiYZK4xFQulLiUBIXOd9dUB9LSQCQ2YFLK32a1l5t
         sHs4/0BAcYDt24iufhJxM9dxyfaBlmHXlCr2b2sYO7MWi6yvKyFzC/Y97I4ZkQmBr+Nb
         OxefE+T47fpn2WVYIG6ExVvCIFh+xDrA+Vkk4G/in4veV1BfmniPhhqY7nLp4l4ohxDJ
         Ys0g==
X-Gm-Message-State: AOAM533ASarAAFb7Sk+29WkoR4SDzu8SIsvPeWzS5cgEC3uoIHCKvakb
	xVnC/GcflFL1k0GUplk9WQDm/2s7hCc=
X-Google-Smtp-Source: 
 ABdhPJweiQY9U+kCLl55oeMxVs5j7ZiVx2ta7QmoYk/xaaJU4bcjAhaBBH4TAOVW6/28hCjfK053cg==
X-Received: by 2002:a5d:4811:0:b0:1f1:d736:4862 with SMTP id
 l17-20020a5d4811000000b001f1d7364862mr6476199wrq.147.1646612139449;
        Sun, 06 Mar 2022 16:15:39 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm395774wmc.36.2022.03.06.16.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 16:15:39 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v3] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later
 only when it is in use
Date: Mon,  7 Mar 2022 00:15:27 +0000
Message-Id: <20220307001527.197791-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 00:15:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162794

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

For the GPLv2+ this patch set the licence only for each plugin
that is affected by this licence. The commercial LICENSE_FLAGS
is enabled if any of the previous plugins is builded.

CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer1.0-plugins-bad_1.20.0.bb        |  5 +--
 .../gstreamer1.0-plugins-license.inc          | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-ugly_1.20.0.bb       |  6 ++--
 3 files changed, 42 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 44532222fa..17799040ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -92,8 +93,8 @@ PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrt
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
 
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]             = "-Dgpl=enabled,-Dgpl=disabled"
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd x265', d)}"
+
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
new file mode 100644
index 0000000000..d7a39066cc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
@@ -0,0 +1,36 @@
+# This .inc file contains functionality for automatically setting
+# the common license of all plugins so we can overwride some of them
+#
+# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
+# but can be used in any recipe that produces GStreamer plugins.
+
+PACKAGESPLITFUNCS:append = " set_gstreamer_common_license "
+
+def get_gpl_plugins_name(d):
+    gpl_plugins_name = []
+    pn = d.getVar('PN')
+    for plugin in d.getVar('GSTREAMER_GPL'):
+        gpl_plugins_name.append(pn + '-' + plugin)
+    return gpl_plugins_name
+
+python set_gstreamer_common_license () {
+    import oe.utils
+    license = 'LGPL-2.1-or-later'
+    gpl_plugins_name = get_gpl_plugins_name(d)
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg not in gpl_plugins_name:
+            d.setVar('LICENSE:' + pkg, license)
+        else:
+            gpl_plugins_name.remove(pkg)
+}
+
+def gpl_oemeson(d):
+    gpl = '-Dgpl=disabled'
+    for gpl_plugins_name in get_gpl_plugins_name(d):
+        gpl = '-Dgpl=enabled'
+        d.setVar('LICENSE:' + gpl_plugins_name, 'GPL-2.0-or-later')
+        d.setVar('LICENSE_FLAGS:' + gpl_plugins_name, 'commercial')
+
+    return gpl
+
+EXTRA_OEMESON += "${@gpl_oemeson(d)}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 9b6f80aa89..8e2fadfb02 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Ugly GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -8,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
@@ -29,8 +29,8 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
 PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
 
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]      = "-Dgpl=enabled,-Dgpl=disabled"
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'cdio a52dec dvdread mpeg2dec x264', d)}"
+
 PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
 PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
 PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
-- 
2.35.1


