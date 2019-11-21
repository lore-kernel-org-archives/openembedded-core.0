Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4A67F8AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:04:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78829419"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 13:04:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 58F0D4CE1672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:56:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 13:04:56 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 16:44:31 +0800
Message-ID: <1574325871-52609-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 58F0D4CE1672.A606F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] tiff: Refresh patch
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
X-List-Received-Date: Thu, 21 Nov 2019 05:04:58 -0000
Content-Type: text/plain

Refresh CVE-2019-7663.patch as it can't be applyed when using PATCHTOOL = "patch".

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
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




