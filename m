Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9B26E268
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Mar 2016 00:07:42 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id z8so18232898ige.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Mar 2016 16:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=jmWTE3OWs/kdPtkxC8Mve5TApcW5V5Zfultr4qtxH94=;
	b=Jk8utxwax6BcAIrOe5/jhC+n+FpJL/y+6HoElKrxKHGY13hoaitmp4mLINIq/MV5V0
	hmxe3xBJwPvArjyIuii90RAEWWATv+61BJVJlyHWd7dEQzJWvF6dWJyUKWSf1B9Cmbik
	fZdQyqQTm+y0xbq67Aexi3RWzqIOtu+OTrJI8PV07EJ4pYtA/OJi94QyhIUlsbKTaQGN
	z0SHCk6704XJxtOCaIE7JBJYSDAoUpPECkdKxAfJM+z2ebtUVhDzf1VEnGZ65pOe8mwe
	po+aZnjdx+5zv/1KfYc2oHt8y+quhKr2LjfAxFUjIgYa2i4sj8LtK3q1HiMRu+nkbcZ9
	h2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jmWTE3OWs/kdPtkxC8Mve5TApcW5V5Zfultr4qtxH94=;
	b=IJX2k7Z2hz5UFx02iz10EIgkOXxqd1pGOD/+iisiXhjKdfIbJn1EgJn+kd8XDzWXxg
	JSbsN5VmKhmOyU67vcPmdB40JnGW8M4WGVUFd++q4PGrF7GhF03LrkQ4e4HuH8len8oi
	lDuoXgt0RJQWo0cCFPhG0qwMjqSnpzx3D5KbiovPbeJRWCkFVSxCD6Jp3KyaDEQW2e05
	r1FAFK3+qIzQFFBS+/7GarDk6d8UyvNIx9pf27tFus44IasbnRMtckU0WFMRbEHnIkQv
	QrRs8tujUgqW6WS9DWE6mIQUawobJNGET7EAUlhvsZVXbcmDCwhZW5ipzwnmbS4z0NZO
	HHLA==
X-Gm-Message-State: AD7BkJJyb42JB8Zw2OqT+e+4TTA2Xw7EAI2LKPcShbQqDJwW3OAtXNgT638EUCYX8WfkJw==
X-Received: by 10.51.17.4 with SMTP id ga4mr5652542igd.88.1457222862809;
	Sat, 05 Mar 2016 16:07:42 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	s67sm4030942ios.35.2016.03.05.16.07.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Mar 2016 16:07:42 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 19:07:35 -0500
Message-Id: <1457222855-3097-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH] tune-cortexa17.inc: apply changes similar to a15
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
X-List-Received-Date: Sun, 06 Mar 2016 00:07:42 -0000

Apply the same sort of changes to the Cortex-A17 tune as were done in commit
35392025f3236f5e5393f9cf0857732da9a2e503.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/machine/include/tune-cortexa17.inc | 52 ++++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index ad92e0d..d08b002 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -1,6 +1,6 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7ve-neon"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
@@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
 ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
-TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7a}             cortexa17"
-TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7at}            cortexa17"
-TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa17"
-TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa17"
-TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa17"
-TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa17-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7ve}             cortexa17"
+TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa17-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa17-vfp cortexa17t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa17-vfp cortexa17-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon cortexa17hf-neon-vfpv4 cortexa17thf-neon-vfpv4"
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
 ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
-TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa17"
-TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa17"
-TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa17"
-TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa17"
+TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa17hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa17hf-vfp cortexa17t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa17hf-vfp cortexa17hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
-- 
2.7.0.rc3


