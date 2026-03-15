Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08D3EFCBB6
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28793.1773582112375308037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gEwmcBcY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Bu/eSuaU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019cf1bb545c-6e857dc2-db5e-425c-b25a-466e08b71203-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W1RDlDXo+kVgKPqNQWTR63G1pQGGgb0hFVIPBg8X6nY=;
	b=gEwmcBcYmpEykEF9xYEIF+lYlC2tEXDCPvj4ACYKSsiFVLSjJyXvTzPRXORioivp
	IQCNGEPO8A+tF7fJ6C8u3u5Zx2C3nOeGuvLe1ogmMgK9EEuHdt2qJEPHnkxJIrCZwL1
	qatYvHZnsdx4K68XV4KCsOevQhsi+4nChLhCcQ58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W1RDlDXo+kVgKPqNQWTR63G1pQGGgb0hFVIPBg8X6nY=;
	b=Bu/eSuaU9d6VVYWndXAyWoVjfq9ih+3XsDt6vX99nZjoXScAxLHLnleJk4VV7nu9
	NuluNxv6S81jbGaGHyMcEDmcpcTwHKNuAnOANtUak6kaWbB92E2Ao76KlV4ixMX+kVj
	/YgLwtPjQACjpMERRvexzH7aoBkWSoWBnhdGJtnA=
Content-Type: multipart/mixed; boundary="===============8701137729931981190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrading to 1.28.1,1.28.1,1.28.1,1.28.1,1.28.1 FAILED
Message-ID: <0101019cf1bb545c-6e857dc2-db5e-425c-b25a-466e08b71203-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233124

--===============8701137729931981190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base* to *1.28.1,1.28.1,1.28.1,1.28.1,1.28.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-ugly-g.patch
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
From 8fdc861f6c1c09fa514717f8c5bb5a9671e525eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 05:55:39 +0000
Subject: [PATCH] 
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrade 1.26.9 -> 1.28.1,1.26.9 -> 1.28.1,1.26.9 -> 1.28.1,1.26.9 ->
 1.28.1,1.26.9 -> 1.28.1

---
 ...x-maybe-uninitialized-warnings-when-compiling-with.patch | 4 ++--
 .../0002-avoid-including-sys-poll.h-directly.patch          | 2 +-
 ...encv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 4 ++--
 ...ins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.1.bb} | 2 +-
 ...ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 6 +++---
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch      | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch        | 2 +-
 ...s-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.1.bb} | 2 +-
 ...s-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.1.bb} | 2 +-
 ...s-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.1.bb} | 2 +-
 ...-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.1.bb} | 2 +-
 11 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.1.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.1.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.1.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.1.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..180c4c9604 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From ca748a8f5b949d34b44d69657a4cd47c2250689f Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,7 +11,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index ac8c378..3fc5298 100644
+index d91cc3f..c9058cd 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..a716d2a963 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 6dd0273b87c58fef0e64c250e84a66e50c07507d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..8b248c70fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From d19ca6f2268c40959f43f2d0429e33d60b5b6311 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb
index 4a9cb37dd8..f717c1c3a6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a96bfb68c53a7c9ab1ae279eac7c101f4204fb5c0e4729683b2be64261707446"
+SRC_URI[sha256sum] = "56c1593787f8b5550893d59e4ff29e6bcccf34973316fa55e34ce493e04313a2"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..92998a3b7f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From 24a91bc8bc25e8b1d11e6b5c21368f41576c5536 Mon Sep 17 00:00:00 2001
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
index bf1e2a89e3..7bc46ff480 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 03c3f8b0e65b18a2fb2ebe17f8bf23a8bdfd621d Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..cf26691103 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 590374e6923bbd8215f76a022d3925e4b96b0487 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb
index 74b6f2308d..f1faecfe0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083a921ef71dd000a"
+SRC_URI[sha256sum] = "1446a4c2a92ff5d78d88e85a599f0038441d53333236f0c72d72f21a9c132497"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb
index d77e52d74e..5cf838451f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f38566fb53ae56b7019a039475311756a28eb978a781154d67813dcb551ff5fe"
+SRC_URI[sha256sum] = "738e26aee41b7a62050e40b81adc017a110a7f32d1ec49fa6a0300846c44368d"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb
index e04bfcc81b..e515e77f50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22fd520d5d1bacb4d"
+SRC_URI[sha256sum] = "4082f3cb063fccc3ffc04e5ab0854bafde82d1b373eb3c9eaa28115dd3f95a78"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb
index ac6b52ee46..64d3538429 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "67e92e9a5b0f2b51eb571cc893b80da2ae2374f19b05d381d1e364393fe12654"
+SRC_URI[sha256sum] = "6cd0e86af20cfb749bdc24d2f5c30f4e60a3e8d198ae4e02e754b9937bdbf832"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============8701137729931981190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-ugly-g.patch"

RnJvbSA4ZmRjODYxZjZjMWMwOWZhNTE0NzE3ZjhjNWJiNWE5NjcxZTUyNWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDU6NTU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5LGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kLGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2U6CiB1cGdyYWRlIDEuMjYuOSAtPiAxLjI4LjEsMS4yNi45IC0+IDEuMjgu
MSwxLjI2LjkgLT4gMS4yOC4xLDEuMjYuOSAtPgogMS4yOC4xLDEuMjYuOSAtPiAxLjI4LjEKCi0t
LQogLi4ueC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgu
cGF0Y2ggfCA0ICsrLS0KIC4uLi8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVj
dGx5LnBhdGNoICAgICAgICAgIHwgMiArLQogLi4uZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2
LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggfCA0ICsrLS0KIC4uLmlucy1iYWRfMS4yNi45
LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjEuYmJ9IHwgMiArLQogLi4uRU5H
UjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggfCA2
ICsrKy0tLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5n
LnBhdGNoICAgICAgfCAyICstCiAuLi4vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlz
LWluY2x1ZGVkLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLnMtYmFzZV8xLjI2LjkuYmIgPT4gZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI4LjEuYmJ9IHwgMiArLQogLi4ucy1nb29kXzEuMjYu
OS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjguMS5iYn0gfCAyICstCiAuLi5z
LXVnbHlfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4xLmJifSB8
IDIgKy0KIC4uLi1zZXJ2ZXJfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI4LjEuYmJ9IHwgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZF8xLjI4LjEuYmJ9ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlXzEuMjguMS5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiID0+
IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC4xLmJifSAoOTclKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjEuYmJ9ICg5NCUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI4LjEuYmJ9
ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5p
bmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlh
bGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAppbmRleCAzMDdkNjY5NjQ1
Li4xODBjNGM5NjA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQt
d2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJl
LXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZDI0YmI5NDllNTQ3YTBhZDY5ZjNmNDdlNGNmMjYyYTc1YmI5ZmU3MyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2E3NDhhOGY1Yjk0OWQzNGI0NGQ2OTY1N2E0
Y2Q0N2MyMjUwNjg5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3Vy
ZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI2IEphbiAyMDE2IDE1OjE2OjAx
IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeCBtYXliZS11bmluaXRpYWxpemVkIHdhcm5pbmdz
IHdoZW4gY29tcGlsaW5nIHdpdGggLU9zCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6
IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9nc3QtbGlicy9nc3Qv
Y29kZWNwYXJzZXJzL2dzdHZjMXBhcnNlci5jIGIvZ3N0LWxpYnMvZ3N0L2NvZGVjcGFyc2Vycy9n
c3R2YzFwYXJzZXIuYwotaW5kZXggYWM4YzM3OC4uM2ZjNTI5OCAxMDA2NDQKK2luZGV4IGQ5MWNj
M2YuLmM5MDU4Y2QgMTAwNjQ0CiAtLS0gYS9nc3QtbGlicy9nc3QvY29kZWNwYXJzZXJzL2dzdHZj
MXBhcnNlci5jCiArKysgYi9nc3QtbGlicy9nc3QvY29kZWNwYXJzZXJzL2dzdHZjMXBhcnNlci5j
CiBAQCAtMTczMiw3ICsxNzMyLDcgQEAgZ3N0X3ZjMV9wYXJzZV9zZXF1ZW5jZV9sYXllciAoY29u
c3QgZ3VpbnQ4ICogZGF0YSwgZ3NpemUgc2l6ZSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1p
bmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRp
bmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaAppbmRleCA3ZGE4OTk0ZTNkLi5hNzE2ZDJhOTYz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHku
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MjgyMzgxMjlhOGE5MWNhZDg1NzAyM2QyZTcxMzE1
OTEzMjE0MDlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZGQwMjczYjg3YzU4ZmVm
MGU2NGMyNTBlODRhNjZlNTBjMDc1MDdkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAx
NiAxODowNTo0MSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9w
b2xsLmg+IGRpcmVjdGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2lu
Zy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVz
b2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDFl
ZGNmMDdjMTQuLjhiMjQ4YzcwZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1t
aXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1v
cGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZjdhMWM1NTkxZTI3NjgxZjI5NGFlNWVkZjBmMzI2ODkx
OThhYmZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMTljYTZmMjI2OGM0MDk1OWY0
M2YyZDA0MjllMzNkNjBiNWI2MzExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5k
cmV5IFpoaXpoaWtpbiA8YW5kcmV5LnpAZ21haWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAy
MCAxMDoyMjozNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2lu
ZyBvcGVuY3YgZGF0YSBkaXIgaW4geW9jdG8gYnVpbGQKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVk
LW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZ3N0LWxpYnMvZ3N0L29w
ZW5jdi9tZXNvbi5idWlsZCBiL2dzdC1saWJzL2dzdC9vcGVuY3YvbWVzb24uYnVpbGQKLWluZGV4
IDY0ZTkxM2UuLjQyYTA5NTggMTAwNjQ0CitpbmRleCA2MGNiMTJiLi40MDQ2YjcwIDEwMDY0NAog
LS0tIGEvZ3N0LWxpYnMvZ3N0L29wZW5jdi9tZXNvbi5idWlsZAogKysrIGIvZ3N0LWxpYnMvZ3N0
L29wZW5jdi9tZXNvbi5idWlsZAogQEAgLTYxLDYgKzYxLDkgQEAgZ3N0b3BlbmN2X2NhcmdzICs9
IFsnLURPUEVOQ1ZfUFJFRklYPSInICsgb3BlbmN2X3ByZWZpeCArICciJ10KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhZF8xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZF8xLjI2LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC4xLmJiCmluZGV4IDRhOWNiMzdkZDguLmY3
MTdjMWMzYTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yOC4xLmJiCkBAIC0x
MCw3ICsxMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3Jn
L3NyYy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMtYmFkCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4t
eW9jdG8tYnVpbC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJh
OTZiZmI2OGM1M2E3YzlhYjFhZTI3OWVhYzdjMTAxZjQyMDRmYjVjMGU0NzI5NjgzYjJiZTY0MjYx
NzA3NDQ2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU2YzE1OTM3ODdmOGI1NTUwODkzZDU5ZTRm
ZjI5ZTZiY2NjZjM0OTczMzE2ZmE1NWUzNGNlNDkzZTA0MzEzYTIiCiAKIFMgPSAiJHtVTlBBQ0tE
SVJ9L2dzdC1wbHVnaW5zLWJhZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAz
MTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAw
MDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0
Y2gKaW5kZXggNzE5YzczZDNlMy4uOTI5OThhM2I3ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdS
MDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1j
YXBzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMzdmMDA2MzEwM2U5OGY1MTA5MTMyZWEz
MDJiOTE5YjkyZTI2YTM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNGE5MWJjOGJj
MjVlOGIxZDExZTZiNWMyMTM2OGY0MTU3NmM1NTM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogemhvdW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29tPgogRGF0ZTogV2VkLCAxNCBNYXkg
MjAxNCAxMDoxNjoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBFTkdSMDAzMTI1MTU6IGdldCBj
YXBzIGZyb20gc3JjIHBhZCB3aGVuIHF1ZXJ5IGNhcHMKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBkaWZmIC0tZ2l0IGEv
Z3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jIGIvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdk
ZW11eC5jCiBvbGQgbW9kZSAxMDA2NDQKIG5ldyBtb2RlIDEwMDc1NQotaW5kZXggOTc1ZmU4My4u
ZGY4Mjg0MAoraW5kZXggMTZiZjAwMS4uZTE3YTE0NAogLS0tIGEvZ3N0LWxpYnMvZ3N0L3RhZy9n
c3R0YWdkZW11eC5jCiArKysgYi9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMKLUBAIC0x
Nzk2LDYgKzE3OTYsMTkgQEAgZ3N0X3RhZ19kZW11eF9wYWRfcXVlcnkgKEdzdFBhZCAqIHBhZCwg
R3N0T2JqZWN0ICogcGFyZW50LCBHc3RRdWVyeSAqIHF1ZXJ5KQorQEAgLTE3OTcsNiArMTc5Nywx
OSBAQCBnc3RfdGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFkICogcGFkLCBHc3RPYmplY3QgKiBw
YXJlbnQsIEdzdFF1ZXJ5ICogcXVlcnkpCiAgICAgICAgfQogICAgICAgIGJyZWFrOwogICAgICB9
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFy
c2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJz
aW5nLnBhdGNoCmluZGV4IGJmMWUyYTg5ZTMuLjdiYzQ2ZmY0ODAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAw
MDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
LzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBmODkyZjBiZThhZTg4YWNjNjQ4MmY0YjlhOWE0ZGI1ZjAzYjdhZGY4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwM2MzZjhiMGU2NWIxOGEyZmIyZWJlMTdm
OGJmMjNhOGJkZmQ2MjFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2tlIFdh
bmcgPG1pbmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5IE1hciAyMDE1IDE0
OjE3OjEwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNlOiBlbmhhbmNlIFNTQSB0ZXh0
IGxpbmVzIHBhcnNpbmcuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmln
LmgtaXMtaW5jbHVkZWQucGF0Y2gKaW5kZXggMWE5ODhiOTlkZS4uY2YyNjY5MTEwMyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmYwNmY0YjJmMTNmMDI4MjUwMTg5MjI1YTQ2YTM5ZjQw
MjQyODkzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTkwMzc0ZTY5MjNiYmQ4MjE1
Zjc2YTAyMmQzOTI1ZTRiOTZiMDQ4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENh
cmxvcyBSYWZhZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBUdWUsIDIxIE1h
eSAyMDE5IDE0OjAxOjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZpdi1mYjogTWFrZSBzdXJl
IGNvbmZpZy5oIGlzIGluY2x1ZGVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIgYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI4
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi45LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZV8xLjI4LjEuYmIKaW5kZXggNzRiNmYyMzA4ZC4uZjFmYWVjZmUwYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2VfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjguMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMt
YmFzZS9nc3QtcGx1Z2lucy1iYQogICAgICAgICAgICBmaWxlOi8vMDAwMy12aXYtZmItTWFrZS1z
dXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
c3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExZGI0ZWM5YWU1YmUyMTk0ZmY4Y2NmMmI1ZmVj
ZGMwNjkyNTJmZTQ0MTY5MjFiMDgzYTkyMWVmNzFkZDAwMGEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTQ0NmE0YzJhOTJmZjVkNzhkODhlODVhNTk5ZjAwMzg0NDFkNTMzMzMyMzZmMGM3MmQ3MmYy
MWE5YzEzMjQ5NyIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIK
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC4xLmJiCmlu
ZGV4IGQ3N2U1MmQ3NGUuLjVjZjgzODQ1MWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuOS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI4LjEuYmIKQEAgLTYsNyArNiw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3QtcGx1Z2lucy1nb29kLy0vaXNzdWVzCiAK
IFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1
Z2lucy1nb29kL2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjM4NTY2ZmI1M2FlNTZiNzAxOWEwMzk0NzUzMTE3NTZhMjhlYjk3OGE3ODExNTRk
Njc4MTNkY2I1NTFmZjVmZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MzhlMjZhZWU0MWI3YTYy
MDUwZTQwYjgxYWRjMDE3YTExMGE3ZjMyZDFlYzQ5ZmE2YTAzMDA4NDZjNDQzNjhkIgogCiBTID0g
IiR7VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseV8xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVn
bHlfMS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjEuYmIKaW5kZXggZTA0YmZjYzgxYi4uZTUx
NWU3N2Y1MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguMS5iYgpAQCAt
MTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgICAgICAgICBodHRwczovL2dzdHJlYW1l
ci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLXVnbHkvZ3N0LXBsdWdpbnMtdWdseS0k
e1BWfS50YXIueHogXAogICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTg0
ZTRjNmU3NjViYzQ2M2VkODA2YjIyNjNjYjliMmFhYTNhNjU0MTVkZjBhM2MyMmZkNTIwZDVkMWJh
Y2I0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MDgyZjNjYjA2M2ZjY2MzZmZjMDRlNWFiMDg1
NGJhZmRlODJkMWIzNzNlYjNjOWVhYTI4MTE1ZGQzZjk1YTc4IgogCiBTID0gIiR7VU5QQUNLRElS
fS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuOS5iYiBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi45LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0
c3Atc2VydmVyXzEuMjguMS5iYgppbmRleCBhYzZiNTJlZTQ2Li42NGQzNTM4NDI5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3At
c2VydmVyXzEuMjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBQTlJF
QUwgPSAiZ3N0LXJ0c3Atc2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI2N2U5MmU5YTViMGYyYjUxZWI1NzFjYzg5M2I4MGRhMmFlMjM3
NGYxOWIwNWQzODFkMWUzNjQzOTNmZTEyNjU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZjZDBl
ODZhZjIwY2ZiNzQ5YmRjMjRkMmY1YzMwZjRlNjBhM2U4ZDE5OGFlNGUwMmU3NTRiOTkzN2JkYmY4
MzIiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============8701137729931981190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-db045f0a204ad18cdc101e749f4c17c2d1df68fc"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:db045f0a204ad18cdc101e749f4c17c2d1df68fc"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 541 Local 481 Mirrors 0 Missed 60 Current 966 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3177 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3429 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_recipe_qa: Started
NOTE: Running task 3626 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3627 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3628 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3629 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_write_config: Started
NOTE: Running task 3885 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_write_config)
NOTE: Running task 3886 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_write_config)
NOTE: Running task 3887 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_write_config)
NOTE: Running task 3888 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4006 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 4007 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_unpack)
NOTE: Running task 4008 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4009 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4010 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_fetch)
NOTE: Running task 4011 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_fetch: Started
NOTE: Running task 4012 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_fetch)
NOTE: Running task 4013 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 4014 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_unpack)
NOTE: Running task 4015 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_fetch: Started
NOTE: Running task 4016 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_unpack: Started
NOTE: Running task 4017 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_unpack: Started
NOTE: Running task 4018 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4019 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_unpack: Started
NOTE: Running task 4020 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4021 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4022 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4023 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4024 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4025 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4026 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4027 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4028 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4029 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4030 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4031 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4032 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4033 of 4105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-
 core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47
 .bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh
 /build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuil
 d/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'u
 til-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native
 ', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=opengl,gles2 -Dgl_platform=egl,glx -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/sources/gst-plugins-base-1.28.1
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/build
| Build type: cross build
| Project name: gst-plugins-base
| Project version: 1.28.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-g++ (GCC) 15.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot ld.bfd 2.46
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
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency valgrind found: NO (tried pkgconfig)
| Run-time dependency libdrm found: YES 2.4.131
| Run-time dependency x11 found: YES 1.8.13
| Run-time dependency gio-2.0 found: YES 2.86.4
| Run-time dependency gio-unix-2.0 found: YES 2.86.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.86.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-plugins-base-1.28.1/meson.build:383:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/build/meson-logs/meson-log.txt
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
| ../sources/gst-plugins-base-1.28.1/meson.build:383:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851, line 176
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851, line 189
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4033 tasks of which 3995 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315055521.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315055521.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/log.do_configure.1699851
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.28.1-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-plugins-base-1.28.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.1699851' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/log.do_configure.1699851
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure) failed with exit code '1'

--===============8701137729931981190==--

