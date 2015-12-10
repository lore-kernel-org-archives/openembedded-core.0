Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0017319F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:21 +0000 (UTC)
Received: by wmec201 with SMTP id c201so25524704wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=5AsDh+9TMrofjqUiRKiID9EsLF291Zjf+Wa/OyJigC0=;
	b=V3C8sWhSMu60xlfEK0bizIeBnkoGdwiaqS+nLpVUUQdgGRT8jIaGaVar+k/SAz2kRM
	mU7Y9GmTVLezvGj6t7+YvucFdlqy4X0Grpq/wJ00ML1c7NTNNJ51/g8bGqxTtWl0Tc38
	6Oq/nkDLanPYw12eVowMvBDy5rs9rrT37XKOPBNLLSbbjXd8DEfGSHJ4fjKy00B2PREE
	5/P6aoCPvX/o5NnSN0uS7jv2PykoI2ZIds8ZnPdEQMW9uiRqdVXObpxtsi37xCR28Lyv
	Cc6hYqCuyfk7TYsaFzWMiQ/Uet8DcRLylBmaVLjbHApJBR06fcRFCtD6qqExngZt0xM0
	Nn3g==
X-Received: by 10.28.140.136 with SMTP id o130mr42211303wmd.78.1449755241928; 
	Thu, 10 Dec 2015 05:47:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i84sm13003239wmc.20.2015.12.10.05.47.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:44 +0100
Message-Id: <ddf3e6894179c5e7886bbaae2a5b44b3e83896c2.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 07/15] arch-armv[456]*.inc: improve indentation like armv7a
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc     | 12 ++---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 48 +++++++++---------
 meta/conf/machine/include/arm/arch-armv5.inc     | 50 +++++++++----------
 meta/conf/machine/include/arm/arch-armv6.inc     | 62 ++++++++++++------------
 4 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index ea56cca..813ed15 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -17,18 +17,18 @@ require conf/machine/include/arm/feature-arm-thumb.inc
 
 # Little Endian
 AVAILTUNES += "armv4 armv4t"
-ARMPKGARCH_tune-armv4 ?= "armv4"
+ARMPKGARCH_tune-armv4  ?= "armv4"
 ARMPKGARCH_tune-armv4t ?= "armv4"
-TUNE_FEATURES_tune-armv4 = "arm armv4"
+TUNE_FEATURES_tune-armv4  = "arm armv4"
 TUNE_FEATURES_tune-armv4t = "${TUNE_FEATURES_tune-armv4} thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
+PACKAGE_EXTRA_ARCHS_tune-armv4  = "arm armv4"
 PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
 
 # Big Endian
 AVAILTUNES += "armv4b armv4tb"
-ARMPKGARCH_tune-armv4b ?= "armv4"
+ARMPKGARCH_tune-armv4b  ?= "armv4"
 ARMPKGARCH_tune-armv4tb ?= "armv4"
-TUNE_FEATURES_tune-armv4b = "${TUNE_FEATURES_tune-armv4} bigendian"
+TUNE_FEATURES_tune-armv4b  = "${TUNE_FEATURES_tune-armv4}  bigendian"
 TUNE_FEATURES_tune-armv4tb = "${TUNE_FEATURES_tune-armv4t} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv4b = "armeb armv4b"
+PACKAGE_EXTRA_ARCHS_tune-armv4b  = "armeb armv4b"
 PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv4tb"
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 632b88d..f204920 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -5,48 +5,48 @@ require conf/machine/include/arm/arch-armv5.inc
 
 # Little Endian
 AVAILTUNES += "armv5e armv5te"
-ARMPKGARCH_tune-armv5e ?= "armv5"
+ARMPKGARCH_tune-armv5e  ?= "armv5"
 ARMPKGARCH_tune-armv5te ?= "armv5"
-TUNE_FEATURES_tune-armv5e = "${TUNE_FEATURES_tune-armv5} dsp"
+TUNE_FEATURES_tune-armv5e  = "${TUNE_FEATURES_tune-armv5}  dsp"
 TUNE_FEATURES_tune-armv5te = "${TUNE_FEATURES_tune-armv5t} dsp"
-PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
+PACKAGE_EXTRA_ARCHS_tune-armv5e  = "${PACKAGE_EXTRA_ARCHS_tune-armv5}  armv5e"
 PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
 
 # Little Endian + VFP/DSP
 AVAILTUNES += "armv5e-vfp armv5te-vfp armv5ehf-vfp armv5tehf-vfp"
-ARMPKGARCH_tune-armv5e-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5te-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5ehf-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5e-vfp    ?= "armv5"
+ARMPKGARCH_tune-armv5te-vfp   ?= "armv5"
+ARMPKGARCH_tune-armv5ehf-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5tehf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5e-vfp = "${TUNE_FEATURES_tune-armv5e} vfp"
-TUNE_FEATURES_tune-armv5te-vfp = "${TUNE_FEATURES_tune-armv5te} vfp"
-TUNE_FEATURES_tune-armv5ehf-vfp = "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5e-vfp    = "${TUNE_FEATURES_tune-armv5e}      vfp"
+TUNE_FEATURES_tune-armv5te-vfp   = "${TUNE_FEATURES_tune-armv5te}     vfp"
+TUNE_FEATURES_tune-armv5ehf-vfp  = "${TUNE_FEATURES_tune-armv5e-vfp}  callconvention-hard"
 TUNE_FEATURES_tune-armv5tehf-vfp = "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5e armv5te armv5e-vfp armv5te-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv5ehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp}    armv5e armv5e-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp}   armv5e armv5te armv5e-vfp armv5te-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp}  armv5ehf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
 
 # Big Endian
 AVAILTUNES += "armv5eb armv5teb"
-ARMPKGARCH_tune-armv5eb ?= "armv5"
+ARMPKGARCH_tune-armv5eb  ?= "armv5"
 ARMPKGARCH_tune-armv5teb ?= "armv5"
-TUNE_FEATURES_tune-armv5eb = "${TUNE_FEATURES_tune-armv5e} bigendian"
+TUNE_FEATURES_tune-armv5eb  = "${TUNE_FEATURES_tune-armv5e}  bigendian"
 TUNE_FEATURES_tune-armv5teb = "${TUNE_FEATURES_tune-armv5te} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5eb"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb  = "${PACKAGE_EXTRA_ARCHS_tune-armv5b}  armv5eb"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5eb armv5teb"
 
 # Big Endian + VFP/DSP
 AVAILTUNES += "armv5eb-vfp armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp"
-ARMPKGARCH_tune-armv5eb-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5teb-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5ehfb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5eb-vfp    ?= "armv5"
+ARMPKGARCH_tune-armv5teb-vfp   ?= "armv5"
+ARMPKGARCH_tune-armv5ehfb-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5tehfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5eb-vfp = "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
-TUNE_FEATURES_tune-armv5teb-vfp = "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
-TUNE_FEATURES_tune-armv5ehfb-vfp = "${TUNE_FEATURES_tune-armv5ehf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5eb-vfp    = "${TUNE_FEATURES_tune-armv5e-vfp}    bigendian"
+TUNE_FEATURES_tune-armv5teb-vfp   = "${TUNE_FEATURES_tune-armv5te-vfp}   bigendian"
+TUNE_FEATURES_tune-armv5ehfb-vfp  = "${TUNE_FEATURES_tune-armv5ehf-vfp}  bigendian"
 TUNE_FEATURES_tune-armv5tehfb-vfp = "${TUNE_FEATURES_tune-armv5tehf-vfp} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp} armv5eb armv5eb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp}  armv5eb armv5eb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp}  armv5ehfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 49e1fc4..6a17972 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -12,49 +12,49 @@ require conf/machine/include/arm/feature-arm-vfp.inc
 
 # Little Endian
 AVAILTUNES += "armv5 armv5t"
-ARMPKGARCH_tune-armv5 ?= "armv5"
+ARMPKGARCH_tune-armv5  ?= "armv5"
 ARMPKGARCH_tune-armv5t ?= "armv5"
-TUNE_FEATURES_tune-armv5 = "arm armv5"
+TUNE_FEATURES_tune-armv5  = "arm armv5"
 TUNE_FEATURES_tune-armv5t = "${TUNE_FEATURES_tune-armv5} thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
+PACKAGE_EXTRA_ARCHS_tune-armv5  = "${PACKAGE_EXTRA_ARCHS_tune-armv4}  armv5"
 PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
 
 # Little Endian + VFP/DSP
 AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
-ARMPKGARCH_tune-armv5-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5t-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5hf-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5-vfp    ?= "armv5"
+ARMPKGARCH_tune-armv5t-vfp   ?= "armv5"
+ARMPKGARCH_tune-armv5hf-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5thf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5-vfp = "${TUNE_FEATURES_tune-armv5} vfp"
-TUNE_FEATURES_tune-armv5t-vfp = "${TUNE_FEATURES_tune-armv5t} vfp"
-TUNE_FEATURES_tune-armv5hf-vfp = "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5-vfp    = "${TUNE_FEATURES_tune-armv5}      vfp"
+TUNE_FEATURES_tune-armv5t-vfp   = "${TUNE_FEATURES_tune-armv5t}     vfp"
+TUNE_FEATURES_tune-armv5hf-vfp  = "${TUNE_FEATURES_tune-armv5-vfp}  callconvention-hard"
 TUNE_FEATURES_tune-armv5thf-vfp = "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv5-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp = "armv5hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp = "armv5hf-vfp armv5thf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5-vfp     = "${PACKAGE_EXTRA_ARCHS_tune-armv5}  armv5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp   = "armv5hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp  = "armv5hf-vfp armv5thf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
 
 # Big Endian
 AVAILTUNES += "armv5b armv5tb"
-ARMPKGARCH_tune-armv5b ?= "armv5"
+ARMPKGARCH_tune-armv5b  ?= "armv5"
 ARMPKGARCH_tune-armv5tb ?= "armv5"
-TUNE_FEATURES_tune-armv5b = "${TUNE_FEATURES_tune-armv5} bigendian"
+TUNE_FEATURES_tune-armv5b  = "${TUNE_FEATURES_tune-armv5}  bigendian"
 TUNE_FEATURES_tune-armv5tb = "${TUNE_FEATURES_tune-armv5t} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv5b"
+PACKAGE_EXTRA_ARCHS_tune-armv5b  = "${PACKAGE_EXTRA_ARCHS_tune-armv4b}  armv5b"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4tb} armv5b armv5tb"
 
 # Big Endian + VFP/DSP
 AVAILTUNES += "armv5b-vfp armv5tb-vfp armv5hfb-vfp armv5thfb-vfp"
-ARMPKGARCH_tune-armv5b-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5tb-vfp ?= "armv5"
-ARMPKGARCH_tune-armv5hfb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5b-vfp    ?= "armv5"
+ARMPKGARCH_tune-armv5tb-vfp   ?= "armv5"
+ARMPKGARCH_tune-armv5hfb-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5thfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5b-vfp = "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
-TUNE_FEATURES_tune-armv5tb-vfp = "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
-TUNE_FEATURES_tune-armv5hfb-vfp = "${TUNE_FEATURES_tune-armv5hf-vfp} bigendian"
+TUNE_FEATURES_tune-armv5b-vfp    = "${TUNE_FEATURES_tune-armv5-vfp}    bigendian"
+TUNE_FEATURES_tune-armv5tb-vfp   = "${TUNE_FEATURES_tune-armv5t-vfp}   bigendian"
+TUNE_FEATURES_tune-armv5hfb-vfp  = "${TUNE_FEATURES_tune-armv5hf-vfp}  bigendian"
 TUNE_FEATURES_tune-armv5thfb-vfp = "${TUNE_FEATURES_tune-armv5thf-vfp} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp = "armv5hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b}  armv5b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp  = "armv5hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp = "armv5hfb-vfp armv5thfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 6527a2b..4c93f2c 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -9,42 +9,42 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
 
 # Little Endian
 AVAILTUNES += "armv6-novfp armv6t-novfp armv6 armv6t armv6hf armv6thf"
-ARMPKGARCH_tune-armv6-novfp ?= "armv6"
+ARMPKGARCH_tune-armv6-novfp  ?= "armv6"
 ARMPKGARCH_tune-armv6t-novfp ?= "armv6"
-ARMPKGARCH_tune-armv6 ?= "armv6"
-ARMPKGARCH_tune-armv6t ?= "armv6"
-ARMPKGARCH_tune-armv6hf ?= "armv6"
-ARMPKGARCH_tune-armv6thf ?= "armv6"
-TUNE_FEATURES_tune-armv6-novfp = "arm armv6"
-TUNE_FEATURES_tune-armv6t-novfp = "${TUNE_FEATURES_tune-armv6-novfp} thumb"
-TUNE_FEATURES_tune-armv6 = "${TUNE_FEATURES_tune-armv6-novfp} vfp"
-TUNE_FEATURES_tune-armv6t = "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
-TUNE_FEATURES_tune-armv6hf = "${TUNE_FEATURES_tune-armv6} callconvention-hard"
-TUNE_FEATURES_tune-armv6thf = "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"
+ARMPKGARCH_tune-armv6        ?= "armv6"
+ARMPKGARCH_tune-armv6t       ?= "armv6"
+ARMPKGARCH_tune-armv6hf      ?= "armv6"
+ARMPKGARCH_tune-armv6thf     ?= "armv6"
+TUNE_FEATURES_tune-armv6-novfp  = "arm armv6"
+TUNE_FEATURES_tune-armv6t-novfp = "${TUNE_FEATURES_tune-armv6-novfp}  thumb"
+TUNE_FEATURES_tune-armv6        = "${TUNE_FEATURES_tune-armv6-novfp}  vfp"
+TUNE_FEATURES_tune-armv6t       = "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
+TUNE_FEATURES_tune-armv6hf      = "${TUNE_FEATURES_tune-armv6}        callconvention-hard"
+TUNE_FEATURES_tune-armv6thf     = "${TUNE_FEATURES_tune-armv6t}       callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5e}  armv6"
 PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv6 armv6t"
-PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6 armv6-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6 armv6t armv6-vfp armv6t-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6        = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp}  armv6 armv6-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6t       = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6 armv6t armv6-vfp armv6t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hf      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp}  armv6hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thf     = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
 
 # Big Endian
 AVAILTUNES += "armv6b-novfp armv6tb-novfp armv6b armv6tb armv6hfb armv6thfb"
-ARMPKGARCH_tune-armv6b-novfp ?= "armv6"
+ARMPKGARCH_tune-armv6b-novfp  ?= "armv6"
 ARMPKGARCH_tune-armv6tb-novfp ?= "armv6"
-ARMPKGARCH_tune-armv6b ?= "armv6"
-ARMPKGARCH_tune-armv6tb ?= "armv6"
-ARMPKGARCH_tune-armv6hfb ?= "armv6"
-ARMPKGARCH_tune-armv6thfb ?= "armv6"
-TUNE_FEATURES_tune-armv6b-novfp = "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
+ARMPKGARCH_tune-armv6b        ?= "armv6"
+ARMPKGARCH_tune-armv6tb       ?= "armv6"
+ARMPKGARCH_tune-armv6hfb      ?= "armv6"
+ARMPKGARCH_tune-armv6thfb     ?= "armv6"
+TUNE_FEATURES_tune-armv6b-novfp  = "${TUNE_FEATURES_tune-armv6-novfp}  bigendian"
 TUNE_FEATURES_tune-armv6tb-novfp = "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
-TUNE_FEATURES_tune-armv6b = "${TUNE_FEATURES_tune-armv6} bigendian"
-TUNE_FEATURES_tune-armv6tb = "${TUNE_FEATURES_tune-armv6t} bigendian"
-TUNE_FEATURES_tune-armv6hfb = "${TUNE_FEATURES_tune-armv6hf} bigendian"
-TUNE_FEATURES_tune-armv6thfb = "${TUNE_FEATURES_tune-armv6thf} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b"
+TUNE_FEATURES_tune-armv6b =        "${TUNE_FEATURES_tune-armv6}        bigendian"
+TUNE_FEATURES_tune-armv6tb =       "${TUNE_FEATURES_tune-armv6t}       bigendian"
+TUNE_FEATURES_tune-armv6hfb =      "${TUNE_FEATURES_tune-armv6hf}      bigendian"
+TUNE_FEATURES_tune-armv6thfb =     "${TUNE_FEATURES_tune-armv6thf}     bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb}  armv6b"
 PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv6b armv6tb"
-PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b armv6b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b armv6tb armv6b-vfp armv6tb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b        = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp}  armv6b armv6b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb       = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b armv6tb armv6b-vfp armv6tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hfb      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp}  armv6hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thfb     = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
-- 
2.6.3


