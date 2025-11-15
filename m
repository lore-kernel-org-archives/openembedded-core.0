Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C47BCEB2FC
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11930.1763224714250013416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OtN7LBlh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rqhvvwCU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a8861f974-bde5fe19-6eba-4f02-9e57-0e014e6b87c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3n1yVtmPVNIQKu9BnvgGENVzXEUO06b+cXaUa+8QQnQ=;
	b=OtN7LBlhxo9+JagTPzvet6WbCZxGDpm/1mQEDEPOu7wcU7HUOiq76vXOZSMPPY8X
	5AzBPsiFAO2+17oWQ2k03sqAWjqiAonZAiBBExk/4p4IJ1BbcVOeAMkMpmD8MPjPApe
	npbWnTYNk28IPjyVSuTl86NRo07Y0gb7CElaMONw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3n1yVtmPVNIQKu9BnvgGENVzXEUO06b+cXaUa+8QQnQ=;
	b=rqhvvwCUK9s588Dih7WAculirQQHm+EMv5FnwfXUuHHNLr9u86aM9Npx4zEBmPaP
	Lwsy8BCmv4KtlZVkC4tElU7hU824yPWdumvSs0CuSPaFDvu+G3lda1RuYnW1i8wzwML
	mlM06wUxaf+hWKfgCMLA9sqBOSueffUfi/TXQoBk=
Content-Type: multipart/mixed; boundary="===============7153362010978635597=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad:
 upgrading to 1.26.8,1.26.8,1.26.8,1.26.8,1.26.8 SUCCEEDED
Message-ID: <0101019a8861f974-bde5fe19-6eba-4f02-9e57-0e014e6b87c1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226317

--===============7153362010978635597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad* to *1.26.8,1.26.8,1.26.8,1.26.8,1.26.8* has Succeeded.

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
From e32ca834260f92509dd45939e7e9138457a4aa64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 07:37:06 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad:
 upgrade 1.26.5 -> 1.26.8,1.26.5 -> 1.26.8,1.26.5 -> 1.26.8,1.26.5 ->
 1.26.8,1.26.5 -> 1.26.8

---
 ...1-fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch              | 2 +-
 ...4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.8.bb} | 2 +-
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.8.bb} | 2 +-
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.8.bb} | 2 +-
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.8.bb} | 2 +-
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.8.bb} | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.8.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.8.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..9916e013ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From d5ba135c3880fffe88181f625747dcc756810abc Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..7468faf2cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 47ee1a7e86e6ce94a7aedfc98ceee122bc247633 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..8c60824503 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From 469b4f6e018907f0c0afac89d0d82c3bf4172bf3 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.8.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.8.bb
index c1d416c2bc..c13716e7aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.8.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "25c05be5eb0694bde3ecd3317516f5d0d6e4ad21125a5ebcf6fb644a4c92439f"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..6834770b9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From 77bf5453a54f25356391e7ee8163a53e293fd279 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index bf1e2a89e3..b288f38bd6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 00f21ac9781b944bc3bf3ef52f4801bd737ac742 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..4f8ec992cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 68e85bb59f4032c97fcfb226b618df6e30bf951a Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.8.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.8.bb
index f12d81cda9..1cdd654dc7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
+SRC_URI[sha256sum] = "513cace4b02cb183ee47665d64bb2a25088abb6678c4cc57bb100b841add746b"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.8.bb
index 4adbc982b7..a6b09ac6ab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.8.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "061e84efae31dfb4d96e4517659aca82bad9d5625b8f64d3290604385edd1d14"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.8.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.8.bb
index 5583c2f128..ebb66e6d85 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.8.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "ed3c687290dd4d0cc1681f6fb3f59c57c8cfc765fa22eba16a7d09566cc5c7e1"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.8.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.8.bb
index a6bfd1d2b0..fde1454452 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.8.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "5c0ab4822d8dc381f1449abefcfcde0ba6fdb4be58f84002522923965e3b1293"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============7153362010978635597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGSIZE changed from 307264 to 303168 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30777848 to 30795408 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstphotography-1.0.so.0.2605.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2605.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2605.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2605.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2605.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2605.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2605.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2605.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2605.0 /usr/lib/.debug/libgstplay-1.0.so.0.2605.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2605.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2605.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2605.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2605.0 /usr/lib/.debug/libgstmse-1.0.so.0.2605.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2605.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2605.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2605.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2605.0 /usr/lib/.deb
 ug/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstphotography-1.0.so.0.2608.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2608.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2608.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2608.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2608.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2608.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2608.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2608.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2608.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2608.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2608.0 /usr/lib/.debug/libgstplay-1.0.so.0.2608.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2608.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2608.0 /usr/lib/.debug/libgstmse-1.0.so.0.2608.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2608.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2608.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2608.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2608.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGSIZE changed from 3883447 to 3883419 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGSIZE changed from 242264 to 246360 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.5.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.8.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGSIZE changed from 158066 to 162162 (+3%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2605.0 to libgstadaptivedemux-1.0.so.0.2608.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2605.0 to libgstanalytics-1.0.so.0.2608.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2605.0 to libgstbadaudio-1.0.so.0.2608.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2605.0 to libgstbasecamerabinsrc-1.0.so.0.2608.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2605.0 to libgstcodecparsers-1.0.so.0.2608.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2605.0 to libgstcodecs-1.0.so.0.2608.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2605.0 to libgstcuda-1.0.so.0.2608.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2605.0 to libgstdxva-1.0.so.0.2608.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2605.0 to libgstinsertbin-1.0.so.0.2608.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2605.0 to libgstisoff-1.0.so.0.2608.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2605.0 to libgstmpegts-1.0.so.0.2608.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2605.0 to libgstmse-1.0.so.0.2608.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2605.0 to libgstphotography-1.0.so.0.2608.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2605.0 to libgstplay-1.0.so.0.2608.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2605.0 to libgstplayer-1.0.so.0.2608.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2605.0 to libgstsctp-1.0.so.0.2608.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2605.0 to libgsturidownloader-1.0.so.0.2608.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2605.0 to libgstvulkan-1.0.so.0.2608.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2605.0 to libgstwayland-1.0.so.0.2608.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2605.0 to libgstwebrtc-1.0.so.0.2608.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2605.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2608.0
  /usr/lib/libgstanalytics-1.0.so.0.2605.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2608.0
  /usr/lib/libgstbadaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2608.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2608.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2608.0
  /usr/lib/libgstcodecs-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2608.0
  /usr/lib/libgstcuda-1.0.so.0.2605.0 moved to /usr/lib/libgstcuda-1.0.so.0.2608.0
  /usr/lib/libgstdxva-1.0.so.0.2605.0 moved to /usr/lib/libgstdxva-1.0.so.0.2608.0
  /usr/lib/libgstinsertbin-1.0.so.0.2605.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2608.0
  /usr/lib/libgstisoff-1.0.so.0.2605.0 moved to /usr/lib/libgstisoff-1.0.so.0.2608.0
  /usr/lib/libgstmpegts-1.0.so.0.2605.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2608.0
  /usr/lib/libgstmse-1.0.so.0.2605.0 moved to /usr/lib/libgstmse-1.0.so.0.2608.0
  /usr/lib/libgstphotography-1.0.so.0.2605.0 moved to /usr/lib/libgstphotography-1.0.so.0.2608.0
  /usr/lib/libgstplay-1.0.so.0.2605.0 moved to /usr/lib/libgstplay-1.0.so.0.2608.0
  /usr/lib/libgstplayer-1.0.so.0.2605.0 moved to /usr/lib/libgstplayer-1.0.so.0.2608.0
  /usr/lib/libgstsctp-1.0.so.0.2605.0 moved to /usr/lib/libgstsctp-1.0.so.0.2608.0
  /usr/lib/libgsturidownloader-1.0.so.0.2605.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2608.0
  /usr/lib/libgstvulkan-1.0.so.0.2605.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2608.0
  /usr/lib/libgstwayland-1.0.so.0.2605.0 moved to /usr/lib/libgstwayland-1.0.so.0.2608.0
  /usr/lib/libgstwebrtc-1.0.so.0.2605.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2608.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19337288 to 19341288 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstriff-1.0.so.0.2605.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2605.0 /usr/lib/.debug/libgstgl-1.0.so.0.2605.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2605.0 /usr/lib/.debug/libgstapp-1.0.so.0.2605.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2605.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2605.0 /usr/lib/.debug/libgsttag-1.0.so.0.2605.0 /usr/lib/.debug/libgstfft-1.0.so.0.2605.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2605.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2605.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstriff-1.0.so.0.2608.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2608.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2608.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2608.0 /usr/lib/.debug/libgstapp-1.0.so.0.2608.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2608.0 /usr/lib/.debug/libgsttag-1.0.so.0.2608.0 /usr/lib/.debug/libgstfft-1.0.so.0.2608.0 /usr/lib/.deb
 ug/libgstgl-1.0.so.0.2608.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2608.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2608.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6283352 to 6283646 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.5.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.8.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2605.0 to libgstallocators-1.0.so.0.2608.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2605.0 to libgstapp-1.0.so.0.2608.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2605.0 to libgstaudio-1.0.so.0.2608.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2605.0 to libgstfft-1.0.so.0.2608.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2605.0 to libgstgl-1.0.so.0.2608.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2605.0 to libgstpbutils-1.0.so.0.2608.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2605.0 to libgstriff-1.0.so.0.2608.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2605.0 to libgstrtp-1.0.so.0.2608.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2605.0 to libgstrtsp-1.0.so.0.2608.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2605.0 to libgstsdp-1.0.so.0.2608.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2605.0 to libgsttag-1.0.so.0.2608.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2605.0 to libgstvideo-1.0.so.0.2608.0
  /usr/lib/libgstallocators-1.0.so.0.2605.0 moved to /usr/lib/libgstallocators-1.0.so.0.2608.0
  /usr/lib/libgstapp-1.0.so.0.2605.0 moved to /usr/lib/libgstapp-1.0.so.0.2608.0
  /usr/lib/libgstaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstaudio-1.0.so.0.2608.0
  /usr/lib/libgstfft-1.0.so.0.2605.0 moved to /usr/lib/libgstfft-1.0.so.0.2608.0
  /usr/lib/libgstgl-1.0.so.0.2605.0 moved to /usr/lib/libgstgl-1.0.so.0.2608.0
  /usr/lib/libgstpbutils-1.0.so.0.2605.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2608.0
  /usr/lib/libgstriff-1.0.so.0.2605.0 moved to /usr/lib/libgstriff-1.0.so.0.2608.0
  /usr/lib/libgstrtp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtp-1.0.so.0.2608.0
  /usr/lib/libgstrtsp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2608.0
  /usr/lib/libgstsdp-1.0.so.0.2605.0 moved to /usr/lib/libgstsdp-1.0.so.0.2608.0
  /usr/lib/libgsttag-1.0.so.0.2605.0 moved to /usr/lib/libgsttag-1.0.so.0.2608.0
  /usr/lib/libgstvideo-1.0.so.0.2605.0 moved to /usr/lib/libgstvideo-1.0.so.0.2608.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22207312 to 22225200 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGSIZE changed from 370880 to 374976 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.8.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.8.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1608184 to 1608248 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.8.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2605.0 to libgstrtspserver-1.0.so.0.2608.0
  /usr/lib/libgstrtspserver-1.0.so.0.2605.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2608.0

--===============7153362010978635597==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-gstreamer1.0-plugins-base-.patch"

RnJvbSBlMzJjYTgzNDI2MGY5MjUwOWRkNDU5MzllN2U5MTM4NDU3YTRhYTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDc6Mzc6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2QsZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSxnc3Ry
ZWFtZXIxLjAtcnRzcC1zZXJ2ZXIsZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseSxnc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYWQ6CiB1cGdyYWRlIDEuMjYuNSAtPiAxLjI2LjgsMS4yNi41IC0+IDEuMjYu
OCwxLjI2LjUgLT4gMS4yNi44LDEuMjYuNSAtPgogMS4yNi44LDEuMjYuNSAtPiAxLjI2LjgKCi0t
LQogLi4uMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13
aXRoLnBhdGNoIHwgMiArLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGly
ZWN0bHkucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogLi4uNC1vcGVuY3YtcmVzb2x2ZS1taXNz
aW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIHwgMiArLQogLi4ucGx1Z2lu
cy1iYWRfMS4yNi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjguYmJ9IHwg
MiArLQogLi4uMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVy
eS1jYXBzLnBhdGNoIHwgMiArLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1s
aW5lcy1wYXJzaW5nLnBhdGNoICAgICAgICAgIHwgMiArLQogLi4uLzAwMDMtdml2LWZiLU1ha2Ut
c3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4udWdp
bnMtYmFzZV8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjguYmJ9
IHwgMiArLQogLi4udWdpbnMtZ29vZF8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI2LjguYmJ9IHwgMiArLQogLi4udWdpbnMtdWdseV8xLjI2LjUuYmIgPT4gZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjguYmJ9IHwgMiArLQogLi4ucnRzcC1zZXJ2ZXJfMS4y
Ni41LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjguYmJ9IHwgMiArLQogMTEg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yNi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjguYmJ9ICg5OCUp
CiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlXzEuMjYuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYu
OC5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWdvb2RfMS4yNi44LmJifSAoOTclKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjUuYmIgPT4gZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjI2LjguYmJ9ICg5NCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi41LmJiID0+
IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjguYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdp
dGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1j
b21waWxpbmctd2l0aC5wYXRjaAppbmRleCAzMDdkNjY5NjQ1Li45OTE2ZTAxM2FkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxp
bmctd2l0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2Fybmlu
Z3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDI0YmI5
NDllNTQ3YTBhZDY5ZjNmNDdlNGNmMjYyYTc1YmI5ZmU3MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZDViYTEzNWMzODgwZmZmZTg4MTgxZjYyNTc0N2RjYzc1NjgxMGFiYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5j
b20+CiBEYXRlOiBUdWUsIDI2IEphbiAyMDE2IDE1OjE2OjAxIC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGZpeCBtYXliZS11bmluaXRpYWxpemVkIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGgg
LU9zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0
bHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0
Y2gKaW5kZXggN2RhODk5NGUzZC4uNzQ2OGZhZjJjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lk
LWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1p
bmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NzI4MjM4MTI5YThhOTFjYWQ4NTcwMjNkMmU3MTMxNTkxMzIxNDA5ZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNDdlZTFhN2U4NmU2Y2U5NGE3YWVkZmM5OGNlZWUxMjJiYzI0NzYzMyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgRmViIDIwMTYgMTg6MDU6NDEgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gYXZvaWQgaW5jbHVkaW5nIDxzeXMvcG9sbC5oPiBkaXJlY3RseQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3Rv
LWJ1aWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1k
aXItaW4teW9jdG8tYnVpbC5wYXRjaAppbmRleCAxZWRjZjA3YzE0Li44YzYwODI0NTAzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4t
eW9jdG8tYnVpbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVu
Y3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGY3
YTFjNTU5MWUyNzY4MWYyOTRhZTVlZGYwZjMyNjg5MTk4YWJmZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNDY5YjRmNmUwMTg5MDdmMGMwYWZhYzg5ZDBkODJjM2JmNDE3MmJmMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJleSBaaGl6aGlraW4gPGFuZHJleS56QGdt
YWlsLmNvbT4KIERhdGU6IE1vbiwgMjcgSmFuIDIwMjAgMTA6MjI6MzUgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gb3BlbmN2OiByZXNvbHZlIG1pc3Npbmcgb3BlbmN2IGRhdGEgZGlyIGluIHlvY3Rv
IGJ1aWxkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi44LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuOC5iYgpp
bmRleCBjMWQ0MTZjMmJjLi5jMTM3MTZlN2FhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuNS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjYuOC5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVh
bWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtYmFkL2dzdC1wbHVnaW5zLWJhZAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3Rs
eS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOTg5MGYyNjJmM2IyYTk1NjRkY2I2MjllOWViNjk3ZDc3YjkzZDFm
NzE4OTdlZGExYTgxNzBiN2RjZmU3MzI5NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNWMwNWJl
NWViMDY5NGJkZTNlY2QzMzE3NTE2ZjVkMGQ2ZTRhZDIxMTI1YTVlYmNmNmZiNjQ0YTRjOTI0Mzlm
IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1iYWQtJHtQVn0iCiAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5
LWNhcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQt
d2hlbi1xdWVyeS1jYXBzLnBhdGNoCmluZGV4IDcxOWM3M2QzZTMuLjY4MzQ3NzBiOWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1
ZXJ5LWNhcHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1z
cmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTM3ZjAw
NjMxMDNlOThmNTEwOTEzMmVhMzAyYjkxOWI5MmUyNmEzOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzdiZjU0NTNhNTRmMjUzNTYzOTFlN2VlODE2M2E1M2UyOTNmZDI3OSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4K
IERhdGU6IFdlZCwgMTQgTWF5IDIwMTQgMTA6MTY6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
RU5HUjAwMzEyNTE1OiBnZXQgY2FwcyBmcm9tIHNyYyBwYWQgd2hlbiBxdWVyeSBjYXBzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoCmluZGV4IGJmMWUyYTg5ZTMuLmIyODhmMzhiZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3Nh
cGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDIt
c3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmODkyZjBiZThhZTg4YWNjNjQ4MmY0YjlhOWE0ZGI1ZjAzYjdhZGY4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMGYyMWFjOTc4MWI5NDRiYzNiZjNlZjUyZjQ4MDFi
ZDczN2FjNzQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2tlIFdhbmcgPG1p
bmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5IE1hciAyMDE1IDE0OjE3OjEw
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNlOiBlbmhhbmNlIFNTQSB0ZXh0IGxpbmVz
IHBhcnNpbmcuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgt
aXMtaW5jbHVkZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMt
aW5jbHVkZWQucGF0Y2gKaW5kZXggMWE5ODhiOTlkZS4uNGY4ZWM5OTJjZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNmYwNmY0YjJmMTNmMDI4MjUwMTg5MjI1YTQ2YTM5ZjQwMjQyODkz
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjhlODViYjU5ZjQwMzJjOTdmY2ZiMjI2
YjYxOGRmNmUzMGJmOTUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhcmxvcyBS
YWZhZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBUdWUsIDIxIE1heSAyMDE5
IDE0OjAxOjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZpdi1mYjogTWFrZSBzdXJlIGNvbmZp
Zy5oIGlzIGluY2x1ZGVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjUuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjguYmIK
c2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi41LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZV8xLjI2LjguYmIKaW5kZXggZjEyZDgxY2RhOS4uMWNkZDY1NGRjNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yNi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtYmFzZS9n
c3QtcGx1Z2lucy1iYQogICAgICAgICAgICBmaWxlOi8vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNv
bmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItc3NhcGFy
c2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImYwYzBlMjZjYmVkYWE1NzczMmNiNmE1NzhlOGNjMTNhMTE2
NGJmMThkNzM3ZDU1YzMzMzA2MWM1MmYwYzQ4ZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTEz
Y2FjZTRiMDJjYjE4M2VlNDc2NjVkNjRiYjJhMjUwODhhYmI2Njc4YzRjYzU3YmIxMDBiODQxYWRk
NzQ2YiIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWdvb2RfMS4yNi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi44LmJiCmluZGV4IDRh
ZGJjOTgyYjcuLmE2YjA5YWM2YWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8x
LjI2LjguYmIKQEAgLTYsNyArNiw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3QtcGx1Z2lucy1nb29kLy0vaXNzdWVzCiAKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1n
b29kL2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZWIwODYyZTkzNDA0YjA3M2U5OGVjNTAzNTBlY2U3ZTY2ODVlYTI5MzZjYWI4MTE4YzJiOGU5
MzhlMmNiZWE4YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNjFlODRlZmFlMzFkZmI0ZDk2ZTQ1
MTc2NTlhY2E4MmJhZDlkNTYyNWI4ZjY0ZDMyOTA2MDQzODVlZGQxZDE0IgogCiBTID0gIiR7VU5Q
QUNLRElSfS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjUu
YmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtdWdseV8xLjI2LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
Ni41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjguYmIKaW5kZXggNTU4M2MyZjEyOC4uZWJiNjZlNmQ4
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLXVnbHlfMS4yNi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuOC5iYgpAQCAtMTUsNyAr
MTUsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgICAgICAgICBodHRwczovL2dzdHJlYW1lci5mcmVl
ZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLXVnbHkvZ3N0LXBsdWdpbnMtdWdseS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2RmYzQzNDM1
YmU5N2UxMTA4MTZiYWM2ZDYwMmIwZjIwNmEwMzg1NDYyNzk2ODNkOWQyNTM3MmZmMTI3ZGI1MiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDNjNjg3MjkwZGQ0ZDBjYzE2ODFmNmZiM2Y1OWM1N2M4
Y2ZjNzY1ZmEyMmViYTE2YTdkMDk1NjZjYzVjN2UxIgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3Qt
cGx1Z2lucy11Z2x5LSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuNS5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi44
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi41LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2Vy
dmVyXzEuMjYuOC5iYgppbmRleCBhNmJmZDFkMmIwLi5mZGUxNDU0NDUyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVy
XzEuMjYuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuOC5iYgpAQCAtMTAsNyArMTAsNyBAQCBQTlJFQUwgPSAi
Z3N0LXJ0c3Atc2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNr
dG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIzMjhkZmYyNDU3NDE5NjgzZjJhNGYwNmNhMTE5Y2ZkMjJiZWI2MzJjZWUx
YWQ2ODMwNTkxMjEzMzI1MzUzYzQ0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjMGFiNDgyMmQ4
ZGMzODFmMTQ0OWFiZWZjZmNkZTBiYTZmZGI0YmU1OGY4NDAwMjUyMjkyMzk2NWUzYjEyOTMiCiAK
IFMgPSAiJHtVTlBBQ0tESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============7153362010978635597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2605.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2605.0", added "/usr/lib/libgstanalytics-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2605.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2605.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2605.0", added "/usr/lib/libgstcodecs-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2605.0", added "/usr/lib/libgstcuda-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2605.0", added "/usr/lib/libgstdxva-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2605.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2605.0", added "/usr/lib/libgstisoff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2605.0", added "/usr/lib/libgstmpegts-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2605.0", added "/usr/lib/libgstmse-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2605.0", added "/usr/lib/libgstphotography-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2605.0", added "/usr/lib/libgstplay-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2605.0", added "/usr/lib/libgstplayer-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2605.0", added "/usr/lib/libgstsctp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2605.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2605.0", added "/usr/lib/libgstvulkan-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2605.0", added "/usr/lib/libgstwayland-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2605.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2605.0 to libgstadaptivedemux-1.0.so.0.2608.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2605.0 to libgstanalytics-1.0.so.0.2608.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2605.0 to libgstbadaudio-1.0.so.0.2608.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2605.0 to libgstbasecamerabinsrc-1.0.so.0.2608.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2605.0 to libgstcodecparsers-1.0.so.0.2608.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2605.0 to libgstcodecs-1.0.so.0.2608.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2605.0 to libgstcuda-1.0.so.0.2608.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2605.0 to libgstdxva-1.0.so.0.2608.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2605.0 to libgstinsertbin-1.0.so.0.2608.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2605.0 to libgstisoff-1.0.so.0.2608.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2605.0 to libgstmpegts-1.0.so.0.2608.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2605.0 to libgstmse-1.0.so.0.2608.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2605.0 to libgstphotography-1.0.so.0.2608.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2605.0 to libgstplay-1.0.so.0.2608.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2605.0 to libgstplayer-1.0.so.0.2608.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2605.0 to libgstsctp-1.0.so.0.2608.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2605.0 to libgsturidownloader-1.0.so.0.2608.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2605.0 to libgstvulkan-1.0.so.0.2608.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2605.0 to libgstwayland-1.0.so.0.2608.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2605.0 to libgstwebrtc-1.0.so.0.2608.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2605.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2608.0
  /usr/lib/libgstanalytics-1.0.so.0.2605.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2608.0
  /usr/lib/libgstbadaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2608.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2605.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2608.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2608.0
  /usr/lib/libgstcodecs-1.0.so.0.2605.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2608.0
  /usr/lib/libgstcuda-1.0.so.0.2605.0 moved to /usr/lib/libgstcuda-1.0.so.0.2608.0
  /usr/lib/libgstdxva-1.0.so.0.2605.0 moved to /usr/lib/libgstdxva-1.0.so.0.2608.0
  /usr/lib/libgstinsertbin-1.0.so.0.2605.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2608.0
  /usr/lib/libgstisoff-1.0.so.0.2605.0 moved to /usr/lib/libgstisoff-1.0.so.0.2608.0
  /usr/lib/libgstmpegts-1.0.so.0.2605.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2608.0
  /usr/lib/libgstmse-1.0.so.0.2605.0 moved to /usr/lib/libgstmse-1.0.so.0.2608.0
  /usr/lib/libgstphotography-1.0.so.0.2605.0 moved to /usr/lib/libgstphotography-1.0.so.0.2608.0
  /usr/lib/libgstplay-1.0.so.0.2605.0 moved to /usr/lib/libgstplay-1.0.so.0.2608.0
  /usr/lib/libgstplayer-1.0.so.0.2605.0 moved to /usr/lib/libgstplayer-1.0.so.0.2608.0
  /usr/lib/libgstsctp-1.0.so.0.2605.0 moved to /usr/lib/libgstsctp-1.0.so.0.2608.0
  /usr/lib/libgsturidownloader-1.0.so.0.2605.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2608.0
  /usr/lib/libgstvulkan-1.0.so.0.2605.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2608.0
  /usr/lib/libgstwayland-1.0.so.0.2605.0 moved to /usr/lib/libgstwayland-1.0.so.0.2608.0
  /usr/lib/libgstwebrtc-1.0.so.0.2605.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2608.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2605.0", added "/usr/lib/libgstallocators-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2605.0", added "/usr/lib/libgstapp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2605.0", added "/usr/lib/libgstaudio-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2605.0", added "/usr/lib/libgstfft-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2605.0", added "/usr/lib/libgstgl-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2605.0", added "/usr/lib/libgstpbutils-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2605.0", added "/usr/lib/libgstriff-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2605.0", added "/usr/lib/libgstrtp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2605.0", added "/usr/lib/libgstrtsp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2605.0", added "/usr/lib/libgstsdp-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2605.0", added "/usr/lib/libgsttag-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2605.0", added "/usr/lib/libgstvideo-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2605.0 to libgstallocators-1.0.so.0.2608.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2605.0 to libgstapp-1.0.so.0.2608.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2605.0 to libgstaudio-1.0.so.0.2608.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2605.0 to libgstfft-1.0.so.0.2608.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2605.0 to libgstgl-1.0.so.0.2608.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2605.0 to libgstpbutils-1.0.so.0.2608.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2605.0 to libgstriff-1.0.so.0.2608.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2605.0 to libgstrtp-1.0.so.0.2608.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2605.0 to libgstrtsp-1.0.so.0.2608.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2605.0 to libgstsdp-1.0.so.0.2608.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2605.0 to libgsttag-1.0.so.0.2608.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2605.0 to libgstvideo-1.0.so.0.2608.0
  /usr/lib/libgstallocators-1.0.so.0.2605.0 moved to /usr/lib/libgstallocators-1.0.so.0.2608.0
  /usr/lib/libgstapp-1.0.so.0.2605.0 moved to /usr/lib/libgstapp-1.0.so.0.2608.0
  /usr/lib/libgstaudio-1.0.so.0.2605.0 moved to /usr/lib/libgstaudio-1.0.so.0.2608.0
  /usr/lib/libgstfft-1.0.so.0.2605.0 moved to /usr/lib/libgstfft-1.0.so.0.2608.0
  /usr/lib/libgstgl-1.0.so.0.2605.0 moved to /usr/lib/libgstgl-1.0.so.0.2608.0
  /usr/lib/libgstpbutils-1.0.so.0.2605.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2608.0
  /usr/lib/libgstriff-1.0.so.0.2605.0 moved to /usr/lib/libgstriff-1.0.so.0.2608.0
  /usr/lib/libgstrtp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtp-1.0.so.0.2608.0
  /usr/lib/libgstrtsp-1.0.so.0.2605.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2608.0
  /usr/lib/libgstsdp-1.0.so.0.2605.0 moved to /usr/lib/libgstsdp-1.0.so.0.2608.0
  /usr/lib/libgsttag-1.0.so.0.2605.0 moved to /usr/lib/libgsttag-1.0.so.0.2608.0
  /usr/lib/libgstvideo-1.0.so.0.2605.0 moved to /usr/lib/libgstvideo-1.0.so.0.2608.0
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2605.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2605.0 to libgstrtspserver-1.0.so.0.2608.0
  /usr/lib/libgstrtspserver-1.0.so.0.2605.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2608.0

--===============7153362010978635597==--

