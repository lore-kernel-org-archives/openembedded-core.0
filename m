Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 50B2C6D635
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 16:09:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2013 09:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="402213571"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.91])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2013 09:09:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 16:09:43 +0000
Message-Id: <c369207ded42224502ebbe5360a7fbb1758fc841.1383322030.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383322030.git.paul.eggleton@linux.intel.com>
References: <cover.1383322030.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383322030.git.paul.eggleton@linux.intel.com>
References: <cover.1383322030.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] documentation.conf: update contents
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
X-List-Received-Date: Fri, 01 Nov 2013 16:09:49 -0000

From: Belen Barros Pena <belen.barros.pena@intel.com>

This patch updates descriptions and brings more
info for the variable configurations as documented
in the OE-Core manual.

This file is used by Toaster to display help for
the configuration variables.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index ecc7c8f..6666648 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -42,6 +42,7 @@ CFLAGS[doc] = "Flags passed to the C compiler for the target system. This variab
 COMBINED_FEATURES[doc] = "A set of features common between MACHINE_FEATURES and DISTRO_FEATURES."
 COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or more hosts (when the recipe is native) or one or more targets (when the recipe is non-native) with which a recipe is compatible."
 COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more target machines with which a recipe is compatible."
+CONF_VERSION[doc] = "Increased each time build/conf/ changes incompatibly and used to track the version of local.conf"
 CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
 CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
@@ -117,6 +118,7 @@ IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image du
 IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
+IMAGETEST[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
@@ -170,18 +172,10 @@ MLPREFIX[doc] = "Specifies a prefix has been added to PN to create a special ver
 MODULE_TARBALL_DEPLOY[doc] = "Controls creation of the modules-*.tgz file. Set this variable to "0" to disable creation of this file, which contains all of the kernel modules resulting from a kernel build."
 MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that you can build for multiple target machines using the same output directories."
 
-BAD_RECOMMENDATIONS[doc] = "List of packages to not install if recommended.  These will still be installed if required."
-NO_RECOMMENDATIONS[doc] = "When set to 1, no recommended packages will be installed.  Note: some recommended packages may be required for certain system functionality, such as kernel-modules.  It is up to the user to add packages to IMAGE_INSTALL as needed."
-
-IMAGE_INSTALL[doc] = "Used by an image recipe to list the packages to be installed.  See PACKAGE_INSTALL."
-
-PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation, if required an error will be generated."
-PACKAGE_INSTALL[doc] = "Generally not user defined.  List of the packages to be installed into the image, uses IMAGE_INSTALL as part of the list."
-PACKAGE_INSTALL_ATTEMPTONLY[doc] = "Generally not user defined.  List of packages that will be attempted to be installed, but no error will generate if any of them fail to install."
-
 #N
 
 NATIVELSBSTRING[doc] = "A string identifying the host distribution."
+NO_RECOMMENDATIONS[doc] = "When set to 1, no recommended packages will be installed. Note: some recommended packages may be required for certain system functionality, such as kernel-modules. It is up to the user to add packages to IMAGE_INSTALL as needed."
 
 #O
 
@@ -194,12 +188,16 @@ PACKAGE_ARCH[doc] = "The architecture of the resulting package or packages."
 PACKAGE_ARCHS[doc] = "A list of architectures compatible with the given target in order of priority."
 PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN} so that the packages can pick up files that would normally be included in the default package."
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
+PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation, if required an error will be generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
+PACKAGE_INSTALL[doc] = "Generally not user defined. List of the packages to be installed into the image, uses IMAGE_INSTALL as part of the list."
+PACKAGE_INSTALL_ATTEMPTONLY[doc] = "Generally not user defined. List of packages that will be attempted to be installed, but no error will generate if any of them fail to install."
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] = "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] = "A promise that your recipe satisfies runtime dependencies for optional modules that are found in other recipes."
 PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to yes, if you want to build qt apps with CONFIG+=thread"
 PARALLEL_MAKE[doc] = "Specifies extra options that are passed to the make command during the compile tasks. This variable is usually in the form -j 4, where the number represents the maximum number of parallel threads make can run."
+PATCHRESOLVE[doc] = "Enable / disable interactive patch resolution."
 PE[doc] = "The epoch of the recipe. The default value is '0'. The field is used to make upgrades possible when the versioning scheme changes in some backwards incompatible way."
 PF[doc] = "Specifies the recipe or package name and includes all version and revision numbers. This variable is comprised of ${PN}-${EXTENDPE}${PV}-${PR}"
 PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenEmbedded build system as input to create a package. It refers to a package name in the context of a file created or produced by the OpenEmbedded build system."
@@ -227,6 +225,7 @@ RSUGGESTS[doc] = "A list of additional packages that you can suggest for install
 S[doc] = "The location in the Build Directory where unpacked package source code resides."
 SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that the build system has been tested against."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command '$ bitbake -c populate_sdk imagename'."
+SDKMACHINE[doc] = "Specifies the architecture (i686 or x86_64) to build SDK/ADT tiems for."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = "1". In this case the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter and after booting occurs getty is started on that port so remote login is possible."
@@ -263,6 +262,8 @@ TARGET_PREFIX[doc] = "The prefix for the cross compile toolchain. E.g arm-linux-
 TARGET_SYS[doc] = "The target system is composed out of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
 TCLIBC[doc] = "Specifies which variant of the GNU standard C library (libc) to use during the build process. You can select eglibc or uclibc."
 TCMODE[doc] = "The toolchain selector. It selects the external toolchain built using the OpenEmbedded build system or a few supported combinations of the upstream GCC or CodeSourcery Labs toolchain."
+TEST_SCEN[doc] = "Controls which tests are run against virtual images if testing is enabled with IMAGETEST."
+TEST_SERIALIZE[doc] = "Controls the time taken by the sanity tests."
 TIME[doc] = "The time the build was started HMS"
 TMPDIR[doc] = "This variable is the temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
 TOPDIR[doc] = "This variable is the Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
@@ -272,6 +273,10 @@ TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values; if unset, a
 TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
 TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
 
+#T
+
+USER_CLASSES[doc] = "List of additional classes to use when building images which enable extra features."
+
 #W
 
 WORKDIR[doc] = "The pathname of the working directory in which the OpenEmbedded build system builds a recipe. This directory is located within the TMPDIR directory structure and changes as different packages are built."
-- 
1.8.1.2


