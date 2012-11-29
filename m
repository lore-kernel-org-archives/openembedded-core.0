Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDWM-0006NS-80
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:54 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5816649eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uQuKeiDvGHxeeX5ms3pVyH033ao61ow44J78Dk0mHeY=;
	b=KAhYE6oAut4RjGyraduQ9FkFV02+QGmhu70Op2h5LzF5EXiw1kUnWqRVxY4ALIO78f
	LIyIQmc7UL0cBxmBG/KkBub2PBh1bDQ+hIDWLPAzWNyehIeKdblb91+6GR2wNb4PumI0
	Lo8DkEeJVcYl1uZqFgwvVI89PRNF/pbe8SOap4dYWPF+XIL1O59S4RNEhgxrBi2Bam4m
	pFYF2m0cscvhqFp6hFh10MRdy66VTtiKtaicKGeE9kMCfoUlvLcBz1gKLNpFwhVaTQlJ
	9ueyIe4/yDDcixPQFuzBXYY+B6MypjzGodvaP6LXpy6h9fYuwftJ1VUpPhXPf+tyHROC
	hBbw==
Received: by 10.14.175.133 with SMTP id z5mr87387036eel.15.1354230820249;
	Thu, 29 Nov 2012 15:13:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm6698509eem.13.2012.11.29.15.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:39 +0100
Message-Id: <d3e6d22128b822914322942d5084a02bf3a57ecc.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] tune-cortexa*: add another TUNE which allows to enable cortexa* together with thumb and neon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 23:27:54 -0000

* like we have with tune-armv7at-neon

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexa8.inc | 10 ++++++++--
 meta/conf/machine/include/tune-cortexa9.inc | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index bfc58a1..12b5f66 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -6,25 +6,31 @@ TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
+AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
 ARMPKGARCH_tune-cortexa8 = "cortexa8"
 ARMPKGARCH_tune-cortexa8t = "cortexa8"
 ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
+ARMPKGARCH_tune-cortexa8t-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
+AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
 ARMPKGARCH_tune-cortexa8hf = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf = "cortexa8"
 ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
 TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
 TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index f56b088..bebf3fc 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -6,25 +6,31 @@ TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon"
+AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
 ARMPKGARCH_tune-cortexa9 = "cortexa9"
 ARMPKGARCH_tune-cortexa9t = "cortexa9"
 ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
 TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
 TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon"
+AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
 ARMPKGARCH_tune-cortexa9hf = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf = "cortexa9"
 ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
 TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
 TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2-vfp cortexa9t2hf-vfp-neon"
-- 
1.8.0



