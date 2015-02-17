Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 91E1973578
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780945"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:15 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:08:01 +0200
Message-Id: <2bf3ca3955eaebb0eee7c02957eef8f503e2c5b8.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
Subject: [PATCH v2 08/11] conf/distro/include/default-providers: updated bluez-hcidump providers
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:43 -0000

If BlueZ5 is added to a build as a replacement for BlueZ4,
the provider for bluez-hcidump will be bluez5.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 4dc42a7..25118fa 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -44,7 +44,7 @@ PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','sy
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
-PREFERRED_PROVIDER_bluez-hcidump ?= "bluez-hcidump"
+PREFERRED_PROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
-- 
2.1.0


