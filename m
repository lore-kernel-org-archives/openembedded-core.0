Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EF-0003hm-Jz
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:21:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282293"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:42 -0800
Message-Id: <9a6d05efea223a6b65d66ffdf17645713e90c648.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/19] classes: replace 'Poky' with 'OE-core'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 04:22:00 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package.bbclass           |    2 +-
 meta/classes/package_rpm.bbclass       |   10 +++++-----
 meta/classes/sanity.bbclass            |    2 +-
 meta/classes/staging.bbclass           |    2 +-
 meta/classes/toolchain-scripts.bbclass |    2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 45447e3..68a2539 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -690,7 +690,7 @@ python split_and_strip_files () {
 		debuglibdir = "/usr/lib/debug"
 		debugsrcdir = "/usr/src/debug"
 	else:
-		# Original Poky, a.k.a. ".debug", style debug info
+		# Original OE-core, a.k.a. ".debug", style debug info
 		debugappend = ""
 		debugdir = "/.debug"
 		debuglibdir = ""
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bac9de5..a813c8b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -359,7 +359,7 @@ package_install_internal_rpm () {
 		done
 	fi
 
-	#### Note: 'Recommends' is an arbitrary tag that means _SUGGESTS_ in Poky..
+	#### Note: 'Recommends' is an arbitrary tag that means _SUGGESTS_ in OE-core..
 	# Add any recommended packages to the image
 	# RPM does not solve for recommended packages because they are optional...
 	# So we query them and tree them like the ATTEMPTONLY packages above...
@@ -720,7 +720,7 @@ python write_specfile () {
 					splitrobsoletes = dep
 
 		print_deps(splitrdepends,	"Requires", spec_preamble_bottom, d)
-		# Suggests in RPM are like recommends in Poky!
+		# Suggests in RPM are like recommends in OE-core!
 		print_deps(splitrrecommends,	"Suggests", spec_preamble_bottom, d)
 		# While there is no analog for suggests... (So call them recommends for now)
 		print_deps(splitrsuggests, 	"Recommends", spec_preamble_bottom, d)
@@ -811,7 +811,7 @@ python write_specfile () {
 
 	print_deps(srcdepends,		"BuildRequires", spec_preamble_top, d)
 	print_deps(srcrdepends,		"Requires", spec_preamble_top, d)
-	# Suggests in RPM are like recommends in Poky!
+	# Suggests in RPM are like recommends in OE-core!
 	print_deps(srcrrecommends,	"Suggests", spec_preamble_top, d)
 	# While there is no analog for suggests... (So call them recommends for now)
 	print_deps(srcrsuggests, 	"Recommends", spec_preamble_top, d)
@@ -960,7 +960,7 @@ python do_package_rpm () {
 		outfile.write("\tprintf \"%s\\n\" ${line}\n")
 		outfile.write("done\n")
 
-	# Poky dependencies a.k.a. RPM requires
+	# OE-core dependencies a.k.a. RPM requires
 	outdepends = workdir + "/" + srcname + ".requires"
 
 	try:
@@ -974,7 +974,7 @@ python do_package_rpm () {
 	dependsfile.close()
 	os.chmod(outdepends, 0755)
 
-	# Poky / RPM Provides
+	# OE-core / RPM Provides
 	outprovides = workdir + "/" + srcname + ".provides"
 
 	try:
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 53584ee..a029428 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -5,7 +5,7 @@
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo svn bzip2 tar gzip gawk chrpath wget cpio"
 
 def raise_sanity_error(msg):
-    bb.fatal(""" Poky's config sanity checker detected a potential misconfiguration.
+    bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:
     
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9c9df6a..66314a7 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -115,7 +115,7 @@ addtask do_populate_sysroot_setscene
 
 python () {
     if d.getVar('do_stage', True) is not None:
-        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with Poky" % d.getVar("FILE", True))
+        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
 }
 
 
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 5cba403..6fc9c13 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -34,7 +34,7 @@ toolchain_create_sdk_env_script () {
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
-# a Poky IDE to integrate with the build tree
+# a OE-core IDE to integrate with the build tree
 toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${MULTIMACH_TARGET_SYS}
 	rm -f $script
-- 
1.7.6.5



