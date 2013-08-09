Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 584976B5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 20:46:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2013 13:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,848,1367996400"; d="scan'208";a="344195752"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.176])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2013 13:46:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 13:46:39 -0700
Message-Id: <1376081200-12061-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1376081200-12061-1-git-send-email-sgw@linux.intel.com>
References: <1376081200-12061-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/2] groff: Add GPLv2 version
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
X-List-Received-Date: Fri, 09 Aug 2013 20:46:41 -0000

Apparrently a LICENSE change was missed, so we add the GPLv2 version back in

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch | 35 ++++++++++++++++
 .../groff/groff-1.18.1.4/man-local.patch           | 32 +++++++++++++++
 .../groff/groff-1.18.1.4/mdoc-local.patch          | 31 +++++++++++++++
 meta/recipes-extended/groff/groff_1.18.1.4.bb      | 46 ++++++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
 create mode 100644 meta/recipes-extended/groff/groff_1.18.1.4.bb

diff --git a/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch b/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
new file mode 100644
index 0000000..90ad8e3
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
@@ -0,0 +1,35 @@
+---
+ groff-1.18.1.4/Makefile.in |    7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -460,27 +460,22 @@ OTHERDIRS=\
+   src/roff/grog \
+   src/roff/nroff \
+   contrib/mm \
+   contrib/pic2graph \
+   contrib/eqn2graph \
+-  contrib/groffer \
+-  contrib/mom \
+-  doc
++  contrib/groffer
+ ALLDIRS=$(INCDIRS) $(LIBDIRS) $(PROGDIRS) \
+   $(DEVDIRS) $(OTHERDEVDIRS) $(TTYDEVDIRS) $(OTHERDIRS)
+ EXTRADIRS=\
+   font/devps/generate \
+   font/devdvi/generate \
+   font/devlj4/generate \
+-  src/xditview \
+   doc
+ NOMAKEDIRS=\
+   arch/djgpp \
+   contrib/mm/examples \
+   contrib/mm/mm \
+-  contrib/mom/examples \
+-  contrib/mom/momdoc \
+   src/libs/snprintf
+ DISTDIRS=\
+   $(INCDIRS) $(LIBDIRS) $(PROGDIRS) $(DEVDIRS) $(OTHERDEVDIRS) \
+   $(ALLTTYDEVDIRS) $(OTHERDIRS) $(EXTRADIRS) $(NOMAKEDIRS)
+ TARGETS=all install install_bin install_data clean distclean mostlyclean \
diff --git a/meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch b/meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
new file mode 100644
index 0000000..34b4248
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
@@ -0,0 +1,32 @@
+Index: groff-1.18.1.4/tmac/man.local
+===================================================================
+--- groff-1.18.1.4.orig/tmac/man.local	2000-10-26 22:15:17.000000000 +0800
++++ groff-1.18.1.4/tmac/man.local	2010-08-24 14:17:52.070006664 +0800
+@@ -1,2 +1,27 @@
+ .\" This file is loaded after an-old.tmac.
+ .\" Put any local modifications to an-old.tmac here.
++.
++.if n \{\
++.  \" Debian: Map \(oq to ' rather than ` in nroff mode for devices other
++.  \" than utf8.
++.  if !'\*[.T]'utf8' \
++.    tr \[oq]'
++.
++.  \" Debian: Disable the use of SGR (ANSI colour) escape sequences by
++.  \" grotty.
++.  if '\V[GROFF_SGR]'' \
++.    output x X tty: sgr 0
++.
++.  \" Debian: Map \- to the Unicode HYPHEN-MINUS character, to make
++.  \" searching in man pages easier.
++.  if '\*[.T]'utf8' \
++.    char \- \N'45'
++.
++.  \" Debian: Many UTF-8 man pages use "-" instead of "\-" for dashes such
++.  \" as those in command-line options. This is a bug in those pages, but
++.  \" too many fonts are missing the Unicode HYPHEN character, so we render
++.  \" this as the ASCII-compatible HYPHEN-MINUS instead.
++.  if '\*[.T]'utf8' \
++.    char - \N'45'
++.\}
++
diff --git a/meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch b/meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
new file mode 100644
index 0000000..140a544
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
@@ -0,0 +1,31 @@
+Index: groff-1.18.1.4/tmac/mdoc.local
+===================================================================
+--- groff-1.18.1.4.orig/tmac/mdoc.local	2001-03-23 08:17:51.000000000 +0800
++++ groff-1.18.1.4/tmac/mdoc.local	2010-08-24 14:20:22.014006846 +0800
+@@ -1,2 +1,26 @@
+ .\" This file is loaded after doc.tmac.
+ .\" Put any local modifications to doc.tmac here.
++.
++.if n \{\
++.  \" Debian: Map \(oq to ' rather than ` in nroff mode for devices other
++.  \" than utf8.
++.  if !'\*[.T]'utf8' \
++.    tr \[oq]'
++.
++.  \" Debian: Disable the use of SGR (ANSI colour) escape sequences by
++.  \" grotty.
++.  if '\V[GROFF_SGR]'' \
++.    output x X tty: sgr 0
++.
++.  \" Debian: Map \- to the Unicode HYPHEN-MINUS character, to make
++.  \" searching in man pages easier.
++.  if '\*[.T]'utf8' \
++.    char \- \N'45'
++.
++.  \" Debian: Many UTF-8 man pages use "-" instead of "\-" for dashes such
++.  \" as those in command-line options. This is a bug in those pages, but
++.  \" too many fonts are missing the Unicode HYPHEN character, so we render
++.  \" this as the ASCII-compatible HYPHEN-MINUS instead.
++.  if '\*[.T]'utf8' \
++.    char - \N'45'
++.\}
diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
new file mode 100644
index 0000000..cf3adea
--- /dev/null
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -0,0 +1,46 @@
+SUMMARY = "GNU Troff software"
+DESCRIPTION = "The groff (GNU troff) software is a typesetting package which reads plain text mixed with \
+formatting commands and produces formatted output."
+SECTION = "console/utils"
+PRIORITY = "required"
+HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
+LICENSE = "GPLv2"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e43fc16fccd8519fba405f0a0ff6e8a3"
+
+SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
+          file://groff-1.18.1.4-remove-mom.patch;striplevel=1 \
+          file://man-local.patch \
+          file://mdoc-local.patch" 
+
+inherit autotools
+
+EXTRA_OECONF="--without-x --prefix=${D} --exec-prefix=${D} --bindir=${D}${bindir} --datadir=${D}${datadir} --mandir=${D}${datadir}/man --infodir=${D}${datadir}info --with-appresdir=${D}${datadir}"
+
+SRC_URI[md5sum] = "ceecb81533936d251ed015f40e5f7287"
+SRC_URI[sha256sum] = "ff3c7c3b6cae5e8cc5062a144de5eff0022e8e970e1774529cc2d5dde46ce50d"
+PARALLEL_MAKE = ""
+
+
+do_configure (){
+	oe_runconf
+}
+
+do_install_prepend() {
+  install -m 0755 -d ${D}
+}
+
+
+do_install_append() {
+     mkdir -p ${D}${sysconfdir}/groff
+     cp -rf ${D}${datadir}/groff/site-tmac/* ${D}${sysconfdir}/groff/
+     cp -rf ${D}${datadir}/groff/site-tmac/* ${D}${datadir}/groff/${PV}/tmac/
+}
+
+pkg_postinst_${PN}() {
+    ln -s ${bindir}/tbl ${bindir}/gtbl
+    echo "export GROFF_FONT_PATH=/usr/share/groff/${PV}/font" >> ${sysconfdir}/profile
+    echo "export GROFF_TMAC_PATH=/usr/share/groff/${PV}/tmac" >> ${sysconfdir}/profile
+}
+
-- 
1.8.1.4


