Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B2BDE6AD68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147352"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:27 -0700
Message-Id: <c664df81298278ecb3fa2eae5573bbbeded75782.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 08/10] xserver-xf86-config: convert to use conf-files and remove
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf-files/conf-files}/qemuarm/xorg.conf         |  0
 .../conf-files/conf-files}/qemumips/xorg.conf        |  0
 .../conf-files/conf-files}/qemumips64/xorg.conf      |  0
 .../conf-files/conf-files}/qemuppc/xorg.conf         |  0
 .../conf-files/conf-files}/qemush4/xorg.conf         |  0
 .../conf-files/conf-files}/qemux86-64/xorg.conf      |  0
 .../conf-files/conf-files}/qemux86/xorg.conf         |  0
 .../conf-files/conf-files}/xorg.conf                 |  0
 .../xorg-xserver/xserver-xf86-config_0.1.bb          | 20 --------------------
 9 files changed, 20 deletions(-)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemuarm/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemumips/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemumips64/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemuppc/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemush4/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemux86-64/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemux86/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/xorg.conf (100%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemuarm/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemuarm/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemumips/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemumips/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemumips64/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemumips64/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemuppc/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemuppc/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemush4/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemush4/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemux86-64/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemux86-64/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/qemux86/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/qemux86/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf b/meta/recipes-bsp/conf-files/conf-files/xorg.conf
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf
rename to meta/recipes-bsp/conf-files/conf-files/xorg.conf
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
deleted file mode 100644
index 549c7c8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "X.Org X server configuration file"
-HOMEPAGE = "http://www.x.org"
-SECTION = "x11/base"
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r33"
-
-SRC_URI = "file://xorg.conf"
-
-CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-ALLOW_EMPTY_${PN} = "1"
-
-do_install () {
-	if test -s ${WORKDIR}/xorg.conf; then
-		install -d ${D}/${sysconfdir}/X11
-		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
-	fi
-}
-- 
1.8.3.2


