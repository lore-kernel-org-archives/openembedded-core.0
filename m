Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 916B2731BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464804"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:56 +0200
Message-Id: <6b553288c904357bfafee6874b8361c0eff08189.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] libwebp: update to 0.4.4
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
X-List-Received-Date: Fri, 18 Dec 2015 15:43:43 -0000

PATENTS file had a few rewordings:
https://github.com/webmproject/libwebp/commits/master/PATENTS

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/{libwebp_0.4.3.bb => libwebp_0.4.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_0.4.3.bb => libwebp_0.4.4.bb} (89%)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb b/meta/recipes-multimedia/webp/libwebp_0.4.4.bb
similarity index 89%
rename from meta/recipes-multimedia/webp/libwebp_0.4.3.bb
rename to meta/recipes-multimedia/webp/libwebp_0.4.4.bb
index 1285bc1..ce317d2 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.4.4.bb
@@ -11,11 +11,11 @@ SECTION = "libs"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
-                    file://PATENTS;md5=ad2580aee35468675c44d7bebba65ca8"
+                    file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "08813525eeeffe7e305b4cbfade8ae9b"
-SRC_URI[sha256sum] = "efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4"
+SRC_URI[md5sum] = "b737062cf688e502b940b460ddc3015f"
+SRC_URI[sha256sum] = "c65d34edb57338e331ba4d622227a2b3179444cfca17d02c34f1ead63f603e86"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.6.2


