Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerp-00041u-2P
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203814"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:43 -0700
Message-Id: <dd1fb4024b9461df994bfabbe502c6887e843acf.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/32] mc: update to 4.7.5.2
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mc/{mc_4.7.5.1.bb => mc_4.7.5.2.bb}            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.7.5.1.bb => mc_4.7.5.2.bb} (78%)

diff --git a/meta/recipes-extended/mc/mc_4.7.5.1.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
similarity index 78%
rename from meta/recipes-extended/mc/mc_4.7.5.1.bb
rename to meta/recipes-extended/mc/mc_4.7.5.2.bb
index 9e790df..c407b0b 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.1.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -10,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "2ffe4771e94569d497010eea298b13cd"
-SRC_URI[sha256sum] = "4d60a9fcd186b70f52d4e730ae3d43408a73e3f0647968e9f4af8005f13369e9"
+SRC_URI[md5sum] = "bdae966244496cd4f6d282d80c9cf3c6"
+SRC_URI[sha256sum] = "a68338862bb30017eb65ed569a58e80ab66ae8cef11c886440c9e9f4d1efc6ab"
 
 inherit autotools gettext
 
-- 
1.7.3.4



