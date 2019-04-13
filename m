Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFF96C487
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 06:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44h4NS44fdzPV
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 08:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555136360;
	bh=dvNH5m/9iOBiiBCCu32ziwzTQ2OSfnIfO7ZSGSM+dEM=;
	h=From:To:Subject:Date:From;
	b=pOgvC91kxvxQ8DesBLntlhoUQIZwm/mcApeTp5U+f3Ecm9+2yIN46hoB0xwPaay8Y
	qA263wkMjOodpa/9IpB7Fm6pn8yD8NO34PqAO3RI02z+nmQHIHkvsBTB5JJKbsaSs7
	r9ucaYyEpXj0P3lIpTAAtld6Fa5dEQpEzDC723oy6pwqN8nyxrs7y9xPrxvqK86OqR
	8hEVplno+GU7tVQRvmSe0j4Y2cHogv9qSAi14gQdFIFaU1irzY0WVmp8ibrj57VC29
	22lxeIH6O7Mo0W/mS0IE8yN6a/6nHMxcTcv9o748ipj9oaW29CBcj6MkDCEcjJzu1H
	jdKpEo1JvZcUgapLPYgiXVCQ8U8OcziLn/3EvF5QAX5gHP0PmPwvNcDZEoC2kyL18t
	TqCGSJzLS2rphNOjYzaSFulqsO1241StXhG4TLoWUbrANlRFGssJdPEgpl2TkKgy3n
	yqa1CVhaMr0taTx7Q9dXSpDLF4FO+iZ/m+yOeaA1ZQbGCumkveNA1drl7RSbvwxzlz
	VxqLH1Sc3G+CYBbHKu7k+7lBb/D1AugRFahbuEqeMLdefub4FF15kkCtb68nVLY9HS
	pwccfSlDWScbU/PP9A3NnghsCGxNyD1pZsmoZ0hphywSrfVV0VQRCxamlRximyXOfm
	fe4HI0G1iR4YayYvt6V7Wmtk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 09:19:19 +0300
Message-Id: <20190413061919.14855-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gcc: Remove Java support variables
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
X-List-Received-Date: Sat, 13 Apr 2019 06:19:20 -0000

Java support was removed in upstream gcc 7.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              | 1 -
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index f7bf257fa6..88a9df2049 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -82,7 +82,6 @@ B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
-JAVA = ""
 
 LTO = "--enable-lto"
 SSP ?= "--disable-libssp"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 375c5e90c9..b6f2ca541d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -5,15 +5,9 @@ require gcc-shared-source.inc
 #
 # These can be overridden by the version specific .inc file.
 
-# Java (gcj doesn't work on all architectures)
-JAVA ?= ",java"
-JAVA_arm ?= ""
-JAVA_armeb ?= ""
-JAVA_mipsel ?= ""
-JAVA_sh3 ?= ""
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
-LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
+LANGUAGES ?= "c,c++${FORTRAN}"
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
-- 
2.17.1


