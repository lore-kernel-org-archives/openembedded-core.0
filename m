Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 555A9713A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 10:49:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2014 02:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,360,1413270000"; d="scan'208";a="630063088"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.110])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 02:48:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:48:24 +0000
Message-Id: <e7c71be4b1ba2b617275d67a4ec47f7604b3aaef.1415702873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1415702873.git.paul.eggleton@linux.intel.com>
References: <cover.1415702873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1415702873.git.paul.eggleton@linux.intel.com>
References: <cover.1415702873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] documentation.conf: add missing tasks / variables
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
X-List-Received-Date: Tue, 11 Nov 2014 10:49:37 -0000

Document some recently added tasks and variables.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 66ec093..5564316 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -18,6 +18,7 @@ do_compile_ptest_base[doc] = "Compiles the runtime test suite included in the so
 do_configure[doc] = "Configures the source by enabling and disabling any build-time and configuration options for the software being built"
 do_configure_ptest_base[doc] = "Configures the runtime test suite included in the software being built"
 do_deploy[doc] = "Writes deployable output files to the deploy directory"
+do_devpyshell[doc] = "Starts an interactive Python shell for development/debugging"
 do_devshell[doc] = "Starts a shell with the environment set up for development/debugging"
 do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
 do_fetch[doc] = "Fetches the source code"
@@ -33,6 +34,7 @@ do_listtasks[doc] = "Lists all defined tasks for a target"
 do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
 do_package_index[doc] = "Creates or updates the index in the Package Feed area"
+do_package_qa[doc] = "Runs QA checks on packaged files"
 do_package_write_deb[doc] = "Creates the actual DEB packages and places them in the Package Feed area"
 do_package_write_ipk[doc] = "Creates the actual IPK packages and places them in the Package Feed area"
 do_package_write_rpm[doc] = "Creates the actual RPM packages and places them in the Package Feed area"
@@ -51,6 +53,7 @@ do_spdx[doc] = "A build stage that takes the source code and scans it on a remot
 do_strip[doc] = "Strips unneeded sections out of the Linux kernel image"
 do_testimage[doc] = "Boots an image and performs runtime tests within the image"
 do_testimage_auto[doc] = "Boots an image and performs runtime tests within the image immediately after it has been built"
+do_testsdk[doc] = "Installs an SDK and performs runtime tests on the tools installed by it"
 do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bootloader"
 do_unpack[doc] = "Unpacks the source code into a working directory"
 do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
@@ -107,6 +110,7 @@ BUSYBOX_SPLIT_SUID[doc] = "For the BusyBox recipe, specifies whether to split th
 CACHE[doc]  = "The directory holding the cache of the metadata."
 CFLAGS[doc] = "Flags passed to the C compiler for the target system. This variable evaluates to the same as TARGET_CFLAGS."
 CLASSOVERRIDE[doc] = "An internal variable specifying the special class override that should currently apply (e.g. "class-target", "class-native", and so forth)."
+CLEANBROKEN[doc] = "Specifies if 'make clean' does not work for a recipe (and therefore the build system should not try to use it during do_configure)"
 COMBINED_FEATURES[doc] = "A set of features common between MACHINE_FEATURES and DISTRO_FEATURES."
 COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in the Source Directory, which is where generic license files reside."
 COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or more hosts (when the recipe is native) or one or more targets (when the recipe is non-native) with which a recipe is compatible."
@@ -240,6 +244,8 @@ KBRANCH_DEFAULT[doc] = "Defines the Linux kernel source repository's default bra
 KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
 KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kernel Git repository. The metadata you add through this variable includes config fragments and features descriptions."
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
+KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
+KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
@@ -412,6 +418,11 @@ TCMODE[doc] = "Enables an external toolchain (where provided by an additional la
 TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
 TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
 TEST_SUITES[doc] = "An ordered list of tests (modules) to run against an image when performing automated runtime testing."
+TEST_POWERCONTROL_CMD[doc] = "For automated hardware testing, specifies the command to use to control the power of the target machine under test"
+TEST_POWERCONTROL_EXTRA_ARGS[doc] = "For automated hardware testing, specifies additional arguments to pass through to the command specified in TEST_POWERCONTROL_CMD"
+TEST_SERIALCONTROL_CMD[doc] = "For automated hardware testing, specifies the command to use to connect to the serial console of the target machine under test"
+TEST_SERIALCONTROL_EXTRA_ARGS[doc] = "For automated hardware testing, specifies additional arguments to pass through to the command specified in TEST_SERIALCONTROL_CMD"
+TEST_TARGET[doc] = "For automated runtime testing, specifies the method of deploying the image and running tests on the target machine"
 THISDIR[doc] = "The directory in which the file BitBake is currently parsing is located."
 TIME[doc] = "The time the build was started using HMS format."
 TMPDIR[doc] = "The temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
-- 
1.9.3


