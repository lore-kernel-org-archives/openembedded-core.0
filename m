Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QlgtD-0001NR-G8
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:37:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 05:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="34603581"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 05:33:20 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 20:30:53 +0800
Message-Id: <c215eef1b71e414ea9a518a54c0918f2a79ff56e.1311682779.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1311682779.git.edwin.zhai@intel.com>
References: <cover.1311682779.git.edwin.zhai@intel.com>
Subject: [PATCH 1/3] xinput: Add 1.5.3 as new recipes
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
X-List-Received-Date: Tue, 26 Jul 2011 12:37:37 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
new file mode 100644
index 0000000..cc71857
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+
+SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
+SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
-- 
1.7.1



