Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BB99D71BBB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 23 Oct 2016 04:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="22604794"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2016 04:29:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E5E9E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:49 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:53 +0300
Message-Id: <1477222197-3698-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/10] bluez5: Upgrade 5.41 -> 5.42
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:21 -0000

Bug fixes, add support for new management tracing capability
and marking GATT D-Bus APIs as stable interfaces

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.41.bb => bluez5_5.42.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.41.bb => bluez5_5.42.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.41.bb b/meta/recipes-connectivity/bluez5/bluez5_5.42.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.41.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.42.bb
index 522aab7..e6ab9b6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.41.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.42.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "318341b2188698130adb73236ee69244"
-SRC_URI[sha256sum] = "df7dc4462494dad4e60a2943240d584f6e760235dca64f5f10eba46dbab7f5f0"
+SRC_URI[md5sum] = "cc8c53133d5be0d6c126e00cf2529028"
+SRC_URI[sha256sum] = "4f166fed80fc017396d6f2b3cae5185520875ab456d1c74d6b4eaa4da0e16109"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


