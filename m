Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04DCC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:07:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.22290.1664968029722467179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=js7zY0z+;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664968029; x=1696504029;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ykI4iezQMuMv7RFtYMKLXqhyi1K34EVLSmG/pASisBY=;
  b=js7zY0z+OdmVstKQG59rZoTvoTADI7Xwgf+JrLiW4676GL1LaSe+bD+o
   YI1G2lW/Hwud3f6eXxuWqbDAJXxkpz4jAMmzYFjxnc00ppWB8bP9bvOc7
   /b8fWVkNPYVdKW6z6L6qmutqsqqBNjmZp3rsbCB45Syy83U0MMpEe1kz7
   6/zP9tzffaYPVd9XMiRakwM1zgezOSk5OqJL3TZxHfbTlPeezSj4vRUpx
   fK1erCb9AFixNd2OqNMdJCBGhSAfi/JOu2lUFFC9YJCcbRsEEveK2tMbE
   LiyIHA3Rk5vVCssze4z4J4s6OhAQ6P7FS35v2oMu16EpaOKsZqB9GxWZ1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="303110771"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800";
   d="scan'208";a="303110771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 04:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="692851198"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800";
   d="scan'208";a="692851198"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2022 04:07:08 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch] tiff: Security fixes
 CVE-2022-2867,CVE-2022-2868 and CVE-2022-2869
Date: Wed,  5 Oct 2022 19:07:03 +0800
Message-Id: <20221005110703.1000624-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 11:07:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171455

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This series of patches include fixes for CVE-2022-2867,CVE-2022-2868 and CVE-2022-2869.
These patches are modified using devtool and a review was conducted to make sure they all get applied in the correct location.

References:

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867
https://security-tracker.debian.org/tracker/CVE-2022-2867

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868
https://security-tracker.debian.org/tracker/CVE-2022-2868

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869
https://security-tracker.debian.org/tracker/CVE-2022-2869

Merge request:

https://gitlab.com/libtiff/libtiff/-/merge_requests/294/diffs?commit_id=7d7bfa4416366ec64068ac389414241ed4730a54

Patches from:

https://gitlab.com/libtiff/libtiff/-/commit/bcf28bb7f630f24fa47701a9907013f3548092cd?merge_request_iid=294
https://gitlab.com/libtiff/libtiff/-/commit/7d7bfa4416366ec64068ac389414241ed4730a54?merge_request_iid=294
https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294

Notes:
These CVEs are fixed in tiff v4.4.0

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../libtiff/tiff/CVE-2022-2867.patch          | 129 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-2869.patch          |  84 ++++++++++++
 ...ed69a485a9cfb299d9f060eb2a46c54e5903.patch |  45 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   3 +
 4 files changed, 261 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
new file mode 100644
index 0000000000..ae33a3b4e7
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
@@ -0,0 +1,129 @@
+From 6ad097dac1d4908705f5a9d43dea76b7f2de89eb Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 17:53:53 +0100
+Subject: [PATCH] tiffcrop.c: This update fixes also issues #350 and #351.
+
+ Issue 350 is fixed by checking for not allowed zone input cases like -Z 0:0
+ in getCropOffsets().
+
+CVE: CVE-2022-2867
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/7d7bfa4416366ec64068ac389414241ed4730a54?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 58 +++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 40 insertions(+), 18 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 4a4ace8..0ef5bb2 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5194,20 +5194,33 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+ 	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+-      /* region needs to be within image sizes 0.. width-1; 0..length-1 
+-       * - be aware x,y are already casted to (uint32_t) and avoid (0 - 1)
++      /* a) Region needs to be within image sizes 0.. width-1; 0..length-1 
++       * b) Corners are expected to be submitted as top-left to bottom-right.
++       *    Therefore, check that and reorder input.
++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - 1) )
+        */
+-     if (x1 > image->width - 1)
++      uint32_t aux;
++      if (x1 > x2) {
++        aux = x1;
++        x1 = x2;
++        x2 = aux;
++      }
++      if (y1 > y2) {
++        aux = y1;
++        y1 = y2;
++        y2 = aux;
++      }
++      if (x1 > image->width - 1)
+         crop->regionlist[i].x1 = image->width - 1;
+-     else if (x1 > 0)
+-        crop->regionlist[i].x1 = (uint32_t) (x1 - 1);
++      else if (x1 > 0)
++        crop->regionlist[i].x1 = (uint32_t)(x1 - 1);
+ 
+-     if (x2 > image->width - 1)
+-       crop->regionlist[i].x2 = image->width - 1;
+-     else if (x2 > 0)
+-       crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
++      if (x2 > image->width - 1)
++        crop->regionlist[i].x2 = image->width - 1;
++      else if (x2 > 0)
++        crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
+ 
+-      zwidth  = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1; 
++      zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
+ 
+       if (y1 > image->length - 1)
+         crop->regionlist[i].y1 = image->length - 1;
+@@ -5219,8 +5232,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       else if (y2 > 0)
+         crop->regionlist[i].y2 = (uint32_t)(y2 - 1);
+ 
+-      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1; 
+-
++      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+       if (zwidth > max_width)
+         max_width = zwidth;
+       if (zlength > max_length)
+@@ -5250,7 +5262,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	}
+       }
+     return (0);
+-    }
++    }  /* crop_mode == CROP_REGIONS */
+   
+   /* Convert crop margins into offsets into image
+    * Margins are expressed as pixel rows and columns, not bytes
+@@ -5286,7 +5298,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       bmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    }
++    }  /* crop_mode == CROP_MARGINS */
+   else
+     { /* no margins requested */
+     tmargin = (uint32_t) 0;
+@@ -5494,10 +5506,17 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+   else
+     crop->selections = crop->zones;
+ 
+-  for (i = 0; i < crop->zones; i++)
++  /* Initialize regions iterator i */
++  i = 0;
++  for (int j = 0; j < crop->zones; j++)
+     {
+-    seg = crop->zonelist[i].position;
+-    total = crop->zonelist[i].total;
++    seg = crop->zonelist[j].position;
++    total = crop->zonelist[j].total;
++
++    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip that input */
++    if (seg == 0 || total == 0 || seg > total) {
++        continue;
++    }
+ 
+     switch (crop->edge_ref) 
+       {
+@@ -5626,8 +5645,11 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+                     i + 1, zwidth, zlength,
+                crop->regionlist[i].x1, crop->regionlist[i].x2,
+                crop->regionlist[i].y1, crop->regionlist[i].y2);
++  /* increment regions iterator */
++  i++;
+     }
+-
++    /* set number of generated regions out of given zones */
++    crop->selections = i;
+   return (0);
+   } /* end getCropOffsets */
+ 
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
new file mode 100644
index 0000000000..9a23e23fed
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
@@ -0,0 +1,84 @@
+From 0ec36342df880f5ad41576cb1b03061b8697dabd Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 10:53:45 +0100
+Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by correcting
+
+ uint32_t underflow.
+
+CVE: CVE-2022-2869
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/bcf28bb7f630f24fa47701a9907013f3548092cd?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b9b13d8..4a4ace8 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5194,26 +5194,30 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+ 	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+-      if (x1 < 1)
+-        crop->regionlist[i].x1 = 0;
+-      else
++      /* region needs to be within image sizes 0.. width-1; 0..length-1 
++       * - be aware x,y are already casted to (uint32_t) and avoid (0 - 1)
++       */
++     if (x1 > image->width - 1)
++        crop->regionlist[i].x1 = image->width - 1;
++     else if (x1 > 0)
+         crop->regionlist[i].x1 = (uint32_t) (x1 - 1);
+ 
+-      if (x2 > image->width - 1)
+-        crop->regionlist[i].x2 = image->width - 1;
+-      else
+-        crop->regionlist[i].x2 = (uint32_t) (x2 - 1);
++     if (x2 > image->width - 1)
++       crop->regionlist[i].x2 = image->width - 1;
++     else if (x2 > 0)
++       crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
++
+       zwidth  = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1; 
+ 
+-      if (y1 < 1)
+-        crop->regionlist[i].y1 = 0;
+-      else
+-        crop->regionlist[i].y1 = (uint32_t) (y1 - 1);
++      if (y1 > image->length - 1)
++        crop->regionlist[i].y1 = image->length - 1;
++      else if (y1 > 0)
++        crop->regionlist[i].y1 = (uint32_t)(y1 - 1);
+ 
+       if (y2 > image->length - 1)
+         crop->regionlist[i].y2 = image->length - 1;
+-      else
+-        crop->regionlist[i].y2 = (uint32_t) (y2 - 1);
++      else if (y2 > 0)
++        crop->regionlist[i].y2 = (uint32_t)(y2 - 1);
+ 
+       zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1; 
+ 
+@@ -5376,7 +5380,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   crop_width  = endx - startx + 1;
+   crop_length = endy - starty + 1;
+ 
+-  if (crop_width <= 0)
++  if (endx + 1 <= startx)
+     {
+     TIFFError("computeInputPixelOffsets", 
+                "Invalid left/right margins and /or image crop width requested");
+@@ -5385,7 +5389,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   if (crop_width > image->width)
+     crop_width = image->width;
+ 
+-  if (crop_length <= 0)
++  if (endy + 1 <= starty)
+     {
+     TIFFError("computeInputPixelOffsets", 
+               "Invalid top/bottom margins and /or image crop length requested");
diff --git a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
new file mode 100644
index 0000000000..1fa6a11104
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
@@ -0,0 +1,45 @@
+From 740111312ca6ae718f233d914662a9969e6820ee Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 19:52:17 +0100
+Subject: [PATCH] Move the crop_width and crop_length computation after the
+ sanity check to avoid warnings when built with
+ -fsanitize=unsigned-integer-overflow.
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 0ef5bb2..99e4208 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5389,15 +5389,13 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   off->endx   = endx;
+   off->endy   = endy;
+ 
+-  crop_width  = endx - startx + 1;
+-  crop_length = endy - starty + 1;
+-
+   if (endx + 1 <= startx)
+     {
+     TIFFError("computeInputPixelOffsets", 
+                "Invalid left/right margins and /or image crop width requested");
+     return (-1);
+     }
++  crop_width  = endx - startx + 1;
+   if (crop_width > image->width)
+     crop_width = image->width;
+ 
+@@ -5407,6 +5405,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+               "Invalid top/bottom margins and /or image crop length requested");
+     return (-1);
+     }
++  crop_length = endy - starty + 1;
+   if (crop_length > image->length)
+     crop_length = image->length;
+ 
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index b5ccd859f3..f84057c46b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -22,6 +22,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-1354.patch \
            file://CVE-2022-1355.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2869.patch \
+           file://CVE-2022-2867.patch \
+           file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.37.3


