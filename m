Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tthnr-00024y-GA
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 17:50:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 08:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="242815688"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2013 08:34:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 18:34:49 +0200
Message-Id: <1357922089-20065-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] quota: upgrade to 4.01
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
X-List-Received-Date: Fri, 11 Jan 2013 16:50:04 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/quota/{quota_4.00.bb => quota_4.01.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/quota/{quota_4.00.bb => quota_4.01.bb} (85%)

diff --git a/meta/recipes-extended/quota/quota_4.00.bb b/meta/recipes-extended/quota/quota_4.01.bb
similarity index 85%
rename from meta/recipes-extended/quota/quota_4.00.bb
rename to meta/recipes-extended/quota/quota_4.01.bb
index 25f6381..e2b7ad7 100644
--- a/meta/recipes-extended/quota/quota_4.00.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -10,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "975f587ff761a60ac25dbe6c00865925"
-SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51fb409ba"
+SRC_URI[md5sum] = "5c2c31e321d2e1322ce12d69ae5c66d6"
+SRC_URI[sha256sum] = "a36300bbc126b79b745bf937245092808b4585aa3309ef3335d4ab9d873cd206"
 
 S = "${WORKDIR}/quota-tools"
 
-- 
1.7.10.4



