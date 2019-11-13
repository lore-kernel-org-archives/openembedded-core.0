Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 946A67F7B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:26 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 15so1597320pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XAhnjmf5pCMyizMp1r6LOEbkIgXcxihUkDuLo7YWeO8=;
	b=XJVrXrt6egSoCbhuR8nudqbUe6OYqVRy15zn0Er/q2b1sgdossp4gCGQTaZ0or+EDR
	nnXpx10N4bPRqSPcwtmHnfoSp3+Vp3zO0Gc+ahQKbn6NTv9x4qlU86p33AHdaXZn1n/+
	9AzCMcT6sCxauzkeTAts/AkEtaiwtcRib1tCKdb1zM1N+ohBB066iymdW6p9KPZ5+5vq
	mMzTIdfHWQ8lxMqW73bq/7kXMmqUdDHSErEs0NjuLweF3MjTxEw9k6l6V4UHxrIUinja
	gqGQO+zEYgSL3IE55za8Iqt8tGl4dtyugeFqfmbkfrWVck76/R1ucGdT4Vh6W74BKKWP
	J9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XAhnjmf5pCMyizMp1r6LOEbkIgXcxihUkDuLo7YWeO8=;
	b=S26YEuS5LreazoJOfS3LyzBnau+1jZOd5u41/HmJUfhM4yFRd5Ld0zqr7uQsMS3agZ
	Ah9uoUv2jhQQQmu8L5fv/UN9Zx5GbHI+COAeTSz/LJzEz7Fsl0kQUJDOWwkUV+iPKczH
	66UL0KRnEY/bJsWs1u2PdIfTeP47u7VMXFPPGcbhoACpzXQMNjKfE4ji31UHB5WMKNZ7
	kg2vt145LPics/iWU0MksnL4kE5B9qOVLLZa3fkg0JLEqY9Mb55ytOj88uo0OFj+nQwu
	j3ReDcEpx05yolHVWd0kLQPitLQsP65GFTMz+uswcBsaIMlR03PIi2IGd4qRGYyVFYGr
	0LIg==
X-Gm-Message-State: APjAAAUt/I+YG0BuvvX/EpqB/5Q8vIZd1jNOkYnBSbwCo2+FFAQjIbts
	YrVr8FhCeQm7H9g/uhdkytG5ZgE3
X-Google-Smtp-Source: APXvYqz6/GGfwJfORej3lLgDT28qx8xwRzCmbf5oQxOVcercGNIEBW7QCsKrrzhIJix00ONXumbziA==
X-Received: by 2002:a17:90a:2369:: with SMTP id
	f96mr5501423pje.127.1573659147458; 
	Wed, 13 Nov 2019 07:32:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:44 -0800
Message-Id: <6dc3813bda9aaf8eed5a5a3f74b27b6a32c9cb42.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 02/31] libtiff: fix CVE-2019-17546
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:32:26 -0000

From: Joe Slater <joe.slater@windriver.com>

Apply unmodified patch from upstream.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libtiff/tiff/CVE-2019-17546.patch              | 103 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
new file mode 100644
index 0000000..04c5410
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
@@ -0,0 +1,103 @@
+libtiff: fix CVE-2019-17546
+
+Added after 4.0.10 release.
+
+CVE: CVE-2019-17546
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+commit 4bb584a35f87af42d6cf09d15e9ce8909a839145
+Author: Even Rouault <even.rouault@spatialys.com>
+Date:   Thu Aug 15 15:05:28 2019 +0200
+
+    RGBA interface: fix integer overflow potentially causing write heap buffer overflow, especially on 32 bit builds. Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16443. Credit to OSS Fuzz
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index c88b5fa..4da785d 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -949,16 +949,23 @@ gtStripContig(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 	fromskew = (w < imagewidth ? imagewidth - w : 0);
+ 	for (row = 0; row < h; row += nrow)
+ 	{
++		uint32 temp;
+ 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
+ 		nrow = (row + rowstoread > h ? h - row : rowstoread);
+ 		nrowsub = nrow;
+ 		if ((nrowsub%subsamplingver)!=0)
+ 			nrowsub+=subsamplingver-nrowsub%subsamplingver;
++		temp = (row + img->row_offset)%rowsperstrip + nrowsub;
++		if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
++		{
++			TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripContig");
++			return 0;
++		}
+ 		if (_TIFFReadEncodedStripAndAllocBuffer(tif,
+ 		    TIFFComputeStrip(tif,row+img->row_offset, 0),
+ 		    (void**)(&buf),
+                     maxstripsize,
+-		    ((row + img->row_offset)%rowsperstrip + nrowsub) * scanline)==(tmsize_t)(-1)
++		    temp * scanline)==(tmsize_t)(-1)
+ 		    && (buf == NULL || img->stoponerr))
+ 		{
+ 			ret = 0;
+@@ -1051,15 +1058,22 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 	fromskew = (w < imagewidth ? imagewidth - w : 0);
+ 	for (row = 0; row < h; row += nrow)
+ 	{
++                uint32 temp;
+ 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
+ 		nrow = (row + rowstoread > h ? h - row : rowstoread);
+ 		offset_row = row + img->row_offset;
++                temp = (row + img->row_offset)%rowsperstrip + nrow;
++                if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
++                {
++                        TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripSeparate");
++                        return 0;
++                }
+                 if( buf == NULL )
+                 {
+                     if (_TIFFReadEncodedStripAndAllocBuffer(
+                             tif, TIFFComputeStrip(tif, offset_row, 0),
+                             (void**) &buf, bufsize,
+-                            ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++                            temp * scanline)==(tmsize_t)(-1)
+                         && (buf == NULL || img->stoponerr))
+                     {
+                             ret = 0;
+@@ -1079,7 +1093,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+                     }
+                 }
+ 		else if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 0),
+-		    p0, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++		    p0, temp * scanline)==(tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1087,7 +1101,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		}
+ 		if (colorchannels > 1 
+                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 1),
+-                                            p1, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
++                                            p1, temp * scanline) == (tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1095,7 +1109,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		}
+ 		if (colorchannels > 1 
+                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 2),
+-                                            p2, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
++                                            p2, temp * scanline) == (tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1104,7 +1118,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		if (alpha)
+ 		{
+ 			if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, colorchannels),
+-			    pa, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++			    pa, temp * scanline)==(tmsize_t)(-1)
+ 			    && img->stoponerr)
+ 			{
+ 				ret = 0;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 0432763..5c008c5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2019-6128.patch \
            file://CVE-2019-7663.patch \
            file://CVE-2019-14973.patch \
+           file://CVE-2019-17546.patch \
 "
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
-- 
2.7.4


