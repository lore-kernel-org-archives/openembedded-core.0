Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 678CA79CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:01 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id h195so4861767pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=Kdafcl1Wa1xOimBU8+B+2q8QbJ4ek7+6U5q1fvhX+qySJpcrJFMrpwlTVsTAfuLw3+
	e8XBLnb+k5E3wxNTK9z69yavDQbjIeu0Of3c3Eaer8u/AUEWaPClXI453pDOAgqdBWFn
	ns/vvkE5iR6ryQrc1SdaTn2N01KtZu0Uc8FXb61XUdQJTYAJwjRtGR6ZECXH5bkzb1ET
	4kcebOMFoPLyspUtLYuMn7dFxFOAMl5o1DnEThuZZ8I821iKr6DHLn+vVKxrd0Lor9F5
	xu+hQDofXrGKp50UDRHoh6b39tvua9lffDjledqBPFkkgOsaFuRiiLM4NO+vbekNukoj
	HZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=WtUxNKm7P1IxJUc/Rn2LY2smmtFb7CVUw7dhdFRHxW908O5/+nYbfu0ZBGq0s6Gy49
	AGjcBGN2SEZKn9FWChfYpu07bph6LNYKwUjhfgxmWJ05xP1BPPwxs194S4vauQ7IJ1Dn
	59xR3Ve8oFhwm3Jwekzj3BBRQDdIJK/iAyn4nfIGYK2NBpWQroXa88pq265GkeYYxm1W
	NxFZtHaLX5NloLWZA4OthYOy9odF9QR7ot4nxzMDqFCTPvL+wkdu7DY5ceKMA8JMDuhT
	lKYG07vnQVKu5Lm+2Hv4zZ8RsEhODqmfg9SiO+odwbi4i9kCLHDqBiQO5YVD1MHLTA5N
	NNKA==
X-Gm-Message-State: APjAAAVfr3O+LR3yRYRqC8+rlwTNkchYLssLO9RzqP5YPPoGuptrlIsl
	pySdkxXvGjEL1Z+TDes7+ZT6lsFxQ7g=
X-Google-Smtp-Source: APXvYqyTVAZQFLlNnXu65ySxgDOiUHhBMwr2431dXVsynboPNZ3xJaCHi/vM1vXbSgheqN8rW3dM8A==
X-Received: by 2002:a63:66c4:: with SMTP id a187mr22351890pgc.85.1569818882348;
	Sun, 29 Sep 2019 21:48:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:03 -0700
Message-Id: <c4fcc2dfefb304ac59f8c49acaad149e239de260.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 08/54] tiff: fix CVE-2019-6128
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:01 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 7293e417dd9bdd04fe0fec177a76c9286234ed46)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtiff/tiff/CVE-2019-6128.patch               | 52 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
new file mode 100644
index 0000000..6f1fd4d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2019-6128
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Wed, 23 Jan 2019 15:03:53 -0500
+Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
+
+pal2rgb failed to free memory on a few errors. This was reported
+here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
+---
+ tools/pal2rgb.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
+index 01d8502ec..9492f1cf1 100644
+--- a/tools/pal2rgb.c
++++ b/tools/pal2rgb.c
+@@ -118,12 +118,14 @@ main(int argc, char* argv[])
+ 	    shortv != PHOTOMETRIC_PALETTE) {
+ 		fprintf(stderr, "%s: Expecting a palette image.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
+ 		fprintf(stderr,
+ 		    "%s: No colormap (not a valid palette image).\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	bitspersample = 0;
+@@ -131,11 +133,14 @@ main(int argc, char* argv[])
+ 	if (bitspersample != 8) {
+ 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	out = TIFFOpen(argv[optind+1], "w");
+-	if (out == NULL)
++	if (out == NULL) {
++		(void) TIFFClose(in);
+ 		return (-2);
++	}
+ 	cpTags(in, out);
+ 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
+ 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
+-- 
+2.21.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 152fa81..a82d744 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,8 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2019-6128.patch"
            "
-
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.7.4


