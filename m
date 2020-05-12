Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6635.1589292859220751497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=paeQR2mu;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0D939Qcz4y
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292857;
	bh=9LPgK/xiqwIrOyQufjKyIRCa3EZWj6r4VtQ0Eo7n/lM=;
	h=From:To:Subject:Date:From;
	b=paeQR2muQj0+G2ffYVUNDIEWmPwdtVjHTTpTa4qts63BAhQIObi3pint6W6aSBO6f
	 v171iBvYzRcyL8Q3Gy54nO78/bXlPPEk0zxF3MzQWlYB8Eh5DxaTjXN3DEYQUOgP7E
	 bsHDmlJDta/dz616c2u0WWmCwDIHM61A78f2K5Zw5cYRkBViKAiKzuj7N5wcYEOXCj
	 cNBFtogOxEEyOe5ynX242mgnphcVaODbJ7RnIX/194SBDlcipLUFDaWbP/oGyYrsmT
	 NdHMKWree/t/aCNV9syCcRw5r9GAEFUYbXTmGOsJlxCjeljV331SNX5pYqm391Cq0Z
	 nibDSpbsIVLV1Un4efGxRoiTkJDXsb+nAQUHV8YhkkX2pAeBjC35sMg4iBS//TaFLL
	 6whZtfGdBmQIGYiZ2szrS+8/PHi43pDljBJfNmcyiuWUd6NDLJqFf8+ghFrmSi9imE
	 i2jp5YlmGlTiSN1UzJRMMyxhm1d4OmIzJb5WLUAQe1p0/hSERXFNqLpirPuYqgvmG+
	 SYXSZLFJGbYgSI12TU2K8uYa9RVTTxrXpx33sDwv4v4TbgBbtSJd0PHOI7+Ywd6zDq
	 BypDOjgDOLU94UVCQWidmYEe8Hs6v7dR58wccdBEJlbsA6LRTtRSBIFrftyHsERmXg
	 1xodhHHFrjwUQm9juDLu/bbs=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iproute2: Remove -fcommon
Date: Tue, 12 May 2020 17:14:09 +0300
Message-Id: <20200512141416.5327-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 5.5.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
index ad0ab13c9a..7ad4b8eee6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS} -fcommon'"
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.17.1

