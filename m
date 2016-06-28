Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C6F1C7001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745539"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:18 +0300
Message-Id: <1467101180-23116-8-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/10] mpg123: update to 1.23.5
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.23.4.bb => mpg123_1.23.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.4.bb => mpg123_1.23.5.bb} (95%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb
similarity index 95%
rename from meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb
index 3101023..dd510c0 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "dea9e3a815d127d04ebe9f6b80f229ce"
-SRC_URI[sha256sum] = "3495e678dec9a60f29cbcd4fc698abc4c811ec60d1276e744f7a10ac35023b48"
+SRC_URI[md5sum] = "6a318579dd7b52c5851bb7950af969ac"
+SRC_URI[sha256sum] = "b658df672813511ff9b68a1553917220b675067204cdb58dbb59a2b8179350b2"
 
 inherit autotools pkgconfig
 
-- 
2.8.1


