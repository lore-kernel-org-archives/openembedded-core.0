Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 10EF56FF04
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 06:31:20 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id y8so25640920igp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 22:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=jmWTE3OWs/kdPtkxC8Mve5TApcW5V5Zfultr4qtxH94=;
	b=ov5/mWt2pPnx1amEy5hHedgzjx4HIU7q00jLqZbIA+AcavCDkdJh8PQXHzkx5QBE45
	0ZJy6TtquA+n7DVJY/zHq2m0rRPRkJlCqii1PEXTFC1c4ufJAWKOi6LhKS3n6offkrQc
	ttdJwiAOCksy86zAo42et9RynThItomrQiDmlDxcePtvqpym5mhcIXfMNu61QmmoXkST
	wReLazu2NdXSqYRwUf3TJGmXEL9ihFTT7N4gYVp0rDZk02bU7GtCrjCdeulXbZt53qiD
	b+9PBhxut+NnATT3lEdBnmJ1BkaBM+H0OTXDaQ5ycuqVoyiNoHh5osev8PdOP7yEw71R
	W0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jmWTE3OWs/kdPtkxC8Mve5TApcW5V5Zfultr4qtxH94=;
	b=QlByMcez+q9h6BIzaSbvc/VNVmHKumjK1FW6/yaO2M/66GaFdG98FvFsgVTfP+rm33
	8jBLlZU8ug6gdxKCprQO12AIMiMl+A5mJ9zt8nv/YsEx8SPxrd3ktFRign30hCKkOpob
	HzXXahVQZuNulC29Sg6OSjMtI2LfqXx6z0btStFozXTTT6exxMbcWajo+sNGkyjbGgSM
	NDSasz3EjUaFtomLTj/cMrrqZaC6gTpYF3SnXwY2iPD2rJVNvW8CvkIVmsQF9CWfEsSW
	OhN2zBYkjtVKVo8PSo+AvNoXerHFehQCWEUEtjIujLa+boizQdWoRoK7l7WO6jjjZo5D
	6uaQ==
X-Gm-Message-State: AD7BkJLT8qO/YlryslE9xJD4KqdLysW+usvqz2WRsALZvWCrwyhzjxZsOUEMhRb/j1Csog==
X-Received: by 10.50.17.71 with SMTP id m7mr2391767igd.29.1457159481108;
	Fri, 04 Mar 2016 22:31:21 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	z18sm1064580igp.20.2016.03.04.22.31.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2016 22:31:20 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 01:31:07 -0500
Message-Id: <1457159467-14868-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [meta-oe][PATCH] tune-cortexa17.inc: apply changes similar to a15
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
X-List-Received-Date: Sat, 05 Mar 2016 06:31:21 -0000

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


