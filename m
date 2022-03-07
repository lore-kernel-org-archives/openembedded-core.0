Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903BDC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 08:59:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.24442.1646643570138909057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 00:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j0thmgRp;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5125082wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 00:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PPznJMOeO8nqdBePQ0aOibvkBKPOPAXOzcH5JzofCI8=;
        b=j0thmgRpzpG1raBv4d0COEhV7PP/4nbLzSrFwtcBeeFlpaKzZS4klFAQWSxoqhwmOB
         KxDLgdWpYA07iKed72j+gAiV4TtF8uVnH01sBiWszEfZipT9hVA+rIqGGZjbx8exOjqH
         rMpUBOxttDovYn3p887u7+YygnJ/CG9u7wVh1fe4DrnJpbhnvc7SJ53fUSedzsFM0MuF
         fTtfpilP4zH8xk6c+MpyC60yphojNqL90e6yG72ZRsjWDH5zoxfyqWA0givaRT4keSan
         LZGxZt/M/gnmyTtb+VXnfWQwZ3z7HH6c56g7E0mmw5rKKf+gFj2ntQooMkIrgvhz1dPq
         eHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PPznJMOeO8nqdBePQ0aOibvkBKPOPAXOzcH5JzofCI8=;
        b=E4P9QgR6KC0RaT7EqaVm88CW984JjDuOVtBUyw8SWnqp3i28Xiaq7d7HFCxBEB5xcX
         UIEYwfVL8RClUdLhaJF7D5r00nFszRiQ8iRwGPUgDb252y4Dfg1FAsGIsbEOrlLIXSAX
         3FLvbseE0ddaWl857HpG+kdTXX8JCWJS3vjgml1eaOW5M80CwGpsDXo6uSd75IbFWYcY
         uvu3O91NQwH6xSaNG8zcq8DxYhHFMbg3y99CyLToUSk91mp1GS6gLibJi+NQ0lVqS9/u
         Cx9PosdwemeoIjsTB6d1X3KN9toGYEvaG2CtUMQi+sCuBzpc3F/EXnSsfFfRRBlS0rv8
         XeUg==
X-Gm-Message-State: AOAM530AkulDlxxXoiXtDDQOcJDjSb8FbCDg8jLTvJQVkGW+eB/TzsOY
	Ow5YT2S8Bb76dihBxv4rqkC+nkxeRh8=
X-Google-Smtp-Source: 
 ABdhPJzZ2aVu7vueDzoUlNUwQ5RoND/J77fxN8C0bxfBoRGEJb5hwnwiffwZgnAb2DpVbZttACLx8Q==
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id
 s17-20020a1cf211000000b003816c60742fmr8278952wmc.130.1646643568050;
        Mon, 07 Mar 2022 00:59:28 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 186-20020a1c19c3000000b0038990c0925fsm7137499wmz.14.2022.03.07.00.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:59:27 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later
 only when it is in use
Date: Mon,  7 Mar 2022 08:59:19 +0000
Message-Id: <20220307085919.426627-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 08:59:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162800

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

For the GPLv2+ this patch set the license only for each plugin
that is affected by this license. The commercial LICENSE_FLAGS
is enabled if any of the previous plugins is builded.

CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer1.0-plugins-bad_1.20.0.bb        |  5 ++--
 .../gstreamer1.0-plugins-license.inc          | 26 +++++++++++++++++++
 .../gstreamer1.0-plugins-ugly_1.20.0.bb       |  8 +++---
 3 files changed, 33 insertions(+), 6 deletions(-)
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
index 0000000000..23a42d9c24
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
@@ -0,0 +1,26 @@
+# This .inc file contains functionality for automatically setting
+# the common license of all plugins so we can overwride some of them
+#
+# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
+# but can be used in any recipe that produces GStreamer plugins.
+
+PACKAGESPLITFUNCS:append = " set_gstreamer_license "
+
+python set_gstreamer_license () {
+    import oe.utils
+    pn = d.getVar('PN') + '-'
+    gpl_plugins_names = [pn+plugin for plugin in d.getVar('GSTREAMER_GPL').split()]
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in gpl_plugins_names:
+            d.setVar('LICENSE:' + pkg, 'GPL-2.0-or-later')
+        else:
+            d.setVar('LICENSE:' + pkg, 'LGPL-2.1-or-later')
+}
+
+EXTRA_OEMESON += " \
+    ${@bb.utils.contains_any('PACKAGECONFIG', "${GSTREAMER_GPL}", '-Dgpl=enabled', '-Dgpl=disabled', d)} \
+    "
+
+LICENSE_FLAGS = " \
+    ${@bb.utils.contains_any('PACKAGECONFIG', "${GSTREAMER_GPL}", 'commercial', '', d)} \
+    "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 9b6f80aa89..577ba16af7 100644
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
@@ -23,14 +23,14 @@ GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    gpl a52dec mpeg2dec \
+    a52dec mpeg2dec \
 "
 
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


