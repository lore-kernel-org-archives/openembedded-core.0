Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C3D5960110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877465"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:24 +0200
Message-Id: <c8cfbae50e23ca6cbcbf9413ba96a02060604c27.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/5] libwebp: upgrade to 0.5.0
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/{libwebp_0.4.4.bb => libwebp_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_0.4.4.bb => libwebp_0.5.0.bb} (92%)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.4.4.bb b/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
similarity index 92%
rename from meta/recipes-multimedia/webp/libwebp_0.4.4.bb
rename to meta/recipes-multimedia/webp/libwebp_0.5.0.bb
index ce317d2..c89adac 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.4.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "b737062cf688e502b940b460ddc3015f"
-SRC_URI[sha256sum] = "c65d34edb57338e331ba4d622227a2b3179444cfca17d02c34f1ead63f603e86"
+SRC_URI[md5sum] = "ba81eb9bf23e3c69a2f5cc8dcdb5938f"
+SRC_URI[sha256sum] = "5cd3bb7b623aff1f4e70bd611dc8dbabbf7688fd5eb225b32e02e09e37dfb274"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.6.4


