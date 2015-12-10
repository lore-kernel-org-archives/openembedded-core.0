Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B424273182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:16 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u63so24616484wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6C43wmnSJWoOGnW4tW6e7PUjBFB9O6Qe+hoedaa1dxQ=;
	b=y9Yd3KoP+KyW9X724va2DJjHNB69pwIg3eqsz1XiOlvMmsSVvwH4WELLdwd+eDsCov
	G3+V7QX2HbIxPEucKJLqZnN/d4qgaKW9yRIMoBu2i67T6b/bUEPKdOvdImrdDulyCFF7
	p5eDQbFclfPxDJsFJAsVaAYfOkKJkbdPWEG9YwX0t5TVax0VjLQeAyNhd+z5kov5luWn
	3JMHQQ+ApaF+uSj0pumhOXOvMPuM69cPtlzbtRjGD6lx7iu37yDg3lE2rfMenK/I5wS+
	qjmLz3MZwZHP4Abwxmb3QqdulTO8DjO+WnKLRZaHzvYwKAuhgVNCidwb7PJMT3KP9XOl
	diYQ==
X-Received: by 10.28.16.133 with SMTP id 127mr42916540wmq.24.1449755237376;
	Thu, 10 Dec 2015 05:47:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t64sm913143wmf.23.2015.12.10.05.47.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:41 +0100
Message-Id: <1bbfc6f99aec73d8724fc2f0666825fb029b2d4b.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 04/15] arch-armv7a, tune-cortexa*: improve comment VFP -> HF
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:17 -0000

* the section bellow the comment adds only HF variants, VFP is already
  mixed in the softfp sections above (unlike armv5, armv6 tune files
  where it really was above VFP/DSP section)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 4 ++--
 meta/conf/machine/include/tune-cortexa15.inc  | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc  | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc   | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc   | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index f819f6b..1db2fd1 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -35,7 +35,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahf ?= "armv7a"
 ARMPKGARCH_tune-armv7athf ?= "armv7a"
@@ -95,7 +95,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vf
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
 
-# Big Endian + VFP
+# Big Endian + HF
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon"
 ARMPKGARCH_tune-armv7ahfb ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb ?= "armv7a"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 802161a..1c0e674 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} corte
 PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
 ARMPKGARCH_tune-cortexa15hf = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf = "cortexa15"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index e4d69a0..b6d8052 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa17t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} corte
 PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa17-vfp cortexa17-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
 ARMPKGARCH_tune-cortexa17hf = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf = "cortexa17"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index c263dac..664127d 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex
 PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
 ARMPKGARCH_tune-cortexa5hf = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf = "cortexa5"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index fa4d722..40a4000 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex
 PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa7hf = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf = "cortexa7"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 5621a6b..caf4653 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex
 PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
 ARMPKGARCH_tune-cortexa8hf = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf = "cortexa8"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 9f45667..ab86473 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex
 PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
 ARMPKGARCH_tune-cortexa9hf = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf = "cortexa9"
-- 
2.6.3


