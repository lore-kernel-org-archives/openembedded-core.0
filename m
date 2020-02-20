Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id A3D0060BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 05:24:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 83so621845lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Qa8txFJt+7wxMStOvDy4rr4giajutAstFQUErNhV4k=;
	b=RKX3z78sAL27YtV5C+hfBTF88lxBr37jqxJVOAqzgwBTTDPWRaulXoamzlsMJ0bgjz
	TcsEzeltwWY6Hx1kqDhPJ94n6Ls70KIaa+SP2jpB2Jjo1LKLd2xRZj8TYwiqQ3wWgutL
	uOWLKqh/OFgHpa6TQFmhON32EoCd3M5JZZaa45TvW2ttuyBq3c6pcj03xjfQzmaqY3fB
	yJQOzChlgjm70iSgAcwMObl05wqmjY5VwGilK/RoDOLCy/jsXa/I9xjFilKzfLm/8nOK
	EVxpiJ51ujJKWGw++Y2SZsIRkxTkVuIVJCXSiqcmk25/7UiJ+rYNbOw9JRSa0i4Hco72
	s7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Qa8txFJt+7wxMStOvDy4rr4giajutAstFQUErNhV4k=;
	b=h939V7ZREL8mRWut7OD1pYQA6FlgxgY8A4aoA92NAP6MIl4wLIqiReQW521x6zVaZ9
	nR1swicC2pXL5QhhZZnSV6f1luA/7kGrPdsWczirvxfVewwgeIZ7Z2qe+g5QbTmA7Jhe
	tYCOO3neY9Jj/wsAMrNBV03Ai0nvt+roOPHjJVa/4VYjBtFLo+5G7bjzQ8tVAxfWjD3s
	psiRYRlhjWrtncXFyUaaXjjXXzU9bNJVJCfvJfBI0Ik9v9xlVjtncYl07B9bcpXnC+NW
	tUjDFYsMZA4lqQJz9BkcdMidPepB9kngDSTtgpKQ24HibOYtB2eY00zETT3iM0lzsMzd
	CNYg==
X-Gm-Message-State: APjAAAVCKUzM4spWHYg1iRcIGJBPSIkWbh0nJ076NTAaFIFNox2OXPx4
	j62L4J1dlDoXsd/3cN/+hl7BYBjVvgg=
X-Google-Smtp-Source: APXvYqxzKYZe0I/4u/Z8aUZyJyz/UYfMxGg8J8AXtqKEoq8PqVZXwSDC599sUSaLdoQ3dPTXdrQ1Xw==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr3389274lfd.17.1582176247434;
	Wed, 19 Feb 2020 21:24:07 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id
	d22sm1020590lfi.49.2020.02.19.21.24.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 21:24:06 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 06:23:44 +0100
Message-Id: <20200220052344.8294-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] babeltrace: added ptest
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
X-List-Received-Date: Thu, 20 Feb 2020 05:24:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-kernel/lttng/babeltrace/run-ptest |  9 ++
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 82 ++++++++++++++++++-
 3 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-kernel/lttng/babeltrace/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 23865ac3e1..752a0882dc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -61,6 +61,7 @@ PTESTS_FAST = "\
 #"
 
 PTESTS_SLOW = "\
+    babeltrace-ptest \
     busybox-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
diff --git a/meta/recipes-kernel/lttng/babeltrace/run-ptest b/meta/recipes-kernel/lttng/babeltrace/run-ptest
new file mode 100755
index 0000000000..f4b7ce11e2
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+# use target=recheck if you want to recheck failing tests
+[ "$target" = "" ] && target=check
+
+# Without --ignore-exit, the tap harness causes any FAILs within a
+# test plan to raise ERRORs; this is just noise.
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
+
+exec make -C tests -k -s $makeargs $target 2>/dev/null
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index b6b7653037..c050dc674d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -7,14 +7,92 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
+	   file://run-ptest \
+	  "
 SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--disable-debug-info"
 
 ASNEEDED = ""
+
+RDEPENDS_${PN}-ptest += "bash gawk"
+
+addtask do_patch_ptest_path after do_patch before do_configure
+do_patch_ptest_path () {
+    for f in $(grep -l -r abs_top_srcdir ${S}/tests); do
+	sed -i 's:\@abs_top_srcdir\@:${PTEST_PATH}:' ${f}
+    done
+
+    for f in $(grep -l -r abs_top_builddir ${S}/tests); do
+	sed -i 's:\@abs_top_builddir\@:${PTEST_PATH}:' ${f}
+    done
+    for f in $(grep -l -r GREP ${S}/tests); do
+	sed -i 's:\@GREP\@:grep:' ${f}
+    done
+
+    for f in $(grep -l -r SED ${S}/tests); do
+	sed -i 's:\@SED\@:sed:' ${f}
+    done
+}
+
+do_compile_ptest () {
+    make -C tests all
+}
+
+do_install_ptest () {
+    # Copy required files from source directory
+    for f in config/tap-driver.sh config/test-driver; do
+	install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
+    done
+    install -d "$f" "${D}${PTEST_PATH}/tests/ctf-traces/"
+    cp -a ${S}/tests/ctf-traces/* ${D}${PTEST_PATH}/tests/ctf-traces/
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
+    install -D ${B}/formats/ctf/metadata/.libs/ctf-parser-test \
+	    ${D}${PTEST_PATH}/formats/ctf/metadata/ctf-parser-test
+
+    # Prevent attempts to update Makefiles during test runs, and
+    # silence "Making check in $SUBDIR" messages.
+    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
+	 sed -i \
+	 -e '/Makefile:/,/^$/d' \
+	 -e '/$(check_SCRIPTS)/s/^/#/' \
+	 -e '/%: %.in/,/^$/d' \
+	 -e '/echo "Making $$target in $$subdir"; \\/d' \
+	 -e 's/^srcdir = \(.*\)/srcdir = ./' \
+	 -e 's/^builddir = \(.*\)/builddir = ./' \
+	 -e 's/^all-am:.*/all-am:/' \
+	 {} +
+
+    # Remove path to babeltrace.
+    for f in $(grep -l -r "^BABELTRACE_BIN" ${D}${PTEST_PATH}); do
+	sed -i 's:^BABELTRACE_BIN.*:BABELTRACE_BIN=/usr/bin/babeltrace:' ${f}
+    done
+    for f in $(grep -l -r "^BTBIN" ${D}${PTEST_PATH}); do
+	sed -i 's:^BTBIN.*:BTBIN=/usr/bin/babeltrace:' ${f}
+    done
+}
-- 
2.25.0


