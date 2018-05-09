Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4FBF75089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id n9-v6so23165713pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q+/KYeW1Dzw7V++BUU1meha0JXDuFNIF/nOxZY7iUNg=;
	b=WqEsDZE9t0FHHoNmYyaRs1L2sfEDMcsMD7eQXBKsWv3tz8q2Jl6yO7omkGAd2QE60f
	OtztWRA8ZBset2h6yQrBUGQeOWBiB5eRbCmfSwxYdFPNTIsqDR1wdbgznDc3edV/d1ai
	pw+GUUmbgkbEHSt+dlRRZNoO1nGFUpPbXpYKK8lggnbKUKSMtVjV40nh7WvUE25yiQ/H
	qEmgob037JfYi8vLIe9Ipu3G+WRyZ5GiVb0eK7ZhAaSraEshT4h+NyeU6/wcVqRfxhYQ
	9mdugx0ctBmC14cQTF95mGKE+0ompcLHCibnY052VsFNy6N8TQcE+Nzlmr781vorqXax
	MY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q+/KYeW1Dzw7V++BUU1meha0JXDuFNIF/nOxZY7iUNg=;
	b=SFujtUS0UYQYYbXDuEd9LiwQvIKqTcO8bfgzw/8QEdPCymUdEPmzIWqJgzHxLO/CxL
	RJbhv54ynB2abKg+bGDgWw/OSYfopMxayAH9mMW/9OJ0z6KSqS+wVevuibIWx0Xd2/U+
	mUIiN6iWcrbzmZu0TXRGXZ3hHF/60C9uQQNd075iXU1+nkS1e631paXdtd6zIaIZeEUu
	nEIDvH9FrQ2T48QuD81Q3TzCaKzF/xXxCpEBkq1c7dXveFvuBGQAtWt+rfklOhgiqmy7
	M4UAJNT0aDhRgm9UGDMn2KGbf45TyKLrEH9CM+yhe/opfdXSLZ1xHLf1Y+IvcKhCG0bX
	eM4Q==
X-Gm-Message-State: ALQs6tDGkbsf+Q2/6xYaCZmrtbmeJ9jN7s0PC5Us3yUQExhN7LYb2NC7
	jNnykL8UasX1ip7tQD1Z4Ei4zg==
X-Google-Smtp-Source: AB8JxZoIpvYQY1CeWUXOtp4AH3oLeaWI2Iu2aouyXshCnQMcsoaIzbzUp9kkPlRMswTOWKatwXlokg==
X-Received: by 2002:a63:aa48:: with SMTP id
	x8-v6mr35620866pgo.398.1525897467363; 
	Wed, 09 May 2018 13:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:15 -0700
Message-Id: <20180509202422.22501-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 2/9] alsa-tools: Update to 1.1.6
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
X-List-Received-Date: Wed, 09 May 2018 20:24:27 -0000

License-Update: FSF address updated in hdsploader/COPYING and ld10k1/COPYING.LIB

Fix built with clang along the way

Package python dependent tools into a separate package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...served-user-defined-literal-warnings.patch | 28 +++++++++++++
 .../alsa/alsa-tools/autotools.patch           | 42 ++++++++++++-------
 ...lsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} | 25 ++++++++---
 3 files changed, 75 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} (62%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
new file mode 100644
index 0000000000..2290915eab
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
@@ -0,0 +1,28 @@
+From 2e48e4045e1e951433da0ca4b1e49798eedde14f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Apr 2018 12:21:18 -0700
+Subject: [PATCH] Fix clang -Wreserved-user-defined-literal warnings
+
+| us428control.cc:66:18: error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
+|         printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
+|                         ^
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10360805/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ us428control/us428control.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/us428control/us428control.cc b/us428control/us428control.cc
+index e839bf4..8cb3c42 100644
+--- a/us428control/us428control.cc
++++ b/us428control/us428control.cc
+@@ -63,7 +63,7 @@ static void usage(void)
+ {
+ 	printf("Tascam US-428 Control\n");
+ 	printf("version %s\n", VERSION);
+-	printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
++	printf("usage: " PROGNAME " [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
+ 	printf("mode is one of (us224, us428, mixxx)\n");
+ }
+ /*
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 2e74963c89..c85834a593 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -1,3 +1,8 @@
+From b9a65bf3ba5628cfe8cfd2d10ce2dcf11a606775 Mon Sep 17 00:00:00 2001
+From: Dongxiao Xu <dongxiao.xu@intel.com>
+Date: Thu, 14 Jul 2011 15:40:36 +0800
+Subject: [PATCH] alsa-tools: Fix recipe build error.
+
 Add parameters to autoreconf to support cross compile.
 Remove some sub-components which needs further recipe support.
 
@@ -5,22 +10,17 @@ Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
 Upstream-Status: Inappropriate [configuration]
 
-diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1/gitcompile
---- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile	2011-07-06 11:27:40.227665002 +0800
-+++ alsa-tools-1.0.24.1/ld10k1/gitcompile	2011-07-14 13:26:18.017665004 +0800
-@@ -1,6 +1,6 @@
- #!/bin/bash
- 
--autoreconf -fi || exit 1
-+autoreconf $ACLOCAL_FLAGS -fi || exit 1
- export CFLAGS='-O2 -Wall -pipe -g'
- echo "CFLAGS=$CFLAGS"
- echo "./configure $@"
-diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
---- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
-+++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
+---
+ Makefile          | 4 ++--
+ ld10k1/gitcompile | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c32bf25..1119372 100644
+--- a/Makefile
++++ b/Makefile
 @@ -1,8 +1,8 @@
- VERSION = 1.1.5
+ VERSION = 1.1.6
  TOP = .
 -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
 +SUBDIRS = as10k1 envy24control \
@@ -30,3 +30,15 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
  	  hwmixvolume hdajackretask hda-verb hdajacksensetest
  
  all:
+diff --git a/ld10k1/gitcompile b/ld10k1/gitcompile
+index 99429ac..20005d9 100755
+--- a/ld10k1/gitcompile
++++ b/ld10k1/gitcompile
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ 
+-autoreconf -fi || exit 1
++autoreconf $ACLOCAL_FLAGS -fi || exit 1
+ export CFLAGS='-O2 -Wall -pipe -g'
+ echo "CFLAGS=$CFLAGS"
+ echo "./configure $@"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
similarity index 62%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
index 1be43aa6e7..e065eec6b8 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
@@ -5,17 +5,19 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
+                    "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://autotools.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
            file://gitcompile_hdajacksensetest \
+           file://0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch \
            "
 
-SRC_URI[md5sum] = "3afb92eb1b4f2edc8691498e57c3ec78"
-SRC_URI[sha256sum] = "bc3c6567de835223ee7d69487b8c22fb395a2e8c613341b0c96e6a5f6a2bd534"
+SRC_URI[md5sum] = "5ca8c9437ae779997cd62fb2815fef19"
+SRC_URI[sha256sum] = "d69c4dc2fb641a974d9903e9eb78c94cb0c7ac6c45bae664f0c9d6c0a1593227"
 
 inherit autotools-brokensep pkgconfig
 
@@ -37,4 +39,17 @@ do_compile_prepend () {
     cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitcompile
 }
 
-FILES_${PN} += "${datadir}/ld10k1"
+do_install_append() {
+    sed -i -e "s|/usr/bin/python2|/usr/bin/env python2|g" ${D}${bindir}/hwmixvolume
+}
+
+PACKAGES =+ "${PN}-hwmixvolume"
+
+FILES_${PN}-hwmixvolume = "${bindir}/hwmixvolume"
+
+FILES_${PN} += "${datadir}/ld10k1 \
+                ${datadir}/icons/hicolor \
+               "
+
+RDEPENDS_${PN}-hwmixvolume += "python"
+
-- 
2.17.0


