Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E9CCD342A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1762384572388914338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AapacGp3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BcQ9X537;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564e78c8-53432c67-4d04-47b6-ac5c-8474c070a404-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u54LzkjYAGYwc7Mm5C2rAjzATkYq1RFJvAbF91C42ZQ=;
	b=AapacGp3RlH/uzm+QM4E5qUXEwnUuAAAEtYuIfebIMWuAaYAGjfrI3L6rpsXY6Xp
	jke5Oa0OfGVe2yI1bS2IWrnodAOIMGyIjSK9jIy+RJW2XkothtxEWPHwPtsYRH0UL8n
	86avsgSUpc6v2FWr0SEgtu+fZSmtGvI5UFixgFak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u54LzkjYAGYwc7Mm5C2rAjzATkYq1RFJvAbF91C42ZQ=;
	b=BcQ9X537wIl4jcZZDBFtC2D9BOGfvJBKOlw6ciHg0gVdiFwvX2j8YmZfbtOMWqOx
	6G5SO3ntaT9Droo35jJUTrLvH0iWlMbuAF6yM1/mViaolWRWPKSuFg/8YdIGQKVaCQH
	YxR9riacODVKtGf9UZL3JOz9hsmFzdEG7sT3NMak=
Content-Type: multipart/mixed; boundary="===============0101139530402567642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrading to 1.26.7,1.26.7,1.26.7,1.26.7,1.26.7 SUCCEEDED
Message-ID: <0101019a564e78c8-53432c67-4d04-47b6-ac5c-8474c070a404-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225793

--===============0101139530402567642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly* to *1.26.7,1.26.7,1.26.7,1.26.7,1.26.7* has Succeeded.

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
From c8807633909fb38dd33388c33e73e040dbe12e81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 14:17:03 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly:
 upgrade 1.26.5 -> 1.26.7,1.26.5 -> 1.26.7,1.26.5 -> 1.26.7,1.26.5 ->
 1.26.7,1.26.5 -> 1.26.7

---
 ...1-fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch              | 2 +-
 ...4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} | 2 +-
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} | 2 +-
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} | 2 +-
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} | 2 +-
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..97a90a157f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From f3b6b9027048289261fc72428e81982b69e8cbce Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..824af0ef75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 96c9526bcbe0e3922272ff4d47b9b6f563b7034a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..12fb40621e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From 0d791b12f4e23d8e11f76e9eac75a07b756b3b1a Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
index c1d416c2bc..f19979c4b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "a0ab17dddd4c029ecd7a423c30badd5a3c7599ea42707016d1d57545f5723ccf"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..86a6860175 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From 87aa2958d39687ee6dd65a2e122fdc093de740c8 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index bf1e2a89e3..16afdf63f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 5b5a714d6307a680f243b1c9a7182b6dd9176ba1 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..c2a68eaa81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From cdb6e5a81708498260ceda8905a411b45eecef7f Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
index f12d81cda9..4dfd0a207c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
+SRC_URI[sha256sum] = "969e3cbf05dfab92cf37e94840fbe398517d7ba3275331d1c216a2e30a7208d0"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
index 4adbc982b7..9ba288a410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
index 5583c2f128..fa34912a06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
index a6bfd1d2b0..0bc858a03b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "4f234594aea692e3c1bfaa969965039aaf7483bdfc5862b31d614a59e6718abf"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============0101139530402567642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2607.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2605.0 to libgstadaptivedemux-1.0.so.0.2607.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2605.0 to libgstanalytics-1.0.so.0.2607.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2605.0 to libgstbadaudio-1.0.so.0.2607.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2605.0 to libgstbasecamerabinsrc-1.0.so.0.2607.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2605.0 to libgstcodecparsers-1.0.so.0.2607.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2605.0 to libgstcodecs-1.0.so.0.2607.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2605.0 to libgstcuda-1.0.so.0.2607.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2605.0 to libgstdxva-1.0.so.0.2607.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2605.0 to libgstinsertbin-1.0.so.0.2607.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2605.0 to libgstisoff-1.0.so.0.2607.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2605.0 to libgstmpegts-1.0.so.0.2607.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2605.0 to libgstmse-1.0.so.0.2607.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2605.0 to libgstphotography-1.0.so.0.2607.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2605.0 to libgstplay-1.0.so.0.2607.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2605.0 to libgstplayer-1.0.so.0.2607.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2605.0 to libgstsctp-1.0.so.0.2607.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2605.0 to libgsturidownloader-1.0.so.0.2607.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2605.0 to libgstvulkan-1.0.so.0.2607.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2605.0 to libgstwayland-1.0.so.0.2607.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2605.0 to libgstwebrtc-1.0.so.0.2607.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2605.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2607.0
  /usr/lib/libgstanalytics-1.0.so.0.2605.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2607.0
  /usr/lib/libgstbadaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2607.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2607.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2607.0
  /usr/lib/libgstcodecs-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2607.0
  /usr/lib/libgstcuda-1.0.so.0.2605.0 moved to /usr/lib/libgstcuda-1.0.so.0.2607.0
  /usr/lib/libgstdxva-1.0.so.0.2605.0 moved to /usr/lib/libgstdxva-1.0.so.0.2607.0
  /usr/lib/libgstinsertbin-1.0.so.0.2605.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2607.0
  /usr/lib/libgstisoff-1.0.so.0.2605.0 moved to /usr/lib/libgstisoff-1.0.so.0.2607.0
  /usr/lib/libgstmpegts-1.0.so.0.2605.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2607.0
  /usr/lib/libgstmse-1.0.so.0.2605.0 moved to /usr/lib/libgstmse-1.0.so.0.2607.0
  /usr/lib/libgstphotography-1.0.so.0.2605.0 moved to /usr/lib/libgstphotography-1.0.so.0.2607.0
  /usr/lib/libgstplay-1.0.so.0.2605.0 moved to /usr/lib/libgstplay-1.0.so.0.2607.0
  /usr/lib/libgstplayer-1.0.so.0.2605.0 moved to /usr/lib/libgstplayer-1.0.so.0.2607.0
  /usr/lib/libgstsctp-1.0.so.0.2605.0 moved to /usr/lib/libgstsctp-1.0.so.0.2607.0
  /usr/lib/libgsturidownloader-1.0.so.0.2605.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2607.0
  /usr/lib/libgstvulkan-1.0.so.0.2605.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2607.0
  /usr/lib/libgstwayland-1.0.so.0.2605.0 moved to /usr/lib/libgstwayland-1.0.so.0.2607.0
  /usr/lib/libgstwebrtc-1.0.so.0.2605.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2607.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2607.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2605.0 to libgstallocators-1.0.so.0.2607.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2605.0 to libgstapp-1.0.so.0.2607.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2605.0 to libgstaudio-1.0.so.0.2607.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2605.0 to libgstfft-1.0.so.0.2607.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2605.0 to libgstgl-1.0.so.0.2607.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2605.0 to libgstpbutils-1.0.so.0.2607.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2605.0 to libgstriff-1.0.so.0.2607.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2605.0 to libgstrtp-1.0.so.0.2607.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2605.0 to libgstrtsp-1.0.so.0.2607.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2605.0 to libgstsdp-1.0.so.0.2607.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2605.0 to libgsttag-1.0.so.0.2607.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2605.0 to libgstvideo-1.0.so.0.2607.0
  /usr/lib/libgstallocators-1.0.so.0.2605.0 moved to /usr/lib/libgstallocators-1.0.so.0.2607.0
  /usr/lib/libgstapp-1.0.so.0.2605.0 moved to /usr/lib/libgstapp-1.0.so.0.2607.0
  /usr/lib/libgstaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstaudio-1.0.so.0.2607.0
  /usr/lib/libgstfft-1.0.so.0.2605.0 moved to /usr/lib/libgstfft-1.0.so.0.2607.0
  /usr/lib/libgstgl-1.0.so.0.2605.0 moved to /usr/lib/libgstgl-1.0.so.0.2607.0
  /usr/lib/libgstpbutils-1.0.so.0.2605.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2607.0
  /usr/lib/libgstriff-1.0.so.0.2605.0 moved to /usr/lib/libgstriff-1.0.so.0.2607.0
  /usr/lib/libgstrtp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtp-1.0.so.0.2607.0
  /usr/lib/libgstrtsp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2607.0
  /usr/lib/libgstsdp-1.0.so.0.2605.0 moved to /usr/lib/libgstsdp-1.0.so.0.2607.0
  /usr/lib/libgsttag-1.0.so.0.2605.0 moved to /usr/lib/libgsttag-1.0.so.0.2607.0
  /usr/lib/libgstvideo-1.0.so.0.2605.0 moved to /usr/lib/libgstvideo-1.0.so.0.2607.0
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2607.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2605.0 to libgstrtspserver-1.0.so.0.2607.0
  /usr/lib/libgstrtspserver-1.0.so.0.2605.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2607.0

--===============0101139530402567642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-gstreamer1.0-plugins-base-.patch"

RnJvbSBjODgwNzYzMzkwOWZiMzhkZDMzMzg4YzMzZTczZTA0MGRiZTEyZTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNDoxNzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLGdzdHJl
YW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseToKIHVwZ3JhZGUgMS4yNi41IC0+IDEuMjYuNywxLjI2LjUgLT4gMS4yNi43
LDEuMjYuNSAtPiAxLjI2LjcsMS4yNi41IC0+CiAxLjI2LjcsMS4yNi41IC0+IDEuMjYuNwoKLS0t
CiAuLi4xLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdp
dGgucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJl
Y3RseS5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiAuLi40LW9wZW5jdi1yZXNvbHZlLW1pc3Np
bmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggfCAyICstCiAuLi5wbHVnaW5z
LWJhZF8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuNy5iYn0gfCAy
ICstCiAuLi4wMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5
LWNhcHMucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxp
bmVzLXBhcnNpbmcucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi4vMDAwMy12aXYtZmItTWFrZS1z
dXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoICAgICAgICAgICAgfCAyICstCiAuLi51Z2lu
cy1iYXNlXzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuNy5iYn0g
fCAyICstCiAuLi51Z2lucy1nb29kXzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1n
b29kXzEuMjYuNy5iYn0gfCAyICstCiAuLi51Z2lucy11Z2x5XzEuMjYuNS5iYiA9PiBnc3RyZWFt
ZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuNy5iYn0gfCAyICstCiAuLi5ydHNwLXNlcnZlcl8xLjI2
LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuNy5iYn0gfCAyICstCiAxMSBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuNy5iYn0gKDk4JSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2VfMS4yNi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi43
LmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0
cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI2LjcuYmJ9ICg5NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjYuNy5iYn0gKDk0JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjUuYmIgPT4g
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuNy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
LzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0
aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNv
bXBpbGluZy13aXRoLnBhdGNoCmluZGV4IDMwN2Q2Njk2NDUuLjk3YTkwYTE1N2YgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGlu
Zy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5n
cy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMjRiYjk0
OWU1NDdhMGFkNjlmM2Y0N2U0Y2YyNjJhNzViYjlmZTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmM2I2YjkwMjcwNDgyODkyNjFmYzcyNDI4ZTgxOTgyYjY5ZThjYmNlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6MTY6MDEgLTA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcgd2l0aCAt
T3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3Rs
eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRj
aAppbmRleCA3ZGE4OTk0ZTNkLi44MjRhZjBlZjc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQt
aW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWlu
Y2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3
MjgyMzgxMjlhOGE5MWNhZDg1NzAyM2QyZTcxMzE1OTEzMjE0MDlkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA5NmM5NTI2YmNiZTBlMzkyMjI3MmZmNGQ0N2I5YjZmNTYzYjcwMzRhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAxNiAxODowNTo0MSAtMDgwMAogU3ViamVjdDog
W1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9wb2xsLmg+IGRpcmVjdGx5CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8t
YnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRp
ci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDFlZGNmMDdjMTQuLjEyZmI0MDYyMWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15
b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5j
di1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Zjdh
MWM1NTkxZTI3NjgxZjI5NGFlNWVkZjBmMzI2ODkxOThhYmZmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwZDc5MWIxMmY0ZTIzZDhlMTFmNzZlOWVhYzc1YTA3Yjc1NmIzYjFhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmV5IFpoaXpoaWtpbiA8YW5kcmV5LnpAZ21h
aWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAyMCAxMDoyMjozNSArMDAwMAogU3ViamVjdDog
W1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2luZyBvcGVuY3YgZGF0YSBkaXIgaW4geW9jdG8g
YnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjcuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi43LmJiCmlu
ZGV4IGMxZDQxNmMyYmMuLmYxOTk3OWM0YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi41LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yNi43LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFt
ZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMtYmFkCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1v
cGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5ODkwZjI2MmYzYjJhOTU2NGRjYjYyOWU5ZWI2OTdkNzdiOTNkMWY3
MTg5N2VkYTFhODE3MGI3ZGNmZTczMjk0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwYWIxN2Rk
ZGQ0YzAyOWVjZDdhNDIzYzMwYmFkZDVhM2M3NTk5ZWE0MjcwNzAxNmQxZDU3NTQ1ZjU3MjNjY2Yi
CiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1wbHVnaW5zLWJhZC0ke1BWfSIKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnkt
Y2Fwcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13
aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKaW5kZXggNzE5YzczZDNlMy4uODZhNjg2MDE3NSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVl
cnktY2Fwcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNy
Yy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMzdmMDA2
MzEwM2U5OGY1MTA5MTMyZWEzMDJiOTE5YjkyZTI2YTM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA4N2FhMjk1OGQzOTY4N2VlNmRkNjVhMmUxMjJmZGMwOTNkZTc0MGM4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogemhvdW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29tPgog
RGF0ZTogV2VkLCAxNCBNYXkgMjAxNCAxMDoxNjoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBF
TkdSMDAzMTI1MTU6IGdldCBjYXBzIGZyb20gc3JjIHBhZCB3aGVuIHF1ZXJ5IGNhcHMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0
Y2gKaW5kZXggYmYxZTJhODllMy4uMTZhZmRmNjNmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2Fw
YXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1z
c2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGY4OTJmMGJlOGFlODhhY2M2NDgyZjRiOWE5YTRkYjVmMDNiN2FkZjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDViNWE3MTRkNjMwN2E2ODBmMjQzYjFjOWE3MTgyYjZk
ZDkxNzZiYTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5na2UgV2FuZyA8bWlu
Z2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFRodSwgMTkgTWFyIDIwMTUgMTQ6MTc6MTAg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFyc2U6IGVuaGFuY2UgU1NBIHRleHQgbGluZXMg
cGFyc2luZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1p
cy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1p
bmNsdWRlZC5wYXRjaAppbmRleCAxYTk4OGI5OWRlLi5jMmE2OGVhYTgxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA2ZjA2ZjRiMmYxM2YwMjgyNTAxODkyMjVhNDZhMzlmNDAyNDI4OTMw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZGI2ZTVhODE3MDg0OTgyNjBjZWRhODkw
NWE0MTFiNDVlZWNlZjdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2FybG9zIFJh
ZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KIERhdGU6IFR1ZSwgMjEgTWF5IDIwMTkg
MTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmln
LmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuNS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuNy5iYgpz
aW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
XzEuMjYuNy5iYgppbmRleCBmMTJkODFjZGE5Li40ZGZkMGEyMDdjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjI2LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2VfMS4yNi43LmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dz
dC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJz
ZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjBjMGUyNmNiZWRhYTU3NzMyY2I2YTU3OGU4Y2MxM2ExMTY0
YmYxOGQ3MzdkNTVjMzMzMDYxYzUyZjBjNDhkNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5Njll
M2NiZjA1ZGZhYjkyY2YzN2U5NDg0MGZiZTM5ODUxN2Q3YmEzMjc1MzMxZDFjMjE2YTJlMzBhNzIw
OGQwIgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1iYXNlLSR7UFZ9IgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtZ29vZF8xLjI2LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yNi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjcuYmIKaW5kZXggNGFk
YmM5ODJiNy4uOWJhMjg4YTQxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi41LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MjYuNy5iYgpAQCAtNiw3ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9pc3N1ZXMKIAogU1JDX1VS
SSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdv
b2QvZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJlYjA4NjJlOTM0MDRiMDczZTk4ZWM1MDM1MGVjZTdlNjY4NWVhMjkzNmNhYjgxMThjMmI4ZTkz
OGUyY2JlYThiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgyYWYxOGExZjNlNGEwNjBkYjYxZDI2
MzBmYmI5NzUyNjliODBiNTViYjJmZGNmZGRmYWI1YzY0NDBkMzA3ODEiCiAKIFMgPSAiJHtVTlBB
Q0tESVJ9L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuNS5i
YiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy11Z2x5XzEuMjYuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuNy5iYgppbmRleCA1NTgzYzJmMTI4Li5mYTM0OTEyYTA2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjI2LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi43LmJiCkBAIC0xNSw3ICsx
NSw3IEBAIFNSQ19VUkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVk
ZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRh
ci54eiBcCiAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZGZjNDM0MzVi
ZTk3ZTExMDgxNmJhYzZkNjAyYjBmMjA2YTAzODU0NjI3OTY4M2Q5ZDI1MzcyZmYxMjdkYjUyIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjExZjJlNGYzNGJiMmU4NDFkYzYwZWRjOTU1ODE1NzJiYzQ3
YmUwYzExZTU3N2QxMmJlZDk4YmIxZjgwYTY2MWIiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1w
bHVnaW5zLXVnbHktJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi41LmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2Ljcu
YmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2
ZXJfMS4yNi43LmJiCmluZGV4IGE2YmZkMWQyYjAuLjBiYzg1OGEwM2IgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yNi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi43LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJn
c3QtcnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0
b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjMyOGRmZjI0NTc0MTk2ODNmMmE0ZjA2Y2ExMTljZmQyMmJlYjYzMmNlZTFh
ZDY4MzA1OTEyMTMzMjUzNTNjNDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGYyMzQ1OTRhZWE2
OTJlM2MxYmZhYTk2OTk2NTAzOWFhZjc0ODNiZGZjNTg2MmIzMWQ2MTRhNTllNjcxOGFiZiIKIAog
UyA9ICIke1VOUEFDS0RJUn0vJHtQTlJFQUx9LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============0101139530402567642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGSIZE changed from 307264 to 303168 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstplay-1.0.so.0.2605.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2605.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2605.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2605.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2605.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2605.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2605.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2605.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2605.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2605.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2605.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2605.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2605.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2605.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2605.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2605.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2605.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2605.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2605.0 /usr
 /lib/.debug/libgstmse-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstplay-1.0.so.0.2607.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2607.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2607.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2607.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2607.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2607.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2607.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2607.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2607.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2607.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2607.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2607.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2607.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2607.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2607.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2607.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2607.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2607.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2607.0 /usr/lib/.debug/libgstmse-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30777808 to 30792600 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGSIZE changed from 3883447 to 3883419 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGSIZE changed from 242264 to 246360 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.5.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.7.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGSIZE changed from 158066 to 162162 (+3%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2605.0 to libgstadaptivedemux-1.0.so.0.2607.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2605.0 to libgstanalytics-1.0.so.0.2607.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2605.0 to libgstbadaudio-1.0.so.0.2607.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2605.0 to libgstbasecamerabinsrc-1.0.so.0.2607.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2605.0 to libgstcodecparsers-1.0.so.0.2607.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2605.0 to libgstcodecs-1.0.so.0.2607.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2605.0 to libgstcuda-1.0.so.0.2607.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2605.0 to libgstdxva-1.0.so.0.2607.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2605.0 to libgstinsertbin-1.0.so.0.2607.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2605.0 to libgstisoff-1.0.so.0.2607.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2605.0 to libgstmpegts-1.0.so.0.2607.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2605.0 to libgstmse-1.0.so.0.2607.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2605.0 to libgstphotography-1.0.so.0.2607.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2605.0 to libgstplay-1.0.so.0.2607.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2605.0 to libgstplayer-1.0.so.0.2607.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2605.0 to libgstsctp-1.0.so.0.2607.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2605.0 to libgsturidownloader-1.0.so.0.2607.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2605.0 to libgstvulkan-1.0.so.0.2607.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2605.0 to libgstwayland-1.0.so.0.2607.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2605.0 to libgstwebrtc-1.0.so.0.2607.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2605.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2607.0
  /usr/lib/libgstanalytics-1.0.so.0.2605.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2607.0
  /usr/lib/libgstbadaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2607.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2607.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2607.0
  /usr/lib/libgstcodecs-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2607.0
  /usr/lib/libgstcuda-1.0.so.0.2605.0 moved to /usr/lib/libgstcuda-1.0.so.0.2607.0
  /usr/lib/libgstdxva-1.0.so.0.2605.0 moved to /usr/lib/libgstdxva-1.0.so.0.2607.0
  /usr/lib/libgstinsertbin-1.0.so.0.2605.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2607.0
  /usr/lib/libgstisoff-1.0.so.0.2605.0 moved to /usr/lib/libgstisoff-1.0.so.0.2607.0
  /usr/lib/libgstmpegts-1.0.so.0.2605.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2607.0
  /usr/lib/libgstmse-1.0.so.0.2605.0 moved to /usr/lib/libgstmse-1.0.so.0.2607.0
  /usr/lib/libgstphotography-1.0.so.0.2605.0 moved to /usr/lib/libgstphotography-1.0.so.0.2607.0
  /usr/lib/libgstplay-1.0.so.0.2605.0 moved to /usr/lib/libgstplay-1.0.so.0.2607.0
  /usr/lib/libgstplayer-1.0.so.0.2605.0 moved to /usr/lib/libgstplayer-1.0.so.0.2607.0
  /usr/lib/libgstsctp-1.0.so.0.2605.0 moved to /usr/lib/libgstsctp-1.0.so.0.2607.0
  /usr/lib/libgsturidownloader-1.0.so.0.2605.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2607.0
  /usr/lib/libgstvulkan-1.0.so.0.2605.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2607.0
  /usr/lib/libgstwayland-1.0.so.0.2605.0 moved to /usr/lib/libgstwayland-1.0.so.0.2607.0
  /usr/lib/libgstwebrtc-1.0.so.0.2605.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2607.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgsttag-1.0.so.0.2605.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2605.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2605.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2605.0 /usr/lib/.debug/libgstapp-1.0.so.0.2605.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2605.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2605.0 /usr/lib/.debug/libgstfft-1.0.so.0.2605.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2605.0 /usr/lib/.debug/libgstgl-1.0.so.0.2605.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2605.0 /usr/lib/.debug/libgstriff-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstallocators-1.0.so.0.2607.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2607.0 /usr/lib/.debug/libgsttag-1.0.so.0.2607.0 /usr/lib/.debug/libgstgl-1.0.so.0.2607.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2607.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2607.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2607.0 /usr/lib/.debug/libgstapp-1.0.so.0.2607.0 /usr/lib/.deb
 ug/libgstrtp-1.0.so.0.2607.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2607.0 /usr/lib/.debug/libgstfft-1.0.so.0.2607.0 /usr/lib/.debug/libgstriff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19337288 to 19339720 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6283352 to 6283365 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.5.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.7.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2605.0 to libgstallocators-1.0.so.0.2607.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2605.0 to libgstapp-1.0.so.0.2607.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2605.0 to libgstaudio-1.0.so.0.2607.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2605.0 to libgstfft-1.0.so.0.2607.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2605.0 to libgstgl-1.0.so.0.2607.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2605.0 to libgstpbutils-1.0.so.0.2607.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2605.0 to libgstriff-1.0.so.0.2607.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2605.0 to libgstrtp-1.0.so.0.2607.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2605.0 to libgstrtsp-1.0.so.0.2607.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2605.0 to libgstsdp-1.0.so.0.2607.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2605.0 to libgsttag-1.0.so.0.2607.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2605.0 to libgstvideo-1.0.so.0.2607.0
  /usr/lib/libgstallocators-1.0.so.0.2605.0 moved to /usr/lib/libgstallocators-1.0.so.0.2607.0
  /usr/lib/libgstapp-1.0.so.0.2605.0 moved to /usr/lib/libgstapp-1.0.so.0.2607.0
  /usr/lib/libgstaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstaudio-1.0.so.0.2607.0
  /usr/lib/libgstfft-1.0.so.0.2605.0 moved to /usr/lib/libgstfft-1.0.so.0.2607.0
  /usr/lib/libgstgl-1.0.so.0.2605.0 moved to /usr/lib/libgstgl-1.0.so.0.2607.0
  /usr/lib/libgstpbutils-1.0.so.0.2605.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2607.0
  /usr/lib/libgstriff-1.0.so.0.2605.0 moved to /usr/lib/libgstriff-1.0.so.0.2607.0
  /usr/lib/libgstrtp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtp-1.0.so.0.2607.0
  /usr/lib/libgstrtsp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2607.0
  /usr/lib/libgstsdp-1.0.so.0.2605.0 moved to /usr/lib/libgstsdp-1.0.so.0.2607.0
  /usr/lib/libgsttag-1.0.so.0.2605.0 moved to /usr/lib/libgsttag-1.0.so.0.2607.0
  /usr/lib/libgstvideo-1.0.so.0.2605.0 moved to /usr/lib/libgstvideo-1.0.so.0.2607.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22207312 to 22211424 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGSIZE changed from 370880 to 374976 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.7.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.7.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1608184 to 1608248 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.7.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2607.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.5" to "1.26.7"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.5 [default] to 1.26.7 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2605.0 to libgstrtspserver-1.0.so.0.2607.0
  /usr/lib/libgstrtspserver-1.0.so.0.2605.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2607.0

--===============0101139530402567642==--

