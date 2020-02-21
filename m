Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92F3C606AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:01:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:01:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067235"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:01:51 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:16 +0800
Message-Id: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/13] bluez5: upgrade 5.52 -> 5.53
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
X-List-Received-Date: Fri, 21 Feb 2020 02:01:51 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.52.bb => bluez5_5.53.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.52.bb => bluez5_5.53.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.52.bb b/meta/recipes-connectivity/bluez5/bluez5_5.53.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.52.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.53.bb
index b861030..055e76b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.52.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.53.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "a33eb9aadf1dd4153420958709d3ce60"
-SRC_URI[sha256sum] = "f7144ce2039202cfac18ccb52426efea11c98e4f6e1bb8041bcb994b8378560a"
+SRC_URI[md5sum] = "85b14abb138948f50b1650aa866cb019"
+SRC_URI[sha256sum] = "38aa2da8302fefad53116bb281a11968732a42eeb19c5fb3668342f39b7938bc"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.7.4


