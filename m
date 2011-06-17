Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QXPLy-00034L-4p
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 05:04:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2011 20:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,379,1304319600"; d="scan'208";a="19229521"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2011 20:00:43 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org, jmitchell@ll.mit.edu,
	dvhart@linux.intel.com
Date: Fri, 17 Jun 2011 11:00:22 +0800
Message-Id: <be638790e41206ed740aec69a8704fe77d1bc0b2.1308278404.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1308278404.git.dexuan.cui@intel.com>
References: <cover.1308278404.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1308278404.git.dexuan.cui@intel.com>
References: <cover.1308278404.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] glib-2.0, intltool, rpm, sgmlspl-native: Bump PR to resolve perl-native issue
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
X-List-Received-Date: Fri, 17 Jun 2011 03:04:14 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |    2 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
index 776284e..0b30d17 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
index ca5f4c8..9c7a244 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
@@ -1,7 +1,7 @@
 require glib.inc
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index 88d441c..ea67144 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append = " file://intltool-nowarn-0.40.0.patch"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 0c88f91..057e7da 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r17"
+PR = "r18"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
index 1fab417..4e01f17 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgm
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/authors/id/D/DM/DMEGG/SGMLSpm-${PV}.tar.gz \
            file://combined.patch"
-- 
1.7.2



