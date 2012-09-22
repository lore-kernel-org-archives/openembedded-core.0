Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT8f-0002pz-K1
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:05:09 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1309035wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RVgrgytFyXRXTmljd6tDRyoSy/8RdJooJL5pklNgKv4=;
	b=MHbnUNE0cMcmG6NvGjbV8HAViS0Um/JEYaCq8jfiGmYYIhg9tG9py4RWF8JX6okmH2
	1+sM+LhlKsN4PYSHUJI2koYdbSctRsPSIUQ1LUNBS0jQnmn/OAxnG6MKVE/kwanqGj9b
	fdtpRvlXJR57C5XaiCiZX9+O2ykjqslchWAXfEuH8a8mcCJMO2fQchUexcACNbSm6Pz3
	SxIBgg1T1iQWZ7SHJfeLd3v/sqeLn00uHGrsBUU/H30DBZxsmSii13zwjahm7Gy9J1Nd
	aFgeRsJcKZ9RG8+T+2oLOzoVNAMCPhkHzDObcyhbhq2yS4m0H8Wemk+JxdcXQQHcuVUl
	7vhA==
Received: by 10.180.93.8 with SMTP id cq8mr3879497wib.16.1348332746575;
	Sat, 22 Sep 2012 09:52:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm4521409wiz.1.2012.09.22.09.52.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:52:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:17 +0200
Message-Id: <0475b03992f47550314f12194a70bec8147380be.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [RFC 5/5] tune-xscale, tune-arm926ejs: drop ARMPKGSFX_CPU, change ARMPKGARCH instead
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
X-List-Received-Date: Sat, 22 Sep 2012 17:05:09 -0000

* xscale will be prefix not suffix, but also we need to show other flags
  like thumb/dsp/fpu/eabi/endian

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/README         | 5 +----
 meta/conf/machine/include/arm/arch-arm.inc   | 4 +---
 meta/conf/machine/include/tune-arm926ejs.inc | 4 ++--
 meta/conf/machine/include/tune-xscale.inc    | 6 +++---
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index 7e52902..a1beb75 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -16,7 +16,7 @@ default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
 
 TUNE_PKGARCH is defined as:
-${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}${ARMPKGSFX_CPU}
+${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}
 
 ARMPKGARCH - This is the core package arch component specified by each 
 tuning.  This is the primary identifier of a tuning.  Usual values are:
@@ -38,6 +38,3 @@ the core arch-arm.inc file.
 
 ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates 
 specific FPU optimizations.  'vfp' and 'neon' are both defined.
-
-ARMPKGSFX_CPU - This is the CPU specific suffix.  The suffix indicates
-that specific CPU optimizations were used.
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 6f22c94..da51044 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -4,14 +4,12 @@ TUNEVALID[bigendian] = "Enable big-endian mode."
 ARMPKGARCH ??= "arm"
 ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "", d)}"
 ARMPKGSFX_FPU ??= ""
-ARMPKGSFX_CPU ??= ""
-ARMPKGSFX_CPU[vardepvalue] = "${ARMPKGSFX_CPU}"
 ARMPKGSFX_DSP ??= ""
 ARMPKGSFX_EABI ??= ""
 ARMPKGSFX_THUMB ??= ""
 
 TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
-TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}${ARMPKGSFX_CPU}"
+TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 
 ABIEXTENSION = "eabi"
 
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 4406b3c..f50c22d 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "armv5te"
 OPTDEFAULTTUNE ?= "arm926ejs"
-ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-arm926ejs", "", d)}"
+ARMPKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "arm926ejs-", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
@@ -9,4 +9,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm92
 
 AVAILTUNES += "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv5te-arm926ejs"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejs-te"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index a04a5e1..e17f321 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "armv5te"
 OPTDEFAULTTUNE ?= "xscale"
-ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-xscale", "", d)}"
+ARMPKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "xscale-", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
@@ -9,11 +9,11 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale",
 
 AVAILTUNES += "xscale"
 TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
-PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv5te-xscale"
+PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} xscale-te"
 
 AVAILTUNES += "xscale-be"
 TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
-PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv5teb-xscale"
+PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} xscale-teb"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-- 
1.7.12



