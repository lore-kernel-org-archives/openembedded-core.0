Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C54A06E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 11:16:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2014 03:17:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,667,1384329600"; d="scan'208";a="466056791"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2014 03:17:00 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:16:55 +0200
Message-Id: <28aeaccf147ef3ac98fb4bfce011edf05b97d634.1389870944.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389870944.git.laurentiu.palcu@intel.com>
References: <cover.1389870944.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1389870944.git.laurentiu.palcu@intel.com>
References: <cover.1389870944.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] allarch.bbclass: set SDK_ARCH and SDK_CC_ARCH to "none"
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
X-List-Received-Date: Thu, 16 Jan 2014 11:17:00 -0000

allarch packages shouldn't use these variables.

[YOCTO #5396]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/allarch.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 5e13a5b..3ef1e9c 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -23,6 +23,8 @@ python () {
         d.setVar("TARGET_LD_ARCH", "none")
         d.setVar("TARGET_AS_ARCH", "none")
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
+        d.setVar("SDK_ARCH", "none")
+        d.setVar("SDK_CC_ARCH", "none")
 
         # No need to do shared library processing or debug symbol handling
         d.setVar("EXCLUDE_FROM_SHLIBS", "1")
-- 
1.7.9.5


