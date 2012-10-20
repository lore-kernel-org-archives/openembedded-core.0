Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aristovmax@gmail.com>) id 1TPPSS-0004DG-M3
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 05:10:40 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so616221lam.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 19:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3lWw0wwXim6/ea9dKhE2kCrS+wVR4yzdpEatIH/TUJY=;
	b=Zi+VBXv7vjVXeE8oDpCX5oTIYKOi2rGKs/TDy2HiY0+KPWcR+hnO6uBUh54QrWzHH6
	OQKlEYZMMF+eENgwZXOz6p9DkzR5iQdlUglCvHZC9E/5qQrQDLCZxzg1KxZy2hFXMxlo
	NnKucL+UzionVNR7U4+RRKsYRAjAN5nVB+HblJdwad1Mak3oxZEWQyOsSBCB/PkwYBny
	ThE1vnWi2JfKMe2p90wPTJQJSujjCKTGxD5H0yHkOrdxJY6XxQVFYo0EFaUrDqWLCm/K
	2MIWs+dwn1fGte4jP0OnAfD2wwpUVFqqObMoo39LQP88AvrkPFLtDK9deKCk9iXltKYT
	cLNw==
Received: by 10.112.44.198 with SMTP id g6mr1214245lbm.66.1350701838971;
	Fri, 19 Oct 2012 19:57:18 -0700 (PDT)
Received: from nvcom.kaf36 ([80.250.160.31])
	by mx.google.com with ESMTPS id e4sm1063649lby.12.2012.10.19.19.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 19:57:18 -0700 (PDT)
From: Aristov Maxim <aristovmax@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2012 06:57:07 +0400
Message-Id: <1350701827-10385-1-git-send-email-m@ximilian.ru>
X-Mailer: git-send-email 1.7.10.4
Cc: Aristov Maxim <m@ximilian.ru>
Subject: [PATCH] uClibc: Resolve conflicting options when building for mips32
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
X-List-Received-Date: Sat, 20 Oct 2012 03:10:40 -0000

Signed-off-by: Aristov Maxim <m@ximilian.ru>
---
 .../uclibc/uclibc-0.9.33/mips/uClibc.machine           |   16 ----------------
 .../recipes-core/uclibc/uclibc-git/mips/uClibc.machine |   16 ----------------
 meta/recipes-core/uclibc/uclibc.inc                    |   10 ++++++++++
 3 files changed, 10 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
deleted file mode 100644
index 7d7ab3f..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
+++ /dev/null
@@ -1,16 +0,0 @@
-# in OE we use TARGET_CC_ARCH="-march=mips32" but by
-# default uclibc uses mips1 ISA for o32 ABI which ends
-# up with conflicting march options to gcc. Here we
-# ask for MIPS32 ISA to match the OE defaults
-
-CONFIG_MIPS_ISA_MIPS32=y
-
-# Below options are exact copy of general
-# uClibc.machine file
-#
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
deleted file mode 100644
index 7d7ab3f..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
+++ /dev/null
@@ -1,16 +0,0 @@
-# in OE we use TARGET_CC_ARCH="-march=mips32" but by
-# default uclibc uses mips1 ISA for o32 ABI which ends
-# up with conflicting march options to gcc. Here we
-# ask for MIPS32 ISA to match the OE defaults
-
-CONFIG_MIPS_ISA_MIPS32=y
-
-# Below options are exact copy of general
-# uClibc.machine file
-#
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 6c98090..707b14e 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -85,6 +85,15 @@ OE_DEL      := "${@features_to_uclibc_del(d)}"
 python () {
     if "${OE_DEL}":
         d.setVar('configmangle_append', "${OE_DEL}" + "\n")
+
+    # by default uclibc uses mips1 ISA for o32 ABI
+    # if we use TARGET_CC_ARCH="-march=mips32" we end up 
+    # with conflicting march options to gcc. Here we
+    # ask for MIPS32 ISA to match the chosen arch
+
+    if "mips32" in d.getVar("TUNE_FEATURES",True):
+        d.setVar('configmangle_append',
+                 "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_MIPS32=y\n\n")
     if "${OE_FEATURES}":
         d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
@@ -133,6 +142,7 @@ do_configure() {
         echo "### FPU" >>${S}/merged.config
         echo "### ABI" >>${S}/merged.config
         echo "### DISTRO FEATURES" >>${S}/merged.config
+        echo "### MIPS32_CHECK" >>${S}/merged.config
 
         # Mangle the resulting .config depending on OE variables
         sed -i -e '${configmangle}' ${S}/merged.config
-- 
1.7.10.4



