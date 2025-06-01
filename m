Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1FBC71137
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.27786.1748786127252233983
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OOf5sd1y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WsxhSAmg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc69ea4-b1e0dafd-b4d0-46a8-9c0c-351fe129f468-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ReFTpTfGo0c3OeIxhrBwx17Q1q88mIetD8yMur2a2w4=;
	b=OOf5sd1yknBkOL3xBb121uD1MBqYwMiyjjbNX9BNtbvVzPNhcNPPfjhGp0Yp5eQ3
	a5ogV+u/bIaCX0vhf2mmyHq8iVuex7IKeKaLs7K9WDUQPqagu56RVYH56A65cPnprKn
	Ulc+VQ1IE0KXcmXvKcavHWlzkLL//RPoyYxtonFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ReFTpTfGo0c3OeIxhrBwx17Q1q88mIetD8yMur2a2w4=;
	b=WsxhSAmgO2q69WPBDXHWsk4aBjycNKVbFWVtPNYb0tjiv/WRN0O2HaXEjWv/F0fg
	mWXmk8PftXzDWUjtIvMH0HZIJCCLNODG2Vp5PwGNQHhKwPC8YrnLhkc8y3MDYnWhnFp
	o3l0T0yHRexvL1u5FaYGNU98+IZbkYVDzuzWKqlM=
Content-Type: multipart/mixed; boundary="===============8097915076583797141=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrading to 1.26.2,1.26.2,1.26.2,1.26.2,1.26.2 SUCCEEDED
Message-ID: <010101972bc69ea4-b1e0dafd-b4d0-46a8-9c0c-351fe129f468-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217572

--===============8097915076583797141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly* to *1.26.2,1.26.2,1.26.2,1.26.2,1.26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-gstreamer1.0-plugins-base-.patch
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
From 556301a108e20ece1db8864f5bcfd8f0591bb2a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 07:42:43 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrade 1.26.1 -> 1.26.2,1.26.1 -> 1.26.2,1.26.1 -> 1.26.2,1.26.1 ->
 1.26.2,1.26.1 -> 1.26.2

---
 ...fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch            | 4 ++--
 ...opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...ugins-bad_1.26.1.bb => gstreamer1.0-plugins-bad_1.26.2.bb} | 2 +-
 ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
 ...ins-base_1.26.1.bb => gstreamer1.0-plugins-base_1.26.2.bb} | 2 +-
 ...ins-good_1.26.1.bb => gstreamer1.0-plugins-good_1.26.2.bb} | 2 +-
 ...ins-ugly_1.26.1.bb => gstreamer1.0-plugins-ugly_1.26.2.bb} | 2 +-
 ...sp-server_1.26.1.bb => gstreamer1.0-rtsp-server_1.26.2.bb} | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.1.bb => gstreamer1.0-plugins-bad_1.26.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.1.bb => gstreamer1.0-plugins-base_1.26.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.1.bb => gstreamer1.0-plugins-good_1.26.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.1.bb => gstreamer1.0-plugins-ugly_1.26.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.1.bb => gstreamer1.0-rtsp-server_1.26.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 4dd9febbf6..490596293d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 9456674cea4a933d5fbc24230d307fe0f52588f3 Mon Sep 17 00:00:00 2001
+From 078ae781f63227d3de63cced62e140fa8adfb11d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index e6ae7f4bfe..7d8e3dd9c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From dd2b92fb70fed2799809c423fea79221a3e17108 Mon Sep 17 00:00:00 2001
+From ac1197b23cbdff04bf0b3418e4c253230e38d144 Mon Sep 17 00:00:00 2001
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
index d49cf5bd89..0ccc6663ca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
+From e7bb46f306c7973ca6282602f1c42157f1d497d7 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
index a68e9306a5..e0329cd004 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9b8415b1bb3726a499578fb39907952981716643f660215fe68628fbd8629197"
+SRC_URI[sha256sum] = "cb116bfc3722c2de53838899006cafdb3c7c0bc69cd769b33c992a8421a9d844"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 7373bd3e26..6e2ce6f10a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
+From a2ba5f398d108daa5bb49627b3de310e9e7a07a4 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index fc9ad474d9..0176f2fd6a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
+From bee7068390e562394f1d592a0fb886b173090b9c Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 06b5bc41ed..847cd85ced 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
+From 2e9f6ff2dda299770541004fe360a26e435a6138 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
index c872c3bcfb..dc70356940 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "659553636f84dcf388cad5cf6530e02b0b2d3dc450e76199287ba9db6a6c5226"
+SRC_URI[sha256sum] = "f4b9fc0be852fe5f65401d18ae6218e4aea3ff7a3c9f8d265939b9c4704915f7"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
index ea1322a5e3..467ccd9893 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fcdcb2f77620a599557b2843d1c6c55c2b660f5fc28222b542847d11d9ca982f"
+SRC_URI[sha256sum] = "d864b9aec28c3a80895468c909dd303e5f22f92d6e2b1137f80e2a1454584339"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
index 0d35abf2c6..106fea361c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "34d9bcec8e88b008839d8de33fb043ae75eb04e466df74066fd66ee487a8ec4f"
+SRC_URI[sha256sum] = "ec2d7556c6b8c2694f9b918ab9c4c6c998fb908c6b6a6ad57441702dad14ce73"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
index 76f6dac25d..85b5615550 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "253fdfec78320c2f67486cd3797a0253c06982c3a8d5160f795b4257fadab301"
+SRC_URI[sha256sum] = "f942b2a499ed6d161222868db0e80de45297b4777ff189c6fb890bde698c2dc3"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============8097915076583797141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstwebrtc-1.0.so.0.2601.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2601.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2601.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2601.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2601.0 /usr/lib/.debug/libgstplay-1.0.so.0.2601.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2601.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2601.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2601.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2601.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2601.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2601.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2601.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2601.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2601.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2601.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2601.0 /usr/lib/.debug/libgstmse-1.0.so.0.2601.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2601.0 /usr/lib
 /.debug/libgstcodecs-1.0.so.0.2601.0", added "/usr/lib/.debug/libgstsctp-1.0.so.0.2602.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2602.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2602.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2602.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2602.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2602.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2602.0 /usr/lib/.debug/libgstplay-1.0.so.0.2602.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2602.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2602.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2602.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2602.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2602.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2602.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2602.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2602.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2602.0 /usr/lib/.debug/libgstmse-1.0.so.0.2602.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2602.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30735136 to 30748456 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGSIZE changed from 66001 to 70097 (+6%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.1.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.2.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2601.0", added "/usr/lib/libgstanalytics-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2601.0", added "/usr/lib/libgstanalytics-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2601.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2601.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2601.0", added "/usr/lib/libgstcodecs-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2601.0", added "/usr/lib/libgstcodecs-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2601.0", added "/usr/lib/libgstcuda-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2601.0", added "/usr/lib/libgstcuda-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2601.0", added "/usr/lib/libgstdxva-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2601.0", added "/usr/lib/libgstdxva-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2601.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2601.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2601.0", added "/usr/lib/libgstisoff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2601.0", added "/usr/lib/libgstisoff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2601.0", added "/usr/lib/libgstmpegts-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2601.0", added "/usr/lib/libgstmpegts-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2601.0", added "/usr/lib/libgstmse-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2601.0", added "/usr/lib/libgstmse-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2601.0", added "/usr/lib/libgstphotography-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2601.0", added "/usr/lib/libgstphotography-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2601.0", added "/usr/lib/libgstplay-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2601.0", added "/usr/lib/libgstplay-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2601.0", added "/usr/lib/libgstplayer-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2601.0", added "/usr/lib/libgstplayer-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2601.0", added "/usr/lib/libgstsctp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2601.0", added "/usr/lib/libgstsctp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2601.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2601.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2601.0", added "/usr/lib/libgstvulkan-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2601.0", added "/usr/lib/libgstvulkan-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2601.0", added "/usr/lib/libgstwayland-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2601.0", added "/usr/lib/libgstwayland-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2601.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2601.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2601.0 to libgstadaptivedemux-1.0.so.0.2602.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2601.0 to libgstanalytics-1.0.so.0.2602.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2601.0 to libgstbadaudio-1.0.so.0.2602.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2601.0 to libgstbasecamerabinsrc-1.0.so.0.2602.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2601.0 to libgstcodecparsers-1.0.so.0.2602.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2601.0 to libgstcodecs-1.0.so.0.2602.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2601.0 to libgstcuda-1.0.so.0.2602.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2601.0 to libgstdxva-1.0.so.0.2602.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2601.0 to libgstinsertbin-1.0.so.0.2602.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2601.0 to libgstisoff-1.0.so.0.2602.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2601.0 to libgstmpegts-1.0.so.0.2602.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2601.0 to libgstmse-1.0.so.0.2602.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2601.0 to libgstphotography-1.0.so.0.2602.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2601.0 to libgstplay-1.0.so.0.2602.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2601.0 to libgstplayer-1.0.so.0.2602.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2601.0 to libgstsctp-1.0.so.0.2602.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2601.0 to libgsturidownloader-1.0.so.0.2602.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2601.0 to libgstvulkan-1.0.so.0.2602.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2601.0 to libgstwayland-1.0.so.0.2602.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2601.0 to libgstwebrtc-1.0.so.0.2602.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2601.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2602.0
  /usr/lib/libgstanalytics-1.0.so.0.2601.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2602.0
  /usr/lib/libgstbadaudio-1.0.so.0.2601.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2602.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2601.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2602.0
  /usr/lib/libgstcodecs-1.0.so.0.2601.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2602.0
  /usr/lib/libgstcuda-1.0.so.0.2601.0 moved to /usr/lib/libgstcuda-1.0.so.0.2602.0
  /usr/lib/libgstdxva-1.0.so.0.2601.0 moved to /usr/lib/libgstdxva-1.0.so.0.2602.0
  /usr/lib/libgstinsertbin-1.0.so.0.2601.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2602.0
  /usr/lib/libgstisoff-1.0.so.0.2601.0 moved to /usr/lib/libgstisoff-1.0.so.0.2602.0
  /usr/lib/libgstmpegts-1.0.so.0.2601.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2602.0
  /usr/lib/libgstmse-1.0.so.0.2601.0 moved to /usr/lib/libgstmse-1.0.so.0.2602.0
  /usr/lib/libgstphotography-1.0.so.0.2601.0 moved to /usr/lib/libgstphotography-1.0.so.0.2602.0
  /usr/lib/libgstplay-1.0.so.0.2601.0 moved to /usr/lib/libgstplay-1.0.so.0.2602.0
  /usr/lib/libgstplayer-1.0.so.0.2601.0 moved to /usr/lib/libgstplayer-1.0.so.0.2602.0
  /usr/lib/libgstsctp-1.0.so.0.2601.0 moved to /usr/lib/libgstsctp-1.0.so.0.2602.0
  /usr/lib/libgsturidownloader-1.0.so.0.2601.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2602.0
  /usr/lib/libgstvulkan-1.0.so.0.2601.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2602.0
  /usr/lib/libgstwayland-1.0.so.0.2601.0 moved to /usr/lib/libgstwayland-1.0.so.0.2602.0
  /usr/lib/libgstwebrtc-1.0.so.0.2601.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2602.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstallocators-1.0.so.0.2601.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2601.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2601.0 /usr/lib/.debug/libgstriff-1.0.so.0.2601.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2601.0 /usr/lib/.debug/libgstfft-1.0.so.0.2601.0 /usr/lib/.debug/libgsttag-1.0.so.0.2601.0 /usr/lib/.debug/libgstgl-1.0.so.0.2601.0 /usr/lib/.debug/libgstapp-1.0.so.0.2601.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2601.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2601.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2601.0", added "/usr/lib/.debug/libgstriff-1.0.so.0.2602.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2602.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2602.0 /usr/lib/.debug/libgstfft-1.0.so.0.2602.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2602.0 /usr/lib/.debug/libgsttag-1.0.so.0.2602.0 /usr/lib/.debug/libgstapp-1.0.so.0.2602.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2602.0 /usr/lib/.debug/
 libgstsdp-1.0.so.0.2602.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2602.0 /usr/lib/.debug/libgstgl-1.0.so.0.2602.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19361688 to 19374456 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGSIZE changed from 327368 to 331464 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.1.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.2.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2601.0", added "/usr/lib/libgstallocators-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2601.0", added "/usr/lib/libgstallocators-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2601.0", added "/usr/lib/libgstapp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2601.0", added "/usr/lib/libgstapp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2601.0", added "/usr/lib/libgstaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2601.0", added "/usr/lib/libgstaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2601.0", added "/usr/lib/libgstfft-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2601.0", added "/usr/lib/libgstfft-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2601.0", added "/usr/lib/libgstgl-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2601.0", added "/usr/lib/libgstgl-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2601.0", added "/usr/lib/libgstpbutils-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2601.0", added "/usr/lib/libgstpbutils-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2601.0", added "/usr/lib/libgstriff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2601.0", added "/usr/lib/libgstriff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2601.0", added "/usr/lib/libgstrtp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2601.0", added "/usr/lib/libgstrtp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2601.0", added "/usr/lib/libgstrtsp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2601.0", added "/usr/lib/libgstrtsp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2601.0", added "/usr/lib/libgstsdp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2601.0", added "/usr/lib/libgstsdp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2601.0", added "/usr/lib/libgsttag-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2601.0", added "/usr/lib/libgsttag-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2601.0", added "/usr/lib/libgstvideo-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2601.0", added "/usr/lib/libgstvideo-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2601.0 to libgstallocators-1.0.so.0.2602.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2601.0 to libgstapp-1.0.so.0.2602.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2601.0 to libgstaudio-1.0.so.0.2602.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2601.0 to libgstfft-1.0.so.0.2602.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2601.0 to libgstgl-1.0.so.0.2602.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2601.0 to libgstpbutils-1.0.so.0.2602.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2601.0 to libgstriff-1.0.so.0.2602.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2601.0 to libgstrtp-1.0.so.0.2602.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2601.0 to libgstrtsp-1.0.so.0.2602.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2601.0 to libgstsdp-1.0.so.0.2602.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2601.0 to libgsttag-1.0.so.0.2602.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2601.0 to libgstvideo-1.0.so.0.2602.0
  /usr/lib/libgstallocators-1.0.so.0.2601.0 moved to /usr/lib/libgstallocators-1.0.so.0.2602.0
  /usr/lib/libgstapp-1.0.so.0.2601.0 moved to /usr/lib/libgstapp-1.0.so.0.2602.0
  /usr/lib/libgstaudio-1.0.so.0.2601.0 moved to /usr/lib/libgstaudio-1.0.so.0.2602.0
  /usr/lib/libgstfft-1.0.so.0.2601.0 moved to /usr/lib/libgstfft-1.0.so.0.2602.0
  /usr/lib/libgstgl-1.0.so.0.2601.0 moved to /usr/lib/libgstgl-1.0.so.0.2602.0
  /usr/lib/libgstpbutils-1.0.so.0.2601.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2602.0
  /usr/lib/libgstriff-1.0.so.0.2601.0 moved to /usr/lib/libgstriff-1.0.so.0.2602.0
  /usr/lib/libgstrtp-1.0.so.0.2601.0 moved to /usr/lib/libgstrtp-1.0.so.0.2602.0
  /usr/lib/libgstrtsp-1.0.so.0.2601.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2602.0
  /usr/lib/libgstsdp-1.0.so.0.2601.0 moved to /usr/lib/libgstsdp-1.0.so.0.2602.0
  /usr/lib/libgsttag-1.0.so.0.2601.0 moved to /usr/lib/libgsttag-1.0.so.0.2602.0
  /usr/lib/libgstvideo-1.0.so.0.2601.0 moved to /usr/lib/libgstvideo-1.0.so.0.2602.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22139640 to 22154632 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGSIZE changed from 647256 to 655448 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGSIZE changed from 367480 to 371576 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGSIZE changed from 72256 to 76352 (+6%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.2.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.2.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2601.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1606544 to 1606584 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.2.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2601.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2601.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2601.0 to libgstrtspserver-1.0.so.0.2602.0
  /usr/lib/libgstrtspserver-1.0.so.0.2601.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2602.0

--===============8097915076583797141==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-gstreamer1.0-plugins-base-.patch"

RnJvbSA1NTYzMDFhMTA4ZTIwZWNlMWRiODg2NGY1YmNmZDhmMDU5MWJiMmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNzo0Mjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLGdzdHJl
YW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseToKIHVwZ3JhZGUgMS4yNi4xIC0+IDEuMjYuMiwxLjI2LjEgLT4gMS4yNi4y
LDEuMjYuMSAtPiAxLjI2LjIsMS4yNi4xIC0+CiAxLjI2LjIsMS4yNi4xIC0+IDEuMjYuMgoKLS0t
CiAuLi5maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRo
LnBhdGNoIHwgMiArLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0
bHkucGF0Y2ggICAgICAgICAgICB8IDQgKystLQogLi4ub3BlbmN2LXJlc29sdmUtbWlzc2luZy1v
cGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCB8IDIgKy0KIC4uLnVnaW5zLWJhZF8x
LjI2LjEuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMi5iYn0gfCAyICstCiAu
Li4xLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBh
dGNoIHwgMiArLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJz
aW5nLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmln
LmgtaXMtaW5jbHVkZWQucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi5pbnMtYmFzZV8xLjI2LjEu
YmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjIuYmJ9IHwgMiArLQogLi4uaW5z
LWdvb2RfMS4yNi4xLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4yLmJifSB8
IDIgKy0KIC4uLmlucy11Z2x5XzEuMjYuMS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjYuMi5iYn0gfCAyICstCiAuLi5zcC1zZXJ2ZXJfMS4yNi4xLmJiID0+IGdzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjI2LjIuYmJ9IHwgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi4xLmJiID0+IGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjIuYmJ9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMS5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMi5iYn0gKDk4JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdv
b2RfMS4yNi4xLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4yLmJifSAoOTcl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseV8xLjI2LjEuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjIuYmJ9ICg5NCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4xLmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNl
cnZlcl8xLjI2LjIuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmlu
aXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4
LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApp
bmRleCA0ZGQ5ZmViYmY2Li40OTA1OTYyOTNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJl
LXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
LzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0
aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQ1NjY3NGNlYTRhOTMzZDVmYmMyNDIzMGQz
MDdmZTBmNTI1ODhmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDc4YWU3ODFmNjMy
MjdkM2RlNjNjY2VkNjJlMTQwZmE4YWRmYjExZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI2IEph
biAyMDE2IDE1OjE2OjAxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCBtYXliZS11bmluaXRp
YWxpemVkIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGggLU9zCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAw
MDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZv
aWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKaW5kZXggZTZhZTdmNGJmZS4u
N2Q4ZTNkZDljNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5o
LWRpcmVjdGx5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1k
aXJlY3RseS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGQyYjkyZmI3MGZlZDI3OTk4MDlj
NDIzZmVhNzkyMjFhM2UxNzEwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWMxMTk3
YjIzY2JkZmYwNGJmMGIzNDE4ZTRjMjUzMjMwZTM4ZDE0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
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
dGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKaW5kZXggZDQ5Y2Y1YmQ4OS4uMGNjYzY2NjNjYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGly
LWluLXlvY3RvLWJ1aWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDExYTA4ZTNmMzEzNWI2NDliNjg3MTRjNzc2NzBjMzc1NTlmM2EzM2MgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGU3YmI0NmYzMDZjNzk3M2NhNjI4MjYwMmYxYzQyMTU3ZjFkNDk3ZDcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZXkgWmhpemhpa2luIDxhbmRyZXku
ekBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI3IEphbiAyMDIwIDEwOjIyOjM1ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG9wZW5jdjogcmVzb2x2ZSBtaXNzaW5nIG9wZW5jdiBkYXRhIGRpciBpbiB5
b2N0byBidWlsZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjEuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjIu
YmIKaW5kZXggYTY4ZTkzMDZhNS4uZTAzMjljZDAwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhZF8xLjI2LjIuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dz
dHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhZC9nc3QtcGx1Z2lucy1i
YWQKICAgICAgICAgICAgZmlsZTovLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGly
ZWN0bHkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNz
aW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjliODQxNWIxYmIzNzI2YTQ5OTU3OGZiMzk5MDc5NTI5ODE3
MTY2NDNmNjYwMjE1ZmU2ODYyOGZiZDg2MjkxOTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Ix
MTZiZmMzNzIyYzJkZTUzODM4ODk5MDA2Y2FmZGIzYzdjMGJjNjljZDc2OWIzM2M5OTJhODQyMWE5
ZDg0NCIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLWJhZC0ke1BWfSIKIApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVl
cnktY2Fwcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBh
ZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKaW5kZXggNzM3M2JkM2UyNi4uNmUyY2U2ZjEwYSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4t
cXVlcnktY2Fwcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9t
LXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZDE0
MzZmMDAyN2JiMDljZGNmOTAzODY5MTBhNDk3NDIyZDlhODcxIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhMmJhNWYzOThkMTA4ZGFhNWJiNDk2MjdiM2RlMzEwZTllN2EwN2E0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogemhvdW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29t
PgogRGF0ZTogV2VkLCAxNCBNYXkgMjAxNCAxMDoxNjoyMCArMDgwMAogU3ViamVjdDogW1BBVENI
XSBFTkdSMDAzMTI1MTU6IGdldCBjYXBzIGZyb20gc3JjIHBhZCB3aGVuIHF1ZXJ5IGNhcHMKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5n
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcu
cGF0Y2gKaW5kZXggZmM5YWQ0NzRkOS4uMDE3NmYyZmQ2YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1z
c2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAw
Mi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDFjYzg3NjY2MmI3NzA3ZWI1YTJmNjY4NjU0Zjc5MjFiNTY0MmUxMDggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJlZTcwNjgzOTBlNTYyMzk0ZjFkNTkyYTBmYjg4
NmIxNzMwOTBiOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5na2UgV2FuZyA8
bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFRodSwgMTkgTWFyIDIwMTUgMTQ6MTc6
MTAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFyc2U6IGVuaGFuY2UgU1NBIHRleHQgbGlu
ZXMgcGFyc2luZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcu
aC1pcy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1p
cy1pbmNsdWRlZC5wYXRjaAppbmRleCAwNmI1YmM0MWVkLi44NDdjZDg1Y2VkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBjMGM2OTQ0ZWNhMGM0OTc0NzdhYTlmMmNlYzJjODNjNGVhN2E3
MGU1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyZTlmNmZmMmRkYTI5OTc3MDU0MTAw
NGZlMzYwYTI2ZTQzNWE2MTM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2FybG9z
IFJhZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KIERhdGU6IFR1ZSwgMjEgTWF5IDIw
MTkgMTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdml2LWZiOiBNYWtlIHN1cmUgY29u
ZmlnLmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMS5iYiBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlXzEuMjYuMi5iYgppbmRleCBjODcyYzNiY2ZiLi5kYzcwMzU2OTQwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZV8xLjI2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkg
PSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNl
L2dzdC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUt
Y29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2Fw
YXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjU5NTUzNjM2Zjg0ZGNmMzg4Y2FkNWNmNjUzMGUwMmIw
YjJkM2RjNDUwZTc2MTk5Mjg3YmE5ZGI2YTZjNTIyNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
NGI5ZmMwYmU4NTJmZTVmNjU0MDFkMThhZTYyMThlNGFlYTNmZjdhM2M5ZjhkMjY1OTM5YjljNDcw
NDkxNWY3IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWdvb2RfMS4yNi4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4yLmJiCmluZGV4IGVh
MTMyMmE1ZTMuLjQ2N2NjZDk4OTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8x
LjI2LjIuYmIKQEAgLTYsNyArNiw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3QtcGx1Z2lucy1nb29kLy0vaXNzdWVzCiAKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1n
b29kL2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZmNkY2IyZjc3NjIwYTU5OTU1N2IyODQzZDFjNmM1NWMyYjY2MGY1ZmMyODIyMmI1NDI4NDdk
MTFkOWNhOTgyZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkODY0YjlhZWMyOGMzYTgwODk1NDY4
YzkwOWRkMzAzZTVmMjJmOTJkNmUyYjExMzdmODBlMmExNDU0NTg0MzM5IgogCiBTID0gIiR7V09S
S0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xLmJi
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LXVnbHlfMS4yNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4yLmJiCmluZGV4IDBkMzVhYmYyYzYuLjEwNmZlYTM2MWMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjIuYmIKQEAgLTE1LDcgKzE1
LDcgQEAgU1JDX1VSSSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0udGFy
Lnh6IFwKICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM0ZDliY2VjOGU4
OGIwMDg4MzlkOGRlMzNmYjA0M2FlNzVlYjA0ZTQ2NmRmNzQwNjZmZDY2ZWU0ODdhOGVjNGYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZWMyZDc1NTZjNmI4YzI2OTRmOWI5MThhYjljNGM2Yzk5OGZi
OTA4YzZiNmE2YWQ1NzQ0MTcwMmRhZDE0Y2U3MyIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVn
aW5zLXVnbHktJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4xLmJiIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yNi4yLmJiCmluZGV4IDc2ZjZkYWMyNWQuLjg1YjU2MTU1NTAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4y
Ni4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcnRzcC1zZXJ2ZXJfMS4yNi4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3Qt
cnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjI1M2ZkZmVjNzgzMjBjMmY2NzQ4NmNkMzc5N2EwMjUzYzA2OTgyYzNhOGQ1MTYw
Zjc5NWI0MjU3ZmFkYWIzMDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjk0MmIyYTQ5OWVkNmQx
NjEyMjI4NjhkYjBlODBkZTQ1Mjk3YjQ3NzdmZjE4OWM2ZmI4OTBiZGU2OThjMmRjMyIKIAogUyA9
ICIke1dPUktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============8097915076583797141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2601.0", added "/usr/lib/libgstanalytics-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2601.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2601.0", added "/usr/lib/libgstcodecs-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2601.0", added "/usr/lib/libgstcuda-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2601.0", added "/usr/lib/libgstdxva-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2601.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2601.0", added "/usr/lib/libgstisoff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2601.0", added "/usr/lib/libgstmpegts-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2601.0", added "/usr/lib/libgstmse-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2601.0", added "/usr/lib/libgstphotography-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2601.0", added "/usr/lib/libgstplay-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2601.0", added "/usr/lib/libgstplayer-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2601.0", added "/usr/lib/libgstsctp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2601.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2601.0", added "/usr/lib/libgstvulkan-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2601.0", added "/usr/lib/libgstwayland-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2601.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2602.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2601.0 to libgstadaptivedemux-1.0.so.0.2602.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2601.0 to libgstanalytics-1.0.so.0.2602.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2601.0 to libgstbadaudio-1.0.so.0.2602.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2601.0 to libgstbasecamerabinsrc-1.0.so.0.2602.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2601.0 to libgstcodecparsers-1.0.so.0.2602.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2601.0 to libgstcodecs-1.0.so.0.2602.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2601.0 to libgstcuda-1.0.so.0.2602.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2601.0 to libgstdxva-1.0.so.0.2602.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2601.0 to libgstinsertbin-1.0.so.0.2602.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2601.0 to libgstisoff-1.0.so.0.2602.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2601.0 to libgstmpegts-1.0.so.0.2602.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2601.0 to libgstmse-1.0.so.0.2602.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2601.0 to libgstphotography-1.0.so.0.2602.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2601.0 to libgstplay-1.0.so.0.2602.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2601.0 to libgstplayer-1.0.so.0.2602.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2601.0 to libgstsctp-1.0.so.0.2602.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2601.0 to libgsturidownloader-1.0.so.0.2602.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2601.0 to libgstvulkan-1.0.so.0.2602.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2601.0 to libgstwayland-1.0.so.0.2602.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2601.0 to libgstwebrtc-1.0.so.0.2602.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2601.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2602.0
  /usr/lib/libgstanalytics-1.0.so.0.2601.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2602.0
  /usr/lib/libgstbadaudio-1.0.so.0.2601.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2602.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2602.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2601.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2602.0
  /usr/lib/libgstcodecs-1.0.so.0.2601.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2602.0
  /usr/lib/libgstcuda-1.0.so.0.2601.0 moved to /usr/lib/libgstcuda-1.0.so.0.2602.0
  /usr/lib/libgstdxva-1.0.so.0.2601.0 moved to /usr/lib/libgstdxva-1.0.so.0.2602.0
  /usr/lib/libgstinsertbin-1.0.so.0.2601.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2602.0
  /usr/lib/libgstisoff-1.0.so.0.2601.0 moved to /usr/lib/libgstisoff-1.0.so.0.2602.0
  /usr/lib/libgstmpegts-1.0.so.0.2601.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2602.0
  /usr/lib/libgstmse-1.0.so.0.2601.0 moved to /usr/lib/libgstmse-1.0.so.0.2602.0
  /usr/lib/libgstphotography-1.0.so.0.2601.0 moved to /usr/lib/libgstphotography-1.0.so.0.2602.0
  /usr/lib/libgstplay-1.0.so.0.2601.0 moved to /usr/lib/libgstplay-1.0.so.0.2602.0
  /usr/lib/libgstplayer-1.0.so.0.2601.0 moved to /usr/lib/libgstplayer-1.0.so.0.2602.0
  /usr/lib/libgstsctp-1.0.so.0.2601.0 moved to /usr/lib/libgstsctp-1.0.so.0.2602.0
  /usr/lib/libgsturidownloader-1.0.so.0.2601.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2602.0
  /usr/lib/libgstvulkan-1.0.so.0.2601.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2602.0
  /usr/lib/libgstwayland-1.0.so.0.2601.0 moved to /usr/lib/libgstwayland-1.0.so.0.2602.0
  /usr/lib/libgstwebrtc-1.0.so.0.2601.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2602.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2601.0", added "/usr/lib/libgstallocators-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2601.0", added "/usr/lib/libgstapp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2601.0", added "/usr/lib/libgstaudio-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2601.0", added "/usr/lib/libgstfft-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2601.0", added "/usr/lib/libgstgl-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2601.0", added "/usr/lib/libgstpbutils-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2601.0", added "/usr/lib/libgstriff-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2601.0", added "/usr/lib/libgstrtp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2601.0", added "/usr/lib/libgstrtsp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2601.0", added "/usr/lib/libgstsdp-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2601.0", added "/usr/lib/libgsttag-1.0.so.0.2602.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2601.0", added "/usr/lib/libgstvideo-1.0.so.0.2602.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2601.0 to libgstallocators-1.0.so.0.2602.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2601.0 to libgstapp-1.0.so.0.2602.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2601.0 to libgstaudio-1.0.so.0.2602.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2601.0 to libgstfft-1.0.so.0.2602.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2601.0 to libgstgl-1.0.so.0.2602.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2601.0 to libgstpbutils-1.0.so.0.2602.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2601.0 to libgstriff-1.0.so.0.2602.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2601.0 to libgstrtp-1.0.so.0.2602.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2601.0 to libgstrtsp-1.0.so.0.2602.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2601.0 to libgstsdp-1.0.so.0.2602.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2601.0 to libgsttag-1.0.so.0.2602.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2601.0 to libgstvideo-1.0.so.0.2602.0
  /usr/lib/libgstallocators-1.0.so.0.2601.0 moved to /usr/lib/libgstallocators-1.0.so.0.2602.0
  /usr/lib/libgstapp-1.0.so.0.2601.0 moved to /usr/lib/libgstapp-1.0.so.0.2602.0
  /usr/lib/libgstaudio-1.0.so.0.2601.0 moved to /usr/lib/libgstaudio-1.0.so.0.2602.0
  /usr/lib/libgstfft-1.0.so.0.2601.0 moved to /usr/lib/libgstfft-1.0.so.0.2602.0
  /usr/lib/libgstgl-1.0.so.0.2601.0 moved to /usr/lib/libgstgl-1.0.so.0.2602.0
  /usr/lib/libgstpbutils-1.0.so.0.2601.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2602.0
  /usr/lib/libgstriff-1.0.so.0.2601.0 moved to /usr/lib/libgstriff-1.0.so.0.2602.0
  /usr/lib/libgstrtp-1.0.so.0.2601.0 moved to /usr/lib/libgstrtp-1.0.so.0.2602.0
  /usr/lib/libgstrtsp-1.0.so.0.2601.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2602.0
  /usr/lib/libgstsdp-1.0.so.0.2601.0 moved to /usr/lib/libgstsdp-1.0.so.0.2602.0
  /usr/lib/libgsttag-1.0.so.0.2601.0 moved to /usr/lib/libgsttag-1.0.so.0.2602.0
  /usr/lib/libgstvideo-1.0.so.0.2601.0 moved to /usr/lib/libgstvideo-1.0.so.0.2602.0
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2601.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2602.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2601.0 to libgstrtspserver-1.0.so.0.2602.0
  /usr/lib/libgstrtspserver-1.0.so.0.2601.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2602.0

--===============8097915076583797141==--

