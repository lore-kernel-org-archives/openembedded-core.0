Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1840773184
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:19 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id w144so24579634wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Rv/bhXkehna2AZ8bFFabrDYrzMWq2YEXQVEmNEngZPw=;
	b=rqibeKSnlx1S3E379QqngungeHYiqAavCxYmGiqfQT0iylvyZ4xkIrYi236PeeLiDB
	qovE1GxBtNAR5umDE0C4RzRrlUKAX5dWb8VkY5prHGnP7Ruf2gyeUEzR5KYNfs5GsvyQ
	7/akNODhhxLZoKS+BtpN85PXoi6d8umNj2nIO2E5C/LffK/masBswXMFIY0fASy+JX5d
	43kUt4jLNVFQ+G8b9oyVNSCzZGcOv9HUUiqLYHjpv5Ic3sFb0HO3B42Pd9kxYZmiVA+I
	A3ws4ywmfLCU0uROXX/6VOgxtihOX0261Gn2CIB6LqECtBlfTNCKFZ1BfII2LoMtFtPW
	FaSA==
X-Received: by 10.28.21.204 with SMTP id 195mr17534645wmv.17.1449755240396;
	Thu, 10 Dec 2015 05:47:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v4sm12505995wjx.18.2015.12.10.05.47.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:43 +0100
Message-Id: <919c5be0d5d35298e6de5c81f93a60b8ab3153b5.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 06/15] arm/arch-arm*, tune-cortexa*, tune-thunderx.inc, powerpac/arch-powerpc64.inc: Use normal assignment
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:20 -0000

* some tunes were using weak assignment for TUNE_FEATURES, unify
  all tunes to use normal assignment so it behaves consistently
---
 meta/conf/machine/include/arm/arch-arm64.inc       |  4 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |  8 +--
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   | 24 ++++----
 meta/conf/machine/include/arm/arch-armv5.inc       | 24 ++++----
 meta/conf/machine/include/arm/arch-armv6.inc       | 24 ++++----
 meta/conf/machine/include/arm/arch-armv7a.inc      | 68 +++++++++++-----------
 .../machine/include/powerpc/arch-powerpc64.inc     |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  8 +--
 meta/conf/machine/include/tune-cortexa17.inc       |  8 +--
 meta/conf/machine/include/tune-cortexa5.inc        |  8 +--
 meta/conf/machine/include/tune-cortexa7.inc        | 12 ++--
 meta/conf/machine/include/tune-cortexa8.inc        |  8 +--
 meta/conf/machine/include/tune-cortexa9.inc        |  8 +--
 meta/conf/machine/include/tune-thunderx.inc        |  4 +-
 14 files changed, 105 insertions(+), 105 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 866b71f..e098e7a 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -10,8 +10,8 @@ MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64'
 AVAILTUNES += "aarch64 aarch64_be"
 ARMPKGARCH_tune-aarch64 ?= "aarch64"
 ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
-TUNE_FEATURES_tune-aarch64 ?= "aarch64"
-TUNE_FEATURES_tune-aarch64_be ?= "${TUNE_FEATURES_tune-aarch64} bigendian"
+TUNE_FEATURES_tune-aarch64 = "aarch64"
+TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
 BASE_LIB_tune-aarch64 = "lib64"
 BASE_LIB_tune-aarch64_be = "lib64"
 
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 07e005d..ea56cca 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -19,8 +19,8 @@ require conf/machine/include/arm/feature-arm-thumb.inc
 AVAILTUNES += "armv4 armv4t"
 ARMPKGARCH_tune-armv4 ?= "armv4"
 ARMPKGARCH_tune-armv4t ?= "armv4"
-TUNE_FEATURES_tune-armv4 ?= "arm armv4"
-TUNE_FEATURES_tune-armv4t ?= "${TUNE_FEATURES_tune-armv4} thumb"
+TUNE_FEATURES_tune-armv4 = "arm armv4"
+TUNE_FEATURES_tune-armv4t = "${TUNE_FEATURES_tune-armv4} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
 PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
 
@@ -28,7 +28,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
 AVAILTUNES += "armv4b armv4tb"
 ARMPKGARCH_tune-armv4b ?= "armv4"
 ARMPKGARCH_tune-armv4tb ?= "armv4"
-TUNE_FEATURES_tune-armv4b ?= "${TUNE_FEATURES_tune-armv4} bigendian"
-TUNE_FEATURES_tune-armv4tb ?= "${TUNE_FEATURES_tune-armv4t} bigendian"
+TUNE_FEATURES_tune-armv4b = "${TUNE_FEATURES_tune-armv4} bigendian"
+TUNE_FEATURES_tune-armv4tb = "${TUNE_FEATURES_tune-armv4t} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv4b = "armeb armv4b"
 PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv4tb"
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index d132d92..632b88d 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -7,8 +7,8 @@ require conf/machine/include/arm/arch-armv5.inc
 AVAILTUNES += "armv5e armv5te"
 ARMPKGARCH_tune-armv5e ?= "armv5"
 ARMPKGARCH_tune-armv5te ?= "armv5"
-TUNE_FEATURES_tune-armv5e ?= "${TUNE_FEATURES_tune-armv5} dsp"
-TUNE_FEATURES_tune-armv5te ?= "${TUNE_FEATURES_tune-armv5t} dsp"
+TUNE_FEATURES_tune-armv5e = "${TUNE_FEATURES_tune-armv5} dsp"
+TUNE_FEATURES_tune-armv5te = "${TUNE_FEATURES_tune-armv5t} dsp"
 PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
 PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
 
@@ -18,10 +18,10 @@ ARMPKGARCH_tune-armv5e-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5te-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5ehf-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5tehf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5e-vfp ?= "${TUNE_FEATURES_tune-armv5e} vfp"
-TUNE_FEATURES_tune-armv5te-vfp ?= "${TUNE_FEATURES_tune-armv5te} vfp"
-TUNE_FEATURES_tune-armv5ehf-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
-TUNE_FEATURES_tune-armv5tehf-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5e-vfp = "${TUNE_FEATURES_tune-armv5e} vfp"
+TUNE_FEATURES_tune-armv5te-vfp = "${TUNE_FEATURES_tune-armv5te} vfp"
+TUNE_FEATURES_tune-armv5ehf-vfp = "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5tehf-vfp = "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5e armv5te armv5e-vfp armv5te-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv5ehf-vfp"
@@ -31,8 +31,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vf
 AVAILTUNES += "armv5eb armv5teb"
 ARMPKGARCH_tune-armv5eb ?= "armv5"
 ARMPKGARCH_tune-armv5teb ?= "armv5"
-TUNE_FEATURES_tune-armv5eb ?= "${TUNE_FEATURES_tune-armv5e} bigendian"
-TUNE_FEATURES_tune-armv5teb ?= "${TUNE_FEATURES_tune-armv5te} bigendian"
+TUNE_FEATURES_tune-armv5eb = "${TUNE_FEATURES_tune-armv5e} bigendian"
+TUNE_FEATURES_tune-armv5teb = "${TUNE_FEATURES_tune-armv5te} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5eb"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5eb armv5teb"
 
@@ -42,10 +42,10 @@ ARMPKGARCH_tune-armv5eb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5teb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5ehfb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5tehfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5eb-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
-TUNE_FEATURES_tune-armv5teb-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
-TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5ehf-vfp} bigendian"
-TUNE_FEATURES_tune-armv5tehfb-vfp ?= "${TUNE_FEATURES_tune-armv5tehf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5eb-vfp = "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
+TUNE_FEATURES_tune-armv5teb-vfp = "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
+TUNE_FEATURES_tune-armv5ehfb-vfp = "${TUNE_FEATURES_tune-armv5ehf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5tehfb-vfp = "${TUNE_FEATURES_tune-armv5tehf-vfp} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp} armv5eb armv5eb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index bb5848c..49e1fc4 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -14,8 +14,8 @@ require conf/machine/include/arm/feature-arm-vfp.inc
 AVAILTUNES += "armv5 armv5t"
 ARMPKGARCH_tune-armv5 ?= "armv5"
 ARMPKGARCH_tune-armv5t ?= "armv5"
-TUNE_FEATURES_tune-armv5 ?= "arm armv5"
-TUNE_FEATURES_tune-armv5t ?= "${TUNE_FEATURES_tune-armv5} thumb"
+TUNE_FEATURES_tune-armv5 = "arm armv5"
+TUNE_FEATURES_tune-armv5t = "${TUNE_FEATURES_tune-armv5} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
 PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
 
@@ -25,10 +25,10 @@ ARMPKGARCH_tune-armv5-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5t-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5hf-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5thf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5-vfp ?= "${TUNE_FEATURES_tune-armv5} vfp"
-TUNE_FEATURES_tune-armv5t-vfp ?= "${TUNE_FEATURES_tune-armv5t} vfp"
-TUNE_FEATURES_tune-armv5hf-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
-TUNE_FEATURES_tune-armv5thf-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5-vfp = "${TUNE_FEATURES_tune-armv5} vfp"
+TUNE_FEATURES_tune-armv5t-vfp = "${TUNE_FEATURES_tune-armv5t} vfp"
+TUNE_FEATURES_tune-armv5hf-vfp = "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5thf-vfp = "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv5-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp = "armv5hf-vfp"
@@ -39,8 +39,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vf
 AVAILTUNES += "armv5b armv5tb"
 ARMPKGARCH_tune-armv5b ?= "armv5"
 ARMPKGARCH_tune-armv5tb ?= "armv5"
-TUNE_FEATURES_tune-armv5b ?= "${TUNE_FEATURES_tune-armv5} bigendian"
-TUNE_FEATURES_tune-armv5tb ?= "${TUNE_FEATURES_tune-armv5t} bigendian"
+TUNE_FEATURES_tune-armv5b = "${TUNE_FEATURES_tune-armv5} bigendian"
+TUNE_FEATURES_tune-armv5tb = "${TUNE_FEATURES_tune-armv5t} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv5b"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4tb} armv5b armv5tb"
 
@@ -50,10 +50,10 @@ ARMPKGARCH_tune-armv5b-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5tb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5hfb-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5thfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5b-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
-TUNE_FEATURES_tune-armv5tb-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
-TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5hf-vfp} bigendian"
-TUNE_FEATURES_tune-armv5thfb-vfp ?= "${TUNE_FEATURES_tune-armv5thf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5b-vfp = "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
+TUNE_FEATURES_tune-armv5tb-vfp = "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
+TUNE_FEATURES_tune-armv5hfb-vfp = "${TUNE_FEATURES_tune-armv5hf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5thfb-vfp = "${TUNE_FEATURES_tune-armv5thf-vfp} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp = "armv5hfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 9a3e19e..6527a2b 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -15,12 +15,12 @@ ARMPKGARCH_tune-armv6 ?= "armv6"
 ARMPKGARCH_tune-armv6t ?= "armv6"
 ARMPKGARCH_tune-armv6hf ?= "armv6"
 ARMPKGARCH_tune-armv6thf ?= "armv6"
-TUNE_FEATURES_tune-armv6-novfp ?= "arm armv6"
-TUNE_FEATURES_tune-armv6t-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} thumb"
-TUNE_FEATURES_tune-armv6 ?= "${TUNE_FEATURES_tune-armv6-novfp} vfp"
-TUNE_FEATURES_tune-armv6t ?= "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
-TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
-TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
+TUNE_FEATURES_tune-armv6-novfp = "arm armv6"
+TUNE_FEATURES_tune-armv6t-novfp = "${TUNE_FEATURES_tune-armv6-novfp} thumb"
+TUNE_FEATURES_tune-armv6 = "${TUNE_FEATURES_tune-armv6-novfp} vfp"
+TUNE_FEATURES_tune-armv6t = "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
+TUNE_FEATURES_tune-armv6hf = "${TUNE_FEATURES_tune-armv6} callconvention-hard"
+TUNE_FEATURES_tune-armv6thf = "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"
 PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv6 armv6t"
 PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6 armv6-vfp"
@@ -36,12 +36,12 @@ ARMPKGARCH_tune-armv6b ?= "armv6"
 ARMPKGARCH_tune-armv6tb ?= "armv6"
 ARMPKGARCH_tune-armv6hfb ?= "armv6"
 ARMPKGARCH_tune-armv6thfb ?= "armv6"
-TUNE_FEATURES_tune-armv6b-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
-TUNE_FEATURES_tune-armv6tb-novfp ?= "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
-TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
-TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
-TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6hf} bigendian"
-TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6thf} bigendian"
+TUNE_FEATURES_tune-armv6b-novfp = "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
+TUNE_FEATURES_tune-armv6tb-novfp = "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
+TUNE_FEATURES_tune-armv6b = "${TUNE_FEATURES_tune-armv6} bigendian"
+TUNE_FEATURES_tune-armv6tb = "${TUNE_FEATURES_tune-armv6t} bigendian"
+TUNE_FEATURES_tune-armv6hfb = "${TUNE_FEATURES_tune-armv6hf} bigendian"
+TUNE_FEATURES_tune-armv6thfb = "${TUNE_FEATURES_tune-armv6thf} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b"
 PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv6b armv6tb"
 PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b armv6b-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index c3b8869..d0db09c 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -18,14 +18,14 @@ ARMPKGARCH_tune-armv7a-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon       ?= "armv7a"
-TUNE_FEATURES_tune-armv7a             ?= "arm armv7a vfp"
-TUNE_FEATURES_tune-armv7at            ?= "${TUNE_FEATURES_tune-armv7a} thumb"
-TUNE_FEATURES_tune-armv7a-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a}  vfpv3d16"
-TUNE_FEATURES_tune-armv7at-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
-TUNE_FEATURES_tune-armv7a-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}  vfpv3"
-TUNE_FEATURES_tune-armv7at-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
-TUNE_FEATURES_tune-armv7a-neon        ?= "${TUNE_FEATURES_tune-armv7a}  neon"
-TUNE_FEATURES_tune-armv7at-neon       ?= "${TUNE_FEATURES_tune-armv7at} neon"
+TUNE_FEATURES_tune-armv7a             = "arm armv7a vfp"
+TUNE_FEATURES_tune-armv7at            = "${TUNE_FEATURES_tune-armv7a} thumb"
+TUNE_FEATURES_tune-armv7a-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a}  vfpv3d16"
+TUNE_FEATURES_tune-armv7at-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
+TUNE_FEATURES_tune-armv7a-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}  vfpv3"
+TUNE_FEATURES_tune-armv7at-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7a-neon        = "${TUNE_FEATURES_tune-armv7a}  neon"
+TUNE_FEATURES_tune-armv7at-neon       = "${TUNE_FEATURES_tune-armv7at} neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7at            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-vfpv3d16"
@@ -47,16 +47,16 @@ ARMPKGARCH_tune-armv7ahf-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahf             ?= "${TUNE_FEATURES_tune-armv7a}             callconvention-hard"
-TUNE_FEATURES_tune-armv7athf            ?= "${TUNE_FEATURES_tune-armv7at}            callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3}       callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3}      callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon        ?= "${TUNE_FEATURES_tune-armv7a-neon}        callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-neon       ?= "${TUNE_FEATURES_tune-armv7at-neon}       callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  ?= "${TUNE_FEATURES_tune-armv7ahf-neon}      vfpv4"
-TUNE_FEATURES_tune-armv7athf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon}     vfpv4"
+TUNE_FEATURES_tune-armv7ahf             = "${TUNE_FEATURES_tune-armv7a}             callconvention-hard"
+TUNE_FEATURES_tune-armv7athf            = "${TUNE_FEATURES_tune-armv7at}            callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}       callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon}      vfpv4"
+TUNE_FEATURES_tune-armv7athf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon}     vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-vfpv3d16"
@@ -78,14 +78,14 @@ ARMPKGARCH_tune-armv7ab-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon       ?= "armv7a"
-TUNE_FEATURES_tune-armv7ab             ?= "${TUNE_FEATURES_tune-armv7a}             bigendian"
-TUNE_FEATURES_tune-armv7atb            ?= "${TUNE_FEATURES_tune-armv7at}            bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3       ?= "${TUNE_FEATURES_tune-armv7a-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3      ?= "${TUNE_FEATURES_tune-armv7at-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7ab-neon        ?= "${TUNE_FEATURES_tune-armv7a-neon}        bigendian"
-TUNE_FEATURES_tune-armv7atb-neon       ?= "${TUNE_FEATURES_tune-armv7at-neon}       bigendian"
+TUNE_FEATURES_tune-armv7ab             = "${TUNE_FEATURES_tune-armv7a}             bigendian"
+TUNE_FEATURES_tune-armv7atb            = "${TUNE_FEATURES_tune-armv7at}            bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7ab-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        bigendian"
+TUNE_FEATURES_tune-armv7atb-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-vfpv3d16"
@@ -105,14 +105,14 @@ ARMPKGARCH_tune-armv7ahfb-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon       ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahfb             ?= "${TUNE_FEATURES_tune-armv7ahf}             bigendian"
-TUNE_FEATURES_tune-armv7athfb            ?= "${TUNE_FEATURES_tune-armv7athf}            bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3d16   ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3       ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3      ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7ahfb-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        bigendian"
-TUNE_FEATURES_tune-armv7athfb-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       bigendian"
+TUNE_FEATURES_tune-armv7ahfb             = "${TUNE_FEATURES_tune-armv7ahf}             bigendian"
+TUNE_FEATURES_tune-armv7athfb            = "${TUNE_FEATURES_tune-armv7athf}            bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7athf-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3       = "${TUNE_FEATURES_tune-armv7ahf-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3      = "${TUNE_FEATURES_tune-armv7athf-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        bigendian"
+TUNE_FEATURES_tune-armv7athfb-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-vfpv3d16"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index bfc107e..49419b6 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -8,7 +8,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
 TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
 
 AVAILTUNES += "powerpc64"
-TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
+TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
 TUNE_PKGARCH_tune-powerpc64 = "powerpc64"
 PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index af2fb2d..b4a693d 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -26,10 +26,10 @@ ARMPKGARCH_tune-cortexa15hf             = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf            = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
-TUNE_FEATURES_tune-cortexa15thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
+TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
+TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 7ddb264..69232d0 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -26,10 +26,10 @@ ARMPKGARCH_tune-cortexa17hf             = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf            = "cortexa17"
 ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
-TUNE_FEATURES_tune-cortexa17hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa17"
-TUNE_FEATURES_tune-cortexa17thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa17"
-TUNE_FEATURES_tune-cortexa17hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa17"
-TUNE_FEATURES_tune-cortexa17thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
+TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa17"
+TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 598782d..b649641 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -26,10 +26,10 @@ ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
 ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
-TUNE_FEATURES_tune-cortexa5hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa5"
-TUNE_FEATURES_tune-cortexa5thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa5"
-TUNE_FEATURES_tune-cortexa5hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa5"
-TUNE_FEATURES_tune-cortexa5thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
+TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa5"
+TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa5"
+TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa5"
+TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp cortexa5hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 5cbb8d7..0f24183 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -28,12 +28,12 @@ ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
 ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
-TUNE_FEATURES_tune-cortexa7thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
+TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 96115db..71706e4 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -26,10 +26,10 @@ ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
 ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
 ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
-TUNE_FEATURES_tune-cortexa8hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa8"
-TUNE_FEATURES_tune-cortexa8thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa8"
-TUNE_FEATURES_tune-cortexa8hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa8"
-TUNE_FEATURES_tune-cortexa8thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
+TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa8"
+TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa8"
+TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa8hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index d504c9f..ddd6f77 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -26,10 +26,10 @@ ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
 ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
 ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
-TUNE_FEATURES_tune-cortexa9hf             ?= "${TUNE_FEATURES_tune-armv7ahf}             cortexa9"
-TUNE_FEATURES_tune-cortexa9thf            ?= "${TUNE_FEATURES_tune-armv7athf}            cortexa9"
-TUNE_FEATURES_tune-cortexa9hf-neon        ?= "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa9"
-TUNE_FEATURES_tune-cortexa9thf-neon       ?= "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
+TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa9"
+TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa9hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 4888d0c..3d43b0f 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -10,8 +10,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunde
 ARMPKGARCH_tune-thunderx ?= "thunderx"
 ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
 
-TUNE_FEATURES_tune-thunderx ?= "${TUNE_FEATURES_tune-aarch64} thunderx"
-TUNE_FEATURES_tune-thunderx_be ?= "${TUNE_FEATURES_tune-thunderx} bigendian"
+TUNE_FEATURES_tune-thunderx = "${TUNE_FEATURES_tune-aarch64} thunderx"
+TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
 BASE_LIB_tune-thunderx = "lib64"
 BASE_LIB_tune-thunderx_be = "lib64"
 
-- 
2.6.3


