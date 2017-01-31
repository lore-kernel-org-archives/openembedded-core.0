Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0AC71DCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 13:23:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 31 Jan 2017 05:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="37757813"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 05:23:34 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 15:23:29 +0200
Message-Id: <20170131132330.4422-3-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
References: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] wpa-supplicant: inherit pkgconfig
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
X-List-Received-Date: Tue, 31 Jan 2017 13:23:34 -0000

Missing dependency uncovered after recipe specific sysroots were enabled.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index b96f9d2..146bccf 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -13,7 +13,7 @@ PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = ",,openssl"
 
-inherit systemd
+inherit pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.10.2


