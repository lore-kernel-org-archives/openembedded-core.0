Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3e-0004Xt-Js
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897567"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:04 -0700
Message-Id: <6ecf1e2d99183208dc72d006d290b7d4e7c44c50.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/28] dhcp: remove dependency of dev/staticdev packages on main package
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
X-List-Received-Date: Wed, 25 Jul 2012 07:30:58 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The main package is empty and is not produced, which leaves the dev
and staticdev packages broken. Remove the dependencies (added in
bitbake.conf by default) to fix this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc         |    2 ++
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 8ead016..3159f93 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -56,6 +56,8 @@ do_install_append () {
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 FILES_${PN} = ""
+RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-staticdev = ""
 
 FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
 RRECOMMENDS_dhcp-server = "dhcp-server-config"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
index 24b50ba..67af3e2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.7.6



