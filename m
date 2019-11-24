Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 774D57FC0B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:56 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 6so1598433pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iPW3twGi2P5SncPBAKOa675BFRrIwfG7BM6LP8of7jU=;
	b=jbDKA1YMa8OarDETYkVjpOoI0j1RfYBaq+KxMjfmoh6Tic7NNAwiCNpn2r/X760RxJ
	qRO/un9JN5Boe31zplAfkt0pWX1SF2EJyPgBy/pNVTA2RZzHKkt38f5EPRN+Yrdi1uyH
	wXJQXM+lBDXWjJfWzqTdlv/ot4xGDlR9arzOdNzVXSXFMTMlV9XxlwDAsTLQKpuAcxMy
	J2ynOLO5LUDFmcVt6wHuaSkzIC2tXJtDD2thC4n/0EyJMN+OjNHUsz8Raj9UBZ1KHgN8
	tuh8Z4kbYr9OyVgoVR9DHN0jXblpOWDsYgyzb07NWRDkH99jWY8TLPQxHw9/FjuOFxMM
	bWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iPW3twGi2P5SncPBAKOa675BFRrIwfG7BM6LP8of7jU=;
	b=o9xBCewEInBzzjcyvaztzZaIJi5xHgMydD5LQqNPT5QewBHQ8EJYnpqeJn+Euvr94M
	L+6FKYwPD+1ohc71XfNH2CHVWM1D+AfLgxwKR8adTZNCOBLGnC7wuYIyeOqo4cZeA6gD
	ok+ePd8ZocHdgy1Br61REijsUp/hymbVCTleLYGirIYidx0p0q17TBcocCna5/Pdz0n6
	xU6h9s8bmGlaRkJ6+KhAZcWeYF4Ze2cMJ5uoC9tf1huj0YS/5GZWPib58ZT2uBSRW+G7
	qirPeb3mJNZjaGBpHv68G4/f0IPDzhDGfr82pxB4FqKHUxBs/aZ6u1nV0ihlFyr1lITv
	jehA==
X-Gm-Message-State: APjAAAVxqypVe8SLnz7pAy12DxB7k+oQNBKpPVbYD4MY25zXtcIqo0OR
	i8K7xkQICJhRGlntytEZtQB+m34I
X-Google-Smtp-Source: APXvYqzpXoZLs71J4iltJ5NFLUJbzhUxzVR0DjR8TOQ7LrPw9BigD65ggNg0ld+qRS6xSWQy42PXwA==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr28289718pgl.394.1574639457277;
	Sun, 24 Nov 2019 15:50:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:19 -0800
Message-Id: <5a4465726e25b9ea1cc5c819be0b4dc8d2bc504a.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 14/35] tiff: Refresh patch
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:56 -0000

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Refresh CVE-2019-7663.patch as it can't be applyed when using PATCHTOOL = "patch".

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libtiff/tiff/CVE-2019-7663.patch               | 71 ++++++++--------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
index f244fb2..94e4e33 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
@@ -1,22 +1,37 @@
-CVE: CVE-2019-7663
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+CVE: CVE-2019-7663 
+Upstream-Status: Backport 
+Signed-off-by:
+Ross Burton <ross.burton@intel.com>
 
 From c6fc6c1fa895024c86285c58efd6424cf8078f32 Mon Sep 17 00:00:00 2001
 From: Thomas Bernard <miniupnp@free.fr>
 Date: Mon, 11 Feb 2019 10:05:33 +0100
 Subject: [PATCH 1/2] check that (Tile Width)*(Samples/Pixel) do no overflow
 
-fixes bug 2833
+From da6454aa80b9bb3154dfab4e8b21637de47531e0 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 11 Feb 2019 21:42:03 +0100
+Subject: [PATCH 2/2] tiffcp.c: use INT_MAX
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Refresh this patch as it can't be applyed when using PATCHTOOL = "patch".
 ---
- tools/tiffcp.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
+ tools/tiffcp.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 2f406e2d..f0ee2c02 100644
+index 2f406e2..8c81aa4 100644
 --- a/tools/tiffcp.c
 +++ b/tools/tiffcp.c
-@@ -1408,7 +1408,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+@@ -41,6 +41,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include <ctype.h>
+ 
+@@ -1408,7 +1409,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
  	int status = 1;
  	uint32 imagew = TIFFRasterScanlineSize(in);
  	uint32 tilew = TIFFTileRowSize(in);
@@ -25,11 +40,11 @@ index 2f406e2d..f0ee2c02 100644
  	tsize_t tilesize = TIFFTileSize(in);
  	tdata_t tilebuf;
  	uint8* bufp = (uint8*) buf;
-@@ -1416,6 +1416,12 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+@@ -1416,6 +1417,12 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
  	uint32 row;
  	uint16 bps = 0, bytes_per_sample;
  
-+	if (spp > (0x7fffffff / tilew))
++	if (spp > (INT_MAX / tilew))
 +	{
 +		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
 +		return 0;
@@ -39,39 +54,5 @@ index 2f406e2d..f0ee2c02 100644
  	if (tilebuf == 0)
  		return 0;
 -- 
-2.20.1
-
-
-From da6454aa80b9bb3154dfab4e8b21637de47531e0 Mon Sep 17 00:00:00 2001
-From: Thomas Bernard <miniupnp@free.fr>
-Date: Mon, 11 Feb 2019 21:42:03 +0100
-Subject: [PATCH 2/2] tiffcp.c: use INT_MAX
-
----
- tools/tiffcp.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index f0ee2c02..8c81aa4f 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -41,6 +41,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <limits.h>
- 
- #include <ctype.h>
- 
-@@ -1416,7 +1417,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
- 	uint32 row;
- 	uint16 bps = 0, bytes_per_sample;
- 
--	if (spp > (0x7fffffff / tilew))
-+	if (spp > (INT_MAX / tilew))
- 	{
- 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
- 		return 0;
--- 
-2.20.1
+2.7.4
 
-- 
2.7.4


