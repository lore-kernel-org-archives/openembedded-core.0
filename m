Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id A3D786E498
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:23 +0000 (UTC)
Received: by mail-gg0-f174.google.com with SMTP id g10so756870gga.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=F0Z09sUGC349RCk/zsf006rirajVIRk96igoaycQEdY=;
	b=nc1P1VXdz0wvcym3yAnLz7TPtQnI1sT4AfWyhfmG/FqZDwJJwbdKYOAEG7NvDf2HeT
	vpPNg/yfrNL2JTvxNWfpw7v5ccdWUoUeEMXhZ2hBoCMahh54N5LQDCR9q0QoE0hxbvBc
	84Jl1Hmob1Q6GkAOYi4ayvJ65WxJJh/WpCc5r2x4HpU54tvtbeJLiMjbklmEJQ412gFk
	kACncGoMsXXAfqcoJfRk4Jd/kVEt840Mv3yp9zOaoxtkdUGTzK8RVLiWa1roBh4SfEx1
	gRtaYbBOIjArzbT2kABfP92XaXuVuikoE7k5ShHch9CHdRgIiJpOfr6i+JNTbtmZym85
	yl6Q==
X-Received: by 10.236.123.193 with SMTP id v41mr401635yhh.68.1390526783978;
	Thu, 23 Jan 2014 17:26:23 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 57sm42437943yhl.4.2014.01.23.17.26.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 07EBF17BF8CEF; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:06 -0200
Message-Id: <1390526775-26036-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 02/11] imx-test: Update to 3.10.17-1.0.0 version
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

Release in 3.10.17-1.0.0_beta version.

Change-Id: I0a841cbfaac1b94fd389121d42575e88e55dc52a
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb | 15 +++++++++++++++
 recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb  | 10 ----------
 2 files changed, 15 insertions(+), 10 deletions(-)
 create mode 100644 recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb

diff --git a/recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb b/recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb
new file mode 100644
index 0000000..b4362b8
--- /dev/null
+++ b/recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2013, 2014 Freescale Semiconductor
+
+include imx-test.inc
+
+# FIXME: Drop 'beta' suffix for GA release
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}_beta.tar.gz \
+           file://clocks.sh"
+S="${WORKDIR}/${PN}-${PV}_beta"
+
+PE = "1"
+
+SRC_URI[md5sum] = "fd3de6e882a7b5425853083ec8d4951e"
+SRC_URI[sha256sum] = "1e86cfe800fbf2db2a52ce0155ab2d2ba70913a30974b3f66879198eaf9da21b"
+
+COMPATIBLE_MACHINE = "(mx6)"
diff --git a/recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb b/recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb
deleted file mode 100644
index 5b0722f..0000000
--- a/recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-
-include imx-test.inc
-
-PE = "1"
-
-SRC_URI[md5sum] = "518ce3fba668a09993d53b3b0df85944"
-SRC_URI[sha256sum] = "576ffd963cc8ea82e6f17e55ac467448286df014408b23a59ecf9d8072955d7a"
-
-COMPATIBLE_MACHINE = "(mx6)"
-- 
1.8.5.3


