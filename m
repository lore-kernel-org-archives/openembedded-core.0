Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C997D6B232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147348"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:25 -0700
Message-Id: <b4bb7714ecccd51baffcc5bb98b6fb4af57b9bc6.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 06/10] init-ifupdown: convert to use conf-files
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
 .../conf-files/conf-files}/interfaces                               | 0
 .../conf-files/conf-files}/qemuarm/interfaces                       | 0
 .../conf-files/conf-files}/qemuarmv6/interfaces                     | 0
 .../conf-files/conf-files}/qemuarmv7/interfaces                     | 0
 .../conf-files/conf-files}/qemumips/interfaces                      | 0
 .../conf-files/conf-files}/qemumips64/interfaces                    | 0
 .../conf-files/conf-files}/qemuppc/interfaces                       | 0
 .../conf-files/conf-files}/qemush4/interfaces                       | 0
 .../conf-files/conf-files}/qemux86-64/interfaces                    | 0
 .../conf-files/conf-files}/qemux86/interfaces                       | 0
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb                | 6 +-----
 11 files changed, 1 insertion(+), 5 deletions(-)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarm/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarmv6/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarmv7/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemumips/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemumips64/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuppc/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemush4/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemux86-64/interfaces (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemux86/interfaces (100%)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces b/meta/recipes-bsp/conf-files/conf-files/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemuarm/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemuarm/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemuarmv6/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv6/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemuarmv7/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv7/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemumips/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemumips/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemumips64/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemumips64/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemuppc/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemuppc/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemush4/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemush4/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemux86-64/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemux86-64/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces b/meta/recipes-bsp/conf-files/conf-files/qemux86/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
rename to meta/recipes-bsp/conf-files/conf-files/qemux86/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 3d88506..ca65c79 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -6,14 +6,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PR = "r7"
 
-inherit update-rc.d
+inherit update-rc.d conf-files
 
 INITSCRIPT_NAME = "networking"
 INITSCRIPT_PARAMS = "start 01 2 3 4 5 . stop 80 0 6 1 ."
 
 SRC_URI = "file://copyright \
            file://init \
-           file://interfaces \
            file://nfsroot"
 
 do_install () {
@@ -23,7 +22,6 @@ do_install () {
 			${D}${sysconfdir}/network/if-down.d \
 			${D}${sysconfdir}/network/if-post-down.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
-	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
 	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
 }
 
@@ -35,5 +33,3 @@ do_install_append_qemuall () {
 PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "netbase"
 RCONFLICTS_${PN} = "netbase (< 1:5.0)"
-
-CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
-- 
1.8.3.2


