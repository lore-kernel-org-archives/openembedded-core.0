Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD0-0003Ro-Gz
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086455"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:49 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:14 +0800
Message-Id: <2f23139f35bb6c58eb72b0d7562c0b95d41370e7.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 3/8] polkit-gnome: Upgrade to 0.102
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:31 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...polkit-gnome_0.101.bb => polkit-gnome_0.102.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/polkit/{polkit-gnome_0.101.bb => polkit-gnome_0.102.bb} (86%)

diff --git a/meta/recipes-extended/polkit/polkit-gnome_0.101.bb b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
similarity index 86%
rename from meta/recipes-extended/polkit/polkit-gnome_0.101.bb
rename to meta/recipes-extended/polkit/polkit-gnome_0.102.bb
index e619090..487e745 100644
--- a/meta/recipes-extended/polkit/polkit-gnome_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -23,5 +23,5 @@ inherit autotools pkgconfig
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
                "
-SRC_URI[md5sum] = "da6aaff473ed80f8958fd6f67a59defe"
-SRC_URI[sha256sum] = "f1452e37b6681a0ade2c0cbb3734e6f78c421b958ab4d4eb6a2cd3b9f50db8d0"
+SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
+SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
-- 
1.7.1



