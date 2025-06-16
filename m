Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C01C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 04:52:51 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.23330.1750049563264991047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 21:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=diCBltWP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234f17910d8so36678575ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750049562; x=1750654362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cURX+89VOdk7jgglMTy1mz4LH36B7/MNMFDg+SMVQOs=;
        b=diCBltWPN2VvmqjM1wQxqoysVt6HKhOf3q1Y4hzoMjUulJa4V3ayNoXgvgWMolJAS/
         ljicvDbQIYkr+sgcEGtymhOJneir46VXa+lbjBkrimtVvy3Pd8dMEUJpaWov1BtaZaV6
         7D8hgFLIBnI2LxLx7uDEpDPBspojsVkjFDdPL6g2HBDrVwxSky2IdMhcja+CglKd+E1V
         SwwwytMuuzTr/KcKSLV+ky0qpBGyrIl1fRX8+i86CutvE+VB0M4INYSYkynNHgOZtpLq
         w+jAhnsOPfZnuLbbPADbT7gIko8FqgfuV0/fMQ4C9/JGwar+uf6LOQO7oUKd5KjCkmIW
         Og7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750049562; x=1750654362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cURX+89VOdk7jgglMTy1mz4LH36B7/MNMFDg+SMVQOs=;
        b=wiCLH5pB3QVRKVbvWSbPdfD2vv8EieXC274iM4QUEimY2GXn5lqWamzQ3QbvuJBGQw
         mQ06IUx6b3hQrF7Mksz7UWylKoSvfBHTFq4SQ/qxBJIScnMvTrGnaUW/hm1I3zm3Ni/Q
         +rr8nMmqRfXrJxeMd+XjRYczfdbGx6uP4xnP3JU7nutr9UdB/Id0PrnCtX2QRQcGu+wd
         sQ8yMrHB0E5V4jlY8OysC59lWArIOVe3SDWDgOugdT8Dy1aVAq5raExh7r9LRo0SP2Iy
         m+GddLuAYxYXIWwXduruqhtk4JW+Rdvn1IMpYtz0Yi8v54gXIiFXnPW8ogAaXUuMYBwF
         8IjQ==
X-Gm-Message-State: AOJu0YzMUR7Raz1+SsgrPrACcHGOG0Pz4PoVA7bO2yCNRz3mZAFIhAdQ
	YHc4yUxZKXSOQdRSjQ7HMKmcZ1AcjY/mElXU8N1eKijVVXIwcBKaqJ1ixhxQrw==
X-Gm-Gg: ASbGncul7M5O3c6yve25bbwB+AB7k1bGkL3vNEzVpJpWXXgdpvyV8vwH9zWe7O1scP5
	Y1Ebc5fFKKKjxrg8qYaINFtz+noylubeS6s3qX/2d6A04LMCrkcfefrwQVCwTKuoWnrZXHq3ZaY
	kPH2UEcRHDL+Smmh8aWC3JkVunL6VIKjVSVoMj7u1Hl4XJeV70YTZf+vrVY9cVR6KGNK1A9JA0x
	KRn3+/E8LUo0uUXMx7LXr1yylylEJtoVuEiluk220BCPY7YI14o+QxYrLWy8objIR8FcKq6AdHw
	m+US5ErLwOKGtCP0FaqsL/rXMNPotPqGdMUBxSLzRgpCvA+g4CGoR2NLubNDk8SpdVRwT0Qy+A=
	=
X-Google-Smtp-Source: AGHT+IGoaTEPWbPixO9JtLUr7DjBDp1jwYYWB/uDma03ekDbv1mY09QGfRXy3WAEhBS1BRY2w6eT6Q==
X-Received: by 2002:a17:902:da2d:b0:235:2375:7ead with SMTP id d9443c01a7336-2366b14d317mr125723335ad.28.1750049562440;
        Sun, 15 Jun 2025 21:52:42 -0700 (PDT)
Received: from L-15936L.kpit.com ([43.231.237.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8ccbsm52049785ad.167.2025.06.15.21.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:52:42 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: virendra.thakur@kpit.com
Subject: [OE-core][kirkstone][PATCH] libpng: Improve ptest
Date: Mon, 16 Jun 2025 10:22:36 +0530
Message-Id: <20250616045236.253202-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 04:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218766

Install libpng test-suite to run it as a ptest.
As the test-suite takes more than 30 seconds to run,
add libpng-ptest to PTESTS_SLOW in ptest-packagelists.inc

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../recipes-multimedia/libpng/files/run-ptest | 26 +----------
 .../libpng/libpng_1.6.39.bb                   | 43 +++++++++++++++----
 3 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..53c023bb81 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,7 +29,6 @@ PTESTS_FAST = "\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
-    libpng-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
@@ -88,6 +87,7 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
+    libpng-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
index 9ab5d0c1f4..85051a59f5 100644
--- a/meta/recipes-multimedia/libpng/files/run-ptest
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -2,28 +2,6 @@
 
 set -eux
 
-./pngfix pngtest.png &> log.txt  2>&1
+cd src
 
-if grep -i "OK" log.txt 2>&1 ; then
-   echo "PASS: pngfix passed"
-else
-   echo "FAIL: pngfix failed"
-fi
-rm -f log.txt
-
-./pngtest pngtest.png &> log.txt 2>&1
-
-if grep -i "PASS" log.txt 2>&1 ; then
-   echo "PASS: pngtest passed"
-else
-   echo "FAIL: pngtest failed"
-fi
-rm -f log.txt
-
-for i in pngstest timepng; do
-    if "./${i}" pngtest.png 2>&1; then
-        echo "PASS: $i"
-    else
-        echo "FAIL: $i"
-    fi
-done
+make check-TESTS
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 94db1d3f6b..011eec94a2 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -13,7 +13,7 @@ LIBV = "16"
 SRC_URI = "\
            ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
-           "
+"
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
 
@@ -32,15 +32,42 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
-BBCLASSEXTEND = "native nativesdk"
-
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
 CVE_CHECK_IGNORE += "CVE-2019-17371"
 
+RDEPENDS:${PN}-ptest += "make bash gawk"
+
 do_install_ptest() {
-    install -m644 "${S}/pngtest.png" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngfix" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngtest" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngstest" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/timepng" "${D}${PTEST_PATH}"
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
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


