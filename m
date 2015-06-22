Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DF60873237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:12:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2015 04:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,658,1427785200"; d="scan'208";a="715443855"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2015 04:12:24 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 14:12:37 +0300
Message-Id: <10f07103774039de3914e0676c545e18fcd10106.1434971480.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971480.git.cristian.iorga@intel.com>
References: <cover.1434971480.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1434971480.git.cristian.iorga@intel.com>
References: <cover.1434971480.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] bluez5: upgrade to 5.31
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
X-List-Received-Date: Mon, 22 Jun 2015 11:12:24 -0000

Mostly a bug fix release,
with the the following improvements:
- support for handling BNEP setup response;
- support for setting GATT database security flags;
- support for setting discovery filters interface;
- support for user controlled advertising interface.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.30.bb => bluez5_5.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.30.bb => bluez5_5.31.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.30.bb b/meta/recipes-connectivity/bluez5/bluez5_5.31.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.30.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.31.bb
index 0741c98..395c512 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.30.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.31.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "24ba1d1e8e7ef5b8f4033a3059d7600e"
-SRC_URI[sha256sum] = "1e3a4adb5a097dab83b3cf58e09c9541b815c6f33e3da972e18dfd1eb05d382c"
+SRC_URI[md5sum] = "cb1db487b65dd4d57a2dd6b8f063c393"
+SRC_URI[sha256sum] = "c4b661cc5866d9a9a9d608d700392afa278c3b6fe8426238bf6979be7c63818f"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.1.4


