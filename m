Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UAL6t-0000ak-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 15:02:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Feb 2013 05:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,740,1355126400"; d="scan'208";a="206431171"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2013 05:46:01 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 15:46:22 +0200
Message-Id: <1361886382-27041-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sudo : upgrade to 1.8.6p6
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
X-List-Received-Date: Tue, 26 Feb 2013 14:02:35 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../sudo/{sudo_1.8.6p4.bb => sudo_1.8.6p6.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.6p4.bb => sudo_1.8.6p6.bb} (84%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p4.bb b/meta/recipes-extended/sudo/sudo_1.8.6p6.bb
similarity index 84%
rename from meta/recipes-extended/sudo/sudo_1.8.6p4.bb
rename to meta/recipes-extended/sudo/sudo_1.8.6p6.bb
index 115439b..33cbcba 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.6p4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.6p6.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "cd19154e341b28573801397f0736126b"
-SRC_URI[sha256sum] = "364ad88ca3afcadcff6bd6820b0af19c56ce4876704dae210e21845d923e59e8"
+SRC_URI[md5sum] = "394efcbfedb200ba188958f047ce76d2"
+SRC_URI[sha256sum] = "d600fee5cb2e843450263a2b8f133b9921ffa00cb6b841b0da82613447cefb7c"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5



