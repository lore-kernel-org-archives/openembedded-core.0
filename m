Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKc-0008Vb-BJ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:26:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 08:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; d="scan'208";a="34716066"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2011 08:21:20 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:35 +0800
Message-Id: <6b48789cfad21231961f269dafc9fdd973526d1c.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/7] openjade-native: Change RDEPENDS of sgml-common-native
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
X-List-Received-Date: Wed, 03 Aug 2011 15:26:02 -0000

openjade-native should RDEPENDS on sgml-common-native but not
sgml-common

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../openjade/openjade-native_1.3.2.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index c71f22a..6cc6bb5 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 PR = "r4"
 
 DEPENDS = "opensp-native sgml-common-native"
-RDEPENDS_${PN} = "sgml-common"
+RDEPENDS_${PN} = "sgml-common-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
-- 
1.7.1



