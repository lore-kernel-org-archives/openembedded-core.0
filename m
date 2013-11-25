Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B60206DBFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337164"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:11 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:50:57 +0200
Message-Id: <854829da0e09730a8cccb52343847690f334b5d0.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/9] python-setuptools: upgrade to 1.4
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...etuptools_1.1.7.bb => python-setuptools_1.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_1.1.7.bb => python-setuptools_1.4.bb} (86%)

diff --git a/meta/recipes-devtools/python/python-setuptools_1.1.7.bb b/meta/recipes-devtools/python/python-setuptools_1.4.bb
similarity index 86%
rename from meta/recipes-devtools/python/python-setuptools_1.1.7.bb
rename to meta/recipes-devtools/python/python-setuptools_1.4.bb
index c00738c..3cfda56 100644
--- a/meta/recipes-devtools/python/python-setuptools_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-setuptools_1.4.bb
@@ -34,7 +34,7 @@ RDEPENDS_${PN}_class-native = "\
   python-compression \
 "
 
-SRC_URI[md5sum] = "1f33594d25d574a1640ffb84667c6759"
-SRC_URI[sha256sum] = "b35e3d7c79cfdb5b38cfc71f4b0deab4350c1176fc4bb05bfa8945504ecfb028"
+SRC_URI[md5sum] = "5710464bc5a61d75f5087f15ce63cfe0"
+SRC_URI[sha256sum] = "75d288687066ed124311d6ca5f40ffa92a0e81adcd7fff318c6e84082713cf39"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


