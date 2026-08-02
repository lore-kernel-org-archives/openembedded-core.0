Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8351C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 17:47:32 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27442.1785692849966400956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 10:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=R7yUH4ET;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202608021747256e84b79098000207e7-ourovy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202608021747256e84b79098000207e7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 19:47:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VUk5hGV7xwBU4V3BGLm3qdBE0vk+QARYu797xOcSQ90=;
 b=R7yUH4ETCv5ZkYLoGhHmLWVhtW16vQSRAW5wJM2JmKxwajxYCtPQvzfvawTlTGlZeLTq8c
 GhAhEsEIJIKmctyJxwy7ISujn3OLiRrlmEJYnoiqwut8aFuue56mdRM7omi5l/VN5XwIKo8r
 hJPcKGntBCAea2oeP/EvAa6R+qLzk/oypWy+dlJDi8eiPlTkDoWRnwHUSzMwP3xc+Vhz1ujA
 HLUKYb6pJKrXa7Wf+lw5wxcqemqqrV52vnWzuVKRZhz5FSLI6dHwUdPp3e+eHDWFn+zze3FE
 ci3yN1aNW4h2la+K+gvpcaRnji/3HFkZfmEuYAy586pHscpxlVlW49Hw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] gstreamer1.0*: upgrade 1.28.4 -> 1.28.5
Date: Sun,  2 Aug 2026 19:47:04 +0200
Message-ID: <20260802174704.867148-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 17:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242562

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2026-12891 and CVE-2026-12892.

Set their status explicitly as they are RedHat version-less CVEs.
Fix references are in Debian reports [1] and [2].

Refresh patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-12891
[2] https://security-tracker.debian.org/tracker/CVE-2026-12892

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{gst-devtools_1.28.4.bb => gst-devtools_1.28.5.bb}        | 2 +-
 .../{gst-examples_1.28.4.bb => gst-examples_1.28.5.bb}        | 2 +-
 ...reamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} | 2 +-
 ...ugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} | 2 +-
 ...ins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} | 2 +-
 ...ins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} | 2 +-
 ...ins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} | 2 +-
 ...amer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} | 2 +-
 ...sp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 2 +-
 .../{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb}        | 4 +++-
 11 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.4.bb => gst-devtools_1.28.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.4.bb => gst-examples_1.28.5.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
index 9641e42d38..a0775e94ad 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "11d4f1188639d3a9762039065bbb7b2c309b7a8ecc6fa4aed12245568bf00db3"
+SRC_URI[sha256sum] = "7459045db31d6e44600bcbe011dc925750268870e7b90f7e7a0a3af4a21c09e5"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
index ad6374d3fb..dcdf7fd433 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "b46f881eaa8126eddfd21b5ae5512f8d4ff36255"
+SRCREV = "727ceb91886862d200f423baf36cde2bb7ce5b4d"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
index 4898c42190..bda9b213a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
+SRC_URI[sha256sum] = "452854656056f0b16511a1d9ad4f2679ff5e5a87c89f90cf7ee5dec005ddb1e4"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
index 4051bcf7f2..81b4deb528 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "332b7320f30c60f2d5941446d03b9d05e3781f2c2561befbe88718bd777f0e47"
+SRC_URI[sha256sum] = "d8af55faef2958c1a8663751475ee46f5164877cf4d8c5913ea906ef180aeb71"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
index d9f85417cd..813d1108ff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "a898afd5766172b0049e6781558e0689098bf87b9d82b846c652e571c01d60d8"
+SRC_URI[sha256sum] = "776f19228f91fd25bbf54d9850597e158507f594872a52b9b6814e2429b43eaa"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
index d6c8d44be8..9d7fd62304 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c825ea737c59cea0e4a0c41da2388045ff5dd32d162220ac93a7a82ee4a04e61"
+SRC_URI[sha256sum] = "58b45d24a1d77b39d7bb7d9ccc6e2d76bbf28618998c335c163f18e6f94a9324"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
index 04df81f6d8..d1c7ad4d5c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "5486cd145c5af43259fd37caca59d048e2a67ddb07082ea8f50ef0f02a85f8a5"
+SRC_URI[sha256sum] = "0ef4cf9c3c9a5e776a6ca8d190a31863391b681980252143b822b29aa831e120"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
index 555b310594..d9179286a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
+SRC_URI[sha256sum] = "0ac461b5700b9766998aa686439064caf58ca4fdaf848dfd477b5a7700b176cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
index 338cf85e5e..0b6672c3a6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bfb6780542bf0d402736232aeae6c5a1b943c445775bf40305bcb86ca70705a0"
+SRC_URI[sha256sum] = "7e19fddeb1261bebc3ec397857fedd5c77129b66ab52788fdadad05117566225"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 957356c2ba..5b52d66190 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -22,7 +22,7 @@ diff --git a/meson.build b/meson.build
 index abd0ad6..93cd692 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -661,6 +661,10 @@ if bashcomp_dep.found()
+@@ -662,6 +662,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
index d1f06a5233..2bdb1dc802 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
+SRC_URI[sha256sum] = "a5a9f783809b17a8eb774f4a7695b2cb8cba6b15520129906f87eaf30e7f8469"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
@@ -72,5 +72,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
+CVE_STATUS[CVE-2026-12891] = "cpe-stable-backport: Fixed since 1.28.5"
+CVE_STATUS[CVE-2026-12892] = "cpe-stable-backport: Fixed since 1.28.5"
 
 PTEST_BUILD_HOST_FILES = ""

