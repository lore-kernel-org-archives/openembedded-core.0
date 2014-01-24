Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f175.google.com (mail-gg0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 494236E702
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:24 +0000 (UTC)
Received: by mail-gg0-f175.google.com with SMTP id c2so762474ggn.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=GYoDs7UGjtlrzbQIIgpMrcRQi/keK9y8PI0ovSxdJIk=;
	b=qqkRjBXEf+wMHvwCuK2Dov0pBxE6vHFGNgSCh/JQcSt28/cT2pnNkgSuvNBq9ggU1v
	nSAex1fgjiJeoVzfjg0DSbK2CjpIZBAScoaaoniX0ryRMVWmk+pC5wEuc99Y/KlrQEei
	JVHkox9308ZdVlO4T0z9/D3sEiVI3DorqQcMiwOezAhhIvK4ZkvOOdzsR20jiYPlyiO/
	ao9P8BICD2j6rfecI40Jd1Tj93je8PTsCFFVnSPiU00C+rIfGTcX+dtv//ov2Je4kf0z
	a6nR6J51QCAJBUP1xgrWzStkSUwaL2b4G9R9Ra2joo7++lRJMRws/TdVhQd2V80Zknej
	hkfA==
X-Received: by 10.236.20.75 with SMTP id o51mr402463yho.65.1390526785006;
	Thu, 23 Jan 2014 17:26:25 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	d32sm42563584yhq.27.2014.01.23.17.26.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0E64417BF8CF3; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:08 -0200
Message-Id: <1390526775-26036-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 04/11] imx-vpu: Upgrade to 3.10.17-1.0.0_beta
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

Change-Id: I107c967a1cc2f27669806572cc05ec2ce265b5a3
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../build-Allow-CC-and-AR-to-be-overriden.patch    | 33 ----------------------
 recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb       | 14 +++++++++
 recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb        | 11 --------
 3 files changed, 14 insertions(+), 44 deletions(-)
 delete mode 100644 recipes-bsp/imx-vpu/imx-vpu-3.10.9-1.0.0/build-Allow-CC-and-AR-to-be-overriden.patch
 create mode 100644 recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb

diff --git a/recipes-bsp/imx-vpu/imx-vpu-3.10.9-1.0.0/build-Allow-CC-and-AR-to-be-overriden.patch b/recipes-bsp/imx-vpu/imx-vpu-3.10.9-1.0.0/build-Allow-CC-and-AR-to-be-overriden.patch
deleted file mode 100644
index 1a014aa..0000000
--- a/recipes-bsp/imx-vpu/imx-vpu-3.10.9-1.0.0/build-Allow-CC-and-AR-to-be-overriden.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 97cb0b711ce1a9d0dd3de51480d2e3a1399ce34c Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 5 Nov 2013 15:20:15 -0200
-Subject: [PATCH] build: Allow CC and AR to be overriden
-Organization: O.S. Systems Software LTDA.
-
-This is need to allow proper building when using Yocto and multiple
-machines sharing sstate-cache, otherwise the toolchain is going to
-default to use the first build machine sysroot due lack of '-sysroot'
-option.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- vpu/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/vpu/Makefile b/vpu/Makefile
-index b106631..dec2429 100644
---- a/vpu/Makefile
-+++ b/vpu/Makefile
-@@ -1,5 +1,5 @@
--CC=$(CROSS_COMPILE)gcc
--AR=$(CROSS_COMPILE)ar
-+CC ?= $(CROSS_COMPILE)gcc
-+AR ?= $(CROSS_COMPILE)ar
- 
- # list of platforms which want this test case
- INCLUDE_LIST:= IMX27ADS IMX51 IMX53 IMX6Q
--- 
-1.8.4.rc3
-
diff --git a/recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb b/recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb
new file mode 100644
index 0000000..fe8c5a6
--- /dev/null
+++ b/recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2013, 2014 Freescale Semiconductor
+
+require imx-vpu.inc
+
+PE = "1"
+
+# FIXME: Drop 'beta' suffix for GA release
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}_beta.bin;fsl-eula=true"
+S = "${WORKDIR}/${PN}-${PV}_beta"
+
+SRC_URI[md5sum] = "7ba78483bd1cf61bb6fce4ed9e9287d6"
+SRC_URI[sha256sum] = "589500bcc1c871d688ec23f11b930cd49079a689ed85d974ee8b32540c601cdd"
+
+COMPATIBLE_MACHINE = "(mx6)"
diff --git a/recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb b/recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb
deleted file mode 100644
index c4705c7..0000000
--- a/recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-require imx-vpu.inc
-
-PE = "1"
-
-SRC_URI += "file://build-Allow-CC-and-AR-to-be-overriden.patch"
-
-SRC_URI[md5sum] = "61331c9ed2d4c1b3aeab9c35fd034ac3"
-SRC_URI[sha256sum] = "5dd86a26c8d3013e0d78308b1ccd8815730818e465787f55013b492d2d3c7710"
-
-COMPATIBLE_MACHINE = "(mx6)"
-- 
1.8.5.3


