Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qgi8S-00015d-9l
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:56:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="29496860"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 11:52:38 -0700
Message-Id: <664a92ced9bc0614d5ba98244bfdfc32e3e2b637.1310496679.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1310496679.git.nitin.a.kamble@intel.com>
References: <cover.1310496679.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] binutils: package unpackaged files
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
X-List-Received-Date: Tue, 12 Jul 2011 18:56:45 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

To fix these package qa warnings
WARNING: For recipe binutils, the following files were installed but not shipped in any package:
WARNING:   /usr/bin/ld.bfd
WARNING:   /usr/bin/elfedit

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
 .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 ++
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
index 7dad2a6..e91e7dc 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
index 0d6efff..21289cd 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r0"
+PR = "r1"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 08c14b2..9a6b9c8 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -35,11 +35,13 @@ FILES_${PN}-symlinks = " \
 	${bindir}/c++filt \
 	${bindir}/gprof \
 	${bindir}/ld \
+	${bindir}/ld.bfd \
 	${bindir}/nm \
 	${bindir}/objcopy \
 	${bindir}/objdump \
 	${bindir}/ranlib \
 	${bindir}/readelf \
+	${bindir}/elfedit \
 	${bindir}/size \
 	${bindir}/strip"
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
index 368ec4a..4eb6566 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-- 
1.7.4.4



