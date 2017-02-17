Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F10E66AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:47:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so4027446wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UP2kkB2b63szQWbp2pQeCtAjVwRnSz8fDKvZzWYKbSo=;
	b=BCMyOpdTBRDhDqIbe1KCkOah1mA+YqaIOlR74PFxN+sUU+4ITVVxdCUT1oXPgmswM7
	sfXHZmeiTL0QkD0QRKYCmx8qDASPh0DFuVSuzSTT7r/+UTTV6PFvPJbq2iGtehyGvoDL
	Wat/y6naWxArHkcPVUfHT9VNHeg0fsqT3DCK5s06r7AgH0L4RNV+bvttyeP0Oizg9axz
	A5F6btv0kvgmSa+XV+Ab/gkBoRNuuN652Oh5iruhhu4Smy7gZKgLExY3EQLCS1/QfpDz
	577ZPxhKMD5HpVAQ7x3T/YY7qHOIAgu768dDVgaOUUp2jJuJm+qWchL9OQngnp9OmhCH
	NkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UP2kkB2b63szQWbp2pQeCtAjVwRnSz8fDKvZzWYKbSo=;
	b=NCAPNejbJwZpvNhn30b1KG9/HwuTL7K9m6Rw02RiplMqazGlFo4GlUFv5MQ8Oaoxfh
	3E6DH1wYyvQcUyAqFqVYsZK/jPQK1Pzw6notGF3RISKsgqV7MTDHbqvYtsTpaYLYfbk/
	Srl+vDJUg+BE7v8tGbOK201yinp4/SjCOR+jx449XwT2omTs5osKk2FGORKmXck0zf/V
	33tJiMyd42BjIh3HdKh+8z/U5cKtnuxV2IopErLhiRD4o4DOP6pXrq8HpZLmrBxvnOzr
	RIGGslcWx2ISPUDXYAlY1Ls714+6W0r8iE4flXUkq+R0lALhI47/cvFVPeCHK+cZisCQ
	Wcrg==
X-Gm-Message-State: AMke39m2/6g3CF5D40+A3RztDX6AHBM0PsNGoO9DUuvAXTMGlwr4Wwe8POJ7rjuhmOR4aw==
X-Received: by 10.28.102.67 with SMTP id a64mr5481592wmc.140.1487357226922;
	Fri, 17 Feb 2017 10:47:06 -0800 (PST)
Received: from localhost.localdomain ([62.179.106.250])
	by smtp.gmail.com with ESMTPSA id
	x135sm2675797wme.23.2017.02.17.10.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 10:47:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 10:47:01 -0800
Message-Id: <1487357221-4556-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] arch-arm*.inc: squash whitespace within TUNE_FEATURES strings
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
X-List-Received-Date: Fri, 17 Feb 2017 18:47:08 -0000

TUNE_FEATURES is include in BUILDCFG_VARS, so any whitespace is
visible to the user during the build process. Remove the extra
whitespace added during the 2.1 development cycle:

  http://git.openembedded.org/openembedded-core/commit/?id=f774b44fa007a2a756ada892ede832b1251d940c

For consistency, squash whitespace within PACKAGE_EXTRA_ARCHS strings
too.

Whitespace within TUNE_FEATURES strings in the tune-cortexa*.inc
files has been fixed in a separate commit:

  http://git.openembedded.org/openembedded-core/commit/?id=5610c6397ee098dd998b7417b343494de77179f9

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |  30 +++----
 meta/conf/machine/include/arm/arch-armv5.inc     |  22 ++---
 meta/conf/machine/include/arm/arch-armv6.inc     |  30 +++----
 meta/conf/machine/include/arm/arch-armv7a.inc    | 102 +++++++++++------------
 meta/conf/machine/include/arm/arch-armv7ve.inc   | 102 +++++++++++------------
 5 files changed, 143 insertions(+), 143 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index f204920..1f16085 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -7,9 +7,9 @@ require conf/machine/include/arm/arch-armv5.inc
 AVAILTUNES += "armv5e armv5te"
 ARMPKGARCH_tune-armv5e  ?= "armv5"
 ARMPKGARCH_tune-armv5te ?= "armv5"
-TUNE_FEATURES_tune-armv5e  = "${TUNE_FEATURES_tune-armv5}  dsp"
+TUNE_FEATURES_tune-armv5e  = "${TUNE_FEATURES_tune-armv5} dsp"
 TUNE_FEATURES_tune-armv5te = "${TUNE_FEATURES_tune-armv5t} dsp"
-PACKAGE_EXTRA_ARCHS_tune-armv5e  = "${PACKAGE_EXTRA_ARCHS_tune-armv5}  armv5e"
+PACKAGE_EXTRA_ARCHS_tune-armv5e  = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
 PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
 
 # Little Endian + VFP/DSP
@@ -18,22 +18,22 @@ ARMPKGARCH_tune-armv5e-vfp    ?= "armv5"
 ARMPKGARCH_tune-armv5te-vfp   ?= "armv5"
 ARMPKGARCH_tune-armv5ehf-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5tehf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5e-vfp    = "${TUNE_FEATURES_tune-armv5e}      vfp"
-TUNE_FEATURES_tune-armv5te-vfp   = "${TUNE_FEATURES_tune-armv5te}     vfp"
-TUNE_FEATURES_tune-armv5ehf-vfp  = "${TUNE_FEATURES_tune-armv5e-vfp}  callconvention-hard"
+TUNE_FEATURES_tune-armv5e-vfp    = "${TUNE_FEATURES_tune-armv5e} vfp"
+TUNE_FEATURES_tune-armv5te-vfp   = "${TUNE_FEATURES_tune-armv5te} vfp"
+TUNE_FEATURES_tune-armv5ehf-vfp  = "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
 TUNE_FEATURES_tune-armv5tehf-vfp = "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp}    armv5e armv5e-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp}   armv5e armv5te armv5e-vfp armv5te-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp}  armv5ehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5e armv5te armv5e-vfp armv5te-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv5ehf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
 
 # Big Endian
 AVAILTUNES += "armv5eb armv5teb"
 ARMPKGARCH_tune-armv5eb  ?= "armv5"
 ARMPKGARCH_tune-armv5teb ?= "armv5"
-TUNE_FEATURES_tune-armv5eb  = "${TUNE_FEATURES_tune-armv5e}  bigendian"
+TUNE_FEATURES_tune-armv5eb  = "${TUNE_FEATURES_tune-armv5e} bigendian"
 TUNE_FEATURES_tune-armv5teb = "${TUNE_FEATURES_tune-armv5te} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5eb  = "${PACKAGE_EXTRA_ARCHS_tune-armv5b}  armv5eb"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb  = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5eb"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5eb armv5teb"
 
 # Big Endian + VFP/DSP
@@ -42,11 +42,11 @@ ARMPKGARCH_tune-armv5eb-vfp    ?= "armv5"
 ARMPKGARCH_tune-armv5teb-vfp   ?= "armv5"
 ARMPKGARCH_tune-armv5ehfb-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5tehfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5eb-vfp    = "${TUNE_FEATURES_tune-armv5e-vfp}    bigendian"
-TUNE_FEATURES_tune-armv5teb-vfp   = "${TUNE_FEATURES_tune-armv5te-vfp}   bigendian"
-TUNE_FEATURES_tune-armv5ehfb-vfp  = "${TUNE_FEATURES_tune-armv5ehf-vfp}  bigendian"
+TUNE_FEATURES_tune-armv5eb-vfp    = "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
+TUNE_FEATURES_tune-armv5teb-vfp   = "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
+TUNE_FEATURES_tune-armv5ehfb-vfp  = "${TUNE_FEATURES_tune-armv5ehf-vfp} bigendian"
 TUNE_FEATURES_tune-armv5tehfb-vfp = "${TUNE_FEATURES_tune-armv5tehf-vfp} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp}  armv5eb armv5eb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp} armv5eb armv5eb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp}  armv5ehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index e6ff902..46f631c 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -14,7 +14,7 @@ ARMPKGARCH_tune-armv5  ?= "armv5"
 ARMPKGARCH_tune-armv5t ?= "armv5"
 TUNE_FEATURES_tune-armv5  = "arm armv5"
 TUNE_FEATURES_tune-armv5t = "${TUNE_FEATURES_tune-armv5} thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv5  = "${PACKAGE_EXTRA_ARCHS_tune-armv4}  armv5"
+PACKAGE_EXTRA_ARCHS_tune-armv5  = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
 PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
 
 # Little Endian + VFP/DSP
@@ -23,11 +23,11 @@ ARMPKGARCH_tune-armv5-vfp    ?= "armv5"
 ARMPKGARCH_tune-armv5t-vfp   ?= "armv5"
 ARMPKGARCH_tune-armv5hf-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5thf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5-vfp    = "${TUNE_FEATURES_tune-armv5}      vfp"
-TUNE_FEATURES_tune-armv5t-vfp   = "${TUNE_FEATURES_tune-armv5t}     vfp"
-TUNE_FEATURES_tune-armv5hf-vfp  = "${TUNE_FEATURES_tune-armv5-vfp}  callconvention-hard"
+TUNE_FEATURES_tune-armv5-vfp    = "${TUNE_FEATURES_tune-armv5} vfp"
+TUNE_FEATURES_tune-armv5t-vfp   = "${TUNE_FEATURES_tune-armv5t} vfp"
+TUNE_FEATURES_tune-armv5hf-vfp  = "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
 TUNE_FEATURES_tune-armv5thf-vfp = "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv5-vfp     = "${PACKAGE_EXTRA_ARCHS_tune-armv5}  armv5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5-vfp     = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp   = "armv5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp  = "armv5hf-vfp armv5thf-vfp"
@@ -36,9 +36,9 @@ PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp  = "armv5hf-vfp armv5thf-vfp"
 AVAILTUNES += "armv5b armv5tb"
 ARMPKGARCH_tune-armv5b  ?= "armv5"
 ARMPKGARCH_tune-armv5tb ?= "armv5"
-TUNE_FEATURES_tune-armv5b  = "${TUNE_FEATURES_tune-armv5}  bigendian"
+TUNE_FEATURES_tune-armv5b  = "${TUNE_FEATURES_tune-armv5} bigendian"
 TUNE_FEATURES_tune-armv5tb = "${TUNE_FEATURES_tune-armv5t} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5b  = "${PACKAGE_EXTRA_ARCHS_tune-armv4b}  armv5b"
+PACKAGE_EXTRA_ARCHS_tune-armv5b  = "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv5b"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4tb} armv5b armv5tb"
 
 # Big Endian + VFP/DSP
@@ -47,11 +47,11 @@ ARMPKGARCH_tune-armv5b-vfp    ?= "armv5"
 ARMPKGARCH_tune-armv5tb-vfp   ?= "armv5"
 ARMPKGARCH_tune-armv5hfb-vfp  ?= "armv5"
 ARMPKGARCH_tune-armv5thfb-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5b-vfp    = "${TUNE_FEATURES_tune-armv5-vfp}    bigendian"
-TUNE_FEATURES_tune-armv5tb-vfp   = "${TUNE_FEATURES_tune-armv5t-vfp}   bigendian"
-TUNE_FEATURES_tune-armv5hfb-vfp  = "${TUNE_FEATURES_tune-armv5hf-vfp}  bigendian"
+TUNE_FEATURES_tune-armv5b-vfp    = "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
+TUNE_FEATURES_tune-armv5tb-vfp   = "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
+TUNE_FEATURES_tune-armv5hfb-vfp  = "${TUNE_FEATURES_tune-armv5hf-vfp} bigendian"
 TUNE_FEATURES_tune-armv5thfb-vfp = "${TUNE_FEATURES_tune-armv5thf-vfp} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b}  armv5b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp   = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5b-vfp armv5tb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp  = "armv5hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp = "armv5hfb-vfp armv5thfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 4c93f2c..91f0f07 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -16,16 +16,16 @@ ARMPKGARCH_tune-armv6t       ?= "armv6"
 ARMPKGARCH_tune-armv6hf      ?= "armv6"
 ARMPKGARCH_tune-armv6thf     ?= "armv6"
 TUNE_FEATURES_tune-armv6-novfp  = "arm armv6"
-TUNE_FEATURES_tune-armv6t-novfp = "${TUNE_FEATURES_tune-armv6-novfp}  thumb"
-TUNE_FEATURES_tune-armv6        = "${TUNE_FEATURES_tune-armv6-novfp}  vfp"
+TUNE_FEATURES_tune-armv6t-novfp = "${TUNE_FEATURES_tune-armv6-novfp} thumb"
+TUNE_FEATURES_tune-armv6        = "${TUNE_FEATURES_tune-armv6-novfp} vfp"
 TUNE_FEATURES_tune-armv6t       = "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
-TUNE_FEATURES_tune-armv6hf      = "${TUNE_FEATURES_tune-armv6}        callconvention-hard"
-TUNE_FEATURES_tune-armv6thf     = "${TUNE_FEATURES_tune-armv6t}       callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5e}  armv6"
+TUNE_FEATURES_tune-armv6hf      = "${TUNE_FEATURES_tune-armv6} callconvention-hard"
+TUNE_FEATURES_tune-armv6thf     = "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"
 PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv6 armv6t"
-PACKAGE_EXTRA_ARCHS_tune-armv6        = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp}  armv6 armv6-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6        = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6 armv6-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6t       = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6 armv6t armv6-vfp armv6t-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hf      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp}  armv6hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hf      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6thf     = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
 
 # Big Endian
@@ -36,15 +36,15 @@ ARMPKGARCH_tune-armv6b        ?= "armv6"
 ARMPKGARCH_tune-armv6tb       ?= "armv6"
 ARMPKGARCH_tune-armv6hfb      ?= "armv6"
 ARMPKGARCH_tune-armv6thfb     ?= "armv6"
-TUNE_FEATURES_tune-armv6b-novfp  = "${TUNE_FEATURES_tune-armv6-novfp}  bigendian"
+TUNE_FEATURES_tune-armv6b-novfp  = "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
 TUNE_FEATURES_tune-armv6tb-novfp = "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
-TUNE_FEATURES_tune-armv6b =        "${TUNE_FEATURES_tune-armv6}        bigendian"
-TUNE_FEATURES_tune-armv6tb =       "${TUNE_FEATURES_tune-armv6t}       bigendian"
-TUNE_FEATURES_tune-armv6hfb =      "${TUNE_FEATURES_tune-armv6hf}      bigendian"
-TUNE_FEATURES_tune-armv6thfb =     "${TUNE_FEATURES_tune-armv6thf}     bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb}  armv6b"
+TUNE_FEATURES_tune-armv6b =        "${TUNE_FEATURES_tune-armv6} bigendian"
+TUNE_FEATURES_tune-armv6tb =       "${TUNE_FEATURES_tune-armv6t} bigendian"
+TUNE_FEATURES_tune-armv6hfb =      "${TUNE_FEATURES_tune-armv6hf} bigendian"
+TUNE_FEATURES_tune-armv6thfb =     "${TUNE_FEATURES_tune-armv6thf} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp  = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b"
 PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv6b armv6tb"
-PACKAGE_EXTRA_ARCHS_tune-armv6b        = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp}  armv6b armv6b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b        = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b armv6b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6tb       = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b armv6tb armv6b-vfp armv6tb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hfb      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp}  armv6hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hfb      = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv6thfb     = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 1f2e071..5446048 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -22,23 +22,23 @@ ARMPKGARCH_tune-armv7a-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7a             = "arm armv7a vfp"
 TUNE_FEATURES_tune-armv7at            = "${TUNE_FEATURES_tune-armv7a} thumb"
-TUNE_FEATURES_tune-armv7a-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a}  vfpv3d16"
+TUNE_FEATURES_tune-armv7a-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a} vfpv3d16"
 TUNE_FEATURES_tune-armv7at-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
-TUNE_FEATURES_tune-armv7a-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}  vfpv3"
+TUNE_FEATURES_tune-armv7a-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7at-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
-TUNE_FEATURES_tune-armv7a-neon        = "${TUNE_FEATURES_tune-armv7a}  neon"
+TUNE_FEATURES_tune-armv7a-neon        = "${TUNE_FEATURES_tune-armv7a} neon"
 TUNE_FEATURES_tune-armv7at-neon       = "${TUNE_FEATURES_tune-armv7at} neon"
-TUNE_FEATURES_tune-armv7a-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon}  vfpv4"
+TUNE_FEATURES_tune-armv7a-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon} vfpv4"
 TUNE_FEATURES_tune-armv7at-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon} vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7at            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfpv3d16 armv7at2-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} armv7a-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfpv3 armv7at2-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-neon armv7at2-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} armv7a-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-neon-vfpv4 armv7at2-neon-vfpv4"
 
 # HF Tunes
@@ -53,25 +53,25 @@ ARMPKGARCH_tune-armv7ahf-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahf             = "${TUNE_FEATURES_tune-armv7a}             callconvention-hard"
-TUNE_FEATURES_tune-armv7athf            = "${TUNE_FEATURES_tune-armv7at}            callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}       callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf             = "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf            = "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon        = "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon       = "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfpv3d16 armv7at2hf-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  armv7ahf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} armv7ahf-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfpv3 armv7at2hf-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-neon armv7at2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-neon-vfpv4 armv7at2hf-neon-vfpv4"
 
 # Big Endian
@@ -86,25 +86,25 @@ ARMPKGARCH_tune-armv7ab-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon-vfpv4 ?= "armv7a"
-TUNE_FEATURES_tune-armv7ab             = "${TUNE_FEATURES_tune-armv7a}             bigendian"
-TUNE_FEATURES_tune-armv7atb            = "${TUNE_FEATURES_tune-armv7at}            bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7ab-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7atb-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7ab-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        bigendian"
-TUNE_FEATURES_tune-armv7atb-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       bigendian"
-TUNE_FEATURES_tune-armv7ab-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7ab             = "${TUNE_FEATURES_tune-armv7a} bigendian"
+TUNE_FEATURES_tune-armv7atb            = "${TUNE_FEATURES_tune-armv7at} bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7ab-neon        = "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
+TUNE_FEATURES_tune-armv7atb-neon       = "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
+TUNE_FEATURES_tune-armv7ab-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} bigendian"
 TUNE_FEATURES_tune-armv7atb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv3d16 armv7at2b-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  armv7ab-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfpv3 armv7at2b-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-neon armv7at2b-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon} armv7ab-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-neon-vfpv4 armv7at2b-neon-vfpv4"
 
 # Big Endian + HF
@@ -119,23 +119,23 @@ ARMPKGARCH_tune-armv7ahfb-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon-vfpv4  ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon-vfpv4 ?= "armv7a"
-TUNE_FEATURES_tune-armv7ahfb             = "${TUNE_FEATURES_tune-armv7ahf}             bigendian"
-TUNE_FEATURES_tune-armv7athfb            = "${TUNE_FEATURES_tune-armv7athf}            bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7athf-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7ahfb-vfpv3       = "${TUNE_FEATURES_tune-armv7ahf-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7athfb-vfpv3      = "${TUNE_FEATURES_tune-armv7athf-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7ahfb-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        bigendian"
-TUNE_FEATURES_tune-armv7athfb-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       bigendian"
-TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7ahfb             = "${TUNE_FEATURES_tune-armv7ahf} bigendian"
+TUNE_FEATURES_tune-armv7athfb            = "${TUNE_FEATURES_tune-armv7athf} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3       = "${TUNE_FEATURES_tune-armv7ahf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3      = "${TUNE_FEATURES_tune-armv7athf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} bigendian"
+TUNE_FEATURES_tune-armv7athfb-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} bigendian"
 TUNE_FEATURES_tune-armv7athfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfpv3d16 armv7at2hfb-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  armv7ahfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16} armv7ahfb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfpv3 armv7at2hfb-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-neon armv7at2hfb-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon} armv7ahfb-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-neon-vfpv4 armv7at2hfb-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index e13156c..42d8d04 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -21,23 +21,23 @@ ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?= "armv7ve"
 ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?= "armv7ve"
 TUNE_FEATURES_tune-armv7ve             = "arm armv7ve vfp"
 TUNE_FEATURES_tune-armv7vet            = "${TUNE_FEATURES_tune-armv7ve} thumb"
-TUNE_FEATURES_tune-armv7ve-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve}  vfpv3d16"
+TUNE_FEATURES_tune-armv7ve-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve} vfpv3d16"
 TUNE_FEATURES_tune-armv7vet-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
-TUNE_FEATURES_tune-armv7ve-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}  vfpv3"
+TUNE_FEATURES_tune-armv7ve-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7vet-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
-TUNE_FEATURES_tune-armv7ve-neon        = "${TUNE_FEATURES_tune-armv7ve}  neon"
+TUNE_FEATURES_tune-armv7ve-neon        = "${TUNE_FEATURES_tune-armv7ve} neon"
 TUNE_FEATURES_tune-armv7vet-neon       = "${TUNE_FEATURES_tune-armv7vet} neon"
-TUNE_FEATURES_tune-armv7ve-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon}  vfpv4"
+TUNE_FEATURES_tune-armv7ve-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon} vfpv4"
 TUNE_FEATURES_tune-armv7vet-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon} vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7ve armv7ve-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ve armv7ve-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ve armv7ve-vfp armv7vet2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv7ve-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16 armv7vet2-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16} armv7ve-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfpv3 armv7vet2-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv7ve-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-neon armv7vet2-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  armv7ve-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} armv7ve-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} armv7ve-neon-vfpv4 armv7vet2-neon-vfpv4"
 
 # HF Tunes
@@ -52,25 +52,25 @@ ARMPKGARCH_tune-armv7vehf-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?= "armv7ve"
-TUNE_FEATURES_tune-armv7vehf             = "${TUNE_FEATURES_tune-armv7ve}             callconvention-hard"
-TUNE_FEATURES_tune-armv7vethf            = "${TUNE_FEATURES_tune-armv7vet}            callconvention-hard"
-TUNE_FEATURES_tune-armv7vehf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    callconvention-hard"
-TUNE_FEATURES_tune-armv7vethf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   callconvention-hard"
-TUNE_FEATURES_tune-armv7vehf-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3}       callconvention-hard"
-TUNE_FEATURES_tune-armv7vethf-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3}      callconvention-hard"
-TUNE_FEATURES_tune-armv7vehf-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        callconvention-hard"
-TUNE_FEATURES_tune-armv7vethf-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       callconvention-hard"
-TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf             = "${TUNE_FEATURES_tune-armv7ve} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf            = "${TUNE_FEATURES_tune-armv7vet} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} callconvention-hard"
 TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7vehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7vehf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7vehf-vfp armv7vet2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16 armv7vet2hf-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16}  armv7vehf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16} armv7vehf-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3 armv7vet2hf-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-neon armv7vet2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  armv7vehf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} armv7vehf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4"
 
 # Big Endian
@@ -85,25 +85,25 @@ ARMPKGARCH_tune-armv7veb-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?= "armv7ve"
-TUNE_FEATURES_tune-armv7veb             = "${TUNE_FEATURES_tune-armv7ve}             bigendian"
-TUNE_FEATURES_tune-armv7vetb            = "${TUNE_FEATURES_tune-armv7vet}            bigendian"
-TUNE_FEATURES_tune-armv7veb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7vetb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7veb-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7vetb-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7veb-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        bigendian"
-TUNE_FEATURES_tune-armv7vetb-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       bigendian"
-TUNE_FEATURES_tune-armv7veb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7veb             = "${TUNE_FEATURES_tune-armv7ve} bigendian"
+TUNE_FEATURES_tune-armv7vetb            = "${TUNE_FEATURES_tune-armv7vet} bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7veb-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} bigendian"
+TUNE_FEATURES_tune-armv7vetb-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} bigendian"
+TUNE_FEATURES_tune-armv7veb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} bigendian"
 TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7veb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7veb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb            = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7veb-vfp armv7vet2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16 armv7vet2b-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16} armv7veb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3 armv7vet2b-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-neon armv7vet2b-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon}  armv7veb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon} armv7veb-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon} armv7veb-neon-vfpv4 armv7vet2b-neon-vfpv4"
 
 # Big Endian + HF
@@ -118,23 +118,23 @@ ARMPKGARCH_tune-armv7vehfb-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?= "armv7ve"
-TUNE_FEATURES_tune-armv7vehfb             = "${TUNE_FEATURES_tune-armv7vehf}             bigendian"
-TUNE_FEATURES_tune-armv7vethfb            = "${TUNE_FEATURES_tune-armv7vethf}            bigendian"
-TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16}    bigendian"
-TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16}   bigendian"
-TUNE_FEATURES_tune-armv7vehfb-vfpv3       = "${TUNE_FEATURES_tune-armv7vehf-vfpv3}       bigendian"
-TUNE_FEATURES_tune-armv7vethfb-vfpv3      = "${TUNE_FEATURES_tune-armv7vethf-vfpv3}      bigendian"
-TUNE_FEATURES_tune-armv7vehfb-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        bigendian"
-TUNE_FEATURES_tune-armv7vethfb-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       bigendian"
-TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7vehfb             = "${TUNE_FEATURES_tune-armv7vehf} bigendian"
+TUNE_FEATURES_tune-armv7vethfb            = "${TUNE_FEATURES_tune-armv7vethf} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3       = "${TUNE_FEATURES_tune-armv7vehf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3      = "${TUNE_FEATURES_tune-armv7vethf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} bigendian"
 TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7vehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7vehfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7vehfb-vfp armv7vet2hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16 armv7vet2hfb-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16}  armv7vehfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16} armv7vehfb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfpv3 armv7vet2hfb-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-neon armv7vet2hfb-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon}  armv7vehfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon} armv7vehfb-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon} armv7vehfb-neon-vfpv4 armv7vet2hfb-neon-vfpv4"
-- 
1.9.1


