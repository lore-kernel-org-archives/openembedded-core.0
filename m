Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD5926E369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:02:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2014 00:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,698,1384329600"; d="scan'208";a="442767925"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2014 01:01:48 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 11:04:23 +0200
Message-Id: <c6a65c104019c5d292bededfb4768fb6001610e1.1390381388.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] libpcap: upgrade to 1.5.3
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
X-List-Received-Date: Wed, 22 Jan 2014 09:02:11 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libpcap/{libpcap_1.5.2.bb => libpcap_1.5.3.bb}                 | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.5.2.bb => libpcap_1.5.3.bb} (77%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb b/meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb
similarity index 77%
rename from meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb
index 37cc141..3ba3caa 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb
@@ -1,13 +1,10 @@
 require libpcap.inc
 
-PR = "${INC_PR}.0"
-
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch \
            "
-
-SRC_URI[md5sum] = "33ba2f10f3a402cb5d34f5e2a904794a"
-SRC_URI[sha256sum] = "806d4ba23b126476d39a458ad1468f73dfe63c92f9586208f7e4e18c13e52ddd"
+SRC_URI[md5sum] = "7e7321fb3aff2f2bb05c8229f3795d4a"
+SRC_URI[sha256sum] = "9ae92159c1060f15e6a90f2c4ad227268b6aaa382c316fa49a31c496b9979e93"
 
 #
 # make install doesn't cover the shared lib
-- 
1.8.3.2


