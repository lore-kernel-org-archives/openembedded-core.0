Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 61F12731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851883"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:42 +0200
Message-Id: <0023fd1e809ea8fbe438f94572717c22acbc8d27.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/12] libical: fix upstream version check
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libical/libical_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libical/libical_1.0.1.bb b/meta/recipes-support/libical/libical_1.0.1.bb
index e18b803..838e788 100644
--- a/meta/recipes-support/libical/libical_1.0.1.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
            "
 SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
 SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
+UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake
 
-- 
2.6.4


