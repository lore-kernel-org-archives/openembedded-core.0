Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4DAEED62C
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102964.1767267470123367575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xOTpOiG5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rCj3x9hU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b79598793-21914b3a-64b2-4704-b5f8-f5a3b7c67b08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267469;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dN/pjjj5iaLOrLfjrOOnrMecNrDGZooAc3pf+4sp+gs=;
	b=xOTpOiG5far3rZBNhBlSIKg7xneLB/XzF5AXfKfyPlfZKoyLVwMgKBYOpMPkVP9C
	U7PoOZvYELSof7KlWsxGOA1NXxrNOpxairNnX9GJf0hqG2RrWheNAv8xWmwlEYfkUkQ
	G/Bh1Uhc9QhjWHmew2gY+gvrL0+DqogAyX/Aw/Zk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267469;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dN/pjjj5iaLOrLfjrOOnrMecNrDGZooAc3pf+4sp+gs=;
	b=rCj3x9hUdwUVLYaowzKD1hfV7FqAfdzOVIf4hVoe7cFg3O3lVeAsGh4BxZUzHGMw
	09AMDCvOQqE4+gYW87WOfPxUJpUndd3/lo/0OAzPNK5qWHi+y45W+uOq+9PVY9A4EnE
	5p/A0WhnWzbAUwoN9WDNa0ahe8pihCZOb74FtNBo=
Content-Type: multipart/mixed; boundary="===============1249840016255825213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly:
 upgrading to 1.26.10,1.26.10,1.26.10,1.26.10,1.26.10 SUCCEEDED
Message-ID: <0101019b79598793-21914b3a-64b2-4704-b5f8-f5a3b7c67b08-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228761

--===============1249840016255825213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly* to *1.26.10,1.26.10,1.26.10,1.26.10,1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-bad-gs.patch
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
From 4d58155543f0ef07a7303f3ebcdacfc68fec7455 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 05:59:32 +0000
Subject: [PATCH] 
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly:
 upgrade 1.26.9 -> 1.26.10,1.26.9 -> 1.26.10,1.26.9 -> 1.26.10,1.26.9 ->
 1.26.10,1.26.9 -> 1.26.10

---
 ...x-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch          | 2 +-
 ...encv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...ns-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.26.10.bb} | 2 +-
 ...ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 6 +++---
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch      | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch        | 2 +-
 ...-base_1.26.9.bb => gstreamer1.0-plugins-base_1.26.10.bb} | 2 +-
 ...-good_1.26.9.bb => gstreamer1.0-plugins-good_1.26.10.bb} | 2 +-
 ...-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.26.10.bb} | 2 +-
 ...server_1.26.9.bb => gstreamer1.0-rtsp-server_1.26.10.bb} | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.26.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.9.bb => gstreamer1.0-plugins-base_1.26.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.9.bb => gstreamer1.0-plugins-good_1.26.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.26.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.26.10.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 307d669645..13fae5a089 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From 0b3273b7390e3b459e338c9e72a9e4b978340773 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 7da8994e3d..a33a6e5b80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 73269b2d6ed8a1dabd0eeb07d8945e577a1d821a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..0814018bcd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From e95b72a17abc8e51b36ed82a3ddabb9e62716acb Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.10.bb
index 4a9cb37dd8..0ff6bb66c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a96bfb68c53a7c9ab1ae279eac7c101f4204fb5c0e4729683b2be64261707446"
+SRC_URI[sha256sum] = "fec973dff512b507d9dcb5a828e04e061e52188f4d5989e953aed6a41beda437"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 719c73d3e3..00cc7511bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From 844e82ceae64f7a96e1e80df1cec0d6d4b42632b Mon Sep 17 00:00:00 2001
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
index bf1e2a89e3..c72d3160e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 0f2d593987866c8d15b37888799e8879cb2d4db4 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..4cb91676ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 10946d1af4a3dbe2e640385e42ae11c365888d91 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.10.bb
index 74b6f2308d..6c6c1b4c7f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083a921ef71dd000a"
+SRC_URI[sha256sum] = "1c1531dd8f2d480c89c57b08a930545a3375077391789762e40e490cdbbf03fd"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.10.bb
index 4977415f71..ba72aa8849 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.10.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f38566fb53ae56b7019a039475311756a28eb978a781154d67813dcb551ff5fe"
+SRC_URI[sha256sum] = "7beacb5daba3c6751ebc1c85017d9b1d6de64e24798125932c73c8b1dbeb3bc9"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.10.bb
index e04bfcc81b..c4d174b1bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22fd520d5d1bacb4d"
+SRC_URI[sha256sum] = "b2c648ef62cbf03cdc215f55dca01e2e8372983d8c88de3fa03671ddf08d7d14"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.10.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.10.bb
index ac6b52ee46..af58fa11bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.10.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "67e92e9a5b0f2b51eb571cc893b80da2ae2374f19b05d381d1e364393fe12654"
+SRC_URI[sha256sum] = "4476cda6912b6a92179d6004d2df821e253afdf7c916ebaea5fad9bd082f5604"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============1249840016255825213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstanalytics-1.0.so.0.2609.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2609.0 /usr/lib/.debug/libgstplay-1.0.so.0.2609.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2609.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2609.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2609.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2609.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2609.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2609.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2609.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2609.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2609.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2609.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2609.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2609.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2609.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2609.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2609.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2609.0 /usr
 /lib/.debug/libgstmse-1.0.so.0.2609.0", added "/usr/lib/.debug/libgstbadaudio-1.0.so.0.2610.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2610.0 /usr/lib/.debug/libgstplay-1.0.so.0.2610.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2610.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2610.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2610.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2610.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2610.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2610.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2610.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2610.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2610.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2610.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2610.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2610.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2610.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2610.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2610.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2610.0 /usr/lib/.debug/libgstmse-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30835904 to 30839024 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGSIZE changed from 190968 to 195064 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGSIZE changed from 3883476 to 3883494 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGSIZE changed from 39032 to 43128 (+10%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/vulkan/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/vulkan/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/shm -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/shm, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/jp2kdecimator -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/jp2kdecimator, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/tools -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/tools, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/mse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/mse, direc
 tory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/aiff -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/aiff, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/vulkan -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/vulkan, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/accurip -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/accurip, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/audiovisualizers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/audiovisualizers, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/rtmp2/rtmp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/rtmp2/rtmp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/dvbsuboverlay -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/dvbsuboverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/pnm -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/
 pnm, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/analyticsoverlay -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/analyticsoverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/adaptivedemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/adaptivedemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/jpegformat -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/jpegformat, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/cuda/stub -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/cuda/stub, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/timecode -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/timecode, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26
 .9/gst/audiomixmatrix -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/audiomixmatrix, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/fieldanalysis -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/fieldanalysis, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/decklink -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/decklink, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/smoothstreaming -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/smoothstreaming, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mxf -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/mxf, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/freeverb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/freeverb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/vulkan -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/vulkan, directory renamed 
 /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/gdp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/gdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/proxy -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/proxy, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/cuda -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/cuda, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/vulkan/shaders -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/vulkan/shaders, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/rtmp2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/rtmp2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/ivfparse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/ivfparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/rawparse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/rawparse, directory rena
 med /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/videosignal -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/videosignal, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/geometrictransform -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/geometrictransform, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/adpcmdec -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/adpcmdec, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/basecamerabinsrc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/basecamerabinsrc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/sndfile -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/sndfile, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/dtls -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/dtls, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/transcoder -> /usr/src/de
 bug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/transcoder, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/v4l2codecs/linux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/v4l2codecs/linux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/uvch264 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/uvch264, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/adpcmenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/adpcmenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/videoframe_audiolevel -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/videoframe_audiolevel, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/coloreffects -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/coloreffects, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/gaudieffects -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/gaudieffects, directory renamed /us
 r/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/bluez -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/bluez, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/speed -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/speed, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/interlace -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/interlace, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/camerabin2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/camerabin2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mpegtsdemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/mpegtsdemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/codecalpha -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/codecalpha, directory renamed /usr/
 src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/play -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/play, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/curl -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/curl, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/ipcpipeline -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/ipcpipeline, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/uridownloader -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/uridownloader, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/fbdev -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/fbdev, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/transcode -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/transcode, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mpegtsmux/tsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.
 26.10/gst/mpegtsmux/tsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/sbc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/sbc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/audiofxbad -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/audiofxbad, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/midi -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/midi, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/interfaces -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/interfaces, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/codecs -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/codecs, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/videofilters -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/videofilters, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/faceoverlay -
 > /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/faceoverlay, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/dvb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/dvb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/audiobuffersplit -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/audiobuffersplit, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/wayland -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/insertbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/insertbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/sdp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/sdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/isoff -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/isoff, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9
 /gst/frei0r -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/frei0r, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/dvdspu -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/dvdspu, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/asfmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/asfmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/audio -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/audio, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/bz2 -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/bz2, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/dvbsubenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/dvbsubenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/librfb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/librfb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/ris
 t -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/rist, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/subenc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/subenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/id3tag -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/id3tag, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/unixfd -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/unixfd, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/decklink/linux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/decklink/linux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/smooth -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/smooth, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/netsim -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/netsim, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mse -> /usr/src
 /debug/gstreamer1.0-plugins-bad/1.26.10/gst/mse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/mpegts -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/mpegts, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/autoconvert -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/autoconvert, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mpegpsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/mpegpsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/mpegtsmux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/mpegtsmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/webrtc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/webrtc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/onvif -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/onvif, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/
 1.26.9/gst-libs/gst/insertbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/insertbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/hls -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/hls, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/y4m -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/y4m, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/codectimestamper -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/codectimestamper, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/siren -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/siren, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/player -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/player, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/uvcgadget -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/uvcgadget, directory renamed /usr/src/d
 ebug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/codecparsers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/codecparsers, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/dxva -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/dxva, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/vulkan/xcb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/vulkan/xcb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/removesilence -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/removesilence, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/audiolatency -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/audiolatency, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/pcapparse -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/pcapparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/sctp -> /us
 r/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/sctp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst-libs/gst/analytics -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst-libs/gst/analytics, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/sys/v4l2codecs/linux/usb -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/sys/v4l2codecs/linux/usb, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/ttml -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/ttml, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/vmnc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/vmnc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/bayer -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/bayer, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/videoparsers -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/videoparsers, directory renamed /usr/src/debug/gstreamer1.0
 -plugins-bad/1.26.9/gst/mpegdemux -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/mpegdemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/ivtc -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/ivtc, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/aes -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/aes, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/closedcaption -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/closedcaption, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/dvbsubenc/libimagequant -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/dvbsubenc/libimagequant, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/inter -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/inter, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/dash -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/dash, directory renamed /usr/src/debu
 g/gstreamer1.0-plugins-bad/1.26.9/ext/webp -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/webp, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/switchbin -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/switchbin, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/ext/rsvg -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/ext/rsvg, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/segmentclip -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/segmentclip, directory renamed /usr/src/debug/gstreamer1.0-plugins-bad/1.26.9/gst/festival -> /usr/src/debug/gstreamer1.0-plugins-bad/1.26.10/gst/festival
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGSIZE changed from 18107224 to 18109092 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.9.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.10.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2609.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2609.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2609.0", added "/usr/lib/libgstanalytics-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2609.0", added "/usr/lib/libgstanalytics-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2609.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2609.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2609.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2609.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2609.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2609.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2609.0", added "/usr/lib/libgstcodecs-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2609.0", added "/usr/lib/libgstcodecs-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2609.0", added "/usr/lib/libgstcuda-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2609.0", added "/usr/lib/libgstcuda-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2609.0", added "/usr/lib/libgstdxva-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2609.0", added "/usr/lib/libgstdxva-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2609.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2609.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2609.0", added "/usr/lib/libgstisoff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2609.0", added "/usr/lib/libgstisoff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2609.0", added "/usr/lib/libgstmpegts-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2609.0", added "/usr/lib/libgstmpegts-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2609.0", added "/usr/lib/libgstmse-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2609.0", added "/usr/lib/libgstmse-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2609.0", added "/usr/lib/libgstphotography-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2609.0", added "/usr/lib/libgstphotography-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2609.0", added "/usr/lib/libgstplay-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2609.0", added "/usr/lib/libgstplay-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2609.0", added "/usr/lib/libgstplayer-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2609.0", added "/usr/lib/libgstplayer-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2609.0", added "/usr/lib/libgstsctp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2609.0", added "/usr/lib/libgstsctp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2609.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2609.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2609.0", added "/usr/lib/libgstvulkan-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2609.0", added "/usr/lib/libgstvulkan-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGSIZE changed from 370196 to 370260 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2609.0", added "/usr/lib/libgstwayland-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2609.0", added "/usr/lib/libgstwayland-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2609.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2609.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2609.0 to libgstadaptivedemux-1.0.so.0.2610.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2609.0 to libgstanalytics-1.0.so.0.2610.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2609.0 to libgstbadaudio-1.0.so.0.2610.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2609.0 to libgstbasecamerabinsrc-1.0.so.0.2610.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2609.0 to libgstcodecparsers-1.0.so.0.2610.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2609.0 to libgstcodecs-1.0.so.0.2610.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2609.0 to libgstcuda-1.0.so.0.2610.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2609.0 to libgstdxva-1.0.so.0.2610.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2609.0 to libgstinsertbin-1.0.so.0.2610.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2609.0 to libgstisoff-1.0.so.0.2610.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2609.0 to libgstmpegts-1.0.so.0.2610.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2609.0 to libgstmse-1.0.so.0.2610.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2609.0 to libgstphotography-1.0.so.0.2610.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2609.0 to libgstplay-1.0.so.0.2610.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2609.0 to libgstplayer-1.0.so.0.2610.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2609.0 to libgstsctp-1.0.so.0.2610.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2609.0 to libgsturidownloader-1.0.so.0.2610.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2609.0 to libgstvulkan-1.0.so.0.2610.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2609.0 to libgstwayland-1.0.so.0.2610.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2609.0 to libgstwebrtc-1.0.so.0.2610.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2609.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2610.0
  /usr/lib/libgstanalytics-1.0.so.0.2609.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2610.0
  /usr/lib/libgstbadaudio-1.0.so.0.2609.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2610.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2609.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2610.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2609.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2610.0
  /usr/lib/libgstcodecs-1.0.so.0.2609.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2610.0
  /usr/lib/libgstcuda-1.0.so.0.2609.0 moved to /usr/lib/libgstcuda-1.0.so.0.2610.0
  /usr/lib/libgstdxva-1.0.so.0.2609.0 moved to /usr/lib/libgstdxva-1.0.so.0.2610.0
  /usr/lib/libgstinsertbin-1.0.so.0.2609.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2610.0
  /usr/lib/libgstisoff-1.0.so.0.2609.0 moved to /usr/lib/libgstisoff-1.0.so.0.2610.0
  /usr/lib/libgstmpegts-1.0.so.0.2609.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2610.0
  /usr/lib/libgstmse-1.0.so.0.2609.0 moved to /usr/lib/libgstmse-1.0.so.0.2610.0
  /usr/lib/libgstphotography-1.0.so.0.2609.0 moved to /usr/lib/libgstphotography-1.0.so.0.2610.0
  /usr/lib/libgstplay-1.0.so.0.2609.0 moved to /usr/lib/libgstplay-1.0.so.0.2610.0
  /usr/lib/libgstplayer-1.0.so.0.2609.0 moved to /usr/lib/libgstplayer-1.0.so.0.2610.0
  /usr/lib/libgstsctp-1.0.so.0.2609.0 moved to /usr/lib/libgstsctp-1.0.so.0.2610.0
  /usr/lib/libgsturidownloader-1.0.so.0.2609.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2610.0
  /usr/lib/libgstvulkan-1.0.so.0.2609.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2610.0
  /usr/lib/libgstwayland-1.0.so.0.2609.0 moved to /usr/lib/libgstwayland-1.0.so.0.2610.0
  /usr/lib/libgstwebrtc-1.0.so.0.2609.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2610.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstaudio-1.0.so.0.2609.0 /usr/lib/.debug/libgstgl-1.0.so.0.2609.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2609.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2609.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2609.0 /usr/lib/.debug/libgsttag-1.0.so.0.2609.0 /usr/lib/.debug/libgstfft-1.0.so.0.2609.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2609.0 /usr/lib/.debug/libgstapp-1.0.so.0.2609.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2609.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2609.0 /usr/lib/.debug/libgstriff-1.0.so.0.2609.0", added "/usr/lib/.debug/libgstpbutils-1.0.so.0.2610.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2610.0 /usr/lib/.debug/libgstgl-1.0.so.0.2610.0 /usr/lib/.debug/libgsttag-1.0.so.0.2610.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2610.0 /usr/lib/.debug/libgstfft-1.0.so.0.2610.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2610.0 /usr/lib/.debug/libgstapp-1.0.so.0.2610.0 /usr/lib/.debu
 g/libgstrtp-1.0.so.0.2610.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2610.0 /usr/lib/.debug/libgstriff-1.0.so.0.2610.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19350200 to 19355568 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6283651 to 6283670 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/gl -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/gl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/sys/xvimage -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/sys/xvimage, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/videoconvertscale -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/videoconvertscale, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/tools -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/tools, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/pbtypes -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/pbtypes, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/gio -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/gio, directory renamed /usr/src/debug/gstreamer1.0-plugins
 -base/1.26.9/gst-libs/gst/sdp -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/sdp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/video -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/video, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/audioconvert -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/audioconvert, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/audio -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/audio, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/alsa -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/alsa, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/videorate -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/videorate, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/audiorate -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/audiorate,
  directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl/egl -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl/egl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/sys/ximage -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/sys/ximage, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/pbutils -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/pbutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/rawparse -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/rawparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/subparse -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/subparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/audiomixer -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/audiomixer, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/audioresample -> /usr/src/
 debug/gstreamer1.0-plugins-base/1.26.10/gst/audioresample, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/dsd -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/dsd, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl/utils -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl/utils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl/wayland -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl/wayland, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/tag -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/tag, directory rename
 d /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/adder -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/adder, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/audiotestsrc -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/audiotestsrc, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/encoding -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/encoding, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/videotestsrc -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/videotestsrc, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/tcp -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/tcp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/overlaycomposition -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/overlaycomposition, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/pango -> /usr/src/debug/gstreamer1.0-plugins-base/1.2
 6.10/ext/pango, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/gl/effects -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/gl/effects, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/fft -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/fft, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/app -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/app, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/app -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/app, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/typefind -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/typefind, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/allocators -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/allocators, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/vorbis ->
  /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/vorbis, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl/x11 -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl/x11, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/riff -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/riff, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/playback -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/playback, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/gl/glprototypes -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/gl/glprototypes, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/volume -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/volume, directory
  renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst-libs/gst/rtsp -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst-libs/gst/rtsp, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/ogg -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/ogg, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/gst/compositor -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/gst/compositor, directory renamed /usr/src/debug/gstreamer1.0-plugins-base/1.26.9/ext/theora -> /usr/src/debug/gstreamer1.0-plugins-base/1.26.10/ext/theora
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 14566289 to 14568306 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.9.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.10.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2609.0", added "/usr/lib/libgstallocators-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2609.0", added "/usr/lib/libgstallocators-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2609.0", added "/usr/lib/libgstapp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2609.0", added "/usr/lib/libgstapp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2609.0", added "/usr/lib/libgstaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2609.0", added "/usr/lib/libgstaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2609.0", added "/usr/lib/libgstfft-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2609.0", added "/usr/lib/libgstfft-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2609.0", added "/usr/lib/libgstgl-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2609.0", added "/usr/lib/libgstgl-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2609.0", added "/usr/lib/libgstpbutils-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2609.0", added "/usr/lib/libgstpbutils-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2609.0", added "/usr/lib/libgstriff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2609.0", added "/usr/lib/libgstriff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2609.0", added "/usr/lib/libgstrtp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2609.0", added "/usr/lib/libgstrtp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2609.0", added "/usr/lib/libgstrtsp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2609.0", added "/usr/lib/libgstrtsp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2609.0", added "/usr/lib/libgstsdp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2609.0", added "/usr/lib/libgstsdp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2609.0", added "/usr/lib/libgsttag-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2609.0", added "/usr/lib/libgsttag-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2609.0", added "/usr/lib/libgstvideo-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2609.0", added "/usr/lib/libgstvideo-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2609.0 to libgstallocators-1.0.so.0.2610.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2609.0 to libgstapp-1.0.so.0.2610.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2609.0 to libgstaudio-1.0.so.0.2610.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2609.0 to libgstfft-1.0.so.0.2610.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2609.0 to libgstgl-1.0.so.0.2610.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2609.0 to libgstpbutils-1.0.so.0.2610.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2609.0 to libgstriff-1.0.so.0.2610.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2609.0 to libgstrtp-1.0.so.0.2610.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2609.0 to libgstrtsp-1.0.so.0.2610.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2609.0 to libgstsdp-1.0.so.0.2610.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2609.0 to libgsttag-1.0.so.0.2610.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2609.0 to libgstvideo-1.0.so.0.2610.0
  /usr/lib/libgstallocators-1.0.so.0.2609.0 moved to /usr/lib/libgstallocators-1.0.so.0.2610.0
  /usr/lib/libgstapp-1.0.so.0.2609.0 moved to /usr/lib/libgstapp-1.0.so.0.2610.0
  /usr/lib/libgstaudio-1.0.so.0.2609.0 moved to /usr/lib/libgstaudio-1.0.so.0.2610.0
  /usr/lib/libgstfft-1.0.so.0.2609.0 moved to /usr/lib/libgstfft-1.0.so.0.2610.0
  /usr/lib/libgstgl-1.0.so.0.2609.0 moved to /usr/lib/libgstgl-1.0.so.0.2610.0
  /usr/lib/libgstpbutils-1.0.so.0.2609.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2610.0
  /usr/lib/libgstriff-1.0.so.0.2609.0 moved to /usr/lib/libgstriff-1.0.so.0.2610.0
  /usr/lib/libgstrtp-1.0.so.0.2609.0 moved to /usr/lib/libgstrtp-1.0.so.0.2610.0
  /usr/lib/libgstrtsp-1.0.so.0.2609.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2610.0
  /usr/lib/libgstsdp-1.0.so.0.2609.0 moved to /usr/lib/libgstsdp-1.0.so.0.2610.0
  /usr/lib/libgsttag-1.0.so.0.2609.0 moved to /usr/lib/libgsttag-1.0.so.0.2610.0
  /usr/lib/libgstvideo-1.0.so.0.2609.0 moved to /usr/lib/libgstvideo-1.0.so.0.2610.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22233648 to 22238040 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/effectv -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/effectv, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/matroska -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/matroska, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/equalizer -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/equalizer, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/adaptivedemux2/mss -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/adaptivedemux2/mss, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/deinterlace/tvtime/tomsmocomp -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/deinterlace/tvtime/tomsmocomp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/wavenc -> /usr/src/debug/gstreamer1.0-plugin
 s-good/1.26.10/gst/wavenc, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/spectrum -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/spectrum, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/sys/v4l2/ext -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/sys/v4l2/ext, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/interleave -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/interleave, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/lame -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/lame, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/dtmf -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/dtmf, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/id3demux -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/id3demux, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/goom -> /usr/src/debug/gstreamer1.0-plugin
 s-good/1.26.10/gst/goom, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/sys/ximage -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/sys/ximage, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/icydemux -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/icydemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/wavparse -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/wavparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/isomp4 -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/isomp4, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/jpeg -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/jpeg, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/imagefreeze -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/imagefreeze, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/libpng -> /usr/src/debug/gstreamer1.0-plug
 ins-good/1.26.10/ext/libpng, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/udp -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/udp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/videomixer -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/videomixer, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/xingmux -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/xingmux, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/audiofx -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/audiofx, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/soup -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/soup, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/replaygain -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/replaygain, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/shapewipe -> /usr/src/debug/gstreamer1.0-p
 lugins-good/1.26.10/gst/shapewipe, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/autodetect -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/autodetect, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/speex -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/speex, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/avi -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/avi, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/monoscope -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/monoscope, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/deinterlace/tvtime -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/deinterlace/tvtime, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/sys/v4l2 -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/sys/v4l2, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/law -> /usr/src/debu
 g/gstreamer1.0-plugins-good/1.26.10/gst/law, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/rtpmanager -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/rtpmanager, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/flac -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/flac, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/smpte -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/smpte, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/y4m -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/y4m, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/cairo -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/cairo, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/adaptivedemux2/dash -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/adaptivedemux2/dash, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/alpha -> /usr/sr
 c/debug/gstreamer1.0-plugins-good/1.26.10/gst/alpha, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/videobox -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/videobox, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/level -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/level, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/pulse -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/pulse, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/cutter -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/cutter, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/soup/stub -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/soup/stub, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/sys/oss -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/sys/oss, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/adaptivedemux2/hls -> /usr/s
 rc/debug/gstreamer1.0-plugins-good/1.26.10/ext/adaptivedemux2/hls, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/goom2k1 -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/goom2k1, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/videofilter -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/videofilter, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/multipart -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/multipart, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/debugutils -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/debugutils, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/auparse -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/auparse, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/adaptivedemux2 -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/adaptivedemux2, directory renamed /usr/src/debug/gstream
 er1.0-plugins-good/1.26.9/ext/gdk_pixbuf -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/gdk_pixbuf, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/rtp -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/rtp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/mpg123 -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/mpg123, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/videocrop -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/videocrop, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/deinterlace -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/deinterlace, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/flv -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/flv, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/audioparsers -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/audioparsers, directory renamed /usr/src
 /debug/gstreamer1.0-plugins-good/1.26.9/gst/apetag -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/apetag, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/ext/taglib -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/ext/taglib, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/multifile -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/multifile, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/rtsp -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/rtsp, directory renamed /usr/src/debug/gstreamer1.0-plugins-good/1.26.9/gst/flx -> /usr/src/debug/gstreamer1.0-plugins-good/1.26.10/gst/flx
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13631257 to 13634142 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGSIZE changed from 374976 to 370880 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGSIZE changed from 791184 to 791208 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.9/gst/dvdlpcmdec -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.10/gst/dvdlpcmdec, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.9/gst/dvdsub -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.10/gst/dvdsub, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.9/gst/asfdemux -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.10/gst/asfdemux, directory renamed /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.9/gst/realmedia -> /usr/src/debug/gstreamer1.0-plugins-ugly/1.26.10/gst/realmedia
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2609.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1608632 to 1608664 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGSIZE changed from 1015729 to 1015730 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-rtsp-server/1.26.9/gst/rtsp-sink -> /usr/src/debug/gstreamer1.0-rtsp-server/1.26.10/gst/rtsp-sink, directory renamed /usr/src/debug/gstreamer1.0-rtsp-server/1.26.9/gst/rtsp-server -> /usr/src/debug/gstreamer1.0-rtsp-server/1.26.10/gst/rtsp-server
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2609.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2609.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2609.0 to libgstrtspserver-1.0.so.0.2610.0
  /usr/lib/libgstrtspserver-1.0.so.0.2609.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2610.0

--===============1249840016255825213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-bad-gs.patch"

RnJvbSA0ZDU4MTU1NTQzZjBlZjA3YTczMDNmM2ViY2RhY2ZjNjhmZWM3NDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNTo1OTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyLGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCxnc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlLGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2QsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseToKIHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAsMS4yNi45IC0+IDEuMjYu
MTAsMS4yNi45IC0+IDEuMjYuMTAsMS4yNi45IC0+CiAxLjI2LjEwLDEuMjYuOSAtPiAxLjI2LjEw
CgotLS0KIC4uLngtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13
aXRoLnBhdGNoIHwgMiArLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGly
ZWN0bHkucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi5lbmN2LXJlc29sdmUtbWlzc2luZy1vcGVu
Y3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCB8IDIgKy0KIC4uLm5zLWJhZF8xLjI2Ljku
YmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMTAuYmJ9IHwgMiArLQogLi4uRU5H
UjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggfCA2
ICsrKy0tLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5n
LnBhdGNoICAgICAgfCAyICstCiAuLi4vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlz
LWluY2x1ZGVkLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi1iYXNlXzEuMjYuOS5iYiA9PiBnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMTAuYmJ9IHwgMiArLQogLi4uLWdvb2RfMS4yNi45
LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4xMC5iYn0gfCAyICstCiAuLi4t
dWdseV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjEwLmJifSB8
IDIgKy0KIC4uLnNlcnZlcl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEu
MjYuMTAuYmJ9IHwgMiArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZF8xLjI2LjEwLmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZV8xLjI2LjEwLmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIg
PT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjEwLmJifSAoOTclKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWds
eV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjEwLmJifSAoOTQl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXJ0c3Atc2VydmVyXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4x
MC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQt
d2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5p
bml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCmluZGV4IDMwN2Q2
Njk2NDUuLjEzZmFlNWEwODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFs
aXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgt
bWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBkMjRiYjk0OWU1NDdhMGFkNjlmM2Y0N2U0Y2YyNjJhNzViYjlm
ZTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwYjMyNzNiNzM5MGUzYjQ1OWUzMzhj
OWU3MmE5ZTRiOTc4MzQwNzczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUg
TWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6
MTY6MDEgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2Fy
bmluZ3Mgd2hlbiBjb21waWxpbmcgd2l0aCAtT3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1p
bmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRp
bmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaAppbmRleCA3ZGE4OTk0ZTNkLi5hMzNhNmU1Yjgw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHku
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MjgyMzgxMjlhOGE5MWNhZDg1NzAyM2QyZTcxMzE1
OTEzMjE0MDlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MzI2OWIyZDZlZDhhMWRh
YmQwZWViMDdkODk0NWU1NzdhMWQ4MjFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAx
NiAxODowNTo0MSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9w
b2xsLmg+IGRpcmVjdGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2lu
Zy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVz
b2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDFl
ZGNmMDdjMTQuLjA4MTQwMThiY2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1t
aXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1v
cGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZjdhMWM1NTkxZTI3NjgxZjI5NGFlNWVkZjBmMzI2ODkx
OThhYmZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOTViNzJhMTdhYmM4ZTUxYjM2
ZWQ4MmEzZGRhYmI5ZTYyNzE2YWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5k
cmV5IFpoaXpoaWtpbiA8YW5kcmV5LnpAZ21haWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAy
MCAxMDoyMjozNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2lu
ZyBvcGVuY3YgZGF0YSBkaXIgaW4geW9jdG8gYnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45LmJi
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZF8xLjI2LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi45
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkXzEuMjYuMTAuYmIKaW5kZXggNGE5Y2IzN2RkOC4uMGZmNmJiNjZjNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZF8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjEwLmJiCkBAIC0xMCw3ICsxMCw3
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Qt
cGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMtYmFkCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWF2b2lk
LWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVp
bC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhOTZiZmI2OGM1
M2E3YzlhYjFhZTI3OWVhYzdjMTAxZjQyMDRmYjVjMGU0NzI5NjgzYjJiZTY0MjYxNzA3NDQ2Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZlYzk3M2RmZjUxMmI1MDdkOWRjYjVhODI4ZTA0ZTA2MWU1
MjE4OGY0ZDU5ODllOTUzYWVkNmE0MWJlZGE0MzciCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L2dzdC1w
bHVnaW5zLWJhZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0
LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAw
MzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKaW5kZXgg
NzE5YzczZDNlMy4uMDBjYzc1MTFiYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUt
Z2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAx
LUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMzdmMDA2MzEwM2U5OGY1MTA5MTMyZWEzMDJiOTE5Yjky
ZTI2YTM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NDRlODJjZWFlNjRmN2E5NmUx
ZTgwZGYxY2VjMGQ2ZDRiNDI2MzJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogemhv
dW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29tPgogRGF0ZTogV2VkLCAxNCBNYXkgMjAxNCAxMDox
NjoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBFTkdSMDAzMTI1MTU6IGdldCBjYXBzIGZyb20g
c3JjIHBhZCB3aGVuIHF1ZXJ5IGNhcHMKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBkaWZmIC0tZ2l0IGEvZ3N0LWxpYnMv
Z3N0L3RhZy9nc3R0YWdkZW11eC5jIGIvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jCiBv
bGQgbW9kZSAxMDA2NDQKIG5ldyBtb2RlIDEwMDc1NQotaW5kZXggOTc1ZmU4My4uZGY4Mjg0MAor
aW5kZXggMTZiZjAwMS4uZTE3YTE0NAogLS0tIGEvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11
eC5jCiArKysgYi9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMKLUBAIC0xNzk2LDYgKzE3
OTYsMTkgQEAgZ3N0X3RhZ19kZW11eF9wYWRfcXVlcnkgKEdzdFBhZCAqIHBhZCwgR3N0T2JqZWN0
ICogcGFyZW50LCBHc3RRdWVyeSAqIHF1ZXJ5KQorQEAgLTE3OTcsNiArMTc5NywxOSBAQCBnc3Rf
dGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFkICogcGFkLCBHc3RPYmplY3QgKiBwYXJlbnQsIEdz
dFF1ZXJ5ICogcXVlcnkpCiAgICAgICAgfQogICAgICAgIGJyZWFrOwogICAgICB9CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNo
CmluZGV4IGJmMWUyYTg5ZTMuLmM3MmQzMTYwZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFy
c2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3Nh
cGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmODkyZjBiZThhZTg4YWNjNjQ4MmY0YjlhOWE0ZGI1ZjAzYjdhZGY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZjJkNTkzOTg3ODY2YzhkMTViMzc4ODg3OTllODg3OWNi
MmQ0ZGI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2tlIFdhbmcgPG1pbmdr
ZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5IE1hciAyMDE1IDE0OjE3OjEwICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNlOiBlbmhhbmNlIFNTQSB0ZXh0IGxpbmVzIHBh
cnNpbmcuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMt
aW5jbHVkZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5j
bHVkZWQucGF0Y2gKaW5kZXggMWE5ODhiOTlkZS4uNGNiOTE2NzZhYyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Uv
MDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
LzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNmYwNmY0YjJmMTNmMDI4MjUwMTg5MjI1YTQ2YTM5ZjQwMjQyODkzMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTA5NDZkMWFmNGEzZGJlMmU2NDAzODVlNDJh
ZTExYzM2NTg4OGQ5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhcmxvcyBSYWZh
ZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBUdWUsIDIxIE1heSAyMDE5IDE0
OjAxOjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZpdi1mYjogTWFrZSBzdXJlIGNvbmZpZy5o
IGlzIGluY2x1ZGVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjEwLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yNi4xMC5iYgppbmRleCA3NGI2ZjIzMDhkLi42YzZjMWI0YzdmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4xMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtYmFzZS9n
c3QtcGx1Z2lucy1iYQogICAgICAgICAgICBmaWxlOi8vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNv
bmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItc3NhcGFy
c2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjExZGI0ZWM5YWU1YmUyMTk0ZmY4Y2NmMmI1ZmVjZGMwNjky
NTJmZTQ0MTY5MjFiMDgzYTkyMWVmNzFkZDAwMGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWMx
NTMxZGQ4ZjJkNDgwYzg5YzU3YjA4YTkzMDU0NWEzMzc1MDc3MzkxNzg5NzYyZTQwZTQ5MGNkYmJm
MDNmZCIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWdvb2RfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuMTAuYmIKaW5kZXgg
NDk3NzQxNWY3MS4uYmE3MmFhODg0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
XzEuMjYuMTAuYmIKQEAgLTYsNyArNiw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3QtcGx1Z2lucy1nb29kLy0vaXNzdWVzCiAKIFNS
Q19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lu
cy1nb29kL2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZjM4NTY2ZmI1M2FlNTZiNzAxOWEwMzk0NzUzMTE3NTZhMjhlYjk3OGE3ODExNTRkNjc4
MTNkY2I1NTFmZjVmZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3YmVhY2I1ZGFiYTNjNjc1MWVi
YzFjODUwMTdkOWIxZDZkZTY0ZTI0Nzk4MTI1OTMyYzczYzhiMWRiZWIzYmM5IgogCiBTID0gIiR7
VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2
LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtdWdseV8xLjI2LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xMC5iYgppbmRleCBlMDRiZmNjODFiLi5jNGQx
NzRiMWJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xMC5iYgpAQCAt
MTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgICAgICAgICBodHRwczovL2dzdHJlYW1l
ci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLXVnbHkvZ3N0LXBsdWdpbnMtdWdseS0k
e1BWfS50YXIueHogXAogICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTg0
ZTRjNmU3NjViYzQ2M2VkODA2YjIyNjNjYjliMmFhYTNhNjU0MTVkZjBhM2MyMmZkNTIwZDVkMWJh
Y2I0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMmM2NDhlZjYyY2JmMDNjZGMyMTVmNTVkY2Ew
MWUyZTgzNzI5ODNkOGM4OGRlM2ZhMDM2NzFkZGYwOGQ3ZDE0IgogCiBTID0gIiR7VU5QQUNLRElS
fS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuOS5iYiBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yNi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuOS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1y
dHNwLXNlcnZlcl8xLjI2LjEwLmJiCmluZGV4IGFjNmI1MmVlNDYuLmFmNThmYTExYmMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4xMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBQ
TlJFQUwgPSAiZ3N0LXJ0c3Atc2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVy
LmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2N2U5MmU5YTViMGYyYjUxZWI1NzFjYzg5M2I4MGRhMmFl
MjM3NGYxOWIwNWQzODFkMWUzNjQzOTNmZTEyNjU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0
NzZjZGE2OTEyYjZhOTIxNzlkNjAwNGQyZGY4MjFlMjUzYWZkZjdjOTE2ZWJhZWE1ZmFkOWJkMDgy
ZjU2MDQiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40Ny4x
Cgo=

--===============1249840016255825213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGSIZE changed from 39032 to 43128 (+10%)
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2609.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2609.0", added "/usr/lib/libgstanalytics-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2609.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2609.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2609.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2609.0", added "/usr/lib/libgstcodecs-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2609.0", added "/usr/lib/libgstcuda-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2609.0", added "/usr/lib/libgstdxva-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2609.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2609.0", added "/usr/lib/libgstisoff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2609.0", added "/usr/lib/libgstmpegts-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2609.0", added "/usr/lib/libgstmse-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2609.0", added "/usr/lib/libgstphotography-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2609.0", added "/usr/lib/libgstplay-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2609.0", added "/usr/lib/libgstplayer-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2609.0", added "/usr/lib/libgstsctp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2609.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2609.0", added "/usr/lib/libgstvulkan-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2609.0", added "/usr/lib/libgstwayland-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2609.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2609.0 to libgstadaptivedemux-1.0.so.0.2610.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2609.0 to libgstanalytics-1.0.so.0.2610.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2609.0 to libgstbadaudio-1.0.so.0.2610.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2609.0 to libgstbasecamerabinsrc-1.0.so.0.2610.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2609.0 to libgstcodecparsers-1.0.so.0.2610.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2609.0 to libgstcodecs-1.0.so.0.2610.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2609.0 to libgstcuda-1.0.so.0.2610.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2609.0 to libgstdxva-1.0.so.0.2610.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2609.0 to libgstinsertbin-1.0.so.0.2610.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2609.0 to libgstisoff-1.0.so.0.2610.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2609.0 to libgstmpegts-1.0.so.0.2610.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2609.0 to libgstmse-1.0.so.0.2610.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2609.0 to libgstphotography-1.0.so.0.2610.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2609.0 to libgstplay-1.0.so.0.2610.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2609.0 to libgstplayer-1.0.so.0.2610.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2609.0 to libgstsctp-1.0.so.0.2610.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2609.0 to libgsturidownloader-1.0.so.0.2610.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2609.0 to libgstvulkan-1.0.so.0.2610.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2609.0 to libgstwayland-1.0.so.0.2610.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2609.0 to libgstwebrtc-1.0.so.0.2610.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2609.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2610.0
  /usr/lib/libgstanalytics-1.0.so.0.2609.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2610.0
  /usr/lib/libgstbadaudio-1.0.so.0.2609.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2610.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2609.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2610.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2609.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2610.0
  /usr/lib/libgstcodecs-1.0.so.0.2609.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2610.0
  /usr/lib/libgstcuda-1.0.so.0.2609.0 moved to /usr/lib/libgstcuda-1.0.so.0.2610.0
  /usr/lib/libgstdxva-1.0.so.0.2609.0 moved to /usr/lib/libgstdxva-1.0.so.0.2610.0
  /usr/lib/libgstinsertbin-1.0.so.0.2609.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2610.0
  /usr/lib/libgstisoff-1.0.so.0.2609.0 moved to /usr/lib/libgstisoff-1.0.so.0.2610.0
  /usr/lib/libgstmpegts-1.0.so.0.2609.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2610.0
  /usr/lib/libgstmse-1.0.so.0.2609.0 moved to /usr/lib/libgstmse-1.0.so.0.2610.0
  /usr/lib/libgstphotography-1.0.so.0.2609.0 moved to /usr/lib/libgstphotography-1.0.so.0.2610.0
  /usr/lib/libgstplay-1.0.so.0.2609.0 moved to /usr/lib/libgstplay-1.0.so.0.2610.0
  /usr/lib/libgstplayer-1.0.so.0.2609.0 moved to /usr/lib/libgstplayer-1.0.so.0.2610.0
  /usr/lib/libgstsctp-1.0.so.0.2609.0 moved to /usr/lib/libgstsctp-1.0.so.0.2610.0
  /usr/lib/libgsturidownloader-1.0.so.0.2609.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2610.0
  /usr/lib/libgstvulkan-1.0.so.0.2609.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2610.0
  /usr/lib/libgstwayland-1.0.so.0.2609.0 moved to /usr/lib/libgstwayland-1.0.so.0.2610.0
  /usr/lib/libgstwebrtc-1.0.so.0.2609.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2610.0
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2609.0", added "/usr/lib/libgstallocators-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2609.0", added "/usr/lib/libgstapp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2609.0", added "/usr/lib/libgstaudio-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2609.0", added "/usr/lib/libgstfft-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2609.0", added "/usr/lib/libgstgl-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2609.0", added "/usr/lib/libgstpbutils-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2609.0", added "/usr/lib/libgstriff-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2609.0", added "/usr/lib/libgstrtp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2609.0", added "/usr/lib/libgstrtsp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2609.0", added "/usr/lib/libgstsdp-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2609.0", added "/usr/lib/libgsttag-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2609.0", added "/usr/lib/libgstvideo-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2609.0 to libgstallocators-1.0.so.0.2610.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2609.0 to libgstapp-1.0.so.0.2610.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2609.0 to libgstaudio-1.0.so.0.2610.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2609.0 to libgstfft-1.0.so.0.2610.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2609.0 to libgstgl-1.0.so.0.2610.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2609.0 to libgstpbutils-1.0.so.0.2610.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2609.0 to libgstriff-1.0.so.0.2610.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2609.0 to libgstrtp-1.0.so.0.2610.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2609.0 to libgstrtsp-1.0.so.0.2610.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2609.0 to libgstsdp-1.0.so.0.2610.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2609.0 to libgsttag-1.0.so.0.2610.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2609.0 to libgstvideo-1.0.so.0.2610.0
  /usr/lib/libgstallocators-1.0.so.0.2609.0 moved to /usr/lib/libgstallocators-1.0.so.0.2610.0
  /usr/lib/libgstapp-1.0.so.0.2609.0 moved to /usr/lib/libgstapp-1.0.so.0.2610.0
  /usr/lib/libgstaudio-1.0.so.0.2609.0 moved to /usr/lib/libgstaudio-1.0.so.0.2610.0
  /usr/lib/libgstfft-1.0.so.0.2609.0 moved to /usr/lib/libgstfft-1.0.so.0.2610.0
  /usr/lib/libgstgl-1.0.so.0.2609.0 moved to /usr/lib/libgstgl-1.0.so.0.2610.0
  /usr/lib/libgstpbutils-1.0.so.0.2609.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2610.0
  /usr/lib/libgstriff-1.0.so.0.2609.0 moved to /usr/lib/libgstriff-1.0.so.0.2610.0
  /usr/lib/libgstrtp-1.0.so.0.2609.0 moved to /usr/lib/libgstrtp-1.0.so.0.2610.0
  /usr/lib/libgstrtsp-1.0.so.0.2609.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2610.0
  /usr/lib/libgstsdp-1.0.so.0.2609.0 moved to /usr/lib/libgstsdp-1.0.so.0.2610.0
  /usr/lib/libgsttag-1.0.so.0.2609.0 moved to /usr/lib/libgsttag-1.0.so.0.2610.0
  /usr/lib/libgstvideo-1.0.so.0.2609.0 moved to /usr/lib/libgstvideo-1.0.so.0.2610.0
packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2609.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2609.0 to libgstrtspserver-1.0.so.0.2610.0
  /usr/lib/libgstrtspserver-1.0.so.0.2609.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2610.0

--===============1249840016255825213==--

