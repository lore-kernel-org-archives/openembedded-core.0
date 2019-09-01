Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id BBC477F421
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:32 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n4so5949459pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=ir7LNd/rAOxktD3BcX5R2CxTgdnyagVYtamriTKEZbGB7BB4bXtWixum+1t5c9YxeR
	pBPaeA/v1mYCbfRarRlCkBjussJVt2wkXwM01YPN7QJtZ6bEJmOk6nG8jvimO2+7dEzE
	ut12YkZWl9D/Br6TmzxpVbcFyPItnXxjFRQMEM3MF18SaEWWHMKvzxPaoU5rW3Om992K
	04Cy9KE6Zk235qfwuPGIkvT/haqDPeqAsNS3mfizSyN1P3F+dNneJAH20KlAZ/LtHZOU
	2doqeJABXo15Ovl2ZaAoDgQp8LdjwQyIUr5FCygLu9xxJHOES7NjnAOl0wzdI8VycJRy
	sklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3pIZnIk0lHetOo/VGL1JT/6O03AleRFQfmhuCRz4bmk=;
	b=CrKf8elp5VqPwPX6xpmInq9aTznhl/n9JRr8mBi1C/S8u6iFBJ3rZgWQlA7v3k2308
	ozDkreI3aXMCXSWlNJVH9ZJooWRDmkYECYbzPwJEKAxHCZVDmraP319JUpQ0kzuPSij+
	8pGmwHjqxqUzhu0W1kbild6S/r5PPpxggvVAz06QKFnJ22RlqQYkV6L0VH5z05bB2/MG
	47DN1jEyKwLLaZ71tj6U8miLhUQbBBbDQvqYcm/bJajFZ7y+tnz7Try5bSAEMHTw05HU
	x/o14GrBPibaCBkFF4AWW+/U46Mkhzu5denazmBYgiuHV+eX15gBQnXLcA6aUFK0rozp
	bOgg==
X-Gm-Message-State: APjAAAUq8On/E8FpLn123jQ9jz+/RZF+9hBhHflLZRUkqeO72EoSH6MV
	aNht3ZMkKPHeR8V5ucWuuQ/O8bXn
X-Google-Smtp-Source: APXvYqyIPh4Hb9kka/sfSE+KPBtKvE0naHtJbgvHyT/gF/UR1qiIMnSFHR7gGRI+C2wrxBx7F0Z+JQ==
X-Received: by 2002:aa7:957a:: with SMTP id x26mr25821132pfq.16.1567348593606; 
	Sun, 01 Sep 2019 07:36:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:47 -0700
Message-Id: <d451c37e5f5765440efd77e4c7b0951875f03b33.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 09/43] tiff: fix CVE-2019-7663
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:32 -0000

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


