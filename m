Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 05A3D610F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:22 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so4143255ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=jQeudacwRutJ6te7OV4eWpM3Z2/PlONKx1mDrLCAuYs=;
	b=F7gjVl/8/Va0LVzVEo1dj/gbR1FCBKRF+Sx0D/DfydyBp8DUGJ70J2X3dIVTthS3ee
	y5C7qa1wFolSxWjSBAdZkBzwdbvFssmVAP/VGOBm9qb9N12MPjwoDrAG8oz4EqJB47Jq
	UeiNagwSLhjnBedvBVG8T31v5K/sgUtRubg/WAhR6rV386tLtrWtB5AHvQBPA1yK7GJD
	C7zTBKi8Wm+7sLALAtmnSlh4gLo79xqY2aYJPUGh3gtPZzTw/7XccoNgPLnw+0rSDBMQ
	lfOahMjo+n8s+apt2TpXJHd7e4Vr/pMTtYWBrLUjOCDSEf7ydD8tWKmTwVBSDNOftNhx
	xhJw==
X-Received: by 10.236.62.194 with SMTP id y42mr10231225yhc.54.1390526783470;
	Thu, 23 Jan 2014 17:26:23 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 9sm42505012yhe.21.2014.01.23.17.26.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0B21517BF8CF1; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:07 -0200
Message-Id: <1390526775-26036-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 03/11] imx-lib: Upgrade to 3.10.17-1.0.0_beta
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:24 -0000

From: Lauren Post <lauren.post@freescale.com>

Change-Id: I785fea5d0370ff81076e62d52635b75f1580a278
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb | 14 ++++++++++++++
 recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb  | 10 ----------
 2 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb

diff --git a/recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb b/recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb
new file mode 100644
index 0000000..47a0891
--- /dev/null
+++ b/recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2013, 2014 Freescale Semiconductor
+
+include imx-lib.inc
+
+# FIXME: Drop 'beta' suffix for GA release
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}_beta.tar.gz"
+S="${WORKDIR}/${PN}-${PV}_beta"
+
+PE = "1"
+
+SRC_URI[md5sum] = "6c6769c2e6a2918a57a3754adcebff12"
+SRC_URI[sha256sum] = "abb025eeab9e8191f4089e70716a1695dc263c5b68f42a8b28329e81889b3312"
+
+COMPATIBLE_MACHINE = "(mx6)"
diff --git a/recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb b/recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb
deleted file mode 100644
index c3a7fb0..0000000
--- a/recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-
-include imx-lib.inc
-
-SRC_URI[md5sum] = "5cc9c8d09c7ba401cdab4a2ecbda89e2"
-SRC_URI[sha256sum] = "d1581c2f2956731da0c42e9dc17514a4d00790deeb83defeb5e07d14746190d8"
-
-PE = "1"
-
-COMPATIBLE_MACHINE = "(mx6)"
\ No newline at end of file
-- 
1.8.5.3


