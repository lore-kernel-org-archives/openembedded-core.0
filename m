Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id DFC2C7E950
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d22so271422pll.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=KraRMYa37j6p+bu4zgYjTgTdUa+vgmkZqK0kVXyhDR3NbksoV8QfLrsXB/SUu6mrow
	PzVAVocgsyQVT5edDu75tmab+rj10UWblIorB61RpsQe+HBP0lbCYy8nMe5eUKCXbiIg
	nNsuzJ0myF2OkGVSaXccPyb3bjcsrt+QQsHYy34XKFGxJ7sd1BbT+/Aqvvw2HsZafTN/
	ZwMvDy3bmrK/DM1YmqZY/P+XcvQdiPbnBxZ6Ef8d4tJrg8AtFXB26PEVpLxA0P1T0B2J
	8RwClWVP+LwLP7CEQp4GjvK/6K9B8Ur9dU7bYzOC1Q2HQzaXX07OTrnE1y2FOFndemG1
	EFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=OHIJQgJbUi9h+aFB7HJGGY/Df+VzG3RVOmbbhWsCpA3LqpPqJdIdZYQdAi5/fIYUiK
	ZbFm8CMiPqtspV6I6DcGT9LtPRjzMcLEOfdrfhGdQcrozWQHMmZjVRFJeiqq3i2eOGEL
	Vw9gHTFdlrqfUAwvPQFo6iV0FMHk+t/hSHBs+B/2YRgTH7wtCVuI6ozsDUnWM57KwVZ/
	ArEahS8174b+IOgYeBs6xv42XN+Mdjwd9fzkZP72lexmXQKRejO+xL58v32xYpR+EYGc
	npIO7fLy6BBLhGOHKzQDLxrGps1VefCpz96X+8n+aZQs70e7SUktz9RApG4h1j6y+7Jv
	+nUw==
X-Gm-Message-State: APjAAAVN1aQtaHEiBBTwEfKGi4uu9CzqTHTvcP7vAfGBd9pKzmCsAfI2
	mQMzgu48m3ER39LaDg/I4iQUd+L9jLA=
X-Google-Smtp-Source: APXvYqxkluxmJ0/Wm5RHCudgo4ZHgcutl6RION/nnx78GLZIcw5erm9YPHV84uw6j7xfrIi3r48HYA==
X-Received: by 2002:a17:902:a9c6:: with SMTP id b6mr744670plr.40.1569293382823;
	Mon, 23 Sep 2019 19:49:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:49 -0700
Message-Id: <d451c37e5f5765440efd77e4c7b0951875f03b33.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 09/50] tiff: fix CVE-2019-7663
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:42 -0000

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


