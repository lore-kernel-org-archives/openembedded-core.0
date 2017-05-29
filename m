Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CE63577BE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:27:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 29 May 2017 07:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,414,1491289200"; d="scan'208";a="108336694"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 29 May 2017 07:27:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BB0185803B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 07:27:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:27:43 +0300
Message-Id: <1496068063-34177-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1496068063-34177-1-git-send-email-maxin.john@intel.com>
References: <1496068063-34177-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] bluez5: Upgrade 5.44 -> 5.45
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
X-List-Received-Date: Mon, 29 May 2017 14:27:45 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.44.bb => bluez5_5.45.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.44.bb => bluez5_5.45.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.44.bb b/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.44.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.45.bb
index 1095f88..ee5e88f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "94273617129ced06612fcb9f5273d14c"
-SRC_URI[sha256sum] = "0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85"
+SRC_URI[md5sum] = "20d936917afc7e1ffa091f5213081c55"
+SRC_URI[sha256sum] = "4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


