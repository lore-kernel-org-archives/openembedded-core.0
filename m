Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8EB10FCAC0
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14646.1775054155978407030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M12UU0Dh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K0O3MIAI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d4978ede5-ae3ae13b-6f2d-44b0-81f8-ca56a01d8787-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ersnNU1sScX+LAdzqLz9dOR+U6EpGhZjlk73zjvGywA=;
	b=M12UU0DhRW9zzHOdjf2IJJCzLmV1MkQD9lEvtcv7fnoNAiaP/AysSf/zASz/H1uU
	gRMRcpBA1pIpyO+QQwwZ1zawwAvHKy/ccobl4F1ozzqVz7Q4wjMT6eaVBhi3OTUgWg0
	GsmcKsfpWa17ir/HPCr52d4mcehAnlajxTyu2zNE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ersnNU1sScX+LAdzqLz9dOR+U6EpGhZjlk73zjvGywA=;
	b=K0O3MIAIRfox18SAIQTPwv4uFH+4iq2QAsVpI1tEzPw6KLPfTo6+KHPhM18u9Zj3
	8shcvYI/04oS/s70oDmAEuZhhXEc4q1Zz6gaurWP5AGl+4Zo0dSEbMjvV5MbKPazrCg
	l1l8+mQIUf2jAKA/ZWxSY6z5vkqK8uX9WjGA6OK8=
Content-Type: multipart/mixed; boundary="===============3774764730663335184=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server:
 upgrading to 1.28.1,1.28.1,1.28.1,1.28.1,1.28.1 FAILED
Message-ID: <0101019d4978ede5-ae3ae13b-6f2d-44b0-81f8-ca56a01d8787-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234360

--===============3774764730663335184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server* to *1.28.1,1.28.1,1.28.1,1.28.1,1.28.1* has Failed(do_compile).

Detailed error information:

do_compile failed



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
From ee753db50f9d117419153bb0c7aef2b080a7d852 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 06:24:57 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base,gstreamer1.0-rtsp-server:
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
index 307d669645..b5d1ed5302 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From d24bb949e547a0ad69f3f47e4cf262a75bb9fe73 Mon Sep 17 00:00:00 2001
+From e1faffff34cac40861ed1541154631b3616a8485 Mon Sep 17 00:00:00 2001
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
index 7da8994e3d..513df23879 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 728238129a8a91cad857023d2e7131591321409d Mon Sep 17 00:00:00 2001
+From 339511194a4cdc25b89ac6d7b3581e76c9d21c0a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 1edcf07c14..8825aa0e0b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 8f7a1c5591e27681f294ae5edf0f32689198abff Mon Sep 17 00:00:00 2001
+From 41caef35794cbfb475f4d09afb0f2942cc23d14f Mon Sep 17 00:00:00 2001
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
index 719c73d3e3..cc3f30e672 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
+From abebe7fab6ecc8c22e9603e3b03c25ee41e09156 Mon Sep 17 00:00:00 2001
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
index bf1e2a89e3..0022ce6dac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
+From 84d8bb03b607f5a70a05851b9d3684b62ac4c7d1 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 1a988b99de..ebdd3b1921 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
+From 11ddeb23015a9cf5901fe34c6c9a96489a274401 Mon Sep 17 00:00:00 2001
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
index e7ca26406d..98f2fe3bab 100644
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


--===============3774764730663335184==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-bad-gstreamer1.0-plugins-ugly-g.patch"

RnJvbSBlZTc1M2RiNTBmOWQxMTc0MTkxNTNiYjBjN2FlZjJiMDgwYTdkODUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNjoyNDo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHksZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLGdzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcjoKIHVwZ3JhZGUgMS4yNi45IC0+IDEuMjguMSwxLjI2LjkgLT4gMS4yOC4x
LDEuMjYuOSAtPiAxLjI4LjEsMS4yNi45IC0+CiAxLjI4LjEsMS4yNi45IC0+IDEuMjguMQoKLS0t
CiAuLi54LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5w
YXRjaCB8IDQgKystLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0
bHkucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi5lbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3Yt
ZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCB8IDQgKystLQogLi4uaW5zLWJhZF8xLjI2Ljku
YmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjguMS5iYn0gfCAyICstCiAuLi5FTkdS
MDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaCB8IDYg
KysrLS0tCiAuLi4vMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcu
cGF0Y2ggICAgICB8IDIgKy0KIC4uLi8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMt
aW5jbHVkZWQucGF0Y2ggICAgICAgIHwgMiArLQogLi4ucy1iYXNlXzEuMjYuOS5iYiA9PiBnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjguMS5iYn0gfCAyICstCiAuLi5zLWdvb2RfMS4yNi45
LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yOC4xLmJifSB8IDIgKy0KIC4uLnMt
dWdseV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI4LjEuYmJ9IHwg
MiArLQogLi4uLXNlcnZlcl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEu
MjguMS5iYn0gfCAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjguMS5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2VfMS4yOC4xLmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIgPT4g
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjEuYmJ9ICg5NyUpCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEu
MjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguMS5iYn0gKDk0JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1ydHNw
LXNlcnZlcl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjguMS5iYn0g
KDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2Fybmlu
Z3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFs
aXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCmluZGV4IDMwN2Q2Njk2NDUu
LmI1ZDFlZDUzMDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13
YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUt
dW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBkMjRiYjk0OWU1NDdhMGFkNjlmM2Y0N2U0Y2YyNjJhNzViYjlmZTczIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMWZhZmZmZjM0Y2FjNDA4NjFlZDE1NDExNTQ2
MzFiMzYxNmE4NDg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJk
eSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6MTY6MDEg
LTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZ3Mg
d2hlbiBjb21waWxpbmcgd2l0aCAtT3MKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTog
QW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2dzdC1saWJzL2dzdC9j
b2RlY3BhcnNlcnMvZ3N0dmMxcGFyc2VyLmMgYi9nc3QtbGlicy9nc3QvY29kZWNwYXJzZXJzL2dz
dHZjMXBhcnNlci5jCi1pbmRleCBhYzhjMzc4Li4zZmM1Mjk4IDEwMDY0NAoraW5kZXggZDkxY2Mz
Zi4uYzkwNThjZCAxMDA2NDQKIC0tLSBhL2dzdC1saWJzL2dzdC9jb2RlY3BhcnNlcnMvZ3N0dmMx
cGFyc2VyLmMKICsrKyBiL2dzdC1saWJzL2dzdC9jb2RlY3BhcnNlcnMvZ3N0dmMxcGFyc2VyLmMK
IEBAIC0xNzMyLDcgKzE3MzIsNyBAQCBnc3RfdmMxX3BhcnNlX3NlcXVlbmNlX2xheWVyIChjb25z
dCBndWludDggKiBkYXRhLCBnc2l6ZSBzaXplLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWlu
Y2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGlu
Zy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCmluZGV4IDdkYTg5OTRlM2QuLjUxM2RmMjM4Nzkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcyODIzODEyOWE4YTkxY2FkODU3MDIzZDJlNzEzMTU5
MTMyMTQwOWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMzOTUxMTE5NGE0Y2RjMjVi
ODlhYzZkN2IzNTgxZTc2YzlkMjFjMGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIEZlYiAyMDE2
IDE4OjA1OjQxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIGluY2x1ZGluZyA8c3lzL3Bv
bGwuaD4gZGlyZWN0bHkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5n
LW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNv
bHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKaW5kZXggMWVk
Y2YwN2MxNC4uODgyNWFhMGUwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1p
c3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9w
ZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDhmN2ExYzU1OTFlMjc2ODFmMjk0YWU1ZWRmMGYzMjY4OTE5
OGFiZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQxY2FlZjM1Nzk0Y2JmYjQ3NWY0
ZDA5YWZiMGYyOTQyY2MyM2QxNGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRy
ZXkgWmhpemhpa2luIDxhbmRyZXkuekBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI3IEphbiAyMDIw
IDEwOjIyOjM1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG9wZW5jdjogcmVzb2x2ZSBtaXNzaW5n
IG9wZW5jdiBkYXRhIGRpciBpbiB5b2N0byBidWlsZApAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9nc3QtbGlicy9nc3Qvb3Bl
bmN2L21lc29uLmJ1aWxkIGIvZ3N0LWxpYnMvZ3N0L29wZW5jdi9tZXNvbi5idWlsZAotaW5kZXgg
NjRlOTEzZS4uNDJhMDk1OCAxMDA2NDQKK2luZGV4IDYwY2IxMmIuLjQwNDZiNzAgMTAwNjQ0CiAt
LS0gYS9nc3QtbGlicy9nc3Qvb3BlbmN2L21lc29uLmJ1aWxkCiArKysgYi9nc3QtbGlicy9nc3Qv
b3BlbmN2L21lc29uLmJ1aWxkCiBAQCAtNjEsNiArNjEsOSBAQCBnc3RvcGVuY3ZfY2FyZ3MgKz0g
WyctRE9QRU5DVl9QUkVGSVg9IicgKyBvcGVuY3ZfcHJlZml4ICsgJyInXQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkXzEuMjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjEuYmIKaW5kZXggNGE5Y2IzN2RkOC4uZjcx
N2MxYzNhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI4LjEuYmIKQEAgLTEw
LDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjL2dzdC1wbHVnaW5zLWJhZC9nc3QtcGx1Z2lucy1iYWQKICAgICAgICAgICAgZmlsZTovLzAw
MDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15
b2N0by1idWlsLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE5
NmJmYjY4YzUzYTdjOWFiMWFlMjc5ZWFjN2MxMDFmNDIwNGZiNWMwZTQ3Mjk2ODNiMmJlNjQyNjE3
MDc0NDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTZjMTU5Mzc4N2Y4YjU1NTA4OTNkNTllNGZm
MjllNmJjY2NmMzQ5NzMzMTZmYTU1ZTM0Y2U0OTNlMDQzMTNhMiIKIAogUyA9ICIke1VOUEFDS0RJ
Un0vZ3N0LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMx
MjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAw
MS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRj
aAppbmRleCA3MTljNzNkM2UzLi5jYzNmMzBlNjcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1Iw
MDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNh
cHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGEzN2YwMDYzMTAzZTk4ZjUxMDkxMzJlYTMw
MmI5MTliOTJlMjZhMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFiZWJlN2ZhYjZl
Y2M4YzIyZTk2MDNlM2IwM2MyNWVlNDFlMDkxNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBEYXRlOiBXZWQsIDE0IE1heSAy
MDE0IDEwOjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEVOR1IwMDMxMjUxNTogZ2V0IGNh
cHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcwpAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIGRpZmYgLS1naXQgYS9n
c3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMgYi9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2Rl
bXV4LmMKIG9sZCBtb2RlIDEwMDY0NAogbmV3IG1vZGUgMTAwNzU1Ci1pbmRleCA5NzVmZTgzLi5k
ZjgyODQwCitpbmRleCAxNmJmMDAxLi5lMTdhMTQ0CiAtLS0gYS9nc3QtbGlicy9nc3QvdGFnL2dz
dHRhZ2RlbXV4LmMKICsrKyBiL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwotQEAgLTE3
OTYsNiArMTc5NiwxOSBAQCBnc3RfdGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFkICogcGFkLCBH
c3RPYmplY3QgKiBwYXJlbnQsIEdzdFF1ZXJ5ICogcXVlcnkpCitAQCAtMTc5Nyw2ICsxNzk3LDE5
IEBAIGdzdF90YWdfZGVtdXhfcGFkX3F1ZXJ5IChHc3RQYWQgKiBwYWQsIEdzdE9iamVjdCAqIHBh
cmVudCwgR3N0UXVlcnkgKiBxdWVyeSkKICAgICAgICB9CiAgICAgICAgYnJlYWs7CiAgICAgIH0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJz
aW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNp
bmcucGF0Y2gKaW5kZXggYmYxZTJhODllMy4uMDAyMmNlNmRhYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAw
Mi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Uv
MDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGY4OTJmMGJlOGFlODhhY2M2NDgyZjRiOWE5YTRkYjVmMDNiN2FkZjgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg0ZDhiYjAzYjYwN2Y1YTcwYTA1ODUxYjlk
MzY4NGI2MmFjNGM3ZDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5na2UgV2Fu
ZyA8bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFRodSwgMTkgTWFyIDIwMTUgMTQ6
MTc6MTAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFyc2U6IGVuaGFuY2UgU1NBIHRleHQg
bGluZXMgcGFyc2luZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25m
aWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcu
aC1pcy1pbmNsdWRlZC5wYXRjaAppbmRleCAxYTk4OGI5OWRlLi5lYmRkM2IxOTIxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZjA2ZjRiMmYxM2YwMjgyNTAxODkyMjVhNDZhMzlmNDAy
NDI4OTMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMWRkZWIyMzAxNWE5Y2Y1OTAx
ZmUzNGM2YzlhOTY0ODlhMjc0NDAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2Fy
bG9zIFJhZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KIERhdGU6IFR1ZSwgMjEgTWF5
IDIwMTkgMTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdml2LWZiOiBNYWtlIHN1cmUg
Y29uZmlnLmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuOS5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjgu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjkuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlXzEuMjguMS5iYgppbmRleCA3NGI2ZjIzMDhkLi5mMWZhZWNmZTBjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yOC4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1i
YXNlL2dzdC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1
cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1z
c2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFkYjRlYzlhZTViZTIxOTRmZjhjY2YyYjVmZWNk
YzA2OTI1MmZlNDQxNjkyMWIwODNhOTIxZWY3MWRkMDAwYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIxNDQ2YTRjMmE5MmZmNWQ3OGQ4OGU4NWE1OTlmMDAzODQ0MWQ1MzMzMzIzNmYwYzcyZDcyZjIx
YTljMTMyNDk3IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtcGx1Z2lucy1iYXNlLSR7UFZ9Igog
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtZ29vZF8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI4LjEuYmIKaW5k
ZXggZTdjYTI2NDA2ZC4uOThmMmZlM2JhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi45LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1n
b29kXzEuMjguMS5iYgpAQCAtNiw3ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9pc3N1ZXMKIAog
U1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVn
aW5zLWdvb2QvZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJmMzg1NjZmYjUzYWU1NmI3MDE5YTAzOTQ3NTMxMTc1NmEyOGViOTc4YTc4MTE1NGQ2
NzgxM2RjYjU1MWZmNWZlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjczOGUyNmFlZTQxYjdhNjIw
NTBlNDBiODFhZGMwMTdhMTEwYTdmMzJkMWVjNDlmYTZhMDMwMDg0NmM0NDM2OGQiCiAKIFMgPSAi
JHtVTlBBQ0tESVJ9L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEu
MjYuOS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy11Z2x5XzEuMjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWds
eV8xLjI2LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjguMS5iYgppbmRleCBlMDRiZmNjODFiLi5lNTE1
ZTc3ZjUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yOC4xLmJiCkBAIC0x
NSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVy
LmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7
UFZ9LnRhci54eiBcCiAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxODRl
NGM2ZTc2NWJjNDYzZWQ4MDZiMjI2M2NiOWIyYWFhM2E2NTQxNWRmMGEzYzIyZmQ1MjBkNWQxYmFj
YjRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwODJmM2NiMDYzZmNjYzNmZmMwNGU1YWIwODU0
YmFmZGU4MmQxYjM3M2ViM2M5ZWFhMjgxMTVkZDNmOTVhNzgiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9
L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi45LmJiIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjkuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yOC4xLmJiCmluZGV4IGFjNmI1MmVlNDYuLjY0ZDM1Mzg0MjkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1z
ZXJ2ZXJfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yOC4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVB
TCA9ICJnc3QtcnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJl
ZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjY3ZTkyZTlhNWIwZjJiNTFlYjU3MWNjODkzYjgwZGEyYWUyMzc0
ZjE5YjA1ZDM4MWQxZTM2NDM5M2ZlMTI2NTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmNkMGU4
NmFmMjBjZmI3NDliZGMyNGQyZjVjMzBmNGU2MGEzZThkMTk4YWU0ZTAyZTc1NGI5OTM3YmRiZjgz
MiIKIAogUyA9ICIke1VOUEFDS0RJUn0vJHtQTlJFQUx9LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============3774764730663335184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 809 Local 743 Mirrors 0 Missed 66 Current 974 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1374 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1433 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1443 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1447 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1461 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1474 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1496 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1520 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/taglib/taglib_2.2.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1521 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1529 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1531 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1541 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1555 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1562 of 1783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2026.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1564 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1568 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx_setscene)
NOTE: recipe speex-1.2.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mpg123-1.33.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsoup-3.6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe taglib-2.2.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.33.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1572 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1601 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsoup-3.6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe taglib-2.2.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1640 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1705 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1711 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1721 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1727 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1741 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1748 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1750 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1753 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1758 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1759 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1760 of 1783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/nasm/nasm_3.01.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1762 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1764 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1766 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1767 of 1783 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nasm-native-3.01-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe nasm-native-3.01-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3211 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3522 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_recipe_qa: Started
NOTE: Running task 3712 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3713 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3714 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_recipe_qa)
NOTE: Running task 3715 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_write_config: Started
NOTE: Running task 3872 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_create_recipe_spdx)
NOTE: Running task 3913 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_write_config)
NOTE: Running task 3914 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_write_config)
NOTE: Running task 3915 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_write_config)
NOTE: Running task 3916 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_recipe_qa unihash changed to 9e5a51287d4055b1a8587ebf58e4f56e2aa3bfee22934ecd88467b5f5490a5dc
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_recipe_qa unihash changed to 0b5f54e71da9e5729bd9dc5608b97e383616c72c7d05968f2dd8d53f1897ff39
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_recipe_qa unihash changed to 2354e4058538c355e9c752cc06434ec7613e9aa2b18d35dcb5195b17148d1ce6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_recipe_qa unihash changed to b13d936b38beb9f58ca273ec8ce90d8192a7560f7cba1341b4faca38ce0df884
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_recipe_qa unihash changed to 50246c43f4bef22e69d2c1e179a7503f13a52056319f21a414477207d59134dd
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3996 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_fetch)
NOTE: Running task 3997 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_fetch)
NOTE: Running task 3998 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_fetch)
NOTE: Running task 3999 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_fetch)
NOTE: Running task 4000 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_fetch)
NOTE: Running task 4001 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_create_recipe_spdx)
NOTE: Running task 4002 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_create_recipe_spdx)
NOTE: Running task 4003 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_create_recipe_spdx)
NOTE: Running task 4004 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4005 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 4006 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_unpack)
NOTE: Running task 4007 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_unpack)
NOTE: Running task 4008 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_unpack)
NOTE: Running task 4009 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4010 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4011 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_patch)
NOTE: Running task 4012 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4013 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4014 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_patch)
NOTE: Running task 4015 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4016 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_populate_lic)
NOTE: Running task 4017 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4018 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4019 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4020 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 4021 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.1.bb:do_deploy_source_date_epoch unihash changed to 1104d37a01e2d6fa8e7d23f6362104cb920157cc01a13ef08123261d60a7081a
NOTE: recipe gstreamer1.0-plugins-ugly-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.1.bb:do_deploy_source_date_epoch unihash changed to 641679f8d16e8288aa50c6b29122b8195451b37477f55d89f3394f9a7c4c0a3b
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.1.bb:do_deploy_source_date_epoch unihash changed to abd98249b4e0b3b1ab7ca4d6e270e0bbd71ea02005db218a5537d152cdc12e9f
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4022 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4023 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.1.bb:do_deploy_source_date_epoch unihash changed to 79ec998c06f5fa5865135b6c743cbe7fe7c99ab2ecb5a29b8ce9052cedd673ee
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 4024 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4025 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_deploy_source_date_epoch unihash changed to 808028a5cd8ef49dc58b1683715c0e1a659877b658eda982249403987ca42f70
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4026 of 4094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-
 core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47
 .bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh
 /build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/
 yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-li
 bc-headers', 'alsa-lib', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'wayland-native', 'at
 tr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=opengl,gles2 -Dgl_platform=egl,glx -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.10.2
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
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/recipe-sysroot-native/usr/bin/pkg-config) 2.5.1
| Run-time dependency valgrind found: NO (tried pkgconfig)
| Run-time dependency libdrm found: YES 2.4.131
| Run-time dependency x11 found: YES 1.8.13
| Run-time dependency gio-2.0 found: YES 2.88.0
| Run-time dependency gio-unix-2.0 found: YES 2.88.0
| Run-time dependency gmodule-no-export-2.0 found: YES 2.88.0
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882, line 176
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882, line 189
NOTE: recipe gstreamer1.0-plugins-base-1.28.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4026 tasks of which 3984 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401062438.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401062438.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/log.do_configure.2639882
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.28.1-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-plugins-base-1.28.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/run.do_configure.2639882' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-base/1.28.1/temp/log.do_configure.2639882
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.1.bb:do_configure) failed with exit code '1'

--===============3774764730663335184==--

