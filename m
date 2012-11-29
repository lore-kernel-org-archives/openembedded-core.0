Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDVj-0006N5-10
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:22 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5816566eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PPnTWc2yVZyqXLWGzW/DAyjMYOnhXhG7PJRjh6ZFjW8=;
	b=OP0d6vZuMx0llrj+tj/MVSy1N43pxAGqNaVM+vLjTHDxwA46eldaG8PFNhH7nWEZLi
	Q9tej+wT/tDLFrFGLSD4iyu10uCjCwvmcRES98BNyimoxZDRlszIF9d+ikl9pLfzaC4f
	FNr5ntMYa/W+k0XzvKa4EJ3mXGIhrn1wj2kW5ztcxhN93mndJBA7uGOvUt6Jb3Tf5k6Q
	Uo8UQn7kSMm2qG34trgjzqEnyPoPsGI8xlyO1SK5w3Hurs4XquoMlFdVdMbj1gTdS/+y
	c+7ztTGEe8gR8LJHS7r+8GsSH4sKwYDHJ4FJ7edKQuS4y+/K4uNIsyj4Kxj2HfqamBFP
	+SRg==
Received: by 10.14.176.66 with SMTP id a42mr14796534eem.34.1354230781013;
	Thu, 29 Nov 2012 15:13:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm6694255eel.14.2012.11.29.15.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:33 +0100
Message-Id: <e49fecdf22b26fddbd30a5bf23ef729a3e5f792e.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] tune-*: add PACKAGE_EXTRA_ARCHS entries starting with specific ARMPKGARCH
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
X-List-Received-Date: Thu, 29 Nov 2012 23:27:30 -0000

* e.g. arm926ejs DEFAULT tune is compatible with all PACKAGE_EXTRA_ARCHS_tune-armv5te, but needs to list arm926ejs with all possible suffixes too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc   |  2 +-
 meta/conf/machine/include/tune-arm920t.inc       |  3 +--
 meta/conf/machine/include/tune-arm926ejs.inc     |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      |  3 +--
 meta/conf/machine/include/tune-cortexa8.inc      | 12 ++++++------
 meta/conf/machine/include/tune-cortexa9.inc      | 12 ++++++------
 meta/conf/machine/include/tune-cortexm1.inc      |  3 +--
 meta/conf/machine/include/tune-cortexm3.inc      |  1 -
 meta/conf/machine/include/tune-ep9312.inc        |  1 +
 meta/conf/machine/include/tune-iwmmxt.inc        |  2 +-
 meta/conf/machine/include/tune-strongarm1100.inc |  4 +---
 meta/conf/machine/include/tune-xscale.inc        |  4 ++--
 12 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index adece48..63aca06 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", "-mtune=arm1
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
 TUNE_FEATURES_tune-arm1136jfs = "${TUNE_FEATURES_tune-armv6} arm1136jfs"
-PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6}"
+PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6} arm1136jfs-vfp"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 3240fa8..f72f184 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -8,5 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm920t", "-mtune=arm920t
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
 TUNE_FEATURES_tune-arm920t = "${TUNE_FEATURES_tune-armv4t} arm920t"
-PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
-
+PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm920tt"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 301a3c2..009d378 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm92
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index a981a65..ee79b52 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -8,5 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", "-mtune=arm9td
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
 TUNE_FEATURES_tune-arm9tdmi = "${TUNE_FEATURES_tune-armv4t} arm9tdmi"
-PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
-
+PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm9tdmit"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 481bbae..bfc58a1 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -13,9 +13,9 @@ ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
 
 # VFP Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
@@ -25,6 +25,6 @@ ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
 TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
 TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 739e5ae..f56b088 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -13,9 +13,9 @@ ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
 TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
 TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
 
 # VFP Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon"
@@ -25,6 +25,6 @@ ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
 TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
 TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index c4c658b..e7e18e2 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -8,5 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex
 AVAILTUNES += "cortexm1"
 ARMPKGARCH_tune-cortexm1 = "cortexm1"
 TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} cortexm1"
-PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-
+PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexm1-vfp"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 72acdb5..a5f0b55 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -12,4 +12,3 @@ AVAILTUNES += "cortexm3"
 ARMPKGARCH_tune-cortexm3 = "armv7m"
 TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
 PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
-
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 09db6b4..fbf6939 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -7,5 +7,6 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ep9312", "-march=ep9312 -
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
+# this tune does not include TUNE_FEATURES_tune-armv4t, so there is no armv4 TUNE_FEATURES => no 't' in ARMPKGSFX_THUMB
 TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
 PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 113d89f..f1671ed 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -11,4 +11,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", "-march=iwmmxt -
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
 TUNE_FEATURES_tune-iwmmxt = "thumb iwmmxt"
-PACKAGE_EXTRA_ARCHS_tune-iwmmxt = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} iwmmxt"
+PACKAGE_EXTRA_ARCHS_tune-iwmmxt = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} iwmmxt iwmmxtt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index fba0a1b..a4be117 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -8,6 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=stron
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
 TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
-PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4}"
-
-
+PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4} strongarm"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index baa4291..b21bafb 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -8,12 +8,12 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale",
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
 TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
-PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
+PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} xscale xscalet xscalee xscalete"
 
 AVAILTUNES += "xscale-be"
 ARMPKGARCH_tune-xscale-be = "xscale"
 TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
-PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
+PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} xscaleb xscaletb xscaleeb xscaleteb"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-- 
1.8.0



