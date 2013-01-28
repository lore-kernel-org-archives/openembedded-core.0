Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4P-0003oH-US
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769982"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:51 -0800
Message-Id: <885a51c8c2a681a587837b0fe637ce0d3f8835ee.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 04/13] mc: Update to 4.8.7
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.6.bb => mc_4.8.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.6.bb => mc_4.8.7.bb} (82%)

diff --git a/meta/recipes-extended/mc/mc_4.8.6.bb b/meta/recipes-extended/mc/mc_4.8.7.bb
similarity index 82%
rename from meta/recipes-extended/mc/mc_4.8.6.bb
rename to meta/recipes-extended/mc/mc_4.8.7.bb
index 048b781..0e8f3c1 100644
--- a/meta/recipes-extended/mc/mc_4.8.6.bb
+++ b/meta/recipes-extended/mc/mc_4.8.7.bb
@@ -10,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "323706aa5e77698bed7b0b6faa7c1530"
-SRC_URI[sha256sum] = "17034d16cf5e86ed15e0f5de95238afb0a8c6069b1f0a29397042451c1b75877"
+SRC_URI[md5sum] = "b113e50682293a953141134969dba785"
+SRC_URI[sha256sum] = "4e9c45925b47650dac58d7556a89c3e9b4275e48976b6c13b63c2f8eed3a383b"
 
 inherit autotools gettext
 
-- 
1.8.0.2



