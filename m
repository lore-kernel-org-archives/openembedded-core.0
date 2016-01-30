Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 32C4077236
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:39:48 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 66so4077494pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ZuzyCEAVW4WKV7nupVAZgJlAejQqfxpyA/Pg/SgYVsw=;
	b=RlB3eZtWVKI1KHqACRLOQkE+lcd/lBzbKFcwh+1wWEY+JDGlrVzX/2tkGaMZ0CyyuE
	C83m6811smA2DVF/wAmJwTgukNkLJQds4euIrx5w3d+0M2aWA7EvCsEGH+lSeC62is0H
	bi1qRYX9FuIuZvHSAtMw9rYaOlbXJcAvtbZrzIUijW3ZPj+JWGCVLxmId3KGMWDiaCFy
	zZ2XxmS72t3d3Tbc9GKwXD6RgNikLxieAGT8COL0r7oQCP5i2JC4WjIWJ5mau1xw+f/X
	n22Mq76KuHRRyM5LAEItnn/7NJMP3UYkigzMTuOGfhOcCTbzKP6bmsbgb6SoP4BE/UHZ
	zjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ZuzyCEAVW4WKV7nupVAZgJlAejQqfxpyA/Pg/SgYVsw=;
	b=bZeJ7FikY5NcRlYj6QhelfZ91glWXY01NpUpt1Tf77zALcH6lWp44aM+pic4bICRZr
	jsVAW+cTd6hYk/euaXgkEa+Z3Q64KP789NndwU2VDh34F8hbFcQ6ymrODLcuceeRHfNu
	IHM5pqXjkrrRPRyCX6ncAky7ILcsYzfKe+u+vjGaSUAznemfZc0FUIJO+f1XhFoodET1
	IiTmKsh/YDs0RomQY8McphrYVrXp1FgSVw3V4JdbOkr2Oie+nTxK2DZ+pn49myvi69at
	YcG9hGv77n8KB0ctwCU+LT71k9gTtEnuzTKxahOCGpO/5Ew+4IJDxbzFLSF0NNiKzcq6
	Vrfw==
X-Gm-Message-State: AG10YOTotZZfPfwdpjCviajswzAzcK0+8u4KUgaELx209CxILUpn3wBkqwY0BxxqEeQcAQ==
X-Received: by 10.98.42.135 with SMTP id q129mr18176054pfq.13.1454117989230;
	Fri, 29 Jan 2016 17:39:49 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	m70sm26198092pfi.90.2016.01.29.17.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 17:39:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 17:39:37 -0800
Message-Id: <b9d7a28b7abfc8240f41367640a31310ccaf0e06.1454117072.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454117072.git.akuster@mvista.com>
References: <cover.1454117072.git.akuster@mvista.com>
In-Reply-To: <cover.1454117072.git.akuster@mvista.com>
References: <cover.1454117072.git.akuster@mvista.com>
Subject: [PATCH 2/2] tiff: Security fix CVE-2015-8784
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
X-List-Received-Date: Sat, 30 Jan 2016 01:39:48 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8784 libtiff: out-of-bound write in NeXTDecode()

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libtiff/files/CVE-2015-8784.patch              | 73 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
new file mode 100644
index 0000000..cf37fd3
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
@@ -0,0 +1,73 @@
+From b18012dae552f85dcc5c57d3bf4e997a15b1cc1c Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sun, 27 Dec 2015 16:55:20 +0000
+Subject: [PATCH] * libtiff/tif_next.c: fix potential out-of-bound write in
+ NeXTDecode() triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
+ (bugzilla #2508)
+
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/b18012dae552f85dcc5c57d3bf4e997a15b1cc1c
+hand applied Changelog changes
+
+CVE:  CVE-2015-8784
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog          |  6 ++++++
+ libtiff/tif_next.c | 10 ++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+Index: tiff-4.0.4/ChangeLog
+===================================================================
+--- tiff-4.0.4.orig/ChangeLog
++++ tiff-4.0.4/ChangeLog
+@@ -1,5 +1,11 @@
+ 2015-12-27  Even Rouault <even.rouault at spatialys.com>
+ 
++   * libtiff/tif_next.c: fix potential out-of-bound write in NeXTDecode()
++   triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
++   (bugzilla #2508)
++
++2015-12-27  Even Rouault <even.rouault at spatialys.com>
++
+    * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
+    functions in non debug builds by replacing assert()s by regular if
+    checks (bugzilla #2522).
+Index: tiff-4.0.4/libtiff/tif_next.c
+===================================================================
+--- tiff-4.0.4.orig/libtiff/tif_next.c
++++ tiff-4.0.4/libtiff/tif_next.c
+@@ -37,7 +37,7 @@
+ 	case 0:	op[0]  = (unsigned char) ((v) << 6); break;	\
+ 	case 1:	op[0] |= (v) << 4; break;	\
+ 	case 2:	op[0] |= (v) << 2; break;	\
+-	case 3:	*op++ |= (v);	   break;	\
++	case 3:	*op++ |= (v);	   op_offset++; break;	\
+ 	}					\
+ }
+ 
+@@ -106,6 +106,7 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
+ 			uint32 imagewidth = tif->tif_dir.td_imagewidth;
+             if( isTiled(tif) )
+                 imagewidth = tif->tif_dir.td_tilewidth;
++            tmsize_t op_offset = 0;
+ 
+ 			/*
+ 			 * The scanline is composed of a sequence of constant
+@@ -122,10 +123,15 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
+ 				 * bounds, potentially resulting in a security
+ 				 * issue.
+ 				 */
+-				while (n-- > 0 && npixels < imagewidth)
++				while (n-- > 0 && npixels < imagewidth && op_offset < scanline)
+ 					SETPIXEL(op, grey);
+ 				if (npixels >= imagewidth)
+ 					break;
++                if (op_offset >= scanline ) {
++                    TIFFErrorExt(tif->tif_clientdata, module, "Invalid data for scanline %ld",
++                        (long) tif->tif_row);
++                    return (0);
++                }
+ 				if (cc == 0)
+ 					goto bad;
+ 				n = *bp++, cc--;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
index 6166663..f1f5a7e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://CVE-2015-8781.patch \
+           file://CVE-2015-8784.patch \
           "
 
 SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
-- 
2.3.5


