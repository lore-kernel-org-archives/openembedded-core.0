Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 10EC071A1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:36:52 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id f188so71885838pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wWtg29K7k8soUc6e077d8zKes9ODwMBDYOHk8Zk7aeo=;
	b=wQSP6TGsRC4VMshv813Ax5AbWidri1NXd5m1FhSukkwNOOjzfmZqyvkwDK+EtQOSiM
	Un2ru5+meXp3pqsdwApKFnSccyQPH4PaF+poBnpn381WVdZsfA3m4T4kqGkPZolDy018
	OJ7TfTRkGo0ZkcnRAH99rapRLVi9gv/0xiY61uIOqtBzq5ir6eJERccI/YorfLW+Ia9F
	/Xuhsf1MP+8Ytk1yfTPIXLVPmp5rrVfRziwsJxxf+FsAAfpNupJ42khAkyBFq8WIKLAG
	AkkI2miG2BoPRiEY/4CxuTsBM8ZLjeWU8UkIRwAxFtfLZ5cl3zHgxm1ysQaVDwrPsPV6
	66rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wWtg29K7k8soUc6e077d8zKes9ODwMBDYOHk8Zk7aeo=;
	b=ZHYlXSgqxsEAbURJ7XAIrD16JJGUMn01KMLp3VuHRr1GJnIXSKa8j6ignTAd49tinR
	moGOgOEl8BQcTB5RIBKtcw5jB4iEuVRc6sQljI25JwAxcEn3ReS2GlHxNtnZwVVLFwH1
	1B1BARdDdpKPXzfpX573w6a8qZoP6ZsbSSblyZV2yQehYYJHg1RR/F8tkK1Zpyc3iFPX
	6ONXl6uQxn8u3aJP9oW7kPk0A7dxohVv4FarVqOGIPodbkL7ZUTaefgCHsyMj1eNIzvZ
	F3QQe7ScHicObQ2xm2pbOiULf4kIFEmpM8aPvN5KDKu0AIlkECntvLNzjgtk8W/d5DDL
	PZbA==
X-Gm-Message-State: AKaTC01+UeCuKPxAHv9dVbzP7kW2aGbFffHCT9I8EuECKL4moT30W5B75+KWCkvP0cH2GA==
X-Received: by 10.84.209.143 with SMTP id y15mr64639867plh.180.1480444613349; 
	Tue, 29 Nov 2016 10:36:53 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	i124sm79047765pgd.15.2016.11.29.10.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 10:36:52 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 10:36:46 -0800
Message-Id: <1480444606-13574-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-cortexa*.inc: squash whitespace within TUNE_FEATURES strings
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
X-List-Received-Date: Tue, 29 Nov 2016 18:36:54 -0000

TUNE_FEATURES is include in BUILDCFG_VARS, so any whitespace is
visible to the user during the build process. Remove the extra
whitespace added during the 2.1 development cycle:

  http://git.openembedded.org/openembedded-core/commit/?id=f774b44fa007a2a756ada892ede832b1251d940c

For consistency, squash whitespace within PACKAGE_EXTRA_ARCHS strings
too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 32 ++++++++++++-------------
 meta/conf/machine/include/tune-cortexa17.inc | 32 ++++++++++++-------------
 meta/conf/machine/include/tune-cortexa5.inc  | 24 +++++++++----------
 meta/conf/machine/include/tune-cortexa7.inc  | 32 ++++++++++++-------------
 meta/conf/machine/include/tune-cortexa8.inc  | 24 +++++++++----------
 meta/conf/machine/include/tune-cortexa9.inc  | 36 ++++++++++++++--------------
 6 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index a33b27f..03de602 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -13,17 +13,17 @@ ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
 ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7ve}             cortexa15"
-TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7ve} cortexa15"
+TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7vet} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa15"
 TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa15-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa15-vfp cortexa15-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa15-vfp cortexa15-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
 
 # HF Tunes
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa15"
-TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa15"
 TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa15hf-vfp cortexa15hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa15hf-vfp cortexa15hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index d08b002..f659a62 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -13,17 +13,17 @@ ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
 ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
-TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7ve}             cortexa17"
-TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa17"
-TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa17"
-TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa17"
-TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7ve} cortexa17"
+TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7vet} cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa17"
 TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa17-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa17-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa17-vfp cortexa17t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa17-vfp cortexa17-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa17-vfp cortexa17-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
 
 # HF Tunes
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
 ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
-TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa17"
-TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa17"
-TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa17"
+TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa17"
 TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa17"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa17hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa17hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa17hf-vfp cortexa17t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa17hf-vfp cortexa17hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa17hf-vfp cortexa17hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index c7e5ab9..93f9ca4 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -11,13 +11,13 @@ ARMPKGARCH_tune-cortexa5             = "cortexa5"
 ARMPKGARCH_tune-cortexa5t            = "cortexa5"
 ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
 ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
-TUNE_FEATURES_tune-cortexa5             = "${TUNE_FEATURES_tune-armv7a}             cortexa5"
-TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-armv7at}            cortexa5"
-TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa5"
-TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa5"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa5-vfp"
+TUNE_FEATURES_tune-cortexa5             = "${TUNE_FEATURES_tune-armv7a} cortexa5"
+TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-armv7at} cortexa5"
+TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp cortexa5-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon cortexa5t2-vfp cortexa5t2-neon"
 
 # HF Tunes
@@ -26,11 +26,11 @@ ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
 ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
-TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa5"
-TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa5"
-TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa5"
-TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa5hf-vfp"
+TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa5"
+TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp cortexa5hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 10b6ea7..52e06b8 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -13,17 +13,17 @@ ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
 ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7ve}             cortexa7"
-TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7ve} cortexa7"
+TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7vet} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa7"
 TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa7-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa7-vfp cortexa7-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa7-vfp cortexa7-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
 
 # HF Tunes
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
 ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa7"
-TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7vehf} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7vethf} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa7"
 TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa7hf-vfp cortexa7hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa7hf-vfp cortexa7hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index c8ce021..a831bd5 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -11,13 +11,13 @@ ARMPKGARCH_tune-cortexa8             = "cortexa8"
 ARMPKGARCH_tune-cortexa8t            = "cortexa8"
 ARMPKGARCH_tune-cortexa8-neon        = "cortexa8"
 ARMPKGARCH_tune-cortexa8t-neon       = "cortexa8"
-TUNE_FEATURES_tune-cortexa8             = "${TUNE_FEATURES_tune-armv7a}             cortexa8"
-TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-armv7at}            cortexa8"
-TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa8"
-TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa8-vfp"
+TUNE_FEATURES_tune-cortexa8             = "${TUNE_FEATURES_tune-armv7a} cortexa8"
+TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-armv7at} cortexa8"
+TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp cortexa8-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-neon cortexa8t2-vfp cortexa8t2-neon"
 
 # HF Tunes
@@ -26,11 +26,11 @@ ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
 ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
-TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa8"
-TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa8"
-TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa8"
-TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa8hf-vfp"
+TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 3d8dc1d..8b84e60 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -11,13 +11,13 @@ ARMPKGARCH_tune-cortexa9             = "cortexa9"
 ARMPKGARCH_tune-cortexa9t            = "cortexa9"
 ARMPKGARCH_tune-cortexa9-neon        = "cortexa9"
 ARMPKGARCH_tune-cortexa9t-neon       = "cortexa9"
-TUNE_FEATURES_tune-cortexa9             = "${TUNE_FEATURES_tune-armv7a}             cortexa9"
-TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-armv7at}            cortexa9"
-TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa9"
-TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa9-vfp"
+TUNE_FEATURES_tune-cortexa9             = "${TUNE_FEATURES_tune-armv7a} cortexa9"
+TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-armv7at} cortexa9"
+TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp cortexa9-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-neon cortexa9t2-vfp cortexa9t2-neon"
 
 # HF Tunes
@@ -26,13 +26,13 @@ ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
 ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
-TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa9"
-TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa9"
-TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa9"
-TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa9hf-vfp"
+TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
 
 # VFPv3 Tunes
@@ -41,11 +41,11 @@ ARMPKGARCH_tune-cortexa9-vfpv3          = "cortexa9"
 ARMPKGARCH_tune-cortexa9t-vfpv3         = "cortexa9"
 ARMPKGARCH_tune-cortexa9hf-vfpv3        = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf-vfpv3       = "cortexa9"
-TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-armv7a-vfpv3}          cortexa9"
-TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-armv7at-vfpv3}         cortexa9"
-TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-armv7ahf-vfpv3}        cortexa9"
-TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-armv7athf-vfpv3}       cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
+TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-armv7a-vfpv3} cortexa9"
+TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-armv7at-vfpv3} cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-armv7ahf-vfpv3} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-armv7athf-vfpv3} cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa9-vfp cortexa9-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa9t2-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf-vfp cortexa9t2hf-vfpv3"
-- 
1.9.1


