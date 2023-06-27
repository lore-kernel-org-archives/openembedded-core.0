Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3139C04FE1
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7582.1687850380117986789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122208762"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122208762"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CA313E8524
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBCAAD5EA7
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 529816C833;
	Tue, 27 Jun 2023 16:19:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] tiff: upgrade 4.5.0 -> 4.5.1
Date: Tue, 27 Jun 2023 15:17:28 +0800
Message-Id: <1687850250-20040-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.032000-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yTo39wOA02LhMVx/3ZYby7+dtFjlwPzbAtnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ3UXZQnjQe7mbBfEWzUJPFeRgPzABkqxIJiXQ1Yqku3TeGHkpR2WBaI6Je
	mH4tHjHTYA0DXT39JoJy5kObkVr+iFd9GQ+1wP5YL5ja7E+Ohy+KgiyLtJrSDmWHHSYEnI8VsfE
	LCGhsPZtsbP6ZotpaYkJUzgP4DZVswNeg64CU4uSHCU59h5KrGxZOddVMlEZwIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSmcfuxsiY4QFHEca89QrYlP0AK9nEm+x5lU1ac
	hSMUomwny/QRIzH5iP3h00AjYgW8D3ZffOF/h5i3SdKha2X3YATihD74aJkfZY3IYn/L0r+x9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183472

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-48281.patch
CVE-2023-2731.patch
removed since they're included in 4.5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtiff/files/CVE-2022-48281.patch        | 29 --------------
 .../libtiff/files/CVE-2023-2731.patch         | 39 -------------------
 .../libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb}  |  7 +---
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb} (91%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
deleted file mode 100644
index e356d377ea..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-CVE: CVE-2022-48281
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Sat, 21 Jan 2023 15:58:10 +0000
-Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
-
----
- tools/tiffcrop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 14fa18da..7db69883 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
-                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
-             else
-             {
--                prev_cropsize = seg_buffs[0].size;
-+                prev_cropsize = seg_buffs[i].size;
-                 if (prev_cropsize < cropsize)
-                 {
-                     next_buff = _TIFFrealloc(
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
deleted file mode 100644
index 7db0a35f72..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 29 Apr 2023 12:20:46 +0200
-Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from a
- strip whith a missing end-of-information marker (fixes #548)
-
-CVE: CVE-2023-2731
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b]
-
----
- libtiff/tif_lzw.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
-index ba75a07e..d631fa10 100644
---- a/libtiff/tif_lzw.c
-+++ b/libtiff/tif_lzw.c
-@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsize_t occ0, uint16_t s)
- 
-     if (sp->read_error)
-     {
-+        TIFFErrorExtR(tif, module,
-+                      "LZWDecode: Scanline %" PRIu32 " cannot be read due to "
-+                      "previous error",
-+                      tif->tif_row);
-         return 0;
-     }
- 
-@@ -742,6 +746,7 @@ after_loop:
-     return (1);
- 
- no_eoi:
-+    sp->read_error = 1;
-     TIFFErrorExtR(tif, module,
-                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI code",
-                   tif->tif_curstrip);
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
similarity index 91%
rename from meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index ca4a3eff91..1c0d54900a 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2022-48281.patch \
-           file://CVE-2023-2731.patch \
-"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
+SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


