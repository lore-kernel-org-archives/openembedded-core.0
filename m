Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr7k-0000fY-RR
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:42:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:39:05 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:39:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:38:02 -0700
Message-Id: <175d8385703254b94b012ce90240cd3db60bc178.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
Subject: [PATCH 6/8] package_rpm.bbclass: create method for createrepo cmd
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
X-List-Received-Date: Sat, 21 May 2011 18:42:05 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package_rpm.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1d8c686..666eb54 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -15,6 +15,10 @@ python package_rpm_install () {
 	bb.fatal("package_rpm_install not implemented!")
 }
 
+package_createrepo () {
+	createrepo ${DEPLOY_DIR_RPM}
+}
+
 RPMCONF_TARGET_BASE = "${DEPLOY_DIR_RPM}/solvedb"
 RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
 #
@@ -816,6 +820,6 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 addtask package_write_rpm before do_package_write after do_package
 
-PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
+PACKAGEINDEXES += "package_update_index_rpm; package_createrepo"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
-- 
1.7.3.4



