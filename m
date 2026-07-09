Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B685FC44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:11:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2989.1783577514235436641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lXloiLgx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pU/1Gxuk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f458110dd-4be45c4d-da9d-4465-b203-bbccadbe2466-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577514;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Yd0gwAk7ZiAB3u0V6W5YUKTv5QdtCKwlpS0OARLhBT8=;
	b=lXloiLgx2BDCg8y+Cc7ecngvWrDsHW+vbHcWfZwMmYCCtJpNuzZtiiP4WEAtwa0k
	pJN4pREltEeNxEOjVawgYRDdGgD1sTX3N9asvD0k49l0aXtJyzrnmDQ6Fr3OtfI7fy/
	5f81OwWbOxpBBTgZXGgvdlyeY05+Qi98iDI5WcHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577514;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Yd0gwAk7ZiAB3u0V6W5YUKTv5QdtCKwlpS0OARLhBT8=;
	b=pU/1Gxuk9xuLYNcODuEMIhzobgTeQuxPUoo2faTGmPJa1daMoWcOXjqsCEEMooyh
	DA6maPy5I4JZSpRtAUDMQ4QzoQsbJc3nbgzVN2jbVFcR4E/tos7eTb6KyvECxdNonLK
	4pyqqKTEPQk54ME1qi6gn++s+9YzRvQz+1IUZGCY=
Content-Type: multipart/mixed; boundary="===============1538051071077635306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server:
 upgrading to 1.28.5,1.28.5,1.28.5,1.28.5,1.28.5 SUCCEEDED
Message-ID: <0101019f458110dd-4be45c4d-da9d-4465-b203-bbccadbe2466-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240529

--===============1538051071077635306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server* to *1.28.5,1.28.5,1.28.5,1.28.5,1.28.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-bad-gstreamer1.0-plugins-ugly-g.patch
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
From 7f3f6e52f5dc1c861e47d92d082d9c39d42d5f51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:23:35 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-rtsp-server:
 upgrade 1.28.4 -> 1.28.5,1.28.4 -> 1.28.5,1.28.4 -> 1.28.5,1.28.4 ->
 1.28.5,1.28.4 -> 1.28.5

---
 ...1-fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch              | 2 +-
 ...4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...5-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch | 2 +-
 ...plugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} | 2 +-
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} | 2 +-
 ...ugins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} | 2 +-
 ...ugins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} | 2 +-
 ...rtsp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index f5eb011ffa..5cd005af7f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bcc4c0d84f573e5d53195a726b475d818759550d Mon Sep 17 00:00:00 2001
+From 41fcbbcac6ad30896b49941f0aa3ec6be16acae3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index ed0a248381..c123726221 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 86d9fc16f8d165e79d29ab1130e08663502dcd25 Mon Sep 17 00:00:00 2001
+From b547f01872ad6095daf678d449577b90bcd83209 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 78981c0371..06c7c601f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 08cf48c1ad094a522b558f10d24d4aec670dcc88 Mon Sep 17 00:00:00 2001
+From e228e5840351e0242b4e7baa37d20890fb3560c9 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
index 97b138a660..c776b96442 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From 8ff54f765defbb343340da5de3cf5c89e400a8ff Mon Sep 17 00:00:00 2001
+From e0704fa119c7ae05df35e5e507cd98b6f36b7dfd Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
index a406f4783f..b6821c3ac7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "332b7320f30c60f2d5941446d03b9d05e3781f2c2561befbe88718bd777f0e47"
+SRC_URI[sha256sum] = "d8af55faef2958c1a8663751475ee46f5164877cf4d8c5913ea906ef180aeb71"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 635c801cdc..fe4a16d0e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From ae52c483980409c64b8bdd0c7b794533bcc0fec8 Mon Sep 17 00:00:00 2001
+From c2f4a49b051291da7571506edc37e0cf4ce25506 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4ce9f30d6a..2623812267 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 748c467f40d3f0072d9c139f9fdbbfdd56655c1e Mon Sep 17 00:00:00 2001
+From 1c323f323e4b7cd4e5b61aaffdab60c7f9f6f8de Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a824235731..59b869733c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 207df05a877717b1dd93a3a5903f0c58dd74c925 Mon Sep 17 00:00:00 2001
+From ef474d31d49d24fabcff01e32b88f303c05541af Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
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
index 4c0811a056..451378cf72 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "5486cd145c5af43259fd37caca59d048e2a67ddb07082ea8f50ef0f02a85f8a5"
+SRC_URI[sha256sum] = "0ef4cf9c3c9a5e776a6ca8d190a31863391b681980252143b822b29aa831e120"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
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
 
-- 
2.47.1


--===============1538051071077635306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-bad-gstreamer1.0-plugins-ugly-g.patch"

RnJvbSA3ZjNmNmU1MmY1ZGMxYzg2MWU0N2Q5MmQwODJkOWMzOWQ0MmQ1ZjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNToyMzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHksZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSxnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kLGdzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcjoKIHVwZ3JhZGUgMS4yOC40IC0+IDEuMjguNSwxLjI4LjQgLT4gMS4yOC41
LDEuMjguNCAtPiAxLjI4LjUsMS4yOC40IC0+CiAxLjI4LjUsMS4yOC40IC0+IDEuMjguNQoKLS0t
CiAuLi4xLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdp
dGgucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJl
Y3RseS5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiAuLi40LW9wZW5jdi1yZXNvbHZlLW1pc3Np
bmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggfCAyICstCiAuLi41LXdheWxh
bmQtaGFuZGxlLXBhZGRlZC1idWZmZXJzLWluLXdsX3NobS1idWZmZXItY3JlYXQucGF0Y2ggfCAy
ICstCiAuLi5wbHVnaW5zLWJhZF8xLjI4LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
XzEuMjguNS5iYn0gfCAyICstCiAuLi4wMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3Jj
LXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1zc2FwYXJzZS1lbmhh
bmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi4vMDAw
My12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoICAgICAgICAgICAg
fCAyICstCiAuLi51Z2lucy1iYXNlXzEuMjguNC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlXzEuMjguNS5iYn0gfCAyICstCiAuLi51Z2lucy1nb29kXzEuMjguNC5iYiA9PiBnc3RyZWFt
ZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguNS5iYn0gfCAyICstCiAuLi51Z2lucy11Z2x5XzEuMjgu
NC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguNS5iYn0gfCAyICstCiAuLi5y
dHNwLXNlcnZlcl8xLjI4LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguNS5i
Yn0gfCAyICstCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhZF8xLjI4LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEu
MjguNS5iYn0gKDk5JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
e2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC40LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2VfMS4yOC41LmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjQuYmIgPT4gZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjUuYmJ9ICg5NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguNC5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguNS5iYn0gKDk0JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZl
cl8xLjI4LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguNS5iYn0gKDkwJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hl
bi1jb21waWxpbmctd2l0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13
YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCmluZGV4IGY1ZWIwMTFmZmEuLjVjZDAw
NWFmN2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5n
cy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0
aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBiY2M0YzBkODRmNTczZTVkNTMxOTVhNzI2YjQ3NWQ4MTg3NTk1NTBkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MWZjYmJjYWM2YWQzMDg5NmI0OTk0MWYwYWEzZWM2YmUx
NmFjYWUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJt
Y2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6MTY6MDEgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZ3Mgd2hlbiBj
b21waWxpbmcgd2l0aCAtT3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lz
LXBvbGwuaC1kaXJlY3RseS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwu
aC1kaXJlY3RseS5wYXRjaAppbmRleCBlZDBhMjQ4MzgxLi5jMTIzNzI2MjIxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA4NmQ5ZmMxNmY4ZDE2NWU3OWQyOWFiMTEzMGUwODY2MzUwMmRjZDI1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNTQ3ZjAxODcyYWQ2MDk1ZGFmNjc4ZDQ0OTU3
N2I5MGJjZDgzMjA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJk
eSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAxNiAxODowNTo0MSAt
MDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9wb2xsLmg+IGRpcmVj
dGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0
YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5n
LW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDc4OTgxYzAzNzEuLjA2
YzdjNjAxZjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5j
di1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2
ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwOGNmNDhjMWFkMDk0YTUyMmI1NThmMTBkMjRkNGFlYzY3MGRjYzg4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMjI4ZTU4NDAzNTFlMDI0MmI0ZTdiYWEzN2QyMDg5
MGZiMzU2MGM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmV5IFpoaXpoaWtp
biA8YW5kcmV5LnpAZ21haWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAyMCAxMDoyMjozNSAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2luZyBvcGVuY3YgZGF0
YSBkaXIgaW4geW9jdG8gYnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNS13YXlsYW5kLWhhbmRsZS1w
YWRkZWQtYnVmZmVycy1pbi13bF9zaG0tYnVmZmVyLWNyZWF0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA1LXdheWxh
bmQtaGFuZGxlLXBhZGRlZC1idWZmZXJzLWluLXdsX3NobS1idWZmZXItY3JlYXQucGF0Y2gKaW5k
ZXggOTdiMTM4YTY2MC4uYzc3NmI5NjQ0MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA1LXdheWxhbmQtaGFu
ZGxlLXBhZGRlZC1idWZmZXJzLWluLXdsX3NobS1idWZmZXItY3JlYXQucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8w
MDA1LXdheWxhbmQtaGFuZGxlLXBhZGRlZC1idWZmZXJzLWluLXdsX3NobS1idWZmZXItY3JlYXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhmZjU0Zjc2NWRlZmJiMzQzMzQwZGE1ZGUzY2Y1
Yzg5ZTQwMGE4ZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUwNzA0ZmExMTljN2Fl
MDVkZjM1ZTVlNTA3Y2Q5OGI2ZjM2YjdkZmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBUdXNoYXIgRGFyb3RlIDx0ZGFyb3RlQHF0aS5xdWFsY29tbS5jb20+CiBEYXRlOiBNb24sIDgg
SnVuIDIwMjYgMTg6MDU6NTEgKzA1MzAKIFN1YmplY3Q6IFtQQVRDSF0gd2F5bGFuZDogaGFuZGxl
IHBhZGRlZCBidWZmZXJzIGluIHdsX3NobSBidWZmZXIgY3JlYXRpb24KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRf
MS4yOC40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZF8xLjI4LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI4LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC41LmJiCmluZGV4IGE0MDZmNDc4M2YuLmI2ODIx
YzNhYzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC41LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMtYmFkCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0
LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNS13YXlsYW5kLWhhbmRsZS1wYWRkZWQtYnVmZmVy
cy1pbi13bF9zaG0tYnVmZmVyLWNyZWF0LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjMzMmI3MzIwZjMwYzYwZjJkNTk0MTQ0NmQwM2I5ZDA1ZTM3ODFmMmMyNTYx
YmVmYmU4ODcxOGJkNzc3ZjBlNDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhhZjU1ZmFlZjI5
NThjMWE4NjYzNzUxNDc1ZWU0NmY1MTY0ODc3Y2Y0ZDhjNTkxM2VhOTA2ZWYxODBhZWI3MSIKIAog
UyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4t
cXVlcnktY2Fwcy5wYXRjaAppbmRleCA2MzVjODAxY2RjLi5mZTRhMTZkMGUxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1j
YXBzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBh
ZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFlNTJjNDgzOTgw
NDA5YzY0YjhiZGQwYzdiNzk0NTMzYmNjMGZlYzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGMyZjRhNDliMDUxMjkxZGE3NTcxNTA2ZWRjMzdlMGNmNGNlMjU1MDYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBEYXRl
OiBXZWQsIDE0IE1heSAyMDE0IDEwOjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEVOR1Iw
MDMxMjUxNTogZ2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaApp
bmRleCA0Y2U5ZjMwZDZhLi4yNjIzODEyMjY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNl
LWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBh
cnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNzQ4YzQ2N2Y0MGQzZjAwNzJkOWMxMzlmOWZkYmJmZGQ1NjY1NWMxZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWMzMjNmMzIzZTRiN2NkNGU1YjYxYWFmZmRhYjYwYzdmOWY2
ZjhkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdrZSBXYW5nIDxtaW5na2Uu
d2FuZ0BmcmVlc2NhbGUuY29tPgogRGF0ZTogVGh1LCAxOSBNYXIgMjAxNSAxNDoxNzoxMCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4dCBsaW5lcyBwYXJz
aW5nLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWlu
Y2x1ZGVkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1
ZGVkLnBhdGNoCmluZGV4IGE4MjQyMzU3MzEuLjU5Yjg2OTczM2MgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAw
MDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8w
MDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDIwN2RmMDVhODc3NzE3YjFkZDkzYTNhNTkwM2YwYzU4ZGQ3NGM5MjUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVmNDc0ZDMxZDQ5ZDI0ZmFiY2ZmMDFlMzJiODhm
MzAzYzA1NTQxYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJsb3MgUmFmYWVs
IEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkgMjAxOSAxNDow
MToxMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB2aXYtZmI6IE1ha2Ugc3VyZSBjb25maWcuaCBp
cyBpbmNsdWRlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC41LmJiCnNpbWls
YXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjguNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4y
OC41LmJiCmluZGV4IGQ5Zjg1NDE3Y2QuLjgxM2QxMTA4ZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjgu
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZV8xLjI4LjUuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhc2UvZ3N0LXBs
dWdpbnMtYmEKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcu
aC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNzYXBhcnNlLWVu
aGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhODk4YWZkNTc2NjE3MmIwMDQ5ZTY3ODE1NThlMDY4OTA5OGJmODdi
OWQ4MmI4NDZjNjUyZTU3MWMwMWQ2MGQ4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3NmYxOTIy
OGY5MWZkMjViYmY1NGQ5ODUwNTk3ZTE1ODUwN2Y1OTQ4NzJhNTJiOWI2ODE0ZTI0MjliNDNlYWEi
CiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1wbHVnaW5zLWJhc2UtJHtQVn0iCiAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1nb29kXzEuMjguNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtZ29vZF8xLjI4LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguNS5iYgppbmRleCBkNmM4ZDQ0
YmU4Li45ZDdmZDYyMzA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC41
LmJiCkBAIC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29vZC8tL2lzc3VlcwogCiBTUkNfVVJJID0g
Imh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtZ29vZC9n
c3QtcGx1Z2lucy1nb29kLSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4
MjVlYTczN2M1OWNlYTBlNGEwYzQxZGEyMzg4MDQ1ZmY1ZGQzMmQxNjIyMjBhYzkzYTdhODJlZTRh
MDRlNjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNThiNDVkMjRhMWQ3N2IzOWQ3YmI3ZDljY2M2
ZTJkNzZiYmYyODYxODk5OGMzMzVjMTYzZjE4ZTZmOTRhOTMyNCIKIAogUyA9ICIke1VOUEFDS0RJ
Un0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC40LmJiIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVn
bHlfMS4yOC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLXVnbHlfMS4yOC41LmJiCmluZGV4IDRjMDgxMWEwNTYuLjQ1MTM3OGNmNzIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy11Z2x5XzEuMjguNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjUuYmIKQEAgLTE1LDcgKzE1LDcg
QEAgU1JDX1VSSSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0
b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0ODZjZDE0NWM1YWY0
MzI1OWZkMzdjYWNhNTlkMDQ4ZTJhNjdkZGIwNzA4MmVhOGY1MGVmMGYwMmE4NWY4YTUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMGVmNGNmOWMzYzlhNWU3NzZhNmNhOGQxOTBhMzE4NjMzOTFiNjgx
OTgwMjUyMTQzYjgyMmIyOWFhODMxZTEyMCIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdp
bnMtdWdseS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4LjQuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguNS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI4LjUuYmIKaW5kZXggMzM4Y2Y4NWU1ZS4uMGI2NjcyYzNhNiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4
LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjI4LjUuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUE5SRUFMID0gImdzdC1y
dHNwLXNlcnZlciIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5v
cmcvc3JjLyR7UE5SRUFMfS8ke1BOUkVBTH0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYmZiNjc4MDU0MmJmMGQ0MDI3MzYyMzJhZWFlNmM1YTFiOTQzYzQ0NTc3NWJmNDAz
MDViY2I4NmNhNzA3MDVhMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZTE5ZmRkZWIxMjYxYmVi
YzNlYzM5Nzg1N2ZlZGQ1Yzc3MTI5YjY2YWI1Mjc4OGZkYWRhZDA1MTE3NTY2MjI1IgogCiBTID0g
IiR7VU5QQUNLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============1538051071077635306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecparsers-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecparsers-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstinsertbin-1.0.so.0.2804.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2804.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2804.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2804.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2804.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2804.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2804.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2804.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2804.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2804.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2804.0 /usr/lib/.debug/libgstplay-1.0.so.0.2804.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2804.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2804.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2804.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2804.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2804.0 /usr/lib/.debug/libgstmse-1.0.so.0.2804.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2804.0 /usr/li
 b/.debug/libgstwebrtc-1.0.so.0.2804.0", added "/usr/lib/.debug/libgstcodecs-1.0.so.0.2805.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2805.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2805.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2805.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2805.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2805.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2805.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2805.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2805.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2805.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2805.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2805.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2805.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2805.0 /usr/lib/.debug/libgstplay-1.0.so.0.2805.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2805.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2805.0 /usr/lib/.debug/libgstmse-1.0.so.0.2805.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2805.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 34803088 to 34817112 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ar: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ar: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-kk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-kk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/codectimestamper -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/codectimestamper, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mxf -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mxf, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/curl -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/curl, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/camerabin2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/camerabin2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/jpegformat -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/jpegformat, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/removesilence -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/removesilence, directory renamed /usr/src/debug/gs
 treamer1.0-plugins-bad/1.28.4/gst/adpcmdec -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/adpcmdec, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/mpegts -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/mpegts, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/bluez -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/bluez, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/faceoverlay -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/faceoverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/webrtc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/webrtc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/dxva -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/dxva, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/vulkan/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5
 /gst-libs/gst/vulkan/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/insertbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/insertbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/codecs -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/codecs, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mpegdemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mpegdemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/basecamerabinsrc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/basecamerabinsrc, directory renamed /usr/sr
 c/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mpegtsmux/tsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mpegtsmux/tsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/sdp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/sdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/ivtc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/ivtc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mpegtsdemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mpegtsdemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/ivfparse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/ivfparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/rawparse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/rawparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/uridownloader -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/uridownloader
 , directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/fbdev -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/fbdev, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/audiolatency -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/audiolatency, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/decklink -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/decklink, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/speed -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/speed, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/shm -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/shm, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/timecode -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/timecode, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/fieldanalysis -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/fieldanalysis, direc
 tory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/vmnc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/vmnc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/sctp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/sctp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/insertbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/insertbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/codecalpha -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/codecalpha, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/sbc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/sbc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/transcode -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/transcode, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/videoparsers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/videoparsers, 
 directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/rist -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/rist, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/codecparsers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/codecparsers, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/vulkan -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/vulkan, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/vulkan/shaders -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/vulkan/shaders, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/midi -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/midi, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/dvb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/dvb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/videofilters -> /usr/src/debug/gstreamer1.0-plugin
 s-bad/1.28.5/gst/videofilters, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/audiofxbad -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/audiofxbad, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/closedcaption -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/closedcaption, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mpegpsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mpegpsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mpegtsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mpegtsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/tools -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/tools, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/adpcmenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/adpcmenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/pcapparse -> /usr/src/debug/gstreamer1.0-
 plugins-bad/1.28.5/gst/pcapparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/uvcgadget -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/uvcgadget, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/v4l2codecs/linux/usb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/v4l2codecs/linux/usb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/cuda/stub -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/cuda/stub, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/coloreffects -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/coloreffects, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/gaudieffects -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/gaudieffects, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/pnm -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/pnm, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1
 .28.4/gst/onvif -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/onvif, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/analyticsoverlay -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/analyticsoverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/analytics -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/analytics, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/webp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/webp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/dtls -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/dtls, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/geometrictransform -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/geometrictransform, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/jp2kdecimator -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/jp2kdecimator, directory renamed 
 /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/rtmp2/rtmp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/rtmp2/rtmp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/interfaces -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/interfaces, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/bayer -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/bayer, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/dvbsubenc/libimagequant -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/dvbsubenc/libimagequant, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/adaptivedemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/adaptivedemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/autoconvert -> /usr/src/de
 bug/gstreamer1.0-plugins-bad/1.28.5/gst/autoconvert, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/v4l2codecs/linux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/v4l2codecs/linux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/sndfile -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/sndfile, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/dvbsuboverlay -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/dvbsuboverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/interlace -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/interlace, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/audiobuffersplit -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/audiobuffersplit, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/vulkan/base -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/vulkan/base, directory renamed /usr/src/debug/gstreamer1.
 0-plugins-bad/1.28.4/gst-libs/gst/play -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/play, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/siren -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/siren, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/aes -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/aes, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/proxy -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/proxy, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/bz2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/bz2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/videoframe_audiolevel -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/videoframe_audiolevel, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/dvbsubenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/dvbsubenc, directory renamed /usr/src/debug/gstreame
 r1.0-plugins-bad/1.28.4/gst/accurip -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/accurip, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/ipcpipeline -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/ipcpipeline, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/aiff -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/aiff, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/smoothstreaming -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/smoothstreaming, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/audiomixmatrix -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/audiomixmatrix, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/sys/uvch264 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/uvch264, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/hls -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/hls, directory renamed /usr/src/debug/g
 streamer1.0-plugins-bad/1.28.4/sys/decklink/linux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/sys/decklink/linux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/dash -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/dash, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/vulkan -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/vulkan, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/switchbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/switchbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/rtmp2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/rtmp2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/mse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/mse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins
 -bad/1.28.4/gst/dvdspu -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/dvdspu, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/frei0r -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/frei0r, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/vulkan/xcb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/vulkan/xcb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/inter -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/inter, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/asfmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/asfmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/gdp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/gdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/cuda -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/cuda, directory renamed /usr/src/debug/gstreamer1.0-plugin
 s-bad/1.28.4/gst/id3tag -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/id3tag, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/unixfd -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/unixfd, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/librfb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/librfb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/subenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/subenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/netsim -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/netsim, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/ttml -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/ttml, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/ext/rsvg -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/ext/rsvg, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/smooth -> /usr/src/deb
 ug/gstreamer1.0-plugins-bad/1.28.5/gst/smooth, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/transcoder -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/transcoder, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/freeverb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/freeverb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/player -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/player, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/segmentclip -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/segmentclip, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/videosignal -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/videosignal, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/audio -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/audio, directory renamed /usr/src/debug/gstre
 amer1.0-plugins-bad/1.28.4/gst/audiovisualizers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/audiovisualizers, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst/festival -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst/festival, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/isoff -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/isoff, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.28.4/gst-libs/gst/mse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.28.5/gst-libs/gst/mse
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGSIZE changed from 18755495 to 18765504 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.28.4.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.28.5.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2804.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2804.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2804.0", added "/usr/lib/libgstanalytics-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2804.0", added "/usr/lib/libgstanalytics-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2804.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2804.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2804.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2804.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2804.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2804.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGSIZE changed from 904250 to 908346 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2804.0", added "/usr/lib/libgstcodecs-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2804.0", added "/usr/lib/libgstcodecs-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2804.0", added "/usr/lib/libgstcuda-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2804.0", added "/usr/lib/libgstcuda-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2804.0", added "/usr/lib/libgstdxva-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2804.0", added "/usr/lib/libgstdxva-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2804.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2804.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2804.0", added "/usr/lib/libgstisoff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2804.0", added "/usr/lib/libgstisoff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2804.0", added "/usr/lib/libgstmpegts-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2804.0", added "/usr/lib/libgstmpegts-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2804.0", added "/usr/lib/libgstmse-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2804.0", added "/usr/lib/libgstmse-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2804.0", added "/usr/lib/libgstphotography-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2804.0", added "/usr/lib/libgstphotography-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2804.0", added "/usr/lib/libgstplay-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2804.0", added "/usr/lib/libgstplay-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2804.0", added "/usr/lib/libgstplayer-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2804.0", added "/usr/lib/libgstplayer-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2804.0", added "/usr/lib/libgstsctp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2804.0", added "/usr/lib/libgstsctp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2804.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2804.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2804.0", added "/usr/lib/libgstvulkan-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2804.0", added "/usr/lib/libgstvulkan-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2804.0", added "/usr/lib/libgstwayland-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2804.0", added "/usr/lib/libgstwayland-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2804.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2804.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.28.4" to "1.28.5"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2804.0 to libgstadaptivedemux-1.0.so.0.2805.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2804.0 to libgstanalytics-1.0.so.0.2805.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2804.0 to libgstbadaudio-1.0.so.0.2805.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2804.0 to libgstbasecamerabinsrc-1.0.so.0.2805.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2804.0 to libgstcodecparsers-1.0.so.0.2805.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2804.0 to libgstcodecs-1.0.so.0.2805.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2804.0 to libgstcuda-1.0.so.0.2805.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2804.0 to libgstdxva-1.0.so.0.2805.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2804.0 to libgstinsertbin-1.0.so.0.2805.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2804.0 to libgstisoff-1.0.so.0.2805.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2804.0 to libgstmpegts-1.0.so.0.2805.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2804.0 to libgstmse-1.0.so.0.2805.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2804.0 to libgstphotography-1.0.so.0.2805.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2804.0 to libgstplay-1.0.so.0.2805.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2804.0 to libgstplayer-1.0.so.0.2805.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2804.0 to libgstsctp-1.0.so.0.2805.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2804.0 to libgsturidownloader-1.0.so.0.2805.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2804.0 to libgstvulkan-1.0.so.0.2805.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2804.0 to libgstwayland-1.0.so.0.2805.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2804.0 to libgstwebrtc-1.0.so.0.2805.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2804.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2805.0
  /usr/lib/libgstanalytics-1.0.so.0.2804.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2805.0
  /usr/lib/libgstbadaudio-1.0.so.0.2804.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2805.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2804.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2805.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2804.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2805.0
  /usr/lib/libgstcodecs-1.0.so.0.2804.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2805.0
  /usr/lib/libgstcuda-1.0.so.0.2804.0 moved to /usr/lib/libgstcuda-1.0.so.0.2805.0
  /usr/lib/libgstdxva-1.0.so.0.2804.0 moved to /usr/lib/libgstdxva-1.0.so.0.2805.0
  /usr/lib/libgstinsertbin-1.0.so.0.2804.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2805.0
  /usr/lib/libgstisoff-1.0.so.0.2804.0 moved to /usr/lib/libgstisoff-1.0.so.0.2805.0
  /usr/lib/libgstmpegts-1.0.so.0.2804.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2805.0
  /usr/lib/libgstmse-1.0.so.0.2804.0 moved to /usr/lib/libgstmse-1.0.so.0.2805.0
  /usr/lib/libgstphotography-1.0.so.0.2804.0 moved to /usr/lib/libgstphotography-1.0.so.0.2805.0
  /usr/lib/libgstplay-1.0.so.0.2804.0 moved to /usr/lib/libgstplay-1.0.so.0.2805.0
  /usr/lib/libgstplayer-1.0.so.0.2804.0 moved to /usr/lib/libgstplayer-1.0.so.0.2805.0
  /usr/lib/libgstsctp-1.0.so.0.2804.0 moved to /usr/lib/libgstsctp-1.0.so.0.2805.0
  /usr/lib/libgsturidownloader-1.0.so.0.2804.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2805.0
  /usr/lib/libgstvulkan-1.0.so.0.2804.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2805.0
  /usr/lib/libgstwayland-1.0.so.0.2804.0 moved to /usr/lib/libgstwayland-1.0.so.0.2805.0
  /usr/lib/libgstwebrtc-1.0.so.0.2804.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2805.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstaudio-1.0.so.0.2804.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2804.0 /usr/lib/.debug/libgstfft-1.0.so.0.2804.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2804.0 /usr/lib/.debug/libgstriff-1.0.so.0.2804.0 /usr/lib/.debug/libgstapp-1.0.so.0.2804.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2804.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2804.0 /usr/lib/.debug/libgstgl-1.0.so.0.2804.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2804.0 /usr/lib/.debug/libgsttag-1.0.so.0.2804.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2804.0", added "/usr/lib/.debug/libgstpbutils-1.0.so.0.2805.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2805.0 /usr/lib/.debug/libgstriff-1.0.so.0.2805.0 /usr/lib/.debug/libgstapp-1.0.so.0.2805.0 /usr/lib/.debug/libgstfft-1.0.so.0.2805.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2805.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2805.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2805.0 /usr/lib/.d
 ebug/libgstgl-1.0.so.0.2805.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2805.0 /usr/lib/.debug/libgsttag-1.0.so.0.2805.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 21636040 to 21643824 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ar: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ar: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-kk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-kk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl/utils -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/gl/utils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/fft -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/fft, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/videotestsrc -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/videotestsrc, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/volume -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/volume, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/audiotestsrc -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/audiotestsrc, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/rawparse -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/rawparse,
  directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/subparse -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/subparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/gl/effects -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/gl/effects, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/overlaycomposition -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/overlaycomposition, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/audioconvert -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/audioconvert, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/playback -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/playback, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/compositor -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/compositor, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/rtsp -> /usr/src/
 debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/rtsp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl/egl -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/gl/egl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/audiorate -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/audiorate, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/videoconvertscale -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/videoconvertscale, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/videorate -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/videorate, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/pbutils -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/pbutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/allocators -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/allocators, d
 irectory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/riff -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/riff, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/tcp -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/tcp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/audio -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/audio, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/dsd -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/dsd, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/tools -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/tools, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/app -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/app, dire
 ctory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/vorbis -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/vorbis, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/gl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/audiomixer -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/audiomixer, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/theora -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/theora, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/video -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/video, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/encoding -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/encoding, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl/x11 -> /usr/src/debug/gstreamer1.0-plugin
 s-base/1.28.5/gst-libs/gst/gl/x11, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/ogg -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/ogg, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl/wayland -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/gl/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/alsa -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/alsa, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/tag -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/tag, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/sys/ximage -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/sys/ximage, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/typefind -> /usr
 /src/debug/gstreamer1.0-plugins-base/1.28.5/gst/typefind, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/gl -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/gl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/adder -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/adder, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/pbtypes -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/pbtypes, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/ext/pango -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/ext/pango, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/gl/glprototypes -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/gl/glprototypes, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/gio -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/gio, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst/audioresa
 mple -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst/audioresample, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/sdp -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/sdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/gst-libs/gst/app -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/gst-libs/gst/app, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.28.4/sys/xvimage -> /usr/src/debug/gstreamer1.0-plugins-base/1.28.5/sys/xvimage
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 14753497 to 14757307 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGSIZE changed from 136784 to 136848 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.28.4.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.28.5.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2804.0", added "/usr/lib/libgstallocators-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2804.0", added "/usr/lib/libgstallocators-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2804.0", added "/usr/lib/libgstapp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2804.0", added "/usr/lib/libgstapp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2804.0", added "/usr/lib/libgstaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2804.0", added "/usr/lib/libgstaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2804.0", added "/usr/lib/libgstfft-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2804.0", added "/usr/lib/libgstfft-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2804.0", added "/usr/lib/libgstgl-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2804.0", added "/usr/lib/libgstgl-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2804.0", added "/usr/lib/libgstpbutils-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2804.0", added "/usr/lib/libgstpbutils-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2804.0", added "/usr/lib/libgstriff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2804.0", added "/usr/lib/libgstriff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2804.0", added "/usr/lib/libgstrtp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2804.0", added "/usr/lib/libgstrtp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2804.0", added "/usr/lib/libgstrtsp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2804.0", added "/usr/lib/libgstrtsp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2804.0", added "/usr/lib/libgstsdp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2804.0", added "/usr/lib/libgstsdp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2804.0", added "/usr/lib/libgsttag-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2804.0", added "/usr/lib/libgsttag-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2804.0", added "/usr/lib/libgstvideo-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2804.0", added "/usr/lib/libgstvideo-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.28.4" to "1.28.5"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2804.0 to libgstallocators-1.0.so.0.2805.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2804.0 to libgstapp-1.0.so.0.2805.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2804.0 to libgstaudio-1.0.so.0.2805.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2804.0 to libgstfft-1.0.so.0.2805.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2804.0 to libgstgl-1.0.so.0.2805.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2804.0 to libgstpbutils-1.0.so.0.2805.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2804.0 to libgstriff-1.0.so.0.2805.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2804.0 to libgstrtp-1.0.so.0.2805.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2804.0 to libgstrtsp-1.0.so.0.2805.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2804.0 to libgstsdp-1.0.so.0.2805.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2804.0 to libgsttag-1.0.so.0.2805.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2804.0 to libgstvideo-1.0.so.0.2805.0
  /usr/lib/libgstallocators-1.0.so.0.2804.0 moved to /usr/lib/libgstallocators-1.0.so.0.2805.0
  /usr/lib/libgstapp-1.0.so.0.2804.0 moved to /usr/lib/libgstapp-1.0.so.0.2805.0
  /usr/lib/libgstaudio-1.0.so.0.2804.0 moved to /usr/lib/libgstaudio-1.0.so.0.2805.0
  /usr/lib/libgstfft-1.0.so.0.2804.0 moved to /usr/lib/libgstfft-1.0.so.0.2805.0
  /usr/lib/libgstgl-1.0.so.0.2804.0 moved to /usr/lib/libgstgl-1.0.so.0.2805.0
  /usr/lib/libgstpbutils-1.0.so.0.2804.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2805.0
  /usr/lib/libgstriff-1.0.so.0.2804.0 moved to /usr/lib/libgstriff-1.0.so.0.2805.0
  /usr/lib/libgstrtp-1.0.so.0.2804.0 moved to /usr/lib/libgstrtp-1.0.so.0.2805.0
  /usr/lib/libgstrtsp-1.0.so.0.2804.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2805.0
  /usr/lib/libgstsdp-1.0.so.0.2804.0 moved to /usr/lib/libgstsdp-1.0.so.0.2805.0
  /usr/lib/libgsttag-1.0.so.0.2804.0 moved to /usr/lib/libgsttag-1.0.so.0.2805.0
  /usr/lib/libgstvideo-1.0.so.0.2804.0 moved to /usr/lib/libgstvideo-1.0.so.0.2805.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 24787088 to 24793336 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ar: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ar: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-kk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-kk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGSIZE changed from 375672 to 379768 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/monoscope -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/monoscope, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/effectv -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/effectv, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/autodetect -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/autodetect, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/wavparse -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/wavparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/jpeg -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/jpeg, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/adaptivedemux2/dash -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/adaptivedemux2/dash, directory renamed /
 usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/law -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/law, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/y4m -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/y4m, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/gdk_pixbuf -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/gdk_pixbuf, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/replaygain -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/replaygain, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/libpng -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/libpng, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/id3demux -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/id3demux, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/icydemux -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/icydemux, directory renamed /usr/s
 rc/debug/gstreamer1.0-plugins-good/1.28.4/gst/multifile -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/multifile, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/apetag -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/apetag, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/flx -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/flx, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/flv -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/flv, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/videocrop -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/videocrop, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/rtsp -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/rtsp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/xingmux -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/xingmux, directory renamed /usr/src/debug/gstreamer1
 .0-plugins-good/1.28.4/gst/audioparsers -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/audioparsers, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/goom -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/goom, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/auparse -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/auparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/imagefreeze -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/imagefreeze, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/cutter -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/cutter, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/soup -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/soup, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/audiofx -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/audiofx, directory renamed /usr/src/debug/gstreamer
 1.0-plugins-good/1.28.4/gst/isomp4 -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/isomp4, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/adaptivedemux2/mss -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/adaptivedemux2/mss, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/mpg123 -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/mpg123, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/deinterlace -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/deinterlace, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/wavenc -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/wavenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/flac -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/flac, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/sys/v4l2/ext -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/sys/v4l2/ext, directory renamed /usr/sr
 c/debug/gstreamer1.0-plugins-good/1.28.4/ext/taglib -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/taglib, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/adaptivedemux2 -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/adaptivedemux2, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/videomixer -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/videomixer, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/videobox -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/videobox, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/lame -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/lame, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/soup/stub -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/soup/stub, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/spectrum -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/spectrum, director
 y renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/alpha -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/alpha, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/speex -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/speex, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/dtmf -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/dtmf, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/goom2k1 -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/goom2k1, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/matroska -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/matroska, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/smpte -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/smpte, directory renamed /us
 r/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/equalizer -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/equalizer, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/shapewipe -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/shapewipe, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/sys/v4l2 -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/sys/v4l2, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/sys/ximage -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/sys/ximage, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/level -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/level, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/avi -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/avi, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/rtpmanager -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/rtpmanager, directory renamed /usr/src/deb
 ug/gstreamer1.0-plugins-good/1.28.4/gst/deinterlace/tvtime -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/deinterlace/tvtime, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/deinterlace/tvtime/tomsmocomp -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/deinterlace/tvtime/tomsmocomp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/interleave -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/interleave, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/cairo -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/cairo, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/udp -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/udp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/sys/oss -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.
 5/sys/oss, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/adaptivedemux2/hls -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/adaptivedemux2/hls, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/multipart -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/multipart, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/gst/videofilter -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/gst/videofilter, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.28.4/ext/pulse -> /usr/src/debug/gstreamer1.0-plugins-good/1.28.5/ext/pulse
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13828574 to 13839583 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4m: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4m: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.28.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.28.5.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGSIZE changed from 883992 to 884912 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ar: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ar: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-kk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-kk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.4/gst/realmedia -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.5/gst/realmedia, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.4/gst/dvdlpcmdec -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.5/gst/dvdlpcmdec, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.4/gst/dvdsub -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.5/gst/dvdsub, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.4/gst/asfdemux -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.28.5/gst/asfdemux
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGSIZE changed from 448674 to 449265 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.28.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.28.5.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2804.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-rtsp-server/1.28.4/gst/rtsp-sink -> /usr/src/debug/gstreamer1.0-rtsp-server/1.28.5/gst/rtsp-sink, directory renamed /usr/src/debug/gstreamer1.0-rtsp-server/1.28.4/gst/rtsp-server -> /usr/src/debug/gstreamer1.0-rtsp-server/1.28.5/gst/rtsp-server
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.28.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.28.5.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2804.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2804.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.28.4" to "1.28.5"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2804.0 to libgstrtspserver-1.0.so.0.2805.0
  /usr/lib/libgstrtspserver-1.0.so.0.2804.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2805.0

--===============1538051071077635306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2804.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2804.0", added "/usr/lib/libgstanalytics-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2804.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2804.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2804.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2804.0", added "/usr/lib/libgstcodecs-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2804.0", added "/usr/lib/libgstcuda-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2804.0", added "/usr/lib/libgstdxva-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2804.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2804.0", added "/usr/lib/libgstisoff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2804.0", added "/usr/lib/libgstmpegts-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2804.0", added "/usr/lib/libgstmse-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2804.0", added "/usr/lib/libgstphotography-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2804.0", added "/usr/lib/libgstplay-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2804.0", added "/usr/lib/libgstplayer-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2804.0", added "/usr/lib/libgstsctp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2804.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2804.0", added "/usr/lib/libgstvulkan-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2804.0", added "/usr/lib/libgstwayland-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2804.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2805.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2804.0 to libgstadaptivedemux-1.0.so.0.2805.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2804.0 to libgstanalytics-1.0.so.0.2805.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2804.0 to libgstbadaudio-1.0.so.0.2805.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2804.0 to libgstbasecamerabinsrc-1.0.so.0.2805.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2804.0 to libgstcodecparsers-1.0.so.0.2805.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2804.0 to libgstcodecs-1.0.so.0.2805.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2804.0 to libgstcuda-1.0.so.0.2805.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2804.0 to libgstdxva-1.0.so.0.2805.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2804.0 to libgstinsertbin-1.0.so.0.2805.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2804.0 to libgstisoff-1.0.so.0.2805.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2804.0 to libgstmpegts-1.0.so.0.2805.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2804.0 to libgstmse-1.0.so.0.2805.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2804.0 to libgstphotography-1.0.so.0.2805.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2804.0 to libgstplay-1.0.so.0.2805.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2804.0 to libgstplayer-1.0.so.0.2805.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2804.0 to libgstsctp-1.0.so.0.2805.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2804.0 to libgsturidownloader-1.0.so.0.2805.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2804.0 to libgstvulkan-1.0.so.0.2805.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2804.0 to libgstwayland-1.0.so.0.2805.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2804.0 to libgstwebrtc-1.0.so.0.2805.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2804.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2805.0
  /usr/lib/libgstanalytics-1.0.so.0.2804.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2805.0
  /usr/lib/libgstbadaudio-1.0.so.0.2804.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2805.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2804.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2805.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2804.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2805.0
  /usr/lib/libgstcodecs-1.0.so.0.2804.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2805.0
  /usr/lib/libgstcuda-1.0.so.0.2804.0 moved to /usr/lib/libgstcuda-1.0.so.0.2805.0
  /usr/lib/libgstdxva-1.0.so.0.2804.0 moved to /usr/lib/libgstdxva-1.0.so.0.2805.0
  /usr/lib/libgstinsertbin-1.0.so.0.2804.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2805.0
  /usr/lib/libgstisoff-1.0.so.0.2804.0 moved to /usr/lib/libgstisoff-1.0.so.0.2805.0
  /usr/lib/libgstmpegts-1.0.so.0.2804.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2805.0
  /usr/lib/libgstmse-1.0.so.0.2804.0 moved to /usr/lib/libgstmse-1.0.so.0.2805.0
  /usr/lib/libgstphotography-1.0.so.0.2804.0 moved to /usr/lib/libgstphotography-1.0.so.0.2805.0
  /usr/lib/libgstplay-1.0.so.0.2804.0 moved to /usr/lib/libgstplay-1.0.so.0.2805.0
  /usr/lib/libgstplayer-1.0.so.0.2804.0 moved to /usr/lib/libgstplayer-1.0.so.0.2805.0
  /usr/lib/libgstsctp-1.0.so.0.2804.0 moved to /usr/lib/libgstsctp-1.0.so.0.2805.0
  /usr/lib/libgsturidownloader-1.0.so.0.2804.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2805.0
  /usr/lib/libgstvulkan-1.0.so.0.2804.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2805.0
  /usr/lib/libgstwayland-1.0.so.0.2804.0 moved to /usr/lib/libgstwayland-1.0.so.0.2805.0
  /usr/lib/libgstwebrtc-1.0.so.0.2804.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2805.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2804.0", added "/usr/lib/libgstallocators-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2804.0", added "/usr/lib/libgstapp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2804.0", added "/usr/lib/libgstaudio-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2804.0", added "/usr/lib/libgstfft-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2804.0", added "/usr/lib/libgstgl-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2804.0", added "/usr/lib/libgstpbutils-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2804.0", added "/usr/lib/libgstriff-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2804.0", added "/usr/lib/libgstrtp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2804.0", added "/usr/lib/libgstrtsp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2804.0", added "/usr/lib/libgstsdp-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2804.0", added "/usr/lib/libgsttag-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2804.0", added "/usr/lib/libgstvideo-1.0.so.0.2805.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2804.0 to libgstallocators-1.0.so.0.2805.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2804.0 to libgstapp-1.0.so.0.2805.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2804.0 to libgstaudio-1.0.so.0.2805.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2804.0 to libgstfft-1.0.so.0.2805.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2804.0 to libgstgl-1.0.so.0.2805.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2804.0 to libgstpbutils-1.0.so.0.2805.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2804.0 to libgstriff-1.0.so.0.2805.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2804.0 to libgstrtp-1.0.so.0.2805.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2804.0 to libgstrtsp-1.0.so.0.2805.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2804.0 to libgstsdp-1.0.so.0.2805.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2804.0 to libgsttag-1.0.so.0.2805.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2804.0 to libgstvideo-1.0.so.0.2805.0
  /usr/lib/libgstallocators-1.0.so.0.2804.0 moved to /usr/lib/libgstallocators-1.0.so.0.2805.0
  /usr/lib/libgstapp-1.0.so.0.2804.0 moved to /usr/lib/libgstapp-1.0.so.0.2805.0
  /usr/lib/libgstaudio-1.0.so.0.2804.0 moved to /usr/lib/libgstaudio-1.0.so.0.2805.0
  /usr/lib/libgstfft-1.0.so.0.2804.0 moved to /usr/lib/libgstfft-1.0.so.0.2805.0
  /usr/lib/libgstgl-1.0.so.0.2804.0 moved to /usr/lib/libgstgl-1.0.so.0.2805.0
  /usr/lib/libgstpbutils-1.0.so.0.2804.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2805.0
  /usr/lib/libgstriff-1.0.so.0.2804.0 moved to /usr/lib/libgstriff-1.0.so.0.2805.0
  /usr/lib/libgstrtp-1.0.so.0.2804.0 moved to /usr/lib/libgstrtp-1.0.so.0.2805.0
  /usr/lib/libgstrtsp-1.0.so.0.2804.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2805.0
  /usr/lib/libgstsdp-1.0.so.0.2804.0 moved to /usr/lib/libgstsdp-1.0.so.0.2805.0
  /usr/lib/libgsttag-1.0.so.0.2804.0 moved to /usr/lib/libgsttag-1.0.so.0.2805.0
  /usr/lib/libgstvideo-1.0.so.0.2804.0 moved to /usr/lib/libgstvideo-1.0.so.0.2805.0
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2804.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2805.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2804.0 to libgstrtspserver-1.0.so.0.2805.0
  /usr/lib/libgstrtspserver-1.0.so.0.2804.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2805.0

--===============1538051071077635306==--

