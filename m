Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 65C7D7325A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851847"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:39 +0200
Message-Id: <ac48382b4696a3965271ae58f6666849ad7b860e.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/12] pbzip2: update to 1.1.13
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/pbzip2/{pbzip2_1.1.12.bb => pbzip2_1.1.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/pbzip2/{pbzip2_1.1.12.bb => pbzip2_1.1.13.bb} (86%)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
similarity index 86%
rename from meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
rename to meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index b3f2920..b3c5975 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -13,8 +13,8 @@ DEPENDS_append_class-native = " bzip2-replacement-native"
 
 SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "91a4911b13305850423840eb0fa6f4f9"
-SRC_URI[sha256sum] = "573bb358a5a7d3bf5f42f881af324cedf960c786e8d66dd03d448ddd8a0166ee"
+SRC_URI[md5sum] = "4cb87da2dba05540afce162f34b3a9a6"
+SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"
 
 UPSTREAM_CHECK_URI = "http://compression.ca/pbzip2/"
 
-- 
2.6.4


