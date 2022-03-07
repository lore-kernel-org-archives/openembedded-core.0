Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB73C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 22:08:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.1502.1646690904019490962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDf6+aAn;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id q14so9957584wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g19LZXb+QemyGczkI9nmFTfWlucZZJMpZvcEsCu9PIk=;
        b=SDf6+aAnae7LbARyeKKLM+b6Gc4A+fsif5iN+SCT2eebR/oQZaSf1/IHU3RMRCd9O8
         L9gq3h6ICq6V8nL2LgSlRR5nWWUK2eOdOZvzVA1wx0SWYnOMtSUTFTHEIQRh8Aby9SPp
         pXFCy0uhbQLfGpETZMNhIN8bNk0QOnbiiSxvINrRy8YjwwKQEgyxXPUPpeU4uFZ2CyCR
         V2ABZt96qctbTSo0NFiSxvXGABSPZCF8fpB9crcLVW8OPLkxLU0zLlbpfZrvdi7ILswi
         lHP5VE2q6DBcrOBtwUgvbvIi/e7mVBoQVGmRPPz6m6YEQglxC67mG9/6eXj1aMFkguwy
         bqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g19LZXb+QemyGczkI9nmFTfWlucZZJMpZvcEsCu9PIk=;
        b=NYksTLNDxZtw1d4BnWu/RSi6/gzN+mF+Zmx2rLJrNR1gbOXarm+DuMYS4CGAYlVAjg
         BHOmm7uPLtwDCc4aGtxiTe2wq+D4ZMxYcYEHtnXRlpXJq2gCfOHijQETFs+4Y30DA21h
         diYPvAdkM7fCmHY2TfSXGO0p7189pllLTYUDihxNNcuu9/qXD1OSnXRAsIy5xx1vRcwD
         /kF/MWZel4uPM7tphg/Mq4eDdIEItIRqfXq7AqiU5pZ7LJ2Vfwx4/zfkdmQBmDbs6sXD
         HMdxDS8mKueIfcGUAEGpxXkyakJ4YIckAdFoIXQQKM7b7hIkVUfNUeiiFMxbQpvn02bR
         HcbQ==
X-Gm-Message-State: AOAM531YyOeTMqYec6WAVh3ksNKRSfh3d7E/LBwa1KKGLFSGTLsNojXe
	pdtjOSXHgaL6j5aQtAmDQeB8ixtOyUY=
X-Google-Smtp-Source: 
 ABdhPJyveY3Y//OUjQEt2DEMB1Smpuqd+nvFlvgZ4wAC2IzvX21HJI8KP+8BKma7MUsmlGR0rKuEUQ==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr10138902wrm.521.1646690902043;
        Mon, 07 Mar 2022 14:08:22 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b001f03439743fsm12311886wrq.75.2022.03.07.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:08:21 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v5] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later
 only when it is in use
Date: Mon,  7 Mar 2022 22:08:09 +0000
Message-Id: <20220307220809.553748-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 22:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162866

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

For the GPLv2+ this patch set this license only for each plugin
that is affected by by that, using the new GSTREAMER_GPL.

CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer1.0-plugins-bad_1.20.0.bb        |  6 +++---
 .../gstreamer1.0-plugins-license.inc          | 19 +++++++++++++++++++
 .../gstreamer1.0-plugins-ugly_1.20.0.bb       |  8 ++++----
 3 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 44532222fa..3af6cfe0c1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -91,13 +92,12 @@ PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
-
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]             = "-Dgpl=enabled,-Dgpl=disabled"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd x265', d)}"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Daes=enabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
new file mode 100644
index 0000000000..6638f13540
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
@@ -0,0 +1,19 @@
+# This .inc file contains functionality for automatically setting
+# the the license of all plugins according to the GSTREAMER_GPL.
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 9b6f80aa89..6f471fff4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -1,4 +1,5 @@
 require gstreamer1.0-plugins-common.inc
+require gstreamer1.0-plugins-license.inc
 
 DESCRIPTION = "'Ugly GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
@@ -23,20 +24,19 @@ GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    gpl a52dec mpeg2dec \
+    a52dec mpeg2dec \
 "
 
 PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
 PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
-
-# GPL - only built if gpl option is also enabled!
-PACKAGECONFIG[gpl]      = "-Dgpl=enabled,-Dgpl=disabled"
 PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
 PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
 PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
 PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
+GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'cdio a52dec dvdread mpeg2dec x264', d)}"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Dsidplay=disabled \
-- 
2.35.1


