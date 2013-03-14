Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdm-0003Ye-3x
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773898"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:41 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:10 +0200
Message-Id: <e84d305d685972eebed2a71e1e4c670bc42f65bc.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 11/17] cronie: Upgrade to v1.4.9
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
X-List-Received-Date: Thu, 14 Mar 2013 18:12:36 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb}    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb} (94%)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.9.bb
similarity index 94%
rename from meta/recipes-extended/cronie/cronie_1.4.8.bb
rename to meta/recipes-extended/cronie/cronie_1.4.9.bb
index ce59437..7db0381 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.9.bb
@@ -18,7 +18,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -28,8 +28,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 
 
-SRC_URI[md5sum] = "9b1d2ce6db8d1883e06635f437170657"
-SRC_URI[sha256sum] = "a3b910876f255712f1a5c364b74f34b0ceac9f6f3bbc45e854c5722785f513b3"
+SRC_URI[md5sum] = "9133195e5e6f824ef460f5ccc533f1b7"
+SRC_URI[sha256sum] = "bd7f6f118460c452bd1217a24b80fd3c000425d3de28731b98354a81a2133e92"
 
 inherit autotools update-rc.d useradd
 
-- 
1.7.9.5



