Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOh-0004D6-TJ
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:49:56 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so1809173dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=m7QnLmoMsgxaBmhoUWZtXXZ0J3h+X4lVAiKQpy0UU+g=;
	b=lh5jRjmDJ7gdJjy0yyPJWZ+iKb/CzGUkAauG39CCIxsHC382iylG5N7gJ8NWKZgWIJ
	QfFp9AYimHwuKm6a4jR3daCup9qdPSAPoeagWDBizwE42viFi0r+kNabp1eF6uQgsHxq
	PubJG1bFgaMX8lanPniBInftLrpEODGrKbLm8=
Received: by 10.68.225.71 with SMTP id ri7mr45271572pbc.129.1328510517110;
	Sun, 05 Feb 2012 22:41:57 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.41.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:41:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:34 -0800
Message-Id: <55e8f3e04ef67a706dfc19ed730ae9612489c4e5.1328510188.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 08/20] module-init-tools: Delete
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
X-List-Received-Date: Mon, 06 Feb 2012 06:49:56 -0000

Since its provided by kmod

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../module-init-tools/files/disable_man.patch      |   25 ------------
 .../files/grab_module_memset.patch                 |   21 ----------
 .../files/modutils_extension.patch                 |   25 ------------
 .../module-init-tools-cross_3.16.bb                |   10 -----
 .../module-init-tools/module-init-tools.inc        |   24 -----------
 .../module-init-tools/module-init-tools_3.16.bb    |   42 --------------------
 .../files/PD.patch                                 |    0
 .../files/modutils.sh                              |    0
 .../modutils-initscripts.bb                        |    0
 9 files changed, 0 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/disable_man.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools.inc
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/PD.patch (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/modutils.sh (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/modutils-initscripts.bb (100%)

diff --git a/meta/recipes-kernel/module-init-tools/files/disable_man.patch b/meta/recipes-kernel/module-init-tools/files/disable_man.patch
deleted file mode 100644
index 95ad9cf..0000000
--- a/meta/recipes-kernel/module-init-tools/files/disable_man.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-# disable man page build
-#
-# by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
-
-Upstream-Status: Inappropriate [disable feature]
-
-diff --git a/Makefile.am b/Makefile.am
-index 6f83c12..32972a8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,13 +39,12 @@ modindex_LDADD = $(LDADD) libmodtools.a
- MAN5 = modprobe.conf.5 modules.dep.5 depmod.conf.5 modprobe.d.5
- MAN8 = depmod.8 insmod.8 lsmod.8 rmmod.8 modprobe.8 modinfo.8
- SGML = $(addprefix doc/,  $(MAN5:%.5=%.sgml) $(MAN8:%.8=%.sgml))
--dist_man_MANS = $(MAN5) $(MAN8)
- # If they haven't overridden mandir, fix it (never /man!)
- mandir =$(shell if [ @mandir@ = $(prefix)/man ]; then if [ $(prefix) = / ]; then echo /usr/share/man; else echo $(prefix)/share/man; fi; else echo @mandir@; fi)
- 
- TESTSUITE := $(shell test -e @srcdir@/tests && find @srcdir@/tests -type f ! -name '*~')
- 
--EXTRA_DIST = generate-modprobe.conf FAQ CODING stress_modules.sh install-with-care $(SGML) $(man_MANS) $(TESTSUITE)
-+EXTRA_DIST = generate-modprobe.conf FAQ CODING stress_modules.sh install-with-care
- 
- sbin_PROGRAMS = insmod modprobe rmmod depmod modinfo
- if BUILD_STATIC_UTILS
diff --git a/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch b/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
deleted file mode 100644
index 31dc0e9..0000000
--- a/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-# this patch is from Mark Hatle <mark.hatle@windriver.com>, who  ran into 
-# a random segfault using the latest module-init-tools (3.12) and finally
-# trace back to depmod.c:grab_module, which appears that the new malloc(...) 
-# setups up things, but never clears the memory that was just allocated.
-#
-# Kevin Tian <kevin.tian@intel.com>, 2010-08-06
-
-Upstream-Status: Pending
-
-diff --git a/depmod.c b/depmod.c
-index 647e5e6..46e03e0 100644
---- a/depmod.c
-+++ b/depmod.c
-@@ -313,6 +313,7 @@ static struct module *grab_module(const char *dirname, const char *filename)
- 
- 	new = NOFAIL(malloc(sizeof(*new)
- 			    + strlen(dirname?:"") + 1 + strlen(filename) + 1));
-+	memset(new, 0x00, sizeof(*new) + strlen(dirname?:"") + 1 + strlen(filename) + 1);
- 	if (dirname)
- 		sprintf(new->pathname, "%s/%s", dirname, filename);
- 	else
diff --git a/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch b/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
deleted file mode 100644
index 4a6e0fe..0000000
--- a/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-# poky uses new name to differentiate from modutils, so reflect this new name in source
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
-
-Upstream-Status: Inappropriate [embedded specific]
-
---- module-init-tools-3.0-pre10.orig/generate-modprobe.conf
-+++ module-init-tools-3.0-pre10/generate-modprobe.conf
-@@ -45,12 +45,12 @@
-     cp $TESTING_MODPROBE_CONF $MODPROBECONF
- elif [ "$STDIN" = "1" ]; then
-     cat > $MODPROBECONF
--elif [ -x /sbin/modprobe.old ]; then
-+elif [ -x /sbin/modprobe.24 ]; then
-     # In sbin.
--    /sbin/modprobe.old -c > $MODPROBECONF || modprobe_abort
--elif modprobe.old -c >/dev/null 2>&1; then
-+    /sbin/modprobe.24 -c > $MODPROBECONF || modprobe_abort
-+elif modprobe.24 -c >/dev/null 2>&1; then
-     # Somewhere in path.
--    modprobe.old -c > $MODPROBECONF || modprobe_abort
-+    modprobe.24 -c > $MODPROBECONF || modprobe_abort
- elif /sbin/modprobe -V 2>/dev/null | grep -q 'modprobe version'; then
-     # Running /sbin/modprobe gives old version.
-     /sbin/modprobe -c > $MODPROBECONF || modprobe_abort
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
deleted file mode 100644
index dee163d..0000000
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require module-init-tools.inc
-PR = "r0"
-inherit cross
-PROVIDES += "virtual/${TARGET_PREFIX}depmod"
-RDEPENDS_${PN} = ""
-
-SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
-SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
-
-EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX} --disable-static-utils"
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools.inc b/meta/recipes-kernel/module-init-tools/module-init-tools.inc
deleted file mode 100644
index c290c4f..0000000
--- a/meta/recipes-kernel/module-init-tools/module-init-tools.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Kernel Module Utilities"
-DESCRIPTION = "This package contains a set of programs for loading, inserting, and removing kernel modules for Linux (versions 2.5.48 and above). It serves the same function that the modutils package serves for Linux 2.4"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://lsmod.c;md5=743c873ec42632d2ce37d3c440f366dd"
-SECTION = "base"
-
-PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
-RDEPENDS_${PN} += "module-init-tools-depmod"
-
-FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
-FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
-           file://modutils_extension.patch \
-           file://disable_man.patch \
-           file://grab_module_memset.patch"
-
-inherit autotools
-
-# module-init-tools uses AX_ENABLE_BUILDDIR to move rest of configuration steps
-# into a subdir. However this macro is not quite cross friendly. Instead of 
-# mangling that macro, a easier way is to take the disable option
-EXTRA_OECONF = "--disable-builddir"
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
deleted file mode 100644
index 0248b46..0000000
--- a/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-require module-init-tools.inc
-PR = "r0"
-
-# autotools set prefix to /usr, however we want them in /bin and /sbin
-bindir = "/bin"
-sbindir = "/sbin"
-
-do_install() {
-	autotools_do_install
-	for f in bin/lsmod sbin/insmod sbin/rmmod sbin/modprobe sbin/modinfo sbin/depmod; do
-		mv ${D}/$f ${D}/$f.26
-	done
-}
-
-pkg_postinst_module-init-tools() {
-	for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
-		bn=`basename $f`
-		update-alternatives --install /$f $bn /$f.26 60
-	done
-	update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.26 60
-	update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.26 60
-}
-
-pkg_prerm_module-init-tools() {
-	for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
-		bn=`basename $f`
-		update-alternatives --remove $bn /$f.26
-	done
-	update-alternatives --remove bin-lsmod /bin/lsmod.26
-	update-alternatives --remove lsmod /bin/lsmod.26
-}
-
-pkg_postinst_module-init-tools-depmod() {
-	update-alternatives --install /sbin/depmod depmod /sbin/depmod.26 60
-}
-
-pkg_prerm_module-init-tools-depmod() {
-	update-alternatives --remove depmod /sbin/depmod.26
-}
-
-SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
-SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
diff --git a/meta/recipes-kernel/module-init-tools/files/PD.patch b/meta/recipes-kernel/modutils-initscripts/files/PD.patch
similarity index 100%
rename from meta/recipes-kernel/module-init-tools/files/PD.patch
rename to meta/recipes-kernel/modutils-initscripts/files/PD.patch
diff --git a/meta/recipes-kernel/module-init-tools/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
similarity index 100%
rename from meta/recipes-kernel/module-init-tools/files/modutils.sh
rename to meta/recipes-kernel/modutils-initscripts/files/modutils.sh
diff --git a/meta/recipes-kernel/module-init-tools/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
similarity index 100%
rename from meta/recipes-kernel/module-init-tools/modutils-initscripts.bb
rename to meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
-- 
1.7.5.4



