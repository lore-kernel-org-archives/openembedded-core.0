Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3012B782DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:32:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198787306"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:32:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:15 +0300
Message-Id: <20170724142818.44403-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/11] mpg123: update to 1.25.4
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
X-List-Received-Date: Mon, 24 Jul 2017 14:32:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.25.0.bb => mpg123_1.25.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.0.bb => mpg123_1.25.4.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb
index f86098ce20b..96e8f21b754 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "2ffbe29c99130215b0ee7d1b11c0ea4b"
-SRC_URI[sha256sum] = "552e3e1db045e00f474252917007795ac295863fc8b13891859b3382d2f24e48"
+SRC_URI[md5sum] = "810e9d00fd75c92c4afafa20245317b5"
+SRC_URI[sha256sum] = "cdb5620e8aab83f75a27dab3394a44b9cc4017fc77b2954b8425ca416db6b3e7"
 
 inherit autotools pkgconfig
 
-- 
2.13.2


