Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0hdd-0005DD-GO
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 01:04:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2013 15:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,572,1355126400"; d="scan'208";a="280577656"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.123])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2013 15:48:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 15:48:37 -0800
Message-Id: <1359589717-30779-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] dhcp: Fix unshipped WARNINGS
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
X-List-Received-Date: Thu, 31 Jan 2013 00:04:26 -0000

This fixes:
WARNING: QA Issue: dhcp: Files/directories were installed but not shipped
  /etc/dhcpd.conf.example
  /etc/dhclient.conf.example

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      | 4 ++--
 meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 3159f93..ad82b57 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -41,8 +41,8 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
 	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
 
-	rm -f ${D}${sysconfdir}/dhclient.conf
-	rm -f ${D}${sysconfdir}/dhcpd.conf
+	rm -f ${D}${sysconfdir}/dhclient.conf*
+	rm -f ${D}${sysconfdir}/dhcpd.conf*
 	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
 	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
index af60763..0f247ae 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.8.0.2



