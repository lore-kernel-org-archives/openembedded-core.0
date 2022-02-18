Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED6FC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 00:27:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.4975.1645144033638794951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N0Ds7T19;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id w13so3692779wmi.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opMV3RxVL415dFx3JhYAS3lE3LHVQdIWsc0HTKUS8O8=;
        b=N0Ds7T19btp+mLiK0+IPGZ4DqtFr7CIqMJITru4JbSZwCuIf4bMKu01RLJLJ2Y38fY
         FBnTLm7MM/bdSIkDycPts2JLcjN4i91rQiqdBgiDz64a1lUyZevv3sFIeyc85EvXcZFe
         X41rZSOU6bNN0U/5jOtHbp/xfsaYFdyYfjrA5spnS0Z0CpQHGoYqtcettYD3An7lEvte
         Aoz1aoeIBKTm/00lJvvci4cMDxVJK/wqte+2K+TnL8qsWkenIM3HjHeKyORhjncgoWLR
         OxY+aZoYx8bNm9yEbUDfnAubod2m1rw5vkfN8LGj+ntrtS4byhsYJIiEQBP+/l55CkSv
         j3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opMV3RxVL415dFx3JhYAS3lE3LHVQdIWsc0HTKUS8O8=;
        b=npoZ0Hjb78EMnNulM1z/FqwlkjMkMdHOnO3SOgEOZ89rkJZJxownG4xvPeZGO2xbyc
         212ZiQjw0reaSKNlUBmGqPdpnyZtBJxy6bS6eC20+t3bmlG3avUd8hTjAYVkCcJh1Eoz
         5uz56qyNAk65Up30Uuyhfa5XTknrBjnIfVy2ot5CxnSxhlb53t2waQLcq14Ki/sKlTPg
         6QvuIqsOfnqDAPyr3K4JjukccO13qic8Lq0ksE63k2xqxQ+PJqJ0yG561HxRLrMqlyQF
         lC/d9A9NNGgDZrg/hk7gJ3adv95aHGwMutOzURgk9rTTaLMTRAgNi0CldAikx2sktnLe
         RU5g==
X-Gm-Message-State: AOAM533/ZCGqOh85JqZhIHYuXfTsvN2P5NKTpsvC7dhP1Ah3TjaR9HbO
	UwEaX9wSYSCbnwiuH3m97UjUeIWd+1ua+g==
X-Google-Smtp-Source: 
 ABdhPJxOZ2qE0Wy6ijSl2JdchkEbjAvRmJ+2R9UZgqCy1bCDb7dt4YBFquZccEIl0EQI4oFPFRqKsA==
X-Received: by 2002:a7b:cd87:0:b0:37b:b8a8:2d28 with SMTP id
 y7-20020a7bcd87000000b0037bb8a82d28mr4697000wmj.176.1645144031474;
        Thu, 17 Feb 2022 16:27:11 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 d2sm11850027wro.49.2022.02.17.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 16:27:10 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v2] gstreamer1.0: update licenses of all modules
Date: Fri, 18 Feb 2022 00:26:59 +0000
Message-Id: <20220218002659.789148-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 00:27:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161876

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb    | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.20.0.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.20.0.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb | 2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb        | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
index 7a27d27b2e..e17f4ee09d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A Tool to test GStreamer components"
 HOMEPAGE = "https://gstreamer.freedesktop.org/documentation/gst-devtools/index.html"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://validate/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 #S = "${WORKDIR}/gst-devtools-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
index 98b2650bb0..575e608d65 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
@@ -6,7 +6,7 @@ SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
index 15f19e349e..94c5214a37 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 915d4ec744..44532222fa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
index 455c9fc480..c9fbc599ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
@@ -3,7 +3,7 @@ require gstreamer1.0-plugins-common.inc
 DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
index da4d4a8ccb..17086bc3b8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a14649
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 8128104319..9b6f80aa89 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
index 3399b6f9d7..29d7c55acb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
@@ -4,7 +4,7 @@ provided by python-gi) "
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
index 66764f0880..be81f87616 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
index ce7fbde0df..7ef8ae3138 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
@@ -6,7 +6,7 @@ based plugins for GStreamer and helper libraries: `vaapidecode', \
 
 REALPN = "gstreamer-vaapi"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 243f99fee9..a84616cdd9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -4,7 +4,7 @@ It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime.
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
-- 
2.35.1


