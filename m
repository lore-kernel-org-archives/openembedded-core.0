Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SnQbe-0006MG-Rl
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 10:43:44 +0200
Received: by weyr6 with SMTP id r6so3443877wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jul 2012 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6OhBQzqjZqJVHG+/Q+GYgOCiBAVFUkNw6+ATrYABC9U=;
	b=J1Bg3a7ShyZwcDNmfa1wTURbLSxeAmG8BZeCHKiM3/ZEqRNicpZPpieRQlRcqyrVet
	EXPBVYsfMb6pyfMeKJP60Skr4t8uEppBTQ3E28r3pzvdYt7X8OY59adEYghoQSh2JEmw
	1yqy1pY4H3HOqTKWhak08f3QJvl430TBSXXJJ0q7/JtLcyT7umd4hsP0U9G1XD0Q9Tzj
	1dvs5gg/IhKuIAzDbrHzxW+mgQ5/MHpQ0MhXmIbEnwtV6Cqgkou2h66Wed0xeNTifZJq
	dBJQD28dvlHFMsMinqabDoHE9QdYWxRXTfYkG0NvCdSAYXdqHOsH1kTmPLaN7V2oYfOq
	swiA==
Received: by 10.180.107.70 with SMTP id ha6mr13729556wib.16.1341649924179;
	Sat, 07 Jul 2012 01:32:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm10282169wiz.1.2012.07.07.01.32.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Jul 2012 01:32:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Jul 2012 10:31:54 +0200
Message-Id: <1341649914-18419-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120616065104.GA3140@jama.jama.net>
References: <20120616065104.GA3140@jama.jama.net>
Subject: [PATCH] conf/machine: replace TUNE_CONFLICTS with TUNECONFLICTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2012 08:43:48 -0000

* it wasn't consistent with other machine configs
* reported 2 months ago..
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022154.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv5.inc       |    2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |    2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    2 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 4a75530..98780e5 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5"
 ARMPKGARCH ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
-TUNE_CONFLICTS[armv5] = "armv4"
+TUNECONFLICTS[armv5] = "armv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
 
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index da8274e..f0fee93 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
 ARMPKGARCH ?= "armv6"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
-TUNE_CONFLICTS[armv6] = "armv4 armv5"
+TUNECONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index c90aff5..f439de7 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
 ARMPKGARCH ?= "armv7a"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
-TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
+TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
 
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index a5e9755..f9e2b2a 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "powerpc64"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[m64] = "Power ELF64 standard ABI"
-TUNE_CONFLICTS[m64] = "m32 nf"
+TUNECONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
 
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 93ed5ee..03cd411 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "mips32"
 require conf/machine/include/mips/arch-mips.inc
 
 TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
-TUNE_CONFLICTS[mips32] = "n64 n32"
+TUNECONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
 AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
-- 
1.7.8.6



