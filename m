Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpNSz-0008Ot-OU
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 19:46:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2012 10:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="171067388"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2012 10:35:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 10:35:02 -0700
Message-Id: <1342114502-31881-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] Update proto -> protocol for recipes
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
X-List-Received-Date: Thu, 12 Jul 2012 17:46:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 .../installer/adt-installer_1.0.bb                 |    2 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +++---
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 7dd9810..110febf 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -7,7 +7,7 @@ PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 0e40533..a2e9ae0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 5dc0896..e1edf2f 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -39,7 +39,7 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://wget_cache.patch \
            file://adt_installer \
            file://scripts/adt_installer_internal \
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index faf0ba3..a0667ac 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -1,6 +1,6 @@
 require opkg.inc
 
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://add_vercmp.patch \
            file://add_uname_support.patch \
            file://fix_installorder.patch \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 8ac8022..25fccaf 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;proto=git \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
            http://www.eclipse.org/legal/epl-v10.html;name=epl \
            file://fix_ranlib.patch \
            file://fix_tcf-agent.init.patch \
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index d8c9760..b49e94a 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -8,7 +8,7 @@ PR = "r5"
 
 #RRECOMMENDS_${PN} = "acct"
 
-SRC_URI = "svn://ubootchart.googlecode.com/svn/;proto=http;module=trunk \
+SRC_URI = "svn://ubootchart.googlecode.com/svn/;protocol=http;module=trunk \
         file://sysvinit.patch;striplevel=0 \
         file://ubootchart-stop \
         file://ubootchart.desktop"
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index 7635e7a..da74a82 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -8,7 +8,7 @@ SRCREV = "1161"
 PV = "2.11.0+svnr${SRCPV}"
 PR = "r3"
 
-SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;proto=http \
+SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-media.patch;striplevel=0;name=patch3 \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
index 4aad3a9..8b162be 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
@@ -9,7 +9,7 @@ SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
 PV = "0.1+git${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;proto=git \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;protocol=git \
 	file://fix_makefile.patch \
 	  "
 
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 7d0aae9..6a6839d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -22,9 +22,9 @@ PV = "1.7.2+svnr${SRCPV}"
 PR = "r6"
 
 SRC_URI = "\
-  svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Source;protocol=http;name=source \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http \
   file://Makefile \
   file://Makefile.shared \
   file://autogen.sh \
-- 
1.7.7.6



