Return-Path: <wallinux@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 281726157B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:24:54 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id q8so22872553ljj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jexyqtdC3RombX4hCAxWiaqcerYLk3BjYXuOJHtgzPQ=;
	b=ZscLvn9oFOBNQYZ1zqQuxx6OzVEEYwCe7I7VCb4onbecd+vkrpM8Xd7HC4SOmwv9kj
	lQoSkCa37H12F9IcXt8fRt4TLPnK6MaTxoLZeeMNc90sgQySu+r6QsqZitZjJHszmJBh
	2AJxf5CdXiOwA+BJzninnYuMBZCAYhDt7jNsI041eky6HHDI/rnPycMLOCSc+k2CajvC
	sHZBBqhvxa4I2rr/M9q+zlsDb9QOInCkDkfZVQR7x2MKhKaVqhDVdiveuKonx508eW6O
	h/2kuZ7DQFI6w4zUVRHB4HBRLweTkU+nkopB4JK1Yr3nCnC0G6q25pZyT0o9zU9EIeY5
	MtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jexyqtdC3RombX4hCAxWiaqcerYLk3BjYXuOJHtgzPQ=;
	b=T1Kk2YWfgVTXCH/aT/morHn8l5Q2Wy0tXsaAo4mgkMCX2Jmn35eGh9Wb30ZTnOwF1W
	ujhOWLhaboFsCt4BxZU08prOvP5NfYRvqv04jDuItk8jT6Udq2tVCHQo/z70TAO+I0ot
	U97t8pZcKKT+QURPif7rXxx/EyX2xZ+7LpzMxm3jMfy2uqdn5HZ/+39nxGkO6B+VJaKU
	2xezyBtZUF/tnaYN4m8lL3lfwaLqNS65mLO/mrGWylPmuKLumER+pSEjQ0RPvvt1Erh8
	UXwRUM14DInWlhXJmAfMj+V4w6C5GMJrCtFtvqzxcGnOGsw6rPR1doOK9Mut/HW+BnjS
	Z8zQ==
X-Gm-Message-State: APjAAAVWF699uNVn9TP8OkHHBGOCezKyBah3KJm5yYMMrNOTEnEDZQcj
	Dw4ax29KcICljfCh071uX8N9cCKi3tc=
X-Google-Smtp-Source: APXvYqzItLn9MSvauaN+9pjqWlsAolbi/rs5LIu4LamxHzJuLDW2+E98CwF2gJUW5t15k3CziGoZow==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr13055793ljj.97.1582032294275; 
	Tue, 18 Feb 2020 05:24:54 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id m83sm2264479lfa.5.2020.02.18.05.24.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 05:24:53 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 14:24:50 +0100
Message-Id: <20200218132450.21597-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] babeltrace: added ptest
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
X-List-Received-Date: Tue, 18 Feb 2020 13:24:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../recipes-kernel/lttng/babeltrace/run-ptest |  9 ++
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 82 ++++++++++++++++++-
 2 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-kernel/lttng/babeltrace/run-ptest

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


