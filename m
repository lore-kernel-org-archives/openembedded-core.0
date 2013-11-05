Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 114AE6D320
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417462"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:11 +0200
Message-Id: <d0228e0dd9924b94c7ea20cd6716c469380b58fc.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/7] python-setuptools: upgrade to 1.1.7
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...uptools_1.1.6.bb => python-setuptools_1.1.7.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_1.1.6.bb => python-setuptools_1.1.7.bb} (86%)

diff --git a/meta/recipes-devtools/python/python-setuptools_1.1.6.bb b/meta/recipes-devtools/python/python-setuptools_1.1.7.bb
similarity index 86%
rename from meta/recipes-devtools/python/python-setuptools_1.1.6.bb
rename to meta/recipes-devtools/python/python-setuptools_1.1.7.bb
index ddaa303..c00738c 100644
--- a/meta/recipes-devtools/python/python-setuptools_1.1.6.bb
+++ b/meta/recipes-devtools/python/python-setuptools_1.1.7.bb
@@ -34,7 +34,7 @@ RDEPENDS_${PN}_class-native = "\
   python-compression \
 "
 
-SRC_URI[md5sum] = "ee82ea53def4480191061997409d2996"
-SRC_URI[sha256sum] = "e5a60b88138def225c29cbf13ee20f1c176f200450e286dcc7d192963a67723a"
+SRC_URI[md5sum] = "1f33594d25d574a1640ffb84667c6759"
+SRC_URI[sha256sum] = "b35e3d7c79cfdb5b38cfc71f4b0deab4350c1176fc4bb05bfa8945504ecfb028"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


