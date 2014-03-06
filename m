Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 026136F57E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311085"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:12 +0000
Message-Id: <d36610a69d47417f498d3eddd626dc2725784f9b.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] documentation.conf: sync with the Yocto Project reference manual
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:33 -0000

From: Belen Barros Pena <belen.barros.pena@intel.com>

Make sure variables listed in the Glossary section of the reference
manual are listed here. There are still some listed here that aren't in
the manual; this should be fixed in the manual.

Signed-off-by: Belen Barros Pena <belen.barros.pena@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 133 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 9 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index e709c68..53c3da2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -62,9 +62,14 @@ do_vmdkimg[doc] = "Creates a .vmdk image for use with VMware and compatible virt
 #A
 
 ALLOW_EMPTY[doc] = "Specifies if an output package should still be produced if it is empty."
+ALTERNATIVE[doc] = "Lists commands in a package that need an alternative binary naming scheme."
+ALTERNATIVE_LINK_NAME[doc] = "Used by the alternatives system to map duplicated commands to actual locations."
+ALTERNATIVE_PRIORITY[doc] = "Used by the alternatives system to create default priorities for duplicated commands."
+ALTERNATIVE_TARGET[doc] = "Used by the alternatives system to create default link locations for duplicated commands."
 ASSUME_PROVIDED[doc] = "List of packages (recipes actually) that are assumed to be implicitly available. BitBake does not build these packages."
 ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED, for which automatic shlib dependency tracking does not work."
 AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
+AUTO_SYSLINUXMENU[doc] = "Enables creating an automatic menu for the syslinux bootloader."
 AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies to use the latest source revision in the repository."
 
 #B
@@ -74,35 +79,46 @@ BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being reco
 BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
 BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
 BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."
-BBCLASSEXTEND[doc] = "Allows you to extend a recipe so that it builds variants of the software. Common variants for recipes are 'natives', 'crosses', 'nativesdk' and 'multilibs'."
-BBMASK[doc] = "Prevents BitBake from processing recipes and recipe append files. Use the BBMASK variable from within the conf/local.conf file in the Build Directory."
+BB_GENERATE_MIRROR_TARBALLS[doc] = "Causes tarballs of the Git repositories to be placed in the DL_DIR directory."
 BB_NUMBER_THREADS[doc] = "The maximum number of tasks BitBake should run in parallel at any one time. A good rule of thumb is to set this variable to twice the number of cores."
+BBCLASSEXTEND[doc] = "Allows you to extend a recipe so that it builds variants of the software. Common variants for recipes are 'native', 'cross', 'nativesdk' and multilibs."
 BBFILE_COLLECTIONS[doc] = "Lists the names of configured layers. These names are used to find the other BBFILE_* variables."
 BBFILE_PATTERN[doc] = "Variable that expands to match files from BBFILES in a particular layer. This variable is used in the layer.conf file and must be suffixed with the name of a layer."
 BBFILE_PRIORITY[doc] = "Assigns the priority for recipe files in each layer. Setting this variable allows you to prioritize a layer against other layers that contain the same recipe."
 BBFILES[doc] = "List of recipe files used by BitBake to build software."
-BBPATH[doc] = "Used by BitBake to locate .bbclass and configuration files. This variable is analogous to the PATH variable."
 BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure."
 BBINCLUDELOGS_LINES[doc] = "Amount of log lines printed on failure."
 BBLAYERS[doc] = "Lists the layers to enable during the build. This variable is defined in the bblayers.conf configuration file."
 BBLAYERS_NON_REMOVABLE[doc] = "Lists core layers that cannot be removed from the bblayers.conf file."
+BBMASK[doc] = "Prevents BitBake from processing specific recipes or recipe append files. Use the BBMASK variable from within conf/local.conf."
+BBPATH[doc] = "Used by BitBake to locate .bbclass and configuration files. This variable is analogous to the PATH variable."
+BBSERVER[doc] = "Points to the server that runs memory-resident BitBake."
+BINCONFIG_GLOB[doc] = "When inheriting binconfig.bbclass from a recipe, this variable specifies a wildcard for configuration scripts that need editing."
 BP[doc] = "The base recipe name and version but without any special recipe name suffix (i.e. -native, lib64-, and so forth). BP is comprised of ${BPN}-${PV}"
 BPN[doc] = "The bare name of the recipe. This variable is a version of the PN variable but removes common suffixes and prefixes."
+BUGTRACKER[doc] = "Specifies a URL for an upstream bug tracking website for a recipe."
 BUILD_ARCH[doc] = "The name of the building architecture (e.g. i686)."
 BUILD_OS[doc] = "The operating system (in lower case) of the building architecture (e.g. linux)."
 BUILDDIR[doc] = "Points to the location of the Build Directory."
+BUILDSTATS_BASE[doc] = "Points to the location of the directory that holds build statistics when you use and enable the buildstats class."
+BUSYBOX_SPLIT_SUID[doc] = "For the BusyBox recipe, specifies whether to split the output executable file into two parts: one for features that require setuid root, and one for the remaining features."
 
 #C
 
 CACHE[doc]  = "The directory holding the cache of the metadata."
 CFLAGS[doc] = "Flags passed to the C compiler for the target system. This variable evaluates to the same as TARGET_CFLAGS."
+CLASSOVERRIDE[doc] = "An internal variable specifying the special class override that should currently apply (e.g. "class-target", "class-native", and so forth)."
 COMBINED_FEATURES[doc] = "A set of features common between MACHINE_FEATURES and DISTRO_FEATURES."
+COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in the Source Directory, which is where generic license files reside."
 COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or more hosts (when the recipe is native) or one or more targets (when the recipe is non-native) with which a recipe is compatible."
 COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more target machines with which a recipe is compatible."
-CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
+COMPLEMENTARY_GLOB[doc] = "Defines wildcards to match when installing a list of complementary packages for all the packages installed in an image."
 CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
 CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
+CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
+COREBASE[doc] = "Specifies the parent directory of the OpenEmbedded Core Metadata layer (i.e. meta)."
+CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
 CVSDIR[doc] = "The directory where cvs checkouts will be stored in."
 
 #D
@@ -114,6 +130,9 @@ DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This
 DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-O -fno-omit-frame-pointer -g'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
+DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
+DEPLOY_DIR_IMAGE[doc] = "Points to the area that the OpenEmbedded build system uses to place images and other associated output files that are ready to be deployed onto the target machine."
+DEPLOYDIR[doc] = "For recipes that inherit the deploy class, the DEPLOYDIR points to a temporary work area for deployed files."
 DESCRIPTION[doc] = "The package description used by package managers. If not set, DESCRIPTION takes the value of the SUMMARY variable."
 DISTRO[doc] = "The short name of the distribution. If the variable is blank, meta/conf/distro/defaultsetup.conf will be used."
 DISTRO_EXTRA_RDEPENDS[doc] = "Specifies a list of distro-specific packages to add to all images. The variable only applies to the images that include packagegroup-base."
@@ -130,25 +149,42 @@ DL_DIR[doc] = "The central download directory used by the build process to store
 #E
 
 ENABLE_BINARY_LOCALE_GENERATION[doc] = "Controls which locales for eglibc are generated during the build. The variable is useful if the target device has 64Mbytes of RAM or less."
+ERROR_QA[doc] = "Specifies the quality assurance checks whose failures are reported as errors by the OpenEmbedded build system."
+EXCLUDE_FROM_WORLD[doc] = "Directs BitBake to exclude a recipe from world builds (i.e. bitbake world)."
 EXTENDPE[doc] = "Used with file and pathnames to create a prefix for a recipe's version based on the recipe's PE value. If PE is set and greater than zero for a recipe, EXTENDPE becomes that value."
+EXTENDPKGV[doc] = "The full package version specification as it appears on the final packages produced by a recipe."
+EXTERNALSRC[doc] = "If externalsrc.bbclass is inherited, this variable points to the source tree, which is outside of the OpenEmbedded build system."
+EXTERNALSRC_BUILD[doc] = "If externalsrc.bbclass is inherited, this variable points to the directory in which the recipe's source code is built, which is outside of the OpenEmbedded build system."
 EXTRA_IMAGE_FEATURES[doc] = "The list of additional features to include in an image. Configure this variable in the conf/local.conf file in the Build Directory."
 EXTRA_IMAGEDEPENDS[doc] = "A list of recipes to build that do not provide packages for installing into the root filesystem. Use this variable to list recipes that are required to build the final image, but not needed in the root filesystem."
 EXTRA_OECMAKE[doc] = "Additional cmake options."
 EXTRA_OECONF[doc] = "Additional configure script options."
 EXTRA_OEMAKE[doc] = "Additional GNU make options."
+EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable specifies additional configuration options you want to pass to the scons command line."
+EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
+EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
+EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
 
 #F
 
 FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy directory as an ad hoc feed (bogofeed). Set to base URL of the directory as exported by HTTP. Set of ad hoc feed configs will be generated in the image."
 FILES[doc] = "The list of directories or files that are placed in packages."
 FILESEXTRAPATHS[doc] = "Extends the search path the OpenEmbedded build system uses when looking for files and patches as it processes recipes and append files."
+FILESOVERRIDES[doc] = "A subset of OVERRIDES used by the OpenEmbedded build system for creating FILESPATH."
 FILESPATH[doc] = "The default set of directories the OpenEmbedded build system uses when searching for patches and files. It is defined in the base.bbclass class found in meta/classes in the Source Directory. Do not hand-edit the FILESPATH variable."
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
+FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
 FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2'."
 
 #G
 
 GITDIR[doc] = "The directory where Git clones will be stored."
+GROUPADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the groupadd command if you wish to add a group to the system when the package is installed."
+GROUPMEMS_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the groupmems command if you wish to modify the members of a group when the package is installed."
+GRUB_GFXSERIAL[doc] = "Configures the GNU GRand Unified Bootloader (GRUB) to have graphics and serial in the boot menu."
+GRUB_OPTS[doc] = "Additional options to add to the GNU GRand Unified Bootloader (GRUB) configuration."
+GRUB_TIMEOUT[doc] = "Specifies the timeout before executing the default LABEL in the GNU GRand Unified Bootloader (GRUB)."
+GTKIMMODULES_PACKAGES[doc] = "For recipes that inherit the gtk-immodules-cache class, this variable specifies the packages that contain the GTK+ input method modules being installed when the modules are in packages other than the main package."
 
 #H
 
@@ -162,18 +198,35 @@ HOST_VENDOR[doc] = "The name of the vendor. Normally same as the TARGET_VENDOR."
 
 #I
 
+ICECC_ENV_EXEC[doc] = "Points to the icecc-create-env script that you provide."
+ICECC_PATH[doc] = "The location of the icecc binary."
+ICECC_USER_CLASS_BL[doc] = "Identifies user classes that you do not want the Icecream distributed compile support to consider."
+ICECC_USER_PACKAGE_BL[doc] = "Identifies user recipes that you do not want the Icecream distributed compile support to consider."
+ICECC_USER_PACKAGE_WL[doc] = "Identifies user recipes that use an empty PARALLEL_MAKE variable that you want to force remote distributed compilation on using the Icecream distributed compile support."
+IMAGE_BASENAME[doc] = "The base name of image output files."
+IMAGE_CLASSES[doc] = "A list of classes that all images should inherit."
 IMAGE_FEATURES[doc] = "The primary list of features to include in an image. Configure this variable in an image recipe."
 IMAGE_FSTYPES[doc] = "Formats of root filesystem images that you want to have created."
 IMAGE_INSTALL[doc] = "Specifies the packages to install into an image. Image recipes set IMAGE_INSTALL to specify the packages to install into an image through image.bbclass."
 IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image during the root filesystem construction process."
+IMAGE_NAME[doc] = "The name of the output image files minus the extension."
 IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
+IMAGE_PKGTYPE[doc] = "Defines the package type (DEB, RPM, IPK, or TAR) used by the OpenEmbedded build system."
+IMAGE_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the image."
+IMAGE_ROOTFS[doc] = "The location of the root filesystem while it is under construction (i.e. during do_rootfs)."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
+IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
+INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build."
+INHIBIT_DEFAULT_DEPS[doc] = "Prevents the default dependencies, namely the C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
+INHERIT_DISTRO[doc] = "Lists classes that will be inherited at the distribution level. It is unlikely that you want to edit this variable."
+INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an initial RAM disk (initramfs), which is used during boot."
+INITRD[doc] = "Indicates a filesystem image to use as an initial RAM disk (initrd)."
+INITSCRIPT_NAME[doc] = "The filename of the initialization script as installed to ${sysconfdir}/init.d."
 INITSCRIPT_PACKAGES[doc] = "A list of the packages that contain initscripts. This variable is used in recipes when using update-rc.d.bbclass. The variable is optional and defaults to the PN variable."
-INITSCRIPT_NAME[doc] = "The filename of the initscript as installed to ${etcdir}/init.d. The variable is mandatory and is used in recipes when using update-rc.d.bbclass."
 INITSCRIPT_PARAMS[doc] = "Specifies the options to pass to update-rc.d. The variable is mandatory and is used in recipes when using update-rc.d.bbclass."
 INSANE_SKIP[doc] = "Specifies the QA checks to skip for a specific package within a recipe."
 IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
@@ -197,6 +250,7 @@ KTYPE[doc] = "Defines the kernel type to be used in assembling the configuration
 LAYERDEPENDS[doc] = "Lists the layers, separated by spaces, upon which this recipe depends. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
 LAYERDIR[doc] = "When used inside the layer.conf configuration file, this variable provides the path of the current layer."
 LAYERVERSION[doc] = "Optionally specifies the version of a layer as a single number. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
+LEAD_SONAME[doc] = "Specifies the lead (or primary) compiled library file (.so) that the debian class applies its naming policy to given a recipe that packages multiple libraries."
 LIC_FILES_CHKSUM[doc] = "Checksums of the license text in the recipe source code."
 LICENSE[doc] = "The list of source licenses for the recipe."
 LICENSE_PATH[doc] = "Path to additional licenses used during the build."
@@ -226,10 +280,17 @@ MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that yo
 
 NATIVELSBSTRING[doc] = "A string identifying the host distribution."
 NO_RECOMMENDATIONS[doc] = "When set to '1', no recommended packages will be installed. Realize that some recommended packages might be required for certain system functionality, such as kernel-modules. It is up to the user to add packages to IMAGE_INSTALL as needed."
+NOHDD[doc] = "Causes the OpenEmbedded build system to skip building the .hddimg image."
+NOISO[doc] = "Causes the OpenEmbedded build system to skip building the ISO image."
 
 #O
 
+OE_BINCONFIG_EXTRA_MANGLE[doc] = "When a recipe inherits the binconfig.bbclass class, this variable specifies additional arguments passed to the "sed" command."
+OE_IMPORTS[doc] = "An internal variable used to tell the OpenEmbedded build system what Python modules to import for every Python function run by the system."
 OE_TERMINAL[doc] = "Controls how the OpenEmbedded build system spawns interactive terminals on the host development system."
+OEROOT[doc] = "The directory from which the top-level build environment setup script is sourced."
+OLDEST_KERNEL[doc] = "Declares the oldest version of the Linux kernel that the produced binaries must support."
+OVERRIDES[doc] = "BitBake uses OVERRIDES to control what variables are overridden after BitBake parses recipes and configuration files."
 
 #P
 
@@ -240,30 +301,48 @@ PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
 PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
+PACKAGE_GROUP[doc] = "Defines one or more packages to include in an image when a specific item is included in IMAGE_FEATURES."
 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
 PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed. If a listed package fails to install, the build system does not generate an error. This variable is generally not user-defined."
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] = "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] = "A promise that your recipe satisfies runtime dependencies for optional modules that are found in other recipes."
 PARALLEL_MAKE[doc] = "Specifies extra options that are passed to the make command during the compile tasks. This variable is usually in the form -j 4, where the number represents the maximum number of parallel threads make can run."
+PARALLEL_MAKEINST[doc] = "Extra options passed to the make install command during the do_install task in order to specify parallel installation."
 PATCHRESOLVE[doc] = "Enable or disable interactive patch resolution."
+PATCHTOOL[doc] = "Specifies the utility used to apply patches for a recipe during do_patch."
 PE[doc] = "The epoch of the recipe. The default value is '0'. The field is used to make upgrades possible when the versioning scheme changes in some backwards incompatible way."
 PF[doc] = "Specifies the recipe or package name and includes all version and revision numbers. This variable is comprised of ${PN}-${EXTENDPE}${PV}-${PR}."
+PIXBUF_PACKAGES[doc] = "When a recipe inherits the pixbufcache class, this variable identifies packages that contain the pixbuf loaders used with gdk-pixbuf."
+PKGD[doc] = "Points to the destination directory for files to be packaged before they are split into individual packages."
+PKGDATA_DIR[doc] = "Points to a shared, global-state directory that holds data generated during the packaging process."
+PKGDEST[doc] = "Points to the parent directory for files to be packaged after they have been split into individual packages."
+PKGDESTWORK[doc] = "Points to a temporary work area used by the do_package task to write output from the do_packagedata task."
 PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenEmbedded build system as input to create a package. It refers to a package name in the context of a file created or produced by the OpenEmbedded build system."
+PNBLACKLIST[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."
 PR[doc] = "The revision of the recipe. The default value for this variable is 'r0'."
+PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
+PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
 PREMIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
 PRINC[doc] = "Causes the PR variable of .bbappend files to dynamically increment. This increment minimizes the impact of layer ordering. This variable defaults to '0'."
 PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'optional'.  Other standard values are 'required', 'standard' and 'extra'."
 PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build as specified by DEPENDS."
-PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines what recipe should be given preference."
-PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines what recipe should be given preference."
+PRSERV_HOST[doc] = "The network based PR service host and port."
 PV[doc] = "The version of the recipe. The version is normally extracted from the recipe filename."
 
+#Q
+
+QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
+
 #R
 
 RCONFLICTS[doc] = "The list of packages that conflict with another package. Note that the package will not be installed if the conflicting packages are not first removed."
 RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) that must be installed for the package to be built. They must be the names of other packages as listed in the PACKAGES variable, not recipe names (PN)."
+REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+RM_OLD_IMAGE[doc] = "Reclaims disk space by removing previously built versions of the same image from the images directory pointed to by the DEPLOY_DIR variable."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
+ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
+ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
 RPROVIDES[doc] = "A list of package name aliases that a package also provides. These aliases are useful for satisfying runtime dependencies of other packages both during the build and on the target."
 RRECOMMENDS[doc] = "A list of packages that extends the usability of a package being built. The package being built does not depend on this list of packages in order to successfully build, but needs them for the extended usability."
 RREPLACES[doc] = "A list of packages replaced by a package. The package manager uses this variable to determine which package should be installed to replace other package(s) during an upgrade."
@@ -273,16 +352,25 @@ RSUGGESTS[doc] = "A list of additional packages that you can suggest for install
 
 S[doc] = "The location in the Build Directory where unpacked package source code resides."
 SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that the build system has been tested against."
+SDK_ARCH[doc] = "The target architecture for the SDK."
+SDK_DEPLOY[doc] = "The directory set up and used by the populate_sdk_base to which the SDK is deployed."
+SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when creating SDK output."
+SDK_NAME[doc] = "The base name for SDK output files."
+SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter. After booting occurs, getty is started on that port so remote login is possible."
-SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
+SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
+SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
+SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
+SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."
 SITEINFO_ENDIANNESS[doc] = "Specifies the endian byte order of the target system. The value should be either 'le' for 'little-endian' or 'be' for 'big-endian'."
-SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU. The value should be either '32' or '64'."
 SOC_FAMILY[doc] = "Groups together machines based upon the same family of SOC (System On Chip). You typically set this variable in a common .inc file that you include in the configuration files of all the machines."
+SOLIBS[doc] = "Defines the suffix for shared libraries used on the target platform."
+SOLIBSDEV[doc] = "Defines the suffix for the development symbolic link (symlink) for shared libraries on the target platform."
 SOURCE_MIRROR_FETCH[doc] = "Switch marking build as source fetcher. Used to skip COMPATIBLE_* checking."
 SOURCE_MIRROR_URL[doc] = "URL to source mirror that will be used before fetching from original SRC_URI."
 SPECIAL_PKGSUFFIX[doc] = "A list of prefixes for PN used by the OpenEmbedded build system to create variants of recipes or packages. The list specifies the prefixes to strip off during certain circumstances such as the generation of the BPN variable."
@@ -295,9 +383,18 @@ SSTATE_DIR[doc] = "The directory for the shared state cache."
 SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other mirror locations for prebuilt cache data objects before building out the data. You can specify a filesystem directory or a remote URL such as HTTP or FTP."
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
+STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
+SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
+SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
+SYSLINUX_SERIAL[doc] = "Specifies the alternate serial port or turns it off."
+SYSLINUX_SPLASH[doc] = "An .LSS file used as the background for the VGA boot menu when you are using the boot menu."
+SYSLINUX_SERIAL_TTY[doc] = "Specifies the alternate console=tty... kernel boot argument."
 SYSROOT_PREPROCESS_FUNCS[doc] = "A list of functions to execute after files are staged into the sysroot. These functions are usually used to apply additional processing on the staged files, or to stage additional files."
+SYSTEMD_AUTO_ENABLE[doc] = "For recipes that inherit the systemd class, this variable specifies whether the service you have specified in SYSTEMD_SERVICE should be started automatically or not."
+SYSTEMD_PACKAGES[doc] = "For recipes that inherit the systemd class, this variable locates the systemd unit files when they are not found in the main recipe's package."
+SYSTEMD_SERVICE[doc] = "For recipes that inherit the systemd class, this variable specifies the systemd service name for a package."
 SYSVINIT_ENABLED_GETTYS[doc] = "Specifies which virtual terminals should be running a getty, the default is '1'."
 
 #T
@@ -312,9 +409,16 @@ TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR a
 TCLIBC[doc] = "Specifies GNU standard C library (libc) variant to use during the build process. You can select 'eglibc' or 'uclibc'."
 TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
 TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
+TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
+TEST_SUITES[doc] = "An ordered list of tests (modules) to run against an image when performing automated runtime testing."
+THISDIR[doc] = "The directory in which the file BitBake is currently parsing is located."
 TIME[doc] = "The time the build was started using HMS format."
 TMPDIR[doc] = "The temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
+TOOLCHAIN_HOST_TASK[doc] = "This variable lists packages the OpenEmbedded build system uses when building an SDK, which contains a cross-development environment."
+TOOLCHAIN_TARGET_TASK[doc] = "This variable lists packages the OpenEmbedded build system uses when it creates the target part of an SDK, which includes libraries and headers."
 TOPDIR[doc] = "The Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
+TRANSLATED_TARGET_ARCH[doc] = "A sanitized version of TARGET_ARCH. This variable is used where the architecture is needed in a value where underscores are not allowed."
+TUNE_PKGARCH[doc] = "The package architecture understood by the packaging system to define the architecture, ABI, and tuning of output packages."
 TUNEABI[doc] = "An underlying ABI used by a particular tuning in a given toolchain layer. This feature allows providers using prebuilt libraries to check compatibility of a tuning against their selection of libraries."
 TUNEABI_OVERRIDE[doc] = "If set, ignores TUNEABI_WHITELIST."
 TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values.  If the variable is not set, all values are allowed."
@@ -323,8 +427,19 @@ TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
 
 #U
 
+UBOOT_CONFIG[doc] = "Configures the UBOOT_MACHINE and can also define IMAGE_FSTYPES for individual cases."
+UBOOT_ENTRYPOINT[doc] = "Specifies the entry point for the U-Boot image."
+UBOOT_LOADADDRESS[doc] = "Specifies the load address for the U-Boot image."
+UBOOT_LOCALVERSION[doc] = "Appends a string to the name of the local version of the U-Boot image."
+UBOOT_MACHINE[doc] = "Specifies the value passed on the make command line when building a U-Boot image."
+UBOOT_MAKE_TARGET[doc] = "Specifies the target called in the Makefile."
+UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
+UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
 USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
+USERADD_PACKAGES[doc] = "When a recipe inherits the useradd class, this variable specifies the individual packages within the recipe that require users and/or groups to be added."
+USERADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the useradd command if you wish to add a user to the system when the package is installed."
 
 #W
 
+WARN_QA[doc] = "Specifies the quality assurance checks whose failures are reported as warnings by the OpenEmbedded build system."
 WORKDIR[doc] = "The pathname of the working directory in which the OpenEmbedded build system builds a recipe. This directory is located within the TMPDIR directory structure and changes as different packages are built."
-- 
1.8.5.3


