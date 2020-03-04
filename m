Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id B685560640
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:32:44 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id c20so1083806lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k4OM/bY5IyzSLGv2mHvO2jWMcwpP7maPieDM51eQWT4=;
	b=Z0n0ndvIsQ8MLjYmkKL/EX+we/F3OjvixFvYLqrbKmyveUiSUIBp+2xJodFFr2xP0O
	rXHi0QQBUow9XL5LNx4+an1fmt8ymRM4G4UoAPY5bNGK0FiEutz4Y6HKRaD98HFpRDiu
	QLF+VdPxetTT+hVqARiAa8KCcwydirkIvFk8nTqCSJcgXeJJ/aAQqiBrjmPTbHYabO54
	zJiLoXRiqs/L9aKIpomS/tepzwNbH/Hn3E/BqfpVfKE0F7UlfnjxF8Bhkx17rNdK9GNu
	KsOhkC2btoCQN7eMR7x6HF0od1McuMcXMHGjkSXtiWXQc1UHLqDiW/mUxWTedQOTjmvf
	tnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k4OM/bY5IyzSLGv2mHvO2jWMcwpP7maPieDM51eQWT4=;
	b=jxrSMWkanRfZ9IPeX26BqqH0y25V/Zyj8S7z6RIIcJz7cGW+gPi6S+v8Q+7Gm59nxw
	rcYP612S892ebdgOp0a0CRgRPvquWTLEE0SEcPO7F1tvzvZl6kEGKPg5JKuGN3fUKOGM
	HEaJlYeBXX43brHL23XrXJMsDf56ZJkxGvYIFJ+EpdYFXSn9dtbS4PTLQUt+g9LB3RNt
	1STAGfq2UarfjzGW7i0Si2HMSUXX58JnwMg1wa0Hc+8zMkmkmYv44ntnUPDGnABpa6Pv
	xlj4THEaHPaOIP4x5Qlp1QxMqwWNHx/ziXe3L83W6GUdP/3jjyp9DFenSql4GIoBx0uJ
	oBKw==
X-Gm-Message-State: ANhLgQ3jbjB1LyjsxETaLgvLoGHBVEZCavD8RIK9AOM4K+l2z1QFJvYR
	XfRQwcoj6WT1KHMow1zzu/76A3xb67I=
X-Google-Smtp-Source: ADFU+vuvrBeHbetidNGk8ewUYFqfEnenM80CbaRNzD2W9fRg+wYAExNT39When/rSnkpzqGwHZgDJw==
X-Received: by 2002:a19:550d:: with SMTP id n13mr1643148lfe.110.1583317964574; 
	Wed, 04 Mar 2020 02:32:44 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id
	b30sm13478197lfc.39.2020.03.04.02.32.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 02:32:43 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 11:32:37 +0100
Message-Id: <20200304103237.4650-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] babeltrace2: added first version, 2.0.1
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
X-List-Received-Date: Wed, 04 Mar 2020 10:32:45 -0000
Content-Transfer-Encoding: 8bit

Babeltrace 1 vs. Babeltrace 2

The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was released.
Babeltrace 2 is a complete rewrite of the library, Python bindings, and CLI. It
is plugin based and offers much more features and potential than Babeltrace 1.

Because Babeltrace 2 is still a young released project, some distributions still
provide packages for the Babeltrace 1 project. Both projects can coexist on the
same system as there are no common installed files.

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 meta/conf/distro/include/distro_alias.inc     |  1 +
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../packagegroup-core-tools-profile.bb        |  2 +
 ...001-test_plugin-do-not-test-in-.libs.patch | 24 +++++
 .../lttng/babeltrace2/run-ptest               |  9 ++
 .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 92 +++++++++++++++++++
 7 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
 create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 79ebcaee29..0e4a9a9f8f 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -15,6 +15,7 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
+DISTRO_PN_ALIAS_pn-babeltrace2 = "OSPDT"
 DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 10095ffe76..adb18228e7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -59,6 +59,7 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4afac58e3a..d6f3aafc7f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,6 +64,7 @@ PTESTS_FAST = "\
 
 PTESTS_SLOW = "\
     babeltrace-ptest \
+    babeltrace2-ptest \
     busybox-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 984c2fac92..ac180b542a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -46,6 +46,7 @@ LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
 
 BABELTRACE = "babeltrace"
+BABELTRACE2 = "babeltrace2"
 
 # valgrind does not work on the following configurations/architectures
 
@@ -69,6 +70,7 @@ RDEPENDS_${PN} = "\
     ${LTTNGTOOLS} \
     ${LTTNGMODULES} \
     ${BABELTRACE} \
+    ${BABELTRACE2} \
     ${SYSTEMTAP} \
     ${VALGRIND} \
     "
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
new file mode 100644
index 0000000000..d1dbabab44
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
@@ -0,0 +1,24 @@
+From 49edc1efa64d7597f492c78b2b7c4b115c0a0ef7 Mon Sep 17 00:00:00 2001
+Message-Id: <49edc1efa64d7597f492c78b2b7c4b115c0a0ef7.1581587378.git.anders.wallin@windriver.com>
+From: Anders Wallin <anders.wallin@windriver.com>
+Date: Thu, 13 Feb 2020 10:49:28 +0100
+Subject: [PATCH] test_plugin: do not test in .libs
+
+Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
+---
+ tests/lib/test_plugin | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
+index 652c90cc..1f817c50 100755
+--- a/tests/lib/test_plugin
++++ b/tests/lib/test_plugin
+@@ -26,4 +26,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
+-- 
+2.25.0
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
new file mode 100755
index 0000000000..72fe223436
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+# use target=recheck if you want to recheck failing tests
+[ "$target" = "" ] && target=check
+
+# Without --ignore-exit, the tap harness causes any FAILs within a
+# test plan to raise ERRORs; this is just noise.
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
+
+exec make -C tests -k -s $makeargs $target 2>/dev/null
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
new file mode 100644
index 0000000000..bcbc1ff7d1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
@@ -0,0 +1,92 @@
+SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://babeltrace.org/"
+BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
+LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
+	   file://run-ptest \
+	   file://0001-test_plugin-do-not-test-in-.libs.patch \
+	  "
+SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig ptest
+
+EXTRA_OECONF = "--disable-debug-info"
+
+PACKAGECONFIG ??= "manpages"
+PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
+
+FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
+FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
+
+ASNEEDED = ""
+
+RDEPENDS_${PN}-ptest += "bash gawk python3"
+
+do_compile_ptest () {
+    make -C tests all
+}
+
+do_install_ptest () {
+    install -d "${D}${PTEST_PATH}/tests"
+
+    # Copy required files from source directory
+    for d in $(find "${S}/tests" -type d -printf '%P ') ; do
+	install -d "${D}${PTEST_PATH}/tests/$d"
+	find "${S}/tests/$d" -maxdepth 1 -executable -type f \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
+	find "${S}/tests/$d" -maxdepth 1 -name *.sh \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.py \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.expect \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+    done
+    install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
+    cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
+
+    # Copy the tests directory tree and the executables and
+    # Makefiles found within.
+    install -D "${B}/tests/Makefile" "${D}${PTEST_PATH}/tests/"
+    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ') ; do
+	install -d "${D}${PTEST_PATH}/tests/$d"
+	find "${B}/tests/$d" -maxdepth 1 -executable -type f \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
+	test -r "${B}/tests/$d/Makefile" && \
+	    install -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
+	find "${B}/tests/$d" -maxdepth 1 -name *.sh \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+    done
+
+    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
+	for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
+	    cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
+	done
+    done
+
+    # Prevent attempts to update Makefiles during test runs, and
+    # silence "Making check in $SUBDIR" messages.
+    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
+	 sed -i \
+	 -e '/Makefile:/,/^$/d' \
+	 -e '/%: %.in/,/^$/d' \
+	 -e '/echo "Making $$target in $$subdir"; \\/d' \
+	 -e 's/^srcdir = \(.*\)/srcdir = ./' \
+	 -e 's/^builddir = \(.*\)/builddir = ./' \
+	 -e 's/^all-am:.*/all-am:/' \
+	 {} +
+
+    # Substitute links to installed binaries.
+    install -d "${D}${PTEST_PATH}/src/cli/"
+    ln -s "${bindir}/babeltrace2" ${D}${PTEST_PATH}/src/cli/
+
+    # Remove architechture specific testfiles
+    rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
+}
-- 
2.25.1


