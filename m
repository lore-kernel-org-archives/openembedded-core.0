Return-Path: <wallinux@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4658261580
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:26:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id q8so22925738ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T1zc3Jktk97SaqhcUT/RNl6OxQxQ8djHKCOlFC7hKc4=;
	b=JiexL9Q/dXJH4sYgIATOmyAGthL7uNvz9Yx0CZhnbzE8W8MMUUUfjrOv2g8W3I7//7
	CchxQfnv11COXGWPeHiLPPDK9EQB9qLWn84+3PlXVFy0rnHkSTb24aQ6bKHsnTfXLQT1
	G9ukmAOLK+51JnaVyhHxnyIAXVh18FXl3HAxJVPlyhram8r7sIJHeLmjHVPAKhryW9WA
	V6/6mPp4fDGiaM0YzfhFqeqAFJKX7saFjbG0wUBltKRSHL9QPWf++CzdDIhFUFzLEYWj
	GkKaOPGweAWgE8rRJ1TVw7MzCEdEu5y0KjI8ToZYdlcFwC09TV9xspu6EK/FwzUaLYwk
	slHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T1zc3Jktk97SaqhcUT/RNl6OxQxQ8djHKCOlFC7hKc4=;
	b=AcWSYzSmeUvAZTTv7UZvUO87lBbtIWgXUZfe6izCOvTpVaezP4LAxFFegB5aJ71TzN
	tR3V2qwo7q1gMBbPPfRfLG71IABmGsmQxca3s5OQ8sldNgltjcnS7RVx08KEnyUXis89
	desqXa9viuXqwVfPxtMyGD5JxXPlY1IPdHFUcn7TF9kAvKJ7USoXx9M7pvYN2iiLHHwI
	GIDvAzksK/sKqIJAy7Zipr9qafaTZDDwLx/vKiH1sEXh15Tec9pR0kLJX/q+Z3aMfVve
	YbhqvPNwJdexnBl4f4CxcJSG/kUW12a22CAv2J53sAN0uUjG/hnETtxTPx0umg2KIyr7
	tkeA==
X-Gm-Message-State: APjAAAU14O9Y/SJKjsO+M3AOs5e9kloh+RSCEKgOi4h6MwAnIkKzd0bd
	ensZNcN8GAG8yR0XRoyVS1cgiOpYss0=
X-Google-Smtp-Source: APXvYqxQz2wNNz8lrM7uXc3dvGmyFraeAzzoP/Rz89ZHgpq/OV//79dsZQ8YX/PJkP4O6GDRz0Yq+Q==
X-Received: by 2002:a2e:9a93:: with SMTP id p19mr12955176lji.177.1582032374313;
	Tue, 18 Feb 2020 05:26:14 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id
	p15sm2224495lfo.88.2020.02.18.05.26.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 05:26:13 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 14:26:06 +0100
Message-Id: <20200218132606.22055-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] babeltrace2: added ptest
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
X-List-Received-Date: Tue, 18 Feb 2020 13:26:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 ...001-test_plugin-do-not-test-in-.libs.patch | 24 +++++++
 .../lttng/babeltrace2/run-ptest               |  9 +++
 .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 70 ++++++++++++++++++-
 3 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-test_plugin-do-not-test-in-.libs.patch
 create mode 100755 meta/recipes-kernel/lttng/babeltrace2/run-ptest

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
index d49a96faff..43748b760a 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
@@ -7,13 +7,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
+	   file://run-ptest \
+	   file://0001-test_plugin-do-not-test-in-.libs.patch \
+	  "
 SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--disable-debug-info"
 
@@ -24,3 +27,66 @@ FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
 FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
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
2.25.0


