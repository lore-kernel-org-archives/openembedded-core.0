Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 76ED774E50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="49242149"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2018 04:54:47 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 5F69D5803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:46 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:05 +0300
Message-Id: <1523274911-20401-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/8] bluez5: upgrade to version 5.49
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:47 -0000

Add PACKAGECONFIG for btpclient (BTP client for qualification testing)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc                         | 1 +
 meta/recipes-connectivity/bluez5/{bluez5_5.48.bb => bluez5_5.49.bb} | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.48.bb => bluez5_5.49.bb} (87%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ae2a833..c0b6571 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -42,6 +42,7 @@ PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
+PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.48.bb b/meta/recipes-connectivity/bluez5/bluez5_5.49.bb
similarity index 87%
rename from meta/recipes-connectivity/bluez5/bluez5_5.48.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.49.bb
index 84a6cd2..b79bda2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.48.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.49.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "c9c853f3c90564cabec75ab35106c355"
-SRC_URI[sha256sum] = "b9a8723072ef66bae7ec301c774902ebcb444c9c5b149b5a199e60a1ba970e90"
+SRC_URI[md5sum] = "f210e84db707d66af3b889084a6f8bef"
+SRC_URI[sha256sum] = "33301d7a514c73d535ee1f91c2aed1af1f2e53efe11d3ac06bcf0d7abed2ce95"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
@@ -66,4 +66,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
 "
-- 
2.4.0


