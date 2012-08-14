Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCE-0000Xj-L0
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181087"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:13:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:52 +0300
Message-Id: <5623cc2a909aa332092db9ca0c79ef36c2987554.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 05/64] console-tools: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../console-tools/console-tools_0.3.2.bb           |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 6027d4a..1446368 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://codepage.patch \
@@ -35,6 +35,10 @@ inherit autotools gettext update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 bindir_progs = "chvt deallocvt fgconsole openvt"
-ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
+ALTERNATIVE_${PN} = "${bindir_progs}"
+#python __anonymous() {
+#	for prog in d.getVar('bindir_progs', True).split():
+#		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+#}
 
 RDEPENDS_${PN} = "bash"
-- 
1.7.7.6



