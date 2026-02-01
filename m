Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF62D172D4
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29055.1769951567044872156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MtI2q3uD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=REAO8ZJy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c19559989-f047fe12-3481-42b4-b059-302a01ad66c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9aaX22MjtY06GzVJikAZwz8i3YPWyyzIkHsGCARkv/A=;
	b=MtI2q3uDA0G/X+tuQpW+YPdO0OFypgSMgVlX7W7j+2YzFIw4xcqHgLen4KWlj9PS
	MYHBlLtGcRYzRNMgdsVn4TwVw9ogHswv1QR6YYianCO1kKZBwKEFb3VHOEYgoDfwtm7
	ucRaTsBnneiVYQx+3tmXS0J49sqUXURnqYkH3WRA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9aaX22MjtY06GzVJikAZwz8i3YPWyyzIkHsGCARkv/A=;
	b=REAO8ZJy6k5enWGtJTsZ3q++4tEB45JHyEjPKV8PBA7MF7rAZ/ZwiopYp1gl+96k
	CRVtadDHdO7ymL/IZDmwMN2vrGWmO6OV8adsZ883bu42FaZo8PcxJnUucW1AJeJmJ4L
	tgelFig1ZLonAYPo6KJtGCsXG6C5SH5o4qhE6OAw=
Content-Type: multipart/mixed; boundary="===============3723077693802105289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrading to 1.28.0,1.28.0,1.28.0,1.28.0,1.28.0 FAILED
Message-ID: <0101019c19559989-f047fe12-3481-42b4-b059-302a01ad66c1-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230271

--===============3723077693802105289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly* to *1.28.0,1.28.0,1.28.0,1.28.0,1.28.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-gstreamer1.0-plugins-good-.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 53b92fb19cd2055bb29f05888d07776b29e173d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 07:14:57 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrade 1.26.9 -> 1.28.0,1.26.9 -> 1.28.0,1.26.9 -> 1.28.0,1.26.9 ->
 1.28.0,1.26.9 -> 1.28.0

---
 ...x-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch          | 2 +-
 ...encv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 4 ++--
 ...ins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.0.bb} | 2 +-
 ...ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 6 +++---
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch      | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch        | 2 +-
 ...s-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.0.bb} | 2 +-
 ...s-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.0.bb} | 2 +-
 ...s-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.0.bb} | 2 +-
 ...-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.0.bb} | 2 +-
 11 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.0.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.0.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.0.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.0.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..fc506d3bde 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From bb7d42c11b704fc42e24ca950330d709ccba2323 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..81061bbe0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 0925bf03c731e0b36b687d8542a3de48f2fbdd60 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..bb6b594b8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From a349a1b4fef76fb7eafa029cc4668c81056b9a2a Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,7 +17,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 64e913e..42a0958 100644
+index 60cb12b..4046b70 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
 @@ -61,6 +61,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
index 4a9cb37dd8..e75573cc63 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a96bfb68c53a7c9ab1ae279eac7c101f4204fb5c0e4729683b2be64261707446"
+SRC_URI[sha256sum] = "32d825041e5775fc9bf9e8c38e3a5c46c1441eee67f8112572450a9c23c835f0"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..02b9cba6eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From dee043dc221cb336e0b76fbfb0dbf8e0ee9dce3b Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,10 +16,10 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 975fe83..df82840
+index 16bf001..e17a144
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1797,6 +1797,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index bf1e2a89e3..31eabbabbd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 525ac2327b542da339143c2bea95f1aea1b6088a Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..b46be67261 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From e36cee9f357afb004168b4805b2408276def2d3d Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
index 74b6f2308d..f0a3db578a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083a921ef71dd000a"
+SRC_URI[sha256sum] = "eace79d63bd2edeb2048777ea9f432d8b6e7336e656cbc20da450f6235758b31"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
index d77e52d74e..c06d67f0a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f38566fb53ae56b7019a039475311756a28eb978a781154d67813dcb551ff5fe"
+SRC_URI[sha256sum] = "d97700f346fdf9ef5461c035e23ed1ce916ca7a31d6ddad987f774774361db77"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
index e04bfcc81b..94fdff5b05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22fd520d5d1bacb4d"
+SRC_URI[sha256sum] = "743f28b93c941e0af385ab193a2150f9f79bc6269adc639f6475d984794c217c"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
index ac6b52ee46..d8bd047afe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "67e92e9a5b0f2b51eb571cc893b80da2ae2374f19b05d381d1e364393fe12654"
+SRC_URI[sha256sum] = "5ed0938ea0fc1df2709cc939245d93294f09b2d7220e19f7fcdb306ce2b6cee5"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============3723077693802105289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ab2ee19aa5fd5dc668f2b2574a7efa423d6fd4b4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ab2ee19aa5fd5dc668f2b2574a7efa423d6fd4b4"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 460 Local 400 Mirrors 0 Missed 60 Current 1088 (86% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3258 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_recipe_qa)
NOTE: Running task 3515 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_recipe_qa: Started
NOTE: Running task 3738 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_recipe_qa)
NOTE: Running task 3739 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_recipe_qa)
NOTE: Running task 3740 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_recipe_qa)
NOTE: Running task 3741 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_write_config: Started
NOTE: Running task 3981 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_write_config)
NOTE: Running task 3982 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_write_config)
NOTE: Running task 3983 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_write_config)
NOTE: Running task 3984 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4102 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4103 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 4104 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 4105 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_unpack)
NOTE: Running task 4106 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4107 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_fetch)
NOTE: Running task 4108 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_fetch)
NOTE: Running task 4109 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 4110 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_unpack)
NOTE: Running task 4111 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_unpack)
NOTE: Running task 4112 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4113 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_patch)
NOTE: Running task 4114 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4115 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_patch)
NOTE: Running task 4116 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4117 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4118 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_patch)
NOTE: Running task 4119 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4120 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4121 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_populate_lic)
NOTE: Running task 4122 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4123 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4124 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4125 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4126 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4127 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4128 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4129 of 4201 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_populate_lic: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-
 core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47
 .bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_0.26.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/au
 h/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybui
 ld/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'lib
 xv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip
 -native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=opengl,gles2 -Dgl_platform=egl,glx -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/sources/gst-plugins-base-1.28.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/build
| Build type: cross build
| Project name: gst-plugins-base
| Project version: 1.28.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/recipe-sysroot ld.bfd 2.45.1.20251126
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-g++ (GCC) 15.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/recipe-sysroot ld.bfd 2.45.1.20251126
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "emmintrin.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "process.h" : NO
| Has header "smmintrin.h" : YES
| Has header "stdint.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/wait.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Has header "xmmintrin.h" : YES
| Has header "linux/dma-buf.h" : YES
| Has header "linux/udmabuf.h" : YES
| Library m found: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "gmtime_r" with dependency -lm: YES
| Checking for function "localtime_r" with dependency -lm: YES
| Checking for function "lrintf" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "log2" with dependency -lm: YES
| Checking for function "memmem" with dependency -lm: YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Checking for size of "short" : 2
| Checking for size of "void*" : 8
| Compiler for C++ supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=3: YES
| Compiler for C++ supports arguments -Wimplicit-fallthrough=3: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-parameter-type: YES
| Compiler for C++ supports arguments -Wmissing-parameter-type: NO
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C++ supports arguments -Wold-style-definition: NO
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wshift-negative-value: YES
| Compiler for C++ supports arguments -Wshift-negative-value: YES
| Compiler for C supports arguments -Wtype-limits: YES
| Compiler for C++ supports arguments -Wtype-limits: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency valgrind found: NO (tried pkgconfig)
| Run-time dependency libdrm found: YES 2.4.131
| Run-time dependency x11 found: YES 1.8.12
| Run-time dependency gio-2.0 found: YES 2.86.3
| Run-time dependency gio-unix-2.0 found: YES 2.86.3
| Run-time dependency gmodule-no-export-2.0 found: YES 2.86.3
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-plugins-base-1.28.0/meson.build:375:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-plugins-base-1.28.0/meson.build:375:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670, line 190
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4129 tasks of which 4091 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201071438.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201071438.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/log.do_configure.3426670
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.28.0-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-plugins-base-1.28.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.3426670' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/log.do_configure.3426670
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure) failed with exit code '1'

--===============3723077693802105289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-gstreamer1.0-plugins-good-.patch"

RnJvbSA1M2I5MmZiMTljZDIwNTViYjI5ZjA1ODg4ZDA3Nzc2YjI5ZTE3M2QzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNzoxNDo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSxnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kLGdzdHJl
YW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseToKIHVwZ3JhZGUgMS4yNi45IC0+IDEuMjguMCwxLjI2LjkgLT4gMS4yOC4w
LDEuMjYuOSAtPiAxLjI4LjAsMS4yNi45IC0+CiAxLjI4LjAsMS4yNi45IC0+IDEuMjguMAoKLS0t
CiAuLi54LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5w
YXRjaCB8IDIgKy0KIC4uLi8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5
LnBhdGNoICAgICAgICAgIHwgMiArLQogLi4uZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRh
dGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggfCA0ICsrLS0KIC4uLmlucy1iYWRfMS4yNi45LmJi
ID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjAuYmJ9IHwgMiArLQogLi4uRU5HUjAw
MzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggfCA2ICsr
Ky0tLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoICAgICAgfCAyICstCiAuLi4vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWlu
Y2x1ZGVkLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLnMtYmFzZV8xLjI2LjkuYmIgPT4gZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI4LjAuYmJ9IHwgMiArLQogLi4ucy1nb29kXzEuMjYuOS5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguMC5iYn0gfCAyICstCiAuLi5zLXVn
bHlfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4wLmJifSB8IDIg
Ky0KIC4uLi1zZXJ2ZXJfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4
LjAuYmJ9IHwgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI4LjAuYmJ9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlXzEuMjguMC5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiID0+IGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC4wLmJifSAoOTclKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjAuYmJ9ICg5NCUpCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcnRzcC1z
ZXJ2ZXJfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4LjAuYmJ9ICg5
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdz
LXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6
ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAppbmRleCAzMDdkNjY5NjQ1Li5m
YzUwNmQzYmRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2Fy
bmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVu
aW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZDI0YmI5NDllNTQ3YTBhZDY5ZjNmNDdlNGNmMjYyYTc1YmI5ZmU3MyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmI3ZDQyYzExYjcwNGZjNDJlMjRjYTk1MDMzMGQ3
MDljY2JhMjMyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkg
PGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI2IEphbiAyMDE2IDE1OjE2OjAxIC0w
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCBtYXliZS11bmluaXRpYWxpemVkIHdhcm5pbmdzIHdo
ZW4gY29tcGlsaW5nIHdpdGggLU9zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5n
LXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1w
b2xsLmgtZGlyZWN0bHkucGF0Y2gKaW5kZXggN2RhODk5NGUzZC4uODEwNjFiYmUwYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNzI4MjM4MTI5YThhOTFjYWQ4NTcwMjNkMmU3MTMxNTkxMzIxNDA5
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDkyNWJmMDNjNzMxZTBiMzZiNjg3ZDg1
NDJhM2RlNDhmMmZiZGQ2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1j
Q3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgRmViIDIwMTYgMTg6MDU6
NDEgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgaW5jbHVkaW5nIDxzeXMvcG9sbC5oPiBk
aXJlY3RseQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2
LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlz
c2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaAppbmRleCAxZWRjZjA3YzE0
Li5iYjZiNTk0YjhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1v
cGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJl
c29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOGY3YTFjNTU5MWUyNzY4MWYyOTRhZTVlZGYwZjMyNjg5MTk4YWJmZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTM0OWExYjRmZWY3NmZiN2VhZmEwMjljYzQ2
NjhjODEwNTZiOWEyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJleSBaaGl6
aGlraW4gPGFuZHJleS56QGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjcgSmFuIDIwMjAgMTA6MjI6
MzUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gb3BlbmN2OiByZXNvbHZlIG1pc3Npbmcgb3BlbmN2
IGRhdGEgZGlyIGluIHlvY3RvIGJ1aWxkCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6
IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2dzdC1saWJzL2dzdC9vcGVuY3YvbWVz
b24uYnVpbGQgYi9nc3QtbGlicy9nc3Qvb3BlbmN2L21lc29uLmJ1aWxkCi1pbmRleCA2NGU5MTNl
Li40MmEwOTU4IDEwMDY0NAoraW5kZXggNjBjYjEyYi4uNDA0NmI3MCAxMDA2NDQKIC0tLSBhL2dz
dC1saWJzL2dzdC9vcGVuY3YvbWVzb24uYnVpbGQKICsrKyBiL2dzdC1saWJzL2dzdC9vcGVuY3Yv
bWVzb24uYnVpbGQKIEBAIC02MSw2ICs2MSw5IEBAIGdzdG9wZW5jdl9jYXJncyArPSBbJy1ET1BF
TkNWX1BSRUZJWD0iJyArIG9wZW5jdl9wcmVmaXggKyAnIiddCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYu
OS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWRfMS4yOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4y
Ni45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFkXzEuMjguMC5iYgppbmRleCA0YTljYjM3ZGQ4Li5lNzU1NzNjYzYz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkXzEuMjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjguMC5iYgpAQCAtMTAsNyArMTAs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0
LXBsdWdpbnMtYmFkL2dzdC1wbHVnaW5zLWJhZAogICAgICAgICAgICBmaWxlOi8vMDAwMi1hdm9p
ZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1
aWwucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTk2YmZiNjhj
NTNhN2M5YWIxYWUyNzllYWM3YzEwMWY0MjA0ZmI1YzBlNDcyOTY4M2IyYmU2NDI2MTcwNzQ0NiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMmQ4MjUwNDFlNTc3NWZjOWJmOWU4YzM4ZTNhNWM0NmMx
NDQxZWVlNjdmODExMjU3MjQ1MGE5YzIzYzgzNWYwIgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3Qt
cGx1Z2lucy1iYWQtJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdl
dC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1Iw
MDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCmluZGV4
IDcxOWM3M2QzZTMuLjAyYjljYmE2ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1
LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAw
MS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTM3ZjAwNjMxMDNlOThmNTEwOTEzMmVhMzAyYjkxOWI5
MmUyNmEzOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGVlMDQzZGMyMjFjYjMzNmUw
Yjc2ZmJmYjBkYmY4ZTBlZTlkY2UzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IHpo
b3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFdlZCwgMTQgTWF5IDIwMTQgMTA6
MTY6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRU5HUjAwMzEyNTE1OiBnZXQgY2FwcyBmcm9t
IHNyYyBwYWQgd2hlbiBxdWVyeSBjYXBzCkBAIC0xNiwxMCArMTYsMTAgQEAgU2lnbmVkLW9mZi1i
eTogemhvdW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29tPgogZGlmZiAtLWdpdCBhL2dzdC1saWJz
L2dzdC90YWcvZ3N0dGFnZGVtdXguYyBiL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwog
b2xkIG1vZGUgMTAwNjQ0CiBuZXcgbW9kZSAxMDA3NTUKLWluZGV4IDk3NWZlODMuLmRmODI4NDAK
K2luZGV4IDE2YmYwMDEuLmUxN2ExNDQKIC0tLSBhL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVt
dXguYwogKysrIGIvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jCi1AQCAtMTc5Niw2ICsx
Nzk2LDE5IEBAIGdzdF90YWdfZGVtdXhfcGFkX3F1ZXJ5IChHc3RQYWQgKiBwYWQsIEdzdE9iamVj
dCAqIHBhcmVudCwgR3N0UXVlcnkgKiBxdWVyeSkKK0BAIC0xNzk3LDYgKzE3OTcsMTkgQEAgZ3N0
X3RhZ19kZW11eF9wYWRfcXVlcnkgKEdzdFBhZCAqIHBhZCwgR3N0T2JqZWN0ICogcGFyZW50LCBH
c3RRdWVyeSAqIHF1ZXJ5KQogICAgICAgIH0KICAgICAgICBicmVhazsKICAgICAgfQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRj
aAppbmRleCBiZjFlMmE4OWUzLi4zMWVhYmJhYmJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBh
cnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNz
YXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjg5MmYwYmU4YWU4OGFjYzY0ODJmNGI5YTlhNGRiNWYwM2I3YWRmOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTI1YWMyMzI3YjU0MmRhMzM5MTQzYzJiZWE5NWYxYWVh
MWI2MDg4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdrZSBXYW5nIDxtaW5n
a2Uud2FuZ0BmcmVlc2NhbGUuY29tPgogRGF0ZTogVGh1LCAxOSBNYXIgMjAxNSAxNDoxNzoxMCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4dCBsaW5lcyBw
YXJzaW5nLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlz
LWluY2x1ZGVkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWlu
Y2x1ZGVkLnBhdGNoCmluZGV4IDFhOTg4Yjk5ZGUuLmI0NmJlNjcyNjEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
LzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDZmMDZmNGIyZjEzZjAyODI1MDE4OTIyNWE0NmEzOWY0MDI0Mjg5MzAg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUzNmNlZTlmMzU3YWZiMDA0MTY4YjQ4MDVi
MjQwODI3NmRlZjJkM2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJsb3MgUmFm
YWVsIEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkgMjAxOSAx
NDowMToxMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB2aXYtZmI6IE1ha2Ugc3VyZSBjb25maWcu
aCBpcyBpbmNsdWRlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yOC4wLmJiCmluZGV4IDc0YjZmMjMwOGQuLmYwYTNkYjU3OGEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEu
MjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZV8xLjI4LjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhc2UvZ3N0
LXBsdWdpbnMtYmEKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25m
aWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNzYXBhcnNl
LWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxMWRiNGVjOWFlNWJlMjE5NGZmOGNjZjJiNWZlY2RjMDY5MjUy
ZmU0NDE2OTIxYjA4M2E5MjFlZjcxZGQwMDBhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVhY2U3
OWQ2M2JkMmVkZWIyMDQ4Nzc3ZWE5ZjQzMmQ4YjZlNzMzNmU2NTZjYmMyMGRhNDUwZjYyMzU3NThi
MzEiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1wbHVnaW5zLWJhc2UtJHtQVn0iCiAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1nb29kXzEuMjYuOS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguMC5iYgppbmRleCBkNzdl
NTJkNzRlLi5jMDZkNjdmMGE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4y
OC4wLmJiCkBAIC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29vZC8tL2lzc3VlcwogCiBTUkNfVVJJ
ID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtZ29v
ZC9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImYzODU2NmZiNTNhZTU2YjcwMTlhMDM5NDc1MzExNzU2YTI4ZWI5NzhhNzgxMTU0ZDY3ODEzZGNi
NTUxZmY1ZmUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDk3NzAwZjM0NmZkZjllZjU0NjFjMDM1
ZTIzZWQxY2U5MTZjYTdhMzFkNmRkYWQ5ODdmNzc0Nzc0MzYxZGI3NyIKIAogUyA9ICIke1VOUEFD
S0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi45LmJi
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LXVnbHlfMS4yOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYu
OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4wLmJiCmluZGV4IGUwNGJmY2M4MWIuLjk0ZmRmZjViMDUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjAuYmIKQEAgLTE1LDcgKzE1
LDcgQEAgU1JDX1VSSSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0udGFy
Lnh6IFwKICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4NGU0YzZlNzY1
YmM0NjNlZDgwNmIyMjYzY2I5YjJhYWEzYTY1NDE1ZGYwYTNjMjJmZDUyMGQ1ZDFiYWNiNGQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzQzZjI4YjkzYzk0MWUwYWYzODVhYjE5M2EyMTUwZjlmNzli
YzYyNjlhZGM2MzlmNjQ3NWQ5ODQ3OTRjMjE3YyIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBs
dWdpbnMtdWdseS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjkuYmIgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuOS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZl
cl8xLjI4LjAuYmIKaW5kZXggYWM2YjUyZWU0Ni4uZDhiZDA0N2FmZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1ydHNwLXNlcnZlcl8xLjI4LjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUE5SRUFMID0gImdz
dC1ydHNwLXNlcnZlciIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3Rv
cC5vcmcvc3JjLyR7UE5SRUFMfS8ke1BOUkVBTH0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjdlOTJlOWE1YjBmMmI1MWViNTcxY2M4OTNiODBkYTJhZTIzNzRmMTliMDVk
MzgxZDFlMzY0MzkzZmUxMjY1NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZWQwOTM4ZWEwZmMx
ZGYyNzA5Y2M5MzkyNDVkOTMyOTRmMDliMmQ3MjIwZTE5ZjdmY2RiMzA2Y2UyYjZjZWU1IgogCiBT
ID0gIiR7VU5QQUNLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============3723077693802105289==--

