Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFpOv-0006kI-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:19:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 09:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150028183"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2012 09:09:56 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 00:10:11 +0800
Message-Id: <515847c54a45a2cb7922cec91d2aeac26a4a7dea.1333642153.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333642153.git.dexuan.cui@intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333642153.git.dexuan.cui@intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
Subject: [PATCH 1/3] libxaw: move it from meta-demoapps/ into meta/ and upgrade it to 1.0.10
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
X-List-Received-Date: Thu, 05 Apr 2012 16:19:10 -0000

Add LICENSE and LIC_FILES_CHKSUM;
Add SRC_URI checksums;
Remove do_install_append since 1.0.10's Makefile has done the work.

libxaw is needed by xterm.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../recipes-graphics/xorg-lib/libxaw_1.0.10.bb     |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb => meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb (59%)

diff --git a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
similarity index 59%
rename from meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
rename to meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 489f456..a10577e 100644
--- a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -3,16 +3,15 @@ require xorg-lib-common.inc
 DESCRIPTION = "X Athena Widget Set"
 DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
 PROVIDES = "xaw"
-PR = "r1"
-PE = "1"
+PR = "r0"
 
-XORG_PN = "libXaw"
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
+
+SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
+SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
 
-do_install_append () {
-	ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
+XORG_PN = "libXaw"
 
 PACKAGES =+ "libxaw6 libxaw7 libxaw8"
 
-- 
1.7.6



