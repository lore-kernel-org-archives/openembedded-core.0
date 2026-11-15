Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15441.1794778947807148337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GOrVANxk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202611152142258f4142c3e700020738-_3mk_d@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611152142258f4142c3e700020738
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=M6vd/lOY2mSEr95xSwqZUsI91I8cRdnDNqX4EJu4INA=;
 b=GOrVANxkwBUoYajAmYdf+s5xV7LR8i1X9QAW2qf1Q+V6blQmgjwAHJYDIh4/LT2QvQVbNf
 U0kpKM5bNKub9RF82I5jo2QfdUm7GdnwXZFz1WOSgePzlOstNnqTcYjsdBtl21wU6iyBbdso
 9DM0icnObP/SAw9BJ1vfr/LfC8EVT/oKD/VF3B1sz7Opj1joJOni43+h+AjHwrfJciIdz08C
 uVPpQV2SGXG0pVW0TYh1y7khQ8FOuluomcEudywCq8Zi7YTQoSVcDKZznBq6SEBpryLmAb2W
 tGD0pJZfJ+k/ZCPzY0exOc0BoMLxj1nA8kfFXVr99FcRbgbyLa/FLubQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/9] gstreamer1.0*: upgrade 1.28.5 -> 1.28.9
Date: Sun, 15 Nov 2026 22:39:36 +0100
Message-ID: <20261115213944.1653468-2-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250291
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Copy current master state to wrynose (only update hashes and refresh
patches).
Reason is that for some AUH updates each recipe alone instead of doing a
single commit for all parts. That would be 42 commits to pick.

Release notes:
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.6
  * CVE-2026-73433, CVE-2026-73434, CVE-2026-73471, CVE-2026-73472,
    CVE-2026-73473, CVE-2026-17072, CVE-2026-19389, CVE-2026-18649,
    CVE-2026-19387
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.7
  * CVE-2026-88914, CVE-2026-85150
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.8
  * CVE-2026-86476, CVE-2026-112214, CVE-2026-111183, CVE-2026-116612
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.9
  * CVE-2026-121601, CVE-2026-121611, CVE-2026-119610, CVE-2026-116611,
    CVE-2026-121629, CVE-2026-100231 and 3 pending CVE requests

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ect-has-a-different-signature-on-musl.patch |  2 +-
 ...vtools_1.28.5.bb => gst-devtools_1.28.9.bb} |  2 +-
 ...0001-Make-player-examples-installable.patch | 18 +++++++++---------
 ...amples_1.28.5.bb => gst-examples_1.28.9.bb} |  4 ++--
 ..._1.28.5.bb => gstreamer1.0-libav_1.28.9.bb} |  2 +-
 ...tialized-warnings-when-compiling-with.patch |  6 +++---
 ...2-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...missing-opencv-data-dir-in-yocto-buil.patch |  6 +++---
 ...padded-buffers-in-wl_shm-buffer-creat.patch |  6 +++---
 ...5.bb => gstreamer1.0-plugins-bad_1.28.9.bb} |  2 +-
 ...get-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...aparse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...viv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ....bb => gstreamer1.0-plugins-base_1.28.9.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-good_1.28.9.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-ugly_1.28.9.bb} |  2 +-
 ...1.28.5.bb => gstreamer1.0-python_1.28.9.bb} |  2 +-
 ...5.bb => gstreamer1.0-rtsp-server_1.28.9.bb} |  2 +-
 ...espect-the-idententaion-used-in-meson.patch |  2 +-
 ...sts-add-support-for-install-the-tests.patch |  6 +++---
 ...ts-use-a-dictionaries-for-environment.patch |  2 +-
 ...per-script-to-run-the-installed_tests.patch |  2 +-
 ...mer1.0_1.28.5.bb => gstreamer1.0_1.28.9.bb} |  2 +-
 23 files changed, 40 insertions(+), 40 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.5.bb => gst-devtools_1.28.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.5.bb => gst-examples_1.28.9.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.5.bb => gstreamer1.0-libav_1.28.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.5.bb => gstreamer1.0-plugins-bad_1.28.9.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.5.bb => gstreamer1.0-plugins-base_1.28.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.5.bb => gstreamer1.0-plugins-good_1.28.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.5.bb => gstreamer1.0-plugins-ugly_1.28.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.5.bb => gstreamer1.0-python_1.28.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.5.bb => gstreamer1.0-rtsp-server_1.28.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.5.bb => gstreamer1.0_1.28.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index a348624e49..2b23d0f0ec 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From bb36ab400ee8b84b8f604aa3314952b7df2aeda6 Mon Sep 17 00:00:00 2001
+From b40b6d73c2ec97a8e6a7ebaa54446be204927b64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
index a0775e94ad..515afed6be 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "7459045db31d6e44600bcbe011dc925750268870e7b90f7e7a0a3af4a21c09e5"
+SRC_URI[sha256sum] = "cfe8ae964fb394e03fd66b831daba08e0b5d1fb7d8bf047ade351afcb5855eaf"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e7862b40e7..0d29fca0fd 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 75ff9436c9ff965327d6dad256c0a1539435b13a Mon Sep 17 00:00:00 2001
+From 7457c8c6e68673db5f059c8a3f2aad2b48d05f26 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -8,14 +8,14 @@ Upstream-Status: Denied [Upstream considers these code examples, for now a least
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
 index 5e80ca8dd4..129e5bdcbe 100644
---- a/playback/player/gst-play/meson.build
-+++ b/playback/player/gst-play/meson.build
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -23,10 +23,10 @@ index 5e80ca8dd4..129e5bdcbe 100644
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
 index 6892f15254..20d7505877 100644
---- a/playback/player/gtk/meson.build
-+++ b/playback/player/gtk/meson.build
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
index dcdf7fd433..b280d564a1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.28;tag=${PV} \
-           file://0001-Make-player-examples-installable.patch \
+           file://0001-Make-player-examples-installable.patch;striplevel=3 \
            file://gst-player.desktop \
            "
 
-SRCREV = "727ceb91886862d200f423baf36cde2bb7ce5b4d"
+SRCREV = "3ced45da096032bdac8e0922faa492a079c3180e"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
index bda9b213a3..bc4394acd4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "452854656056f0b16511a1d9ad4f2679ff5e5a87c89f90cf7ee5dec005ddb1e4"
+SRC_URI[sha256sum] = "4b3df21fa70972a80891d2298cf32c14a62c3db4483d545c7ac018230399186b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index f5eb011ffa..8d794995e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bcc4c0d84f573e5d53195a726b475d818759550d Mon Sep 17 00:00:00 2001
+From 47361b23b7e1add34cd53993654c686b332768a4 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,10 +11,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index d91cc3f..c9058cd 100644
+index 30f5818..764dca3 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
-@@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
+@@ -1746,7 +1746,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
      GstVC1SeqLayer * seqlayer)
  {
    guint32 tmp;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index ed0a248381..674ac87f03 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 86d9fc16f8d165e79d29ab1130e08663502dcd25 Mon Sep 17 00:00:00 2001
+From b3bc02f6f6d6dfc4623f9065acdaae729363f9d2 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 78981c0371..00673f82d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 08cf48c1ad094a522b558f10d24d4aec670dcc88 Mon Sep 17 00:00:00 2001
+From dca05b750039f9b80083d4bfc0dd2f379bfaa51e Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 60cb12b..4046b70 100644
+index 4ddf71f..1fd341c 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
-@@ -61,6 +61,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
+@@ -64,6 +64,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
  # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
  gstopencv_cargs += cxx.get_supported_arguments(['-Wno-missing-include-dirs', '-Wno-format-nonliteral'])
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
index 97b138a660..f90cf54923 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From 8ff54f765defbb343340da5de3cf5c89e400a8ff Mon Sep 17 00:00:00 2001
+From c83922f6cd39bee9bba2c1a54e478e36f05d8dd0 Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
@@ -30,7 +30,7 @@ Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
  5 files changed, 52 insertions(+), 35 deletions(-)
 
 diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
-index 0660b30..81bcd7f 100644
+index 7844645..13d846e 100644
 --- a/ext/gtk/gstgtkwaylandsink.c
 +++ b/ext/gtk/gstgtkwaylandsink.c
 @@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
@@ -73,7 +73,7 @@ index 0660b30..81bcd7f 100644
  
          if (G_UNLIKELY (!wbuf))
 diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
-index 443db24..60aa11d 100644
+index 3aa4540..0baafd7 100644
 --- a/ext/wayland/gstwaylandsink.c
 +++ b/ext/wayland/gstwaylandsink.c
 @@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
index 1b6a8ac30b..264756a949 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "d8af55faef2958c1a8663751475ee46f5164877cf4d8c5913ea906ef180aeb71"
+SRC_URI[sha256sum] = "4a4e0b7bf84f868378c48f143a7ac3a98923b488a5b74f1a35ba46bc3c43f6b1"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 635c801cdc..5e41992d58 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From ae52c483980409c64b8bdd0c7b794533bcc0fec8 Mon Sep 17 00:00:00 2001
+From 09ed10895efd65740601a3f4d6f22484b722262c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4ce9f30d6a..548f7c310e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 748c467f40d3f0072d9c139f9fdbbfdd56655c1e Mon Sep 17 00:00:00 2001
+From 415e22761bb952ff8bc01a91621461f68407b07d Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a824235731..9348c20e3b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 207df05a877717b1dd93a3a5903f0c58dd74c925 Mon Sep 17 00:00:00 2001
+From 2d6669e7163322cccafd1ea0a6fae2eb7939b2f0 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
index 813d1108ff..0f7044b7ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "776f19228f91fd25bbf54d9850597e158507f594872a52b9b6814e2429b43eaa"
+SRC_URI[sha256sum] = "c1fda668b520e6aef763c0eb962c032c9fe52bce322e8b00c69b4e9e847bddc1"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
index 7b8087eecf..bae0a89136 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "58b45d24a1d77b39d7bb7d9ccc6e2d76bbf28618998c335c163f18e6f94a9324"
+SRC_URI[sha256sum] = "e518cd97483706a252e95e60312a22d23dec6f5e7673af6f5bde719c3a9ca7f4"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
index 451378cf72..af965315e4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "0ef4cf9c3c9a5e776a6ca8d190a31863391b681980252143b822b29aa831e120"
+SRC_URI[sha256sum] = "550a52536962186f5488e06b5c08f31ae0f18400aee32a3385156d31cb4b1189"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
index d9179286a3..62b0c58b83 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0ac461b5700b9766998aa686439064caf58ca4fdaf848dfd477b5a7700b176cc"
+SRC_URI[sha256sum] = "e6ad2658fad5b96d99af72ceec7e48995ff792fbda438d34486d189ce047718a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
index 0b6672c3a6..b9db97451d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7e19fddeb1261bebc3ec397857fedd5c77129b66ab52788fdadad05117566225"
+SRC_URI[sha256sum] = "b87ed564d857a226a3135bd2c42eae7b40eb64031cb9cbce124722af92cc8b9d"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index de255bf791..211dcdc505 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
+From 3866886ce146491529ca290477c3edb9eab0add2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 5b52d66190..af5adbd733 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
+From 633e0fdf280427c03df201df92d845e4046f4f9e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index abd0ad6..93cd692 100644
+index ab64da1..1edc3da 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -662,6 +662,10 @@ if bashcomp_dep.found()
+@@ -665,6 +665,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index bc6dfe353a..600eeac108 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
+From 6dc17915211d1d30ec118de118582df4a1f72d90 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 8eb4bc2a81..0b2f6b2ca3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
+From b2427856fe10265ac71699020730306c1075ef0e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
index 2bdb1dc802..3a97ee009e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "a5a9f783809b17a8eb774f4a7695b2cb8cba6b15520129906f87eaf30e7f8469"
+SRC_URI[sha256sum] = "6dbf744f583131a34845cc641e803843766a9ba80ce00378a9043fd6d8d5fb38"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
