Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3A4788B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134129"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:46 +0200
Message-Id: <20180301140052.1388-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/15] mpg123: upgrade 1.25.8 -> 1.25.10
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:55 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-multimedia/mpg123/{mpg123_1.25.8.bb => mpg123_1.25.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.8.bb => mpg123_1.25.10.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
index 45f3538d70a..929069ab494 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.8.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "62ef1e417eb50f82bf241866d9e6e19b"
-SRC_URI[sha256sum] = "79da51efae011814491f07c95cb5e46de0476aca7a0bf240ba61cfc27af8499b"
+SRC_URI[md5sum] = "ea32caa61d41d8be797f0b04a1b43ad9"
+SRC_URI[sha256sum] = "6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023"
 
 inherit autotools pkgconfig
 
-- 
2.15.1


