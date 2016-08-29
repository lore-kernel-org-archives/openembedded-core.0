Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 83C3873191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688743"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:18 +0300
Message-Id: <02c110b33ac689aba599c5f7ab726ac633c69d80.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/15] mpg123: update to 1.23.6
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.23.5.bb => mpg123_1.23.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.5.bb => mpg123_1.23.6.bb} (95%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb
similarity index 95%
rename from meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb
index dd510c0..6ee457d 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.23.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.23.6.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "6a318579dd7b52c5851bb7950af969ac"
-SRC_URI[sha256sum] = "b658df672813511ff9b68a1553917220b675067204cdb58dbb59a2b8179350b2"
+SRC_URI[md5sum] = "ed22a3e664f076fa05131a3454ef8166"
+SRC_URI[sha256sum] = "4073d9c60a43872f6f5a3a322f5ea21ab7f0869d2ed25e79c3eb8521fa3c32d4"
 
 inherit autotools pkgconfig
 
-- 
2.9.3


