Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C00F66004
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147341"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:23 -0700
Message-Id: <fa26782b547433e65c3ba38f62ac33577264ed3a.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 04/10] formfactor: convert to conf-files
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
 .../{formfactor/files => conf-files/conf-files}/machconfig         | 0
 .../{formfactor/files => conf-files/conf-files}/qemuarm/machconfig | 0
 .../files => conf-files/conf-files}/qemuarmv6/machconfig           | 0
 .../files => conf-files/conf-files}/qemuarmv7/machconfig           | 0
 .../files => conf-files/conf-files}/qemumips/machconfig            | 0
 .../{formfactor/files => conf-files/conf-files}/qemuppc/machconfig | 0
 .../files => conf-files/conf-files}/qemux86-64/machconfig          | 0
 .../{formfactor/files => conf-files/conf-files}/qemux86/machconfig | 0
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                      | 7 +++----
 9 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarm/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarmv6/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarmv7/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemumips/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuppc/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemux86-64/machconfig (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemux86/machconfig (100%)

diff --git a/meta/recipes-bsp/formfactor/files/machconfig b/meta/recipes-bsp/conf-files/conf-files/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemuarm/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemuarm/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemuarm/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemuarm/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemuarmv6/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemuarmv6/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemuarmv6/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv6/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemuarmv7/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemuarmv7/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemuarmv7/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemuarmv7/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemumips/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemumips/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemumips/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemumips/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemuppc/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemuppc/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemuppc/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemuppc/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemux86-64/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemux86-64/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemux86-64/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemux86-64/machconfig
diff --git a/meta/recipes-bsp/formfactor/files/qemux86/machconfig b/meta/recipes-bsp/conf-files/conf-files/qemux86/machconfig
similarity index 100%
rename from meta/recipes-bsp/formfactor/files/qemux86/machconfig
rename to meta/recipes-bsp/conf-files/conf-files/qemux86/machconfig
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index d1ae2a2..6410237 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r45"
 
-SRC_URI = "file://config file://machconfig"
+SRC_URI = "file://config"
 S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -15,7 +15,6 @@ do_install() {
 	# Only install file if it has a contents
         install -d ${D}${sysconfdir}/formfactor/
         install -m 0644 ${S}/config ${D}${sysconfdir}/formfactor/
-	if [ -s "${S}/machconfig" ]; then
-	        install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
-	fi
 }
+
+inherit conf-files
-- 
1.8.3.2


