Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.53383.1600052935804616562
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 20:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id 942FE22027A;
	Mon, 14 Sep 2020 15:08:52 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH v2] tcmode-default: Drop gcc-cross-initial, gcc-crosssdk-initial references
Date: Mon, 14 Sep 2020 15:08:49 +1200
Message-Id: <20200914030849.15681-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFimOt4qqUBom3vGpgdquC61oao4gppraibinztAzY8FUB0vsA@mail.gmail.com>
References: <CAFimOt4qqUBom3vGpgdquC61oao4gppraibinztAzY8FUB0vsA@mail.gmail.com>

Further to 5b2fd1c724

Also a few remaining references in comments and in distro_alias.inc

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/conf/distro/include/distro_alias.inc   | 4 ----
 meta/conf/distro/include/tcmode-default.inc | 2 --
 meta/conf/layer.conf                        | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 56055f7798..b4dfcfc5f5 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -81,10 +81,6 @@ DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodi
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
 DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util Debian=xfonts-utils"
 DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-cross-initial-i586 = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
-DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial-x86_64 = "OE-Core"
 DISTRO_PN_ALIAS_pn-gccmakedep = "Mandriva=gccmakedep Ubuntu=xutils-dev"
 DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
 DISTRO_PN_ALIAS_pn-gcc-sanitizers = "Ubuntu=gcc Fedora=gcc"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1bc95ec675..50e8a20f35 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -30,9 +30,7 @@ LLVMVERSION ?= "10.0.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 1a01d02fef..38df0f3aff 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -91,7 +91,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 # dependency incidentally. This improves determinism and avoids build
 # failures when people switch to external toolchains.
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
-# Nothing needs to depend on libc-initial/gcc-cross-initial
+# Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->.*-initial.* \
-- 
2.17.1

