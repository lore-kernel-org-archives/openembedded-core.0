Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391A6C0218F
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17795.1736936765289401376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DQd1mCTC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XS0anrgq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194697fb287-a7e506a8-d245-49d4-a970-a0f6f6c5dfc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936764;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BHyeG6UMlWxOiLrfElVfK/O4gxSEcdJ/pOEX+lGXqak=;
	b=DQd1mCTCytAa9rTPitsHjIYLbi2PBFbrMI2xvPIVgfEas7crtnMZeOQ7NKNr6CB1
	V9zHdEjQjvspPkmn5XYDp/XZwRXR9h8Cb4hi1cAX/Ux8BTuT3rLzaMynia7TNK3jIDN
	hHzAtAZ8ZAv2e6f0qLYWPdd3IMus+VnevUB5MqcI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936764;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BHyeG6UMlWxOiLrfElVfK/O4gxSEcdJ/pOEX+lGXqak=;
	b=XS0anrgqdgQWh9eGrm3jvZhF4gyDMmNKSvPXAdCHiEAh6k6S5rwlXos9R5nX3R1X
	9u/O2KwZXCYGN1fBWIbjMq0SSFHY+RRX7LEHtHx0UOt4BG0x39GdGrQcIpfaacOKKIj
	U8IwDbcAv8xAQr7OwIza3as+KgJLqXzpKOu8OLEA=
Content-Type: multipart/mixed; boundary="===============2854443259708328317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrading to 1.24.11,1.24.11,1.24.11,1.24.11,1.24.11 SUCCEEDED
Message-ID: <01010194697fb287-a7e506a8-d245-49d4-a970-a0f6f6c5dfc9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209832

--===============2854443259708328317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base* to *1.24.11,1.24.11,1.24.11,1.24.11,1.24.11* has Succeeded.

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
From d0eb40743efa1ec9e12cf8d9ccf9d237658035db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 06:25:08 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrade 1.24.10 -> 1.24.11,1.24.10 -> 1.24.11,1.24.10 -> 1.24.11,1.24.10 ->
 1.24.11,1.24.10 -> 1.24.11

---
 ...ninitialized-warnings-when-compiling-with.patch |  2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...lve-missing-opencv-data-dir-in-yocto-buil.patch |  2 +-
 ...4.10.bb => gstreamer1.0-plugins-bad_1.24.11.bb} |  2 +-
 ...515-get-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...2-ssaparse-enhance-SSA-text-lines-parsing.patch | 14 +++++++-------
 ...003-viv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ....10.bb => gstreamer1.0-plugins-base_1.24.11.bb} |  2 +-
 ....10.bb => gstreamer1.0-plugins-good_1.24.11.bb} |  2 +-
 ....10.bb => gstreamer1.0-plugins-ugly_1.24.11.bb} |  2 +-
 ...4.10.bb => gstreamer1.0-rtsp-server_1.24.11.bb} |  2 +-
 11 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.10.bb => gstreamer1.0-plugins-bad_1.24.11.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.10.bb => gstreamer1.0-plugins-base_1.24.11.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.10.bb => gstreamer1.0-plugins-good_1.24.11.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.10.bb => gstreamer1.0-plugins-ugly_1.24.11.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.10.bb => gstreamer1.0-rtsp-server_1.24.11.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index f721103229..a58fd74b06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From fce75512714cc21bd02fa1df95da4cea34bc3118 Mon Sep 17 00:00:00 2001
+From 2e2b0f44a28ec89bb6e24636a076d6c128fd5937 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 28d834dbd4..852e7f2498 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 48b7c48d484096f44ef5f6ac9df35c1e8c1aceff Mon Sep 17 00:00:00 2001
+From a728512087e9d4d549a520efdb907c7714a434d0 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 5143009657..8a6406a61c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 21bf2b1bb9f98d83c7257b0492a0dc70f5d0b9d9 Mon Sep 17 00:00:00 2001
+From a0a422544b936a16ed9b864ccc10f2c391cf5b6c Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.11.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.11.bb
index 789e1aef8e..da5574cb3a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.11.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "1707e3103950c9baed364a8af2ba0495d6b113fcd36e1062dda5f582b8f8904d"
+SRC_URI[sha256sum] = "9126c2b7053a5f059db958f43c6a5230d2e843ff9adff8c8c2477ea2457e3315"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index cec68bd1f4..a7ebd42ea0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 87865e7c96e40553bc39f7697fbc2ef68451725c Mon Sep 17 00:00:00 2001
+From 10d8512a0cd076de50049010f904c9545863cba3 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 9e2e9a702c..e255902c6f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 2dee5ae9ad92a06c73dd72f2ff2f731ce85a8baa Mon Sep 17 00:00:00 2001
+From 1de0e1e9b3b002fc77b5cd9f73cbfdc2d74b5323 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -17,10 +17,10 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index 42fbb42..2dab51c
+index c162a54..bd8afd9
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
-@@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -304,6 +304,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * gst_ssa_parse_push_line:
   * @parse: caller element
   * @txt: text to push
@@ -28,7 +28,7 @@ index 42fbb42..2dab51c
   * @start: timestamp for the buffer
   * @duration: duration for the buffer
   *
-@@ -279,27 +280,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -313,27 +314,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * Returns: result of the push of the created buffer
   */
  static GstFlowReturn
@@ -173,7 +173,7 @@ index 42fbb42..2dab51c
    GST_LOG_OBJECT (parse, "Text : %s", t);
  
    if (gst_ssa_parse_remove_override_codes (parse, t)) {
-@@ -317,13 +424,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
+@@ -351,13 +458,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
    gst_buffer_fill (buf, 0, escaped, len + 1);
    gst_buffer_set_size (buf, len);
    g_free (escaped);
@@ -200,7 +200,7 @@ index 42fbb42..2dab51c
  
    ret = gst_pad_push (parse->srcpad, buf);
  
-@@ -343,6 +459,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -377,6 +493,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    GstClockTime ts;
    gchar *txt;
    GstMapInfo map;
@@ -208,7 +208,7 @@ index 42fbb42..2dab51c
  
    if (G_UNLIKELY (!parse->framed))
      goto not_framed;
-@@ -360,13 +477,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -394,13 +511,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    /* make double-sure it's 0-terminated and all */
    gst_buffer_map (buf, &map, GST_MAP_READ);
    txt = g_strndup ((gchar *) map.data, map.size);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 032be93692..6ce7422832 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 170070d4e7c653c68cdc6401eebfa94fa7d58838 Mon Sep 17 00:00:00 2001
+From 7f477f47d2896d20777cb750c1da8c9935be2139 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.11.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.11.bb
index 452685d2ea..38f11efaeb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "ebd57b1be924c6e24f327dd55bab9d8fbaaebe5e1dc8fca784182ab2b12d23eb"
+SRC_URI[sha256sum] = "98572c1f8b710e52673e250cd96e4f2660d79bd66aa172c5dde5f690c1231e1d"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.11.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.11.bb
index 653aa1cfc4..a7a4b98b43 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.11.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fce748fa66d7a8ee1fb261489e59d01e3fa787623d6d5c35068416fe7cd0acb3"
+SRC_URI[sha256sum] = "94bf3b5118dd4213af66048faac830569cc9a94a8c8e59e8a6d33b315f518462"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.11.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.11.bb
index 607dc71971..5c923c4d93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.11.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "9df6fd85a7256241efbb25f84b337575e3b345266f5dab3849371e4694779f18"
+SRC_URI[sha256sum] = "3a1f58a33aee8d13522865bcb564007a6837ef5711d7dfff8ce4260921013f8a"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.11.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.11.bb
index a33c8c0027..91387917a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.11.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "db21dfdd7bf2e718564d557378ada5358b411efe2a3e89e9f0f87a74537e2adc"
+SRC_URI[sha256sum] = "d147ff75bc445235fe0a4a4714c26d6b7bf9a485a1ae3a722bd530ab28f98bd3"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.44.1


--===============2854443259708328317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30838616 to 30841632 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstcuda-1.0.so.0.2410.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2410.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2410.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2410.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2410.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2410.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2410.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2410.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2410.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2410.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2410.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2410.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2410.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2410.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2410.0 /usr/lib/.debug/libgstplay-1.0.so.0.2410.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2410.0 /usr/lib/.debug/libgstmse-1.0.so.0.2410.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2410.0 /usr/lib/.
 debug/libgstbadaudio-1.0.so.0.2410.0", added "/usr/lib/.debug/libgstcuda-1.0.so.0.2411.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2411.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2411.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2411.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2411.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2411.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2411.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2411.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2411.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2411.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2411.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2411.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2411.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2411.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2411.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2411.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2411.0 /usr/lib/.debug/libgstplay-1.0.so.0.2411.0 /usr/lib/.debug/libgstmse-1.0.so.0.2411.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGSIZE changed from 16905367 to 16912234 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.10.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.11.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2410.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2410.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2410.0", added "/usr/lib/libgstanalytics-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2410.0", added "/usr/lib/libgstanalytics-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2410.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2410.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2410.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2410.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2410.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGSIZE changed from 642090 to 646186 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2410.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2410.0", added "/usr/lib/libgstcodecs-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2410.0", added "/usr/lib/libgstcodecs-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2410.0", added "/usr/lib/libgstcuda-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2410.0", added "/usr/lib/libgstcuda-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2410.0", added "/usr/lib/libgstdxva-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2410.0", added "/usr/lib/libgstdxva-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2410.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2410.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2410.0", added "/usr/lib/libgstisoff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2410.0", added "/usr/lib/libgstisoff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2410.0", added "/usr/lib/libgstmpegts-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2410.0", added "/usr/lib/libgstmpegts-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2410.0", added "/usr/lib/libgstmse-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2410.0", added "/usr/lib/libgstmse-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2410.0", added "/usr/lib/libgstphotography-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2410.0", added "/usr/lib/libgstphotography-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2410.0", added "/usr/lib/libgstplay-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2410.0", added "/usr/lib/libgstplay-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2410.0", added "/usr/lib/libgstplayer-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2410.0", added "/usr/lib/libgstplayer-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2410.0", added "/usr/lib/libgstsctp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2410.0", added "/usr/lib/libgstsctp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2410.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2410.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2410.0", added "/usr/lib/libgstvulkan-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2410.0", added "/usr/lib/libgstvulkan-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2410.0", added "/usr/lib/libgstwayland-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2410.0", added "/usr/lib/libgstwayland-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2410.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2410.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2410.0 to libgstadaptivedemux-1.0.so.0.2411.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2410.0 to libgstanalytics-1.0.so.0.2411.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2410.0 to libgstbadaudio-1.0.so.0.2411.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2410.0 to libgstbasecamerabinsrc-1.0.so.0.2411.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2410.0 to libgstcodecparsers-1.0.so.0.2411.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2410.0 to libgstcodecs-1.0.so.0.2411.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2410.0 to libgstcuda-1.0.so.0.2411.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2410.0 to libgstdxva-1.0.so.0.2411.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2410.0 to libgstinsertbin-1.0.so.0.2411.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2410.0 to libgstisoff-1.0.so.0.2411.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2410.0 to libgstmpegts-1.0.so.0.2411.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2410.0 to libgstmse-1.0.so.0.2411.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2410.0 to libgstphotography-1.0.so.0.2411.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2410.0 to libgstplay-1.0.so.0.2411.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2410.0 to libgstplayer-1.0.so.0.2411.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2410.0 to libgstsctp-1.0.so.0.2411.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2410.0 to libgsturidownloader-1.0.so.0.2411.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2410.0 to libgstvulkan-1.0.so.0.2411.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2410.0 to libgstwayland-1.0.so.0.2411.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2410.0 to libgstwebrtc-1.0.so.0.2411.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2410.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2411.0
  /usr/lib/libgstanalytics-1.0.so.0.2410.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2411.0
  /usr/lib/libgstbadaudio-1.0.so.0.2410.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2411.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2410.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2411.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2410.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2411.0
  /usr/lib/libgstcodecs-1.0.so.0.2410.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2411.0
  /usr/lib/libgstcuda-1.0.so.0.2410.0 moved to /usr/lib/libgstcuda-1.0.so.0.2411.0
  /usr/lib/libgstdxva-1.0.so.0.2410.0 moved to /usr/lib/libgstdxva-1.0.so.0.2411.0
  /usr/lib/libgstinsertbin-1.0.so.0.2410.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2411.0
  /usr/lib/libgstisoff-1.0.so.0.2410.0 moved to /usr/lib/libgstisoff-1.0.so.0.2411.0
  /usr/lib/libgstmpegts-1.0.so.0.2410.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2411.0
  /usr/lib/libgstmse-1.0.so.0.2410.0 moved to /usr/lib/libgstmse-1.0.so.0.2411.0
  /usr/lib/libgstphotography-1.0.so.0.2410.0 moved to /usr/lib/libgstphotography-1.0.so.0.2411.0
  /usr/lib/libgstplay-1.0.so.0.2410.0 moved to /usr/lib/libgstplay-1.0.so.0.2411.0
  /usr/lib/libgstplayer-1.0.so.0.2410.0 moved to /usr/lib/libgstplayer-1.0.so.0.2411.0
  /usr/lib/libgstsctp-1.0.so.0.2410.0 moved to /usr/lib/libgstsctp-1.0.so.0.2411.0
  /usr/lib/libgsturidownloader-1.0.so.0.2410.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2411.0
  /usr/lib/libgstvulkan-1.0.so.0.2410.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2411.0
  /usr/lib/libgstwayland-1.0.so.0.2410.0 moved to /usr/lib/libgstwayland-1.0.so.0.2411.0
  /usr/lib/libgstwebrtc-1.0.so.0.2410.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2411.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 20362376 to 20360472 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgsttag-1.0.so.0.2410.0 /usr/lib/.debug/libgstfft-1.0.so.0.2410.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2410.0 /usr/lib/.debug/libgstapp-1.0.so.0.2410.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2410.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2410.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2410.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2410.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2410.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2410.0 /usr/lib/.debug/libgstgl-1.0.so.0.2410.0 /usr/lib/.debug/libgstriff-1.0.so.0.2410.0", added "/usr/lib/.debug/libgsttag-1.0.so.0.2411.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2411.0 /usr/lib/.debug/libgstfft-1.0.so.0.2411.0 /usr/lib/.debug/libgstapp-1.0.so.0.2411.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2411.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2411.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2411.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2411.0 /usr/lib/.debug
 /libgstaudio-1.0.so.0.2411.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2411.0 /usr/lib/.debug/libgstgl-1.0.so.0.2411.0 /usr/lib/.debug/libgstriff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6216379 to 6216464 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 14321330 to 14320380 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.10.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.11.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2410.0", added "/usr/lib/libgstallocators-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2410.0", added "/usr/lib/libgstallocators-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2410.0", added "/usr/lib/libgstapp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2410.0", added "/usr/lib/libgstapp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2410.0", added "/usr/lib/libgstaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2410.0", added "/usr/lib/libgstaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2410.0", added "/usr/lib/libgstfft-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2410.0", added "/usr/lib/libgstfft-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2410.0", added "/usr/lib/libgstgl-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2410.0", added "/usr/lib/libgstgl-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2410.0", added "/usr/lib/libgstpbutils-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2410.0", added "/usr/lib/libgstpbutils-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2410.0", added "/usr/lib/libgstriff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2410.0", added "/usr/lib/libgstriff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2410.0", added "/usr/lib/libgstrtp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2410.0", added "/usr/lib/libgstrtp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2410.0", added "/usr/lib/libgstrtsp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2410.0", added "/usr/lib/libgstrtsp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2410.0", added "/usr/lib/libgstsdp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2410.0", added "/usr/lib/libgstsdp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2410.0", added "/usr/lib/libgsttag-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2410.0", added "/usr/lib/libgsttag-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2410.0", added "/usr/lib/libgstvideo-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2410.0", added "/usr/lib/libgstvideo-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2410.0 to libgstallocators-1.0.so.0.2411.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2410.0 to libgstapp-1.0.so.0.2411.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2410.0 to libgstaudio-1.0.so.0.2411.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2410.0 to libgstfft-1.0.so.0.2411.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2410.0 to libgstgl-1.0.so.0.2411.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2410.0 to libgstpbutils-1.0.so.0.2411.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2410.0 to libgstriff-1.0.so.0.2411.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2410.0 to libgstrtp-1.0.so.0.2411.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2410.0 to libgstrtsp-1.0.so.0.2411.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2410.0 to libgstsdp-1.0.so.0.2411.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2410.0 to libgsttag-1.0.so.0.2411.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2410.0 to libgstvideo-1.0.so.0.2411.0
  /usr/lib/libgstallocators-1.0.so.0.2410.0 moved to /usr/lib/libgstallocators-1.0.so.0.2411.0
  /usr/lib/libgstapp-1.0.so.0.2410.0 moved to /usr/lib/libgstapp-1.0.so.0.2411.0
  /usr/lib/libgstaudio-1.0.so.0.2410.0 moved to /usr/lib/libgstaudio-1.0.so.0.2411.0
  /usr/lib/libgstfft-1.0.so.0.2410.0 moved to /usr/lib/libgstfft-1.0.so.0.2411.0
  /usr/lib/libgstgl-1.0.so.0.2410.0 moved to /usr/lib/libgstgl-1.0.so.0.2411.0
  /usr/lib/libgstpbutils-1.0.so.0.2410.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2411.0
  /usr/lib/libgstriff-1.0.so.0.2410.0 moved to /usr/lib/libgstriff-1.0.so.0.2411.0
  /usr/lib/libgstrtp-1.0.so.0.2410.0 moved to /usr/lib/libgstrtp-1.0.so.0.2411.0
  /usr/lib/libgstrtsp-1.0.so.0.2410.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2411.0
  /usr/lib/libgstsdp-1.0.so.0.2410.0 moved to /usr/lib/libgstsdp-1.0.so.0.2411.0
  /usr/lib/libgsttag-1.0.so.0.2410.0 moved to /usr/lib/libgsttag-1.0.so.0.2411.0
  /usr/lib/libgstvideo-1.0.so.0.2410.0 moved to /usr/lib/libgstvideo-1.0.so.0.2411.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 23354288 to 23356360 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13326583 to 13328539 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.11.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.11.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2410.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.11.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2410.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2410.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2410.0 to libgstrtspserver-1.0.so.0.2411.0
  /usr/lib/libgstrtspserver-1.0.so.0.2410.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2411.0

--===============2854443259708328317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2410.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2410.0", added "/usr/lib/libgstanalytics-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2410.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2410.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2410.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2410.0", added "/usr/lib/libgstcodecs-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2410.0", added "/usr/lib/libgstcuda-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2410.0", added "/usr/lib/libgstdxva-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2410.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2410.0", added "/usr/lib/libgstisoff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2410.0", added "/usr/lib/libgstmpegts-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2410.0", added "/usr/lib/libgstmse-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2410.0", added "/usr/lib/libgstphotography-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2410.0", added "/usr/lib/libgstplay-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2410.0", added "/usr/lib/libgstplayer-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2410.0", added "/usr/lib/libgstsctp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2410.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2410.0", added "/usr/lib/libgstvulkan-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2410.0", added "/usr/lib/libgstwayland-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2410.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2410.0 to libgstadaptivedemux-1.0.so.0.2411.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2410.0 to libgstanalytics-1.0.so.0.2411.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2410.0 to libgstbadaudio-1.0.so.0.2411.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2410.0 to libgstbasecamerabinsrc-1.0.so.0.2411.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2410.0 to libgstcodecparsers-1.0.so.0.2411.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2410.0 to libgstcodecs-1.0.so.0.2411.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2410.0 to libgstcuda-1.0.so.0.2411.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2410.0 to libgstdxva-1.0.so.0.2411.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2410.0 to libgstinsertbin-1.0.so.0.2411.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2410.0 to libgstisoff-1.0.so.0.2411.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2410.0 to libgstmpegts-1.0.so.0.2411.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2410.0 to libgstmse-1.0.so.0.2411.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2410.0 to libgstphotography-1.0.so.0.2411.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2410.0 to libgstplay-1.0.so.0.2411.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2410.0 to libgstplayer-1.0.so.0.2411.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2410.0 to libgstsctp-1.0.so.0.2411.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2410.0 to libgsturidownloader-1.0.so.0.2411.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2410.0 to libgstvulkan-1.0.so.0.2411.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2410.0 to libgstwayland-1.0.so.0.2411.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2410.0 to libgstwebrtc-1.0.so.0.2411.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2410.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2411.0
  /usr/lib/libgstanalytics-1.0.so.0.2410.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2411.0
  /usr/lib/libgstbadaudio-1.0.so.0.2410.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2411.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2410.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2411.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2410.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2411.0
  /usr/lib/libgstcodecs-1.0.so.0.2410.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2411.0
  /usr/lib/libgstcuda-1.0.so.0.2410.0 moved to /usr/lib/libgstcuda-1.0.so.0.2411.0
  /usr/lib/libgstdxva-1.0.so.0.2410.0 moved to /usr/lib/libgstdxva-1.0.so.0.2411.0
  /usr/lib/libgstinsertbin-1.0.so.0.2410.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2411.0
  /usr/lib/libgstisoff-1.0.so.0.2410.0 moved to /usr/lib/libgstisoff-1.0.so.0.2411.0
  /usr/lib/libgstmpegts-1.0.so.0.2410.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2411.0
  /usr/lib/libgstmse-1.0.so.0.2410.0 moved to /usr/lib/libgstmse-1.0.so.0.2411.0
  /usr/lib/libgstphotography-1.0.so.0.2410.0 moved to /usr/lib/libgstphotography-1.0.so.0.2411.0
  /usr/lib/libgstplay-1.0.so.0.2410.0 moved to /usr/lib/libgstplay-1.0.so.0.2411.0
  /usr/lib/libgstplayer-1.0.so.0.2410.0 moved to /usr/lib/libgstplayer-1.0.so.0.2411.0
  /usr/lib/libgstsctp-1.0.so.0.2410.0 moved to /usr/lib/libgstsctp-1.0.so.0.2411.0
  /usr/lib/libgsturidownloader-1.0.so.0.2410.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2411.0
  /usr/lib/libgstvulkan-1.0.so.0.2410.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2411.0
  /usr/lib/libgstwayland-1.0.so.0.2410.0 moved to /usr/lib/libgstwayland-1.0.so.0.2411.0
  /usr/lib/libgstwebrtc-1.0.so.0.2410.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2411.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2410.0", added "/usr/lib/libgstallocators-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2410.0", added "/usr/lib/libgstapp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2410.0", added "/usr/lib/libgstaudio-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2410.0", added "/usr/lib/libgstfft-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2410.0", added "/usr/lib/libgstgl-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2410.0", added "/usr/lib/libgstpbutils-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2410.0", added "/usr/lib/libgstriff-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2410.0", added "/usr/lib/libgstrtp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2410.0", added "/usr/lib/libgstrtsp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2410.0", added "/usr/lib/libgstsdp-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2410.0", added "/usr/lib/libgsttag-1.0.so.0.2411.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2410.0", added "/usr/lib/libgstvideo-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2410.0 to libgstallocators-1.0.so.0.2411.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2410.0 to libgstapp-1.0.so.0.2411.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2410.0 to libgstaudio-1.0.so.0.2411.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2410.0 to libgstfft-1.0.so.0.2411.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2410.0 to libgstgl-1.0.so.0.2411.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2410.0 to libgstpbutils-1.0.so.0.2411.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2410.0 to libgstriff-1.0.so.0.2411.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2410.0 to libgstrtp-1.0.so.0.2411.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2410.0 to libgstrtsp-1.0.so.0.2411.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2410.0 to libgstsdp-1.0.so.0.2411.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2410.0 to libgsttag-1.0.so.0.2411.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2410.0 to libgstvideo-1.0.so.0.2411.0
  /usr/lib/libgstallocators-1.0.so.0.2410.0 moved to /usr/lib/libgstallocators-1.0.so.0.2411.0
  /usr/lib/libgstapp-1.0.so.0.2410.0 moved to /usr/lib/libgstapp-1.0.so.0.2411.0
  /usr/lib/libgstaudio-1.0.so.0.2410.0 moved to /usr/lib/libgstaudio-1.0.so.0.2411.0
  /usr/lib/libgstfft-1.0.so.0.2410.0 moved to /usr/lib/libgstfft-1.0.so.0.2411.0
  /usr/lib/libgstgl-1.0.so.0.2410.0 moved to /usr/lib/libgstgl-1.0.so.0.2411.0
  /usr/lib/libgstpbutils-1.0.so.0.2410.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2411.0
  /usr/lib/libgstriff-1.0.so.0.2410.0 moved to /usr/lib/libgstriff-1.0.so.0.2411.0
  /usr/lib/libgstrtp-1.0.so.0.2410.0 moved to /usr/lib/libgstrtp-1.0.so.0.2411.0
  /usr/lib/libgstrtsp-1.0.so.0.2410.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2411.0
  /usr/lib/libgstsdp-1.0.so.0.2410.0 moved to /usr/lib/libgstsdp-1.0.so.0.2411.0
  /usr/lib/libgsttag-1.0.so.0.2410.0 moved to /usr/lib/libgsttag-1.0.so.0.2411.0
  /usr/lib/libgstvideo-1.0.so.0.2410.0 moved to /usr/lib/libgstvideo-1.0.so.0.2411.0
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2410.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2411.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2410.0 to libgstrtspserver-1.0.so.0.2411.0
  /usr/lib/libgstrtspserver-1.0.so.0.2410.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2411.0

--===============2854443259708328317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-gstreamer1.0-plugins-bad-g.patch"

RnJvbSBkMGViNDA3NDNlZmExZWM5ZTEyY2Y4ZDljY2Y5ZDIzNzY1ODAzNWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDY6MjU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHksZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLGdzdHJl
YW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kLGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2U6CiB1cGdyYWRlIDEuMjQuMTAgLT4gMS4yNC4xMSwxLjI0LjEwIC0+IDEu
MjQuMTEsMS4yNC4xMCAtPiAxLjI0LjExLDEuMjQuMTAgLT4KIDEuMjQuMTEsMS4yNC4xMCAtPiAx
LjI0LjExCgotLS0KIC4uLm5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRo
LnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVj
dGx5LnBhdGNoIHwgIDIgKy0KIC4uLmx2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0
by1idWlsLnBhdGNoIHwgIDIgKy0KIC4uLjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjQuMTEuYmJ9IHwgIDIgKy0KIC4uLjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hl
bi1xdWVyeS1jYXBzLnBhdGNoIHwgIDIgKy0KIC4uLjItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4
dC1saW5lcy1wYXJzaW5nLnBhdGNoIHwgMTQgKysrKysrKy0tLS0tLS0KIC4uLjAwMy12aXYtZmIt
TWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoIHwgIDIgKy0KIC4uLi4xMC5iYiA9
PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMTEuYmJ9IHwgIDIgKy0KIC4uLi4xMC5i
YiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuMTEuYmJ9IHwgIDIgKy0KIC4uLi4x
MC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuMTEuYmJ9IHwgIDIgKy0KIC4u
LjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuMTEuYmJ9IHwgIDIgKy0K
IDExIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFkXzEuMjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuMTEuYmJ9
ICg5OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMTAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZV8xLjI0LjExLmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjEwLmJiID0+IGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yNC4xMS5iYn0gKDk3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC4xMC5iYiA9
PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuMTEuYmJ9ICg5NCUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJf
MS4yNC4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4xMS5iYn0gKDkwJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hl
bi1jb21waWxpbmctd2l0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13
YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCmluZGV4IGY3MjExMDMyMjkuLmE1OGZk
NzRiMDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5n
cy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0
aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmY2U3NTUxMjcxNGNjMjFiZDAyZmExZGY5NWRhNGNlYTM0YmMzMTE4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyZTJiMGY0NGEyOGVjODliYjZlMjQ2MzZhMDc2ZDZjMTI4
ZmQ1OTM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJt
Y2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6MTY6MDEgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZ3Mgd2hlbiBj
b21waWxpbmcgd2l0aCAtT3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lz
LXBvbGwuaC1kaXJlY3RseS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwu
aC1kaXJlY3RseS5wYXRjaAppbmRleCAyOGQ4MzRkYmQ0Li44NTJlN2YyNDk4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0OGI3YzQ4ZDQ4NDA5NmY0NGVmNWY2YWM5ZGYzNWMxZThjMWFjZWZmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNzI4NTEyMDg3ZTlkNGQ1NDlhNTIwZWZkYjkw
N2M3NzE0YTQzNGQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJk
eSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAxNiAxODowNTo0MSAt
MDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9wb2xsLmg+IGRpcmVj
dGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0
YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5n
LW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDUxNDMwMDk2NTcuLjhh
NjQwNmE2MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5j
di1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2
ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyMWJmMmIxYmI5Zjk4ZDgzYzcyNTdiMDQ5MmEwZGM3MGY1ZDBiOWQ5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMGE0MjI1NDRiOTM2YTE2ZWQ5Yjg2NGNjYzEwZjJj
MzkxY2Y1YjZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmV5IFpoaXpoaWtp
biA8YW5kcmV5LnpAZ21haWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAyMCAxMDoyMjozNSAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2luZyBvcGVuY3YgZGF0
YSBkaXIgaW4geW9jdG8gYnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC4xMC5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC4x
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuMTAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYWRfMS4yNC4xMS5iYgppbmRleCA3ODllMWFlZjhlLi5kYTU1NzRjYjNhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjQuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI0LjExLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1i
YWQvZ3N0LXBsdWdpbnMtYmFkCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWF2b2lkLWluY2x1ZGlu
Zy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtb3Bl
bmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNzA3ZTMxMDM5NTBjOWJhZWQz
NjRhOGFmMmJhMDQ5NWQ2YjExM2ZjZDM2ZTEwNjJkZGE1ZjU4MmI4Zjg5MDRkIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjkxMjZjMmI3MDUzYTVmMDU5ZGI5NThmNDNjNmE1MjMwZDJlODQzZmY5YWRm
ZjhjOGMyNDc3ZWEyNDU3ZTMzMTUiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1iYWQt
JHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20t
c3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQt
Y2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCmluZGV4IGNlYzY4YmQxZjQu
LmE3ZWJkNDJlYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZy
b20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1
MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gODc4NjVlN2M5NmU0MDU1M2JjMzlmNzY5N2ZiYzJlZjY4NDUxNzI1YyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTBkODUxMmEwY2QwNzZkZTUwMDQ5MDEwZjkwNGM5
NTQ1ODYzY2JhMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IHpob3VtaW5nIDxiNDI1
ODZAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFdlZCwgMTQgTWF5IDIwMTQgMTA6MTY6MjAgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gRU5HUjAwMzEyNTE1OiBnZXQgY2FwcyBmcm9tIHNyYyBwYWQgd2hl
biBxdWVyeSBjYXBzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRl
eHQtbGluZXMtcGFyc2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4
dC1saW5lcy1wYXJzaW5nLnBhdGNoCmluZGV4IDllMmU5YTcwMmMuLmUyNTU5MDJjNmYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5n
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZGVlNWFlOWFkOTJhMDZjNzNkZDcyZjJmZjJm
NzMxY2U4NWE4YmFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZGUwZTFlOWIzYjAw
MmZjNzdiNWNkOWY3M2NiZmRjMmQ3NGI1MzIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTWluZ2tlIFdhbmcgPG1pbmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5
IE1hciAyMDE1IDE0OjE3OjEwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNlOiBlbmhh
bmNlIFNTQSB0ZXh0IGxpbmVzIHBhcnNpbmcuCkBAIC0xNywxMCArMTcsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogTWluZ2tlIFdhbmcgPG1pbmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBkaWZmIC0tZ2l0
IGEvZ3N0L3N1YnBhcnNlL2dzdHNzYXBhcnNlLmMgYi9nc3Qvc3VicGFyc2UvZ3N0c3NhcGFyc2Uu
Ywogb2xkIG1vZGUgMTAwNjQ0CiBuZXcgbW9kZSAxMDA3NTUKLWluZGV4IDQyZmJiNDIuLjJkYWI1
MWMKK2luZGV4IGMxNjJhNTQuLmJkOGFmZDkKIC0tLSBhL2dzdC9zdWJwYXJzZS9nc3Rzc2FwYXJz
ZS5jCiArKysgYi9nc3Qvc3VicGFyc2UvZ3N0c3NhcGFyc2UuYwotQEAgLTI3MCw2ICsyNzAsNyBA
QCBnc3Rfc3NhX3BhcnNlX3JlbW92ZV9vdmVycmlkZV9jb2RlcyAoR3N0U3NhUGFyc2UgKiBwYXJz
ZSwgZ2NoYXIgKiB0eHQpCitAQCAtMzA0LDYgKzMwNCw3IEBAIGdzdF9zc2FfcGFyc2VfcmVtb3Zl
X292ZXJyaWRlX2NvZGVzIChHc3RTc2FQYXJzZSAqIHBhcnNlLCBnY2hhciAqIHR4dCkKICAgKiBn
c3Rfc3NhX3BhcnNlX3B1c2hfbGluZToKICAgKiBAcGFyc2U6IGNhbGxlciBlbGVtZW50CiAgICog
QHR4dDogdGV4dCB0byBwdXNoCkBAIC0yOCw3ICsyOCw3IEBAIGluZGV4IDQyZmJiNDIuLjJkYWI1
MWMKICAgKiBAc3RhcnQ6IHRpbWVzdGFtcCBmb3IgdGhlIGJ1ZmZlcgogICAqIEBkdXJhdGlvbjog
ZHVyYXRpb24gZm9yIHRoZSBidWZmZXIKICAgKgotQEAgLTI3OSwyNyArMjgwLDEzMyBAQCBnc3Rf
c3NhX3BhcnNlX3JlbW92ZV9vdmVycmlkZV9jb2RlcyAoR3N0U3NhUGFyc2UgKiBwYXJzZSwgZ2No
YXIgKiB0eHQpCitAQCAtMzEzLDI3ICszMTQsMTMzIEBAIGdzdF9zc2FfcGFyc2VfcmVtb3ZlX292
ZXJyaWRlX2NvZGVzIChHc3RTc2FQYXJzZSAqIHBhcnNlLCBnY2hhciAqIHR4dCkKICAgKiBSZXR1
cm5zOiByZXN1bHQgb2YgdGhlIHB1c2ggb2YgdGhlIGNyZWF0ZWQgYnVmZmVyCiAgICovCiAgc3Rh
dGljIEdzdEZsb3dSZXR1cm4KQEAgLTE3Myw3ICsxNzMsNyBAQCBpbmRleCA0MmZiYjQyLi4yZGFi
NTFjCiAgICBHU1RfTE9HX09CSkVDVCAocGFyc2UsICJUZXh0IDogJXMiLCB0KTsKICAKICAgIGlm
IChnc3Rfc3NhX3BhcnNlX3JlbW92ZV9vdmVycmlkZV9jb2RlcyAocGFyc2UsIHQpKSB7Ci1AQCAt
MzE3LDEzICs0MjQsMjIgQEAgZ3N0X3NzYV9wYXJzZV9wdXNoX2xpbmUgKEdzdFNzYVBhcnNlICog
cGFyc2UsIGdjaGFyICogdHh0LAorQEAgLTM1MSwxMyArNDU4LDIyIEBAIGdzdF9zc2FfcGFyc2Vf
cHVzaF9saW5lIChHc3RTc2FQYXJzZSAqIHBhcnNlLCBnY2hhciAqIHR4dCwKICAgIGdzdF9idWZm
ZXJfZmlsbCAoYnVmLCAwLCBlc2NhcGVkLCBsZW4gKyAxKTsKICAgIGdzdF9idWZmZXJfc2V0X3Np
emUgKGJ1ZiwgbGVuKTsKICAgIGdfZnJlZSAoZXNjYXBlZCk7CkBAIC0yMDAsNyArMjAwLDcgQEAg
aW5kZXggNDJmYmI0Mi4uMmRhYjUxYwogIAogICAgcmV0ID0gZ3N0X3BhZF9wdXNoIChwYXJzZS0+
c3JjcGFkLCBidWYpOwogIAotQEAgLTM0Myw2ICs0NTksNyBAQCBnc3Rfc3NhX3BhcnNlX2NoYWlu
IChHc3RQYWQgKiBzaW5rcGFkLCBHc3RPYmplY3QgKiBwYXJlbnQsIEdzdEJ1ZmZlciAqIGJ1ZikK
K0BAIC0zNzcsNiArNDkzLDcgQEAgZ3N0X3NzYV9wYXJzZV9jaGFpbiAoR3N0UGFkICogc2lua3Bh
ZCwgR3N0T2JqZWN0ICogcGFyZW50LCBHc3RCdWZmZXIgKiBidWYpCiAgICBHc3RDbG9ja1RpbWUg
dHM7CiAgICBnY2hhciAqdHh0OwogICAgR3N0TWFwSW5mbyBtYXA7CkBAIC0yMDgsNyArMjA4LDcg
QEAgaW5kZXggNDJmYmI0Mi4uMmRhYjUxYwogIAogICAgaWYgKEdfVU5MSUtFTFkgKCFwYXJzZS0+
ZnJhbWVkKSkKICAgICAgZ290byBub3RfZnJhbWVkOwotQEAgLTM2MCwxMyArNDc3LDE0IEBAIGdz
dF9zc2FfcGFyc2VfY2hhaW4gKEdzdFBhZCAqIHNpbmtwYWQsIEdzdE9iamVjdCAqIHBhcmVudCwg
R3N0QnVmZmVyICogYnVmKQorQEAgLTM5NCwxMyArNTExLDE0IEBAIGdzdF9zc2FfcGFyc2VfY2hh
aW4gKEdzdFBhZCAqIHNpbmtwYWQsIEdzdE9iamVjdCAqIHBhcmVudCwgR3N0QnVmZmVyICogYnVm
KQogICAgLyogbWFrZSBkb3VibGUtc3VyZSBpdCdzIDAtdGVybWluYXRlZCBhbmQgYWxsICovCiAg
ICBnc3RfYnVmZmVyX21hcCAoYnVmLCAmbWFwLCBHU1RfTUFQX1JFQUQpOwogICAgdHh0ID0gZ19z
dHJuZHVwICgoZ2NoYXIgKikgbWFwLmRhdGEsIG1hcC5zaXplKTsKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAw
MDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMt
dml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAppbmRleCAwMzJiZTkz
NjkyLi42Y2U3NDIyODMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNv
bmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNzAwNzBkNGU3
YzY1M2M2OGNkYzY0MDFlZWJmYTk0ZmE3ZDU4ODM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA3ZjQ3N2Y0N2QyODk2ZDIwNzc3Y2I3NTBjMWRhOGM5OTM1YmUyMTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQ2FybG9zIFJhZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94
Lm9yZz4KIERhdGU6IFR1ZSwgMjEgTWF5IDIwMTkgMTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmlnLmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlXzEuMjQuMTAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlXzEuMjQuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMTEuYmIKaW5kZXggNDUyNjg1
ZDJlYS4uMzhmMTFlZmFlYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC4xMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0
LjExLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJl
ZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dzdC1wbHVnaW5zLWJhCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxp
bmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZWJkNTdiMWJlOTI0YzZlMjRmMzI3ZGQ1NWJhYjlkOGZiYWFlYmU1ZTFkYzhmY2E3ODQxODJhYjJi
MTJkMjNlYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ODU3MmMxZjhiNzEwZTUyNjczZTI1MGNk
OTZlNGYyNjYwZDc5YmQ2NmFhMTcyYzVkZGU1ZjY5MGMxMjMxZTFkIgogCiBTID0gIiR7V09SS0RJ
Un0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC4xMC5iYiBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1n
b29kXzEuMjQuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC4x
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWdvb2RfMS4yNC4xMS5iYgppbmRleCA2NTNhYTFjZmM0Li5hN2E0Yjk4YjQz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtZ29vZF8xLjI0LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuMTEuYmIKQEAgLTYsNyAr
Niw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJl
YW1lci9nc3QtcGx1Z2lucy1nb29kLy0vaXNzdWVzCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3Ry
ZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1nb29kL2dzdC1wbHVnaW5zLWdv
b2QtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmNlNzQ4ZmE2NmQ3YThl
ZTFmYjI2MTQ4OWU1OWQwMWUzZmE3ODc2MjNkNmQ1YzM1MDY4NDE2ZmU3Y2QwYWNiMyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5NGJmM2I1MTE4ZGQ0MjEzYWY2NjA0OGZhYWM4MzA1NjljYzlhOTRh
OGM4ZTU5ZThhNmQzM2IzMTVmNTE4NDYyIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMt
Z29vZC0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC4xMC5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuMTEuYmIK
c2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC4xMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVn
bHlfMS4yNC4xMS5iYgppbmRleCA2MDdkYzcxOTcxLi41YzkyM2M0ZDkzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWds
eV8xLjI0LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuMTEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VS
SSA9ICIgXAogICAgICAgICAgICAgaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlkZjZmZDg1YTcyNTYyNDFlZmJiMjVm
ODRiMzM3NTc1ZTNiMzQ1MjY2ZjVkYWIzODQ5MzcxZTQ2OTQ3NzlmMTgiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiM2ExZjU4YTMzYWVlOGQxMzUyMjg2NWJjYjU2NDAwN2E2ODM3ZWY1NzExZDdkZmZm
OGNlNDI2MDkyMTAxM2Y4YSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLXVnbHktJHtQ
Vn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4xMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4xMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4xMS5i
YgppbmRleCBhMzNjOGMwMDI3Li45MTM4NzkxN2E5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuMTAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNw
LXNlcnZlcl8xLjI0LjExLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1z
ZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImRiMjFkZmRkN2JmMmU3MTg1NjRkNTU3Mzc4YWRhNTM1OGI0MTFlZmUyYTNlODllOWYwZjg3
YTc0NTM3ZTJhZGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDE0N2ZmNzViYzQ0NTIzNWZlMGE0
YTQ3MTRjMjZkNmI3YmY5YTQ4NWExYWUzYTcyMmJkNTMwYWIyOGY5OGJkMyIKIAogUyA9ICIke1dP
UktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40NC4xCgo=

--===============2854443259708328317==--

