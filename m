Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgHpX-0000Ix-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:28:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Dec 2012 08:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="176522951"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2012 08:13:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 08:13:49 -0800
Message-Id: <1354724029-9230-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [PATCH] python-smartpm: Fix build error
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
X-List-Received-Date: Wed, 05 Dec 2012 16:28:16 -0000

datadir is normally /usr/share so we don't need to add /share to it.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 254318c..3617fde 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -44,7 +44,7 @@ inherit distutils
 
 do_install_append() {
    # Cleanup unused item...
-   rmdir ${D}${datadir}/share
+   rmdir ${D}${datadir}
 
    # We don't support the following items
    rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
-- 
1.8.0.1



