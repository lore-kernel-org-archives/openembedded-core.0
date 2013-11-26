Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A7C866DD6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218535"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:54 +0000
Message-Id: <65cc0b3709edb17320e972b099806a6952a13060.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] eee-acpi-scripts: tidy up recipe
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
X-List-Received-Date: Tue, 26 Nov 2013 14:42:09 -0000

* Set SUMMARY instead of DESCRIPTION
* Move packaging variables to the end
* Fix spacing in LICENSE assignment
* Fix indenting

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index 5f613f6..c2a02aa 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -1,15 +1,13 @@
-DESCRIPTION = "eeePC specific ACPI scripts"
+SUMMARY = "eeePC specific ACPI scripts"
 HOMEPAGE = "http://alioth.debian.org/projects/debian-eeepc/"
 SECTION = "base"
 
-LICENSE="GPLv2"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=77ef83ab5f4af938a93edb61f7b74f2c"
 
 SRCREV = "9d4cdedca25b396405f8587f9c4fbf8229e041c2"
 PV = "1.1.12+git${SRCPV}"
 
-RDEPENDS_${PN} = "pm-utils"
-
 SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git \
 	   file://remove-doc-check.patch \
 	   file://powerbtn.patch \
@@ -18,9 +16,9 @@ SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git \
 S = "${WORKDIR}/git"
 
 FILES_${PN} = "${datadir}/acpi-support/ \
-		${datadir}/eeepc-acpi-scripts \
-		${sysconfdir}/default/ \
-		${sysconfdir}/acpi/"
+               ${datadir}/eeepc-acpi-scripts \
+               ${sysconfdir}/default/ \
+               ${sysconfdir}/acpi/"
 
 do_install () {
 	install -d ${D}${sysconfdir}/default/
@@ -36,3 +34,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/policy-funcs ${D}${datadir}/acpi-support/
 	install -m 0644 ${S}/debian/eeepc-acpi-scripts.default* ${D}${sysconfdir}/default/
 }
+
+RDEPENDS_${PN} = "pm-utils"
+
-- 
1.8.1.2


