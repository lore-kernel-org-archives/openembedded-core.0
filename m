Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9A1E77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 22:04:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.36410.1735423488185365922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 14:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TOzi8dP1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241228220445af4402250bdbf90ee1-wwfp26@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241228220445af4402250bdbf90ee1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Dec 2024 23:04:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eIW9/l45jzTzjNfmk428Eb8Bd/huk2y7FVEUL2GANOU=;
 b=TOzi8dP1u2tNxKUCkpI8FCGtnAAu/ETU684gvKsuRqlOL6yRZKCg6dIbbsngcPuspfdkdn
 kJi5ZgY42UWy+5iUxTCMWZYwJ8l1GFVYDKJMFU02TK8HaLqFwNWVP+q5F8BTUDHF7OfqBXO2
 Em7Nn9LFr4scuiQlsIyUR1bshka/fGQLmpiDyXt1BUxLMrJtXq2ULdy5GfZECNNXYNmKfU5m
 jbdvbtvCWMXGrHSRZ/1tKlBDBQedxLhjLCASfXVOjDtWm9ygQscY+PW7726O1Ya5SKSNcY8u
 3OT9dR8JU41tnhXNOlIm7aiVb/LxnmnsH/mImoT1FubjRBzZBHGFjnOQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 4/4] gstreamer1.0: upgrade 1.24.9 -> 1.24.10
Date: Sat, 28 Dec 2024 21:49:08 +0100
Message-Id: <20241228204908.2470952-5-peter.marko@siemens.com>
In-Reply-To: <20241228204908.2470952-1-peter.marko@siemens.com>
References: <20241228204908.2470952-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 22:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209127

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 42104c010fc6f9bdee84625604777974ad2b70a5)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb}         | 2 +-
 ...treamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} | 2 +-
 ...lugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} | 2 +-
 ...gins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} | 2 +-
 ...gins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} | 2 +-
 ...gins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} | 2 +-
 ...eamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} | 2 +-
 ...tsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} | 2 +-
 ...treamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} | 2 +-
 .../{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb}         | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
index 63779b5aff8..7e46634ed05 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "cf1de1aafa6eb4fd0365932b251528e2340b88697541e021628c5f7259970fb8"
+SRC_URI[sha256sum] = "2983537148b0a8d52bad2a3f4c9dcca808fd5aa12fccee25acc4a4277f0780ec"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
index a5cfc8632ad..629e9516c30 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "32682e9ae508ee01f4fb134b3a520081e2ac007220997577624b1d16171d456c"
+SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
index be2628d14a6..789e1aef8e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "36fcf7a9af0a753b43bb03b9835246f74d72f7124369e66a1e2dc7b04f5a5cab"
+SRC_URI[sha256sum] = "1707e3103950c9baed364a8af2ba0495d6b113fcd36e1062dda5f582b8f8904d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
index 996a06500e7..452685d2ea1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "5bb3b946907d3ce04dd842b610c8111c2b0611351b25a1fa22af5efa897857cb"
+SRC_URI[sha256sum] = "ebd57b1be924c6e24f327dd55bab9d8fbaaebe5e1dc8fca784182ab2b12d23eb"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
index 95f03b1da27..653aa1cfc4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "897de50bff337e3ca2f86f1eaa28e0828d83024156162a50c4ea0af86e29799f"
+SRC_URI[sha256sum] = "fce748fa66d7a8ee1fb261489e59d01e3fa787623d6d5c35068416fe7cd0acb3"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
index 45abe686596..607dc71971d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "4b6b30110f38cd05eb67422297142b75a55fe00003105f48b13603e6761cc3b6"
+SRC_URI[sha256sum] = "9df6fd85a7256241efbb25f84b337575e3b345266f5dab3849371e4694779f18"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
index 25c9179bfdd..f682f093eb0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "80e61d587c34cbac79e46c927b71cf32c4bf9bb0868ce5aa4b7444bdad83f42e"
+SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
index 776e177b9fe..a33c8c0027f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "299c9aafac3c91bbebe4cd481ed4e4ade8cb2b0677097bc4a8dcf6d4364c9804"
+SRC_URI[sha256sum] = "db21dfdd7bf2e718564d557378ada5358b411efe2a3e89e9f0f87a74537e2adc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
index 0cc62e345eb..31b4aa27e39 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-meson-Re-added-required-lines-accidentally-removed.patch \
            "
 
-SRC_URI[sha256sum] = "c2373e9b4d6655535d355207f60084b0fb3b28566fe9bb4ca1da714439da4ae1"
+SRC_URI[sha256sum] = "21593dbde5c6bcdcfe99195defbe3c3f4da01cb85f8ec10aae943887d39d8a4c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
index a756f9e3a2c..326a2f26a9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ebf47b6beef508a00c8557d4c1f1713e5c7ef9ba70dac45deed80e182bcf260f"
+SRC_URI[sha256sum] = "9fc45b1a332e8f812f09e95c281cd75969f6d1682d062a815db0e7bc047518fd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.30.2


