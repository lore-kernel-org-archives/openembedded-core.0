Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C95BC83F1C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1427.1751386807842766615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XuZAp5CG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fiV8IeZ6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6c9dd95-33771ec7-6a5a-475a-9b2a-ae4797f2270a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ohKMnJvhgcTKjjLJZaCpGFBmEb1Z368eeLoVmXs8Q68=;
	b=XuZAp5CGMv8KrIKBtNiX7LJREPpeRHCGcaAn7L0KN+n3Z8BJ83Tjx+SwDDer5uXv
	WAyorKfvarXNcE3lHSVjwvR1U6vOJ6lgRTXv8Ny3ItYf4Uwh+6HVf7hUOUda4BMHHep
	qXbSEyhmpFQGsxWI8LiybhiYuPTXJkjDn4MQgTU0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ohKMnJvhgcTKjjLJZaCpGFBmEb1Z368eeLoVmXs8Q68=;
	b=fiV8IeZ6Q3pwWD55SUW//gm4l8B5uStC1oP6GitC37a1vE/HMiIqpY4addpi4fUp
	WwvyiCJj8poE+7lJgyKmpjh8qbtAofwgWBgj2tDbl3ZZ8SADrM2ovnUQEASJ8fd232e
	ErREvUCZyrHy+JUpYBZBtIBy5pZbPb+oTRkv0bn0=
Content-Type: multipart/mixed; boundary="===============4588185190310475008=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrading to 1.26.3,1.26.3,1.26.3,1.26.3,1.26.3 SUCCEEDED
Message-ID: <01010197c6c9dd95-33771ec7-6a5a-475a-9b2a-ae4797f2270a-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219617

--===============4588185190310475008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base* to *1.26.3,1.26.3,1.26.3,1.26.3,1.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-gstreamer1.0-plugins-bad-g.patch
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
From cb7cadf0a26c459c15bcf071d6438d820c274c55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:13:22 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrade 1.26.2 -> 1.26.3,1.26.2 -> 1.26.3,1.26.2 -> 1.26.3,1.26.2 ->
 1.26.3,1.26.2 -> 1.26.3

---
 ...fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch            | 4 ++--
 ...opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...ugins-bad_1.26.2.bb => gstreamer1.0-plugins-bad_1.26.3.bb} | 2 +-
 ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
 ...ins-base_1.26.2.bb => gstreamer1.0-plugins-base_1.26.3.bb} | 2 +-
 ...ins-good_1.26.2.bb => gstreamer1.0-plugins-good_1.26.3.bb} | 2 +-
 ...ins-ugly_1.26.2.bb => gstreamer1.0-plugins-ugly_1.26.3.bb} | 2 +-
 ...sp-server_1.26.2.bb => gstreamer1.0-rtsp-server_1.26.3.bb} | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.2.bb => gstreamer1.0-plugins-bad_1.26.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.2.bb => gstreamer1.0-plugins-base_1.26.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.2.bb => gstreamer1.0-plugins-good_1.26.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.2.bb => gstreamer1.0-plugins-ugly_1.26.3.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.2.bb => gstreamer1.0-rtsp-server_1.26.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 4dd9febbf6..a331e10355 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 9456674cea4a933d5fbc24230d307fe0f52588f3 Mon Sep 17 00:00:00 2001
+From 9c11973d106036a797d1eb09344a7a148b35c3e9 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index e6ae7f4bfe..7c35238ffb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From dd2b92fb70fed2799809c423fea79221a3e17108 Mon Sep 17 00:00:00 2001
+From bb93d1977884f3fb62d5eaeaed179250a45c9c6a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -13,7 +13,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index 33ee3ff..b8ddea9 100644
+index ef565f7..6254420 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index d49cf5bd89..0e47ce7625 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
+From 136e0facee486f7028a8b7c5456bccc6b44f3ae0 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
index b311286cc2..12992057e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "cb116bfc3722c2de53838899006cafdb3c7c0bc69cd769b33c992a8421a9d844"
+SRC_URI[sha256sum] = "95c48dacaf14276f4e595f4cbca94b3cfebfc22285e765e2aa56d0a7275d7561"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 7373bd3e26..6fd14da5ed 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
+From 054b55ab4f72c51b08442dbde4c02130eae8dfb2 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index fc9ad474d9..2a0c5202f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
+From d6fe621f33459dc054438012cea89d0269a9884e Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 06b5bc41ed..8f92569a77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
+From 589e565b274baae1087db25f9fce0017bc21f2e1 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
index c264a14ee6..74eb1360f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f4b9fc0be852fe5f65401d18ae6218e4aea3ff7a3c9f8d265939b9c4704915f7"
+SRC_URI[sha256sum] = "4ef9f9ef09025308ce220e2dd22a89e4c992d8ca71b968e3c70af0634ec27933"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
index 7a81a29d95..601a7961c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d864b9aec28c3a80895468c909dd303e5f22f92d6e2b1137f80e2a1454584339"
+SRC_URI[sha256sum] = "fe4ec9670edfe6bb1e5f27169ae145b5ac2dd218ac98bd8251c8fba41ad33c53"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
index fcd97e4245..cc3da89556 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "ec2d7556c6b8c2694f9b918ab9c4c6c998fb908c6b6a6ad57441702dad14ce73"
+SRC_URI[sha256sum] = "417f5ee895f734ac0341b3719c175fff16b4c8eae8806e29e170b3bcb3d9dba5"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
index 51085bb3fa..7ee7a1f07f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f942b2a499ed6d161222868db0e80de45297b4777ff189c6fb890bde698c2dc3"
+SRC_URI[sha256sum] = "415e8a53a9844789770dd4f116ac2e3a4a33de42673c57acc25c5ba0f4406fc5"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============4588185190310475008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2602.0", added "/usr/lib/libgstanalytics-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2602.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2602.0", added "/usr/lib/libgstcodecs-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2602.0", added "/usr/lib/libgstcuda-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2602.0", added "/usr/lib/libgstdxva-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2602.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2602.0", added "/usr/lib/libgstisoff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2602.0", added "/usr/lib/libgstmpegts-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2602.0", added "/usr/lib/libgstmse-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2602.0", added "/usr/lib/libgstphotography-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2602.0", added "/usr/lib/libgstplay-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2602.0", added "/usr/lib/libgstplayer-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2602.0", added "/usr/lib/libgstsctp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2602.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2602.0", added "/usr/lib/libgstvulkan-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2602.0", added "/usr/lib/libgstwayland-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2602.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2603.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2602.0 to libgstadaptivedemux-1.0.so.0.2603.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2602.0 to libgstanalytics-1.0.so.0.2603.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2602.0 to libgstbadaudio-1.0.so.0.2603.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2602.0 to libgstbasecamerabinsrc-1.0.so.0.2603.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2602.0 to libgstcodecparsers-1.0.so.0.2603.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2602.0 to libgstcodecs-1.0.so.0.2603.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2602.0 to libgstcuda-1.0.so.0.2603.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2602.0 to libgstdxva-1.0.so.0.2603.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2602.0 to libgstinsertbin-1.0.so.0.2603.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2602.0 to libgstisoff-1.0.so.0.2603.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2602.0 to libgstmpegts-1.0.so.0.2603.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2602.0 to libgstmse-1.0.so.0.2603.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2602.0 to libgstphotography-1.0.so.0.2603.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2602.0 to libgstplay-1.0.so.0.2603.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2602.0 to libgstplayer-1.0.so.0.2603.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2602.0 to libgstsctp-1.0.so.0.2603.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2602.0 to libgsturidownloader-1.0.so.0.2603.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2602.0 to libgstvulkan-1.0.so.0.2603.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2602.0 to libgstwayland-1.0.so.0.2603.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2602.0 to libgstwebrtc-1.0.so.0.2603.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2602.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2603.0
  /usr/lib/libgstanalytics-1.0.so.0.2602.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2603.0
  /usr/lib/libgstbadaudio-1.0.so.0.2602.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2603.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2603.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2602.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2603.0
  /usr/lib/libgstcodecs-1.0.so.0.2602.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2603.0
  /usr/lib/libgstcuda-1.0.so.0.2602.0 moved to /usr/lib/libgstcuda-1.0.so.0.2603.0
  /usr/lib/libgstdxva-1.0.so.0.2602.0 moved to /usr/lib/libgstdxva-1.0.so.0.2603.0
  /usr/lib/libgstinsertbin-1.0.so.0.2602.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2603.0
  /usr/lib/libgstisoff-1.0.so.0.2602.0 moved to /usr/lib/libgstisoff-1.0.so.0.2603.0
  /usr/lib/libgstmpegts-1.0.so.0.2602.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2603.0
  /usr/lib/libgstmse-1.0.so.0.2602.0 moved to /usr/lib/libgstmse-1.0.so.0.2603.0
  /usr/lib/libgstphotography-1.0.so.0.2602.0 moved to /usr/lib/libgstphotography-1.0.so.0.2603.0
  /usr/lib/libgstplay-1.0.so.0.2602.0 moved to /usr/lib/libgstplay-1.0.so.0.2603.0
  /usr/lib/libgstplayer-1.0.so.0.2602.0 moved to /usr/lib/libgstplayer-1.0.so.0.2603.0
  /usr/lib/libgstsctp-1.0.so.0.2602.0 moved to /usr/lib/libgstsctp-1.0.so.0.2603.0
  /usr/lib/libgsturidownloader-1.0.so.0.2602.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2603.0
  /usr/lib/libgstvulkan-1.0.so.0.2602.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2603.0
  /usr/lib/libgstwayland-1.0.so.0.2602.0 moved to /usr/lib/libgstwayland-1.0.so.0.2603.0
  /usr/lib/libgstwebrtc-1.0.so.0.2602.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2603.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2602.0", added "/usr/lib/libgstallocators-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2602.0", added "/usr/lib/libgstapp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2602.0", added "/usr/lib/libgstaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2602.0", added "/usr/lib/libgstfft-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2602.0", added "/usr/lib/libgstgl-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2602.0", added "/usr/lib/libgstpbutils-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2602.0", added "/usr/lib/libgstriff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2602.0", added "/usr/lib/libgstrtp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2602.0", added "/usr/lib/libgstrtsp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2602.0", added "/usr/lib/libgstsdp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2602.0", added "/usr/lib/libgsttag-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2602.0", added "/usr/lib/libgstvideo-1.0.so.0.2603.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2602.0 to libgstallocators-1.0.so.0.2603.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2602.0 to libgstapp-1.0.so.0.2603.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2602.0 to libgstaudio-1.0.so.0.2603.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2602.0 to libgstfft-1.0.so.0.2603.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2602.0 to libgstgl-1.0.so.0.2603.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2602.0 to libgstpbutils-1.0.so.0.2603.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2602.0 to libgstriff-1.0.so.0.2603.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2602.0 to libgstrtp-1.0.so.0.2603.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2602.0 to libgstrtsp-1.0.so.0.2603.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2602.0 to libgstsdp-1.0.so.0.2603.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2602.0 to libgsttag-1.0.so.0.2603.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2602.0 to libgstvideo-1.0.so.0.2603.0
  /usr/lib/libgstallocators-1.0.so.0.2602.0 moved to /usr/lib/libgstallocators-1.0.so.0.2603.0
  /usr/lib/libgstapp-1.0.so.0.2602.0 moved to /usr/lib/libgstapp-1.0.so.0.2603.0
  /usr/lib/libgstaudio-1.0.so.0.2602.0 moved to /usr/lib/libgstaudio-1.0.so.0.2603.0
  /usr/lib/libgstfft-1.0.so.0.2602.0 moved to /usr/lib/libgstfft-1.0.so.0.2603.0
  /usr/lib/libgstgl-1.0.so.0.2602.0 moved to /usr/lib/libgstgl-1.0.so.0.2603.0
  /usr/lib/libgstpbutils-1.0.so.0.2602.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2603.0
  /usr/lib/libgstriff-1.0.so.0.2602.0 moved to /usr/lib/libgstriff-1.0.so.0.2603.0
  /usr/lib/libgstrtp-1.0.so.0.2602.0 moved to /usr/lib/libgstrtp-1.0.so.0.2603.0
  /usr/lib/libgstrtsp-1.0.so.0.2602.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2603.0
  /usr/lib/libgstsdp-1.0.so.0.2602.0 moved to /usr/lib/libgstsdp-1.0.so.0.2603.0
  /usr/lib/libgsttag-1.0.so.0.2602.0 moved to /usr/lib/libgsttag-1.0.so.0.2603.0
  /usr/lib/libgstvideo-1.0.so.0.2602.0 moved to /usr/lib/libgstvideo-1.0.so.0.2603.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGSIZE changed from 39040 to 43136 (+10%)
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2602.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2603.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2602.0 to libgstrtspserver-1.0.so.0.2603.0
  /usr/lib/libgstrtspserver-1.0.so.0.2602.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2603.0

--===============4588185190310475008==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-gstreamer1.0-plugins-bad-g.patch"

RnJvbSBjYjdjYWRmMGEyNmM0NTljMTViY2YwNzFkNjQzOGQ4MjBjMjc0YzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzoxMzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseSxnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQsZ3N0cmVh
bWVyMS4wLXJ0c3Atc2VydmVyLGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2QsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZToKIHVwZ3JhZGUgMS4yNi4yIC0+IDEuMjYuMywxLjI2LjIgLT4gMS4yNi4z
LDEuMjYuMiAtPiAxLjI2LjMsMS4yNi4yIC0+CiAxLjI2LjMsMS4yNi4yIC0+IDEuMjYuMwoKLS0t
CiAuLi5maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRo
LnBhdGNoIHwgMiArLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0
bHkucGF0Y2ggICAgICAgICAgICB8IDQgKystLQogLi4ub3BlbmN2LXJlc29sdmUtbWlzc2luZy1v
cGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCB8IDIgKy0KIC4uLnVnaW5zLWJhZF8x
LjI2LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMy5iYn0gfCAyICstCiAu
Li4xLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBh
dGNoIHwgMiArLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJz
aW5nLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmln
LmgtaXMtaW5jbHVkZWQucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi5pbnMtYmFzZV8xLjI2LjIu
YmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjMuYmJ9IHwgMiArLQogLi4uaW5z
LWdvb2RfMS4yNi4yLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4zLmJifSB8
IDIgKy0KIC4uLmlucy11Z2x5XzEuMjYuMi5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjYuMy5iYn0gfCAyICstCiAuLi5zcC1zZXJ2ZXJfMS4yNi4yLmJiID0+IGdzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjI2LjMuYmJ9IHwgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi4yLmJiID0+IGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjMuYmJ9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMi5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMy5iYn0gKDk4JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdv
b2RfMS4yNi4yLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4zLmJifSAoOTcl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseV8xLjI2LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjMuYmJ9ICg5NCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4yLmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNl
cnZlcl8xLjI2LjMuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmlu
aXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4
LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApp
bmRleCA0ZGQ5ZmViYmY2Li5hMzMxZTEwMzU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJl
LXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
LzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0
aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQ1NjY3NGNlYTRhOTMzZDVmYmMyNDIzMGQz
MDdmZTBmNTI1ODhmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWMxMTk3M2QxMDYw
MzZhNzk3ZDFlYjA5MzQ0YTdhMTQ4YjM1YzNlOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI2IEph
biAyMDE2IDE1OjE2OjAxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCBtYXliZS11bmluaXRp
YWxpemVkIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGggLU9zCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAw
MDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZv
aWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKaW5kZXggZTZhZTdmNGJmZS4u
N2MzNTIzOGZmYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5o
LWRpcmVjdGx5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1k
aXJlY3RseS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGQyYjkyZmI3MGZlZDI3OTk4MDlj
NDIzZmVhNzkyMjFhM2UxNzEwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmI5M2Qx
OTc3ODg0ZjNmYjYyZDVlYWVhZWQxNzkyNTBhNDVjOWM2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBXZWQs
IDMgRmViIDIwMTYgMTg6MDU6NDEgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgaW5jbHVk
aW5nIDxzeXMvcG9sbC5oPiBkaXJlY3RseQpAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3lzL2R2Yi9nc3Rk
dmJzcmMuYyBiL3N5cy9kdmIvZ3N0ZHZic3JjLmMKLWluZGV4IDMzZWUzZmYuLmI4ZGRlYTkgMTAw
NjQ0CitpbmRleCBlZjU2NWY3Li42MjU0NDIwIDEwMDY0NAogLS0tIGEvc3lzL2R2Yi9nc3RkdmJz
cmMuYwogKysrIGIvc3lzL2R2Yi9nc3RkdmJzcmMuYwogQEAgLTk4LDcgKzk4LDcgQEAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15
b2N0by1idWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRh
dGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKaW5kZXggZDQ5Y2Y1YmQ4OS4uMGU0N2NlNzYyNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGly
LWluLXlvY3RvLWJ1aWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDExYTA4ZTNmMzEzNWI2NDliNjg3MTRjNzc2NzBjMzc1NTlmM2EzM2MgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDEzNmUwZmFjZWU0ODZmNzAyOGE4YjdjNTQ1NmJjY2M2YjQ0ZjNhZTAg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZXkgWmhpemhpa2luIDxhbmRyZXku
ekBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI3IEphbiAyMDIwIDEwOjIyOjM1ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG9wZW5jdjogcmVzb2x2ZSBtaXNzaW5nIG9wZW5jdiBkYXRhIGRpciBpbiB5
b2N0byBidWlsZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjMu
YmIKaW5kZXggYjMxMTI4NmNjMi4uMTI5OTIwNTdlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjIuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhZF8xLjI2LjMuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dz
dHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhZC9nc3QtcGx1Z2lucy1i
YWQKICAgICAgICAgICAgZmlsZTovLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGly
ZWN0bHkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNz
aW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImNiMTE2YmZjMzcyMmMyZGU1MzgzODg5OTAwNmNhZmRiM2M3
YzBiYzY5Y2Q3NjliMzNjOTkyYTg0MjFhOWQ4NDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTVj
NDhkYWNhZjE0Mjc2ZjRlNTk1ZjRjYmNhOTRiM2NmZWJmYzIyMjg1ZTc2NWUyYWE1NmQwYTcyNzVk
NzU2MSIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1x
dWVyeS1jYXBzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMt
cGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaAppbmRleCA3MzczYmQzZTI2Li42ZmQxNGRhNWVkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hl
bi1xdWVyeS1jYXBzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZy
b20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJk
MTQzNmYwMDI3YmIwOWNkY2Y5MDM4NjkxMGE0OTc0MjJkOWE4NzEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDA1NGI1NWFiNGY3MmM1MWIwODQ0MmRiZGU0YzAyMTMwZWFlOGRmYjIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5j
b20+CiBEYXRlOiBXZWQsIDE0IE1heSAyMDE0IDEwOjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEVOR1IwMDMxMjUxNTogZ2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2Fwcwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNp
bmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2lu
Zy5wYXRjaAppbmRleCBmYzlhZDQ3NGQ5Li4yYTBjNTIwMmYxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAy
LXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8w
MDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMWNjODc2NjYyYjc3MDdlYjVhMmY2Njg2NTRmNzkyMWI1NjQyZTEwOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDZmZTYyMWYzMzQ1OWRjMDU0NDM4MDEyY2Vh
ODlkMDI2OWE5ODg0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdrZSBXYW5n
IDxtaW5na2Uud2FuZ0BmcmVlc2NhbGUuY29tPgogRGF0ZTogVGh1LCAxOSBNYXIgMjAxNSAxNDox
NzoxMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4dCBs
aW5lcyBwYXJzaW5nLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZp
Zy5oLWlzLWluY2x1ZGVkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5o
LWlzLWluY2x1ZGVkLnBhdGNoCmluZGV4IDA2YjViYzQxZWQuLjhmOTI1NjlhNzcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGMwYzY5NDRlY2EwYzQ5NzQ3N2FhOWYyY2VjMmM4M2M0ZWE3
YTcwZTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU4OWU1NjViMjc0YmFhZTEwODdk
YjI1ZjlmY2UwMDE3YmMyMWYyZTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJs
b3MgUmFmYWVsIEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkg
MjAxOSAxNDowMToxMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB2aXYtZmI6IE1ha2Ugc3VyZSBj
b25maWcuaCBpcyBpbmNsdWRlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4yLmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2VfMS4yNi4zLmJiCmluZGV4IGMyNjRhMTRlZTYuLjc0ZWIxMzYwZjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlXzEuMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjMuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJh
c2UvZ3N0LXBsdWdpbnMtYmEKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3Vy
ZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNz
YXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCiAgICAgICAgICAg
ICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNGI5ZmMwYmU4NTJmZTVmNjU0MDFkMThhZTYyMThl
NGFlYTNmZjdhM2M5ZjhkMjY1OTM5YjljNDcwNDkxNWY3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjRlZjlmOWVmMDkwMjUzMDhjZTIyMGUyZGQyMmE4OWU0Yzk5MmQ4Y2E3MWI5NjhlM2M3MGFmMDYz
NGVjMjc5MzMiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1wbHVnaW5zLWJhc2UtJHtQVn0iCiAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuMy5iYgppbmRl
eCA3YTgxYTI5ZDk1Li42MDFhNzk2MWM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdv
b2RfMS4yNi4zLmJiCkBAIC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29vZC8tL2lzc3VlcwogCiBT
UkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdp
bnMtZ29vZC9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQ4NjRiOWFlYzI4YzNhODA4OTU0NjhjOTA5ZGQzMDNlNWYyMmY5MmQ2ZTJiMTEzN2Y4
MGUyYTE0NTQ1ODQzMzkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmU0ZWM5NjcwZWRmZTZiYjFl
NWYyNzE2OWFlMTQ1YjVhYzJkZDIxOGFjOThiZDgyNTFjOGZiYTQxYWQzM2M1MyIKIAogUyA9ICIk
e1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
Ni4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLXVnbHlfMS4yNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4zLmJiCmluZGV4IGZjZDk3ZTQyNDUuLmNjM2Rh
ODk1NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjMuYmIKQEAgLTE1
LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIu
ZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQ
Vn0udGFyLnh6IFwKICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjMmQ3
NTU2YzZiOGMyNjk0ZjliOTE4YWI5YzRjNmM5OThmYjkwOGM2YjZhNmFkNTc0NDE3MDJkYWQxNGNl
NzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDE3ZjVlZTg5NWY3MzRhYzAzNDFiMzcxOWMxNzVm
ZmYxNmI0YzhlYWU4ODA2ZTI5ZTE3MGIzYmNiM2Q5ZGJhNSIKIAogUyA9ICIke1VOUEFDS0RJUn0v
Z3N0LXBsdWdpbnMtdWdseS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjIuYmIgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEu
MjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNw
LXNlcnZlcl8xLjI2LjMuYmIKaW5kZXggNTEwODViYjNmYS4uN2VlN2ExZjA3ZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNl
cnZlcl8xLjI2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjMuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUE5SRUFM
ID0gImdzdC1ydHNwLXNlcnZlciIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVl
ZGVza3RvcC5vcmcvc3JjLyR7UE5SRUFMfS8ke1BOUkVBTH0tJHtQVn0udGFyLnh6IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjk0MmIyYTQ5OWVkNmQxNjEyMjI4NjhkYjBlODBkZTQ1Mjk3YjQ3
NzdmZjE4OWM2ZmI4OTBiZGU2OThjMmRjMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTVlOGE1
M2E5ODQ0Nzg5NzcwZGQ0ZjExNmFjMmUzYTRhMzNkZTQyNjczYzU3YWNjMjVjNWJhMGY0NDA2ZmM1
IgogCiBTID0gIiR7VU5QQUNLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============4588185190310475008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30753000 to 30761824 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstwayland-1.0.so.0.2602.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2602.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2602.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2602.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2602.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2602.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2602.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2602.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2602.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2602.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2602.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2602.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2602.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2602.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2602.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2602.0 /usr/lib/.debug/libgstmse-1.0.so.0.2602.0 /usr/lib/.debug/libgstplay-1.0.so.0.2602.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2602.0 /usr/lib/.d
 ebug/libgstinsertbin-1.0.so.0.2602.0", added "/usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2603.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2603.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2603.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2603.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2603.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2603.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2603.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2603.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2603.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2603.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2603.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2603.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2603.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2603.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2603.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2603.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2603.0 /usr/lib/.debug/libgstmse-1.0.so.0.2603.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2603.0 /usr/lib/.debug/libgstplay-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGSIZE changed from 3883164 to 3883257 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.2.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.3.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2602.0", added "/usr/lib/libgstanalytics-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2602.0", added "/usr/lib/libgstanalytics-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2602.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2602.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2602.0", added "/usr/lib/libgstcodecs-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2602.0", added "/usr/lib/libgstcodecs-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2602.0", added "/usr/lib/libgstcuda-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2602.0", added "/usr/lib/libgstcuda-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2602.0", added "/usr/lib/libgstdxva-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2602.0", added "/usr/lib/libgstdxva-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2602.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2602.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2602.0", added "/usr/lib/libgstisoff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2602.0", added "/usr/lib/libgstisoff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2602.0", added "/usr/lib/libgstmpegts-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2602.0", added "/usr/lib/libgstmpegts-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2602.0", added "/usr/lib/libgstmse-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2602.0", added "/usr/lib/libgstmse-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2602.0", added "/usr/lib/libgstphotography-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2602.0", added "/usr/lib/libgstphotography-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2602.0", added "/usr/lib/libgstplay-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2602.0", added "/usr/lib/libgstplay-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2602.0", added "/usr/lib/libgstplayer-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2602.0", added "/usr/lib/libgstplayer-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2602.0", added "/usr/lib/libgstsctp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2602.0", added "/usr/lib/libgstsctp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2602.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2602.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2602.0", added "/usr/lib/libgstvulkan-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2602.0", added "/usr/lib/libgstvulkan-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2602.0", added "/usr/lib/libgstwayland-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2602.0", added "/usr/lib/libgstwayland-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2602.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2602.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.2" to "1.26.3"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2602.0 to libgstadaptivedemux-1.0.so.0.2603.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2602.0 to libgstanalytics-1.0.so.0.2603.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2602.0 to libgstbadaudio-1.0.so.0.2603.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2602.0 to libgstbasecamerabinsrc-1.0.so.0.2603.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2602.0 to libgstcodecparsers-1.0.so.0.2603.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2602.0 to libgstcodecs-1.0.so.0.2603.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2602.0 to libgstcuda-1.0.so.0.2603.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2602.0 to libgstdxva-1.0.so.0.2603.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2602.0 to libgstinsertbin-1.0.so.0.2603.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2602.0 to libgstisoff-1.0.so.0.2603.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2602.0 to libgstmpegts-1.0.so.0.2603.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2602.0 to libgstmse-1.0.so.0.2603.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2602.0 to libgstphotography-1.0.so.0.2603.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2602.0 to libgstplay-1.0.so.0.2603.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2602.0 to libgstplayer-1.0.so.0.2603.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2602.0 to libgstsctp-1.0.so.0.2603.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2602.0 to libgsturidownloader-1.0.so.0.2603.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2602.0 to libgstvulkan-1.0.so.0.2603.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2602.0 to libgstwayland-1.0.so.0.2603.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2602.0 to libgstwebrtc-1.0.so.0.2603.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2602.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2603.0
  /usr/lib/libgstanalytics-1.0.so.0.2602.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2603.0
  /usr/lib/libgstbadaudio-1.0.so.0.2602.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2603.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2603.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2602.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2603.0
  /usr/lib/libgstcodecs-1.0.so.0.2602.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2603.0
  /usr/lib/libgstcuda-1.0.so.0.2602.0 moved to /usr/lib/libgstcuda-1.0.so.0.2603.0
  /usr/lib/libgstdxva-1.0.so.0.2602.0 moved to /usr/lib/libgstdxva-1.0.so.0.2603.0
  /usr/lib/libgstinsertbin-1.0.so.0.2602.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2603.0
  /usr/lib/libgstisoff-1.0.so.0.2602.0 moved to /usr/lib/libgstisoff-1.0.so.0.2603.0
  /usr/lib/libgstmpegts-1.0.so.0.2602.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2603.0
  /usr/lib/libgstmse-1.0.so.0.2602.0 moved to /usr/lib/libgstmse-1.0.so.0.2603.0
  /usr/lib/libgstphotography-1.0.so.0.2602.0 moved to /usr/lib/libgstphotography-1.0.so.0.2603.0
  /usr/lib/libgstplay-1.0.so.0.2602.0 moved to /usr/lib/libgstplay-1.0.so.0.2603.0
  /usr/lib/libgstplayer-1.0.so.0.2602.0 moved to /usr/lib/libgstplayer-1.0.so.0.2603.0
  /usr/lib/libgstsctp-1.0.so.0.2602.0 moved to /usr/lib/libgstsctp-1.0.so.0.2603.0
  /usr/lib/libgsturidownloader-1.0.so.0.2602.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2603.0
  /usr/lib/libgstvulkan-1.0.so.0.2602.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2603.0
  /usr/lib/libgstwayland-1.0.so.0.2602.0 moved to /usr/lib/libgstwayland-1.0.so.0.2603.0
  /usr/lib/libgstwebrtc-1.0.so.0.2602.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2603.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19378472 to 19385952 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstaudio-1.0.so.0.2602.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2602.0 /usr/lib/.debug/libgstfft-1.0.so.0.2602.0 /usr/lib/.debug/libgstgl-1.0.so.0.2602.0 /usr/lib/.debug/libgstriff-1.0.so.0.2602.0 /usr/lib/.debug/libgsttag-1.0.so.0.2602.0 /usr/lib/.debug/libgstapp-1.0.so.0.2602.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2602.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2602.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2602.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2602.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2602.0", added "/usr/lib/.debug/libgstallocators-1.0.so.0.2603.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2603.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2603.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2603.0 /usr/lib/.debug/libgstfft-1.0.so.0.2603.0 /usr/lib/.debug/libgstriff-1.0.so.0.2603.0 /usr/lib/.debug/libgsttag-1.0.so.0.2603.0 /usr/lib/.debug/libgstapp-1.0.so.0.2603.0 /usr/lib/.de
 bug/libgstrtp-1.0.so.0.2603.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2603.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2603.0 /usr/lib/.debug/libgstgl-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6283454 to 6283347 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGSIZE changed from 101112 to 105208 (+4%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGSIZE changed from 431392 to 431580 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.2.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.3.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2602.0", added "/usr/lib/libgstallocators-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2602.0", added "/usr/lib/libgstallocators-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2602.0", added "/usr/lib/libgstapp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2602.0", added "/usr/lib/libgstapp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2602.0", added "/usr/lib/libgstaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2602.0", added "/usr/lib/libgstaudio-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2602.0", added "/usr/lib/libgstfft-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2602.0", added "/usr/lib/libgstfft-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2602.0", added "/usr/lib/libgstgl-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2602.0", added "/usr/lib/libgstgl-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2602.0", added "/usr/lib/libgstpbutils-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2602.0", added "/usr/lib/libgstpbutils-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2602.0", added "/usr/lib/libgstriff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2602.0", added "/usr/lib/libgstriff-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2602.0", added "/usr/lib/libgstrtp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2602.0", added "/usr/lib/libgstrtp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2602.0", added "/usr/lib/libgstrtsp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2602.0", added "/usr/lib/libgstrtsp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2602.0", added "/usr/lib/libgstsdp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2602.0", added "/usr/lib/libgstsdp-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2602.0", added "/usr/lib/libgsttag-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2602.0", added "/usr/lib/libgsttag-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2602.0", added "/usr/lib/libgstvideo-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2602.0", added "/usr/lib/libgstvideo-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.2" to "1.26.3"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2602.0 to libgstallocators-1.0.so.0.2603.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2602.0 to libgstapp-1.0.so.0.2603.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2602.0 to libgstaudio-1.0.so.0.2603.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2602.0 to libgstfft-1.0.so.0.2603.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2602.0 to libgstgl-1.0.so.0.2603.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2602.0 to libgstpbutils-1.0.so.0.2603.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2602.0 to libgstriff-1.0.so.0.2603.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2602.0 to libgstrtp-1.0.so.0.2603.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2602.0 to libgstrtsp-1.0.so.0.2603.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2602.0 to libgstsdp-1.0.so.0.2603.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2602.0 to libgsttag-1.0.so.0.2603.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2602.0 to libgstvideo-1.0.so.0.2603.0
  /usr/lib/libgstallocators-1.0.so.0.2602.0 moved to /usr/lib/libgstallocators-1.0.so.0.2603.0
  /usr/lib/libgstapp-1.0.so.0.2602.0 moved to /usr/lib/libgstapp-1.0.so.0.2603.0
  /usr/lib/libgstaudio-1.0.so.0.2602.0 moved to /usr/lib/libgstaudio-1.0.so.0.2603.0
  /usr/lib/libgstfft-1.0.so.0.2602.0 moved to /usr/lib/libgstfft-1.0.so.0.2603.0
  /usr/lib/libgstgl-1.0.so.0.2602.0 moved to /usr/lib/libgstgl-1.0.so.0.2603.0
  /usr/lib/libgstpbutils-1.0.so.0.2602.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2603.0
  /usr/lib/libgstriff-1.0.so.0.2602.0 moved to /usr/lib/libgstriff-1.0.so.0.2603.0
  /usr/lib/libgstrtp-1.0.so.0.2602.0 moved to /usr/lib/libgstrtp-1.0.so.0.2603.0
  /usr/lib/libgstrtsp-1.0.so.0.2602.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2603.0
  /usr/lib/libgstsdp-1.0.so.0.2602.0 moved to /usr/lib/libgstsdp-1.0.so.0.2603.0
  /usr/lib/libgsttag-1.0.so.0.2602.0 moved to /usr/lib/libgsttag-1.0.so.0.2603.0
  /usr/lib/libgstvideo-1.0.so.0.2602.0 moved to /usr/lib/libgstvideo-1.0.so.0.2603.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22159184 to 22171784 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGSIZE changed from 39040 to 43136 (+10%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.3.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.3.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2602.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.3.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2602.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2602.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2603.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.2" to "1.26.3"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2602.0 to libgstrtspserver-1.0.so.0.2603.0
  /usr/lib/libgstrtspserver-1.0.so.0.2602.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2603.0

--===============4588185190310475008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1918 targets, 50 skipped, 0 masked, 0 errors.
Removing 164 recipes from the core2-64 sysroot...done.
Removing 183 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6ffd064292f41cfcd41fb2e44c73ec1987e93138"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ffd064292f41cfcd41fb2e44c73ec1987e93138"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1166 Local 965 Mirrors 0 Missed 201 Current 419 (82% match, 87% complete)
Removing 13 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 473 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 479 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 502 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 516 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 521 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 561 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 579 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe taglib-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 610 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 626 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 634 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 638 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 639 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata_setscene)
NOTE: recipe taglib-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 641 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 643 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 646 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 653 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 658 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe taglib-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 661 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 667 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 674 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 680 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 682 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe utfcpp-4.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 689 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 698 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 700 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe utfcpp-4.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 706 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 710 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 715 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 716 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 721 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 731 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 734 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 736 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 737 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 740 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 742 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe utfcpp-4.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 745 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 750 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 755 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 757 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 767 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 768 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe taglib-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 792 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe utfcpp-4.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe utfcpp-4.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 811 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 814 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 821 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 827 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe mpg123-1.33.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 837 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.33.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 842 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 860 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 868 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 874 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 878 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 882 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 889 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 895 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 897 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 900 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 901 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 903 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 907 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 908 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 909 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 914 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 919 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 926 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 928 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 936 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 942 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 948 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 953 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-native-1.1.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 958 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 959 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 960 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 964 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 968 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 969 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 981 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 984 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 993 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 995 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 997 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1002 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1006 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1009 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1010 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1012 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1013 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1019 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1020 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1023 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1037 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1040 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1045 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1049 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1050 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1057 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1062 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1065 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1066 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1069 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1072 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1077 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1079 of 1585 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1082 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1089 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1092 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1095 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1096 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1098 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1101 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1103 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1113 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1116 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1117 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1121 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1122 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1126 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1130 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1131 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1134 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1135 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1139 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1140 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1144 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1147 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1152 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1154 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1155 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1164 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1165 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1168 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1176 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1178 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1181 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1182 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1183 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1184 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1186 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1187 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1188 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1189 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1190 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1196 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1200 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1201 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1202 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1204 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe clang-20.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1209 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1213 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe clang-20.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1214 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1218 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1221 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1222 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1227 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1228 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1232 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1233 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1234 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1235 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1237 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1238 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1239 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1244 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1245 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 1247 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1248 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1249 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1251 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1253 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1256 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1259 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1260 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1264 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1267 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1268 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1270 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1274 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1276 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1280 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1281 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1283 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1285 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1289 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1291 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1296 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1297 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1301 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1304 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1306 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1310 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1313 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1314 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1316 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1318 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1319 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1321 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1323 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1324 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1325 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1326 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1327 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1328 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1331 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1339 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1341 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1343 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1344 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1345 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1347 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1350 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1351 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1352 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1354 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1357 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1363 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1366 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1367 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1369 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1370 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1371 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1372 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1374 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1376 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1377 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1378 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1380 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1381 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1386 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1388 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1389 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1392 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1394 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1396 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1402 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1403 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1404 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1406 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1407 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1410 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1412 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1413 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1414 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1415 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1418 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1419 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1421 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1423 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1425 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1426 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1429 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1430 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1431 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1433 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1436 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1437 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1438 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1439 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1440 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1441 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1442 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1443 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1444 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1446 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1447 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1449 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1450 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1451 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1452 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1453 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1454 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1455 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1456 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1457 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1459 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1460 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1463 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1464 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1465 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1466 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1467 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1470 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1472 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1476 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1477 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1482 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1487 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1488 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1489 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1490 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.41/temp/log.do_packagedata_setscene.1758534
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1492 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1493 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1497 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1498 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1507 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1510 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1513 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1514 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1515 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1518 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1521 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1522 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1525 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1526 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1527 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1528 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1531 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1532 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1533 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1534 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1535 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1538 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1539 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1541 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1542 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1543 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1545 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1546 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1550 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1552 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1554 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1555 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1557 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1558 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1559 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 652 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1561 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1562 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 835 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 909 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1566 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1568 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1571 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 1004 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1008 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: Running task 1011 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_fetch)
NOTE: Running task 1017 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Started
NOTE: Running task 1061 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: Running setscene task 1574 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1575 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1577 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: Running task 1067 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1101 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: Running task 1190 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 1196 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: Running task 1241 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1242 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1264 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: Running task 1282 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1297 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1322 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1347 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1384 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: Running task 1407 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1424 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_patch)
NOTE: Running task 1440 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1544 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 1548 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1564 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: Running task 1604 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1607 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe binutils-2.44-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1613 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe binutils-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1631 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_fetch)
NOTE: Running task 1633 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: Running task 1643 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1580 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_fetch: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Started
NOTE: recipe binutils-2.44-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1719 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1726 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1734 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: Running task 1740 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_fetch)
NOTE: Running task 1741 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_unpack)
NOTE: Running task 1749 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_unpack: Started
NOTE: Running task 1778 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_fetch: Started
NOTE: Running setscene task 1583 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.83-r0: task do_unpack: Started
NOTE: Running setscene task 1584 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_patch)
NOTE: Running task 1798 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe shadow-4.17.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1833 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: Running task 1834 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_patch)
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.83-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 1874 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_patch)
NOTE: recipe shadow-4.17.4-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: Running task 2032 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2350 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2365 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata)
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: Running task 2410 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: Running task 2425 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Started
NOTE: Running task 2459 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_patch: Started
NOTE: Running noexec task 2502 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_fetch)
NOTE: Running task 2505 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_generate_toolchain_file)
NOTE: Running task 2528 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 2534 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 2544 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_write_config)
NOTE: recipe mesa-2_25.1.3-r0: task do_fetch: Started
NOTE: Running task 2551 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: Running task 2553 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe clang-20.1.6-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2560 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe clang-20.1.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: Running task 2633 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2671 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2686 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 2707 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 2708 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_fetch)
NOTE: Running task 2737 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb:do_generate_toolchain_file)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: Running task 2751 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2786 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe spirv-llvm-translator-20.1.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2829 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_fetch)
NOTE: Running task 2831 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 2832 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_unpack)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2845 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 2859 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: Running task 2884 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_fetch)
NOTE: recipe pango-1.56.3-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_unpack: Started
NOTE: recipe pango-1.56.3-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_write_config: Started
NOTE: Running task 2896 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 2908 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 2911 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: Running task 2937 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2942 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: Running task 2946 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe pango-1.56.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2975 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_write_config)
NOTE: Running task 2984 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_unpack)
NOTE: Running task 2990 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe ell-0.76-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe ell-0.76-r0: task do_fetch: Succeeded
NOTE: Running task 2996 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe mesa-2_25.1.3-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 3005 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: Running task 3011 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 3017 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 3018 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_fetch)
NOTE: recipe pango-1.56.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 3019 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 3021 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Succeeded
NOTE: Running task 3037 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_unpack)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3038 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe ofono-2.17-r0: task do_fetch: Started
NOTE: Running task 3039 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 3058 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_write_config)
NOTE: recipe ell-0.76-r0: task do_unpack: Started
NOTE: recipe pango-1.56.3-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Started
NOTE: Running task 3074 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 3090 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 3091 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_write_config: Started
NOTE: Running task 3103 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 3114 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Succeeded
NOTE: recipe ell-0.76-r0: task do_unpack: Succeeded
NOTE: Running task 3120 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.3-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.17-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.76-r0: task do_patch: Started
NOTE: Running task 3185 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_fetch)
NOTE: Running task 3187 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 3189 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_fetch)
NOTE: Running task 3193 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.76-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_unpack: Succeeded
NOTE: Running task 3226 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_patch)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_25.1.3-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 3228 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 3229 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_unpack)
NOTE: Running task 3230 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 3232 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_patch: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.17-r0: task do_patch: Succeeded
NOTE: Running task 3253 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_patch: Started
NOTE: Running task 3300 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_write_config)
NOTE: recipe harfbuzz-11.2.1-r0: task do_patch: Started
NOTE: Running task 3319 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Succeeded
NOTE: Running task 3339 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_unpack)
NOTE: Running task 3358 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_fetch)
NOTE: Running task 3360 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_write_config: Started
NOTE: Running task 3386 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_write_config: Succeeded
NOTE: Running task 3398 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe mpg123-1.33.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Started
NOTE: recipe mpg123-1.33.0-r0: task do_fetch: Succeeded
NOTE: Running task 3400 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_patch)
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 3403 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Started
NOTE: Running task 3404 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running task 3405 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 3411 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: Running task 3413 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_patch: Started
NOTE: recipe mpg123-1.33.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3449 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3526 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_recipe_qa)
NOTE: Running task 3527 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_recipe_qa)
NOTE: Running task 3528 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_recipe_qa)
NOTE: Running task 3529 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_recipe_qa)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.33.0-r0: task do_unpack: Succeeded
NOTE: Running task 3532 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: Running task 3533 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3534 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_patch)
NOTE: Running task 3535 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.33.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Succeeded
NOTE: recipe mesa-native-2_25.1.3-r0: task do_configure: Started
NOTE: Running task 3590 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 3598 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_write_config)
NOTE: Running task 3603 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_write_config)
NOTE: recipe mpg123-1.33.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.44-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3613 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_patch)
NOTE: Running task 3614 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Started
NOTE: Running task 3632 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe binutils-2.44-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Succeeded
NOTE: Running task 3636 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 3637 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_fetch)
NOTE: Running task 3638 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 3657 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_unpack)
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_fetch: Started
NOTE: Running task 3685 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 3687 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_unpack)
NOTE: Running task 3688 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3729 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_write_config)
NOTE: Running task 3730 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_write_config)
NOTE: Running task 3731 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_write_config)
NOTE: Running task 3732 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_write_config)
NOTE: Running task 3735 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3810 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_patch)
NOTE: Running task 3818 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_write_config: Succeeded
NOTE: Running task 3825 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3826 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3842 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3844 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3846 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Setscene tasks completed
NOTE: Running task 3847 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3848 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3849 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_25.1.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.44-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_25.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3853 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_25.1.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 3854 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3855 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 3856 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3857 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Succeeded
NOTE: Running task 3858 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Succeeded
NOTE: Running task 3860 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 3861 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3862 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 3863 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot unihash changed to 980e2d8a3db9cc6e1670119213c16ef109a67770f40f767788d033d60780db32
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1550 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1554 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1572 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3864 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 1582 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1583 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1584 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3865 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3866 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_configure)
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3867 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3868 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3869 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe util-linux-2.41-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3870 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 3871 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3872 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 3874 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3875 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to df0833f895a27689912614b833de909b5ecfc3426ccaf5c4aeb05c866ccb102c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata became valid
NOTE: Running setscene task 1554 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1561 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1571 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1572 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1576 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1577 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1578 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_package_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1579 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1580 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3879 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.44-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1581 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.41/temp/log.do_packagedata_setscene.1781238
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1582 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package_setscene)
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3880 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 3881 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: Running task 3882 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3883 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Running task 3884 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1583 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1584 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.17.4-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package became valid
NOTE: Running setscene task 1585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3890 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx)
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package became valid
NOTE: Running setscene task 1585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3910 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3917 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx)
NOTE: recipe binutils-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3918 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3919 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.44-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3920 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3921 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3922 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Succeeded
NOTE: Running task 3923 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.44-r0: task do_configure: Succeeded
NOTE: Running task 3924 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_compile)
NOTE: recipe binutils-2.44-r0: task do_compile: Started
NOTE: recipe util-linux-2.41-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package became valid
NOTE: Running setscene task 1585 of 1585 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package_setscene)
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3931 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3933 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3934 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata)
NOTE: Running task 3940 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3941 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3942 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3943 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 3946 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx: Succeeded
NOTE: Running task 3947 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_collect_spdx_deps)
NOTE: Running task 3948 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: Running task 3949 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3950 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3951 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 3952 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 3953 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 3954 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: Running task 3955 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3956 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 3957 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 7861832d9923fea5db5965e8db2650dd79307341393ae35775045febd872b718
NOTE: Setscene tasks completed
NOTE: Running task 3958 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Running task 3959 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3960 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3961 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3962 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 3963 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3964 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3965 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure)
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3966 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 7b1ba30cac7f143e2c62841d73fc66a3d9c7a6c890f8e8bf4723b7b82b2530fc
NOTE: Setscene tasks completed
NOTE: Running task 3967 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3968 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3969 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3970 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Succeeded
NOTE: Running task 3971 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3972 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install)
NOTE: recipe libusb1-1.0.29-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install: Succeeded
NOTE: Running task 3973 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3974 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_package)
NOTE: Running task 3975 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.29-r0: task do_package: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.44-r0: task do_compile: Succeeded
NOTE: Running task 3976 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_install)
NOTE: recipe binutils-2.44-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Succeeded
NOTE: Running task 3977 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata unihash changed to 117c2e61e1937ace63cdc34315fd2b1781ba54e2922b451162be2cd700c0bc22
NOTE: Setscene tasks completed
NOTE: Running task 3978 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Succeeded
NOTE: Running task 3979 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3980 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Succeeded
NOTE: recipe binutils-2.44-r0: task do_install: Succeeded
NOTE: Running task 3981 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install_ptest_base)
NOTE: Running task 3982 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3985 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot)
NOTE: Running task 3986 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Started
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3987 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3988 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_create_spdx)
NOTE: recipe clang-20.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.44-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3989 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3990 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3991 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3992 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3993 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3994 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.44-r0: task do_create_spdx: Succeeded
NOTE: Running task 3995 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps)
NOTE: recipe clang-20.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3996 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_configure)
NOTE: recipe clang-20.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe clang-20.1.6-r0: task do_configure: Started
NOTE: recipe clang-20.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3997 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3998 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3999 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: Running task 4000 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_configure: Started
NOTE: Running task 4001 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4002 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4003 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4004 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4005 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 4006 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4007 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_configure_ptest_base)
NOTE: Running task 4008 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4009 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4010 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: Running task 4011 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4012 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4013 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4014 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4015 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 4016 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4017 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 4018 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: Running task 4019 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_compile: Succeeded
NOTE: Running task 4020 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 4021 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_install: Succeeded
NOTE: Running task 4022 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 4023 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4024 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: Running task 4025 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-11.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4026 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4027 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 4028 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4029 of 4279 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4030 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4031 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe harfbuzz-11.2.1-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.1.3-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe ell-0.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4032 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_configure)
NOTE: recipe mesa-native-2_25.1.3-r0: task do_create_spdx: Succeeded
NOTE: recipe ell-0.76-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Succeeded
NOTE: Running task 4033 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4034 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_configure: Succeeded
NOTE: Running task 4035 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_compile)
NOTE: recipe harfbuzz-11.2.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_compile: Succeeded
NOTE: Running task 4036 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 4037 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4038 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4039 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_install: Succeeded
NOTE: Running task 4040 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4041 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 4042 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.76-r0: task do_configure: Succeeded
NOTE: Running task 4043 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe ell-0.76-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4044 of 4279 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Failed
NOTE: recipe ell-0.76-r0: task do_compile: Succeeded
NOTE: recipe clang-20.1.6-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4044 tasks of which 3728 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701071055.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701071055.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.1901423
Summary: There were 286 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bits went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-coresched went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fcntl-lock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.1901423
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata) failed with exit code '1'

--===============4588185190310475008==--

