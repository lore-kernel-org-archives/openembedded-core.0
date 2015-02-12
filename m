Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D671173398
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:24:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2015 05:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="453678304"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2015 05:04:51 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:19:27 +0200
Message-Id: <164ce4dee5f169a99c1054b48a5e50bf89451816.1423747110.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423747110.git.cristian.iorga@intel.com>
References: <cover.1423747110.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423747110.git.cristian.iorga@intel.com>
References: <cover.1423747110.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] bluez5: upgrade to 5.28
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
X-List-Received-Date: Thu, 12 Feb 2015 13:24:54 -0000

- Fixes to GATT service discovery & probing;
- Fix for bearer selection with dual-mode devices;
- Fix potential crash when removing devices;
- Fix issue with incomplete names in EIR data;
- Fix parsing GATT name characteristics;
- Fix AVCTP long press & key repetition handling;
- Fixes for GATT notification handling.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.27.bb b/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.27.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.28.bb
index 9497ee5..60e9244 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.27.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "a8fc508690e497e88c2c0b373cd653a8"
-SRC_URI[sha256sum] = "fbf33cebc76f8c81f28f0d67c71a8a1ec4b04b087460ec7353f7e0c207a1f981"
+SRC_URI[md5sum] = "bc20a8285530758c68f6a60e4ca62a15"
+SRC_URI[sha256sum] = "85bab48f4b47a158739028682c1e09cf30099c8ea9dfe63360055f8e06fc18a9"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.1.0


