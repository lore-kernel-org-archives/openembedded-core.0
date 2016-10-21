Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 601EE71CE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 14:06:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0nY55PKrz3hjVf;
	Fri, 21 Oct 2016 16:06:49 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0nY555jVzvklW;
	Fri, 21 Oct 2016 16:06:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id exTfhCBQDcWP; Fri, 21 Oct 2016 16:06:38 +0200 (CEST)
X-Auth-Info: 6yvRsaiZjHgcpun/g7kbCscWYvh5TYwB0dB5wgqE/mf+gXC1fNBoePzq4i3+VRTA
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 16:06:38 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 14:06:08 +0000
Message-Id: <1477058768-25735-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] Remove LIC_FILES_CHKSUM from recipes without SRC_URI
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
X-List-Received-Date: Fri, 21 Oct 2016 14:06:49 -0000

LICENSE and LIC_FILES_CHKSUM apply to the sources specified by SRC_URI,
not to the recipe itself. As such a license declaration for a source-less
recipe makes little sense. The LICENSE declaration is mandatory, but
LIC_FILES_CHKSUM can be removed in such cases.

Remove the LIC_FILES_CHKSUM declarations from all recipes that do not
need it.

CC: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta-selftest/recipes-test/error/error.bb                              | 1 -
 meta/recipes-core/meta/buildtools-tarball.bb                           | 2 --
 meta/recipes-core/meta/meta-environment.bb                             | 2 --
 meta/recipes-core/meta/meta-extsdk-toolchain.bb                        | 2 --
 meta/recipes-core/meta/meta-ide-support.bb                             | 2 --
 meta/recipes-core/meta/meta-toolchain.bb                               | 3 ---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb              | 1 -
 meta/recipes-core/meta/signing-keys.bb                                 | 2 --
 meta/recipes-core/meta/testexport-tarball.bb                           | 2 --
 meta/recipes-core/meta/uninative-tarball.bb                            | 2 --
 meta/recipes-core/os-release/os-release.bb                             | 1 -
 meta/recipes-core/systemd/systemd-compat-units.bb                      | 1 -
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb                     | 1 -
 .../postinst-intercept/nativesdk-postinst-intercept_1.0.bb             | 1 -
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb                    | 1 -
 meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb          | 1 -
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb                    | 1 -
 meta/recipes-kernel/linux/kernel-devsrc.bb                             | 1 -
 meta/recipes-kernel/perf/perf.bb                                       | 1 -
 19 files changed, 28 deletions(-)

diff --git a/meta-selftest/recipes-test/error/error.bb b/meta-selftest/recipes-test/error/error.bb
index a7bdecf..3c22e7c 100644
--- a/meta-selftest/recipes-test/error/error.bb
+++ b/meta-selftest/recipes-test/error/error.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Error Test case that fails on do_compile"
 DESCRIPTION = "This generates a compile time error to be used to for testing."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 INHIBIT_DEFAULT_DEPS = "1"                                                                                                                                                                  
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 5808c95..abdc7fe 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "SDK type target for building a standalone tarball containing pyth
                tarball can be used to run bitbake builds on systems which don't meet the usual version requirements."
 SUMMARY = "Standalone tarball for running builds on systems with inadequate software"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 TOOLCHAIN_TARGET_TASK ?= ""
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index d9e045f..71e0c23 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -1,6 +1,4 @@
 SUMMARY = "Package of environment files for SDK"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
 PR = "r8"
 
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 2bd9a5b..22de0f3 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -1,8 +1,6 @@
 SUMMARY = "Extensible SDK toolchain meta-recipe"
 DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index c4ddcfc..1c4aded 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -1,8 +1,6 @@
 SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 PR = "r3"
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index ba9fd88..b02b066 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -3,7 +3,4 @@ LICENSE = "MIT"
 
 PR = "r7"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit populate_sdk
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 2b96111..0b58a02 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Dummy package which ensures perl is excluded from buildtools"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit allarch
 
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 3779037..d088c0c 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -3,8 +3,6 @@
 
 SUMMARY = "Makes public keys of the signing keys available"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
 inherit allarch deploy
diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index d9861c4..72f5531 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -3,8 +3,6 @@ DESCRIPTION = "SDK type target for standalone tarball containing packages define
                This recipe is almost the same as buildtools-tarball"
 SUMMARY = "Standalone tarball for test systems with missing software"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 TEST_EXPORT_SDK_PACKAGES ??= ""
 
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index e203a83..bbde0d2 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -1,7 +1,5 @@
 SUMMARY = "libc and patchelf tarball for use with uninative.bbclass"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 TOOLCHAIN_TARGET_TASK = ""
 
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index f519add..fac0bac 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -3,7 +3,6 @@ inherit allarch
 SUMMARY = "Operating system identification"
 DESCRIPTION = "The /etc/os-release file contains operating system identification data."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 INHIBIT_DEFAULT_DEPS = "1"
 
 do_fetch[noexec] = "1"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index aa20014..0f0876b 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r29"
 
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index ace3de4..682142a 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Architecture-dependent configuration for opkg"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PR = "r1"
 
diff --git a/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
index 7dc45c6..938ac8a 100644
--- a/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
+++ b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Postinstall scriptlets"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 FILES_${PN}_append = " ${datadir}/postinst-intercepts/*"
 
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 53b302d..881942e 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "QEMU wrapper script"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
index 97b308a..72373e3 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
@@ -10,7 +10,6 @@ HOMEPAGE = "http://sources.redhat.com/docbook-tools/"
 LICENSE = "GPLv2+"
 # See the comments in license.patch when upgrading this recipe.
 # This is inteded to be a temporary workaround.
-LIC_FILES_CHKSUM = "file://LICENSE-GPLv2;md5=ab8a50abe86dfc859e148baae043c89b"
 SECTION = "base"
 
 PR = "r1"
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 5c7dd52..e617bde 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Wrapper script for the Linux kernel module dependency indexer"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 0fdd0ad..9fd2e08 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -6,7 +6,6 @@ development or external module builds"
 SECTION = "kernel"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
 inherit linux-kernel-base
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 471023d..25ae83c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -7,7 +7,6 @@ and software features (software counters, tracepoints) \
 as well."
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 PR = "r9"
 
-- 
2.1.4


