Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 98B896FE64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:50:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2014 05:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,486,1400050800"; d="scan'208";a="556190344"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2014 05:50:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2014 15:54:11 +0300
Message-Id: <c6aadef9af0da66def2901b22e2d22e3c00bcda4.1402923181.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1402923181.git.cristian.iorga@intel.com>
References: <cover.1402923181.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1402923181.git.cristian.iorga@intel.com>
References: <cover.1402923181.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] wpa-supplicant: upgrade to 2.2
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
X-List-Received-Date: Mon, 16 Jun 2014 12:50:40 -0000

- P2P enhancements/fixes;
- Interworking/Hotspot 2.0 enhancements;
- Internal TLS implementation enhancements/fixes;
- D-Bus interface extensions/fixes;
- various bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc           | 4 ++--
 .../wpa-supplicant/{wpa-supplicant_2.1.bb => wpa-supplicant_2.2.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.1.bb => wpa-supplicant_2.2.bb} (100%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 61c29ef..d9c6532 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -22,8 +22,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://99_wpa_supplicant \
            file://fix-libnl3-host-contamination.patch \
           "
-SRC_URI[md5sum] = "e96b8db5a8171cd17a5b2012d6ad7cc7"
-SRC_URI[sha256sum] = "91632e7e3b49a340ce408e2f978a93546a697383abf2e5a60f146faae9e1b277"
+SRC_URI[md5sum] = "238e8e888bbd558e1a57e3eb28d1dd07"
+SRC_URI[sha256sum] = "e0d8b8fd68a659636eaba246bb2caacbf53d22d53b2b6b90eb4b4fef0993c8ed"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.bb
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.bb
-- 
1.9.1


