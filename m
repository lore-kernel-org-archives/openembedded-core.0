Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F63B732EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2015 02:10:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,557,1418112000"; d="scan'208";a="525866924"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 11 Feb 2015 02:02:22 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 12:10:22 +0200
Message-Id: <a862c8276170c0ea5910a9bb0e7c1d647198f3d5.1423649391.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423649391.git.cristian.iorga@intel.com>
References: <cover.1423649391.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423649391.git.cristian.iorga@intel.com>
References: <cover.1423649391.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] connman: upgrade to 1.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 10:10:37 -0000

- Fixes an issue with DHCPv6 retransmission timer
calculation that causes system load to jump to 100%;
- All WiFi P2P issues encountered with Miracast have been addressed;
- ConnMan no longer hands off foreground autoscanning to
wpa_supplicant as it causes issues when finding hidden WiFi networks;

Other changes and fixes include:

- Several fixes for handling IPv6 contexts via oFono;
- Fix memory deallocation in exit code paths;
- Use OPEN auth_alg for wpa_supplicant open WiFi networks;
- A WiFi Access Point with unknown strength now has a proper
minimum value which translates to a service 'Strenght' property of 30;
- Fix byte order in DHCP server identifier;
- Properly cancel an ongoing service connect if the Agent exits.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/{connman_1.26.bb => connman_1.28.bb}                     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.26.bb => connman_1.28.bb} (67%)

diff --git a/meta/recipes-connectivity/connman/connman_1.26.bb b/meta/recipes-connectivity/connman/connman_1.28.bb
similarity index 67%
rename from meta/recipes-connectivity/connman/connman_1.26.bb
rename to meta/recipes-connectivity/connman/connman_1.28.bb
index 7c0c4f7..53e71fa 100644
--- a/meta/recipes-connectivity/connman/connman_1.26.bb
+++ b/meta/recipes-connectivity/connman/connman_1.28.bb
@@ -5,9 +5,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "ba05b110b7c81e5fa14e8b402ef37a9e"
-SRC_URI[sha256sum] = "7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a"
+SRC_URI[md5sum] = "6e07c93877f80bb73c9d4dbfc697f3fc"
+SRC_URI[sha256sum] = "b1d5e7dd2652725906e220a8b0206477e97080e835272971e3b2fd10943c5c94"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-PR = "r1"
-- 
2.1.0


