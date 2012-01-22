Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1rs-0002ZG-HJ
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:10:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2012 10:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101467046"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2012 10:02:32 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:17 +0800
Message-Id: <5045392bfa4ecc5f778e0f1889b6325dfc847f51.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 12/18] mobile-broadband-provider-info: bring a new recipe into poky
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
X-List-Received-Date: Sun, 22 Jan 2012 18:10:16 -0000

This patch is to bring a new recipe mobile-broadband-provider-info into poky because the latest version ofono v1.3 depends on it.

And the patch is imported from the OpenEmbedded server (http://git.openembedded.org/openembedded/tree/recipes/mobile-broadband-provider-info) as of commit ids

commit 9d612c4bb9bef813bdef9e198efc5949d51905eb
commit 84bf98dc6876ef6be8a4ee3744924e922253b53e
commit 30a913149de95ecafe4ef87bd50cfdbd6737fe1e
commit 7d2be53866d317bb032c63548f504f63107b4c2c

And upgrade to the latest.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../mobile-broadband-provider-info_git.bb          |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
new file mode 100644
index 0000000..d1ca0f0
--- /dev/null
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Mobile Broadband Service Provider Database"
+SECTION = "network"
+LICENSE = "CCPD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
+SRCREV = "d9995ef693cb1ea7237f928df18e03cccba96f16"
+PV = "1.0.0+gitr${SRCPV}"
+PE = "1"
+PR = "r0"
+
+SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info;protocol=git"
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
1.7.6



