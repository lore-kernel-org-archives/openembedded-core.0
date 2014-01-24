Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f182.google.com (mail-gg0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 839C56E940
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:28 +0000 (UTC)
Received: by mail-gg0-f182.google.com with SMTP id e27so769057gga.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ugsPyE2pR27Y+EhNOw61L/0vsyesRZaOVCkeb+0h8pU=;
	b=X+r2rLkgqaLaTwpvcDZLBDx6bThnO0RxP3G0FcBmIVjnxjJnlXrDMvM37Yz/WS+L8e
	85zFxLOoBzPRUAIaKJx7VdKSX2jSZTcTZqiTO0Z0yUl04o7s2CftkeUjmEdqcbLCzNlx
	VWo1NoncsZg3nveLE9O60QutlmIE3RYGHHXcyuu1LxmvG5f/RUX61vqDh/A02ZPtcotU
	8lBZuoDxvdwghWv1k94GZiQnfXsUO/sMoryC4i43VSNMFykzpODKn+JIc7RiIk2GKSmd
	gHI0Y3Gms844EckxrUIt3/nLQTfLqCiXx2H5eeLKd2LTLHHPV6o/DnU9d/0B1gdjSybg
	Wsbw==
X-Received: by 10.236.79.129 with SMTP id i1mr353333yhe.80.1390526789447;
	Thu, 23 Jan 2014 17:26:29 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	a67sm42461199yhj.10.2014.01.23.17.26.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 17E7217BF8CF9; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:11 -0200
Message-Id: <1390526775-26036-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 07/11] libfslcodec: Upgrade to 3.0.10 version
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:29 -0000

From: Lauren Post <lauren.post@freescale.com>

Released in 3.10.17-1.0.0_beta release

Change-Id: I64f0b493ec73a32396b921f13affab3e11e48e41
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb | 10 ++++++++++
 recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb  | 13 -------------
 2 files changed, 10 insertions(+), 13 deletions(-)
 create mode 100644 recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb
 delete mode 100644 recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb

diff --git a/recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb b/recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb
new file mode 100644
index 0000000..a606ba6
--- /dev/null
+++ b/recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb
@@ -0,0 +1,10 @@
+# Copyright (C) 2013, 2014 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require libfslcodec.inc
+
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}.bin;fsl-eula=true"
+SRC_URI[md5sum] = "59c81f7da3440409e7e058edd0cdbb2a"
+SRC_URI[sha256sum] = "130f69e47b52a02988df64211c2e42c54f0d07f00d8c1229d20d41b2a9d784a2"
+
+COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
diff --git a/recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb b/recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb
deleted file mode 100644
index 1cb84d1..0000000
--- a/recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require libfslcodec.inc
-
-# FIXME: Inspecting the source code the content is in fact 3.0.9
-SRC_URI = "${FSL_MIRROR}/${PN}-3.10.9-1.0.0.bin;fsl-eula=true"
-S = "${WORKDIR}/${PN}-3.10.9-1.0.0"
-
-SRC_URI[md5sum] = "8fd6f1f4f7a504adfc27c1f73de554b4"
-SRC_URI[sha256sum] = "76a8a93d452db07e2531fbbc6dc1cbdf21943e6b3dfa1b2435faf5b356819f95"
-
-COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
-- 
1.8.5.3


