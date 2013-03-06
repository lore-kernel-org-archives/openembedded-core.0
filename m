Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UDBTf-0003RP-NB
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 11:21:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Mar 2013 02:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,793,1355126400"; d="scan'208";a="209614289"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.45])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2013 02:04:02 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 12:04:31 +0200
Message-Id: <1362564271-25151-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sudo : upgrade to 1.8.6p7
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
X-List-Received-Date: Wed, 06 Mar 2013 10:22:07 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../sudo/{sudo_1.8.6p6.bb => sudo_1.8.6p7.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.6p6.bb => sudo_1.8.6p7.bb} (84%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p6.bb b/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
similarity index 84%
rename from meta/recipes-extended/sudo/sudo_1.8.6p6.bb
rename to meta/recipes-extended/sudo/sudo_1.8.6p7.bb
index 33cbcba..b79d0d5 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.6p6.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "394efcbfedb200ba188958f047ce76d2"
-SRC_URI[sha256sum] = "d600fee5cb2e843450263a2b8f133b9921ffa00cb6b841b0da82613447cefb7c"
+SRC_URI[md5sum] = "126abfa2e841139e774d4c67d80f0e5b"
+SRC_URI[sha256sum] = "301089edb22356f59d097f6abbe1303f03927a38691b02959d618546c2125036"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5



