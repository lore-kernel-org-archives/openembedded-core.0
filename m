Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R0SYK-00051Z-UF
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 08:21:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2011 23:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,331,1312182000"; d="scan'208";a="14056659"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2011 23:16:03 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2011 14:15:24 +0800
Message-Id: <12e84165018fd375acaea2942a85966a9b216b53.1315203166.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1315203166.git.lianhao.lu@intel.com>
References: <cover.1315203166.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] initramfs-live-install: Be consistent with grub.
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
X-List-Received-Date: Mon, 05 Sep 2011 06:21:05 -0000

[YOCTO #1428]
Because the underlying grub 0.97 the initramfs-live-install RDEPDNEDS on
only supports 32bit x86 target, set the COMPATIBLE_HOST accordingly.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../initrdscripts/initramfs-live-install_1.0.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index c792fe0..0eeabf1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -20,4 +20,5 @@ INHIBIT_DEFAULT_DEPS = "1"
 FILES_${PN} = " /install.sh "
 
 # Alternatives to grub need adding for other arch support
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+# consistent with grub 0.97
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.7.0.4



