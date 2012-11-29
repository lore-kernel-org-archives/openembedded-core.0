Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDVd-0006N9-KR
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so8324614eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tRHx0QkgHSilaCc94hoMrtEbJwhT4xQLPi3EWsA+V4M=;
	b=d/DGdDuFMy4aX+tDiV6/x9GZyZoK0ib5LaYGcNOTcu9rmk3mDC1sQ4PBI0rvbGP6v+
	Ow0vpSYM5eugzxS0qGOLRkvMBD+0Kl1nxXkH/7HWORhyAOOcviZvFU8znV60uXkJ/TWV
	OQO7lD8TlTXEPJwHh33piy3SqRGXpgxfRdujfjXYZgLk0X46DO/TJmdIvZgqb8EuaObk
	mFSsv4e7UYMj1OOJKrgnOnBRdSxPQUNEAA1LcMvdmDMug1sJBHSVe2Jc0OLgmJnKcZdD
	3EEBZZKjLcv5jicoWHF7QYURruYEJ+DRv/VjOh96vlmsVLbGCjE8l8ptPRqvmQ7uNSDi
	I9vQ==
Received: by 10.14.225.72 with SMTP id y48mr83450243eep.46.1354230773458;
	Thu, 29 Nov 2012 15:12:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm6714083eeo.7.2012.11.29.15.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:12:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:32 +0100
Message-Id: <31ed02291c5775ab72bf7eea4a62c6666015a01a.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/8] tune-cortexa*, tune-xscale: fix ARMPKGARCH
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
X-List-Received-Date: Thu, 29 Nov 2012 23:27:15 -0000

* hf/t/neon/b suffix is added by other ARMPKGSFX* variables, should not be
  part of ARMPKGARCH, otherwise resulting TUNE_PKGARCH have that suffix twice,
  e.g. cortexa8hf-neonhf-neon

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexa8.inc | 10 +++++-----
 meta/conf/machine/include/tune-cortexa9.inc | 10 +++++-----
 meta/conf/machine/include/tune-xscale.inc   |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 89878d4..481bbae 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -8,8 +8,8 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
 ARMPKGARCH_tune-cortexa8 = "cortexa8"
-ARMPKGARCH_tune-cortexa8t = "cortexa8t"
-ARMPKGARCH_tune-cortexa8-neon = "cortexa8-neon"
+ARMPKGARCH_tune-cortexa8t = "cortexa8"
+ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
@@ -19,9 +19,9 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon
 
 # VFP Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
-ARMPKGARCH_tune-cortexa8hf = "cortexa8hf"
-ARMPKGARCH_tune-cortexa8thf = "cortexa8thf"
-ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8hf-neon"
+ARMPKGARCH_tune-cortexa8hf = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf = "cortexa8"
+ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
 TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
 TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
 TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index addfdad..739e5ae 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -8,8 +8,8 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon"
 ARMPKGARCH_tune-cortexa9 = "cortexa9"
-ARMPKGARCH_tune-cortexa9t = "cortexa9t"
-ARMPKGARCH_tune-cortexa9-neon = "cortexa9-neon"
+ARMPKGARCH_tune-cortexa9t = "cortexa9"
+ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
 TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
 TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
@@ -19,9 +19,9 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon
 
 # VFP Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon"
-ARMPKGARCH_tune-cortexa9hf = "cortexa9hf"
-ARMPKGARCH_tune-cortexa9thf = "cortexa9thf"
-ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9hf-neon"
+ARMPKGARCH_tune-cortexa9hf = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
 TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
 TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
 TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index a48c2d9..baa4291 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -11,7 +11,7 @@ TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
 PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
 
 AVAILTUNES += "xscale-be"
-ARMPKGARCH_tune-xscale-be = "xscale-be"
+ARMPKGARCH_tune-xscale-be = "xscale"
 TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
 PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
-- 
1.8.0



