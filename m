Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169E6C531D0
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1417.1771440097788459620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0ggDUMvF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BlICPf4c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ec732-0174dc0d-aca1-49cc-9d1e-a3cdd2b19ad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/uh3QuCdaa8kFOUDi10VfeQd/yzHPVS2rTp4Bh//Gvk=;
	b=0ggDUMvFouxJVRV9HNjSmN5jExHqEXr5C++sHPnBpJXhB1uDpH7ntaI80Y8I4zlI
	4szorIBOeqW9J2W51SbzKwb4EvsH17c4mVeyopUC6n5cgAqdX4ZSxVV5rmotM/Y8yhK
	nKYurM8tD7NX1Ki/vhrYu2KxOPYndjw78htcFCDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/uh3QuCdaa8kFOUDi10VfeQd/yzHPVS2rTp4Bh//Gvk=;
	b=BlICPf4cURALvYxg/KXwLnBmo3UJ+LD15xyMmK6CLRZgyEk1jf0VNiVxBFxeCR8E
	MGUqbHt2nfWGJi510HD3muxOZ0S/YSUWgXwjenJkSdRqRswnh2IZIRMxJZ60qRZ4BKS
	3LNBsai8pjhJpBdC9M1FCDHvrnO1qAETbNOuXSIU=
Content-Type: multipart/mixed; boundary="===============1253358578854940866=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrading to 1.28.0,1.28.0,1.28.0,1.28.0,1.28.0 FAILED
Message-ID: <0101019c720ec732-0174dc0d-aca1-49cc-9d1e-a3cdd2b19ad1-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231334

--===============1253358578854940866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly* to *1.28.0,1.28.0,1.28.0,1.28.0,1.28.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-base-g.patch
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
From 2e50224d7b8f816143374a6c7b91e2a7ee8f02de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 11:06:24 +0000
Subject: [PATCH] 
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
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
index 307d669645..9643144064 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From 6cfa3db329843c7433626a840901cd9f283d3609 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..0bb84a1051 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 170fac0b7b473bbce24158f707bfb0a12d6778e3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..24d8900908 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From cc603254ecdbbbb33c5b11e0c7c4f7f39fc822ec Mon Sep 17 00:00:00 2001
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
index 719c73d3e3..3f9b1b9c5b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From ea7e5806dc295e93a87bdada55ab706edc5a1e60 Mon Sep 17 00:00:00 2001
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
index bf1e2a89e3..ac3b2d4766 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 8af2a716134cfa1f9df9d121782744b34aa9b330 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..f8874d8212 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 615f2a69d9a6de16a8b0fee930e6b3203e6e6cb9 Mon Sep 17 00:00:00 2001
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


--===============1253358578854940866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-510d5b711998704fe39f73e5d81a91a6a129a971"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:510d5b711998704fe39f73e5d81a91a6a129a971"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 596 Local 540 Mirrors 0 Missed 56 Current 935 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1440 of 1531 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1456 of 1531 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1472 of 1531 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1476 of 1531 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1515 of 1531 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3227 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_fetch)
NOTE: Running task 3484 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 3667 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_unpack)
NOTE: Running task 3668 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3712 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_fetch)
NOTE: Running task 3713 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_fetch)
NOTE: Running task 3714 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_fetch)
NOTE: Running task 3715 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_unpack: Started
NOTE: Running task 3950 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_write_config)
NOTE: Running task 3951 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_write_config)
NOTE: Running task 3952 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_write_config)
NOTE: Running task 3953 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 4069 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 4072 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_unpack)
NOTE: Running task 4073 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_unpack)
NOTE: Running task 4074 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4075 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_patch)
NOTE: Running task 4076 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4077 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_patch)
NOTE: Running task 4078 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_patch: Started
NOTE: Running task 4079 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4080 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4081 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4082 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_populate_lic)
NOTE: Running task 4083 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 4084 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_populate_lic: Started
NOTE: Running task 4085 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4086 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_populate_lic unihash changed to b41be0d89fa0d011f608b03b10c8dd7d9878b966cd4dbaf592bc29c728f4ccda
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_deploy_source_date_epoch unihash changed to 950ace7095ca6b4c8a3e2cdee89b311fcf88373286d0c86913e0e217b209d505
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb:do_populate_lic unihash changed to 604ed5c0f77bbce8d42224d6fc8fefabc6056fb9f0a1129cfca62a8b78efcef6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb:do_deploy_source_date_epoch unihash changed to c371e22e30f515c65c1e0fd1f96f01bf8c4e46e953e2f853ce5aa608596ba429
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_deploy_source_date_epoch unihash changed to aac286f246c2cedc39381b64d033c9f3520a9d5ec8e8e2738c1de6d656793310
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4087 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4088 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb:do_populate_lic unihash changed to f1486b0f0b2c289f8fbe206e0b5bd0ed5d81f85779d1275f3547ff097690fe49
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_populate_lic unihash changed to eca8af2ea5031cb51cea91588910ea42a9bd9483642504f908991988bb93d463
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4089 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4090 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb:do_deploy_source_date_epoch unihash changed to 5ecd65455553f6dfc2c3f3c88f3511a7d7a0a8a7e688d8851b6105af951f643a
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_populate_lic: Started
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_deploy_source_date_epoch unihash changed to 1504b4af264fec92c7a143c38016597ac7a7a9c477ac59db76c4a96b8a09c542
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_populate_lic unihash changed to 50f8bb78cece7b9d083dfd906bb63be61fe2ea989c163f5feba060cec480d406
NOTE: Setscene tasks completed
NOTE: Running task 4091 of 4163 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-
 core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47
 .bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_0.26.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/au
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330, line 190
NOTE: recipe gstreamer1.0-plugins-base-1.28.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4091 tasks of which 4058 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218110606.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218110606.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/log.do_configure.1061330
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.28.0-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-plugins-base-1.28.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/run.do_configure.1061330' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.0/temp/log.do_configure.1061330
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb:do_configure) failed with exit code '1'

--===============1253358578854940866==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-base-g.patch"

RnJvbSAyZTUwMjI0ZDdiOGY4MTYxNDMzNzRhNmM3YjkxZTJhN2VlOGYwMmRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTE6MDY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWdvb2QsZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLGdzdHJlYW1lcjEu
MC1wbHVnaW5zLXVnbHk6CiB1cGdyYWRlIDEuMjYuOSAtPiAxLjI4LjAsMS4yNi45IC0+IDEuMjgu
MCwxLjI2LjkgLT4gMS4yOC4wLDEuMjYuOSAtPgogMS4yOC4wLDEuMjYuOSAtPiAxLjI4LjAKCi0t
LQogLi4ueC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgu
cGF0Y2ggfCAyICstCiAuLi4vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3Rs
eS5wYXRjaCAgICAgICAgICB8IDIgKy0KIC4uLmVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1k
YXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIHwgNCArKy0tCiAuLi5pbnMtYmFkXzEuMjYuOS5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC4wLmJifSB8IDIgKy0KIC4uLkVOR1Iw
MDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIHwgNiAr
KystLS0KIC4uLi8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5w
YXRjaCAgICAgIHwgMiArLQogLi4uLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1p
bmNsdWRlZC5wYXRjaCAgICAgICAgfCAyICstCiAuLi5zLWJhc2VfMS4yNi45LmJiID0+IGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC4wLmJifSB8IDIgKy0KIC4uLnMtZ29vZF8xLjI2Ljku
YmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjAuYmJ9IHwgMiArLQogLi4ucy11
Z2x5XzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguMC5iYn0gfCAy
ICstCiAuLi4tc2VydmVyXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4y
OC4wLmJifSB8IDIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yOC4wLmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZV8xLjI4LjAuYmJ9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuOS5iYiA9PiBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguMC5iYn0gKDk3JSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
Ni45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4wLmJifSAoOTQlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXJ0c3At
c2VydmVyXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yOC4wLmJifSAo
OTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5n
cy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxp
emVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKaW5kZXggMzA3ZDY2OTY0NS4u
OTY0MzE0NDA2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdh
cm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11
bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGQyNGJiOTQ5ZTU0N2EwYWQ2OWYzZjQ3ZTRjZjI2MmE3NWJiOWZlNzMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZjZmEzZGIzMjk4NDNjNzQzMzYyNmE4NDA5MDFj
ZDlmMjgzZDM2MDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5
IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNiBKYW4gMjAxNiAxNToxNjowMSAt
MDgwMAogU3ViamVjdDogW1BBVENIXSBmaXggbWF5YmUtdW5pbml0aWFsaXplZCB3YXJuaW5ncyB3
aGVuIGNvbXBpbGluZyB3aXRoIC1PcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGlu
Zy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMt
cG9sbC5oLWRpcmVjdGx5LnBhdGNoCmluZGV4IDdkYTg5OTRlM2QuLjBiYjg0YTEwNTEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDcyODIzODEyOWE4YTkxY2FkODU3MDIzZDJlNzEzMTU5MTMyMTQw
OWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE3MGZhYzBiN2I0NzNiYmNlMjQxNThm
NzA3YmZiMGExMmQ2Nzc4ZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBN
Y0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIEZlYiAyMDE2IDE4OjA1
OjQxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIGluY2x1ZGluZyA8c3lzL3BvbGwuaD4g
ZGlyZWN0bHkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5j
di1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1p
c3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKaW5kZXggMWVkY2YwN2Mx
NC4uMjRkODkwMDkwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1y
ZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDhmN2ExYzU1OTFlMjc2ODFmMjk0YWU1ZWRmMGYzMjY4OTE5OGFiZmYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNjNjAzMjU0ZWNkYmJiYjMzYzViMTFlMGM3
YzRmN2YzOWZjODIyZWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZXkgWmhp
emhpa2luIDxhbmRyZXkuekBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI3IEphbiAyMDIwIDEwOjIy
OjM1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG9wZW5jdjogcmVzb2x2ZSBtaXNzaW5nIG9wZW5j
diBkYXRhIGRpciBpbiB5b2N0byBidWlsZApAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9nc3QtbGlicy9nc3Qvb3BlbmN2L21l
c29uLmJ1aWxkIGIvZ3N0LWxpYnMvZ3N0L29wZW5jdi9tZXNvbi5idWlsZAotaW5kZXggNjRlOTEz
ZS4uNDJhMDk1OCAxMDA2NDQKK2luZGV4IDYwY2IxMmIuLjQwNDZiNzAgMTAwNjQ0CiAtLS0gYS9n
c3QtbGlicy9nc3Qvb3BlbmN2L21lc29uLmJ1aWxkCiArKysgYi9nc3QtbGlicy9nc3Qvb3BlbmN2
L21lc29uLmJ1aWxkCiBAQCAtNjEsNiArNjEsOSBAQCBnc3RvcGVuY3ZfY2FyZ3MgKz0gWyctRE9Q
RU5DVl9QUkVGSVg9IicgKyBvcGVuY3ZfcHJlZml4ICsgJyInXQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2
LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFkXzEuMjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEu
MjYuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjAuYmIKaW5kZXggNGE5Y2IzN2RkOC4uZTc1NTczY2M2
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhZF8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjAuYmIKQEAgLTEwLDcgKzEw
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dz
dC1wbHVnaW5zLWJhZC9nc3QtcGx1Z2lucy1iYWQKICAgICAgICAgICAgZmlsZTovLzAwMDItYXZv
aWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1i
dWlsLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE5NmJmYjY4
YzUzYTdjOWFiMWFlMjc5ZWFjN2MxMDFmNDIwNGZiNWMwZTQ3Mjk2ODNiMmJlNjQyNjE3MDc0NDYi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJkODI1MDQxZTU3NzVmYzliZjllOGMzOGUzYTVjNDZj
MTQ0MWVlZTY3ZjgxMTI1NzI0NTBhOWMyM2M4MzVmMCIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0
LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1n
ZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdS
MDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaAppbmRl
eCA3MTljNzNkM2UzLi4zZjliMWI5YzViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUx
NS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAw
MDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGEzN2YwMDYzMTAzZTk4ZjUxMDkxMzJlYTMwMmI5MTli
OTJlMjZhMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVhN2U1ODA2ZGMyOTVlOTNh
ODdiZGFkYTU1YWI3MDZlZGM1YTFlNjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiB6
aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBEYXRlOiBXZWQsIDE0IE1heSAyMDE0IDEw
OjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEVOR1IwMDMxMjUxNTogZ2V0IGNhcHMgZnJv
bSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcwpAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIGRpZmYgLS1naXQgYS9nc3QtbGli
cy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMgYi9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMK
IG9sZCBtb2RlIDEwMDY0NAogbmV3IG1vZGUgMTAwNzU1Ci1pbmRleCA5NzVmZTgzLi5kZjgyODQw
CitpbmRleCAxNmJmMDAxLi5lMTdhMTQ0CiAtLS0gYS9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2Rl
bXV4LmMKICsrKyBiL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwotQEAgLTE3OTYsNiAr
MTc5NiwxOSBAQCBnc3RfdGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFkICogcGFkLCBHc3RPYmpl
Y3QgKiBwYXJlbnQsIEdzdFF1ZXJ5ICogcXVlcnkpCitAQCAtMTc5Nyw2ICsxNzk3LDE5IEBAIGdz
dF90YWdfZGVtdXhfcGFkX3F1ZXJ5IChHc3RQYWQgKiBwYWQsIEdzdE9iamVjdCAqIHBhcmVudCwg
R3N0UXVlcnkgKiBxdWVyeSkKICAgICAgICB9CiAgICAgICAgYnJlYWs7CiAgICAgIH0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0
Y2gKaW5kZXggYmYxZTJhODllMy4uYWMzYjJkNDc2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2Fw
YXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1z
c2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGY4OTJmMGJlOGFlODhhY2M2NDgyZjRiOWE5YTRkYjVmMDNiN2FkZjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhhZjJhNzE2MTM0Y2ZhMWY5ZGY5ZDEyMTc4Mjc0NGIz
NGFhOWIzMzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5na2UgV2FuZyA8bWlu
Z2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFRodSwgMTkgTWFyIDIwMTUgMTQ6MTc6MTAg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFyc2U6IGVuaGFuY2UgU1NBIHRleHQgbGluZXMg
cGFyc2luZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1p
cy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1p
bmNsdWRlZC5wYXRjaAppbmRleCAxYTk4OGI5OWRlLi5mODg3NGQ4MjEyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA2ZjA2ZjRiMmYxM2YwMjgyNTAxODkyMjVhNDZhMzlmNDAyNDI4OTMw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MTVmMmE2OWQ5YTZkZTE2YThiMGZlZTkz
MGU2YjMyMDNlNmU2Y2I5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2FybG9zIFJh
ZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KIERhdGU6IFR1ZSwgMjEgTWF5IDIwMTkg
MTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmln
LmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjguMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
XzEuMjguMC5iYgppbmRleCA3NGI2ZjIzMDhkLi5mMGEzZGI1NzhhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2VfMS4yOC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dz
dC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJz
ZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFkYjRlYzlhZTViZTIxOTRmZjhjY2YyYjVmZWNkYzA2OTI1
MmZlNDQxNjkyMWIwODNhOTIxZWY3MWRkMDAwYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYWNl
NzlkNjNiZDJlZGViMjA0ODc3N2VhOWY0MzJkOGI2ZTczMzZlNjU2Y2JjMjBkYTQ1MGY2MjM1NzU4
YjMxIgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1iYXNlLSR7UFZ9IgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtZ29vZF8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjAuYmIKaW5kZXggZDc3
ZTUyZDc0ZS4uYzA2ZDY3ZjBhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MjguMC5iYgpAQCAtNiw3ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9pc3N1ZXMKIAogU1JDX1VS
SSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdv
b2QvZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmMzg1NjZmYjUzYWU1NmI3MDE5YTAzOTQ3NTMxMTc1NmEyOGViOTc4YTc4MTE1NGQ2NzgxM2Rj
YjU1MWZmNWZlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ5NzcwMGYzNDZmZGY5ZWY1NDYxYzAz
NWUyM2VkMWNlOTE2Y2E3YTMxZDZkZGFkOTg3Zjc3NDc3NDM2MWRiNzciCiAKIFMgPSAiJHtVTlBB
Q0tESVJ9L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuOS5i
YiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy11Z2x5XzEuMjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguMC5iYgppbmRleCBlMDRiZmNjODFiLi45NGZkZmY1YjA1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4wLmJiCkBAIC0xNSw3ICsx
NSw3IEBAIFNSQ19VUkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVk
ZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRh
ci54eiBcCiAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxODRlNGM2ZTc2
NWJjNDYzZWQ4MDZiMjI2M2NiOWIyYWFhM2E2NTQxNWRmMGEzYzIyZmQ1MjBkNWQxYmFjYjRkIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0M2YyOGI5M2M5NDFlMGFmMzg1YWIxOTNhMjE1MGY5Zjc5
YmM2MjY5YWRjNjM5ZjY0NzVkOTg0Nzk0YzIxN2MiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1w
bHVnaW5zLXVnbHktJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi45LmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4LjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjkuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2
ZXJfMS4yOC4wLmJiCmluZGV4IGFjNmI1MmVlNDYuLmQ4YmQwNDdhZmUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yOC4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJn
c3QtcnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0
b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjY3ZTkyZTlhNWIwZjJiNTFlYjU3MWNjODkzYjgwZGEyYWUyMzc0ZjE5YjA1
ZDM4MWQxZTM2NDM5M2ZlMTI2NTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWVkMDkzOGVhMGZj
MWRmMjcwOWNjOTM5MjQ1ZDkzMjk0ZjA5YjJkNzIyMGUxOWY3ZmNkYjMwNmNlMmI2Y2VlNSIKIAog
UyA9ICIke1VOUEFDS0RJUn0vJHtQTlJFQUx9LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============1253358578854940866==--

