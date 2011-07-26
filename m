Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QlgtG-0001Nf-0z
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:37:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 05:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="34603596"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 05:33:21 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 20:30:55 +0800
Message-Id: <52ec57496855b6c4fdbb396366a503bf1988839e.1311682779.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
Subject: [PATCH 3/3] evtest: Add 1.25 as new recipe
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
X-List-Received-Date: Tue, 26 Jul 2011 12:37:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/evtest/evtest_1.25.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/evtest/evtest_1.25.bb

diff --git a/meta/recipes-graphics/evtest/evtest_1.25.bb b/meta/recipes-graphics/evtest/evtest_1.25.bb
new file mode 100644
index 0000000..ddd451b
--- /dev/null
+++ b/meta/recipes-graphics/evtest/evtest_1.25.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Simple tool for input event debugging."
+HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+PR = "r0"
+
+DEPENDS = "libxml2"
+
+SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2"
+SRC_URI[md5sum] = "770d6af03affe976bdbe3ad1a922c973"
+SRC_URI[sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
+
+inherit autotools
-- 
1.7.1



