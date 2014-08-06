Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9D765CB2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 11:52:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140806115205099
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 11:52:05 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=54271 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEzl9-0007sM-Sa for openembedded-core@lists.openembedded.org;
	Wed, 06 Aug 2014 07:52:00 -0400
Date: Wed, 6 Aug 2014 07:51:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408060743510.5032@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] bbclass files: Fix typos/grammar in numerous .bbclass comments.
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
X-List-Received-Date: Wed, 06 Aug 2014 11:52:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Various non-functional changes to a number of .bbclass files:

 * Spelling
 * Grammar
 * Ridiculously long lines

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  while perusing numerous .bbclass files to document a few things for
myself, i figured i might as well do some proofreading. all of this is
strictly non-functional changes to comment lines in .bbclass files.

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index c953e7c..0a64588 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -1,5 +1,6 @@
 #
-# This class is used for architecture independent recipes/data files (usally scripts)
+# This class is used for architecture-independent recipes/data files, such as
+# configuration files, media files or scripts.
 #

 # Expand STAGING_DIR_HOST since for cross-canadian/native/nativesdk, this will
@@ -15,8 +16,8 @@ python () {
         # No need for virtual/libc or a cross compiler
         d.setVar("INHIBIT_DEFAULT_DEPS","1")

-        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
-        # naming anyway
+        # Set these to a common set of values, we shouldn't be using them
+        # other than for WORKDIR directory naming, anyway.
         d.setVar("TARGET_ARCH", "allarch")
         d.setVar("TARGET_OS", "linux")
         d.setVar("TARGET_CC_ARCH", "none")
@@ -33,7 +34,7 @@ python () {
         # packages.
         d.setVar("LDFLAGS", "")

-        # No need to do shared library processing or debug symbol handling
+        # No need to do shared library processing or debug symbol handling.
         d.setVar("EXCLUDE_FROM_SHLIBS", "1")
         d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
         d.setVar("INHIBIT_PACKAGE_STRIP", "1")
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index efd413b..7f04387 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,7 +1,7 @@
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This bbclass is used for creating archive for:
+# This bbclass is used for creating archives for:
 # 1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
 # 2) patched source: ARCHIVER_MODE[src] = "patched" (default)
 # 3) configured source: ARCHIVER_MODE[src] = "configured"
@@ -48,7 +48,6 @@ do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"

 # This is a convenience for the shell script to use it

-
 python () {
     pn = d.getVar('PN', True)

@@ -71,7 +70,7 @@ python () {
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
     elif ar_src == "configured":
         # We can't use "addtask do_ar_configured after do_configure" since it
-        # will cause the deptask of do_populate_sysroot to run not matter what
+        # will cause the deptask of do_populate_sysroot to run no matter what
         # archives we need, so we add the depends here.
         d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
@@ -122,7 +121,7 @@ python () {
             d.setVarFlag('do_unpack_and_patch', 'stamp-base-clean', flag_clean)
 }

-# Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
+# Take all the sources for a recipe and put them in WORKDIR/archiver-work/.
 # Files in SRC_URI are copied directly, anything that's a directory
 # (e.g. git repositories) is "unpacked" and then put into a tarball.
 python do_ar_original() {
@@ -190,8 +189,7 @@ python do_ar_configured() {
         bb.note('Archiving the configured source...')
         # The libtool-native's do_configure will remove the
         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
-        # do_configure, we archive the already configured ${S} to
-        # instead of.
+        # do_configure, we archive the already configured ${S} instead.
         if d.getVar('PN', True) != 'libtool-native':
             # Change the WORKDIR to make do_configure run in another dir.
             d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
@@ -276,9 +274,9 @@ python do_unpack_and_patch() {
     # Change the WORKDIR to make do_unpack do_patch run in another dir.
     d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))

-    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
-    # possibly requiring of the following tasks (such as some recipes's
-    # do_patch required 'B' existed).
+    # The changed 'WORKDIR' also caused 'B' to change, create dir 'B' for
+    # possibly requiring the following tasks (such as some recipe's
+    # do_patch requiring that 'B' exists).
     bb.utils.mkdirhier(d.getVar('B', True))

     # The kernel source is ready after do_validate_branches
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8114cf6..3c24727 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -68,7 +68,7 @@ def base_dep_prepend(d):
     #

     deps = ""
-    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
+    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
     if not d.getVar('INHIBIT_DEFAULT_DEPS'):
@@ -81,8 +81,8 @@ BASEDEPENDS = "${@base_dep_prepend(d)}"
 DEPENDS_prepend="${BASEDEPENDS} "

 FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
-# THISDIR only works properly with imediate expansion as it has to run
-# in the context of the location its used (:=)
+# THISDIR only works properly with immediate expansion as it has to run
+# in the context of the location where it's used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"

 def extra_path_elements(d):
@@ -311,8 +311,8 @@ python base_eventhandler() {
         bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))

     # This code is to silence warnings where the SDK variables overwrite the
-    # target ones and we'd see dulpicate key names overwriting each other
-    # for various PREFERRED_PROVIDERS
+    # target ones and we'd see duplicate key names overwriting each other
+    # for various PREFERRED_PROVIDERs.
     if isinstance(e, bb.event.RecipePreFinalise):
         if e.data.getVar("TARGET_PREFIX", True) == e.data.getVar("SDK_PREFIX", True):
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
@@ -465,7 +465,7 @@ python () {
         else:
             appendVar('EXTRA_OECONF', extraconf)

-    # If PRINC is set, try and increase the PR value by the amount specified
+    # If PRINC is set, try and increase the PR value by the amount specified.
     # The PR server is now the preferred way to handle PR changes based on
     # the checksum of the recipe (including bbappend).  The PRINC is now
     # obsolete.  Return a warning to the user.
@@ -495,7 +495,7 @@ python () {
                  " whitelisted in LICENSE_FLAGS_WHITELIST")

     # If we're building a target package we need to use fakeroot (pseudo)
-    # in order to capture permissions, owners, groups and special files
+    # in order to capture permissions, owners, groups and special files.
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
@@ -587,12 +587,12 @@ python () {
     elif "osc://" in srcuri:
         d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')

-    # *.lz4 should depends on lz4-native for unpacking
+    # *.lz4 should depend on lz4-native for unpacking
     # Not endswith because of "*.patch.lz4;patch=1". Need bb.fetch.decodeurl in future
     if '.lz4' in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')

-    # *.xz should depends on xz-native for unpacking
+    # *.xz should depend on xz-native for unpacking
     # Not endswith because of "*.patch.xz;patch=1". Need bb.fetch.decodeurl in future
     if '.xz' in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
@@ -616,7 +616,7 @@ python () {
         return

     #
-    # We always try to scan SRC_URI for urls with machine overrides
+    # We always try to scan SRC_URI for URLs with machine overrides
     # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
     #
     override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index a0141a8..b988808 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -1,15 +1,11 @@
-# anonymous support class from originally from angstrom
+# anonymous support class originally from angstrom
 #
-# To use the blacklist, a distribution should include this
-# class in the INHERIT_DISTRO
-#
-# No longer use ANGSTROM_BLACKLIST, instead use a table of
-# recipes in PNBLACKLIST
+# This class is already included by default from defaultsetup.conf.
 #
 # Features:
 #
 # * To add a package to the blacklist, set:
-#   PNBLACKLIST[pn] = "message"
+#   PNBLACKLIST[pn] = "message explaining rejection"
 #

 # Cope with PNBLACKLIST flags for multilib case
diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 995d3e7..8c8039b 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -1,19 +1,19 @@
 # boot-directdisk.bbclass
-# (loosly based off bootimg.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
+# (loosely based off bootimg.bbclass Copyright (C) 2004, Advanced Micro Devices, Inc.)
 #
 # Create an image which can be placed directly onto a harddisk using dd and then
 # booted.
 #
-# This uses syslinux. extlinux would have been nice but required the ext2/3
+# This uses SYSLINUX. extlinux would have been nice but required the ext2/3
 # partition to be mounted. grub requires to run itself as part of the install
 # process.
 #
-# The end result is a 512 boot sector populated with an MBR and partition table
-# followed by an msdos fat16 partition containing syslinux and a linux kernel
-# completed by the ext2/3 rootfs.
+# The end result is a 512-byte boot sector populated with an MBR and
+# partition table followed by an MSDOS fat16 partition containing SYSLINUX
+# and a linux kernel completed by the ext2/3 rootfs.
 #
-# We have to push the msdos parition table size > 16MB so fat 16 is used as parted
-# won't touch fat12 partitions.
+# We have to push the MSDOS partition table size > 16MB so fat16 is used
+# as parted won't touch fat12 partitions.

 # External variables needed

diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
index 3fc8956..234d964 100644
--- a/meta/classes/bugzilla.bbclass
+++ b/meta/classes/bugzilla.bbclass
@@ -1,7 +1,7 @@
 #
 # Small event handler to automatically open URLs and file
-# bug reports at a bugzilla of your choiche
-# it uses XML-RPC interface, so you must have it enabled
+# bug reports at a bugzilla of your choice;
+# it uses XML-RPC interface, so you must have it enabled.
 #
 # Before using you must define BUGZILLA_USER, BUGZILLA_PASS credentials,
 # BUGZILLA_XMLRPC - uri of xmlrpc.cgi,
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 20382ce..7c6d384 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -24,7 +24,7 @@ sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
 SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"

 #
-# Write out metadata about this package for comparision when writing future packages
+# Write out metadata about this package for comparison when writing future packages
 #
 python buildhistory_emit_pkghistory() {
     if not d.getVar('BB_CURRENTTASK', True) in ['packagedata', 'packagedata_setscene']:
@@ -431,7 +431,8 @@ buildhistory_get_sdk_installed_target() {

 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
-	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
+	# This awk script is somewhat messy, but handles where the size is
+	# not printed for device files under pseudo
 	( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
 }

@@ -490,7 +491,8 @@ ROOTFS_POSTPROCESS_COMMAND =+ " buildhistory_list_installed_image ;\

 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "

-# We want these to be the last run so that we get called after complementary package installation
+# We want these to be the last run so that we get called after
+# complementary package installation.
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target ;\
                                             buildhistory_get_sdk_installed_target ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;\
@@ -505,7 +507,8 @@ def buildhistory_get_layers(d):
     return layertext

 def buildhistory_get_metadata_revs(d):
-    # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
+    # We want an easily machine-readable format here, so get_layers_branch_rev
+    # isn't quite what we want
     layers = (d.getVar("BBLAYERS", True) or "").split()
     medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
@@ -555,7 +558,8 @@ def buildhistory_get_cmdline(d):

 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
-		# Code above that creates this dir never executed, so there can't be anything to commit
+		# Code above that creates this dir never executed, so there
+		# can't be anything to commit
 		return
 	fi

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 1b36cba..b897c5b 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d

 # IMAGE_FEATURES control content of the core reference images
 #
-# By default we install packagegroup-core-boot and packagegroup-base packages - this gives us
-# working (console only) rootfs.
+# By default we install packagegroup-core-boot and packagegroup-base packages;
+# this gives us working (console only) rootfs.
 #
 # Available IMAGE_FEATURES:
 #
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 6da43fe..54322b4 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -1,5 +1,5 @@
 #
-# NOTE - When using this class the user is repsonsible for ensuring that
+# NOTE - When using this class the user is responsible for ensuring that
 # TRANSLATED_TARGET_ARCH is added into PN. This ensures that if the TARGET_ARCH
 # is changed, another nativesdk xxx-canadian-cross can be installed
 #
@@ -114,7 +114,7 @@ do_populate_sysroot[stamp-extra-info] = ""

 USE_NLS = "${SDKUSE_NLS}"

-# We have to us TARGET_ARCH but we care about the absolute value
+# We have to use TARGET_ARCH but we care about the absolute value
 # and not any particular tune that is enabled.
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 261a374..27a3e2b 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -29,7 +29,7 @@ baselib = "lib"
 do_populate_sysroot[stamp-extra-info] = ""
 do_packagedata[stamp-extra-info] = ""

-# Need to force this to ensure consitency accross architectures
+# Need to force this to ensure consistency accross architectures
 EXTRA_OECONF_FPU = ""

 USE_NLS = "no"
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 1ddb56f..2eca2db 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -1,7 +1,7 @@
-# Debian package renaming only occurs when a package is built
+# Debian package renaming only occurs when a package is built.
 # We therefore have to make sure we build all runtime packages
-# before building the current package to make the packages runtime
-# depends are correct
+# before building the current package to make sure the packages
+# runtime depends are correct.
 #
 # Custom library package names can be defined setting
 # DEBIANNAME_ + pkgname to the desired name.
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 41164a3..be994dd 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -22,8 +22,8 @@ do_devshell[nostamp] = "1"

 # devshell and fakeroot/pseudo need careful handling since only the final
 # command should run under fakeroot emulation, any X connection should
-# be done as the normal user. We therfore carefully construct the envionment
-# manually
+# be done as the normal user. We therefore carefully construct the environment
+# manually.
 python () {
     if d.getVarFlag("do_devshell", "fakeroot"):
        # We need to signal our code that we want fakeroot however we
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..189b102 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -13,7 +13,7 @@
 # ${LABELS} - a list of targets for the automatic config
 # ${APPEND} - an override list of append strings for each label
 # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
-# ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
+# ${GRUB_TIMEOUT} - timeout before executing the default label (optional)

 do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 3ec8c06..db44703 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -3,26 +3,30 @@
 # Stages directories with symlinks from gcc/g++ to icecc, for both
 # native and cross compilers. Depending on each configure or compile,
 # the directories are added at the head of the PATH list and ICECC_CXX
-# and ICEC_CC are set.
+# and ICECC_CC are set.
 #
 # For the cross compiler, creates a tar.gz of our toolchain and sets
 # ICECC_VERSION accordingly.
 #
-# The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
-# necessary environment tar.gz file to be used by the remote machines.
-# It also supports meta-toolchain generation
+# The class now handles all 3 different compile 'stages' (i.e native,
+# cross-kernel and target) creating the necessary environment tar.gz file
+# to be used by the remote machines. It also supports meta-toolchain generation.
 #
-# If ICECC_PATH is not set in local.conf then the class will try to locate it using 'bb.utils.which'
-# but nothing is sure ;)
+# If ICECC_PATH is not set in local.conf then the class will try to locate it
+# using 'bb.utils.which' but nothing is sure ;)
 #
-# If ICECC_ENV_EXEC is set in local.conf, then it should point to the icecc-create-env script provided by the user
-# or the default one provided by icecc-create-env.bb will be used
-# (NOTE that this is a modified version of the script need it and *not the one that comes with icecc*
+# If ICECC_ENV_EXEC is set in local.conf, then it should point to the
+# icecc-create-env script provided by the user or the default one
+# provided by icecc-create-env.bb will be used.
+# (NOTE that this is a modified version of the script and *not the one
+# that comes with icecc*.
 #
-# User can specify if specific packages or packages belonging to class should not use icecc to distribute
-# compile jobs to remote machines, but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
-# with the appropriate values in local.conf. In addition the user can force to enable icecc for packages
-# which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKAGE_WL.
+# User can specify if specific packages or packages belonging to class
+# should not use icecc to distribute compile jobs to remote machines,
+# but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
+# with the appropriate values in local.conf. In addition, the user can
+# force to enable icecc for packages # which set an empty PARALLEL_MAKE
+# variable by defining ICECC_USER_PACKAGE_WL.
 #
 #########################################################################################
 #Error checking is kept to minimum so double check any parameters you pass to the class
@@ -33,7 +37,7 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"

 def icecc_dep_prepend(d):
-    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
+    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
     if not d.getVar('INHIBIT_DEFAULT_DEPS'):
@@ -66,7 +70,7 @@ def create_path(compilers, bb, d):
     if icc_is_kernel(bb, d):
         staging += "-kernel"

-    #check if the icecc path is set by the user
+    # Check if the icecc path is set by the user
     icecc = get_icecc(d)

     # Create the dir if necessary
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 55bfaf2..51b1993 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -8,7 +8,7 @@
 #  -Check the RUNTIME path for the $TMPDIR
 #  -Check if .la files wrongly point to workdir
 #  -Check if .pc files wrongly point to workdir
-#  -Check if packages contains .debug directories or .so files
+#  -Check if packages contain .debug directories or .so files
 #   where they should be in -dev or -dbg
 #  -Check if config.log contains traces to broken autoconf tests
 #  -Ensure that binaries in base_[bindir|sbindir|libdir] do not link
@@ -24,7 +24,7 @@ QADEPENDS_class-native = ""
 QADEPENDS_class-nativesdk = ""
 QA_SANE = "True"

-# Elect whether a given type of error is a warning or error, they may
+# Select whether a given type of error is a warning or error, they may
 # have been set by other files.
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
@@ -236,8 +236,8 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
         if m:
             rpath = m.group(1)
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
-                # The dynamic linker searches both these places anyway.  There is no point in
-                # looking there again.
+                # The dynamic linker searches both these places anyway.
+                # There is no point in looking there again.
                 messages["useless-rpaths"] = "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath)

 QAPATHTEST[dev-so] = "package_qa_check_dev"
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index a63f482..b9079e9 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -4,14 +4,14 @@
 # you to fall back to the original kernel as well.
 #
 # - In kernel-image's preinstall scriptlet, it backs up original kernel to avoid
-#   probable confliction with the new one.
+#   probable conflict with the new one.
 #
 # - In kernel-image's postinstall scriptlet, it modifies grub's config file to
 #   updates the new kernel as the boot priority.
 #

 pkg_preinst_kernel-image_append () {
-	# Parsing confliction
+	# Parsing conflict
 	[ -f "$D/boot/grub/menu.list" ] && grubcfg="$D/boot/grub/menu.list"
 	[ -f "$D/boot/grub/grub.cfg" ] && grubcfg="$D/boot/grub/grub.cfg"
 	if [ -n "$grubcfg" ]; then
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6010dc9..8fcc7fe 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -44,7 +44,7 @@ def find_kernel_feature_dirs(d):

     return feature_dirs

-# find the master/machine source branch. In the same way that the fetcher proceses
+# find the master/machine source branch. In the same way that the fetcher processes
 # git repositories in the SRC_URI we take the first repo found, first branch.
 def get_machine_branch(d, default):
     fetch = bb.fetch2.Fetch([], d)
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index c1bc399..2d399b8 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -1,6 +1,6 @@
 #
-# This class knows how to package up [e]glibc. Its shared since prebuild binary toolchains
-# may need packaging and its pointless to duplicate this code.
+# This class knows how to package up [e]glibc. It's shared since prebuild binary
+# toolchains may need packaging and it's pointless to duplicate this code.
 #
 # Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
 #  "compile" - Use QEMU to generate the binary locale files
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 601f561..1042405 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -110,7 +110,7 @@ python do_populate_lic() {
     copy_license_files(lic_files_paths, destdir)
 }

-# it would be better to copy them in do_install_append, but find_license_filesa is python
+# it would be better to copy them in do_install_append, but find_license_files is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
     if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index ad6f7af..d8450ff 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -26,7 +26,7 @@ module_do_install() {

 EXPORT_FUNCTIONS do_compile do_install

-# add all splitted modules to PN RDEPENDS, PN can be empty now
+# add all split modules to PN RDEPENDS, PN can be empty now
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a552d9..77186f8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -26,7 +26,7 @@
 #    a list of affected files in FILER{PROVIDES,DEPENDS}FLIST_pkg
 #
 # h) package_do_shlibs - Look at the shared libraries generated and autotmatically add any
-#    depenedencies found. Also stores the package name so anyone else using this library
+#    dependencies found. Also stores the package name so anyone else using this library
 #    knows which package to depend on.
 #
 # i) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
@@ -288,7 +288,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     return 0

 def copydebugsources(debugsrcdir, d):
-    # The debug src information written out to sourcefile is further procecessed
+    # The debug src information written out to sourcefile is further processed
     # and copied to the destination here.

     import stat
@@ -814,7 +814,7 @@ python split_and_strip_files () {
                     continue
                 if not s:
                     continue
-                # Check its an excutable
+                # Check it's an excutable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
@@ -844,7 +844,7 @@ python split_and_strip_files () {
                         elffiles[file] = elf_file

     #
-    # First lets process debug splitting
+    # First, let's process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
         hardlinkmap = {}
@@ -1463,7 +1463,7 @@ python package_do_shlibs() {
             rpath = []
             p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file],stdout=sub.PIPE,stderr=sub.PIPE)
             err, out = p.communicate()
-            # If returned succesfully, process stderr for results
+            # If returned successfully, process stderr for results
             if p.returncode == 0:
                 for l in err.split("\n"):
                     l = l.strip()
@@ -1472,7 +1472,7 @@ python package_do_shlibs() {

         p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],stdout=sub.PIPE,stderr=sub.PIPE)
         err, out = p.communicate()
-        # If returned succesfully, process stderr for results
+        # If returned successfully, process stderr for results
         if p.returncode == 0:
             for l in err.split("\n"):
                 l = l.strip()
@@ -1938,9 +1938,9 @@ python do_package () {
     # Optimisations
     ###########################################################################

-    # Contunually rexpanding complex expressions is inefficient, particularly when
-    # we write to the datastore and invalidate the expansion cache. This code
-    # pre-expands some frequently used variables
+    # Continually re-expanding complex expressions is inefficient, particularly
+    # when we write to the datastore and invalidate the expansion cache. This
+    # code pre-expands some frequently used variables.

     def expandVar(x, d):
         d.setVar(x, d.getVar(x, True))
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0a32b3e..b24b91a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -7,7 +7,7 @@ RPMBUILD="rpmbuild"

 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"

-# Maintaining the perfile dependencies has singificant overhead when writing the
+# Maintaining the per-file dependencies has significant overhead when writing the
 # packages. When set, this value merges them for efficiency.
 MERGEPERFILEDEPS = "1"

@@ -171,7 +171,7 @@ python write_specfile () {
             depends = bb.utils.join_deps(newdeps_dict)
             d.setVar(varname, depends.strip())

-    # We need to change the style the dependency from BB to RPM
+    # We need to change the style of the dependency from BB to RPM.
     # This needs to happen AFTER the mapping_rename_hook
     def print_deps(variable, tag, array, d):
         depends = variable
@@ -635,7 +635,7 @@ python do_package_rpm () {
         return

     # Construct the spec file...
-    # If the spec file already exist, and has not been stored into
+    # If the spec file already exists, and has not been stored into
     # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
     # so remove it before doing rpmbuild src.rpm.
     srcname    = strip_multilib(d.getVar('PN', True), d)
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index f0f6d18..7d656de 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -1,7 +1,7 @@
 #
 # Removes source after build
 #
-# To use it add that line to conf/local.conf:
+# To use it add this line to conf/local.conf:
 #
 # INHERIT += "rm_work"
 #
@@ -31,7 +31,7 @@ do_rm_work () {
     for dir in *
     do
         # Retain only logs and other files in temp, safely ignore
-        # failures of removing pseudo folers on NFS2/3 server.
+        # failures of removing pseudo folders on NFS2/3 server.
         if [ $dir = 'pseudo' ]; then
             rm -rf $dir 2> /dev/null || true
         elif [ $dir != 'temp' ]; then
@@ -39,7 +39,7 @@ do_rm_work () {
         fi
     done

-    # Need to add pseudo back or subsqeuent work in this workdir
+    # Need to add pseudo back or subsequent work in this workdir
     # might fail since setscene may not rerun to recreate it
     mkdir -p ${WORKDIR}/pseudo/

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 55ce3af..d6302eb 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -1,5 +1,5 @@
 # This class integrates real-time license scanning, generation of SPDX standard
-# output and verifiying license info during the building process.
+# output and verifying license info during the building process.
 # It is a combination of efforts from the OE-Core, SPDX and Fossology projects.
 #
 # For more information on FOSSology:

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


