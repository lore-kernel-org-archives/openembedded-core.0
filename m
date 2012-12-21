Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tm54G-0005lb-OR
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 17:03:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2012 07:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,330,1355126400"; d="scan'208";a="265611313"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2012 07:48:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 17:49:00 +0200
Message-Id: <1356104940-12176-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iptables: upgrade to v1.4.16.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 16:03:26 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iptables/{iptables_1.4.15.bb => iptables_1.4.16.3.bb}      |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.15.bb => iptables_1.4.16.3.bb} (87%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.15.bb b/meta/recipes-extended/iptables/iptables_1.4.16.3.bb
similarity index 87%
rename from meta/recipes-extended/iptables/iptables_1.4.15.bb
rename to meta/recipes-extended/iptables/iptables_1.4.16.3.bb
index d556c77..37665a0 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.15.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.16.3.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Tools for managing kernel packaet filtering capabilities"
+SUMMARY = "Tools for managing kernel packet filtering capabilities"
 DESCRIPTION = "iptables is the userspace command line program used to configure and control network packet \
 filtering code in Linux."
 HOMEPAGE = "http://www.netfilter.org/"
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
 
-PR = "r1"
+PR = "r0"
 
 RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-ip-tables \
@@ -24,8 +24,8 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch"
 
-SRC_URI[md5sum] = "8bf564ea8348522fc1db727868828def"
-SRC_URI[sha256sum] = "867c144e60075e7bebe6fcecf0b65169d5e2d1fa5ceec2ebd9780cd5026123ea"
+SRC_URI[md5sum] = "6dd40c12fb8f4c4312a0f8434369fbcd"
+SRC_URI[sha256sum] = "643ccf34099d53d5b839e1d889c05627745a51ec122648e76a9fcec3a8a9ec79"
 
 inherit autotools
 
-- 
1.7.10.4



