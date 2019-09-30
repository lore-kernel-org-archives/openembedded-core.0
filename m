Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6645D6D409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:02 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 205so4872793pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=tmDPK8N9qCTKiB403TvHpokMMknIN9w6ebG2EQUyl6yTk2xL7CqeDzYzzMUKyzUJcw
	WGQJWk+bbRKrTyuGcCLMJJ20UIHatV7XNasksdT1d2p0sxciuCr1VYaFMt5GLwUHjZcw
	PnhQarfu1pAvoh7S0zLJUEwSFpBGyigqZblxAXVHiDwv3/Gk3VeNMCsnLnxdzuNEa7h3
	IRtXw5rRQfEh5U7EiVDfGfbPLgoJJ4bwGSFw1ef6DzoAU+IgceYRSXNMo6DTsT+OtUQQ
	CCKu7oULHtG993ELRujdsW0LckUYhdTeD9PDQIAkjn7i2m3Tt9m3XSAwwWskIIlQdv8Q
	qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=I4XCTdRTkw8imePil5IQ24DXHTrvLQ/5TyY8QQ18moH6UTl0Q9rfDKEiVf9woqEInv
	h+bteKzpLUJhv2886zYXW7Liha1j6zhs4i1pSqBFEK24jhCCIchXOV+b6vGCdX1jZnbX
	laOkyJFQrFuqxk38sIS/wWRzBzDjbASBaRIvqQVivpY07PFxFt2VhGcIObpFYYVvepia
	BFX0FXgi4tXNeIzgpr8XndZvHS11u+4aXcY0U7nbAUapygWjjo2v4PnkIeX9Hx045IGX
	hJWO7t+uCtFMOsnRLbRpnd1j5uEd4RhZBNA/2b8fgbQMnUPgCr/IziYIetXOa26Z6US4
	hevA==
X-Gm-Message-State: APjAAAUqhg26pEC6bTwFVkH2v4eiF7+4pNo/Y1x6WNitYFWg/SWPqiLE
	SrUySo9RDa/OFWn5pn7CCaWadZmhZjQ=
X-Google-Smtp-Source: APXvYqwwiiiCxwrL+bRzP4LSckn2DDQMPDNmatBeLQKHmhbW01KOAwNdHn1CMPmyOucxlIauZC4OSQ==
X-Received: by 2002:a63:d1a:: with SMTP id c26mr22660926pgl.286.1569818883330; 
	Sun, 29 Sep 2019 21:48:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:04 -0700
Message-Id: <3c036ee32a8080c12a8c31abed6f0e989c06a306.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 09/54] tiff: fix CVE-2019-7663
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:02 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: d06d6910d1ec9374bb15e02809e64e81198731b6)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtiff/tiff/CVE-2019-7663.patch               | 77 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |  3 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
new file mode 100644
index 0000000..f244fb2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
@@ -0,0 +1,77 @@
+CVE: CVE-2019-7663
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c6fc6c1fa895024c86285c58efd6424cf8078f32 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 11 Feb 2019 10:05:33 +0100
+Subject: [PATCH 1/2] check that (Tile Width)*(Samples/Pixel) do no overflow
+
+fixes bug 2833
+---
+ tools/tiffcp.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 2f406e2d..f0ee2c02 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1408,7 +1408,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	int status = 1;
+ 	uint32 imagew = TIFFRasterScanlineSize(in);
+ 	uint32 tilew = TIFFTileRowSize(in);
+-	int iskew  = imagew - tilew*spp;
++	int iskew;
+ 	tsize_t tilesize = TIFFTileSize(in);
+ 	tdata_t tilebuf;
+ 	uint8* bufp = (uint8*) buf;
+@@ -1416,6 +1416,12 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	uint32 row;
+ 	uint16 bps = 0, bytes_per_sample;
+ 
++	if (spp > (0x7fffffff / tilew))
++	{
++		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
++		return 0;
++	}
++	iskew = imagew - tilew*spp;
+ 	tilebuf = _TIFFmalloc(tilesize);
+ 	if (tilebuf == 0)
+ 		return 0;
+-- 
+2.20.1
+
+
+From da6454aa80b9bb3154dfab4e8b21637de47531e0 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 11 Feb 2019 21:42:03 +0100
+Subject: [PATCH 2/2] tiffcp.c: use INT_MAX
+
+---
+ tools/tiffcp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index f0ee2c02..8c81aa4f 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -41,6 +41,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include <ctype.h>
+ 
+@@ -1416,7 +1417,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	uint32 row;
+ 	uint16 bps = 0, bytes_per_sample;
+ 
+-	if (spp > (0x7fffffff / tilew))
++	if (spp > (INT_MAX / tilew))
+ 	{
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index a82d744..8e3e227 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,7 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://CVE-2019-6128.patch"
+           file://CVE-2019-6128.patch \
+           file://CVE-2019-7663.patch \
            "
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
-- 
2.7.4


