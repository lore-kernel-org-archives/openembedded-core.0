Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F2D136072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 17:54:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 10 Nov 2016 09:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,619,1473145200"; d="scan'208";a="900056071"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga003.jf.intel.com with ESMTP; 10 Nov 2016 09:54:02 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 11:55:19 -0600
Message-Id: <20161110175519.6823-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] swig: upgrade to 3.0.10
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
X-List-Received-Date: Thu, 10 Nov 2016 17:54:03 -0000


Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>

---
 meta/recipes-devtools/swig/{swig_3.0.8.bb => swig_3.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.8.bb => swig_3.0.10.bb} (58%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.8.bb b/meta/recipes-devtools/swig/swig_3.0.10.bb
similarity index 58%
rename from meta/recipes-devtools/swig/swig_3.0.8.bb
rename to meta/recipes-devtools/swig/swig_3.0.10.bb
index c1b820e..44c26c4 100644
--- a/meta/recipes-devtools/swig/swig_3.0.8.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.10.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
-SRC_URI[md5sum] = "c96a1d5ecb13d38604d7e92148c73c97"
-SRC_URI[sha256sum] = "58a475dbbd4a4d7075e5fe86d4e54c9edde39847cdb96a3053d87cb64a23a453"
+SRC_URI[md5sum] = "bb4ab8047159469add7d00910e203124"
+SRC_URI[sha256sum] = "2939aae39dec06095462f1b95ce1c958ac80d07b926e48871046d17c0094f44c"
 
-- 
1.9.1


