Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 090EB6011B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 18:37:12 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so210850552wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JruOtx6cg2i3zCIQ0pc+qjN6DRBDEqPAFSxhDYS4FVw=;
	b=kIODxUTGQZkwO94QMe4v8SzC2nSbXlgfH4N6c1PapCTR883Xdfck5sCa+UHr24K/AC
	hA0FmE0KLYH+dkjUHPySxAgK9L4n0fdsJGlF+M3wsWduc+DEVEJVH+d0VULyvUohZifu
	y4voBvVT0WUCCGgmLq9dQ+ZNQkW6dArTpHE/d01+hzKPzq7LxhWSMk1ezno+rsyZbs3X
	Peu69bhf8LcAGb7DXjBaYyE6TImu/JSQN9cj+4Ympa27QhALOcByVTlnvqPEVOJWMuOU
	4ZeKlV6kzn9L1dSjhvK67ngd3Jx2K3BxU6dTk/Ykg1hrwa9wBDQ+bVPwIQsgqKurQiUA
	J8xA==
X-Received: by 10.28.182.134 with SMTP id g128mr11440262wmf.95.1447871833015; 
	Wed, 18 Nov 2015 10:37:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i18sm4558367wmf.6.2015.11.18.10.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 10:37:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 19:37:19 +0100
Message-Id: <1447871842-30347-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3 3/6] tune-*: use mcpu instead of mtune for ARM tunes
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
X-List-Received-Date: Wed, 18 Nov 2015 18:37:14 -0000

* since:
  commit cffda9a821a3b83a8529d643c567859e091c6846
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Tue Sep 11 17:05:45 2012 +0000

      arch-arm: define different ARMPKGARCH when different CCARGS are used
  we don't need to worry about e.g. cortexa7 device upgrading
  binary package from armv7a feed which would be built with
  -mcpu=cortexa15, so we can use -mcpu instead of -mtune, because
  we won't share the binary feed with MACHINEs built with different
  tune.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
 meta/conf/machine/include/tune-arm920t.inc       | 2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa15.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
 meta/conf/machine/include/tune-cortexm1.inc      | 2 +-
 meta/conf/machine/include/tune-cortexm3.inc      | 2 +-
 meta/conf/machine/include/tune-cortexr4.inc      | 2 +-
 meta/conf/machine/include/tune-ep9312.inc        | 2 +-
 meta/conf/machine/include/tune-iwmmxt.inc        | 2 +-
 meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
 meta/conf/machine/include/tune-xscale.inc        | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index b750fe9..53994ef 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mtune=arm1136jf-s', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
 
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 5e6d4cb..c6e74b6 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mtune=arm920t', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index e554941..4f4d7dc 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mtune=arm926ej-s', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index ebac472..e9c2b8f 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mtune=arm9tdmi', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index b2d7ce5..7b3c5e6 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 5b8710b..4e5816f 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index c263dac..de37a9f 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mtune=cortex-a5', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index b97fa00..34df5ce 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 5621a6b..8a33c58 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mtune=cortex-a8', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 9f45667..6d49d21 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mtune=cortex-a9', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 794152a..8d882d4 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mtune=cortex-m1', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
 
 AVAILTUNES += "cortexm1"
 ARMPKGARCH_tune-cortexm1 = "cortexm1"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index bf7f89e..bf6efcd 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexm3"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mtune=cortex-m3', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
 
 TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index a04573c..fc4f1e5 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexr4"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mtune=cortex-r4', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
 
 TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 897b904..84ca528 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mtune=ep9312', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 15cce8d..f27423c 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mtune=iwmmxt', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 7b2fa8e..80cfb8a 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mtune=strongarm1100', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 2a0610f..0d07333 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mtune=xscale', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
-- 
2.6.3


