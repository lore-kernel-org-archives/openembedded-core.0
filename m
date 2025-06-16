Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7280FC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 04:46:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.23284.1750049171688451681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 21:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mRixA5vp;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7426c44e014so3164625b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750049171; x=1750653971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80raAc3EpRlroMlTW9oFAT+PqviyGgs/q5p5ETSzc5E=;
        b=mRixA5vpMjs5LcK8vvaTJXVRopGnz8rGLnu0BYKFDCcjJClVMTTSd24gP0T0LIzyXt
         iw1NPSienYPhu5vwmgvS1GpFILcIraw6OnuA6w+9jrC51wHoOGhvy8p0Ag/mbCD0vPym
         XUmA0V0lbCLXnoTcLsPbyv4m6MBN4HbpSHH57u8I4Rm2paJ1Xji2L3zADzJ7R21cfdp4
         IZZBbOyqy+KJRMUsh6Q3DZ2y9HP7PicnLfMp/ADkApa8MTErdkzlRLaEEVh/sQBtQvXj
         w/ZKHYkYhzBq80VAZ9JRL0MHf7ATMGLRo6Kf+vu5L72zqug3JOsN+FWQJ6ED8p+RJi6c
         nhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750049171; x=1750653971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80raAc3EpRlroMlTW9oFAT+PqviyGgs/q5p5ETSzc5E=;
        b=X2AJNBtfrvkpNb51VbxAfUtOFAvoMKVU0XhvmaaOMN/GD1QGYAOgF9b97vuZtOzgIp
         c0/dhNvPcJiwPVxMFD9owXtjVaHR31L2F3jerdssGUsytfxIRcwK1fb5+yMlxKPsFQG0
         6pNb8l+rsS8n3aEOCBNvyRG+fYECYYMdBhP21Z6oEzcCjivBm8wHyi0KV/UuDJI2P/1w
         QteDFbdjwATUrOH6HkNfCPBcTNPFC9Iqk2goabzoG9Kk8pSu5qRj1Y9esSm8kq5XcaMQ
         bwhD3BXuVyJrFf73vXOL3jkr/LM+cfCDcJoHJL26bejKYxUzZJEy2nxwyj7nKsUPhULQ
         mlbw==
X-Gm-Message-State: AOJu0YxTD3LJDLq3stP93LopW6D3Cj9eSz+5syyYAZ34J4+QH1C5EUmJ
	xpdR93wg5xXHHR88DL1+yV5rUaIMwjQLEq/CR5/Mwr2XIjF9MNpouNhDJZS6Zg==
X-Gm-Gg: ASbGncsR3XBF0mqwd0wbv/jpmGXd3DwZfZn4HDO+Rl1yVqd4WMtUNKvdv1F29GKlqbW
	36NoYNuhJSASf48YM4ZKYVwDxvvid9X/3qOI+fN0w8XeiJB5kyxo2KsTx4DaYHoCp1FJVQTdY9F
	JkvJNCtPF7CwvqKO/uWTrMxfQGSkS43CNvohN3bLVXMIJJ61VzdzJw6GPQMQXZfTkE2tttGIsMz
	iwgIxikQC79mADW8AngNlrpVpJRxSF+rpoiqZklnSJqHLUk2i4ykxuATYyw65D2pAqrBzYDxkBR
	L9nJXrjZZv88LWa0SRqDtR+sxVowblJXDyNk7bohKrd59liWhkg9+uCKYHYaPc1cwScJIc0rWLX
	Sxnhoo8LP
X-Google-Smtp-Source: AGHT+IEQKniADX6k08aDYJAwZD6B0CPWg+XeVd9J3/rv81XYtvK5wVmI/3fWB5FG63x6Pg59wK5pfA==
X-Received: by 2002:a05:6a00:4646:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-7489cdedcfamr11169696b3a.3.1750049170875;
        Sun, 15 Jun 2025 21:46:10 -0700 (PDT)
Received: from L-15936L.kpit.com ([43.231.237.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900063ebsm5981187b3a.62.2025.06.15.21.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:46:10 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: virendra.thakur@kpit.com
Subject: [OE-core][scarthgap][PATCH] libpng: Add ptest
Date: Mon, 16 Jun 2025 10:16:04 +0530
Message-Id: <20250616044604.177410-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 04:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218765

Install libpng test-suite to run it as a ptest.
As the test-suite takes more than 30 seconds to run,
add libpng-ptest to PTESTS_SLOW in ptest-packagelists.inc

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest |  7 ++++
 .../libpng/libpng_1.6.42.bb                   | 42 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3387e19191..9950e46776 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -102,6 +102,7 @@ PTESTS_SLOW = "\
     libevent \
     libgcrypt \
     libmodule-build-perl \
+    libpng \
     lttng-tools \
     openssh \
     openssl \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
new file mode 100644
index 0000000000..85051a59f5
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+set -eux
+
+cd src
+
+make check-TESTS
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 673133bb4a..4c21e8d597 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -10,7 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
+           file://run-ptest \
+"
+
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
@@ -19,7 +22,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
@@ -30,4 +33,39 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
+RDEPENDS:${PN}-ptest += "make bash gawk"
+
+do_install_ptest() {
+    # Install test scripts to ptest path
+    install -d ${D}${PTEST_PATH}/src/tests
+    install -m 755 ${S}/tests/* ${D}${PTEST_PATH}/src/tests
+    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 755 ${S}/scripts/*.awk ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 644 ${S}/scripts/pnglib* ${S}/scripts/*.c ${S}/scripts/*.def ${S}/scripts/macro.lst ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 644 ${S}/scripts/pnglibconf.h.prebuilt ${D}${PTEST_PATH}/src/tests/scripts/pnglibconf.h
+    install -d ${D}${PTEST_PATH}/src/contrib/tools
+    install -m 755 ${S}/contrib/tools/*.sh ${D}${PTEST_PATH}/src/contrib/tools
+    install -m 644 ${S}/contrib/tools/*.c ${S}/contrib/tools/*.h ${D}${PTEST_PATH}/src/contrib/tools
+
+    # Install .libs directory binaries to ptest path
+    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pngstest ${B}/.libs/pngimage ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
+
+    # Copy png files to ptest path
+    cd ${S} && find contrib -name '*.png' | cpio -pd ${D}${PTEST_PATH}/src
+
+    # Install Makefile and png files
+    install -m 644 ${S}/pngtest.png ${D}${PTEST_PATH}/src
+    install -m 644 ${S}/*.png ${S}/*.h ${S}/*.c ${S}/*.dfa ${B}/pnglibconf.out ${S}/Makefile.am ${S}/Makefile.in ${D}${PTEST_PATH}/src/tests
+
+    sed -e 's/^abs_srcdir = ..*/abs_srcdir = \.\./'          \
+        -e 's/^top_srcdir = ..*/top_srcdir = \.\./'          \
+        -e 's/^srcdir = ..*/srcdir = \./'                    \
+        -e 's/^Makefile: ..*/Makefile: /'                    \
+        -e 's/check-TESTS: $(check_PROGRAMS)/check-TESTS:/g' \
+        ${B}/Makefile > ${D}${PTEST_PATH}/src/Makefile
+
+    sed -e 's|#!/bin/awk|#!/usr/bin/awk|g' -i ${D}${PTEST_PATH}/src/tests/scripts/*.awk
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


