Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 745356A44D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:16:23 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 02:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246063898"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:16:23 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 12:18:09 +0300
Message-Id: <378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
Subject: [PATCH 5/7] matchbox-keyboard: Update to 0.0+gitAUTOINCa+a17b1135daab9eb4cd3647c02e82687f96d93619
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
X-List-Received-Date: Fri, 24 May 2013 09:16:23 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

matchbox-keyboard: png-fix.patch was backported. (The newest version
contains 'png-fix.patch' changes).

---
 .../matchbox-keyboard/matchbox-keyboard_git.bb          |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 6944a07..e6ffad7 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -4,21 +4,19 @@ BUGTRACKER = "http://bugzilla.openedhand.com/"
 SECTION = "x11"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/matchbox-keyboard.h;endline=20;md5=4ba16ff913ad245dd6d95a6c67f72526 \
-                    file://applet/applet.c;endline=20;md5=e9201b3efa0a81a160b88d6feb5cf75b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/matchbox-keyboard.h;endline=20;md5=d12cc878e2a99870458c83c61714d99e \
+                    file://applet/applet.c;endline=20;md5=16d84e4d1572415c1295d37ca6d05dd4"
 
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 
-SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
+SRCREV = "a17b1135daab9eb4cd3647c02e82687f96d93619"
 PV = "0.0+git${SRCPV}"
-PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
-           file://80matchboxkeyboard.shbg \
-           file://png-fix.patch"
+           file://80matchboxkeyboard.shbg"
 
 S = "${WORKDIR}/git"
 
@@ -32,7 +30,8 @@ FILES_${PN} = "${bindir}/ \
 	       ${sysconfdir} \
 	       ${datadir}/applications \
 	       ${datadir}/pixmaps \
-	       ${datadir}/matchbox-keyboard"
+	       ${datadir}/matchbox-keyboard \
+           ${libdir}/libmatchbox-keyboard.so.*"
 
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
 
-- 
1.7.10.4


