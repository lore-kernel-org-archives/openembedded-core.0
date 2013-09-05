Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 470106BF48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 17:10:56 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id x18so1940122lbi.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 10:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K/ShNDkcEzcguv0ogWZADs28LjDbr9XkyWDrUHDZg/M=;
	b=kEidz25VyMHL7NqbwIaxCmD2Xnugos//GKLC4eVNs9KuxDH/fz9yglsUSFC0XLLCVK
	m5cIx2pbKzxSwIpgo8YiI+GASaA29fbyOGZN2CZ0o7w6NbjwIP3mSwB7J27VJWQxLd7X
	K91y2g99tse/z/ZYI2dDiqxx0xoE3qT6pY225p5KoOl9Ijo6PzE+53hPGtJfyiO9jnT3
	aW1jWBI1k2TXJfFqwMI1Q+Ly15RLFANPoVX3nBXgWrqb196CQfCUeOgzF41zWwYCtrrD
	tZp0HXIPEX3EZ3atuhH8qyjNSpvIErRwpj3R9f7bMWdtAFn59Svag6c5DWK09ZarCIU9
	1HRQ==
X-Gm-Message-State: ALoCoQn4pkMt2Fw2xYsU1SsOkHYkZl5z7CBgph4PbNS/mgG9r39qDIogvTpFN8fOh3vGkDsNwJLl
X-Received: by 10.112.155.228 with SMTP id vz4mr2147208lbb.41.1378401057333;
	Thu, 05 Sep 2013 10:10:57 -0700 (PDT)
Received: from localhost (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133]) by mx.google.com with ESMTPSA id
	js17sm14595154lab.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 10:10:56 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 19:10:50 +0200
Message-Id: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: [PATCH] ltp: update to new release 20130904
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
X-List-Received-Date: Thu, 05 Sep 2013 17:10:58 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20130503.bb | 75 -----------------------------
 meta/recipes-extended/ltp/ltp_20130904.bb | 78 +++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp_20130503.bb
 create mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb

diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130503.bb
deleted file mode 100644
index 387826d..0000000
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY = "Linux Test Project"
-DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
-HOMEPAGE = "http://ltp.sourceforge.net"
-SECTION = "console/utils"
-
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-		    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
-		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
-		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
-		    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-		    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
-		    file://tools/netpipe-2.4-ipv6/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
-		    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
-		    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-		"
-
-DEPENDS = "attr libaio libcap acl openssl"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
-
-SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
-SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
-
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
-
-inherit autotools
-
-RDEPENDS_${PN} = "perl"
-
-FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
-FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
-
-FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
-
-FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_unpack_append() {
-    bb.build.exec_func('do_extract_tarball', d)
-}
-
-do_extract_tarball() {
-	if test -f ${WORKDIR}/ltp-full-${PV} ; then
-	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
-	    rm -rf ${WORKDIR}/ltp-${PV}
-	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
-	fi
-}
-
-do_install(){
-	install -d ${D}/opt/ltp/
-	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-	
-	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
-	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
-
-	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
-	# We will add expect for enhancement in future
-	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
-}
-
-# Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
new file mode 100644
index 0000000..d4ef7ef
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -0,0 +1,78 @@
+SUMMARY = "Linux Test Project"
+DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
+HOMEPAGE = "http://ltp.sourceforge.net"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+		    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
+		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
+		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+		    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+		    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+		    file://tools/netpipe-2.4-ipv6/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+		    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
+		    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		"
+
+DEPENDS = "attr libaio libcap acl openssl"
+
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=${PV};protocol=git"
+
+SRC_URI[md5sum] = "c8a5f6f397d2c021a0d21ad28992aa7d"
+SRC_URI[sha256sum] = "4c13e00c1bed8f1b85daf934cd7b54a08b7b7e31874085ab9277ee563af87139"
+
+SRCREV = "${AUTOREV}"
+S = "${WORKDIR}/git"
+
+export prefix = "/opt/ltp"
+export exec_prefix = "/opt/ltp"
+
+inherit autotools
+
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
+
+FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
+FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
+
+FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
+
+FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_unpack_append() {
+    bb.build.exec_func('do_extract_tarball', d)
+}
+
+do_extract_tarball() {
+	if test -f ${WORKDIR}/ltp-full-${PV} ; then
+	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
+	    rm -rf ${WORKDIR}/ltp-${PV}
+	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
+	fi
+}
+
+do_install(){
+	install -d ${D}/opt/ltp/
+	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
+
+	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
+	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+
+	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
+	# We will add expect for enhancement in future
+	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
+}
+
+# Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
+INHIBIT_PACKAGE_STRIP = "1"
-- 
1.8.1.2


