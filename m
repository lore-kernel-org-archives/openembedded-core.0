Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 167237F6AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id e3so1198761plt.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7Gap8ow8zYu+V5HUvsHYRfyF4sUCiGm/HTmnRCdiH0k=;
	b=aypm82ybY04RLT6ZSLpo83muYVuLHSgR5hSyfhFFw8IA5MAWk/dQfYspyKTAsHyTJw
	a30FH3bQU/GpOTDOT6N8LmViznIiZOkneE+WHwQl9kvh/P4cZN58QvUUYe3A+k36IZQZ
	PYRi3mBnTK0dRoEG9Loz3noF3Lh+ARZe2xeylXuErzpO4LDGJYsvRMUza7Y7+PnBwVis
	HnmsbWGAa/hMdrSzzvmTq66i/G/g76epagUeuPosy5CLKaYLMpV7/axahS9JVka564dT
	wcV0LBb66qqfOkQRJoxIiNYLWiWm32rAxSEGLyTMESxJdDVbbGIJCcxhVMJnTIKUB+j7
	QgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7Gap8ow8zYu+V5HUvsHYRfyF4sUCiGm/HTmnRCdiH0k=;
	b=MvX+QzwawdjUbTEkBQ+kSEb4WiBL+PgZqwMTK4Xlc05/VP8XJIpBXcxM6JIUfyiE2T
	bnalajUW20Jp5GcPJE63c5Cti0WC+TN8eArGDztOPVRuiJwV84IxOQP5Avs7hsUXpxWd
	k8DsRBePW9A5it2d83UY/lI9Ao9W0wPSPaWkNNS5aygEDh4qvKkwz9ON9TGDdp9UIylg
	kjUHQb/NgEbTX0RIhTVrZNgy398p3adDihL6oC+mMY06Yw8i6fdEpU651EX01UuLRB+E
	/6bs5dT2n+fzMiHvxR0c2sNorroj4ZmnA0yYntmWVqWDzwAPi0MytNBAcvTJ+BomffRG
	ttJQ==
X-Gm-Message-State: APjAAAUwGJKl7G7oFhP9JwlBDlcZtImebkIdQaQ887KElCe6+em7PvNW
	8qRAHWULkbhyUZbpHCqdUAA0ofLi
X-Google-Smtp-Source: APXvYqxOw5GpksJGY8GM3/Z22PmRJ1K0z7KhoKjbNRH6ZWMzxQRRDdLNNiKwj55HNUAOKkK5b0aBFA==
X-Received: by 2002:a17:902:b582:: with SMTP id
	a2mr4367818pls.103.1573658397812; 
	Wed, 13 Nov 2019 07:19:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:14 -0800
Message-Id: <9cba3d02d00df23a3d0f830cb7d11752142f7d82.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 11/25] libtiff: fix CVE-2019-17546
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:57 -0000

From: Joe Slater <joe.slater@windriver.com>

Apply unmodified patch from upstream.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index a526fc0..08d9cad 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2019-6128.patch \
            file://CVE-2019-7663.patch \
            file://CVE-2019-14973.patch \
+           file://CVE-2019-17546.patch \
 "
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
-- 
2.7.4


