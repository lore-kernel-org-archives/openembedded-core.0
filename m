Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 37D3373CD1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 14:13:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Apr 2015 07:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,517,1422950400"; d="scan'208";a="702887933"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2015 07:13:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 17:13:10 +0300
Message-Id: <1c70c6838a3982473669bd6001a6b1496144aaa6.1428070227.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
Subject: [PATCH 1/5] bluez5: upgrade to 5.29
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
X-List-Received-Date: Fri, 03 Apr 2015 14:13:33 -0000

- Large release with over a month and 475 commits since 5.28;
- Internal GATT library received lots of updates;
- Fix for AVCTP key repeat timeout;
- Added support for the Multi Profile Specification (MPS).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.28.bb => bluez5_5.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.28.bb => bluez5_5.29.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.28.bb b/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.28.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.29.bb
index e816998..0fe8e7f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "bc20a8285530758c68f6a60e4ca62a15"
-SRC_URI[sha256sum] = "85bab48f4b47a158739028682c1e09cf30099c8ea9dfe63360055f8e06fc18a9"
+SRC_URI[md5sum] = "aa9dc91689695a486c78c131cd68673e"
+SRC_URI[sha256sum] = "df216a6d5ec6133355e5d4ed6b5e7a188a940940d337374e166758513246f0e4"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.1.0


