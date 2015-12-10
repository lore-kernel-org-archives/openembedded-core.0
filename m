Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E1E1A731B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:34 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25432257wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Sxt699kLFoRTpdTqkNJ5jpAsjB5IKX3ejVDuCajZprA=;
	b=qujt0NfkA6so55sMjnjEOEsK1C47XrNCThBMDCX7hFXOFUbr3Vxi47BKzM/6n6OpXa
	5SGGnNW4plb/fNnVp06CIQeAQoxqhRI8YXZYlnbL13GvnSvrlzoBMfAC4imgeWQcpB/E
	nRoW7KZL3sV9Zsoso2eDavQSq5TSxnWQQs2MdQBpguzsdN1I3Epsw0Q58aNphns1sOUW
	U//Q+XnRxyfI+e834ByJ6EzQjDGt5pU0wa2kJngxYtdPGg9gYyR10ecvOC4DrvnXQqOR
	WPaCLfchi2U2JlyagAEpwwl5aPmzphz51vKPNmgrx++yChfGcGQdsKHyMP5Z19hfVoIj
	hfIw==
X-Received: by 10.194.109.2 with SMTP id ho2mr14624942wjb.40.1449755253572;
	Thu, 10 Dec 2015 05:47:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t5sm12918941wmt.1.2015.12.10.05.47.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:52 +0100
Message-Id: <0e85413070df815895a5470b67cafeeb3b4bc73a.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 15/15] tune-*: use mcpu instead of mtune for ARM tunes
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:35 -0000

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
index cfc8151..a33b27f 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7ve-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 9668e95..ad92e0d 100644
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
index 0d82854..c7e5ab9 100644
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
index 84432bd..10b6ea7 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7ve-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 1daaf83..c8ce021 100644
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
index 29e6651..965f2d9 100644
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
index 177d2d5..7349b0f 100644
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


