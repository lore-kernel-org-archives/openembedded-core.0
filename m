Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5836B4C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:13 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id y6so3411716lbh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YOaYrXTNXpw27p60hmphU6gtx9izIuIUZtRyFG8PEU4=;
	b=FANUscZmpsjML7QLQJj/cIvPSxDjTqGThq8W9Y8O24UuEJdoft9sY5YuzvwJWBDyGC
	oTBEFUm3yYzeytMZJ2P6OE/VjzOn6FVtO/e1uOAOvuVtDQTDNkRc8DYB2coPtvDiCdnd
	jtVP2l6ysTmk/LRZXEPgfiHXpkibbG5n2yqU/A+v4TIY4VgLXZN+gSZajES+HAZB/A3X
	SiG5u8YTFOYo51Cqd6zr4kBHcefhJdQ8ES7opJXv+E5I0nJKFRALg2+E8Rek3BmbFGYD
	Qq/iGQkNLEluPf6YODAaamUwNoR9++fclkWrJr6OmRwCAie155LjY25ch/6lQ3HuvVWA
	1vsw==
X-Gm-Message-State: ALoCoQkib6oPNzSVOJWVXaJq4XIp4xOTs0VNxrZ2t9s9yT0o2rojAW4iB8R3VTPUsY9VmKHGNGoT
X-Received: by 10.152.242.8 with SMTP id wm8mr45743lac.76.1389995833887;
	Fri, 17 Jan 2014 13:57:13 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:13 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:56:59 +0200
Message-Id: <1389995824-9066-3-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCH 2/7] Fix style using oe-stylize (no changes in the content of the recipe itself)
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:14 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 100 +++++++++++++++---------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index c346c5c..881cb26 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -2,76 +2,78 @@ SUMMARY = "Linux Test Project"
 DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
 HOMEPAGE = "http://ltp.sourceforge.net"
 SECTION = "console/utils"
-
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
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
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
+    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
+    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+    file://tools/netpipe-2.4-ipv6/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
+    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+"
 
 DEPENDS = "attr libaio libcap acl openssl"
+SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-           file://regen-makefile.patch \
+    file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
+    file://regen-makefile.patch \
 "
 
-SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
 S = "${WORKDIR}/git"
 
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
-
 inherit autotools
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
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
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+export prefix = "/opt/ltp"
+export exec_prefix = "/opt/ltp"
+
 do_unpack_append() {
     bb.build.exec_func('do_extract_tarball', d)
 }
 
-do_extract_tarball() {
-	if test -f ${WORKDIR}/ltp-full-${PV} ; then
-	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
-	    rm -rf ${WORKDIR}/ltp-${PV}
-	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
-	fi
+do_install(){
+    install -d ${D}/opt/ltp/
+    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
+
+    # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
+    cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+
+    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
+    # We will add expect for enhancement in future
+    find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
-do_install(){
-	install -d ${D}/opt/ltp/
-	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
+
+FILES_${PN}-dbg += "\
+    /opt/ltp/runtest/.debug \
+    /opt/ltp/testcases/bin/.debug \
+    /opt/ltp/testcases/bin/*/bin/.debug \
+    /opt/ltp/testcases/bin/*/test/.debug \
+    /opt/ltp/scenario_groups/.debug \
+    /opt/ltp/testscripts/.debug \
+    /opt/ltp/testscripts/open_posix_testsuite/.debug \
+"
 
-	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
-	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
-	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
-	# We will add expect for enhancement in future
-	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
+FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+
+do_extract_tarball() {
+        if test -f ${WORKDIR}/ltp-full-${PV} ; then
+            tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
+            rm -rf ${WORKDIR}/ltp-${PV}
+            mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
+        fi
 }
 
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
-- 
1.8.1.2


