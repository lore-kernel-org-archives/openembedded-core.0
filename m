Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA826EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:20:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.36940.1688988003008872243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TFfdm0o6;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6687466137bso2679519b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688988002; x=1691580002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9eBlILiUCCoqm8qKXAuA1r0JiGcMUGFimCug6xcP0I=;
        b=TFfdm0o6ugFkArj9QMbbutxB/h70U9l8k7K//ZodboTCk+JN9sfT4Mg4J89+kfoYWF
         9/VBZKjSRKWUg3Dgo1sCXWT+AK3o5CazpboZlDeLu5oCI34pl26jI7YDyxe8qU9LyK1S
         23aWH8Lx1I5w3lac7zmR+YwNygxrjyrNMiL8yhjvJxIYDU7iIYX6TyqS/bDnNATyMaWI
         ehUf5r7iL0qIf3k8gCLNMY8kMUQG8ni2Oc9CKesmjjjruVbG8Wa1ihTZlkQlfKBoBzR2
         nheeuwwQRrFszl2oyl1n6KsdwuGGGvNJEytlhR81V07wYIc4JYPsiIiykpsgFa8jPPrj
         yE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688988002; x=1691580002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9eBlILiUCCoqm8qKXAuA1r0JiGcMUGFimCug6xcP0I=;
        b=czA6i7oDqu/rFw/cBVDILU+zQZNd1Cr2H2RLdVgMeZO0tYGcaxVuQWuG6mSlznE9XM
         f1i68VIr5QBNNEVfExMikHKnofz9nlAKkNekpcHnqBtMS63UyqVeMySI4ehBWzQ1gznj
         SCsvYbvyElUsvsMDkNMwydr9ZCCFKtPSh2Pxm97Rhxy7MlMq//f5hlK7PCY56vQdomHm
         cJYc1E/lU7wlA+LJcAFPZj8/FnrIubgBIyICsRqt99kMZJbDSUr85ol6+Y/aC7n+bt+d
         2U95Vb4Z8mCrfg7EsoJx3U+I+jbMjbdF4MUKIgQliaw17yYYPFkryd9PTZyggzxmRhpg
         vGLw==
X-Gm-Message-State: ABy/qLZFNm+cv9KXCMYHkF8KFD4ooDRoTLXO07H49uw292Ubukt3p4pY
	CrMr7mvZ219Xywb1yj3PJDD8PV2rdy8G1Pg=
X-Google-Smtp-Source: APBJJlGF8DS3NxDeojxRQ7GV3JOBiJCebADGpHRuXudibazZo8K1w3KPjhE6cRCzI87hUbFZ8hThtg==
X-Received: by 2002:a05:6a00:1acd:b0:678:5629:fd43 with SMTP id f13-20020a056a001acd00b006785629fd43mr11403863pfv.9.1688988002004;
        Mon, 10 Jul 2023 04:20:02 -0700 (PDT)
Received: from localhost.localdomain ([103.171.59.16])
        by smtp.gmail.com with ESMTPSA id v2-20020a62a502000000b0064d47cd116esm6890527pfm.161.2023.07.10.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 04:20:01 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libpng: Add ptest for libpng
Date: Mon, 10 Jul 2023 16:49:47 +0530
Message-Id: <20230710111947.324155-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184071

libpng is a platform-independent library which
supports all PNG features.
This ptest executes the below binaries, parses
the png image and prints the image features.

1. pngfix - provides information about PNG image
copyrights details.

2. pngtest - tests, optimizes and optionally fixes
the zlib header in PNG files.

3. pngstest - verifies the integrity of PNG image by
dumping chunk level information.

4. timepng - provides details about PNG image chunks.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest | 29 +++++++++++++++++++
 .../libpng/libpng_1.6.37.bb                   | 15 ++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index badfd69325..3fb7ec2657 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -26,6 +26,7 @@ PTESTS_FAST = "\
     liberror-perl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
+    libpng-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
     liburi-perl-ptest \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
new file mode 100644
index 0000000000..9ab5d0c1f4
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+set -eux
+
+./pngfix pngtest.png &> log.txt  2>&1
+
+if grep -i "OK" log.txt 2>&1 ; then
+   echo "PASS: pngfix passed"
+else
+   echo "FAIL: pngfix failed"
+fi
+rm -f log.txt
+
+./pngtest pngtest.png &> log.txt 2>&1
+
+if grep -i "PASS" log.txt 2>&1 ; then
+   echo "PASS: pngtest passed"
+else
+   echo "FAIL: pngtest failed"
+fi
+rm -f log.txt
+
+for i in pngstest timepng; do
+    if "./${i}" pngtest.png 2>&1; then
+        echo "PASS: $i"
+    else
+        echo "FAIL: $i"
+    fi
+done
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 3c46fa3302..9387fc8e2e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -10,7 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "\
+           ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://run-ptest \
+           "
 SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
 SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
@@ -20,7 +23,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
@@ -33,3 +36,11 @@ BBCLASSEXTEND = "native nativesdk"
 
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
 CVE_CHECK_WHITELIST += "CVE-2019-17371"
+
+do_install_ptest() {
+    install -m644 "${S}/pngtest.png" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngfix" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngtest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngstest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/timepng" "${D}${PTEST_PATH}"
+}
-- 
2.25.1


