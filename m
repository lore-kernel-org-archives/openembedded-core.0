Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSs-0002fL-1C
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2011 07:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,380,1309762800"; d="scan'208";a="41942318"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2011 07:13:15 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:13 +0800
Message-Id: <78316e1f47eb8d63646cd9361ac7d1bb8a188a4a.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 03/10] cronie: upgrade from 1.4.7 to 1.4.8
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:59 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../cronie/{cronie_1.4.7.bb => cronie_1.4.8.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.7.bb => cronie_1.4.8.bb} (94%)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.7.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
similarity index 94%
rename from meta/recipes-extended/cronie/cronie_1.4.7.bb
rename to meta/recipes-extended/cronie/cronie_1.4.8.bb
index bb715f2..4cfdfad 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 SECTION = "utils"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -25,8 +25,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 
 
-SRC_URI[md5sum] = "dfc26c47756d0c40ee27ae3c7ee98e0d"
-SRC_URI[sha256sum] = "83bae15ae5504454ba74f4142f5db3aa22be594327fea19d2534f65803137fbd"
+SRC_URI[md5sum] = "9b1d2ce6db8d1883e06635f437170657"
+SRC_URI[sha256sum] = "a3b910876f255712f1a5c364b74f34b0ceac9f6f3bbc45e854c5722785f513b3"
 
 inherit autotools update-rc.d
 
-- 
1.7.6



