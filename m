Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSm-0002em-7m
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2011 07:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,380,1309762800"; 
   d="scan'208";a="7747469"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 07:13:13 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:11 +0800
Message-Id: <17e0fb707e9ad926058898d39d32168f4e582ed1.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 01/10] bluez-hcidump: upgrade from 2.0 to 2.1
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:53 -0000

[YOCTO #1371]

Recently bluez4 was updated from 4.82 to 4.96 and bluez-hcidump can't build:
src/hcidump.c:54:24: error: redefinition of 'ntoh64'.

In 2.1 the duplicated definition of ntoh64 was removed.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{bluez-hcidump_2.0.bb => bluez-hcidump_2.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.0.bb => bluez-hcidump_2.1.bb} (83%)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb
similarity index 83%
rename from meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
rename to meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb
index c271ed2..ce84f58 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
-SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
+SRC_URI[md5sum] = "b160f0672276398344eebe9df1b37a2c"
+SRC_URI[sha256sum] = "a6cc20b95b6b1a28ff336aad91e124555231628689225c1155e8cd7aac1af86d"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.6



