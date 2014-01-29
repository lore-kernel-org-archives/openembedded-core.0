Return-Path: <ddalex@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C10106EA9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 17:21:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2014 09:21:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,743,1384329600"; d="scan'208";a="472744726"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2014 09:21:43 -0800
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 00A15563D51; Wed, 29 Jan 2014 17:21:55 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 17:21:51 +0000
Message-Id: <1391016111-7447-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391016111-7447-1-git-send-email-alexandru.damian@intel.com>
References: <1391016111-7447-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/2] documentation.conf: update task descriptions
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
X-List-Received-Date: Wed, 29 Jan 2014 17:21:46 -0000

From: "Barros Pena, Belen" <belen.barros.pena@intel.com>

This patch updates the task descriptions in documentation.conf

It also has a bunch of grammar fixes for the variable descriptions.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/conf/documentation.conf | 161 ++++++++++++++++++++++++++++---------------
 1 file changed, 107 insertions(+), 54 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c96ddd3..a1d421c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -1,13 +1,66 @@
 # this file holds documentation for known keys, possible values and
-# their meaning. Please update, correct and extend this documentation.
+# their meanings. Please update, correct and extend this documentation.
 # Mail your changes to openembedded-devel@openembedded.org
 
+# DESCRIPTIONS FOR TASKS #
+
+do_bootimg[doc] = "Creates a bootable live image"
+do_build[doc] = "Default task for a recipe - depends on all other normal tasks required to 'build' a recipe"
+do_bundle_initramfs[doc] = "Combines an initial ramdisk image and kernel together to form a single image"
+do_checkuri[doc] = "Validates the SRC_URI value"
+do_checkuriall[doc] = "Validates the SRC_URI value for all recipes required to build a target"
+do_clean[doc] = "Removes all output files for a target"
+do_cleanall[doc] = "Removes all output files, shared state cache, and downloaded source files for a target"
+do_cleansstate[doc] = "Removes all output files and shared state cache for a target"
+do_compile[doc] = "Compiles the source in the compilation directory"
+do_compile_kernelmodules[doc] = "Compiles loadable modules for the Linux kernel"
+do_compile_ptest_base[doc] = "Compiles the runtime test suite included in the software being built"
+do_configure[doc] = "Configures the source by enabling and disabling any build-time and configuration options for the software being built"
+do_configure_ptest_base[doc] = "Configures the runtime test suite included in the software being built"
+do_deploy[doc] = "Writes deployable output files to the deploy directory"
+do_fetch[doc] = "Fetches the source code"
+do_fetchall[doc] = "Fetches all remote sources required to build a target"
+do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
+do_install[doc] = "Copies files from the compilation directory to a holding area"
+do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
+do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
+do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
+do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
+do_kernel_link_vmlinux[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux kernel images"
+do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
+do_package_index[doc] = "Creates or updates the index in the Package Feed area"
+do_package_write[doc] = "Creates the actual packages and places them in the Package Feed area"
+do_package_write_deb[doc] = "Creates the actual DEB packages and places them in the Package Feed area"
+do_package_write_ipk[doc] = "Creates the actual IPK packages and places them in the Package Feed area"
+do_package_write_rpm[doc] = "Creates the actual RPM packages and places them in the Package Feed area"
+do_package_write_tar[doc] = "Creates tar archives for packages and places them in the Package Feed area"
+do_packagedata[doc] = "Creates package metadata used by the build system to generate the final packages"
+do_patch[doc] = "Locates patch files and applies them to the source code"
+do_populate_lic[doc] = "Writes license information for the recipe that is collected later when the image is constructed"
+do_populate_sdk[doc] = "Creates the file and directory structure for an installable SDK"
+do_populate_sysroot[doc] = "Copies a subset of files installed by do_install into the sysroot in order to make them available to other recipes"
+do_rm_work[doc] = "Removes work files after the build system has finished with them"
+do_rm_work_all[doc] = "Top-level task for removing work files after the build system has finished with them"
+do_rootfs[doc] = "Creates the root filesystem (file and directory structure) for an image"
+do_savedefconfig[doc] = "Creates a minimal Linux kernel configuration file"
+do_sizecheck[doc] = "Checks the size of the kernel image against KERNEL_IMAGE_MAXSIZE (if set)"
+do_spdx[doc] = "A build stage that takes the source code and scans it on a remote FOSSOLOGY server in order to produce an SPDX document"
+do_strip[doc] = "Strips unneeded sections out of the Linux kernel image"
+do_testimage[doc] = "Boots an image and performs runtime tests within the image"
+do_testimage_auto[doc] = "Boots an image and performs runtime tests within the image immediately after it has been built"
+do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bootloader"
+do_unpack[doc] = "Unpacks the source code into a working directory"
+do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
+do_vmdkimg[doc] = "Creates a .vmdk image for use with VMware and compatible virtual machine hosts"
+
+# DESCRIPTIONS FOR VARIABLES #
+
 #A
 
 ALLOW_EMPTY[doc] = "Specifies if an output package should still be produced if it is empty."
-ASSUME_PROVIDED[doc] = "List of packages (recipes actually) which are assumed to be implicitly available. These packages won't be built by BitBake."
-ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED, for which automatic shlib dependency tracking doesn't work."
-AUTHOR[doc] = "The email address used to contact the original author(s) in order to send patches and forward bugs."
+ASSUME_PROVIDED[doc] = "List of packages (recipes actually) that are assumed to be implicitly available. BitBake does not build these packages."
+ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED, for which automatic shlib dependency tracking does not work."
+AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
 AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies to use the latest source revision in the repository."
 
 #B
@@ -31,8 +84,8 @@ BBLAYERS[doc] = "Lists the layers to enable during the build. This variable is d
 BBLAYERS_NON_REMOVABLE[doc] = "Lists core layers that cannot be removed from the bblayers.conf file."
 BP[doc] = "The base recipe name and version but without any special recipe name suffix (i.e. -native, lib64-, and so forth). BP is comprised of ${BPN}-${PV}"
 BPN[doc] = "The bare name of the recipe. This variable is a version of the PN variable but removes common suffixes and prefixes."
-BUILD_ARCH[doc] = "The name of the building architecture. E.g. i686."
-BUILD_OS[doc] = "The operating system (in lower case) of the building architecture. E.g linux."
+BUILD_ARCH[doc] = "The name of the building architecture (e.g. i686)."
+BUILD_OS[doc] = "The operating system (in lower case) of the building architecture (e.g. linux)."
 BUILDDIR[doc] = "Points to the location of the Build Directory."
 
 #C
@@ -42,7 +95,7 @@ CFLAGS[doc] = "Flags passed to the C compiler for the target system. This variab
 COMBINED_FEATURES[doc] = "A set of features common between MACHINE_FEATURES and DISTRO_FEATURES."
 COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or more hosts (when the recipe is native) or one or more targets (when the recipe is non-native) with which a recipe is compatible."
 COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more target machines with which a recipe is compatible."
-CONF_VERSION[doc] = "Increased each time build/conf/ changes incompatibly and used to track the version of local.conf"
+CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
 CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
 CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
@@ -51,8 +104,8 @@ CVSDIR[doc] = "The directory where cvs checkouts will be stored in."
 #D
 
 D[doc] = "The destination directory."
-DATE[doc] = "The date the build was started YMD."
-DATETIME[doc] = "The date and time the build was started at."
+DATE[doc] = "The date the build was started using YMD format."
+DATETIME[doc] = "The date and time the build was started."
 DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
 DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-O -fno-omit-frame-pointer -g'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
@@ -68,12 +121,12 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from DISTRO_FEATURES_BACKFI
 DISTRO_NAME[doc] = "The long name of the distribution."
 DISTRO_PN_ALIAS[doc] = "Alias names used for the recipe in various Linux distributions."
 DISTRO_VERSION[doc] = "The version of the distribution."
-DISTROOVERRIDES[doc] = "This variable lists overrides specific to the current distribution. By default, the variable list includes the value of the DISTRO variable."
+DISTROOVERRIDES[doc] = "Lists overrides specific to the current distribution. By default, the variable list includes the value of the DISTRO variable."
 DL_DIR[doc] = "The central download directory used by the build process to store downloads. By default, the directory is 'downloads' in the Build Directory."
 
 #E
 
-ENABLE_BINARY_LOCALE_GENERATION[doc] = "Variable that controls which locales for eglibc are generated during the build (useful if the target device has 64Mbytes of RAM or less)."
+ENABLE_BINARY_LOCALE_GENERATION[doc] = "Controls which locales for eglibc are generated during the build. The variable is useful if the target device has 64Mbytes of RAM or less."
 EXTENDPE[doc] = "Used with file and pathnames to create a prefix for a recipe's version based on the recipe's PE value. If PE is set and greater than zero for a recipe, EXTENDPE becomes that value."
 EXTRA_IMAGE_FEATURES[doc] = "The list of additional features to include in an image. Configure this variable in the conf/local.conf file in the Build Directory."
 EXTRA_IMAGEDEPENDS[doc] = "A list of recipes to build that do not provide packages for installing into the root filesystem. Use this variable to list recipes that are required to build the final image, but not needed in the root filesystem."
@@ -83,7 +136,7 @@ EXTRA_OEMAKE[doc] = "Additional GNU make options."
 
 #F
 
-FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy dir as an adhoc feed (bogofeed). Set to base URL of the dir as exported by HTTP. Set of adhoc feed configs will be generated in image."
+FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy directory as an ad hoc feed (bogofeed). Set to base URL of the directory as exported by HTTP. Set of ad hoc feed configs will be generated in the image."
 FILES[doc] = "The list of directories or files that are placed in packages."
 FILESEXTRAPATHS[doc] = "Extends the search path the OpenEmbedded build system uses when looking for files and patches as it processes recipes and append files."
 FILESPATH[doc] = "The default set of directories the OpenEmbedded build system uses when searching for patches and files. It is defined in the base.bbclass class found in meta/classes in the Source Directory. Do not hand-edit the FILESPATH variable."
@@ -92,20 +145,20 @@ FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when co
 
 #G
 
-GITDIR[doc] = "The directory where git clones will be stored."
+GITDIR[doc] = "The directory where Git clones will be stored."
 GROUP_dependencies[doc] = "The keys in this group influence the dependency handling of BitBake and the resulting packages."
-GROUP_fetcher[doc] = "The key highly influence the fetcher implementations."
+GROUP_fetcher[doc] = "This key highly influences the fetcher implementations."
 GROUP_locale[doc] = "Locale generation of the GNU libc implementation."
-GROUP_packaging[doc] = "The keys in this group influence the package building process. They influence which packages will be generated and which files will be present in the generated packages."
+GROUP_packaging[doc] = "The keys in this group influence the package building process. Specifically, they influence what packages will be generated and what files will be present in the generated packages."
 
 #H
 
 HOMEPAGE[doc] = "Website where more information about the software the recipe is building can be found."
 HOST_ARCH[doc] = "The name of the target architecture. Normally same as the TARGET_ARCH."
-HOST_CC_ARCH[doc] = "Normally same as the TARGET_CC_ARCH."
-HOST_NONSYSV[doc] = "This flag can be set to '1' if the host system is not SysV compatible. E.g. fakeroot-native will be build with tcp as IPC implementation."
+HOST_CC_ARCH[doc] = "The name of the host architecture. Normally same as the TARGET_CC_ARCH."
+HOST_NONSYSV[doc] = "Set to '1' if the host system is not SysV compatible (e.g. fakeroot-native will be build with tcp as IPC implementation)."
 HOST_OS[doc] = "The name of the target operating system. Normally the same as the TARGET_OS."
-HOST_PREFIX[doc] = "Normally same as the TARGET_PREFIX."
+HOST_PREFIX[doc] = "The prefix for the cross compile toolchain. Normally same as the TARGET_PREFIX."
 HOST_SYS[doc] = "Specifies the system, including the architecture and the operating system, for with the build is occurring in the context of the current recipe."
 HOST_VENDOR[doc] = "The name of the vendor. Normally same as the TARGET_VENDOR."
 
@@ -131,19 +184,19 @@ IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
 
 KARCH[doc] = "Defines the kernel architecture used when assembling the configuration. You define the KARCH variable in the BSP Descriptions."
 KBRANCH[doc] = "A regular expression used by the build process to explicitly identify the kernel branch that is validated, patched and configured during a build."
-KBRANCH_DEFAULT[doc] = "Defines the Linux kernel source repository's default branch used to build the Linux kernel. Unless you specify otherwise, initializes to 'master'."
+KBRANCH_DEFAULT[doc] = "Defines the Linux kernel source repository's default branch used to build the Linux kernel. Unless you specify otherwise, the variable initializes to 'master'."
 KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
 KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kernel Git repository. The metadata you add through this variable includes config fragments and features descriptions."
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
-KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module.bbclass class."
-KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module.bbclass class."
+KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
+KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
 KMACHINE[doc] = "The machine as known by the kernel."
 KTYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 
 #L
 
-LAYERDEPENDS[doc] = "Lists the layers that this recipe depends upon, separated by spaces. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
+LAYERDEPENDS[doc] = "Lists the layers, separated by spaces, upon which this recipe depends. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
 LAYERDIR[doc] = "When used inside the layer.conf configuration file, this variable provides the path of the current layer."
 LAYERVERSION[doc] = "Optionally specifies the version of a layer as a single number. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
 LIC_FILES_CHKSUM[doc] = "Checksums of the license text in the recipe source code."
@@ -160,7 +213,7 @@ MACHINE[doc] = "Specifies the target device for which the image is built. You de
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS[doc] = "A list of required machine-specific packages to install as part of the image being built. Because this is a 'machine essential' variable, the list of packages are essential for the machine to boot."
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS[doc] = "A list of recommended machine-specific packages to install as part of the image being built. Because this is a 'machine essential' variable, the list of packages are essential for the machine to boot."
 MACHINE_EXTRA_RDEPENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for the machine to boot. However, the build process for more fully-featured images depends on the packages being present."
-MACHINE_EXTRA_RRECOMMENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for booting the machine. The image being built has no build dependency on this list of packages."
+MACHINE_EXTRA_RRECOMMENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for booting the machine. The image being built has no build dependencies on the packages in this list."
 MACHINE_FEATURES[doc] = "Specifies the list of hardware features the MACHINE supports."
 MACHINE_FEATURES_BACKFILL[doc] = "Features to be added to MACHINE_FEATURES if not also present in MACHINE_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and is not intended to be user-configurable."
 MACHINE_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from MACHINE_FEATURES_BACKFILL that should not be backfilled (i.e. added to MACHINE_FEATURES) during the build."
@@ -174,7 +227,7 @@ MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that yo
 #N
 
 NATIVELSBSTRING[doc] = "A string identifying the host distribution."
-NO_RECOMMENDATIONS[doc] = "When set to 1, no recommended packages will be installed. Note: some recommended packages may be required for certain system functionality, such as kernel-modules. It is up to the user to add packages to IMAGE_INSTALL as needed."
+NO_RECOMMENDATIONS[doc] = "When set to '1', no recommended packages will be installed. Realize that some recommended packages might be required for certain system functionality, such as kernel-modules. It is up to the user to add packages to IMAGE_INSTALL as needed."
 
 #O
 
@@ -182,31 +235,31 @@ OE_TERMINAL[doc] = "Controls how the OpenEmbedded build system spawns interactiv
 
 #P
 
-P[doc] = "The recipe name and version. P is comprised of ${PN}-${PV}"
+P[doc] = "The recipe name and version. P is comprised of ${PN}-${PV}."
 PACKAGE_ARCH[doc] = "The architecture of the resulting package or packages."
 PACKAGE_ARCHS[doc] = "A list of architectures compatible with the given target in order of priority."
 PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN} so that the packages can pick up files that would normally be included in the default package."
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
-PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation, if required an error will be generated."
+PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
-PACKAGE_INSTALL[doc] = "Generally not user defined. List of the packages to be installed into the image, uses IMAGE_INSTALL as part of the list."
-PACKAGE_INSTALL_ATTEMPTONLY[doc] = "Generally not user defined. List of packages that will be attempted to be installed, but no error will generate if any of them fail to install."
+PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
+PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed. If a listed package fails to install, the build system does not generate an error. This variable is generally not user-defined."
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] = "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] = "A promise that your recipe satisfies runtime dependencies for optional modules that are found in other recipes."
-PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to yes, if you want to build qt apps with CONFIG+=thread"
+PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to 'yes', if you want to build QT applications with CONFIG+=thread."
 PARALLEL_MAKE[doc] = "Specifies extra options that are passed to the make command during the compile tasks. This variable is usually in the form -j 4, where the number represents the maximum number of parallel threads make can run."
-PATCHRESOLVE[doc] = "Enable / disable interactive patch resolution."
+PATCHRESOLVE[doc] = "Enable or disable interactive patch resolution."
 PE[doc] = "The epoch of the recipe. The default value is '0'. The field is used to make upgrades possible when the versioning scheme changes in some backwards incompatible way."
-PF[doc] = "Specifies the recipe or package name and includes all version and revision numbers. This variable is comprised of ${PN}-${EXTENDPE}${PV}-${PR}"
+PF[doc] = "Specifies the recipe or package name and includes all version and revision numbers. This variable is comprised of ${PN}-${EXTENDPE}${PV}-${PR}."
 PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenEmbedded build system as input to create a package. It refers to a package name in the context of a file created or produced by the OpenEmbedded build system."
 PR[doc] = "The revision of the recipe. The default value for this variable is 'r0'."
 PREMIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
 PRINC[doc] = "Causes the PR variable of .bbappend files to dynamically increment. This increment minimizes the impact of layer ordering. This variable defaults to '0'."
-PRIORITY[doc] = "Importance of package, the default value is 'optional', other standard values are 'required', 'standard' and 'extra'."
-PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build (as specified by DEPENDS)."
-PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
-PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
+PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'optional'.  Other standard values are 'required', 'standard' and 'extra'."
+PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build as specified by DEPENDS."
+PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines what recipe should be given preference."
+PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines what recipe should be given preference."
 PV[doc] = "The version of the recipe. The version is normally extracted from the recipe filename."
 
 #R
@@ -223,20 +276,20 @@ RSUGGESTS[doc] = "A list of additional packages that you can suggest for install
 
 S[doc] = "The location in the Build Directory where unpacked package source code resides."
 SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that the build system has been tested against."
-SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command '$ bitbake -c populate_sdk imagename'."
-SDKMACHINE[doc] = "Specifies the architecture (i686 or x86_64) to build SDK/ADT tiems for."
+SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
+SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = "1". In this case the value of DEBUG_OPTIMIZATION is used."
-SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter and after booting occurs getty is started on that port so remote login is possible."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
+SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter. After booting occurs, getty is started on that port so remote login is possible."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SITEINFO_ENDIANNESS[doc] = "Specifies the endian byte order of the target system. The value should be either 'le' for 'little-endian' or 'be' for 'big-endian'."
 SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU. The value should be either '32' or '64'."
 SOC_FAMILY[doc] = "Groups together machines based upon the same family of SOC (System On Chip). You typically set this variable in a common .inc file that you include in the configuration files of all the machines."
 SOURCE_MIRROR_FETCH[doc] = "Switch marking build as source fetcher. Used to skip COMPATIBLE_* checking."
-SOURCE_MIRROR_URL[doc] = "URL to source mirror which will be used before fetching from original SRC_URI."
+SOURCE_MIRROR_URL[doc] = "URL to source mirror that will be used before fetching from original SRC_URI."
 SPECIAL_PKGSUFFIX[doc] = "A list of prefixes for PN used by the OpenEmbedded build system to create variants of recipes or packages. The list specifies the prefixes to strip off during certain circumstances such as the generation of the BPN variable."
-SRC_URI[doc] = "The list of source files - local or remote. This variable tells the OpenEmbedded build system which bits to pull in for the build and how to pull them in."
+SRC_URI[doc] = "The list of source files - local or remote. This variable tells the OpenEmbedded build system what bits to pull in for the build and how to pull them in."
 SRC_URI_OVERRIDES_PACKAGE_ARCH[doc] = "By default, the OpenEmbedded build system automatically detects whether SRC_URI contains files that are machine-specific. If so, the build system automatically changes PACKAGE_ARCH. Setting this variable to '0' disables this behavior."
 SRCDATE[doc] = "The date of the source code used to build the package. This variable applies only if the source was fetched from a Source Code Manager (SCM)."
 SRCPV[doc] = "Returns the version string of the current package. This string is used to help define the value of PV."
@@ -246,9 +299,9 @@ SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 SUMMARY[doc] = "The short (72 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
-SVNDIR[doc] = "The directory where subversion checkouts will be stored."
+SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
 SYSROOT_PREPROCESS_FUNCS[doc] = "A list of functions to execute after files are staged into the sysroot. These functions are usually used to apply additional processing on the staged files, or to stage additional files."
-SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the default is 1."
+SYSVINIT_ENABLED_GETTYS[doc] = "Specifies which virtual terminals should be running a getty, the default is '1'."
 
 #T
 
@@ -257,23 +310,23 @@ TARGET_ARCH[doc] = "The architecture of the device being built. The OpenEmbedded
 TARGET_CFLAGS[doc] = "Flags passed to the C compiler for the target system. This variable evaluates to the same as CFLAGS."
 TARGET_FPU[doc] = "Specifies the method for handling FPU code. For FPU-less targets, which include most ARM CPUs, the variable must be set to 'soft'. If not, the kernel emulation gets used, which results in a performance penalty."
 TARGET_OS[doc] = "Specifies the target's operating system."
-TARGET_PREFIX[doc] = "The prefix for the cross compile toolchain. E.g arm-linux- ."
-TARGET_SYS[doc] = "The target system is composed out of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
-TCLIBC[doc] = "Specifies which variant of the GNU standard C library (libc) to use during the build process. You can select eglibc or uclibc."
+TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux-)."
+TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
+TCLIBC[doc] = "Specifies GNU standard C library (libc) variant to use during the build process. You can select 'eglibc' or 'uclibc'."
 TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
-TEST_IMAGE[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
-TIME[doc] = "The time the build was started HMS"
-TMPDIR[doc] = "This variable is the temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
-TOPDIR[doc] = "This variable is the Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
+TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
+TIME[doc] = "The time the build was started using HMS format."
+TMPDIR[doc] = "The temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
+TOPDIR[doc] = "The Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
 TUNEABI[doc] = "An underlying ABI used by a particular tuning in a given toolchain layer. This feature allows providers using prebuilt libraries to check compatibility of a tuning against their selection of libraries."
 TUNEABI_OVERRIDE[doc] = "If set, ignores TUNEABI_WHITELIST."
-TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values; if unset, all are allowed."
+TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values.  If the variable is not set, all values are allowed."
 TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
-TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
+TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
 
-#T
+#U
 
-USER_CLASSES[doc] = "List of additional classes to use when building images which enable extra features."
+USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
 
 #W
 
-- 
1.8.3.2


