Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E84FD70A56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:15:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 13:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="555356338"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2014 13:15:11 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:12:36 -0700
Message-Id: <eba8b0caf6889de7e39919fd1dfc88cfb68697e9.1407442264.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1407442264.git.max.eliaser@intel.com>
References: <cover.1407442264.git.max.eliaser@intel.com>
In-Reply-To: <cover.1407442264.git.max.eliaser@intel.com>
References: <cover.1407442264.git.max.eliaser@intel.com>
Subject: [PATCH 3/3] ubootchart: delete ubootchart recipe
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
X-List-Received-Date: Thu, 07 Aug 2014 20:15:11 -0000

The Ubootchart recipe had known issues. Ubootchart itself is no longer updated
upstream. Ubootchart is also now redundant with Bootchart2.

If people still want ubootchart around, it can be moved to meta-oe.

Ubootchart removed as part of the solution to [YOCTO #5893].

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta-yocto/conf/distro/include/distro_alias.inc    |  1 -
 meta-yocto/conf/distro/include/maintainers.inc     |  1 -
 meta-yocto/conf/distro/include/recipe_color.inc    |  1 -
 .../conf/distro/include/upstream_tracking.inc      |  2 --
 .../ubootchart/files/sysvinit.patch                | 14 --------
 .../ubootchart/files/ubootchart-stop               |  3 --
 .../ubootchart/files/ubootchart.desktop            |  6 ----
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb | 39 ----------------------
 8 files changed, 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/ubootchart/files/sysvinit.patch
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart-stop
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart.desktop
 delete mode 100644 meta/recipes-devtools/ubootchart/ubootchart_svn.bb

diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
index 48c1d92..5e2f214 100644
--- a/meta-yocto/conf/distro/include/distro_alias.inc
+++ b/meta-yocto/conf/distro/include/distro_alias.inc
@@ -435,7 +435,6 @@ DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
 DISTRO_PN_ALIAS_pn-tslib = "Debian=tslib Ubuntu=tslib"
 DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bitstream-vera"
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
-DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootchart"
 DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
 DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
 DISTRO_PN_ALIAS_pn-udev-extraconf = "OE-Core"
diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 7430c85..13e9209 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -646,7 +646,6 @@ RECIPE_MAINTAINER_pn-tslib = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-ttf-bitstream-vera = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-tzcode-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-tzdata = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-ubootchart = "Cristiana Voicu <cristiana.voicu@intel.com>"
 RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Cristiana Voicu <cristiana.voicu@intel.com>"
 RECIPE_MAINTAINER_pn-u-boot-mkimage = "Cristiana Voicu <cristiana.voicu@intel.com>"
 RECIPE_MAINTAINER_pn-udev-extraconf = "Cristiana Voicu <cristiana.voicu@intel.com>"
diff --git a/meta-yocto/conf/distro/include/recipe_color.inc b/meta-yocto/conf/distro/include/recipe_color.inc
index 7e50500..5474e83 100644
--- a/meta-yocto/conf/distro/include/recipe_color.inc
+++ b/meta-yocto/conf/distro/include/recipe_color.inc
@@ -383,7 +383,6 @@ RECIPE_COLOR_pn-trapproto = "yellow"
 RECIPE_COLOR_pn-tslib = "yellow"
 RECIPE_COLOR_pn-ttf-bitstream-vera = "yellow"
 RECIPE_COLOR_pn-tzdata = "yellow"
-RECIPE_COLOR_pn-ubootchart = "red"
 RECIPE_COLOR_pn-u-boot-mkimage = "red"
 RECIPE_COLOR_pn-udev = "yellow"
 RECIPE_COLOR_pn-udev-extraconf = "yellow"
diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index d80ede4..714b692 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -207,8 +207,6 @@ RECIPE_UPSTREAM_VERSION_pn-tremor="20120122"
 RECIPE_UPSTREAM_DATE_pn-tremor="Jan 22, 2012"
 CHECK_DATE_pn-tremor = "Mar 11, 2013"
 RECIPE_NO_UPDATE_REASON_pn-tremor = "Same revision on different SVN modules"
-RECIPE_UPSTREAM_VERSION_pn-ubootchart = "0.0+r12"
-CHECK_DATE_pn-ubootchart = "Sep 11, 2012"
 RECIPE_UPSTREAM_DATE_pn-udev-extraconf = "n/a"
 RECIPE_UPSTREAM_VERSION_pn-unifdef-native="2.6.18+git"
 RECIPE_UPSTREAM_DATE_pn-unifdef-native = "Feb 05, 2011"
diff --git a/meta/recipes-devtools/ubootchart/files/sysvinit.patch b/meta/recipes-devtools/ubootchart/files/sysvinit.patch
deleted file mode 100644
index fc82ed8..0000000
--- a/meta/recipes-devtools/ubootchart/files/sysvinit.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Index: ubootchart.conf
-===================================================================
---- ubootchart.conf	(revision 9)
-+++ ubootchart.conf	(working copy)
-@@ -1,6 +1,6 @@
- 
- # If you want to chain on and run somthing other than /sbin/init...
--export init_prog=/sbin/init
-+export init_prog=/sbin/init.sysvinit
- 
- # On startup ubootchart will mount a tmpfs filesystem at this
- # location and chdir here. This is only used for the logging of
diff --git a/meta/recipes-devtools/ubootchart/files/ubootchart-stop b/meta/recipes-devtools/ubootchart/files/ubootchart-stop
deleted file mode 100644
index 3444069..0000000
--- a/meta/recipes-devtools/ubootchart/files/ubootchart-stop
+++ /dev/null
@@ -1,3 +0,0 @@
-#! /bin/sh
-
-kill -USR1 $(pidof ubootchartd_bin)
diff --git a/meta/recipes-devtools/ubootchart/files/ubootchart.desktop b/meta/recipes-devtools/ubootchart/files/ubootchart.desktop
deleted file mode 100644
index 5552b3b..0000000
--- a/meta/recipes-devtools/ubootchart/files/ubootchart.desktop
+++ /dev/null
@@ -1,6 +0,0 @@
-[Desktop Entry]
-Encoding=UTF-8
-Exec=/sbin/ubootchart-stop
-Name=Stop Bootchart
-Type=Application
-Categories=Programming;
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
deleted file mode 100644
index b13755e..0000000
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "A boot profiling tool"
-HOMEPAGE = "http://code.google.com/p/ubootchart/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-SRCREV = "12"
-PV = "0.0+r${SRCPV}"
-PR = "r6"
-
-#RRECOMMENDS_${PN} = "acct"
-
-SRC_URI = "svn://ubootchart.googlecode.com/svn/;protocol=http;module=trunk \
-        file://sysvinit.patch;striplevel=0 \
-        file://ubootchart-stop \
-        file://ubootchart.desktop"
-
-S = "${WORKDIR}/trunk"
-
-inherit update-alternatives
-
-ALTERNATIVE_${PN} = "init"
-ALTERNATIVE_TARGET[init] = "${base_sbindir}/ubootchartd"
-ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
-ALTERNATIVE_PRIORITY = "70"
-
-do_compile() {
-        ${CC} ${CFLAGS} ${LDFLAGS} ${LIBS} ${INCLUDES} ${S}/ubootchartd_bin.c -o ubootchartd_bin
-}
-
-do_install() {
-        install -m 0755 -d ${D}${base_sbindir} ${D}${sysconfdir}/ubootchart ${D}${datadir}/applications
-        install -m 0755 ${S}/ubootchartd_bin ${D}${base_sbindir}
-        install -m 0755 ${S}/ubootchartd ${D}${base_sbindir}
-        install -m 0644 ${S}/ubootchart.conf ${D}${sysconfdir}/ubootchart
-        install -m 0755 ${S}/start.sh ${D}${sysconfdir}/ubootchart
-        install -m 0755 ${S}/finish.sh ${D}${sysconfdir}/ubootchart
-        
-        install -m 0755 ${WORKDIR}/ubootchart-stop ${D}${base_sbindir}
-        install -m 0644 ${WORKDIR}/ubootchart.desktop ${D}${datadir}/applications
-}
-- 
1.8.3.2


