Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA9171A08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:22:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2016 04:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="1071526790"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2016 04:22:24 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 19F816A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:21:42 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:22:47 +0200
Message-Id: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/5] bluez5: upgrade to 5.43
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
X-List-Received-Date: Mon, 21 Nov 2016 12:22:46 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.42.bb => bluez5_5.43.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.42.bb => bluez5_5.43.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.42.bb b/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.42.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.43.bb
index e6ab9b6..e10b82d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.42.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "cc8c53133d5be0d6c126e00cf2529028"
-SRC_URI[sha256sum] = "4f166fed80fc017396d6f2b3cae5185520875ab456d1c74d6b4eaa4da0e16109"
+SRC_URI[md5sum] = "698def88df96840dfbb0858bb6d73350"
+SRC_URI[sha256sum] = "16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


