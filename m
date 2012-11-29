Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDVx-0006N9-Kq
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:30 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so8324614eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5QFE8vrkU4/Z75vdoB6++Wxz/oZCr8SUSnVRnetekLk=;
	b=MY6d7L+S8cODh6jxKvQV29HSyLqhDbg+MS03HBckbZjXPdvOc03n7Sch+0W0geEFhL
	BF9pXnd4/CMnNPlT+Gx+Kbdu97i/yI/ZFoCFro3pjIPwtjgsGu3q2fZa05XzfhXxE7Qb
	USgfY7yP3jHW0WeHqOt+o7PIVYyBiLVWgkifP1fGuqgJGArO+0IEoegJWVJaioXYkcrf
	Bpu0LFnxakebWzQG+WVlywLO10Mj2GGjItI9mlo28IP19+fun5MBseBO46tsuvxEqMfv
	VJqnKtM32XRaxvc2hCgAhdGRRYLeZibEknAnVuVtKllaYjHFVH/I87aIapc5tDiYJ5h4
	NszA==
Received: by 10.14.205.65 with SMTP id i41mr87702073eeo.2.1354230795653;
	Thu, 29 Nov 2012 15:13:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm6712020eeo.8.2012.11.29.15.13.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:35 +0100
Message-Id: <9a18520ed5195be6f2f67f175026c71afc70f01e.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] arch-armv[457]*: fix PACKAGE_EXTRA_ARCHS for bigendian TUNEs
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
X-List-Received-Date: Thu, 29 Nov 2012 23:27:33 -0000

* bigendian should not include little endian PACKAGE_ARCHS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc  |  3 +--
 meta/conf/machine/include/arm/arch-armv5.inc  | 10 ++++------
 meta/conf/machine/include/arm/arch-armv7a.inc |  8 ++++----
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 07e8eec..f3c3391 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -24,5 +24,4 @@ ARMPKGARCH_tune-armv4tb ?= "armv4"
 TUNE_FEATURES_tune-armv4b ?= "${TUNE_FEATURES_tune-armv4} bigendian"
 TUNE_FEATURES_tune-armv4tb ?= "${TUNE_FEATURES_tune-armv4t} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv4b = "armeb armv4b"
-PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4tb"
-
+PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv4tb"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index c6d4fc1..0bcc1f0 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -41,8 +41,8 @@ ARMPKGARCH_tune-armv5b ?= "armv5"
 ARMPKGARCH_tune-armv5tb ?= "armv5"
 TUNE_FEATURES_tune-armv5b ?= "${TUNE_FEATURES_tune-armv5} bigendian"
 TUNE_FEATURES_tune-armv5tb ?= "${TUNE_FEATURES_tune-armv5t} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5b"
-PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5b armv5tb"
+PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv5b"
+PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4tb} armv5b armv5tb"
 
 # Big Endian + VFP/DSP
 AVAILTUNES += "armv5b-vfp armv5tb-vfp armv5hfb-vfp armv5thfb-vfp"
@@ -54,9 +54,7 @@ TUNE_FEATURES_tune-armv5b-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
 TUNE_FEATURES_tune-armv5tb-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
 TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5b-vfp} callconvention-hard"
 TUNE_FEATURES_tune-armv5thfb-vfp ?= "${TUNE_FEATURES_tune-armv5tb-vfp} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5b-vfp armv5tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp = "armv5hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp = "armv5hfb-vfp armv5thfb-vfp"
-
-
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index d4a1d02..827b426 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -48,10 +48,10 @@ TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
 TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
 TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7ab-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ab-vfp armv7at2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon armv7at2b-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv7ab-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + VFP
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
-- 
1.8.0



