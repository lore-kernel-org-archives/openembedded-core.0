Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3D09C71999
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945761"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:06 +0300
Message-Id: <e7f0f764f8664c2147fa756bc4ba322163c1e1c3.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/50] mpg123: update to 1.25.7
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.25.6.bb => mpg123_1.25.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.6.bb => mpg123_1.25.7.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb
index cb86199fe5c..1d2b875d18f 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "43336bef78f67c2e66c4f6c288ca1eb3"
-SRC_URI[sha256sum] = "0f0458c9b87799bc2c9bf9455279cc4d305e245db43b51a39ef27afe025c5a8e"
+SRC_URI[md5sum] = "710f2d8689b24e86376bd64a05d7888b"
+SRC_URI[sha256sum] = "31b15ebcf26111b874732e07c8e60de5053ee555eea15fb70c657a4f9f0344f3"
 
 inherit autotools pkgconfig
 
-- 
2.14.1


