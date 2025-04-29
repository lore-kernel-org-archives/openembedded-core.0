Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32304C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 07:32:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.12167.1745911937136250636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 00:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFTjPmn6;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: semc.2042@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af52a624283so4929561a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745911936; x=1746516736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRGbOVvYbAABf4t4IIVFvCDrHWJ7H8n2aNSFDBv85uQ=;
        b=YFTjPmn67+ukAdHun9exONpRmazR4yh/NOSWaluI0onTa4GK/P4Lqvs1gqev8Z/tsE
         p98LGb2//w/V+csP0a4BZ5jh/tFoQnbX4pjA2tCK/dc0WA5zucLktEM6PrCGkMZCeZSb
         v/ZxxxrUFVwnecZFx/yJMB0HL5rvPRWxm3Av7/vR0KDKt8qJOrxTr8/2tg8Q/BRnax/X
         hX7VrnqRVQBKOBnAiRr6/geEyHIiK9KJtB+O3AUj52lMq8R17KcGo2S61xnG1TCDSM9A
         ipeKyGB4QSUDU5maheaF0KoPFN2j0EjzTZA2zhkFoR8v7Fpf3ZX5ITCrd5Tnmw0Gz6XD
         +lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745911936; x=1746516736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRGbOVvYbAABf4t4IIVFvCDrHWJ7H8n2aNSFDBv85uQ=;
        b=X3TBFGFIxFL45YDF2V+hEg2tc/k1Jb7s3XtagBv+/7FFmsey8SxvsNnVav9lW2MgXt
         4fWpC+FvbpYJVilDJZKbR0+yUp7D1rZR3raXB9sj5VYH3P2gLClwoRFsCGtmx8UeCMl4
         8/IgRC3+oTSaa72qIBJnGE7CmxkWBnq19EJBtIfWI7RBunVUtxCjo/bxds/ybLKYyJjh
         7Cg3vxPXNefGmzq1m9mJQrqJk65d3iCqQuypl02sxUn8gK0Ms4mf2gWMxME51ffmzxdi
         6AuMbpxnxcjAs16LgHpd63d9fLfX3T6YXmfyZ1mjPF5quoVas8/O1inWI3gF0OshXQtl
         GQOA==
X-Gm-Message-State: AOJu0YwEogUpnADPD5J+efZl4PJjPLyN10/yZP/ym2qtp7Ta4wsnXwY8
	c0fidH4guZCJABqTwnjMz6M8niMXTChWwwO0Eptn15Jy84dFhoHo5YAMEA==
X-Gm-Gg: ASbGncvJoJmI81lrum7eHkHUrGjMXiYbxojK9V24gogJV80YC4Rp/EAReJM8H9SGbs3
	tZbiKA0dU5BMwVDmAULq+H7ZFqnraVsFx/IbSO7QegiCft3qkWY0x0HELzlVcGERkPhWZjvIaj1
	URetb92UHQdWm6W/WZblDiDAU2oNWStqJDKj9BFLIpzNncZf0LeGERfdEvx/+QGQbcF+WPwJ0KY
	kxwkbz29RL/GULD8UWD4Nj2fvVfST4ywJzEe0r5vjCSDGdgXWwQPH1O+b79CgTjMV0iXedmp4kV
	GDeLkr5sr5/4cEmFiCFxqRi49uBrnWmgUZ3ooARRuCLUbtj/nfDezo43SQ==
X-Google-Smtp-Source: AGHT+IFPEK78QyM6Fkjcm4jg6T9I+BZzqO70mZV5wFFNaLdOOzelB4hwAbGY4UIEXIp+eOERBlh3BQ==
X-Received: by 2002:a17:90b:1cc4:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-30a224aed34mr3119233a91.14.1745911936132;
        Tue, 29 Apr 2025 00:32:16 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.195.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f27e22dasm9750456a91.17.2025.04.29.00.32.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:32:15 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe
Date: Tue, 29 Apr 2025 13:02:12 +0530
Message-Id: <20250429073212.812860-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <https://lists.openembedded.org/g/openembedded-core/message/215437>
References: <https://lists.openembedded.org/g/openembedded-core/message/215437>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 07:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215651

This recipe takes longer time >20min when bitbake for package
write stage. When cross-verified for longer time duration, found
that do_check() stage taking 20min while other stages completes
before 6min.

This recipe gives only below two test binaries in the packages to
test (ptest: glibc-y2038-tests):
     io/ftwtest
     io/ftwtest-time64

The above test binaries are already included for testing in recipe
glibc-testsuite_2.41.bb.

It is by now well established that glibc itself works as it should,
that all affected 32 bit targets are configured to use 64 bit time_t,
and that any lingering y2038 issues are in components other than the c
library, and usually come from C programming mistakes (e.g. storing
timestamps in long). Maybe we can simply remove the recipe?

Review comments for fixing above longer time duration ended up in
removing this recipe as a proposal is below
https://lists.openembedded.org/g/openembedded-core/topic/112188476#msg214636

Removed lines having reference to glibc-y2038-tests in the files.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../distro/include/ptest-packagelists.inc     |   2 -
 meta/conf/distro/include/time64.inc           |   2 -
 .../glibc/glibc-y2038-tests_2.41.bb           | 107 ------------------
 meta/recipes-core/glibc/glibc/run-ptest       |  37 ------
 5 files changed, 149 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
 delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8065287c17..038203e1cf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -216,7 +216,6 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-glibc-y2038-tests = "Lukasz Majewski <lukma@denx.de>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf6..9fb3332384 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -86,8 +86,6 @@ PTESTS_FAST = "\
     xz \
     zlib \
 "
-PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
-PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
 PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 5122e2a122..24a81c83f1 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -20,7 +20,6 @@ TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '$
 TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
-GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
@@ -33,7 +32,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
 # /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
deleted file mode 100644
index 9ea09a4e12..0000000000
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
+++ /dev/null
@@ -1,107 +0,0 @@
-require glibc_${PV}.bb
-require glibc-tests.inc
-
-inherit ptest features_check
-REQUIRED_DISTRO_FEATURES = "ptest"
-
-SRC_URI += "\
-	file://run-ptest \
-"
-
-SUMMARY = "glibc tests using time32/time64 interfaces to be run with ptest for the purpose of checking y2038 compatiblity"
-
-# Erase some variables already set by glibc_${PV}
-python __anonymous() {
-       # Remove packages provided by glibc build, we only need a subset of them
-       d.setVar("PACKAGES", "${PN} ${PN}-dbg ${PN}-ptest")
-
-       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
-
-       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
-       d.setVar("BBCLASSEXTEND", bbclassextend)
-       d.setVar("RRECOMMENDS", "")
-       d.setVar("SYSTEMD_SERVICE:nscd", "")
-       d.setVar("SYSTEMD_PACKAGES", "")
-}
-
-# Remove any leftovers from original glibc recipe
-RPROVIDES:${PN} = "${PN}"
-RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = "glibc libgcc sed bash"
-RDEPENDS:${PN}-ptest = "${PN}"
-DEPENDS += "sed"
-
-export oe_srcdir = "${exec_prefix}/src/debug/glibc/${PV}/"
-
-# Just build tests for target - do not run them
-do_check:append () {
-	oe_runmake -i check run-built-tests=no
-}
-addtask do_check after do_compile before do_install_ptest_base
-
-glibc_strip_build_directory () {
-	# Delete all non executable files from build directory
-	find ${B} ! -executable -type f -delete
-
-	# Remove build dynamic libraries and links to them as
-	# those are already installed in the target device
-	find ${B} -type f -name "*.so" -delete
-	find ${B} -type l -name "*.so*" -delete
-
-	# Remove headers (installed with glibc)
-	find ${B} -type f -name "*.h" -delete
-
-	find ${B} -type f -name "isomac" -delete
-	find ${B} -type f -name "annexc" -delete
-}
-
-do_install_ptest_base () {
-	glibc_strip_build_directory
-
-	ls -r ${B}/*/*-time64 > ${B}/tst_time64
-
-	# Remove '-time64' suffix - those tests are also time related
-	sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
-	tst_time=$(cat ${B}/tst_time_tmp ${B}/tst_time64)
-
-	rm ${B}/tst_time_tmp ${B}/tst_time64
-	echo "${tst_time}"
-
-	# Install build test programs to the image
-	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
-
-	for f in "${tst_time}"
-	do
-	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
-	done
-
-	install -d ${D}${PTEST_PATH}
-	cp ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
-
-}
-
-# The datadir directory is required to allow core (and reused)
-# glibc cleanup function to finish correctly, as this directory
-# is not created for ptests
-stash_locale_package_cleanup:prepend () {
-	mkdir -p ${PKGD}${datadir}
-}
-
-stash_locale_sysroot_cleanup:prepend () {
-	mkdir -p ${SYSROOT_DESTDIR}${datadir}
-}
-
-# Prevent the do_package() task to set 'libc6' prefix
-# for glibc tests related packages
-python populate_packages:prepend () {
-    if d.getVar('DEBIAN_NAMES'):
-        d.setVar('DEBIAN_NAMES', '')
-}
-
-FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
-
-EXCLUDE_FROM_SHLIBS = "1"
-
-deltask do_stash_locale
-do_install[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
deleted file mode 100755
index cb71c75682..0000000000
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/bash
-# ptest script for glibc - to run time related tests to
-# facilitate Y2038 validation
-# Run with 'ptest-runner glibc-tests'
-
-output() {
-  retcode=$?
-  if [ $retcode -eq 0 ]
-    then echo "PASS: $i"
-  elif [ $retcode -eq 77 ]
-    then echo "SKIP: $i"
-  else echo "FAIL: $i"
-  fi
-}
-
-# Allow altering time on the target
-export GLIBC_TEST_ALLOW_TIME_SETTING="1"
-
-tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
-
-# Remove '-time64' suffix - those tests are also time
-# related
-tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
-
-# Do not run tests supporting only 32 bit time
-#for i in ${tst_time_tmp}
-#do
-#	$i >/dev/null 2>&1
-#	output
-#done
-
-# Run tests supporting only 64 bit time
-for i in ${tst_time64}
-do
-	$i >/dev/null 2>&1
-	output
-done
-- 
2.34.1


