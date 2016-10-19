Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E29A71C1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266966"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:49 +0300
Message-Id: <7a7f511732675a7931764334d97561d35ab0b691.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/19] mpg123: update to 1.23.8
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:22 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.23.6.bb => mpg123_1.23.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.6.bb => mpg123_1.23.8.bb} (95%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb
similarity index 95%
rename from meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb
index 6ee457d..f4c5c7c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "ed22a3e664f076fa05131a3454ef8166"
-SRC_URI[sha256sum] = "4073d9c60a43872f6f5a3a322f5ea21ab7f0869d2ed25e79c3eb8521fa3c32d4"
+SRC_URI[md5sum] = "4dde045123a2ad1e385a0a82c0ef9268"
+SRC_URI[sha256sum] = "de2303c8ecb65593e39815c0a2f2f2d91f708c43b85a55fdd1934c82e677cf8e"
 
 inherit autotools pkgconfig
 
-- 
2.9.3


