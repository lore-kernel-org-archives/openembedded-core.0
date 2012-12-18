Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkrX0-0003Tx-BT
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 08:24:02 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2012 23:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="182231442"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.212])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 23:09:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 23:09:17 -0800
Message-Id: <1355814558-19628-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 1/2] standalone-sdk: Need to have an update-alternatives package
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
X-List-Received-Date: Tue, 18 Dec 2012 07:24:02 -0000

This is required to correctly install the SDK in a standalone
situation

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index c8b5623..e5561e5 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -19,3 +19,6 @@ RDEPENDS_${PN} = "\
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
     "
+
+# We need the target update-alternative to install correctly
+RDEPENDS += "${VIRTUAL-RUNTIME_update-alternatives}"
-- 
1.8.0.2



