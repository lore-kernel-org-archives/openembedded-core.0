Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69462C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 04:37:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.23213.1750048626582113086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 21:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfSAsWij;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2f603b0f0dso3827318a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750048626; x=1750653426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8XFICh0UiAPKywsc65EarrQuDO/NPk6gpNUNjPt3hE=;
        b=UfSAsWijxDpzSnM4YNISox75ZKzygVuQ6IRyUAN9+3AMiPQqcyCWTzx1FmB/sxCDpO
         huMFZS3npwAWCVJHq0XFK4HZSbvEeYb0voqr5n/Q5nAVCSLKpVNusQcQn7yRdSs62S4n
         YQYMb+CwoFBPPxVF4RxvvE6suDF212/bhiLf/q24PxHGc3PdDSYweTYqrbzSuQQDadtv
         JIDLDe7VduOfC3JWZ+jRabdCuQ6CDIKTppaZqW6B5/jpAYXX+CqzdLU7Uyyu3hnZSgQ1
         NxTD5FE/TVJ/RCPmzmhrMvScyCKgkf+kxEymAAwcats/kcjbzRr2pg9XPU9WIg4XpCKN
         KYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750048626; x=1750653426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8XFICh0UiAPKywsc65EarrQuDO/NPk6gpNUNjPt3hE=;
        b=hot8jjvHyQfdGVqwN5Es52RyNeR/zqtavv05wSQ9XCLT01s1WNwbLvg/BDoXyfmy8/
         YKsiByEjbK8fk+5dVt1jIujdMqzbYAXfL+4IdIJDI3jXmryhgs2u9DLkbBjjS1Z9xLla
         S8y1oqB7Sn1PELcQivlOko4dppl4ihm6TbpRWkkHZQS0fjE9cy+zqYExBL9rxYQE2nK+
         njznsA1sJg8tkmHLSEOf131m9CBNsVAeHXJfpOGkMcjxZUkMjBhvD6jQNDWpKPBNZWwa
         XLBJnUWPhjgQTneJrgJ7SECpU+IwAhrs7SXKBFWPwzHZvrLAvN405Y/Xy3HjccWBg+IK
         OqSw==
X-Gm-Message-State: AOJu0YwJ/FmkGbse68FhWX5Zl2dUBRGdSFrMxy9D3pil2Y2ZGg+mHme0
	YNGQlCa5cJN3X+Jrc7oAURwtPOCnhKbMXN+KAOPej08yK9DXrsDTaZWyU5UPBA==
X-Gm-Gg: ASbGnctDzDrRE4Jf65RL5TLevNknP3RowjGEdCQPjiaHyCTV0YyLu0yMZNtwCvbnKyW
	cLBlAGSzIpxFwMpkavx/NZt24hDSXbXvBjFd4Gy2AgjUrDgaS7n0PSvNKyIY0nZGmlGQiBp1l6N
	wCsX9pQEIBPToexH68kjyOp8FR0PeC2QKDobefDG30p17K82HBiHFhWsnwe6DECmSjQrQlbGfi3
	6rouadPBmCUWrcTuES/2AkAmmEoHDuFsbGq7u4AW47LRrFesuC9AJ7n0KSuyU+rDdio+KXKwLW0
	+0ataTYvBxuCvHjiHg70GrL0NoyycVVGcxqbnPw8IG21wvJ7Lon9YPVH1q41V3Tff8wH4LoBXJm
	FSCGKEAWK
X-Google-Smtp-Source: AGHT+IG5MpFBT/8/HiNqXOJ/yc5UsdjmbAfxE1tNqiQIItBCmVThVfHNr24+HtgMHOZsmArNsR+pNg==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr10568486a91.23.1750048625478;
        Sun, 15 Jun 2025 21:37:05 -0700 (PDT)
Received: from L-15936L.kpit.com ([43.231.237.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5fd94sm8539633a91.36.2025.06.15.21.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:37:05 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: poonam.jadhav@kpit.com,
	virendra.thakur@kpit.com
Subject: [OE-core][master][PATCH] libpng: Add ptest
Date: Mon, 16 Jun 2025 10:06:57 +0530
Message-Id: <20250616043657.75302-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 04:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218764

Install libpng test-suite to run it as a ptest.
As the test-suite takes more than 30 seconds to run,
add libpng-ptest to PTESTS_SLOW in ptest-packagelists.inc

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest |  7 ++++
 .../libpng/libpng_1.6.48.bb                   | 42 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9cd7928154..e06731ece7 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -108,6 +108,7 @@ PTESTS_SLOW = "\
     libevent \
     libgcrypt \
     libmodule-build-perl \
+    libpng \
     libseccomp \
     lttng-tools \
     lz4 \
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
index 338891c683..e603df1edd 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
@@ -10,7 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://run-ptest \
+"
+
 SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
 
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
+    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
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


