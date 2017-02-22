Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E3A1B731CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302255"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:17 +0200
Message-Id: <df05608de18b66cdf5afa7d2e609583e35fcf4eb.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/24] libwebp: update to 0.6.0
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/{libwebp_0.5.1.bb => libwebp_0.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_0.5.1.bb => libwebp_0.6.0.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb b/meta/recipes-multimedia/webp/libwebp_0.6.0.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_0.5.1.bb
rename to meta/recipes-multimedia/webp/libwebp_0.6.0.bb
index b882db75b64..bc565e90196 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.6.0.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "3d7db92ebba5b4f679413d25c6040881"
-SRC_URI[sha256sum] = "6ad66c6fcd60a023de20b6856b03da8c7d347269d76b1fd9c3287e8b5e8813df"
+SRC_URI[md5sum] = "19a6e926ab1721268df03161b84bb4a0"
+SRC_URI[sha256sum] = "c928119229d4f8f35e20113ffb61f281eda267634a8dc2285af4b0ee27cf2b40"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.11.0


