Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.19576.1621260847769843179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JuHOe/7Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id t193so4749190pgb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BfNM2nws3IFtWI5K/m7czhOtUkI88W1cJS0mqOOHew0=;
        b=JuHOe/7Zfpoa04ko8eEyNF4PganTSXyPmDdy8X06ykpz2i3YbUIlMWP9++idFqCEXd
         GG/moqxAz+1yNsCWlyibBmgezTGNhJ9q8V9Y+Oa54yeCHMQECtSJITZqYR/8uwxX+lFS
         voOM0tCzPfCeZrtIxgjg7u0CWb36jTkTjUcmSmtTJhiEb8W2ttpTTMciMSRoozH/nMDp
         RoNUAPAFVjE9xxHE6m74sxM6kACczvugS1ynpSOM26oGLnAZChDhNx+1f+vzsTXalvvI
         G+dtlLuMi8IQRcmfFeWrpW/zl2PwF5fzyd4brngixXjdBs2g0xljSYb4Ocde8fG1IoDa
         /WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfNM2nws3IFtWI5K/m7czhOtUkI88W1cJS0mqOOHew0=;
        b=mo2HEX3Kg3JSblQe/Cdh1kDUS9g5DnLRv94gtcvW5Vl4GVPfpNEt79h8axRzkL4Eq2
         bgc0CCFOb5J5F2F1O7JSmRh20E4Iw8E0MrxOaHwOgVvAK1UPgzqZME6FIchgszu/5YuM
         1pQGhCaJrUATZ6/nwZVodylp9NFzJS4kiVpsozPlx70m8yeokeaEvFXniZstrjSRRkWo
         lSOBzEDxrmUNCI7RvbR/vRKpAZccqFZrbohzHiATMPU+FE7ZNRTLGG+JIJUS2w2LIiBF
         78FnAUhhtMTbP6rOhzRp1v8tOe3WIpezPwXDbQeWlsp+HbGQTkRhlLDYn8d31WNuBF0j
         Rbsg==
X-Gm-Message-State: AOAM533rP8AqLu3D17zpAq6IMSj55oTSDXY583Z/raLm3EUd6xWojadl
	52nQyJ/WKzX2OB4GTPzqDXrY2MpHsBbQY3V6nX4=
X-Google-Smtp-Source: ABdhPJynMPDUqLJRmAB3Un2AobZeSR3xhtLkA/gT/QXQHREojguIF3d05NLfCZpoowLhPQAupHYeAA==
X-Received: by 2002:aa7:920d:0:b029:2d9:2ead:70dd with SMTP id 13-20020aa7920d0000b02902d92ead70ddmr10976489pfo.67.1621260846638;
        Mon, 17 May 2021 07:14:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/35] tiff: fix CVE-2020-35523 CVE-2020-35524
Date: Mon, 17 May 2021 04:13:09 -1000
Message-Id: <84239e11227bc0b0e2e6d3b2faa7a9ee63025dd1.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2020-35523.patch        | 55 +++++++++++++++++++
 .../libtiff/files/CVE-2020-35524-1.patch      | 42 ++++++++++++++
 .../libtiff/files/CVE-2020-35524-2.patch      | 36 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  3 +
 4 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
new file mode 100644
index 0000000000..1f30b32799
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
@@ -0,0 +1,55 @@
+From c8d613ef497058fe653c467fc84c70a62a4a71b2 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 01:54:30 +0100
+Subject: [PATCH] gtTileContig(): check Tile width for overflow
+
+fixes #211
+
+Upstream-Status: Backport [ https://gitlab.com/libtiff/libtiff/-/commit/c8d613ef497058fe653c467fc84c70a62a4a71b2 ]
+CVE: CVE-2020-35523
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libtiff/tif_getimage.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4da785d3..96ab1460 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -29,6 +29,7 @@
+  */
+ #include "tiffiop.h"
+ #include <stdio.h>
++#include <limits.h>
+ 
+ static int gtTileContig(TIFFRGBAImage*, uint32*, uint32, uint32);
+ static int gtTileSeparate(TIFFRGBAImage*, uint32*, uint32, uint32);
+@@ -645,12 +646,20 @@ gtTileContig(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 
+     flip = setorientation(img);
+     if (flip & FLIP_VERTICALLY) {
+-	    y = h - 1;
+-	    toskew = -(int32)(tw + w);
++        if ((tw + w) > INT_MAX) {
++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", "unsupported tile size (too wide)");
++            return (0);
++        }
++        y = h - 1;
++        toskew = -(int32)(tw + w);
+     }
+     else {
+-	    y = 0;
+-	    toskew = -(int32)(tw - w);
++        if (tw > (INT_MAX + w)) {
++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", "unsupported tile size (too wide)");
++            return (0);
++        }
++        y = 0;
++        toskew = -(int32)(tw - w);
+     }
+      
+     /*
+-- 
+GitLab
+
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
new file mode 100644
index 0000000000..5232eacb50
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
@@ -0,0 +1,42 @@
+From c6a12721b46f1a72974f91177890301730d7b330 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 01:01:59 +0100
+Subject: [PATCH] tiff2pdf.c: properly calculate datasize when saving to JPEG
+ YCbCr
+
+fixes #220
+Upstream-Status: Backport
+https://gitlab.com/libtiff/libtiff/-/commit/c6a12721b46f1a72974f91177890301730d7b330
+https://gitlab.com/libtiff/libtiff/-/merge_requests/159/commits
+CVE: CVE-2021-35524
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ tools/tiff2pdf.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 719811ea..dc69d2f9 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -2087,9 +2087,14 @@ void t2p_read_tiff_size(T2P* t2p, TIFF* input){
+ #endif
+ 		(void) 0;
+ 	}
+-	k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
+-	if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
+-		k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
++	if(t2p->pdf_compression == T2P_COMPRESS_JPEG
++	   && t2p->tiff_photometric == PHOTOMETRIC_YCBCR) {
++		k = checkMultiply64(TIFFNumberOfStrips(input), TIFFStripSize(input), t2p);
++	} else {
++		k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
++		if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
++			k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
++		}
+ 	}
+ 	if (k == 0) {
+ 		/* Assume we had overflow inside TIFFScanlineSize */
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch
new file mode 100644
index 0000000000..406d467766
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch
@@ -0,0 +1,36 @@
+From d74f56e3b7ea55c8a18a03bc247cd5fd0ca288b2 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 02:05:05 +0100
+Subject: [PATCH] Fix for building without JPEG support
+
+Upstream-Status: Backport
+https://gitlab.com/libtiff/libtiff/-/commit/d74f56e3b7ea55c8a18a03bc247cd5fd0ca288b2
+https://gitlab.com/libtiff/libtiff/-/merge_requests/159/commits
+CVE: CVE-2021-35524
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiff2pdf.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index dc69d2f9..d0b0ede7 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -2087,10 +2087,13 @@ void t2p_read_tiff_size(T2P* t2p, TIFF* input){
+ #endif
+ 		(void) 0;
+ 	}
++#ifdef JPEG_SUPPORT
+ 	if(t2p->pdf_compression == T2P_COMPRESS_JPEG
+ 	   && t2p->tiff_photometric == PHOTOMETRIC_YCBCR) {
+ 		k = checkMultiply64(TIFFNumberOfStrips(input), TIFFStripSize(input), t2p);
+-	} else {
++	} else
++#endif
++	{
+ 		k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
+ 		if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
+ 			k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 5a1cb13c53..97ad575f64 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2020-35523.patch  \
+           file://CVE-2020-35524-1.patch \
+           file://CVE-2020-35524-2.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1

