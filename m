Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A44C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:44:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web10.16801.1708083849683567357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GH6gIV9W;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083850; x=1739619850;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TaqN0I13usp7zU6x/skuX0w6Aty4CA9sVWPq9mwIqf4=;
  b=GH6gIV9WWa+ivygJlFydAXVeomiVS7qrDfYEPDi/n1Rp3dHF8YHpSQD0
   mEjTUaNgkTm2lN95g7GiiKzsf5VOqjS1E3e4rKV9xcChtn+FbZNCGc78t
   Q7a3fALPP6b5Xu3cpza+SuURrAWZRsUbqIBnl1VZTqXoUV7vcwyMFRTh8
   ORUarhvg4PmpgLESNfrFYeX1C0/OQK8Ci6WmMx3avGOX+NglCLdZGD2rA
   qTO4mP2AFIaTlAJo8PoQQpbMYyNh/6L22v7mQy0tmDWAFCtaiC1oaeAO6
   nQAbcQCjDsKwi7uogvk7qCgAKXYWgqEuL1Y3k9JhGKs4Z913Pg55EzWQr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="6018333"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="6018333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3786996"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:44:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gstreamer1.0: upgrade 1.22.9 -> 1.22.10
Date: Fri, 16 Feb 2024 19:43:52 +0800
Message-ID: <20240216114352.109711-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <17B4550819426AC1.23024@lists.openembedded.org>
References: <17B4550819426AC1.23024@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195757

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ct-has-a-different-signature-on-musl.patch |  3 +-
 ...ools_1.22.9.bb => gst-devtools_1.22.10.bb} |  2 +-
 ....22.9.bb => gstreamer1.0-libav_1.22.10.bb} |  2 +-
 ..._1.22.9.bb => gstreamer1.0-omx_1.22.10.bb} |  2 +-
 ...ialized-warnings-when-compiling-with.patch |  2 +-
 ...-avoid-including-sys-poll.h-directly.patch |  4 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  4 +-
 ...bb => gstreamer1.0-plugins-bad_1.22.10.bb} |  2 +-
 ...et-caps-from-src-pad-when-query-caps.patch | 12 +++---
 ...parse-enhance-SSA-text-lines-parsing.patch | 20 +++++-----
 ...iv-fb-Make-sure-config.h-is-included.patch | 10 ++---
 ...b => gstreamer1.0-plugins-base_1.22.10.bb} |  2 +-
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch | 10 ++---
 ...ine-ioctl_req_t-for-posix-linux-case.patch |  8 ++--
 ...b => gstreamer1.0-plugins-good_1.22.10.bb} |  2 +-
 ...b => gstreamer1.0-plugins-ugly_1.22.10.bb} |  2 +-
 ...22.9.bb => gstreamer1.0-python_1.22.10.bb} |  2 +-
 ...bb => gstreamer1.0-rtsp-server_1.22.10.bb} |  2 +-
 ....22.9.bb => gstreamer1.0-vaapi_1.22.10.bb} |  2 +-
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +-
 ...s-use-a-dictionaries-for-environment.patch | 20 +++++-----
 ...er-script-to-run-the-installed_tests.patch | 40 +++++++++----------
 ...r1.0_1.22.9.bb => gstreamer1.0_1.22.10.bb} |  6 +--
 24 files changed, 76 insertions(+), 89 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.9.bb => gst-devtools_1.22.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.9.bb => gstreamer1.0-libav_1.22.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.9.bb => gstreamer1.0-omx_1.22.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.9.bb => gstreamer1.0-plugins-bad_1.22.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.9.bb => gstreamer1.0-plugins-base_1.22.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.9.bb => gstreamer1.0-plugins-good_1.22.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.9.bb => gstreamer1.0-plugins-ugly_1.22.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.9.bb => gstreamer1.0-python_1.22.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.9.bb => gstreamer1.0-rtsp-server_1.22.10.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.9.bb => gstreamer1.0-vaapi_1.22.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.9.bb => gstreamer1.0_1.22.10.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index c0e45813580..21e30d6d464 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 73b1002eda17451db1f58431b42c25203f1d3097 Mon Sep 17 00:00:00 2001
+From 0c73b8131efba63c5cd37ea8c7551434c3b57304 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
@@ -11,6 +11,7 @@ typcasted to struct sockaddr_in* type inside the function before use
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb
index f60234b5286..363d12612f8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "02e29400b44e9cc603aa6444dee5726b57edabef6455e6d0921ffed6f13840ee"
+SRC_URI[sha256sum] = "0e1ec0d0b8f2d3d314a397399cd01dfc50c02ac088176996f934758119075ea9"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
index 10536acc871..818dbf4e5e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "192f7d27d21c1e7c72c339a2647a9b0c247fedc62ea5029115f8c3e22ebb87d8"
+SRC_URI[sha256sum] = "d6dda7aa38a44173278de675ccd92acff0abf473f7bc02e7d1cdd4ce0f3b7642"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb
index 05d64748bb5..4cb83937dcf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9362d6117985d09dcf6e27bdaef377dc08efb7df01d00101d04fb644addac61e"
+SRC_URI[sha256sum] = "ce0126f6de908df4fa7b12136d47d6840dd9f7131ae997e55a817d96a2728a41"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 4b3451d3219..a57fcd7d21a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 6c3eeaf6435608f744303c17d52245f926cd28ac Mon Sep 17 00:00:00 2001
+From 8be0c6ac60c96e87d8aa443be9c431844dc3d92a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index e3e5d9fb604..6509a293b75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 701255c5797f222f0c47ace6437d213607b98d1e Mon Sep 17 00:00:00 2001
+From 426ee79adeecc24605426030a486d7c5a755048c Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -14,7 +14,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index 92c918c..5e27871 100644
+index b8e5b1a..5bca6e5 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 029b80e1749..50a3143eca1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 3bc5d48257032b6bbee532aad15062fbbcc43bfe Mon Sep 17 00:00:00 2001
+From e6eb7536fcfc2c75f7831f67b1f16f3f36ef2545 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -18,7 +18,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
-index 1d86b90..b5c8b95 100644
+index 37e2015..326f737 100644
 --- a/ext/opencv/meson.build
 +++ b/ext/opencv/meson.build
 @@ -87,6 +87,9 @@ if opencv_found
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb
index 6e5aa2f206e..70b9850a49a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "1bc65d0fd5f53a3636564efd3fcf318c3edcdec39c4109a503c1fc8203840a1d"
+SRC_URI[sha256sum] = "dabcd60c762165bb043eba753d599212514c94684e4db9a2e25484cb6508ebbf"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index d5d98383725..34c99ded429 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,13 +1,14 @@
-From f9d48cd85ee68207733b1b91a00453462c33524a Mon Sep 17 00:00:00 2001
+From 63fe5a7b4ef70e2c490bad3b0838329935a8d77c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
-Subject: [PATCH 1/4] ENGR00312515: get caps from src pad when query caps
+Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
 
 https://bugzilla.gnome.org/show_bug.cgi?id=728312
 
 Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
+
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -16,10 +17,10 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index f545857..62d10ef
+index 173da37..2b7f34c
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1777,6 +1777,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
@@ -39,6 +40,3 @@ index f545857..62d10ef
      default:
        res = gst_pad_query_default (pad, parent, query);
        break;
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index e453a500c9f..c922aadedeb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,7 +1,7 @@
-From f587861bbe12ad0b10370f835592746aafedbf56 Mon Sep 17 00:00:00 2001
+From 7bf9525528c8f4a47413d7f82214d76f95f0c5f6 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
-Subject: [PATCH 2/4] ssaparse: enhance SSA text lines parsing.
+Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
 
 some parser will pass in the original ssa text line which starts with "Dialog:"
 and there's are maybe multiple Dialog lines in one input buffer.
@@ -9,6 +9,7 @@ and there's are maybe multiple Dialog lines in one input buffer.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
 ---
  gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
@@ -17,10 +18,10 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index c849c08..4b9636c
+index d6fdb9c..5ebe678
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
-@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * gst_ssa_parse_push_line:
   * @parse: caller element
   * @txt: text to push
@@ -28,7 +29,7 @@ index c849c08..4b9636c
   * @start: timestamp for the buffer
   * @duration: duration for the buffer
   *
-@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -279,27 +280,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * Returns: result of the push of the created buffer
   */
  static GstFlowReturn
@@ -173,7 +174,7 @@ index c849c08..4b9636c
    GST_LOG_OBJECT (parse, "Text : %s", t);
  
    if (gst_ssa_parse_remove_override_codes (parse, t)) {
-@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
+@@ -317,13 +424,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
    gst_buffer_fill (buf, 0, escaped, len + 1);
    gst_buffer_set_size (buf, len);
    g_free (escaped);
@@ -200,7 +201,7 @@ index c849c08..4b9636c
  
    ret = gst_pad_push (parse->srcpad, buf);
  
-@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -343,6 +459,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    GstClockTime ts;
    gchar *txt;
    GstMapInfo map;
@@ -208,7 +209,7 @@ index c849c08..4b9636c
  
    if (G_UNLIKELY (!parse->framed))
      goto not_framed;
-@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -360,13 +477,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    /* make double-sure it's 0-terminated and all */
    gst_buffer_map (buf, &map, GST_MAP_READ);
    txt = g_strndup ((gchar *) map.data, map.size);
@@ -224,6 +225,3 @@ index c849c08..4b9636c
  
    if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
      GstSegment segment;
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 2af83ff8b98..a605533be83 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,19 +1,20 @@
-From 153f3b83a3fed77785bd1420bed8bbafa2d791b3 Mon Sep 17 00:00:00 2001
+From 2b07840122bc2e83bd23dad59aa80d9479f2e1e4 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
-Subject: [PATCH 3/4] viv-fb: Make sure config.h is included
+Subject: [PATCH] viv-fb: Make sure config.h is included
 
 This prevents build errors due to missing GST_API_* symbols
 
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 05e1f62..96ce5e6 100644
+index 85fca5a..946c729 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
@@ -27,6 +28,3 @@ index 05e1f62..96ce5e6 100644
  #include <gst/gst.h>
  
  #ifdef BUILDING_GST_GL
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
index 980766c74ba..d4b69b103f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "fac3e0dd2d8e9370388b34bf8c21b89d5f63bc3cfc12cd7fdc8fc6c1cba03334"
+SRC_URI[sha256sum] = "843a3a2da28e1ee6aeea56dd2be9bffcc3b4bbcd0f974eba4abfc3aa31f0399c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
index 788d7520583..9703a3a8894 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
@@ -1,4 +1,4 @@
-From bf8b2fa0f6870589d036f0f33c140a3f85b530a0 Mon Sep 17 00:00:00 2001
+From 99f48716051ce5ddb8c1b77292213af1e462549e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Mar 2020 21:23:28 -0700
 Subject: [PATCH] qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h
@@ -20,13 +20,14 @@ In file included from /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linu
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  ext/qt/gstqsgtexture.cc | 2 +-
  ext/qt/qtwindow.cc      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
-index a05d26e..4cc9fc6 100644
+index 663696b..36b17d4 100644
 --- a/ext/qt/gstqsgtexture.cc
 +++ b/ext/qt/gstqsgtexture.cc
 @@ -27,7 +27,7 @@
@@ -39,7 +40,7 @@ index a05d26e..4cc9fc6 100644
  
  #define GST_CAT_DEFAULT gst_qsg_texture_debug
 diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
-index 9360c33..0dfd3f1 100644
+index 2872cb5..5a36be9 100644
 --- a/ext/qt/qtwindow.cc
 +++ b/ext/qt/qtwindow.cc
 @@ -25,7 +25,7 @@
@@ -51,6 +52,3 @@ index 9360c33..0dfd3f1 100644
  #include "qtwindow.h"
  #include "gstqsgtexture.h"
  #include "gstqtglutility.h"
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
index fbbf029a2c6..33bd4200f6f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
@@ -1,4 +1,4 @@
-From 5ce1e410965ed047a03c09b17796162f0363e396 Mon Sep 17 00:00:00 2001
+From b77d4806fd5de50d0b017a3e6a19c5bfdef7b3e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Feb 2023 12:47:31 -0800
 Subject: [PATCH] v4l2: Define ioctl_req_t for posix/linux case
@@ -18,12 +18,13 @@ gstv4l2object.c:544:23: error: incompatible function pointer types assigning to
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3950]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  sys/v4l2/gstv4l2object.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
-index 3a5c961..4f43008 100644
+index d95b375..5223cbb 100644
 --- a/sys/v4l2/gstv4l2object.h
 +++ b/sys/v4l2/gstv4l2object.h
 @@ -76,6 +76,8 @@ typedef gboolean  (*GstV4l2UpdateFpsFunction) (GstV4l2Object * v4l2object);
@@ -35,6 +36,3 @@ index 3a5c961..4f43008 100644
  #else
  typedef gulong ioctl_req_t;
  #endif
--- 
-2.39.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb
index 052ba1801b9..9a76aaf247e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "26959fcfebfff637d4ea08ef40316baf31b61bb7729820b0684e800c3a1478b6"
+SRC_URI[sha256sum] = "f748feae922cad62f20102a84ade8f42b78e1e44a34866aa3ea766f9172e1c7f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
index 722f8e9fe30..7cbbf9fda0f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "0bf685d66015a01dd3fc1671b64a1c8acb321dd9d4ab9e05a29ab19782aa6236"
+SRC_URI[sha256sum] = "cc80a81a22c0b3b31ab7f1b8bf18dda23c72d2791b86cc6264923a68336329ea"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
index e086fa6866e..b829a0fc62a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3f9d5c6ffefda268703744b592a6b3983aa6723273b1220ecbcb62c2a5800009"
+SRC_URI[sha256sum] = "99e37ea9f7163099734f9b0fce361bc67a0e7a65ffba9bc497127506a3fdedb3"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
index e232263a46d..0e910e3dc4e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "808af148f89404ff74850f8ca5272bed4bfe67f9620231dc4514fd07eb26d0a4"
+SRC_URI[sha256sum] = "60eb4f80b5a7ca929c21a61d50be9813a3413787959a5875de56a8ad5ca25f35"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb
index c53ee290515..b52b7aa4c46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8ba20da8c4cbf5b2953dba904672c4275d0053e1528f97fdf8e59942c7883ca8"
+SRC_URI[sha256sum] = "094ca144aca8f2c554a2517dfdc421fa37c80294c6f12b992c20cbc73aa2c0bd"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 1b9278db04b..0d839bd6c88 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 559e1dd850b2b9eb3a415aa43e932e5e48f605cd Mon Sep 17 00:00:00 2001
+From 5372cd5bf2a9dd247b9c5fc6e4fe248046dbb085 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 568e38cbf1c..64717e66c36 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 08b1aaff972a7f6349373fc1ad4cc23081adb52c Mon Sep 17 00:00:00 2001
+From 27e977d03b0f7c1d0bf19621ef0cec0585410e7b Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -20,7 +20,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index f9f591d..3906fb3 100644
+index 60c7bec..f7650b1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -606,6 +606,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 10a6dcc6194..0fd830f1504 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,7 +1,7 @@
-From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
+From 7041bc5adf9501beb1428d8bbae6b351a6bf07f9 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
-Subject: [PATCH 3/4] tests: use a dictionaries for environment
+Subject: [PATCH] tests: use a dictionaries for environment
 
 meson environment() can't be passed to configure_file and it is needed for installed_tests,
 use a dictionary as this is simplest solution to install the environment.
@@ -9,15 +9,16 @@ use a dictionary as this is simplest solution to install the environment.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++-------
+ tests/check/meson.build | 21 +++++++++++++--------
  1 file changed, 13 insertions(+), 8 deletions(-)
 
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 00a138a568..48ec2532f8 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
-@@ -161,14 +161,19 @@ foreach t : core_tests
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index f2d400f..50dff7f 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -160,14 +160,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
@@ -45,6 +46,3 @@ index 00a138a568..48ec2532f8 100644
  
      if installed_tests_enabled
        test_conf = configuration_data()
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index efa004f8ce6..5689dc9fbbc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,7 +1,7 @@
-From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
+From 1b1d1ce4227b6bea7c7def5dac4a663486e070c2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
-Subject: [PATCH 4/4] tests: add helper script to run the installed_tests
+Subject: [PATCH] tests: add helper script to run the installed_tests
 
 - this is a bash script that will run the installed_tests
 with some of the environment variables used in the meson
@@ -10,18 +10,19 @@ testing framework.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/tests/check/meson.build   | 17 +++++++++++++++++
- .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
- .../gstreamer/tests/check/template.test.in      |  2 +-
+ tests/check/meson.build      | 17 +++++++++++++++++
+ tests/check/template.sh.in   |  9 +++++++++
+ tests/check/template.test.in |  2 +-
  3 files changed, 27 insertions(+), 1 deletion(-)
- create mode 100755 subprojects/gstreamer/tests/check/template.sh.in
+ create mode 100755 tests/check/template.sh.in
 
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 48ec2532f8..7dc4990d4e 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
-@@ -185,6 +185,23 @@ foreach t : core_tests
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 50dff7f..2b9e979 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -184,6 +184,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
@@ -45,11 +46,11 @@ index 48ec2532f8..7dc4990d4e 100644
      endif
  
      test(test_name, exe, env: env, timeout : 3 * 60)
-diff --git a/subprojects/gstreamer/tests/check/template.sh.in b/subprojects/gstreamer/tests/check/template.sh.in
+diff --git a/tests/check/template.sh.in b/tests/check/template.sh.in
 new file mode 100755
-index 0000000000..cf7d31b0ea
+index 0000000..cf7d31b
 --- /dev/null
-+++ b/subprojects/gstreamer/tests/check/template.sh.in
++++ b/tests/check/template.sh.in
 @@ -0,0 +1,9 @@
 +#!/bin/sh
 +
@@ -60,15 +61,12 @@ index 0000000000..cf7d31b0ea
 +GST_REGISTRY=@GST_REGISTRY@
 +GST_STATE_IGNORE_ELEMENTS="@GST_STATE_IGNORE_ELEMENTS@"
 +exec @TEST@
-diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subprojects/gstreamer/tests/check/template.test.in
-index f701627f87..b74ef6ad73 100644
---- a/subprojects/gstreamer/tests/check/template.test.in
-+++ b/subprojects/gstreamer/tests/check/template.test.in
+diff --git a/tests/check/template.test.in b/tests/check/template.test.in
+index f701627..b74ef6a 100644
+--- a/tests/check/template.test.in
++++ b/tests/check/template.test.in
 @@ -1,3 +1,3 @@
  [Test]
  Type=session
 -Exec=@installed_tests_dir@/@program@
 +Exec=@installed_tests_dir@/@program@.sh
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
index b4ab6ad10ce..0c944e9e110 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
@@ -19,10 +19,10 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://run-ptest \
            file://0001-tests-respect-the-idententaion-used-in-meson.patch \
            file://0002-tests-add-support-for-install-the-tests.patch \
-           file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
-           file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
+           file://0003-tests-use-a-dictionaries-for-environment.patch \
+           file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd"
+SRC_URI[sha256sum] = "969aaef396f252ce925132a4be2aa004e0320f5c1baf0acaaae09c544a6759f4"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.2


