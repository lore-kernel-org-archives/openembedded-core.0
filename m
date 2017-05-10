Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BB8D571AC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:25 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649684"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:21 +0300
Message-Id: <20170510093529.6651-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/11] mpg123: update to 1.24.0
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
X-List-Received-Date: Wed, 10 May 2017 09:35:26 -0000

--with-module-suffix has been removed upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-multimedia/mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.8.bb => mpg123_1.24.0.bb} (93%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb b/meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb
similarity index 93%
rename from meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb
index e0a70380ea7..587327b9ef0 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "4dde045123a2ad1e385a0a82c0ef9268"
-SRC_URI[sha256sum] = "de2303c8ecb65593e39815c0a2f2f2d91f708c43b85a55fdd1934c82e677cf8e"
+SRC_URI[md5sum] = "75d62ac0cb713a7bac5af4ded4af2bb4"
+SRC_URI[sha256sum] = "55fb169a7711938f5df0497d1ffe28419fbef50011dc01d00b216379e6a2256c"
 
 inherit autotools pkgconfig
 
@@ -39,7 +39,6 @@ AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d
 EXTRA_OECONF = " \
     --enable-shared \
     --with-audio='${AUDIOMODS}' \
-    --with-module-suffix=.so \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
-- 
2.11.0


