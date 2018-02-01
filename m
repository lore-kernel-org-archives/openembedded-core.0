Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 486E9786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465192"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:00 +0200
Message-Id: <20180201180210.21652-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/20] mpg123: update to 1.25.8
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.25.7.bb => mpg123_1.25.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.7.bb => mpg123_1.25.8.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb
index 1d2b875d18f..45f3538d70a 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.7.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "710f2d8689b24e86376bd64a05d7888b"
-SRC_URI[sha256sum] = "31b15ebcf26111b874732e07c8e60de5053ee555eea15fb70c657a4f9f0344f3"
+SRC_URI[md5sum] = "62ef1e417eb50f82bf241866d9e6e19b"
+SRC_URI[sha256sum] = "79da51efae011814491f07c95cb5e46de0476aca7a0bf240ba61cfc27af8499b"
 
 inherit autotools pkgconfig
 
-- 
2.15.1


