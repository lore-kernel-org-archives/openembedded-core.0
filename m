Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UGC5k-0002JZ-6k
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 18:37:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="270875277"
Received: from unknown (HELO sentry.rb.intel.com) ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2013 10:20:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:20:54 +0200
Message-Id: <1363281654-20280-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iptables: upgrade to 1.4.18
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
X-List-Received-Date: Thu, 14 Mar 2013 17:37:25 -0000

fix-link-failure-ip6t-NETMAP.patch removed;
already included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iptables/{iptables_1.4.17.bb => iptables_1.4.18.bb}        |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.17.bb => iptables_1.4.18.bb} (88%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb b/meta/recipes-extended/iptables/iptables_1.4.18.bb
similarity index 88%
rename from meta/recipes-extended/iptables/iptables_1.4.17.bb
rename to meta/recipes-extended/iptables/iptables_1.4.18.bb
index f8ef7b6..222fad9 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.18.bb
@@ -7,8 +7,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
 
-PR = "r0"
-
 RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-ip-tables \
                      kernel-module-iptable-filter \
@@ -23,10 +21,10 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
-           file://fix-link-failure-ip6t-NETMAP.patch \
            file://fix-iptables-extensions-build-error.patch"
-SRC_URI[md5sum] = "c3fb2ffd5b39d0d54b06ccc4c8660116"
-SRC_URI[sha256sum] = "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a543a1cd70554925"
+
+SRC_URI[md5sum] = "a819199d5ec013b82da13a8ffbba857e"
+SRC_URI[sha256sum] = "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba79bf251c6a7bcf3c"
 
 inherit autotools
 
-- 
1.7.10.4



