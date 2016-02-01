Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id CDAFA771A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:42:15 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k206so99052691oia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J/WmfnpvYDWepOx6IIUtIQzaooWVACJ4HE4avnUIdeg=;
	b=C8ZVStuQTvO713Sm6kn2ROUgZiBw542W8pthPD5tR4yLl05/uaaw4oTXbPTjtvOA3q
	N5P5ALd0aPNkoqnJvMcrrskENaeqQXj7FYCiwoLvWCkse/juc2s+01i3euWBkCT6nBwr
	ekYFBjet6y3jUaMN2qrVCa9/kHonGZv+0mC+JmbmUFNGwRxQHVI0FG1BO63wAbwKqINk
	Yu7u4kKQpYqC7m50+FVQemBg0R/9tf1ZVXdmUFdeLJCvg8kTS4F6opw0VYyeQs0cU0yW
	hTZIw54Bhza6b1IdvhG6RH7DuaSpgIV/dWQTG703hCbbJ5xF3JvFEUZpJc/iH8WzCAuk
	1syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J/WmfnpvYDWepOx6IIUtIQzaooWVACJ4HE4avnUIdeg=;
	b=K/kkfjnsZrKIlzlZ5PjxKj08dN5ZgqHHyWsnYtGbIxGQvjtSElHavwcou+NqAiqQoO
	C+o+/ppTCcceEHrw9T/NIMvkQKtuWVm9o5KksEIp03gpaR6OFOtPCHhZF29Brl/2vmnv
	tzfBZDFsTbbUS7FwLSBDdcJQnS8bMcyjUr+AOEa0gtuc3epwyrFFZI1/inrGayqkgc/v
	b/jHYhkuO41TaqWBVu8ib8ru1g5EAUafTykFPyocPA/XaY1zU2kzaGYNAgpVmtRB622z
	iEOxWrVmdVwrDUCvjDjFNoOB2y8F/hutMshzYkxxbu3XdREa2zZz8x+MA8cakNjrSiF7
	UJ7w==
X-Gm-Message-State: AG10YORk1/vT+J0CBKfs2SYltLC5hRraKtSgTztdH+QsHSIMwDSAK3VYorpZ3c4tgz5+Tg==
X-Received: by 10.202.225.193 with SMTP id y184mr19468240oig.9.1454362936166; 
	Mon, 01 Feb 2016 13:42:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	k204sm15962996oia.7.2016.02.01.13.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 13:42:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 13:42:08 -0800
Message-Id: <1454362928-13290-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] machine/include: drop tune-cortexm*.inc and tune-cortexr4.inc
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
X-List-Received-Date: Mon, 01 Feb 2016 21:42:18 -0000

The Cortex M1, M3 and R4 CPU tuning files are poorly tested (if at
all). They have no obvious users either inside or outside oe-core.

Until OE officially gains support for CPUs without an MMU, these
tuning files are probably better maintained outside of oe-core (e.g.
in a separate meta-nommu layer).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-cortexm1.inc        | 11 -----------
 meta/conf/machine/include/tune-cortexm3.inc        | 15 ---------------
 meta/conf/machine/include/tune-cortexr4.inc        | 15 ---------------
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  2 --
 4 files changed, 43 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-cortexm1.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexm3.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexr4.inc

diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
deleted file mode 100644
index 8d882d4..0000000
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DEFAULTTUNE ?= "armv7a"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
-
-AVAILTUNES += "cortexm1"
-ARMPKGARCH_tune-cortexm1 = "cortexm1"
-TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} cortexm1"
-PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexm1-vfp"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
deleted file mode 100644
index 62280c4..0000000
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "cortexm3"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
-
-TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '' ,d)}"
-
-AVAILTUNES += "cortexm3"
-ARMPKGARCH_tune-cortexm3 = "armv7m"
-TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
-PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
deleted file mode 100644
index 5ef37c6..0000000
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "cortexr4"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
-
-TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 'armv7r:', '' ,d)}"
-
-AVAILTUNES += "cortexr4"
-ARMPKGARCH_tune-cortexr4 = "armv7r"
-TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4 arm thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp armv7rt2-vfp"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 84e971a..85e69db 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -72,8 +72,6 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64 --with-arch-64=mips64 --with-t
 # features used in OE.
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
-EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
-EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
 EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
 
 EXTRA_OECONF_GCC_FLOAT ??= ""
-- 
1.9.1


