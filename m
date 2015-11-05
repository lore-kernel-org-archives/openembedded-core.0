Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF89177029
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:48:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2015 07:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="843356636"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Nov 2015 07:48:05 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5FC576A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 07:47:02 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 17:48:18 +0200
Message-Id: <1446738498-19155-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 2/5] bbclass: fix spelling mistakes
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
X-List-Received-Date: Thu, 05 Nov 2015 15:48:09 -0000

Fix some spelling mistakes in bbclass files

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/allarch.bbclass             | 2 +-
 meta/classes/archiver.bbclass            | 2 +-
 meta/classes/buildhistory.bbclass        | 2 +-
 meta/classes/chrpath.bbclass             | 4 ++--
 meta/classes/crosssdk.bbclass            | 2 +-
 meta/classes/module-base.bbclass         | 2 +-
 meta/classes/package.bbclass             | 4 ++--
 meta/classes/package_deb.bbclass         | 2 +-
 meta/classes/siteinfo.bbclass            | 2 +-
 meta/classes/spdx.bbclass                | 2 +-
 meta/classes/tinderclient.bbclass        | 2 +-
 meta/classes/update-alternatives.bbclass | 2 +-
 12 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 2fea7c0..3826643 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -1,5 +1,5 @@
 #
-# This class is used for architecture independent recipes/data files (usally scripts)
+# This class is used for architecture independent recipes/data files (usually scripts)
 #
 
 # Expand STAGING_DIR_HOST since for cross-canadian/native/nativesdk, this will
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 41a552c..f4a34df 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -254,7 +254,7 @@ python do_unpack_and_patch() {
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     d.setVar('WORKDIR', ar_outdir)
 
-    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
+    # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
     # possibly requiring of the following tasks (such as some recipes's
     # do_patch required 'B' existed).
     bb.utils.mkdirhier(d.getVar('B', True))
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4db0441..c3da773 100644
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
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index e9160af..9c68855 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -6,7 +6,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
 
     p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
     err, out = p.communicate()
-    # If returned succesfully, process stderr for results
+    # If returned successfully, process stderr for results
     if p.returncode != 0:
         return
 
@@ -45,7 +45,7 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
 
     p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
     err, out = p.communicate()
-    # If returned succesfully, process stderr for results
+    # If returned successfully, process stderr for results
     if p.returncode != 0:
         return
     for l in err.split("\n"):
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 87d5cf5..7315c38 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -30,7 +30,7 @@ baselib = "lib"
 do_populate_sysroot[stamp-extra-info] = ""
 do_packagedata[stamp-extra-info] = ""
 
-# Need to force this to ensure consitency accross architectures
+# Need to force this to ensure consitency across architectures
 EXTRA_OECONF_GCC_FLOAT = ""
 
 USE_NLS = "no"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 8be26c4..cdff0a5 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -19,7 +19,7 @@ KERNEL_OBJECT_SUFFIX = ".ko"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # Function to ensure the kernel scripts are created. Expected to
-# be called before do_compile. See module.bbclass for an exmaple.
+# be called before do_compile. See module.bbclass for an example.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a86b680..2bae341 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1513,7 +1513,7 @@ python package_do_shlibs() {
             rpath = []
             p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file],stdout=sub.PIPE,stderr=sub.PIPE)
             err, out = p.communicate()
-            # If returned succesfully, process stderr for results
+            # If returned successfully, process stderr for results
             if p.returncode == 0:
                 for l in err.split("\n"):
                     l = l.strip()
@@ -1522,7 +1522,7 @@ python package_do_shlibs() {
 
         p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],stdout=sub.PIPE,stderr=sub.PIPE)
         err, out = p.communicate()
-        # If returned succesfully, process stderr for results
+        # If returned successfully, process stderr for results
         if p.returncode == 0:
             for l in err.split("\n"):
                 l = l.strip()
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d2fea4f..5feeeb0 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -21,7 +21,7 @@ APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", Tr
 # INSTALL_BASEARCH_DEB - install base architecutre
 # INSTALL_ARCHS_DEB - list of available archs
 # INSTALL_PACKAGES_NORMAL_DEB - packages to be installed
-# INSTALL_PACKAGES_ATTEMPTONLY_DEB - packages attemped to be installed only
+# INSTALL_PACKAGES_ATTEMPTONLY_DEB - packages attempted to be installed only
 # INSTALL_PACKAGES_LINGUAS_DEB - additional packages for uclibc
 # INSTALL_TASK_DEB - task name
 
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 9f6eac4..b715b6c 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -8,7 +8,7 @@
 #
 # 'what' can be one of
 # * target: Returns the target name ("<arch>-<os>")
-# * endianess: Return "be" for big endian targets, "le" for little endian
+# * endianness: Return "be" for big endian targets, "le" for little endian
 # * bits: Returns the bit size of the target, either "32" or "64"
 # * libc: Returns the name of the c library used by the target
 #
diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 454c53e..0c92765 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -232,7 +232,7 @@ def run_fossology(foss_command, full_spdx):
     # Package info
     package_info = {}
     if full_spdx:
-        # All mandatory, only one occurance
+        # All mandatory, only one occurrence
         package_info['PackageCopyrightText'] = re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
         package_info['PackageLicenseDeclared'] = re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
         package_info['PackageLicenseConcluded'] = re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index 6984efd..2bc75fc 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -142,7 +142,7 @@ def tinder_send_http(d, status, _log):
 
     selector = url + "/xml/build_status.pl"
 
-    # now post it - in chunks of 10.000 charachters
+    # now post it - in chunks of 10.000 characters
     new_log = _log
     while len(new_log) > 0:
         content_type, body = tinder_format_http_post(d,status,new_log[0:18000])
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index a3c1657..825cc88 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -61,7 +61,7 @@
 ALTERNATIVE_PRIORITY = "10"
 
 # We need special processing for vardeps because it can not work on
-# modified flag values.  So we agregate the flags into a new variable
+# modified flag values.  So we aggregate the flags into a new variable
 # and include that vairable in the set.
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
-- 
2.4.0


