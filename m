Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB776FF86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:18 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u63so24617465wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=e1buvZgBAMjtIsKLFx5K06TbNseUxAeSxaLc3zyz048=;
	b=bZBpalUjMbYhcUNH2ktjsj930SmPxUeNWkmCBLIfywHK4CvDPHt3ZBNAjdgjUhDYIc
	LlQ/UKbgJmdBBeg80tu2BgsdMxL1u9pkcQTSq1i7U8IYPr7XM3vC3WUFCA1lOL2EWprR
	989Rwr60p687Hkx1Ulqm36U4qNMdBkkZVd1NzoVAM5IfkMCYWFNkI2K25npa+nLIBUiM
	sBS5CvpH9445rsqnTUQ8Bao1R8SlydDv7w7q8ugExYyKJVhqW1QD22HNhpFGu6cF4QAm
	zzDa2cEbQd6kYi4E1UREzDcWFfE9d7qTx6nWA25XfRqw22i7Q+drIgmoi/vEWLb+0Yf7
	f+gg==
X-Received: by 10.28.91.9 with SMTP id p9mr38963534wmb.18.1449755238816;
	Thu, 10 Dec 2015 05:47:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l128sm923951wmf.10.2015.12.10.05.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:42 +0100
Message-Id: <e6ee37cee7ab079e3d217ea6ca696ecd25cb5d51.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 05/15] arch-armv7a, tune-cortexa*: improve indentation
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:19 -0000

* indent the assignments, so that it's easier to see the algoritm how these
  values are modified and do less errors, see fixes in next commit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 200 +++++++++++++-------------
 meta/conf/machine/include/tune-cortexa15.inc  |  48 +++----
 meta/conf/machine/include/tune-cortexa17.inc  |  48 +++----
 meta/conf/machine/include/tune-cortexa5.inc   |  48 +++----
 meta/conf/machine/include/tune-cortexa7.inc   |  54 +++----
 meta/conf/machine/include/tune-cortexa8.inc   |  48 +++----
 meta/conf/machine/include/tune-cortexa9.inc   |  48 +++----
 7 files changed, 247 insertions(+), 247 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 1db2fd1..c3b8869 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -10,114 +10,114 @@ require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
-ARMPKGARCH_tune-armv7a ?= "armv7a"
-ARMPKGARCH_tune-armv7at ?= "armv7a"
-ARMPKGARCH_tune-armv7a-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7at-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7a-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7at-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7a-neon ?= "armv7a"
-ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
-TUNE_FEATURES_tune-armv7a ?= "arm armv7a vfp"
-TUNE_FEATURES_tune-armv7at ?= "${TUNE_FEATURES_tune-armv7a} thumb"
-TUNE_FEATURES_tune-armv7a-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a} vfpv3d16"
-TUNE_FEATURES_tune-armv7at-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
-TUNE_FEATURES_tune-armv7a-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} vfpv3"
-TUNE_FEATURES_tune-armv7at-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
-TUNE_FEATURES_tune-armv7a-neon ?= "${TUNE_FEATURES_tune-armv7a} neon"
-TUNE_FEATURES_tune-armv7at-neon ?= "${TUNE_FEATURES_tune-armv7at} neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7a armv7a-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-vfpv3d16 armv7at2-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
+ARMPKGARCH_tune-armv7a             ?= "armv7a"
+ARMPKGARCH_tune-armv7at            ?= "armv7a"
+ARMPKGARCH_tune-armv7a-vfpv3d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7at-vfpv3d16   ?= "armv7a"
+ARMPKGARCH_tune-armv7a-vfpv3       ?= "armv7a"
+ARMPKGARCH_tune-armv7at-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7a-neon        ?= "armv7a"
+ARMPKGARCH_tune-armv7at-neon       ?= "armv7a"
+TUNE_FEATURES_tune-armv7a             ?= "arm armv7a vfp"
+TUNE_FEATURES_tune-armv7at            ?= "${TUNE_FEATURES_tune-armv7a} thumb"
+TUNE_FEATURES_tune-armv7a-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a}  vfpv3d16"
+TUNE_FEATURES_tune-armv7at-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
+TUNE_FEATURES_tune-armv7a-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}  vfpv3"
+TUNE_FEATURES_tune-armv7at-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7a-neon        ?= "${TUNE_FEATURES_tune-armv7a}  neon"
+TUNE_FEATURES_tune-armv7at-neon       ?= "${TUNE_FEATURES_tune-armv7at} neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-vfpv3d16 armv7at2-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
-ARMPKGARCH_tune-armv7ahf ?= "armv7a"
-ARMPKGARCH_tune-armv7athf ?= "armv7a"
-ARMPKGARCH_tune-armv7ahf-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7athf-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahf-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7athf-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahf-neon ?= "armv7a"
-ARMPKGARCH_tune-armv7athf-neon ?= "armv7a"
-ARMPKGARCH_tune-armv7ahf-neon-vfpv4 ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf             ?= "armv7a"
+ARMPKGARCH_tune-armv7athf            ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-vfpv3d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-vfpv3d16   ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-vfpv3       ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-neon        ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-neon       ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
-TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3} callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3} callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon} vfpv4"
-TUNE_FEATURES_tune-armv7athf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon} vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-vfpv3d16 armv7at2hf-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
+TUNE_FEATURES_tune-armv7ahf             ?= "${TUNE_FEATURES_tune-armv7a}             callconvention-hard"
+TUNE_FEATURES_tune-armv7athf            ?= "${TUNE_FEATURES_tune-armv7at}            callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3}       callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3}      callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon        ?= "${TUNE_FEATURES_tune-armv7a-neon}        callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon       ?= "${TUNE_FEATURES_tune-armv7at-neon}       callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  ?= "${TUNE_FEATURES_tune-armv7ahf-neon}      vfpv4"
+TUNE_FEATURES_tune-armv7athf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon}     vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-vfpv3d16 armv7at2hf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  armv7ahf-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-vfp-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
 
 # Big Endian
 AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
-ARMPKGARCH_tune-armv7ab ?= "armv7a"
-ARMPKGARCH_tune-armv7atb ?= "armv7a"
-ARMPKGARCH_tune-armv7ab-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7atb-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7ab-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7atb-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ab-neon ?= "armv7a"
-ARMPKGARCH_tune-armv7atb-neon ?= "armv7a"
-TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
-TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3} bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3} bigendian"
-TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
-TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv7ab-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-vfpv3d16 armv7at2b-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
+ARMPKGARCH_tune-armv7ab             ?= "armv7a"
+ARMPKGARCH_tune-armv7atb            ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-vfpv3d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-vfpv3d16   ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-vfpv3       ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-neon        ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-neon       ?= "armv7a"
+TUNE_FEATURES_tune-armv7ab             ?= "${TUNE_FEATURES_tune-armv7a}             bigendian"
+TUNE_FEATURES_tune-armv7atb            ?= "${TUNE_FEATURES_tune-armv7at}            bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7ab-neon        ?= "${TUNE_FEATURES_tune-armv7a-neon}        bigendian"
+TUNE_FEATURES_tune-armv7atb-neon       ?= "${TUNE_FEATURES_tune-armv7at-neon}       bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-vfpv3d16 armv7at2b-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  armv7ab-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + HF
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon"
-ARMPKGARCH_tune-armv7ahfb ?= "armv7a"
-ARMPKGARCH_tune-armv7athfb ?= "armv7a"
-ARMPKGARCH_tune-armv7ahfb-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7athfb-vfpv3d16 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahfb-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7athfb-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahfb-neon ?= "armv7a"
-ARMPKGARCH_tune-armv7athfb-neon ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ahf} bigendian"
-TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7athf} bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16} bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3} bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3} bigendian"
-TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} bigendian"
-TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-vfpv3d16 armv7at2hfb-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
+ARMPKGARCH_tune-armv7ahfb             ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb            ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-vfpv3d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-vfpv3d16   ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-vfpv3       ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-neon        ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-neon       ?= "armv7a"
+TUNE_FEATURES_tune-armv7ahfb             ?= "${TUNE_FEATURES_tune-armv7ahf}             bigendian"
+TUNE_FEATURES_tune-armv7athfb            ?= "${TUNE_FEATURES_tune-armv7athf}            bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3       ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3      ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        bigendian"
+TUNE_FEATURES_tune-armv7athfb-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-vfpv3d16 armv7at2hfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  armv7ahfb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 1c0e674..af2fb2d 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -7,30 +7,30 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cort
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
-ARMPKGARCH_tune-cortexa15 = "cortexa15"
-ARMPKGARCH_tune-cortexa15t = "cortexa15"
-ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
-TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
+ARMPKGARCH_tune-cortexa15             = "cortexa15"
+ARMPKGARCH_tune-cortexa15t            = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
+TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7a}             cortexa15"
+TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7at}            cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
-ARMPKGARCH_tune-cortexa15hf = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf = "cortexa15"
-ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
+ARMPKGARCH_tune-cortexa15hf             = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf            = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
+TUNE_FEATURES_tune-cortexa15hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
+TUNE_FEATURES_tune-cortexa15thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index b6d8052..7ddb264 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -7,30 +7,30 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cort
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon"
-ARMPKGARCH_tune-cortexa17 = "cortexa17"
-ARMPKGARCH_tune-cortexa17t = "cortexa17"
-ARMPKGARCH_tune-cortexa17-neon = "cortexa17"
-ARMPKGARCH_tune-cortexa17t-neon = "cortexa17"
-TUNE_FEATURES_tune-cortexa17 = "${TUNE_FEATURES_tune-armv7a} cortexa17"
-TUNE_FEATURES_tune-cortexa17t = "${TUNE_FEATURES_tune-armv7at} cortexa17"
-TUNE_FEATURES_tune-cortexa17-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa17"
-TUNE_FEATURES_tune-cortexa17t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa17-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa17-vfp cortexa17-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
+ARMPKGARCH_tune-cortexa17             = "cortexa17"
+ARMPKGARCH_tune-cortexa17t            = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
+TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7a}             cortexa17"
+TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7at}            cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa17-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
-ARMPKGARCH_tune-cortexa17hf = "cortexa17"
-ARMPKGARCH_tune-cortexa17thf = "cortexa17"
-ARMPKGARCH_tune-cortexa17hf-neon = "cortexa17"
-ARMPKGARCH_tune-cortexa17thf-neon = "cortexa17"
-TUNE_FEATURES_tune-cortexa17hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa17"
-TUNE_FEATURES_tune-cortexa17thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa17"
-TUNE_FEATURES_tune-cortexa17thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa17hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
+ARMPKGARCH_tune-cortexa17hf             = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf            = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
+TUNE_FEATURES_tune-cortexa17hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa17"
+TUNE_FEATURES_tune-cortexa17thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 664127d..598782d 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -7,30 +7,30 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mtune=corte
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
-ARMPKGARCH_tune-cortexa5 = "cortexa5"
-ARMPKGARCH_tune-cortexa5t = "cortexa5"
-ARMPKGARCH_tune-cortexa5-neon = "cortexa5"
-ARMPKGARCH_tune-cortexa5t-neon = "cortexa5"
-TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
-TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
-TUNE_FEATURES_tune-cortexa5-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
-TUNE_FEATURES_tune-cortexa5t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
+ARMPKGARCH_tune-cortexa5             = "cortexa5"
+ARMPKGARCH_tune-cortexa5t            = "cortexa5"
+ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
+ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
+TUNE_FEATURES_tune-cortexa5             = "${TUNE_FEATURES_tune-armv7a}             cortexa5"
+TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-armv7at}            cortexa5"
+TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa5"
+TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp cortexa5-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
-ARMPKGARCH_tune-cortexa5hf = "cortexa5"
-ARMPKGARCH_tune-cortexa5thf = "cortexa5"
-ARMPKGARCH_tune-cortexa5hf-neon = "cortexa5"
-ARMPKGARCH_tune-cortexa5thf-neon = "cortexa5"
-TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
-TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
-TUNE_FEATURES_tune-cortexa5hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
-TUNE_FEATURES_tune-cortexa5thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
+ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
+ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
+TUNE_FEATURES_tune-cortexa5hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa5"
+TUNE_FEATURES_tune-cortexa5thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa5"
+TUNE_FEATURES_tune-cortexa5hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa5"
+TUNE_FEATURES_tune-cortexa5thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa5hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp cortexa5hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 40a4000..5cbb8d7 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -7,36 +7,36 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=corte
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
-ARMPKGARCH_tune-cortexa7 = "cortexa7"
-ARMPKGARCH_tune-cortexa7t = "cortexa7"
-ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
-TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
-TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
+ARMPKGARCH_tune-cortexa7             = "cortexa7"
+ARMPKGARCH_tune-cortexa7t            = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
+TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7a}             cortexa7"
+TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7at}            cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
-ARMPKGARCH_tune-cortexa7hf = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon-vfpv4 = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf             = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf            = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
+TUNE_FEATURES_tune-cortexa7thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
 TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp-vfpv4-neon"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index caf4653..96115db 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -7,30 +7,30 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mtune=corte
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
-ARMPKGARCH_tune-cortexa8 = "cortexa8"
-ARMPKGARCH_tune-cortexa8t = "cortexa8"
-ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
-ARMPKGARCH_tune-cortexa8t-neon = "cortexa8"
-TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
-TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
-TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
-TUNE_FEATURES_tune-cortexa8t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
+ARMPKGARCH_tune-cortexa8             = "cortexa8"
+ARMPKGARCH_tune-cortexa8t            = "cortexa8"
+ARMPKGARCH_tune-cortexa8-neon        = "cortexa8"
+ARMPKGARCH_tune-cortexa8t-neon       = "cortexa8"
+TUNE_FEATURES_tune-cortexa8             = "${TUNE_FEATURES_tune-armv7a}             cortexa8"
+TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-armv7at}            cortexa8"
+TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa8"
+TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa8-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp cortexa8-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
-ARMPKGARCH_tune-cortexa8hf = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf = "cortexa8"
-ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf-neon = "cortexa8"
-TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
-TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
-TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
-TUNE_FEATURES_tune-cortexa8thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
+ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
+ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
+TUNE_FEATURES_tune-cortexa8hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa8"
+TUNE_FEATURES_tune-cortexa8thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa8"
+TUNE_FEATURES_tune-cortexa8thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa8hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index ab86473..d504c9f 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -7,30 +7,30 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mtune=corte
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
-ARMPKGARCH_tune-cortexa9 = "cortexa9"
-ARMPKGARCH_tune-cortexa9t = "cortexa9"
-ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
-ARMPKGARCH_tune-cortexa9t-neon = "cortexa9"
-TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
-TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
-TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
-TUNE_FEATURES_tune-cortexa9t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
+ARMPKGARCH_tune-cortexa9             = "cortexa9"
+ARMPKGARCH_tune-cortexa9t            = "cortexa9"
+ARMPKGARCH_tune-cortexa9-neon        = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-neon       = "cortexa9"
+TUNE_FEATURES_tune-cortexa9             = "${TUNE_FEATURES_tune-armv7a}             cortexa9"
+TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-armv7at}            cortexa9"
+TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa9"
+TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa9-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp cortexa9-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
-ARMPKGARCH_tune-cortexa9hf = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf = "cortexa9"
-ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf-neon = "cortexa9"
-TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
-TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
-TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
-TUNE_FEATURES_tune-cortexa9thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
+ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
+TUNE_FEATURES_tune-cortexa9hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa9"
+TUNE_FEATURES_tune-cortexa9thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa9hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
-- 
2.6.3


